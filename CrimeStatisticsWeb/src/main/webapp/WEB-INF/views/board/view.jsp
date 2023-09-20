<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!-- 부트스트랩 JavaScript 및 jQuery 추가 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<header><%@ include file="../template/header.jsp"%></header>
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
                <td colspan="3" id="td_ta" style="height:300px;">${ vo.cont }</td>
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
                                <a href="#" class="btn btn-secondary" data-toggle="modal" data-target="#editModal"
                                    data-bnum="${reply.bnum}" data-rnum="${reply.rnum}" data-writer="${reply.writer}" data-cont="${reply.cont}">수정</a>
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
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">댓글 수정</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- 수정 양식을 추가 -->
                    <form method="post" action="/reply/update">
                        <div class="mb-3">
                            <label for="editWriter" class="form-label">댓글 작성자</label>
                            <input type="text" class="form-control" id="editWriter" name="writer" required>
                        </div>
                        <div class="mb-3">
                            <label for="editCont" class="form-label">댓글 내용</label>
                            <textarea class="form-control" id="editCont" name="cont" rows="4" required></textarea>
                        </div>
                        <input type="hidden" name="bnum" id="editBnum" value=${reply.bnum }>
                        <input type="hidden" name="rnum" id="editRnum" value=${reply.rnum }>
                        <div class="mb-3">
                            <button type="submit" class="btn btn-primary">수정 완료</button>     
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>                       
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        $('#editModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var rnum = button.data('rnum');
            var bnum = button.data('bnum');
            var writer = button.data('writer');
            var cont = button.data('cont');
            var modal = $(this);
            modal.find('#editRnum').val(rnum);
            modal.find('#editBnum').val(bnum);
            modal.find('#editWriter').val(writer);
            modal.find('#editCont').val(cont);
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
