<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon" href="/img/favicon.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css" />

<style>
   td:first-child { width: 20%;  }
   td:last-child  { width: 80%;  }
   input[type=text], input[type=number] { width : 100%; }
</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<title>메뉴 등록</title>
</head>
<body>
  <main>
    <h2>메뉴 등록</h2>
    <form action="/menus/update" method="POST">
     <!--  table>tr*4>td*2 -->
     <table>
     	<tr>
     		<td>메뉴 이름</td>
     		<td><input type="text" name="menu_name" /></td>
     	</tr>
     	<tr>
     		<td>메뉴 카테고리</td>
     		<td><input type="number" name="menu_cate" min="1" max="2"/></td>
     	</tr>
     	<tr>
     		<td colspan="2">
     		<input type="submit" class="btn btn-primary btn-sm" value="등록" />
     		</td>
     	</tr>
     	
     </table>
    </form>
  
  </main> 
</body>
</html>












