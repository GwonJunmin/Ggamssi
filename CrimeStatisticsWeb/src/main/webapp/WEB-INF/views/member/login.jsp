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
  .section {
    display: flex;
    border: 1px solid #ccc; /* 선으로 나누기 */
    border-bottom: none; /* 밑에 부분 선을 제거합니다. */
  }

  .column {
    flex: 1;
    padding: 10px;
    cursor: pointer;
    text-align: center;
  }

  .themeSolid {
    background-color: #f0f0f0; /* 배경색 설정 */
  }

  .selected {
    border-right: 2px solid #007bff; /* 선택된 탭의 오른쪽에 파란색 선 추가 */
  }
  

  body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
  }

  main {
    text-align: center;
    margin-top: 50px;
    margin-bottom: 50px;
  }

  h2 {
    color: #333;
  }

  form {
    background-color: #fff;
    border: 1px solid #ccc;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 50%;
    margin: 0 auto;
  }

  form div {
    margin-bottom: 0px;
  }

  input[type="text"],
  input[type="password"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
  }

  #loginCheck {
    color: red;
    font-size: 14px;
  }

  input[type="submit"],
  button.btn-primary {
    background-color: #333;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
  }

  button.btn-primary#signup-btn {
    display: block;
    margin: 0 auto;
  }
  
  button.btn-link {
    background: none;
    border: none;
    color: #333;
    cursor: pointer;
    font-size: 14px;
  }

  .modal-dialog {
    max-width: 40%;
  }

  .modal-content {
    height: 20vh;
  }

  #passwordModal .modal-content {
    height: 30vh;
  }
  
 	 #id {
 	   text-align: left;
	}
	
	#pwd {
       text-align: left;
	}
	.custom-modal.modal-lg {
    /* 원하는 배경색 지정 */
    background-color: #f0f0f0;
    /* 테두리 스타일 설정 */
    border: 2px solid #333;
    /* 모서리를 둥글게 만듭니다. */
    border-radius: 10px;
    /* 패딩을 추가하여 내용과의 간격 조정 */
    padding: 20px;
    /* 너비 및 높이 설정 */
    width: 80%;
    height: 80%;
    /* 화면 중앙에 위치하도록 설정 */
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    /* 화면 위에 겹쳐질 수 있도록 z-index 설정 */
    z-index: 9999;
    
}

/* .modal-body 스타일 */
.modal-body {
    /* 내용의 여백 조정 */
    padding: 20px;
    /* 텍스트 스타일 지정 (예: 글자색과 글꼴) */
    color: #333;
    font-family: Arial, sans-serif;
    /* 배경색 설정 */
    background-color: #fff;
    /* 모서리를 둥글게 만듭니다. */
    border-radius: 5px;
    
}

/* 모달 내부의 스크롤바가 필요하다면 아래와 같이 설정할 수 있습니다. */
.custom-modal.modal-lg {
    /* 오버플로우 스크롤을 허용합니다. */
    overflow: auto;
}
.modal-footer {
  /* 원하는 높이(px)로 조정하세요 */
  height: 50px; /* 예: 50px로 설정 */
}

</style>

<script>
  function changeLogin(tab) {
    if (tab === '1') {
      // 대표운영자 탭 선택 시 실행할 코드
      // 여기에 대표운영자 탭 내용을 보여주는 코드 추가
      location.href='/admin/login-page';
      document.getElementById('representativeTabContent').style.display = 'block';
      document.getElementById('generalUserTabContent').style.display = 'none';  
    } else {
      // 일반인 탭 선택 시 실행할 코드
      // 여기에 일반인 탭 내용을 보여주는 코드 추가
      location.href='/member/login-page';
      document.getElementById('representativeTabContent').style.display = 'none';
      document.getElementById('generalUserTabContent').style.display = 'block';
    }
  }
</script>
</head>
<body style="background-color: #cccccc;">
	<header><%@ include file="../template/header.jsp"%></header>
<main style="text-align: center; height: 100%; margin-top: 130px;">
		
		<form id="loginForm" action="/member/login" method="post" style = "width:500px; height:100%;" >
		     <h1>Login</h1>
		     <br>
			<div class="section">
				<div class="column themeSolid" onclick="changeLogin('1');">
					대표운영자</div>
				<div class="column" onclick="changeLogin('2');">일반인</div>
			</div>
			<br>
			
			<div id = "id">아이디</div>
			<input type="text" name="memberid" autocomplete="off"
				placeholder="아이디를 입력해주세요." /><br /> <br />
			<div id = "pwd">비밀번호</div>
			<input type="password" name="passwd" autocomplete="off"
				placeholder="비밀번호를 입력해주세요." /><br /> <span id="loginCheck"
				style="font-size: 10px;"></span><br /> <input type="submit"
				class="btn btn-primary" value="로그인" style ="width:457px;">
				<br>
				<br>
				<button type="button" class="btn btn-primary" style ="width:457px;"
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
		</form>
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
				<div class="modal-body" style = "height: 1000px;">
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
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		style="height:2.0;">
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
						data-bs-dismiss="modal"  style="margin-top:14px">취소</button>
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal"  style="margin-top:14px">확인</button>
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
		
		// 비밀번호 찾기
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
		        	if (password == "null") {
		        		alert("입력하신 아이디가 존재하지 않습니다");
		        	} else {
		        		$("#passwd").val(password);
		        	}
		        },
		        error : function() {
		            alert("에러입니다. 다시 시도해주세요");
		        }
		    });
		}
	</script>
</body>
</html>