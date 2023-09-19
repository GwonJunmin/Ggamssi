<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>  
    
<!DOCTYPE html>
<html>
<head>
  <title>Insert title here</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" type="image/x-icon" href="/img/favicon.ico">

  <!-- Add Bootstrap CSS link -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
  <!-- 게시물 목록 -->
  <div class="container mt-5">
    <h2 class="text-center">게시판</h2>
    <div class="text-end">
      <a href="/board/writeform?menu_id=${vo.menu_id}" class="btn btn-primary">새글 쓰기</a>
      <a href="/" class="btn btn-primary">메인</a>
    </div>
    <table class="table table-striped">
      <thead>
        <tr>
          <th scope="col">번호</th>
          <th scope="col">제목</th>
          <th scope="col">글쓴이</th>
          <th scope="col">날짜</th>
          <th scope="col">조회수</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="board" items="${boardList}">
          <tr>
            <th scope="row">${board.bnum}</th>
            <td>
              <a href="/board/view?bnum=${board.bnum}">
                ${board.title}
              </a>
            </td>
            <td>${board.writer}</td>
            <td>${board.regdate}</td>
            <td>${board.readcount}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

  <!-- Add Bootstrap JavaScript and Popper.js -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>






