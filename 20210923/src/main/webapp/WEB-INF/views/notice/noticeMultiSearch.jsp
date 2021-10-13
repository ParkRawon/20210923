<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>게시글 다중 검색</title>
<script src="js/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){   //폼이 로드될때
		$("#btn").click(function(){  //클릭시
			$.ajax({
				url : "ajaxNoticeSearch.do", 
				type : "post",
				data: $("form[name=frm]").serialize(),  //form에 있는 name이름 전부다 연결해서 보내라
				dataType: "json",
				success : function(data){
				console.log(data);	
				if(data.length > 0){  //data가 잘담겨있다면
					var tb = $("<table border='1'/>"); //selector 역활
					var row = $("<tr/>").append(  //row변수를 선언해서 담아주고
							$("<th width='100'/>").text("id"),
							$("<th width='100'/>").text("writer"),
							$("<th width='150'/>").text("title"),
							$("<th width='100'/>").text("hit")
						);
					tb.append(row);
					
					for(var i in data){  //var: 변수선언
						var $id = data[i].id;   //i 부터 찾아서 여기 변수에 담는다
						var $writer = data[i].writer;
						var $title = data[i].title;
						var $hit = data[i].hit;
						
						var row = $("<tr/>").append(  
							$("<td width='100'/>").text($id),
							$("<td width='100'/>").text($writer),
							$("<td width='150'/>").text($title),
							$("<td width='100'/>").text($hit)
						);
						tb.append(row);   //td에 row를 담아준다
					}
					$(".warp").append(tb)  //class(.)명인 warp에 tb를 담아준다
				}
			},
			error : function(){
				<!-- 실패했을때 처리할 방법 -->
				alert("데이터 가져오기 실패!")
			}
		});
	});
});
	
</script>
</head>
<body>
<div align = "center">
	<div><h1>게시글 다중 검색</h1></div>  <!-- 작성자와 제목을 동시에 검색할수 있게 만들기 -->
	<div>
		<form name="frm">
			<label>검색선택: </label>
			<select style="width:200px" name="key" id="key">  <!-- (name)key의 값(value)= writer, title -->
    			<option value="writer">Writer</option>
    			<option value="title">Title</option> 			
  			</select>
  			<input type="text" id="keyValue" name="keyValue">
  			<button type="button" id="btn">Search</button> 
		</form>
	</div>
	<hr>
	<div class="warp"></div><br>  <!-- 검색결과 출력되는곳 -->
	
</div>
</body>
</html>