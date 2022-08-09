<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.sql.*" %>
    <%@page import="javax.sql.*" %>
    <%@page import="javax.naming.*" %>
    <%
    	String id = request.getParameter("id");
    	String pass = request.getParameter("pass");
    	
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	try{
    		Context init = new InitialContext();
    		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mySQLDB");
    		conn = ds.getConnection();
    		pstmt = conn.prepareStatement("select * from memberlist where id=?");
    		pstmt.setString(1,id);
    		rs = pstmt.executeQuery();
    		
    		if(rs.next()){
    			if(pass.equals(rs.getString("pass"))){
    				session.setAttribute("id", id);		//중요한 부분
    				out.println("<script>");
    				out.println("alert('로그인에 성공했습니다.')");
    				out.println("location.href='index.jsp'");
    				out.println("</script>");
    			}else{
    				out.println("<script>");
    				out.println("alert('로그인에 실패했습니다.')");
    	    		out.println("location.href='login.jsp'");
    	    		out.println("</script>");
    			}
    		}else{
    		out.println("<script>");
    		out.println("location.href='login.jsp'");
    		out.println("</script>");
    		}
    	}catch(Exception e){
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
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>