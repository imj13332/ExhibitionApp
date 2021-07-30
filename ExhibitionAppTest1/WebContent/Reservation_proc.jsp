<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "./include/Header.jsp" %>
<%
String tkcode = request.getParameter("tkcode");
String custinfo = request.getParameter("custinfo");
String dates = request.getParameter("dates");
String readate = request.getParameter("readate");
String tprice  = request.getParameter("tprice");
String tcnt  = request.getParameter("tcnt");
String payment  = request.getParameter("payment");

String sql1 = "insert into tickets value(null,?,?,?,?,?,?,?)";
pstmt = conn.prepareStatement(sql1);
pstmt.setString(1,tkcode);
pstmt.setString(2,custinfo);
pstmt.setString(3,dates);
pstmt.setString(4,readate);
pstmt.setString(5,tprice);
pstmt.setString(6,tcnt);
pstmt.setString(7,payment);

int rss = pstmt.executeUpdate();
if(rss >0 ){response.sendRedirect("Ticket.jsp");}
%>