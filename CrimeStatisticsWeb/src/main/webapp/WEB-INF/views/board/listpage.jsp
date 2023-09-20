<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %> 
  
    
<!DOCTYPE html>
<html>
<head>
  <title>게시판</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" type="image/x-icon" href="/img/favicon.ico">

  <!-- Add Bootstrap CSS link -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  <style></style>
</head>
<body>
<header><%@ include file="../template/header.jsp"%></header>

  <!-- 게시물 목록 -->
  <%@ include file="../board/boardname.jsp" %>

    <table class="table table-hover" style="width:95%; margin:auto;">
      <thead>
        <tr>          
          <th scope="col">글번호</th>
          <th scope="col">제목</th>
          <th scope="col">글쓴이</th>
          <th scope="col">날짜</th>
          <th scope="col">조회수</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="board" items="${boardList}">
          <tr>
          <td>${board.bnum}</td>            
            <td>
              <a href="/board/view?bnum=${board.bnum}" style="text-decoration: none;">
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
<!-- 페이징 -->
<div class="text-center mt-4">
   <ul class="pagination justify-content-center" id="paging">
    <c:if test="${pageMaker.prev}">
     <li class="page-item">
        <a class="page-link" href="listpage${pageMaker.makeQuery(pageMaker.startPage - 1)}&menu_id=${vo.menu_id}">이전</a>
     </li>
    </c:if>   
    
    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
     <li class="page-item"><a class="page-link" href="listpage${pageMaker.makeQuery(idx)}&menu_id=${vo.menu_id}">${idx}</a></li>
    </c:forEach>      
    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
     <li class="page-item">
        <a class="page-link" href="listpage${pageMaker.makeQuery(pageMaker.endPage + 1)}&menu_id=${vo.menu_id}">다음</a>
     </li>
    </c:if>   
   </ul>
</div>

  <!-- Add Bootstrap JavaScript and Popper.js -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>






