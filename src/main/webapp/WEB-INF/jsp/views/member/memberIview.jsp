<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입화면</title>
<style>

/* 레이아웃 틀 */
html {
    height: 100%;
}

body {
    margin: 0;
    height: 100%;
    background: #f5f6f7;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}
#logo {
    width: 240px;
    height: 44px;
    cursor: pointer;
}

#header {
    padding-top: 62px;
    padding-bottom: 20px;
    text-align: center;
}
#wrapper {
    position: relative;
    height: 100%;
}

#content {
    position: absolute;
    left: 50%;
    transform: translate(-50%);
    width: 460px;
}

h3 {
    margin: 19px 0 8px;
    font-size: 14px;
    font-weight: 700;
}


.box {
    display: block;
    width: 100%;
    height: 51px;
    border: solid 1px #4DABF7;
    padding: 10px 14px 10px 14px;
    box-sizing: border-box;
    background: #fff;
    position: relative;
}

.int {
    display: block;
    position: relative;
    width: 99.7%;
    height: 29px;
    border: 1px solid #4DABF7;
    background: #fff;
    margin: 0px;
	padding : 0px;
    font-size: 15px;
}
#dogvarTitle{
	font-size : 70px;

	color :#EB381F ;

}
.emailleft {
    display: inline-block;
    position: relative;
    width: 39%;
    height: 29px;
    border: 1px solid #4DABF7;
    background: #fff;
    font-size: 15px;
	margin: 0px;
	padding : 0px;
}

.emailright {
    display: inline-block;
    position: relative;
    border: 1px solid #4DABF7;
    width: 56.5%;
    height: 29px;
    background: #fff;
    font-size: 15px;
    margin: 0px;
    padding : 0px;
}
.phoneLeft {
    display: inline-block;
    position: relative;
    border: 1px solid #4DABF7;
    width: 28.8%;
    height: 29px;
    background: #fff;
    font-size: 15px;
	margin: 0px;
	padding : 0px;
}

.phoneCenter {
    display: inline-block;
    position: relative;
    border: 1px solid #4DABF7;
    width: 31%;
    height: 29px;
    background: #fff;
    font-size: 15px;
    margin: 0px;
    padding : 0px;
}
.phoneRight {
    display: inline-block;
    position: relative;
    border: 1px solid #4DABF7;
    width: 31%;
    height: 29px;
    background: #fff;
    font-size: 15px;
    margin: 0px;
    padding : 0px;
}
.box.int_id {
    padding-right: 110px;
}
.box.int_pass {
    padding-right: 40px;
}

.box.int_pass_check {
    padding-right: 40px;
}
.step_url {
   
    position: absolute;
    top: 16px;
    right: 13px;
    font-size: 15px;
    color: #8e8e8e;
}
.pswdImg {
    width: 18px;
    height: 20px;
    display: inline-block;
    position: absolute;
    top: 50%;
    right: 16px;
    margin-top: -10px;
    cursor: pointer;
}
.error_next_box {
    margin-top: 9px;
    font-size: 12px;
    color: red;    
}

#alertTxt {
    position: absolute;
    top: 19px;
    right: 38px;
    font-size: 12px;
    color: red;
    display: none;
}
.btn_area {
    margin: 30px 0 91px;
}

#btnJoin {
    width: 100%;
    padding: 21px 0 17px;
    border: 0;
    cursor: pointer;
    color: #363636;
    background-color: #EB381F;
    font-size: 20px;
    font-weight: border;
    margin : 0;

}

</style>
</head>


<body>
<div id="wrap">
	<!-- //스킵네비게이션 -->
	<!-- header -->
	<div id="header" class="join_membership" role="banner">
	    <h1><a href = "loginview" id = "dogvarTitle" style = "text-decoration:none" >DOGVAR</a></h1>
	</div>
<!-- // header -->

