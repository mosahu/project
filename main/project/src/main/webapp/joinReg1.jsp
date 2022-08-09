<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import ="java.sql.*" %>
  <%@ page import ="javax.sql.*" %>
  <%@ page import ="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String pass = request.getParameter("pw");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String addr1 = request.getParameter("member_addr");
		String addr2 =request.getParameter("add");
		String email = request.getParameter("email");
		String num = null;
		String count = null;
		
		Connection conn =null;
		PreparedStatement pstmt = null;
		
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mySQLDB");
			conn = ds.getConnection();
			
			pstmt=conn.prepareStatement("insert into memberlist values(?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1,num);
			pstmt.setString(2,id);
			pstmt.setString(3,pass);
			pstmt.setString(4,name);
			pstmt.setString(5,tel);
			pstmt.setString(6,addr1);
			pstmt.setString(7,addr2);
			pstmt.setString(8,email);
			pstmt.setString(9,count);
			
		
			
			int result = pstmt.executeUpdate(); 	//쿼리문이 가지고있는값 =조회가 되는값 
			
			if(result != 0){
				out.println("<script>");
				out.println("alert('회원가입이 완료되었습니다 로그인해주세요');");
				out.println("location.href='login.jsp'");
				out.println("</script>");
			}else{
				out.println("<script>");
				out.println("alert('회원가입에 실패했습니다 다시진행해주세요');");
				out.println("location.href='joinForm.jsp'");
				out.println("</script>");
			}
		}catch(Exception e){
			out.println("<script>");
			out.println("alert('오류가 발생했습니다 다시진행해주세요');");
			out.println("history.back();");
			out.println("</script>");
			e.printStackTrace();
		}finally{
			try{
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e){
				e.printStackTrace();
				
			}
		}
		
		
	%>
</body>
</html>