<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%@ include file="./include/incLogin.jsp" %>
<br/><br/>
<h3>전시관 정보 수정</h3>

<%
   request.setCharacterEncoding("utf-8");

      String codes = request.getParameter("CodeChk");
   //전역변수로 설정해서 전시관 관련 정보 찍어줄 변수 생성.
   String placename= "";
   String rslocation= "";
   String contactno= "";
   String times= "";
   String holiday= "";
   
   String sql ="select * from explace where codes =?";
   pstmt = conn.prepareStatement(sql);
   pstmt.setString(1,codes);
   rs = pstmt.executeQuery();
   
if(rs.next()){
   do{//기존 정보 가져오 구문 써주시고 
      //반복문에서 가져올 값들 작성
   codes = rs.getString("codes");
   placename = rs.getString("placename");
   rslocation = rs.getString("location");
   contactno = rs.getString("contactno");
   times= rs.getString("times");
   holiday = rs.getString("holiday");
   
   %>
   
<section class="row">
<div class="col-md-12">
<form action=ExplaceModiProc.jsp method="post" name="">
   <table class="table table-striped">   
   <tr>
      <th>전시관 코드</th>
      <td><%=codes%><input type="hidden" class="form-control" value="<%=codes%>" name="codes"/></td>
   </tr>
   <tr>
      <th>전시관 이름</th>
      <td><input type="text" class="form-control" value="<%=placename%>" name="placename"/></td>
   </tr>
   <tr>
      <th>위치(수정불가)</th>
      <td><input type="text" class="form-control" value="<%=rslocation%>" disabled/></td>
   </tr>
   <tr>
      <th>연락처</th>
      <td><input type="text" class="form-control" value="<%=contactno%>" name="contactno"/></td>
   </tr>
   <tr>
      <th>개관시간</th>
      <td>
      <h4><%out.println(times.substring(1,3) + "시 ~ " + times.substring(4,6) + "까지"); %></h4>
        <div class="form-group form-inline">
            OPEN : <input type="text" class="form-inline form-control" name="n1" value="<%=times.substring(1,3)%>"/>&nbsp;&nbsp;&nbsp;
            CLOSE : <input type="text" class="form-inline form-control" name="n2" value="<%=times.substring(4,6)%>"/>
            <!-- 나중에 문자열하고 합해서 times 필드에 넣어줄것. 
            n1은 시작시간, n2는 종료시간 "s"+n1==s10 -->           
         </div>
      </td>
   </tr>
   <tr>
      <th>휴관일</th>
      <td><input type="text"  class="form-control" value="<%=holiday %>" name="holiday"/></td>
   </tr>
      <tr>
      <th colspan="2" >
      <input type="submit" value="수 정" class="btn btn-info btn-block"/></th>
   </tr>
   
   </table>
   </form>
</div>
</section>   
   
   <%}while(rs.next());
}else{out.println("조회실패");}

%>


<%@ include file="./include/Footer.jsp" %>