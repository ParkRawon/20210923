<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">//파일다운로드호출
   function fileDown(str) {      
      frm.file.value= str;
      frm.submit();
      
   }
</script>
</head>
<body>
   <div align="center">
      <div>
         <h1>게시글목록</h1>
      </div>
      <div>
         <table border="1">
            <tr>
               <th width="70">번호</th>
               <th width="100">작성자</th>
               <th width="200">제목</th>
               <th width="100">작성일자</th>
               <th width="100">첨부파일</th>
               <th width="70">조회수</th>
            </tr>
            <c:forEach var="notice" items="${notices }">
            <tr>
               <th width="70">${notice.id }</th>
               <th width="100">${notice.writer }</th>
               <th width="200">${notice.title }</th>
               <th width="100">${notice.writeDate }</th>
               <th>
               	<c:if test="${not empty notice.fileName }">
               		<img src="img/down.png" width="13" height="13" onclick="fileDown('${notice.fileName}')">
               		&nbsp;${notice.fileName }
               	</c:if>
               </th>
               <th width="70">${notice.hit }</th>
            <tr/>
            </c:forEach>
         </table>
      </div><br/>
      <div>
         <form id="frm" name="frm" action="noticeDownLoad.do" method="post">
            <input type="hidden" id="file" name="file">
         </form>
      </div>
   </div>
</body>
</html>