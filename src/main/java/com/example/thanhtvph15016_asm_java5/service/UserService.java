package com.example.thanhtvph15016_asm_java5.service;

import com.example.thanhtvph15016_asm_java5.daoimpl.UserImpl;
import com.example.thanhtvph15016_asm_java5.entity.User;
import com.example.thanhtvph15016_asm_java5.reposotory.IUserRepository;
import org.hibernate.search.jpa.FullTextEntityManager;
import org.hibernate.search.jpa.Search;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;
import java.util.Optional;

@Component
public class UserService implements UserImpl {
    @Autowired
    private IUserRepository repository;

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<User> getAll() {
        return this.repository.findAll();
    }

    @Override
    public User insert(User user) {
        user.setId(null);
        return this.repository.save(user);
    }

    @Override
    public User update(User user) {
        Integer id = user.getId();
        if (id != null) {
            Optional<User> p = repository.findById(id);
            if (p.isPresent()) {
                return repository.save(user);
            }
        }
        return null;
    }

    @Override
    public User delete(Integer id) {
        if (id != null) {
            Optional<User> p = repository.findById(id);
            if (p.isPresent()) {
                repository.deleteById(id);
                return p.get();
            }
        }
        return null;
    }

    @Override
    public User findById(Integer id) {
        return repository.findById(id).get();
    }

    @Override
    public User findByEmail(String email) {
        return this.repository.findByEmail(email);
    }

    @Override
    public Page<User> getAllPage(Pageable pageable) {
        return repository.getAllPage(pageable);
    }

    @Override
    public List<User> search(String terms, int limit, int offset) {
        try {
            FullTextEntityManager fullTextEntityManager = Search.getFullTextEntityManager(em);
            QueryBuilder queryBuilder = fullTextEntityManager.getSearchFactory()
                    .buildQueryBuilder().forEntity(User.class).get();
            org.apache.lucene.search.Query luceneQuery = queryBuilder
                    .keyword()
                    .onFields("name", "address","phone")
                    .matching(terms)
                    .createQuery();

            // wrap Lucene query in a javax.persistence.Query
            javax.persistence.Query jpaQuery =
                    fullTextEntityManager.createFullTextQuery(luceneQuery, User.class);

            jpaQuery.setMaxResults(limit);
            jpaQuery.setFirstResult(offset);
            return jpaQuery.getResultList();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
