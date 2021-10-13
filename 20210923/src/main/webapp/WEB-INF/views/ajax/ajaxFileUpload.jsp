<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
//	$(document).ready(function(){
		//선택한 파일 보여주기
//		$("#uploadFile").change(function(){
//			var tb = $("<table border='1'/>");
//			var fileInput = $("input[name='uploadFile']");
//			var files = fileInput[0].files;
//			for(var i = 0; i<files.length; i++){
//				var row = $("<tr/>").append(
//					$("<tb width='150'/>").text(files[i].name));
//				tb.append(row);
//			}
//			$("#showFiles").append(tb);   //div class에 추가한다
//		});
//	});
		window.onload = function(){  //이렇게도 가능하다!!!
        target = document.getElementById('uploadFile');
        target.addEventListener('change', function(){
            fileList = "";
            for(i = 0; i < target.files.length; i++){
                fileList += target.files[i].name + '<br>';
            }
            target2 = document.getElementById('showFiles');
            target2.innerHTML = fileList;
        });
    }
		//파일 업로드 하기
		$(document).ready(function(){
		$("#uploadBtn").on("click", function(e){
			var formData = new FormData();  //폼 객체 생성
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;  //여러개 파일 올리기
			
			console.log(files);  //브라우저 개발자 모드 console에 출력
			
			for(var i = 0; i < files.length; i++){
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				url: "uploadAjax.do",
				 processData: false,
				 contentType: false,
				 data: formData,
				 type:"POST",
				 success: function(result){					
					// $("#uploadFile").val("");
					// $("#showFiles").empty();
					  alert("Uploaded");
				 }
			});  //.ajax end
		});
	});	
</script>
</head>
<body>
<div align="center">
	<div><h1>Upload with Ajax</h1></div>
	<div class="uploadDiv">
		<input type="file" name="uploadFile" id="uploadFile" multiple>
	</div>
	<div id="showFiles"></div>
	<button id="uploadBtn">Upload</button>
	
</div>
</body>
</html>