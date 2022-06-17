<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>

<c:if test="${u.id==null}">
    <c:set var="uri" scope="session" value="/user/add"></c:set>
</c:if>
<c:if test="${u.id!=null}">
    <c:set var="uri" scope="session" value="/user/update?id=${u.id}"></c:set>
</c:if>
<div class="container-fluid">
    <%--@elvariable id="user" type="lombok"--%>
    <div class="main-card mb-3 card">
        <div class="card-body">
            <form:form action="${uri}" method="post" modelAttribute="user" enctype="multipart/form-data">
            <div class="form-group mt-4">
                <form:label class="card-title" path="name">Name</form:label>
                <form:input name="name" path="name" type="tex" class="form-control" value="${u.name}"/>

                <form:label class="card-title pt-2" path="email">Email</form:label>
                <form:input name="email" path="email" type="tex" class="form-control" disabled="${u.id!=null?'true':'false'}"
                            value="${u.email}"/>
                <c:if test="${u.id==null}">
                    <form:label class="card-title pt-2" path="password">Password</form:label>
                    <form:input name="password" type="password" path="password" class="form-control"/>
                </c:if>
                <form:label class="card-title pt-2" path="phone">Phone</form:label>
                <form:input name="phone" path="phone" type="tex" class="form-control" value="${u.phone}"/>

                <form:label class="card-title pt-2" path="birthday">Birthday</form:label>
                <form:input path="birthday" type="date" class="form-control"
                            value="${u.birthday}"/>
                <div>
                    <c:if test="${u.id!=null}">
                        <form:label class="card-title pt-3" path="sex">Sex: </form:label>
                        <form:radiobutton path="sex" style="width: 1%" checked="${u.sex==0?'checked':''}" name="sex"
                                          value="0"/>
                        <label>Nam</label>
                        <form:radiobutton path="sex" style="width: 1%" checked="${u.sex==1?'checked':''}" name="sex"
                                          value="1"/>
                        <label>Nữ</label>
                    </c:if>
                    <c:if test="${u.id==null}">
                        <form:label class="card-title pt-3" path="sex">Sex: </form:label>
                        <form:radiobutton path="sex" style="width: 1%" checked="checked" name="sex" value="0"/>
                        <label>Nam</label>
                        <form:radiobutton path="sex" style="width: 1%" name="sex" value="1"/>
                        <label>Nữ</label>
                    </c:if>

                </div>

                <form:label class="card-title pt-1" path="address">Address</form:label>
                <form:input path="address" type="tex" name="address" class="form-control" value="${u.address}"/>
                <c:if test="${u.id!=null}">
                    <form:label class="card-title pt-3" path="isAdmin">IsAdmin: </form:label>
                    <form:radiobutton path="isAdmin" style="width: 1%" checked="${u.isAdmin==0?'checked':''}"
                                      name="isAdmin"
                                      value="0"/>
                    <label>Admin</label>
                    <form:radiobutton path="isAdmin" style="width: 1%" checked="${u.isAdmin==1?'checked':''}"
                                      name="isAdmin"
                                      value="1"/>
                    <label>Nhân Viên</label>
                    <form:radiobutton path="isAdmin" style="width: 1%" checked="${u.isAdmin==2?'checked':''}"
                                      name="isAdmin"
                                      value="2"/>
                    <label>Khách Hàng</label>
                </c:if>
                <c:if test="${u.id==null}">
                    <form:label class="card-title pt-3" path="isAdmin">IsAdmin: </form:label>
                    <form:radiobutton path="isAdmin" style="width: 1%" checked="checked" name="isAdmin"
                                      value="0"/>
                    <label>Admin</label>
                    <form:radiobutton path="isAdmin" style="width: 1%" name="isAdmin"
                                      value="1"/>
                    <label>Nhân Viên</label>
                    <form:radiobutton path="isAdmin" style="width: 1%" name="isAdmin"
                                      value="2"/>
                    <label>Khách Hàng</label>
                </c:if>
                <br>
                <form:label class="card-title pt-1" path="image">Image</form:label>
                <input name="img" type="file" class="form-control-file"/>
                <br>
                <c:if test="${u.id==null}">
                    <button class="btn btn-success mt-2">Create</button>
                    <button type="reset" class="btn btn-primary mt-2">Clear</button>
                </c:if>
                <c:if test="${u.id!=null}">
                    <button class="btn btn-success mt-2 block-page-btn-example-3">Update</button>
                    <a href="/user/index" class="btn btn-primary mt-2">Add New User</a>
                </c:if>
            </div>
            </form:form>
        </div>
    </div>
    <form action="/user/search" method="get" class="row g-3 mb-3 mt-2">
        <div class="col-10">
            <input type="tex" name="search" class="form-control" placeholder="Search name">
            <input name="searchType" value="null" hidden>
        </div>
        <div class="col-2">
            <button type="submit" class="btn btn-primary">Tìm Kiếm</button>
        </div>
    </form>
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
                        <h2>Manage <b>User</b></h2>
                    </div>
                    <div class="col-sm-6">
                        <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i
                                class="material-icons">&#xE147;</i> <span>Add New User</span></a>
                        <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i
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
                    <th>Phone</th>
                    <th>Image</th>
                    <th style="width: 10%">Birthday</th>
                    <th>Address</th>
                    <th>Sex</th>
                    <th>Email</th>
                    <th>IsAdmin</th>
                    <th colspan="2"></th>
                </tr>
                </thead>
                <tbody>
                <form action="/user/delete?id=0" method="post" id="deleteAll">
                    <c:forEach items="${list.content}" var="u" varStatus="status">
                        <tr>
                            <td>
							<span class="custom-checkbox">
								<%--@declare id="checkbox1"--%>
                                <input type="checkbox" name="options" value="${u.id}">
								<label for="checkbox1"></label>
							</span>
                            </td>
                            <td>${u.name}</td>
                            <td>${u.phone}</td>
                            <td>
                                <c:if test="${u.image ==null}">
                                    <img width="42" height="42" class="rounded-circle"
                                         src="../assets/images/avatars/13.jpg" alt="">
                                </c:if>
                                <c:if test="${u.image !=null}">
                                    <img width="42" height="42" class="rounded-circle"
                                         src="/getimage/${u.image}" alt="">
                                </c:if>
                            </td>
                            <td><fmt:formatDate value="${u.birthday}" pattern="yyyy-MM-dd"/></td>
                            <td>${u.address}</td>
                            <td>${u.sex==0?"Nam":"Nữ"}</td>
                            <td>${u.email}</td>
                            <c:if test="${u.isAdmin ==0}">
                                <td>Admin</td>
                            </c:if>
                            <c:if test="${u.isAdmin ==1}">
                                <td>Nhân Viên</td>
                            </c:if>
                            <c:if test="${u.isAdmin ==2}">
                                <td>Khách Hàng</td>
                            </c:if>
                            <td>
                                <a href="/user/edit?id=${u.id}" class="edit"><i
                                        class="material-icons"
                                        data-toggle="tooltip"
                                        title="Edit">&#xE254;</i></a>
                            </td>
                            <td>
                                <a href="#deleteEmployeeModal${u.id}" class="delete" data-toggle="modal"><i
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
                <div class="hint-text">Showing <b>${list.numberOfElements}</b> out of <b>${list.totalElements}</b>
                    entries
                </div>
                <ul class="pagination">
                    <li class="page-item"><a href="/user/index" class="page-link">First</a></li>
                    <li class="page-item"><a href="/user/index?page=${list.number -1}">Previous</a></li>
                    <li class="page-item"><a href="/user/index?page=${list.number +1}" class="page-link">Next</a>
                    </li>
                    <li class="page-item"><a href="/user/index?page=${list.totalPages -1}"
                                             class="page-link">Last</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function handleSelect(elm) {
        window.location = "/user/search?search=" + elm.value;
    }
</script>