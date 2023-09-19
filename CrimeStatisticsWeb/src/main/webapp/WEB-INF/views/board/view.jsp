<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>  
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시물 조회</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="icon" type="image/x-icon" href="/img/favicon.ico">
    
    <!-- 부트스트랩 CSS 링크 추가 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        input { height: 32px; }
        
        /* 이하의 스타일은 부트스트랩 클래스와 함께 사용되도록 수정 */
        #table th:nth-of-type(1) { width: 15%; }
        #table td:nth-of-type(1) { width: 35%; }
        #table th:nth-of-type(2) { width: 15%; }
        #table td:nth-of-type(2) { width: 35%; }
        
        input[type=text] { width: 100%; }
        textarea { width: 100%; height: 300px; padding: 10px; }
        #td_ta {
            height: 300px;
            vertical-align: baseline;
        }
    </style>
    <!-- 부트스트랩 JavaScript 및 jQuery 추가 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
    <main class="container mt-5">
            <caption>
                <h2 style="text-align: center; padding:20px;">게시물 내용보기</h2>
            </caption>
        <table class="table">
            <tr>
                <th>글번호</th>
                <td>${ vo.bnum }</td>
                <th>조회수</th>
                <td>${ vo.readcount }</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${ vo.writer }</td>
                <th>날짜</th>
                <td>${ vo.regdate }</td>
            </tr>
            <tr>
                <th>제목</th>
                <td colspan="3">${ vo.title }</td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3" id="td_ta">${ vo.cont }</td>
            </tr>
            <tr>
                <td colspan="4" style="text-align:left">
                    <a href="/board/writeform?menu_id=${ vo.menu_id }" class="btn btn-primary">새글쓰기</a>
                    <a href="/board/updateform?menu_id=${ vo.menu_id }&bnum=${ vo.bnum }" class="btn btn-secondary">수정</a>
                    <a href="/board/delete?menu_id=${ vo.menu_id }&bnum=${ vo.bnum }" class="btn btn-danger">삭제</a>
                    <a href="/board/list?menu_id=${ vo.menu_id }" class="btn btn-info">목록으로</a>
                    <a href="javascript:history.back()" class="btn btn-light">이전으로</a>
                </td>
            </tr>
        </table>
<!-- 댓글 -->
<h3>댓글</h3>
<div id="reply">
    <ol class="replyList list-unstyled">
        <c:forEach items="${replyList}" var="reply">
            <li class="mb-4">
                <div class="card">
                    <div class="card-body">
                        <p class="card-text">
                            <strong>작성자:</strong> ${reply.writer}<br />
                            <strong>작성 날짜:</strong> <fmt:formatDate value="${reply.regdate}" pattern="yyyy-MM-dd" />                            
                        </p>
                        <p class="card-text">${reply.cont}</p>
                        <a href="" class="btn btn-light">수정</a>
                        <a href="/reply/delete?rnum=${reply.rnum}&bnum=${reply.bnum}" class="btn btn-light">삭제</a>
                    </div>
                </div>
            </li>
        </c:forEach>
    </ol>
</div>
<div>
    <form method="post" action="/reply/write">
        <div class="mb-3">
            <label for="writer" class="form-label">댓글 작성자</label>
            <input type="text" class="form-control" id="writer" name="writer" required>
        </div>
        <div class="mb-3">
            <label for="cont" class="form-label">댓글 내용</label>
            <textarea class="form-control" id="cont" name="cont" rows="4" required></textarea>
        </div>
        <input type="hidden" name="bnum" value="${vo.bnum}">
        <div class="mb-3">
            <button type="submit" class="btn btn-primary">댓글 작성</button>
        </div>
    </form>
</div>
    </main>
 

</body>
</html>
