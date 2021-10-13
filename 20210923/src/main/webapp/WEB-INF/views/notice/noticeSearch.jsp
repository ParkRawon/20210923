<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 검색</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
	$("#keyId").click(function(){   //#keyId가 클릭된다면
		frm.action = "bSearch.do";
		frm.submit();
	});
	
	$("#wKeyId").click(function(){
		frm.action = "wSearch.do";
		frm.submit();
	});
 });
</script>
</head>
<body>
	<div align="center">
		<div><h1>게시글 검색</h1></div>
		<div>
			<form id="frm" action="" method="post">
				<label>검색할 ID 입력:</label>
				<input type="text" id="bid" name="bid">
				<button type="button" id="keyId">검색</button><br>
				
				<label>검색할 작성자 입력: </label>
				<input type="text" id="userId" name="userId">
				<button type="button" id="wKeyId">검색</button>
			</form>
		</div>
	</div>
</body>
</html>