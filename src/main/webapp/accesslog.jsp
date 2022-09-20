<%@ page import="com.asd.project.model.User" %>
<%@ page import="com.asd.project.model.UserAccessLog" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.asd.project.utils.DB" %>
<%@ page import="com.asd.project.model.dao.UserAccessLogDao" %><%--
  Created by IntelliJ IDEA.
  User: sgm49
  Date: 21/09/2022
  Time: 1:01 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>Access Log</title>
</head>
<body>
<div class="body">
    <%
        String name = "Guest";
        User user = null;
        if (session.getAttribute("user") != null) {
            user = (User) session.getAttribute("user");
            name = user.getName();
        }
        ArrayList<UserAccessLog> accessLogs;
        if (user == null)
            response.sendRedirect("main.jsp");
        if (request.getAttribute("userAccessLogs") == null) {
            DB db = new DB();
            UserAccessLogDao accessLogDao = new UserAccessLogDao(db);
            accessLogs = accessLogDao.getUserAccessLog(user.getId());
        } else {
            accessLogs = (ArrayList<UserAccessLog>) request.getAttribute("userAccessLogs");
        }
    %>
    <header>
        <div class="navbar navbar-light shadow-sm" style="background-color: steelblue">
            <div class="container d-flex justify-content-between">
                <a href="index.jsp" class="navbar-brand d-flex align-items-center">
                    <img style=" width:30px; height: 30px; fill: currentColor;"
                         src="img/shop.png" alt="logo">
                    <strong style="margin-left:5px">Restaurant Online Ordering System</strong>
                </a>
            </div>
            <%
                if (user == null) {
            %>
            <a class="btn btn-success" style="margin-right: 10px" href="index.jsp">Log in</a>
            <%} else {%>
            <a class="btn btn-danger" style="margin-right: 10px" href="logoutServlet">Log out</a>
            <%--            add logout servlet--%>
            <%}%>
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton"
                        data-toggle="dropdown" aria-expanded="false">
                    <%=name%>
                </button>
                <div class="dropdown-menu-right dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="#">Cart</a>
                    <%
                        if (user != null) {
                    %>
                    <a class="dropdown-item" href="editinfo.jsp">Personal Information</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="logoutServlet">Log out</a>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </header>

    <%--    navigation bar--%>
    <nav class="navbar navbar-expand-lg navbar-light" style="    background-color: #bae2ff;
    box-shadow: 0px 0px 3px 0px black;">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" style="justify-content: space-around;" id="navbarNavDropdown">
            <div style="width: 70%">
                <ul class="navbar-nav" style="font-size: 20px; justify-content: space-evenly">
                    <li class="nav-item ">
                        <a class="nav-link" href="home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="menu.jsp">Menu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="makeorder.jsp">My Cart</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="restaurant.jsp">About us</a>
                    </li>
                    <% if (user != null) { %>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle active" href="#" role="button" data-toggle="dropdown"
                           aria-expanded="false">
                            My Account
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">My Order</a>
                            <a class="dropdown-item" href="editinfo.jsp">Profile</a>
                            <a class="dropdown-item" href="accesslog.jsp">Access Log</a>
                            <% if (user.getRole().equalsIgnoreCase("Customer")) {%>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item text-danger" href="#">Delete Account</a>
                            <%}%>
                        </div>
                    </li>
                    <%}%>
                </ul>
            </div>
        </div>
    </nav>
    <section class="jumbotron text-center">
        <strong><h1 class="display-4">ACCESS LOG</h1></strong>
    </section>
    <div style="display: flex;
    flex-direction: column;
    align-items: center;">
        <div class="col-md-8">
            <form method="post" action="userAccessLogServlet?action=search">
                <div class="input-group mb-4">
                    <input type="date" class="form-control" id="date" name="date" aria-label="DATE">
                    <button class="btn btn-outline-primary" type="submit"
                            onclick="form.action='userAccessLogServlet?action=all'" id="allButton">All
                    </button>
                    <button class="btn btn-outline-primary" type="submit" id="searchButton">Search</button>
                </div>
            </form>
            <div class="table-responsive">
                <table class="table table-hover table-striped ">
                    <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Type</th>
                        <th>Time</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        if (accessLogs != null) {
                            for (UserAccessLog log : accessLogs) {
                    %>
                    <tr>
                        <td><%=log.getUserID()%>
                        </td>
                        <td style="text-transform: capitalize"><%=log.getUserAccessType()%>
                        </td>
                        <td><%=log.getUserAccessTime()%>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <footer style="margin-top: 80px" class="text-muted">
        <div class="container">
            <p class="float-right">
                <a href="#">Back to top</a>
            </p>
            <p>Online Ordering System &copy;</p>
        </div>
    </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>

</body>
</html>
