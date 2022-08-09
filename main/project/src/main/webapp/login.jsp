<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>

<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page ="header.jsp" flush="false"/>
<div>
    <div class="wrap">
        <div class="login">
            <h2>LOGIN</h2>
            <ul>
                <form action="loginReg.jsp">                    
                    <li><input type="text" name="id" id="id" placeholder="아이디" required></li>
                    <li><input type="password" name="pass" id="pass" placeholder="비밀번호" required></li>
                    <li class="id_pw_search"><a href=""><span>아이디 찾기</span></a> / <a href=""><span>비밀번호 찾기</span></a></li>
                    <li class="login_button">
                        <span><input type="submit" value="로그인"></span>
                        <span><a href="join.jsp"><input type="button" value="회원가입"></a></span>
                    </li>
                </form>
                <li class="kakao"><p><a href="">카카오톡으로 로그인 하기</a></p></li>
                <li class="naver"><p><a href="">네이버로 로그인 하기</a></p></li>
        	</ul>
        </div>
    </div>
</div>

</body>
<jsp:include page ="footer.jsp" />
</html>