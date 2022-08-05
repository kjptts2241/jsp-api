<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Dto.SearchDto" %>

<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-08-04
  Time: 오후 5:39
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<%
  String search = request.getParameter("search");

  // 검색어를 데이터 베이스에 저장
  String driver = "org.mariadb.jdbc.Driver";
  final String DB_IP = "localhost";
  final String DB_PORT = "3306";
  final String DB_NAME = "dbdb";
  final String DB_URL = "jdbc:mariadb://" + DB_IP + ":" + DB_PORT + "/" + DB_NAME;

  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  ArrayList<SearchDto> list = new ArrayList<>();

  try {
    Class.forName(driver);
    conn = DriverManager.getConnection(DB_URL, "root", "1234");
    if (conn != null) {
      System.out.println("DB 접속 성공");
    }

  } catch (ClassNotFoundException e) {
    System.out.println("드라이버 로드 실패");
    e.printStackTrace();
  } catch (SQLException e) {
    System.out.println("DB 접속 실패");
    e.printStackTrace();
  }

  try {

    // 데이터 넣기
    String sql = "INSERT INTO `tb_search` (`search`) VALUES (?) ON DUPLICATE KEY UPDATE cnt = cnt + 1";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, search);
    pstmt.executeUpdate();

    // 데이터 불러오기
    sql = "select * from `tb_search`";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    while (rs.next()) {
      SearchDto dto = new SearchDto();
      dto.setSearch(rs.getString("search"));
      dto.setCnt(rs.getInt("cnt"));
      list.add(dto);
    }

  } catch (SQLException e) {
    System.out.println("error: " + e);
  } finally {
    try {
      if (rs != null) {
        rs.close();
      }
      if (pstmt != null) {
        pstmt.close();
      }

      if (conn != null && !conn.isClosed()) {
        conn.close();
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

%>

헬로 <span id="search"><%=search %></span><br><br>

<%for (SearchDto d : list) { %>
검색어 : <%=d.getSearch() %>(<%=d.getCnt()%>)<br>
<% } %>
<br>

<div></div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
  $(document).ready(function(){
    var s = $('#search').text();
    alert(s);
    $.getJSON("test.jsp?search=" + s, function(result){
      $.each(result.items, function(i, field){
        var html = "<a href='" + field.link + "'>" + field.title + "<br>"
        $("div").append(html);
      });
    });
  });
</script>
</body>
</html>