<form id="join_form" method="POST" action="memberRegister">
    <!-- container -->
    <div id="container" role="main">
        <div id="content">
            <!-- tg-text=title -->
            <h2 class="blind">회원가입</h2>
            <div class="join_content">
                <!-- 아이디, 비밀번호 입력 -->
                <div class="row_group">
                    <div class="join_row">
                        <h3 class="join_title"><label for="id">아이디</label></h3>
                        <span class="ps_box int_id">
							<input type="text" id="id" name="id" class="int" title="ID" maxlength="20">
                         </span>
                        <span class="error_next_box" id="idMsg" style="display:block" aria-live="assertive">필수정보입니다.</span>
                    </div>

                    <div class="join_row">
                        <h3 class="join_title"><label for="password">비밀번호</label></h3>
                        <span class="ps_box int_pass" id="pswd1Img">
							<input type="password" id="password" name="password" class="int" title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20">
                            <span class="lbl"><span id="pswd1Span" class="step_txt"></span></span>
						</span>
                        <span class="error_next_box" id="pswd1Msg" style="display:block" aria-live="assertive">필수정보입니다.</span>

                        <h3 class="join_title"><label for="passwordRe">비밀번호 재확인</label></h3>
                        <span class="ps_box int_pass_check" id="pswd2Img">
							<input type="password" id="passwordRe" name="passwordRe" class="int" title="비밀번호 재확인 입력" aria-describedby="pswd2Blind" maxlength="20">
						</span>
                        <span class="error_next_box" id="pswd2Msg" style="display:block" aria-live="assertive">필수정보입니다.</span>
                    </div>
                </div>
                <!-- // 아이디, 비밀번호 입력 -->

                <!-- 이름, 생년월일 입력 -->
                <div class="row_group">

                    <!-- lang = ko_KR -->
                    <div class="join_row">
                        <h3 class="join_title"><label for="name">이름</label></h3>
                        <span class="ps_box box_right_space">
							<input type="text" id="name" name="name" title="이름" class="int" maxlength="6">
						</span>
                        <span class="error_next_box" id="nameMsg" style="display:block" aria-live="assertive">필수정보입니다.</span>
                    </div>
                    
                    <div class="join_row">
                        <h3 class="join_title"><label for="nickname">별칭</label></h3>
                        <span class="ps_box box_right_space">
							<input type="text" id="nickname" name="nickname" title="별칭" class="int" maxlength="16">
						</span>
                        <span class="error_next_box" id="nickNameMsg" style="display:block" aria-live="assertive">필수정보입니다.</span>
                    </div>

                    <div class="join_row join_email">
                        <h3 class="join_title"><label for="email">본인확인 이메일</label></h3>
                        <span class="ps_box int_email box_right_space">
						<input type="text" id = "emailId" name="emailId" value="" class="emailleft" maxlength="50"/><span class="terms_choice">@</span><input type="text" id = "emailDomain" name="emailDomain" value="" class="emailright" maxlength="50"/>
						</span>
						 <span class="error_next_box" id="emailMsg" style="display:block" aria-live="assertive">필수정보입니다.</span>
                    </div>
                </div>

                <!-- 휴대전화 번호입력 -->
                <div class="join_row join_mobile" id="mobDiv">
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <div class="int_mobile_area">
						<span class="ps_box int_mobile">
							<input type="tel" id = "phoneStart" name="phoneStart" placeholder="앞자리입력" aria-label="앞자리입력" class="phoneLeft" maxlength="3"/> - <input
						type="tel" id = "phoneCenter" name="phoneCenter" placeholder="가운데자리입력" aria-label="가운데자리입력" class="phoneCenter" maxlength="4"/> - 
						<input type="tel" id = "phoneEnd" name="phoneEnd" placeholder="뒷자리입력" aria-label="뒷자리입력" class="phoneRight" maxlength="4" />
							<label for="phoneNo" class="lbl"></label>
						</span>
                    </div>
                    <span class="error_next_box" id="phoneNoMsg" style="display:block" aria-live="assertive">필수정보입니다.</span>
                </div>

                <!-- tg-display -->

                <div class="btn_area">
                    <button type="submit" id="btnJoin" class="btn_type btn_primary"><span>가입하기</span></button>
                </div>
            </div>
        </div>
    </div>
    <!-- // container -->

