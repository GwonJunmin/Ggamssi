<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="/img/favicon.ico">
<style>
   .tr_header { 
      background-color : black;
      color :white;
   }
   .tr_header > td {
      text-align :center;
      font-weight : bold;
   }
   td {
      text-align :center;
      font-weight : bold;
   }
</style>
</head>
<body>
   <main>
   	 <h2>메뉴 목록</h2>
   	  
   	 <table>   	  
   	   <tr>
   	     <td colspan="5" style="text-align:right;padding-right:30px;">
   	       <a href="/menus/writeform">[메뉴등록]</a>
   	       <a href="/">[Home]</a>
   	     </td>
   	   </tr>
   	   <tr class="tr_header">
   	     <td>Menu_id</td>
   	     <td>Menu_Name</td>
   	     <td>Menu_Seq</td>
   	     <td>삭제</td>
   	     <td>수정</td>
   	   </tr>
   	   <c:forEach var="menu"  items="${menuList}" >
   	   <tr>
   	     <td>${ menu.menu_id   }</td>
   	     <td>${ menu.menu_name }</td>
   	     <td>${ menu.menu_cate  }</td>
   	     <td><a href="/menus/delete?menu_id=${ menu.menu_id }">삭제</a></td>
   	     <td><a href="/menus/updateform?menu_id=${ menu.menu_id }">수정</a></td>
   	   </tr>
   	   </c:forEach>
   	   
   	 </table> 
   	  
   </main>
   
</body>
</html>










