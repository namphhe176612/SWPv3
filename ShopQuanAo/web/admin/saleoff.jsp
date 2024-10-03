<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Sale Off Management</title>
</head>

<body>
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="admin/images/user.png" width="50px"
                                                alt="User Image">
                <div>
                    <p class="app-sidebar__user-name"><b>${sessionScope.user.user_name}</b></p>
                    <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
                </div>
            </div>
            <hr>
           <ul class="app-menu">
                <li><a class="app-menu__item" href="dashboard"><i class='app-menu__icon bx bx-tachometer'></i><span class="app-menu__label">Bảng thống kê</span></a></li>
                <li><a class="app-menu__item" href="categorymanager"><i class='app-menu__icon bx bxs-category'></i><span class="app-menu__label">Quản lý danh mục</span></a></li>
                <li><a class="app-menu__item" href="productmanager"><i class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a></li>
                <li><a class="app-menu__item" href="ordermanager"><i class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Quản lý đơn hàng</span></a></li>

                <!-- Conditionally Display Menu Items -->
                <c:if test="${sessionScope.user.isAdmin}">
                    <li><a class="app-menu__item" href="customermanager"><i class='app-menu__icon bx bx-user-voice'></i><span class="app-menu__label">Quản lý khách hàng</span></a></li>
                    <li><a class="app-menu__item" href="reportmanager"><i class='app-menu__icon bx bx-receipt'></i><span class="app-menu__label">Quản lý phản hồi</span></a></li>
                    <li><a class="app-menu__item" href="aboutmanager"><i class='app-menu__icon bx bx-receipt'></i><span class="app-menu__label">Quản lý trang giới thiệu</span></a></li>
                    <li><a class="app-menu__item" href="commentmanager"><i class='app-menu__icon bx bx-receipt'></i><span class="app-menu__label">Quản lý bình luận</span></a></li>
                    <li><a class="app-menu__item" href="saleoff"><i class='app-menu__icon bx bx-receipt'></i><span class="app-menu__label">Quản lý sale</span></a></li>
                </c:if>
            </ul>
        </aside>
    <h1>Sale Off Management</h1>
    
    <h2>Current Sale Offs</h2>
    <table border="1">
        <tr>
            <th>Sale ID</th>
            <th>Product ID</th>
            <th>Discount Percentage</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Action</th>
        </tr>
        <c:forEach var="saleOff" items="${saleOffs}">
            <tr>
                <td>${saleOff.sale_id}</td>
                <td>${saleOff.product_id}</td>
                <td>${saleOff.discount_percentage}</td>
                <td>${saleOff.start_date}</td>
                <td>${saleOff.end_date}</td>
                <td>
                    <form action="saleoff" method="post">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="saleId" value="${saleOff.sale_id}">
                        <input type="number" name="discountPercentage" value="${saleOff.discount_percentage}" step="0.01" required>
                        <input type="date" name="startDate" value="${saleOff.start_date}" required>
                        <input type="date" name="endDate" value="${saleOff.end_date}" required>
                        <input type="submit" value="Update">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    
    <h2>Add New Sale Off</h2>
    <form action="saleoff" method="post">
        <input type="hidden" name="action" value="insert">
        Sale ID: <input type="text" name="saleId" required><br>
        Product ID: <input type="text" name="productId" required><br>
        Discount Percentage: <input type="number" name="discountPercentage" step="0.01" required><br>
        Start Date: <input type="date" name="startDate" required><br>
        End Date: <input type="date" name="endDate" required><br>
        <input type="submit" value="Add Sale Off">
    </form>
</body>
</html>