</form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>

	$(function() {

		//아이디 keypress시 err문구 초기화
		$("#id").keypress(function() {
			$("#idMsg").css("display", "none");
		});
		//패스워드1 keypress시 err문구 초기화		
		$("#password").keypress(function() {
			$("#pswd1Msg").css("display", "none");
		});
		//패스워드2 keypress시 err문구 초기화	
		$("#passwordRe").keypress(function() {
			$("#pswd2Msg").css("display", "none");
		});
		//이름 keydown 시 err문구 초기화	
		$("#name").keydown(function() {
			$("#nameMsg").css("display", "none");
		});
		//nickname keydown시 err문구 초기화
		$("#nickname").keydown(function() {
			$("#nickNameMsg").css("display", "none");
		});
		
		///이메일 kepress시 err문구 초기화
		$("#emailId").keypress(function() {
			$("#emailMsg").css("display", "none");
		});
		$("#emailDomain").keypress(function() {
			$("#emailMsg").css("display", "none");
		});
		///휴대폰 kepress시 err문구 초기화
		$("#phoneStart").keypress(function() {
			$("#phoneNoMsg").css("display", "none");
		});
		$("#phoneCenter").keypress(function() {
			$("#phoneNoMsg").css("display", "none");
		});
		$("#phoneEnd").keypress(function() {
			$("#phoneNoMsg").css("display", "none");
		});
		

		//id 중복체크
		$("#id").blur(function() {
				var id = $('#id').val();
				//널체크
				if (id == "") {
					$("#idMsg").css("display", "block");
					$("#idMsg").text('필수정보입니다.');
					$("#idMsg").css("color", "red");
					return false;
				}
				
				
				//id 한글입력방지
				var regexp = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
				
				if(regexp.test(id)){
					$("#idMsg").css("display", "block");
					$("#idMsg").text('아이디는 한글을 입력할 수 없습니다.');
					$("#idMsg").css("color", "red");
					$('#id').val("");
					return false;
				}
				

				$.ajax({
						url : 'getMemberIdDupCheck?id=' + id,
						type : 'get',
						success : function(data) {
							if (data == "Y") {
								$("#idMsg").css("display", "block");
								$("#idMsg").text('이미 사용중인 아이디입니다.');
								$("#idMsg").css("color", "red");
							} else {
								$("#idMsg").css("display", "block");
								$("#idMsg").text('사용할 수 있는 아이디입니다.');
								$("#idMsg").css("color", "green");
							}
						},
						error : function(request, status, error) {
							alert("code:" + request.status + "\n" + "message:"
									+ request.responseText + "\n" + "error:"
									+ error);
	
						}

				});
		});
		//패스워드체크
		$("#password").blur(function() {
			
			var password = $('#password').val();

			if (password == "") {
				$("#pswd1Msg").css("display", "block");
				$("#pswd1Msg").text('필수정보입니다.');
				
				return false;
			}	
		});
		
		//패스워드RE체크
		$("#passwordRe").blur(function() {
			var password = $('#password').val();
			var passwordRe = $('#passwordRe').val();

			if (passwordRe == "") {
				$("#pswd2Msg").css("display", "block");
				$("#pswd2Msg").text('필수정보입니다.');
				
				return false;
			}
			
			if (passwordRe != password) {
				$("#pswd2Msg").css("display", "block");
				$("#pswd2Msg").text('비밀번호가 일치하지 않습니다.');
				$("#pswd2Msg").css("color", "red");
				return false;
			}		
		});
		
		//이름체크
		$("#name").blur(function() {
			var name = $('#name').val();
			if (name == "") {
				$("#nameMsg").css("display", "block");
				$("#nameMsg").text('필수정보입니다.');

				return false;
			}			
		});
		
		//별칭체크
		$("#nickname").blur(function() {
			var nickname = $('#nickname').val();

			if (nickname == "") {
				$("#nickNameMsg").css("display", "block");
				$("#nickNameMsg").text('필수정보입니다.');
				
				return false;
			}			
		});
		
		//폰체크
		$("#phoneStart").blur(function() {
			var regexp = /^[0-9]*$/
			
			v = $('#phoneStart').val();
			
			if(!regexp.test(v)){
				$("#phoneNoMsg").css("display", "block");
				$("#phoneNoMsg").text('숫자만 입력하세요');
				$('#phoneStart').val("");
				return false;
			}
			
			var phoneStart = $('#phoneStart').val();
			var phoneCenter = $('#phoneCenter').val();
			var phoneEnd = $('#phoneEnd').val();

			if (phoneStart == "" || phoneCenter == "" || phoneEnd == "") {
				$("#phoneNoMsg").css("display", "block");
				$("#phoneNoMsg").text('필수정보입니다.');
				
				return false;
			}			
		});
		$("#phoneCenter").blur(function() {
			var regexp = /^[0-9]*$/
				
			v = $('#phoneCenter').val();
			
			if(!regexp.test(v)){
				$("#phoneNoMsg").css("display", "block");
				$("#phoneNoMsg").text('숫자만 입력하세요');
				$('#phoneCenter').val("");
				return false;
			}
			var phoneStart = $('#phoneStart').val();
			var phoneCenter = $('#phoneCenter').val();
			var phoneEnd = $('#phoneEnd').val();

			if (phoneStart == "" || phoneCenter == "" || phoneEnd == "") {
				$("#phoneNoMsg").css("display", "block");
				$("#phoneNoMsg").text('필수정보입니다.');
				
				return false;
			}			
		});
		$("#phoneEnd").blur(function() {
			var regexp = /^[0-9]*$/
				
				v = $('#phoneEnd').val();
				
				if(!regexp.test(v)){
					$("#phoneNoMsg").css("display", "block");
					$("#phoneNoMsg").text('숫자만 입력하세요');
					$('#phoneEnd').val("");
					return false;
				}
			var phoneStart = $('#phoneStart').val();
			var phoneCenter = $('#phoneCenter').val();
			var phoneEnd = $('#phoneEnd').val();

			if (phoneStart == "" || phoneCenter == "" || phoneEnd == "") {
				$("#phoneNoMsg").css("display", "block");
				$("#phoneNoMsg").text('필수정보입니다.');
				
				return false;
			}			
		});
		
		//이메일아이디체크
		$("#emailId").blur(function() {		
			var emailId = $('#emailId').val();
			var emailDomain = $('#emailDomain').val();
			var regexp = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

			if(regexp.test(emailId)){
				$("#emailMsg").css("display", "block");
				$("#emailMsg").text('이메일 아이디는 한글을 입력할 수 없습니다.');
				
				$('#emailId').val("");
				return false;
			}

			if (emailId == "" || emailDomain == "") {
				$("#emailMsg").css("display", "block");
				$("#emailMsg").text('필수정보입니다.');
				
				return false;
			}			
		});
		
		//이메일체크
		$("#emailDomain").blur(function() {
			var emailId = $('#emailId').val();
			var emailDomain = $('#emailDomain').val();
			
			var regexp = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

			if(regexp.test(emailDomain)){
				$("#emailMsg").css("display", "block");
				$("#emailMsg").text('이메일 도메인은 한글을 입력할 수 없습니다.');
				$('#emailDomain').val("");
				return false;
			} 
			
			if (emailId == "" || emailDomain =="") {
				$("#emailMsg").css("display", "block");
				$("#emailMsg").text('필수정보입니다.');
				return false;
			}			
		});
		
		//가입하기
		 $("#btnJoin").on('click', function(){

			
			var idcheckColor = rgb2hex($("#idMsg").css("color"));
			 
			if(idcheckColor != "#008000"){
				$("#id").focus();
				 return false;	
			}
			 var jb = $('.error_next_box').get();
			 
			 for(var i = 1 ; i < jb.length; i++){
				var yn = $('.error_next_box').eq(i).css("display");
				 if( yn == "block"){
					 if(i == 1){
						 $("#password").focus();
					 }else if(i == 2){
						 $("#passwordRe").focus();
					 }else if(i == 3){
						 $("#name").focus();
					 }else if(i == 4){
						 $("#nickname").focus();
					 }else if(i == 5){
						 $("#emailId").focus();
					 }else if(i == 6){
						 $("#phoneStart").focus();
					 }
					 
					 return false;
				 }	
			 }
			 
			 function rgb2hex(rgb) {
			     if (  rgb.search("rgb") == -1 ) {
			          return rgb;
			     } else {
			          rgb = rgb.match(/^rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*(\d+))?\)$/);
			          function hex(x) {
			               return ("0" + parseInt(x).toString(16)).slice(-2);
			          }
			          return "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]); 
			     }
			}
			 	 
		});		
	});
</script>
</body>
</html>