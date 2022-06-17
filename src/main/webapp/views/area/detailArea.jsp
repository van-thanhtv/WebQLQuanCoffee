<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>

<c:if test="${a.id==null}">
    <c:set var="uri" scope="session" value="/table/add"></c:set>
</c:if>
<c:if test="${a.id!=null}">
    <c:set var="uri" scope="session" value="/table/update?id=${u.id}"></c:set>
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
                        <h2>Manage <b>Area ${area.name}</b></h2>
                    </div>
                    <div class="col-sm-6">
                        <a href="#addTableModal" class="btn btn-success" data-toggle="modal"><i
                                class="material-icons">&#xE147;</i> <span>Add New Table</span></a>
                        <a href="#deleteTableModalAll" class="btn btn-danger" data-toggle="modal"><i
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
                    <th>Name Area</th>
                    <th>Location</th>
                    <th>Status</th>
                    <th colspan="2"></th>
                </tr>
                </thead>
                <tbody>
                <form action="/table/delete?id=0" method="post" id="deleteAll">
                    <c:forEach items="${list.content}" var="a" varStatus="status">
                        <tr>
                            <td>
							<span class="custom-checkbox">
								<%--@declare id="checkbox1"--%>
                                <input type="checkbox" name="options" value="${a.id}">
								<label for="checkbox1"></label>
							</span>
                            </td>
                            <td>${area.name}</td>
                            <td>${a.location}</td>
                            <td>${a.status==0?"Đang Hoạt Động":"Không Hoạt Động"}</td>
                            <td>
                                <a href="#updateTableModal${a.id}" class="edit" data-toggle="modal"><i
                                        class="material-icons"
                                        data-toggle="tooltip"
                                        title="Edit">&#xE254;</i></a>
                            </td>
                            <td>
                                <c:if test="${a.status==0}">
                                    <a href="#deleteTableModal${a.id}" class="delete" data-toggle="modal"><i
                                            class="material-icons"
                                            data-toggle="tooltip"
                                            title="Delete">&#xE872;</i></a>
                                </c:if>
                                <c:if test="${a.status==1}">
                                    <a href="#restoreTableModal${a.id}" class="detail" data-toggle="modal"><i
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
                <div class="hint-text">Showing <b>${list.numberOfElements}</b> out of <b>${list.totalElements}</b>
                    entries
                </div>
                <ul class="pagination">
                    <li class="page-item"><a href="/table/index" class="page-link">First</a></li>
                    <li class="page-item"><a href="/table/index?page=${list.number -1}">Previous</a></li>
                    <li class="page-item"><a href="/table/index?page=${list.number +1}" class="page-link">Next</a>
                    </li>
                    <li class="page-item"><a href="/table/index?page=${list.totalPages -1}"
                                             class="page-link">Last</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>