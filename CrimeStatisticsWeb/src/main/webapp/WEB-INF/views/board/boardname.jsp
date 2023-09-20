<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon" href="images/favicon.ico">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
  <!-- 게시물 목록 -->
    <div class="container mt-5">
    <c:choose>
    <c:when test="${vo.menu_id eq 1 }">
    <h2 class="text-center"> 자유 게시판</h2>
    </c:when>
    <c:when test="${vo.menu_id eq 2 }">
    <h2 class="text-center"> 서울 게시판</h2>
    </c:when>
    <c:when test="${vo.menu_id eq 3 }">
    <h2 class="text-center"> 부산 게시판</h2>
    </c:when>
    <c:when test="${vo.menu_id eq 4 }">
    <h2 class="text-center"> 대구 게시판</h2>
    </c:when>
    <c:when test="${vo.menu_id eq 5 }">
    <h2 class="text-center"> 인천 게시판</h2>
    </c:when>
    <c:when test="${vo.menu_id eq 6 }">
    <h2 class="text-center"> 광주 게시판</h2>
    </c:when>
    <c:when test="${vo.menu_id eq 7 }">
    <h2 class="text-center"> 대전 게시판</h2>
    </c:when>
    <c:when test="${vo.menu_id eq 8 }">
    <h2 class="text-center"> 울산 게시판</h2>
    </c:when>
    <c:when test="${vo.menu_id eq 9 }">
    <h2 class="text-center"> 경기 게시판</h2>
    </c:when>
    <c:when test="${vo.menu_id eq 10 }">
    <h2 class="text-center"> 강원 게시판</h2>
    </c:when>
    <c:when test="${vo.menu_id eq 11 }">
    <h2 class="text-center"> 충북 게시판</h2>
    </c:when>
    <c:when test="${vo.menu_id eq 12 }">
    <h2 class="text-center"> 충남 게시판</h2>
    </c:when>
    <c:when test="${vo.menu_id eq 13 }">
    <h2 class="text-center"> 전북 게시판</h2>
    </c:when>
    <c:when test="${vo.menu_id eq 14 }">
    <h2 class="text-center"> 전남 게시판</h2>
    </c:when>
    <c:when test="${vo.menu_id eq 15 }">
    <h2 class="text-center"> 경북 게시판</h2>
    </c:when>
    <c:when test="${vo.menu_id eq 16 }">
    <h2 class="text-center"> 경남 게시판</h2>
    </c:when>
    <c:when test="${vo.menu_id eq 17 }">
    <h2 class="text-center"> 제주 게시판</h2>
    </c:when>
    </c:choose>
    </div>
    <div class="text-end" style="width:95%;margin:auto;">    
      <a href="/board/writeform?menu_id=${vo.menu_id}" class="btn btn-primary">새글 쓰기</a>
      <a href="/" class="btn btn-primary">메인</a>
    </div>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>