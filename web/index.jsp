<%@ page import="java.time.LocalTime" %>

<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-08-04
  Time: 오후 3:13
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>헬로</title>
</head>
<body>
헬로 월드<br>
<%
  // 여기는 자바 코드를 작성 할 수 있어요
  out.println("헬로 jsp.");
  for (int i = 0; i < 10; i++) {
    out.println("제이에스피 : " + i + "<br>");
  }
  String name = "월드";

  LocalTime now = LocalTime.now();
  int hour = now.getHour(); // 시
  int minute = now.getMinute(); // 분
  int second = now.getSecond(); // 초

  out.println(hour + " : ");
  out.println(minute + " : ");
  out.println(second);
%>


헬로 <%=name%><br><br><br>

<a href="form.jsp">검색</a><br>
<a href="test.jsp">네이버 Api 테스트</a>

</body>
</html>
