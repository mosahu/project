<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page ="header.jsp" flush="false"/>
	<div>
		<div class="wrap">
			<div class="join_box">
				<h2>회원가입</h2>
				<form action="joinReg1.jsp" method="post" name="joinForm" id="joinForm">
					<ul class="require">
						<p>필수입력</p>
						<li class="double">
							<input type="text" name="id" id="id" required placeholder="아이디"/>
							<label for="id"><input type="button" value="중복확인" id="idCheck" onclick="window.open('idCheck.jsp?openInit=true', '', 'width=400, height=200')"/></label>
						</li>
						
						<li class="alone">
							<input type="password" name="pw" id="pw"  required placeholder="비밀번호"/>
						</li>
						
						<li class="double">
							<input type="password" name="pw1" id="pw1" required placeholder="비밀번호 확인"/>
							<label for="pw1"><input type="button" value="확인" onclick="checkPassword()"/></label>
						</li>
						
						<li class="alone">
							<input type="text" name="name" id="name" required  placeholder="이름"/>
						</li>
						
						<li class="double">
							<input type="text" name="tel" id="tel" required placeholder="전화번호" />
							<label><input type="button" value="인증하기"/></label>
						</li>
					</ul>
					
					<ul>
						<li class="double">
						  <input id="member_addr" type="text" placeholder="주소" readonly> 
						  <input id="member_post" type="button" placeholder="Zip Code" readonly onclick="findAddr()" value="찾기"> 						  
						</li>
						<li class="alone">
							<input type="text" name="add" id="add" placeholder="상세주소">
							
						</li>
						
						<li class="alone">
							<input type="text" name="email" id="email" placeholder="이메일"/></span>
						</li>
						
						<li>
							<input type="submit" value="회원가입" onclick="check_form()"/>
						</li>
					</ul>	
				</form>
			</div>
		</div>
	</div>
	
</body>
<script>
	var all_check = false;
	var id_check = false;
	var pw_check = false;

	function checkPassword(){
	var pw1 = document.getElementById('pw').value;
	var pw2 = document.getElementById('pw1').value;
	if(pw1.length < 6 || pw1.length > 20) {
        alert('입력한 글자가 6자 이상이어야 하고, 20자 이하여야 합니다.');
        pw_check = false;
    }
    
    if( pw1 != pw2 ) {
      alert("비밀번호가 일치 하지 않습니다.");
      pw_check = false;
    } else{
      alert("비밀번호가 일치합니다");
      pw_check = true;
    }
	}
	function findAddr(){
		new daum.Postcode({
	        oncomplete: function (data){
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var jibunAddr = data.jibunAddress; // 지번 주소 변수
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('add').value;
	            if(roadAddr !== ''){
	                document.getElementById("member_addr").value = roadAddr;
	            } 
	            else if(jibunAddr !== ''){
	                document.getElementById("member_addr").value = jibunAddr;
	            }
	        }
	    }).open();
	}

	
	function check_form(){
		var id = document.getElementById('id').value;
		if(id.length <= 0){
			alert('아이디를 입력 해 주세요');
			id_check = false;
		}else{
			id_check = true;
		}
		
			
		if(id_check == true && pw_check == true){
			all_check = true;
			form.submit();
		}else{
			alert('아이디 중복확인과 비밀번호가 일치 해야 합니다.');
		}
	}
	
</script>
</html>