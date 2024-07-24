<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 연결 -->
<link rel="stylesheet" href="../css/login_form3.css">

<!-- BootStrap 3.x-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style type="text/css">
	#box{
		width: 500px;
		margin: auto;
		margin-top: 200px;
	   }
	   
	input[type='button']{
		width: 100px;
	}

</style>

<script type="text/javascript">

	function send(f){
		
		let mem_id  = f.mem_id.value.trim();
		let mem_pwd = f.mem_pwd.value.trim();
		
		if(mem_id==''){
			alert("아이디를 입력하세요");
			f.mem_id.value="";
			f.mem_id.focus();
			return;
		}
		
		if(mem_pwd==''){
			alert("비밀번호를 입력하세요");
			f.mem_pwd.value="";
			f.mem_pwd.focus();
			return;
		}
		
		f.action="login.do";	// 누구한테 보낼거냐 -> MemberLoginAction 만들어야 됨 
		f.submit();
		
	}// end: send()
	
</script>

<script type="text/javascript">

	//  화면이 배치가 완료되면 호출 
	// 1) js방식
	// window.onload = function(){};
	// 2) jQuery 방식
	$(document).ready(function(){
		
		setTimeout(showMessage,100);	// 0.1초 후에 메시지 띄워라
		
	});
	
	// id,pwd 잘못 입력 시 띄울 메세지 창
	function showMessage(){
		if("${ param.reason == 'fail_id'}"=="true"){		// el 방식 작성 -> 지금 여러 방법 혼용해서 쓰는 중이므로 el 작성 시 "" 요걸로 감싼 후 작성
			alert("아이디가 틀립니다");
		}
		
		if("${ param.reason == 'fail_pwd'}"=="true"){		// el 방식 작성 -> 지금 여러 방법 혼용해서 쓰는 중이므로 el 작성 시 "" 요걸로 감싼 후 작성
			alert("비밀번호가 틀립니다");
		}
		///member/login_form.do?reason=session_timeout
		if("${ param.reason == 'session_timeout'}"=="true"){		// PhotoInsertAction에 대한 내용 추가(세션 만료 안내)
			alert("로그아웃 되었습니다");
		}
		
	}


</script>

</head>

<body>

<form>
	<div id="box">
		<div class="form-group">
			<input type="text" class="form-control" name="mem_id" placeholder="아이디">
		</div>
		<div class="form-group">
			<input type="password" class="form-control" name="mem_pwd" placeholder="비밀번호">
		</div>

		<div class="checkbox" >
			<label><input type="checkbox">아이디 저장</label>
		</div>
		<input type="button" class="btn btn-block" value="로그인하기" onclick="send(this.form);">
		<hr>
		<div>
			<span>아직 회원이 아니시라면?</span>
			<a href="#"><span>회원가입 하러 가기</span></a>
		</div>
		<div>
			<span>아이디 찾기</span>
			<span>비밀번호 찾기</span>
		</div>
		
		<!-- <input type="button" class="btn btn-block" value="회원가입하기"> -->
	
	</div>
</form>
</body>
</html>