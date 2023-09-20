<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>게시물 수정</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="icon" type="image/x-icon" href="/img/favicon.ico">
    
    <!-- 부트스트랩 CSS 링크 추가 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
/*         input { height: 32px; }
        
        /* 이하의 스타일은 부트스트랩 클래스와 함께 사용되도록 수정 */
        #table th { width: 20%; }
        #table td { width: 80%; }
        input[type=text] { width: 100%; }
        textarea { width: 100%; height: 300px; padding: 10px; } */
    </style>
    <!-- 부트스트랩 JavaScript 및 jQuery 추가 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
    <main class="container mt-5">
        <form action="/board/update" method="POST">
            <input type="hidden" name="menu_id" value="${ vo.menu_id }" />
                <caption>
                    <h2 style="text-align: center; padding:20px;">게시물 수정</h2>
                </caption>
            <table class="table">
                <tr>
                    <th>글번호</th>
                    <td><input type="text" class="form-control" name="bnum" value="${ vo.bnum }" readonly /></td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td><input type="text" class="form-control" name="title" value="${ vo.title }"/></td>
                </tr>
                <tr>
                    <th>글쓴이</th>
                    <td><input type="text" class="form-control" value="${ vo.writer }" readonly /></td>
                </tr>
                <tr>
                    <th>날짜</th>
                    <td><input type="text" class="form-control" value="${ vo.regdate }" readonly /></td>
                </tr>
                <tr>
                    <th>조회수</th>
                    <td><input type="text" class="form-control" value="${ vo.readcount }" readonly /></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea class="form-control" name="cont" rows="10">${ vo.cont }</textarea></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" class="btn btn-primary" value="수정" />
                        <a href="/board/listpage?menu_id=${ vo.menu_id }" class="btn btn-secondary">목록</a>
                        <button type="button" class="btn btn-light" onclick="history.back()">이전으로</button>
                    </td>
                </tr>
            </table>
        </form> 
    </main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
