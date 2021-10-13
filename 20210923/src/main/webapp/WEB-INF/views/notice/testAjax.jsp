<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-latest.min.js"></script>
<script>
	$.ajax({
		url : "js/MOCK_DATA.json", //요청할 페이지(url)
		dataType :"json", //결과받은 datatype ex)xml,html,text,json:{key,value}	
		success : function(data){ 
			<!-- 성공했을때 처리할 방법 -->
			if(data.length > 0){  //data가 잘담겨있다면
				var tb = $("<table/>"); //selector 역활
				var row = $("<tr/>").append(  //row변수를 선언해서 담아주고
						$("<th/>").text("id"),
						$("<th/>").text("first_name"),
						$("<th/>").text("last_name"),
						$("<th/>").text("email"),
						$("<th/>").text("gender")
					);
				tb.append(row);
				
				for(var i in data){  //var: 변수선언
					var $id = data[i].id;   //i 부터 찾아서 여기 변수에 담는다
					var $first_name = data[i].first_name;
					var $last_name = data[i].last_name;
					var $email = data[i].email;
					var $gender = data[i].gender;
					
					var row = $("<tr/>").append(
						$("<td/>").text($id),
						$("<td/>").text($first_name),
						$("<td/>").text($last_name),
						$("<td/>").text($email),
						$("<td/>").text($gender)
					);
					tb.append(row);   //td에 row를 담아준다
				}
				$(".warp").append(tb)  //class(.)명인 warp에 tb를 담아준다
			}
		},
		error : function(){
			<!-- 실패했을때 처리할 방법 -->
		}
	});
</script>
</head>
<body>
<div align="center">
	<div>
		<h3><label>ajax 호출</label></h3>		
	</div>
	<div class="warp"></div>
</div>
</body>
</html>