<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록</title>

<!-- 부트스트랩 5 CSS 링크 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
  <!-- 부트스트랩 5 JavaScript 및 Popper.js 추가 -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@2.11.6/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"></script>

</head>
<body>
<header><%@ include file="../template/header.jsp"%></header>
  <main class="container mt-5">
    <form action="/board/write" method="POST">
        <caption>
          <h2 style="text-align: center; padding:20px;">게시물 등록</h2>
          <input type="hidden" name="menu_id" value="${vo.menu_id }" />   
        </caption>
      <table class="table">
        <tr>
          <th>제목</th>
          <td><input type="text" class="form-control" name="title" required /></td>
        </tr>
        <tr>
          <th>글쓴이</th>
          <td><input type="text" class="form-control" name="writer" required /></td>
        </tr>
        <tr>
          <th>내용</th>
          <td><textarea class="form-control" name="cont" rows="10" required></textarea></td>
        </tr>  
        <tr>
          <td colspan="2">
            <button type="submit" class="btn btn-primary">등록</button>
          </td>
        </tr>
      </table>
    </form> 
  </main>

</body>
</html>