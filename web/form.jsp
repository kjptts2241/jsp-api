<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-08-04
  Time: 오후 5:34
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>헬로 JSP</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container">

    <h2>헬로 JSP</h2>
    <p>여기에 쓰는 검색어를 다음 페이지에서 나오게 하고 싶다</p>
    <form class="form-inline" action="/next.jsp">
        <label for="search">검색어:</label>
        <input type="text" class="form-control" id="search" placeholder="검색어입력" name="search">
        <button type="submit" class="btn btn-primary">검색</button>
    </form>
</div>

</body>
</html>
