<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="javax.sql.*" %>
    <%@page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="init()">
	<form  action="idCheck.jsp" method="post">
		<input type="text" name="idCheck" id="idCheck"/>
		<input type="submit" value="중복확인"/>
	</form>
	<hr>
	<%
	
		request.setCharacterEncoding("utf-8");
		String idCheck = null;
		if(request.getParameter("idCheck") != null){
			idCheck = request.getParameter("idCheck").trim();
		}
		if(idCheck != null && !idCheck.equals("")){
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;		
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mySQLDB");
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select * from memberlist where id=?");
			pstmt.setString(1,idCheck); 
			rs = pstmt.executeQuery();
			if(request.getParameter("idCheck") != null){
    			if(rs.next()){
    %>
    	<h3><%=idCheck %>는 중복된 아이디 입니다.</h3>
   	<%
    				}else{
    %>
    	<h3><%=idCheck %>는 사용 가능한 아이디 입니다.</h3>
    	<a href="#" onclick="ok('<%=idCheck %>')">사용하기</a>
    <%
	    		}
	    	}}catch(Exception e){
	    		e.printStackTrace();
	    	}finally{
	    	
	    		try{
	    			if(pstmt != null)
	    				pstmt.close();
	    			if(conn != null)
	    				conn.close();
	    		}catch(Exception e){
	    			e.printStackTrace();
	    		}
	    	} 
		}
	%>
	<script>
		<%
			String openInit = "false";
			if(request.getParameter("openInit")!=null){
				openInit = request.getParameter("openInit"); 
			}
		%>
		function ok(v){
			opener.document.getElementById("id").value = v;
			opener.idcheck = v.trim(); //opener의 아이디 입력창이 readonly가 아닐경우
			opener.chkId = true;
			window.close();
		}
		
		function init(){
			if(<%=openInit%>){
			document.getElementById("idCheck").value = 
				opener.document.getElementById("id").value;
			}	
		}
	</script>
</body>
</html>