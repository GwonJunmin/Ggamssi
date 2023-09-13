<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="/img/favicon.ico">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>home</title>
<style>
  .svg-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 45vh; /* 원하는 높이로 조정하세요 */
  }
</style>
</head>
<body>
	<header><%@ include file="template/header.jsp"%></header>
	
	<div class="svg-container">
		<object data="/img/southKoreaHigh.svg" width="500" height="800"></object>
	</div>

	<footer><%@ include file="template/footer.jsp"%></footer>
</body>
</html>
