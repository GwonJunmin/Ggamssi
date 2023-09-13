<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="icon" type="image/x-icon" href="/img/favicon.ico">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<style>
.modal-dialog {
        max-width: 40%;
    }

    .modal-content {
        height: 20vh;
    }
    
    #passwordModal .modal-content {
        height: 30vh;
    }
</style>
</head>
<body>
	<header><%@ include file="../template/header.jsp"%></header>
	<main style="text-align: center; margin-top: 200px; margin-bottom: 150px;">
		<h2>Login</h2>
		<br />
		<br />
		<form id="loginForm" action="/member/login" method="post">
			<div>아이디</div>
			<input type="text" name="memberid" autocomplete="off"
				placeholder="아이디를 입력해주세요." /><br /> <br />
			<div>비밀번호</div>
			<input type="password" name="passwd" autocomplete="off"
				placeholder="비밀번호를 입력해주세요." /><br /> <span id="loginCheck"
				style="font-size: 10px;"></span><br /> <input type="submit"
				class="btn btn-primary" value="로그인">
		</form>
		<button type="button" class="btn btn-primary"
			onclick="location.href='/member/signup-page'">회원가입</button>
		<div>
			<button type="button" class="btn btn-link" data-bs-toggle="modal"
				data-bs-target="#exampleModal" data-bs-whatever="@mdo">아이디
				찾기</button>
			&nbsp;|
			<button type="button" class="btn btn-link" data-bs-toggle="modal"
				data-bs-target="#passwordModal" data-bs-whatever="@fat">비밀번호
				찾기</button>
		</div>
	</main>
	<div class="modal fade custom-modal" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">아이디 찾기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<input type="text" name="emailId" id="emailId" autocomplete="off"
						placeholder="아이디" required />@ <input type="text"
						name="emailDomain" id="emailDomain" value="" placeholder="도메인"
						required /> <select
						onclick="setEmailDomain(this.value);return false;">
						<option value="">--직접입력--</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="korea.com">korea.com</option>
						<option value="nate.com">nate.com</option>
						<option value="yahoo.com">yahoo.com</option>
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" onclick="sendEmail()">Send
						email</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ------------- -->
	<div class="modal fade custom-modal" id="passwordModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호 찾기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div><br/>
				<div class="modal-body text-center">
					<input type="text" name="memberid" id="memberid" value=""
						placeholder="아이디 입력" />
					<button type="button" onclick="findPassword()">찾기</button>
					<br />
					<br /> <input type="text" name="passwd" id="passwd" value=""
						readonly />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<footer><%@ include file="../template/footer.jsp"%></footer>

	<script>
		$(document).ready(function() {
			$('#loginForm').submit(function(event) {
				// 폼 제출 기본 동작 막기
				event.preventDefault();

				// 폼 데이터 가져오기
				var formData = $(this).serialize();

				$.ajax({
					type : 'POST',
					url : '/member/login',
					data : formData,
					success : function(response) {
						window.location.href = '/';
					},
					error : function(xhr, status, error) {
						$('#loginCheck').html('아이디 또는 비밀번호가 맞지 않습니다.');
						$('#loginCheck').css('color', 'red');
					}
				})
			})
		})

		// 이메일
		function setEmailDomain(domain) {
			$("#emailDomain").val(domain);
		}

		function sendEmail() {
			var emailId = $("#emailId").val();
			var emailDomain = $("#emailDomain").val();

			if (!emailId) {
				alert("이메일을 입력해주세요");
				$("#emailId").focus();
				return false;
			} else if (!emailDomain) {
				alert("도메인을 입력해주세요");
				$("#emailDomain").focus();
				return false;
			}

			let email = emailId + '@' + emailDomain; //입력한 이메일
			// $("#email").val(email);

			$.ajax({
				url : "/id-mailSender",
				type : "get",
				data : {
					'email' : email
				},
				success : function(memberid) {
					//alert("s");
					alert("기입하신 이메일로 인증번호를 전송했습니다.");
				},
				error : function() {
					alert("에러입니다. 다시 시도해주세요");
				}
			});
		}
		
		function findPassword() {
			var memberid = $("#memberid").val();
		    
		    if (!memberid) {
		        alert('아이디를 입력하세요');
		        $("#memberid").focus();
		        return false;
		    }
		    
		    $.ajax({
		        type : "POST",
		        url : "/member/find-password",
		        data : {"memberid" : memberid},
		        success : function(password) {
		            $("#passwd").val(password);
		        },
		        error : function() {
		            alert("에러입니다. 다시 시도해주세요");
		        }
		    });
		}
	</script>
</body>
</html>