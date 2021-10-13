<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항등록 폼</title>
</head>
<body>
<div align="center">
	<div><h1>공지사항 등록</h1></div>
	<div>
		<form id="frm" name="frm" action="noticeInsert.do" method="post" enctype="multipart/form-data">
			<div>
			<table border="1">
				<tr>
					<th width="100">작성일자</th>
					<td width="200"><input type="date" id="writeDate" name="writeDate"></td>
				</tr>
				<tr>
					<th width="100">제목</th>
					<td width="200"><input type="text" id="title" name="title" size="50"></td>
				</tr>	
				<tr>
					<th width="100">내용</th>
					<td width="200"><textarea rows="5" cols="53" name="contents"></textarea></td>									
				</tr>	
				<tr>
					<th>첨부파일</th>
					<td><input type="file" id="attchfile" name="attchfile"></td>
				</tr>	
			</table>
			</div><br>
			<div>
				<input type="submit" value="등록">
			</div>		
		</form>
	</div>
</div>
</body>
</html>