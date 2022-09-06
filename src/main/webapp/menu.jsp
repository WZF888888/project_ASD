<%--
  Created by IntelliJ IDEA.
  User: Littlenewww
  Date: 2022/9/6
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

  <title>Hello, world!</title>
</head>
<body>
<div class="body">

  <header>
    <div class="navbar navbar-light shadow-sm" style="background-color: steelblue">
      <div class="container d-flex justify-content-between">
        <a href="index.jsp" class="navbar-brand d-flex align-items-center">
          <img style=" width:30px; height: 30px; fill: currentColor;" src="img/shop.png" alt="logo">
          <strong style="margin-left:5px">Restaurant Online Ordering System</strong>
        </a>
      </div>
    </div>
  </header>


  <h1 style="    text-align: center;
    padding: 30px;
}">Categories</h1>

  <div class="list-group" style="    display: flex;
    flex-direction: column;
    align-items: center;
    margin-left: 20%;
    margin-right: 20%;
    padding-bottom: 50px;
}">
    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start active">
      <div class="d-flex w-100 justify-content-between">
        <h5 class="mb-1">Appetizer</h5>
        <small>Up to date</small>
      </div>

    </a>
    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
      <div class="d-flex w-100 justify-content-between">
        <h5 class="mb-1">Main course</h5>
        <small class="text-muted">Up to date</small>
      </div>

    </a>
    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
      <div class="d-flex w-100 justify-content-between">
        <h5 class="mb-1">Beverages</h5>
        <small class="text-muted">Up to date</small>
      </div>

    </a>
  </div>


  <footer class="text-muted">
    <div class="container">
      <p class="float-right">
        <a href="#">Back to top</a>
      </p>
      <p>Online Ordering System &copy;</p>
    </div>
  </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

</body>
</html>