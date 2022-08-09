<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 약관 페이지</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page ="header.jsp" flush="false"/>
<div>
	<div class="wrap">
		<div class="joinContract_box">
			<h2>회원가입 약관</h2>
			<div class="content">
				<form action="join.jsp" method="post">
				<div id="check_All"></div>
					<input type="checkbox" name="selectall" id="selectall" onclick	="selectAll(this)" required/>
					<label for="checkAll">이용약관, 개인정보 수집 및 이용에 모두 동의합니다.</label>
				</div>
						
				<ul id="check_list">
					<li>
						<textarea cols="50" rows="15" name="terms1" readonly>약관내용</textarea>
					</li >
					<li id="check_List">
						<input type="checkbox" name="checkList" id="checkList" onclick="checkSelectAll()" required/>
						<label for="checkList1">이용약관 이용에 동의합니다.</label>
					</li>
					<li>
						<textarea cols="50" rows="15" name="terms1" readonly>약관내용</textarea>
					</li>
					<li id="check_List">
						<input type="checkbox" name="checkList" id="checkList" onclick="checkSelectAll()" required/>
						<label for="checkAll">개인정보 수집에 동의합니다.</label>
					</li>
					
					<li class="join_bt">
						<input type="button" id="check_bt" value="가입하기" onclick="move()"/>
					</li>
				</ul>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page ="footer.jsp" />
</body>
<script>
var allcheck = document.getElementById('selectall');

function checkSelectAll()  {
	  var checkboxes = document.querySelectorAll('input[name="checkList"]');
	  var checked = document.querySelectorAll('input[name="checkList"]:checked');
	  var selectAll = document.querySelector('input[name="selectall"]');
	  if(checkboxes.length === checked.length)  { 
	    selectAll.checked = true;
	  }else {
	    selectAll.checked = false;
	  }
	}
	
function selectAll(selectAll)  {
	  var checkboxes1 = document.getElementsByName('checkList');	  
	  checkboxes1.forEach((checkbox) => {
	    checkbox.checked = selectall.checked
	  })
	}
	
function move(){
	if(allcheck.checked){
		location.href='join.jsp'
	}else{
		alert('모두 동의 하여야 합니다.');
	}
}
</script>
</html>