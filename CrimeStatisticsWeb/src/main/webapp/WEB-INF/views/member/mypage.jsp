<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="imaga/x-icon" href="/img/favicon.ico">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>My Page</title>
</head>
<body>
	<header><%@ include file="../template/header.jsp"%></header>
	<main style="margin-left: 700px; margin-bottom: 150px;">
	<h2>My Page</h2>
		<form action="/member/modify" method="post">
			<div>이름</div>
			<input type="text" name="name" size="30" value="${member.name}" readonly disabled /><br /><br />
			<div>아이디</div> 
			<input type="text" name="memberid" id="memberid" value="${member.memberid}" minlength="8" maxlength="16" size="30" readonly disabled /><br /><br />
			<input type="hidden" name="memberid" value="${member.memberid}" />
			<div>현재 비밀번호</div> 
			<input type="password" name="passwd" id="password" size="30" value="" /> <br />
			<span id="pwdcheck_blank" style="font-size: 10px;"></span><br />
			<div>새 비밀번호</div> 
			<input type="password" name="newPasswd" id="newPassword" size="30" minlength="8" maxlength="16" autocomplete="off" placeholder="영문, 숫자, 특수문자 조합하여 8~16자" disabled required /> <br />
			<span id="pwdcheck_blank1" style="font-size: 10px;"></span><br />
			<div>새 비밀번호 확인</div>
			<input type="password" name="newPasswordCheck" id="newPasswordCheck" size="30" placeholder="비밀번호를 한번 더 입력해주세요" disabled required/> <br />
			<span id="pwdcheck_blank2" style="font-size: 10px;"></span><br />
			
			<div>닉네임</div>
			<input type="text" name="nickname" id="nickname" value="${member.nickname}" size="30" autocomplete="off" required />
			<button type="button" id="nicknameCheckDuplicate">중복확인</button><br /><br />
			
			<div>주소</div>
			<input type="text" name="address_postcode" size="30" value="${member.address_postcode}" placeholder="우편번호" readonly />
			<input type="button" value="주소검색" onclick="exePost()"><br />
			<input type="text" id="address_primary" name="address_primary" value="${member.address_primary}" size="50" placeholder="기본주소" readonly /><br />
			<input type="text" name="address_detail" size="50" value="${member.address_detail}" autocomplete="off" placeholder="상세 주소(선택 사항)"><br /><br />
			
			<div>이메일</div>
			<input type="text" name="emailId" id="emailId" value="${member.emailId}" autocomplete="off" placeholder="아이디" required />@
			<input type="text" name="emailDomain" id="emailDomain" value="${member.emailDomain}" placeholder="도메인" required />
			<select onclick="setEmailDomain(this.value);return false;">
				<option value="">--직접입력--</option>
			    <option value="naver.com">naver.com</option>
			    <option value="gmail.com">gmail.com</option>
			    <option value="hanmail.net">hanmail.net</option>
			    <option value="hotmail.com">hotmail.com</option>
			    <option value="korea.com">korea.com</option>
			    <option value="nate.com">nate.com</option>
			    <option value="yahoo.com">yahoo.com</option>
			</select>
			<input type="button" value="인증코드 발송" onclick="sendEmail()" /><br />
			<input type="text" id="codeInput" size="20" autocomplete="off" placeholder="인증번호 입력" disabled /><br />
			<span id="codecheck_blank" style="font-size: 10px;"></span> <br />
			<input type="radio" name="sex" value="남성" checked />남성 &nbsp;&nbsp;&nbsp;
			<input type="radio" name="sex" value="여성" />여성<br /><br />
			<input type="submit" value="수정" />&nbsp;&nbsp;<button type="button" onclick="location.href='/'">취소</button>&nbsp;&nbsp;
			<button type="button" onclick="confirmDelete()">탈퇴</button>
		</form>
	</main>
	
	<footer><%@ include file="../template/footer.jsp"%></footer>
	
	<script>
		let code = "";	// 이메일 인증코드
		
		function confirmDelete() {
			let result = confirm("정말로 탈퇴하시겠습니까?");
			if (result) {
				// 확인 누르면 회원 탈퇴
				location.href = '/member/delete';
			} else {
				// 취소 누르면 아무것도 하지 않음
			}
		}
		
		$("#password").blur(function() {
			let password = $(this).val(); // 비밀번호 값 가져오기
			
			if (password) {
				$.ajax({
					url: "/member/password-check",
					type: "post",
					data: {'password': password},
					success: function(response) {
						if (response == "success") {
							$("#newPassword").prop("disabled", false);
							$("#newPasswordCheck").prop("disabled", false);
							
							$("#pwdcheck_blank").css("color", "blue");
							$("#pwdcheck_blank").text("비밀번호가 일치합니다");
						} else if (response == "fail") {
							$("#pwdcheck_blank").css("color", "red");
							$("#pwdcheck_blank").text("비밀번호를 다시 입력하세요");
						}
					},
					error: function () {
						$("#pwdcheck_blank").css("color", "red");
		                $("#pwdcheck_blank").text("에러 발생");
					}
				});
			}
		});
		
		// 새 비밀번호 유효성 검사
		$("#newPassword").blur(function() {
		 	let pwdCheck= /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
		 	
		 	if ($("#newPassword").val() == "") {
		         $("#pwdcheck_blank1").css("color", "red");
		         $("#pwdcheck_blank1").text("비밀번호를 입력하세요");
		         newPassword = false;
		      }	
		      else if (!pwdCheck.test($("#newPassword").val())) {
			  	 $("#pwdcheck_blank1").css("color", "red");
			     $("#pwdcheck_blank1").text("비밀번호는 영문+숫자+특수문자 조합하여 8~16자리를 사용해야 합니다");
			     newPassword = false;
		      }else {
		    	  $("#pwdcheck_blank1").css("color", "blue");
				  $("#pwdcheck_blank1").text("안전한 비밀번호 입니다. 아래에 한번 더 입력하세요");
				  newPassword = true;
		      }
	 	});
	
		
		// 새 비밀번호 확인
		$("#newPasswordCheck").blur(function() {
			if($("#newPasswordCheck").val() == "") {
				$("#pwdcheck_blank2").css("color", "red");
		        $("#pwdcheck_blank2").text("필수정보입니다");
		        newPasswordCheck = false;
			}
			else if(newPassword == true && $("#newPassword").val() == $("#newPasswordCheck").val()) {
				$("#pwdcheck_blank2").css("color", "blue");
				$("#pwdcheck_blank2").text("비밀번호가 일치합니다!");
				newPasswordCheck = true;
			}else {
				$("#pwdcheck_blank2").css("color", "red");
				$("#pwdcheck_blank2").text("비밀번호를 다시 확인해주세요");
				$("#passwordCheck").val("");
				newPasswordCheck = false;
			}
		});
		
		// 닉네임 중복체크
		$(document).ready(function() {
			$("#nicknameCheckDuplicate").click(function() {
				var nickname = $("#nickname").val();	// 입력된 아이디 가져오기
				
				if (nickname == "") {
					alert("닉네임을 입력해주세요");
				} else {
					$.ajax({
						url: "/member/nickname-check-duplicate",
						type: "POST",
						data: {"nickname": nickname},
						success: function(response) {
							if (response == "duplicate") {
								alert("이미 사용 중인 닉네임입니다.");
								$("#nickname").val("");
							} else {
								alert("사용 가능한 닉네임입니다.");
							}
						},
						error: function() {
							alert("에러 발생. 다시 시도해주세요.");
						}
					})
				}
			})
		})
		
		// 주소
		function exePost() {
			 new daum.Postcode({
		         oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
		            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
		            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
		            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
		            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                extraRoadAddr += data.bname;
		            }
		            // 건물명이 있고, 공동주택일 경우 추가한다.
		            if(data.buildingName !== '' && data.apartment === 'Y'){
		               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		            }
		            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		            if(extraRoadAddr !== ''){
		                extraRoadAddr = ' (' + extraRoadAddr + ')';
		            }
		            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
		            if(fullRoadAddr !== ''){
		                fullRoadAddr += extraRoadAddr;
		            }
	
		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            console.log(data.zonecode);
		            console.log(fullRoadAddr);
		            
		            $("[name=address_postcode]").val(data.zonecode);
		            $("[name=address_primary]").val(fullRoadAddr);
		            
		            /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
		            document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
		            document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
		        }
		     }).open();
		}
		
		// 이메일
		function setEmailDomain(domain){
   	 	   $("#emailDomain").val(domain);
		}
		
		function sendEmail() {
			var emailRule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var emailId = $("#emailId").val();
			var emailDomain = $("#emailDomain").val();
			
			if(!emailId){
			    alert("이메일을 입력해주세요");
			    $("#emailId").focus();
			    return false;
			} else if (!emailDomain) {
				alert("도메인을 입력해주세요");
				$("#emailDomain").focus();
				return false;
			}
			
			let email = emailId + '@' + emailDomain;  //입력한 이메일
			// $("#email").val(email);
			
			if(!emailRule.test(email)){
			    alert("이메일을 형식에 맞게 입력해주세요.");
			    return false;
			}
			
			$.ajax({
				url: "/mailSender",
				type: "get",
				data: {'email':email},
				success: function(rnum) {
					//alert("s");
					alert("기입하신 이메일로 인증번호를 전송했습니다.");
					
					$("#codeInput").attr("disabled", false); //입력칸 활성화
					code = rnum;
				},
				error: function () {
					alert("fail");
				}
			});
		}
		
		$("#codeInput").blur(function() {
			
			console.log(code);
			if(code == $("#codeInput").val()) { //인증번호 같다면
				$("#codecheck_blank").css("color", "blue");
				$("#codecheck_blank").text("인증되었습니다.");
				email = true;
			}else {
				$("#codecheck_blank").css("color", "red");
				$("#codecheck_blank").text("인증번호를 다시 입력해주세요.");
				email = false;
			}
		});
	</script>
</body>
</html>