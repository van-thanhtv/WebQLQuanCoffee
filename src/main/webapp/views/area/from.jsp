<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>

<c:if test="${a.id==null}">
    <c:set var="uri" scope="session" value="/area/add"></c:set>
</c:if>
<c:if test="${a.id!=null}">
    <c:set var="uri" scope="session" value="/area/update?id=${u.id}"></c:set>
</c:if>
<div class="container-fluid">

    <c:if test="${!empty sessionScope.message }">
        <div class="alert alert-success mt-3">
                ${ sessionScope.message }
            <c:remove var="message" scope="session"/>
        </div>
    </c:if>
    <c:if test="${!empty sessionScope.error }">
        <div class="alert alert-danger mt-3">
                ${ sessionScope.error }
            <c:remove var="error" scope="session"/>
        </div>
    </c:if>

    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Manage <b>Area</b></h2>
                    </div>
                    <div class="col-sm-6">
                        <a href="#addAreaModal" class="btn btn-success" data-toggle="modal"><i
                                class="material-icons">&#xE147;</i> <span>Add New Area</span></a>
                        <a href="#deleteAreaModalAll" class="btn btn-danger" data-toggle="modal"><i
                                class="material-icons">&#xE15C;</i> <span>Delete</span></a>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>
							<span class="custom-checkbox">
								<input type="checkbox" id="selectAll">
								<label for="selectAll"></label>
							</span>
                    </th>
                    <th>Name</th>
                    <th>Max Table</th>
                    <th>Amount Table</th>
                    <th>Status</th>
                    <th colspan="3"></th>
                </tr>
                </thead>
                <tbody>
                <form action="/area/delete?id=0" method="post" id="deleteAll">
                    <c:forEach items="${list.content}" var="a" varStatus="status">
                        <tr>
                            <td>
							<span class="custom-checkbox">
								<%--@declare id="checkbox1"--%>
                                <input type="checkbox" name="options" value="${a.id}">
								<label for="checkbox1"></label>
							</span>
                            </td>
                            <td>${a.name}</td>
                            <td>${a.maxTable}</td>
                            <td>${a.listTable.size()}</td>
                            <td>${a.status==0?"Đang Hoạt Động":"Không Hoạt Động"}</td>
                            <td>
                                <a href="/table/index?id=${a.id}" class="detail"><i
                                        class="material-icons"
                                        data-toggle="tooltip"
                                        title="Detail">&#xE267;</i></a>
                            </td>
                            <td>
                                <a href="#updateAreaModal${a.id}" class="edit" data-toggle="modal"><i
                                        class="material-icons"
                                        data-toggle="tooltip"
                                        title="Edit">&#xE254;</i></a>
                            </td>
                            <td>
                                <c:if test="${a.status==0}">
                                    <a href="#deleteAreaModal${a.id}" class="delete" data-toggle="modal"><i
                                            class="material-icons"
                                            data-toggle="tooltip"
                                            title="Delete">&#xE872;</i></a>
                                </c:if>
                                <c:if test="${a.status==1}">
                                    <a href="#restoreAreaModal${a.id}" class="detail" data-toggle="modal"><i
                                            class="material-icons"
                                            data-toggle="tooltip"
                                            title="Restore">&#xE889;</i></a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>

                </form>
                </tbody>
            </table>
            <div class="clearfix">
                <div class="">
                    <div class="w-100 text-center text-danger">${list.getNumber()+1}/${list.getTotalPages()}</div>

                    <div class="">
                        <div class="">Showing <b>${list.numberOfElements}</b> out of <b>${list.totalElements}</b>
                            entries
                        </div>
                    </div>
                </div>

                <c:if test="${list.number-1>0}">
                    <c:set var="number" scope="session" value="?page=${list.number -1}"></c:set>
                </c:if>
                <c:if test="${list.number-1<1}">
                    <c:set var="number" scope="session" value=""></c:set>
                </c:if>
                <c:if test="${list.number+1>list.totalPages}">
                    <c:set var="numberup" scope="session" value="?page=${list.totalPages}"></c:set>
                </c:if>
                <c:if test="${list.number+1<list.totalPages}">
                    <c:set var="numberup" scope="session" value="?page=${list.number+1}"></c:set>
                </c:if>

                <nav class="pagination1-rounded pagination1 justify-content-end" aria-label="Page navigation example">
                    <ul class="pagination1">
                        <li class="page-item ${list.getNumber()==0?'disabled':''}">
                            <a class="page-link" href="/area/index${number}" aria-label="Previous">
                                <span aria-hidden="true">«</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                        <c:forEach var="i" begin="0" end="${ list.totalPages - 1 }">
                        <li class="page-item"><a class="page-link" href="/area/index?page=${ i }">${ i + 1 }</a>
                        </li>
                        </c:forEach>
                        <li class="page-item ${list.getNumber()==list.getTotalPages()-1?'disabled':''}">
                            <a href="/area/index${numberup}" class="page-link" aria-label="Next">
                                <span aria-hidden="true">»</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                </nav>
            </div>
        </div>
    </div>
</div>