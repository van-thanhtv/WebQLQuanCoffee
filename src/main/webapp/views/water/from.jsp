<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<div class="container-xl">
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
                        <h2>Manage <b>Water</b></h2>
                    </div>
                    <div class="col-sm-6">
                        <a href="#addWaterModal" class="btn btn-success" data-toggle="modal"><i
                                class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                        <a href="#deleteWaterModalAll" class="btn btn-danger" data-toggle="modal"><i
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
                    <th>Name Water</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Type</th>
                    <th>Size</th>
                    <th style="width: 10%">Create Date</th>
                    <th colspan="2"></th>
                </tr>
                </thead>
                <tbody>
                <form action="/water/delete?id=0" method="post" id="deleteAll">
                    <c:forEach items="${list.content}" var="pro" varStatus="status">
                        <tr>
                            <td>
							<span class="custom-checkbox">
								<%--@declare id="checkbox1"--%>
                                <input type="checkbox" name="options" value="${pro.id}">
								<label for="checkbox1"></label>
							</span>
                            </td>
                            <td>${pro.idType.nameType} ${pro.name}</td>
                            <td>${df.format(pro.price)} VNĐ</td>
                            <td>
                                <img width="100" height="100" class="rounded-circle"
                                     src="/getimage/${pro.image}" alt="">
                            </td>
                            <td>${pro.idType.nameType}</td>
                            <td>${pro.idSize.nameSize}</td>
                            <td><fmt:formatDate value="${pro.createDate}" pattern="dd-MM-yyyy"/></td>
                            <td>
                                <a href="#editWaterModal${pro.id}" class="edit" data-toggle="modal"><i
                                        class="material-icons"
                                        data-toggle="tooltip"
                                        title="Edit">&#xE254;</i></a>
                            </td>
                            <td>
                                <a href="#deleteWaterModal${pro.id}" class="delete" data-toggle="modal"><i
                                        class="material-icons"
                                        data-toggle="tooltip"
                                        title="Delete">&#xE872;</i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </form>
                </tbody>
            </table>
            <div class="clearfix">
                <div class="hint-text">Showing <b>${list.numberOfElements}</b> out of <b>${list.totalElements}</b> entries</div>
                <ul class="pagination">
                    <li class="page-item"><a href="/product/index" class="page-link">First</a></li>
                    <li class="page-item"><a href="/product/index?page=${list.number -1}">Previous</a></li>
                    <li class="page-item"><a href="/product/index?page=${list.number +1}" class="page-link">Next</a></li>
                    <li class="page-item"><a href="/product/index?page=${list.totalPages -1}" class="page-link">Last</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>