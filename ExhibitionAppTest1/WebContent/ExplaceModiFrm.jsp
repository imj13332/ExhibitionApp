<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%@ include file="./include/incLogin.jsp" %>
<br/><br/>
<h3>전시관 정보 수정</h3>
<%

	String codes = request.getParameter("CodeChk");
String placename = "";
String rslocation = "";
String contactno= "";
String times = "";
String holiday = "";

String sql ="select * from explace where codes =? ";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1,codes);
rs = pstmt.executeQuery();

if(rs.next()){
	do{	
		codes = rs.getString("codes");
		placename = rs.getString("placename");
		rslocation = rs.getString("location");
		contactno= rs.getString("contactno");
		times= rs.getString("times");
		holiday= rs.getString("holiday");
	%>
<section class="row">
<div class="col-md-12">
<form action="ExplaceModiProc.jsp">
	<table class="table table-striped">
		<tr>
			<th>전시관 코드</th>
			<td>
			<p class="text-danger"><%=codes %> - 수정불가</p>
			<input type="hidden" class="form-control"  value="<%=codes%>" name="codes" disabled/></td>
		</tr>
		<tr>
			<th>전시관 이름</th>
			<td><input type="text" class="form-control"  value="<%=placename%>" name="placename"/></td>
		</tr>
		<tr>
			<th>위치</th>
			<td><input type="text" class="form-control"  value="<%=rslocation%>" name="rslocation" disabled/></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="text" class="form-control"  value="<%=contactno%>" name="contactno" disabled/></td>
		</tr>
		<tr>
		<th>개관시간</th>
      <td><h4>현재 운영 시간<%out.println(times.substring(1,3) + "시 ~ " + times.substring(4,6) + "까지"); %></h4>
            OPEN : <input type="text" name="n1" class="form-control" value="<%=times.substring(1,3)%>"/>
            CLOSE : <input type="text" name="n2" class="form-control" value="<%=times.substring(4,6)%>"/>
            <!-- 나중에 문자열하고 합해서 times 필드에 넣어줄것.
            n1 은 시작시간, n2 는 종료시간 
            "s + n1 == s10" 
             -->
      </td>
		</tr>
		<tr>
			<th>휴관일</th>
			<td><input type="text" class="form-control"  value="<%=holiday%>" name="holiday" disabled/></td>
		</tr>
		<tr>
			<th colspan="2">
			<input type="submit" value="수정" class="btn btn-success btn-block"/>
			</th>
		</tr>
	
	</table>
	</form>
</div>
</section>		
	<%}while(rs.next());
}else{out.println("조회실패");}
%>
<%@ include file="./include/Footer.jsp" %>