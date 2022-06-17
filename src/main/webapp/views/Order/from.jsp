<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>

<c:if test="${o.id==null}">
    <c:set var="uri" scope="session" value="/order/add"></c:set>
</c:if>
<c:if test="${o.id!=null}">
    <c:set var="uri" scope="session" value="/order/update?id=${u.id}"></c:set>
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
    <div class="row">
        <div class="col-lg-6">
            <h1 class="text-info text-center">list Table</h1>
            <div class="mb-4">
                <label class="card-title">Arge</label>
                <select id="inputState" class="form-select" onchange="javascript:handleSelect(this)" name="idArge">
                    <c:forEach var="arge" items="${listArge}">
                        <option ${arge.id==idCu ? "selected":""} value="${arge.id}">${arge.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div style="height: 500px;overflow-x:hidden;
            overflow-y:auto;">
                <div class="main-card mb-3 card">
                    <div class="card-body row">
                        <c:forEach var="table" items="${listTable}">
                            <div class="dropdown col-3 mb-3">
                                <button style="width: 110%;" class="btn-wide mb-2 mr-2 btn btn-shadow btn-lg ${table.isActivity==1?'btn-danger':''} ${table.isActivity==0?'btn-primary':''}" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                    <c:if test="${table.isActivity==1}">
                                        <c:forEach var="o" items="${listOder}">
                                            <c:if test="${table.id==o.getOrderDetailList().get(0).getIdTable().id}">
                                                <i class="fa-xs text-dark">
                                                        ${localDateTimeFormat.format(o.getDateOrder())}
                                                </i><br>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${table.isActivity==0}">
                                        <i class="text-center fa-xs text-dark">Bàn Trống</i><br>
                                    </c:if>
                                    <i>Bàn ${table.location}</i>
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                    <c:if test="${table.isActivity==0}">
                                        <li><a class="dropdown-item" href="/order/inToTable?idTable=${table.id}">Vào Bàn</a></li>
                                        <li><a class="dropdown-item" href="#">Thêm bàn vào nhóm</a></li>
                                        <li><a class="dropdown-item" href="#moveTableModal${table.id}" data-toggle="modal">Chuyển Bàn</a></li>
                                    </c:if>
                                    <c:if test="${table.isActivity==1}">
                                        <li><a class="dropdown-item" href="/order/inToTable?idTable=${table.id}">Chi tiết</a></li>
                                        <li><a class="dropdown-item" href="#mergetableModal${table.id}" data-toggle="modal">Gộp Bàn</a></li>
                                        <li><a class="dropdown-item" href="#">Tạo nhóm</a></li>
                                    </c:if>
                                    <li><a class="dropdown-item" href="/order/history?idTable=${table.id}">Lịch sử Order</a></li>
                                </ul>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <h1 class="text-info text-center">list Water</h1>
            <div class="mb-4">
                <label class="card-title">Type</label>
                <select id="inputState1" class="form-select" onchange="javascript:handleSelect1(this)" name="idType">
                    <c:forEach var="t" items="${listType}">
                        <option ${t.id==idTypeCu ? "selected":""} value="${t.id}">${t.nameType}</option>
                    </c:forEach>
                </select>
            </div>
            <div style="height: 500px;overflow-x:hidden;
            overflow-y:auto;" class=" main-card mb-3 card">
                <div class="row">
                    <c:forEach var="pro" items="${listWater.content}">
                        <div class="col-3 ml-4 mr-4 mt-2 mb-1 text-center menu-wrap">
                            <a href="#addCartModal${pro.id}">
                                <img width="150" height="150" class="rounded-circle"
                                     src="/getimage/${pro.image}" alt="" data-toggle="modal">
                            </a>
                            <div class="text pt-2">
                                <h5><a class="text-dark text-decoration-none" href="#">${pro.idType.nameType} ${pro.name}</a></h5>
                                <p class="price"><span>${df.format(pro.price)} VNĐ</span></p>
                                <p><a href="#addCartModal${pro.id}" class="mb-2 mr-2 btn-hover-shine btn btn-warning" data-toggle="modal">Add to bill</a></p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <c:if test="${idOrderHistory!=0}">
                <h1 class="text-info text-center">Order History Table</h1>
                <div class="main-card mb-3 card">
                    <div class="card-body">
                        <div class="table-responsive ">
                            <table class="mb-0 table">
                                <thead>
                                <tr>
                                    <th>MHD</th>
                                    <th>Time</th>
                                    <th>User</th>
                                    <th>Total Price</th>
                                    <th>Reason</th>
                                    <th>Status</th>
                                    <th colspan="1"></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="c" items="${listHistory}">
                                    <tr>
                                        <td>${c.id}</td>
                                        <td>${localDateTimeFormat.format(c.getDateOrder())}</td>
                                        <td>${c.idUser.name}</td>
                                        <td>${c.status==1?df.format(c.totalPrice):"0"} VNĐ</td>
                                        <td>${c.reason}</td>
                                        <td>${c.status==0?"Chưa Thanh toán":c.status==1?"Đã thanh toán":"Đã hủy"}</td>
                                        <td>
                                            <a href="#historyOrderDetailModal${c.id}" class="detail" data-toggle="modal"><i
                                                    class="material-icons"
                                                    data-toggle="tooltip"
                                                    title="Detail">&#xE267;</i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </c:if>
            <c:if test="${idTableCu!=0}">
                <h1 class="text-info text-center">Order Detail ${tableNow.idArea.name} Table${tableNow.location}</h1>
                <div class="main-card mb-3 card">
                    <div class="card-body">
                        <c:if test="${order!=null}">
                            <i class="text-dark">MHD:${order.id}</i><i class="text-dark pl-5">Time:${timeTable}</i> <i class="text-dark pl-5">${order.getOrderDetailList().get(0).getIdTable().getIdArea().getName()}Bàn ${order.getOrderDetailList().get(0).getIdTable().getLocation()}</i><i class="text-dark pl-5">Uder Create: ${order.getIdUser().getName()}</i>
                        </c:if>
                        <div class="table-responsive ">
                            <table class="mb-0 table">
                                <thead>
                                <tr>
                                    <th style="width: 15%">Name Water</th>
                                    <th>Size</th>
                                    <th  style="width: 15%">Quantity</th>
                                    <th>Price</th>
                                    <th>Total money</th>
                                    <th>Note</th>
                                    <th>Reason</th>
                                    <th>Status</th>
                                    <th colspan="2"></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="c" items="${listCart}">
                                    <tr>
                                        <td>${c.idWater.idType.nameType} ${c.idWater.name}</td>
                                        <td>${c.idWater.idSize.nameSize}</td>
                                        <td class="cart_quantity">
                                            <div class="">
                                                <a class="button_quantity" href="cart?idWater=${c.idWater.id}"> + </a>
                                                <input class="input_quantity" name="quantity" value="${c.quantity}" autocomplete="off">
                                                <a class="button_quantity" href="sub?idWater=${c.idWater.id}"> - </a>
                                            </div>
                                        </td>
                                        <td>${df.format(c.idWater.price)} VNĐ</td>
                                        <td>${df.format(c.idWater.price*c.quantity)} VNĐ</td>
                                        <td>${c.idDetail.note}</td>
                                        <td>${c.idDetail.reason}</td>
                                        <td>${c.idDetail.status==0?"Thành Công":c.idDetail==null?"Chưa gưởi order":"Đã hủy"}</td>
                                        <td>
                                            <c:if test="${c.idDetail!=null}">
                                                <a href="#cancellationOrderDetailModal${c.idDetail.id}" class="delete" data-toggle="modal"><i
                                                        class="material-icons"
                                                        data-toggle="tooltip"
                                                        title="Delete">&#xE872;</i></a>
                                            </c:if>
                                            <c:if test="${c.idDetail==null}">
                                                <a href="#deleteOrderDetailModal${c.idWater.id}" class="delete" data-toggle="modal"><i
                                                        class="material-icons"
                                                        data-toggle="tooltip"
                                                        title="Delete">&#xE872;</i></a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row pl-5 pb-2">
                        <div class="col-5">
                            <h2 class="text-danger">Tổng tiền ${df.format(total)} VND</h2>
                        </div>
                        <div class="row col-7">
                            <form:form action="/order/add?id=${order.id}" method="post">
                                <button type="submit" class="p-3 btn-wide mb-2 mr-2 btn btn-shadow btn-lg btn-success mt-2">Order</button>
                            </form:form>
                            <a href="#paymentOrderModal${order.id}" class="p-3 btn-wide mb-2 mr-2 btn btn-shadow btn-lg btn-primary mt-2" data-toggle="modal">Payment</a>
                            <a href="#deleteOrderModalAll" class="p-3 btn-wide mb-2 mr-2 btn btn-shadow btn-lg btn-danger mt-2" data-toggle="modal">Delete Bill</a>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>

    </div>
</div>

<script type="text/javascript">
    function handleSelect(elm) {
        window.location = "/order/index?id=" + elm.value;
    }
    function handleSelect1(elm) {
        window.location = "/order/index?idType=" + elm.value;
    }
</script>