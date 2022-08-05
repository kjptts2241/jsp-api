<%@ page import="utils.NaverApiSearch" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-08-05
  Time: 오후 4:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="application/json;charset=UTF-8" language="java" %>

<%
    String newsDate = NaverApiSearch.newApi("불금");
    out.println(newsDate);
%>
