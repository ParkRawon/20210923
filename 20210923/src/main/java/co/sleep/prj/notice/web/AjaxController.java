package co.sleep.prj.notice.web;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnails;

@Controller  
public class AjaxController {
	
	@PostMapping("/uploadAjax.do")
	@ResponseBody
	private void uploadAjax(MultipartFile[] uploadFile) {  //폼에있는 이름	
		String uploadFolder = "d:\\fileUp";
		for(MultipartFile file : uploadFile) {
			String uploadFileName = file.getOriginalFilename();
			File saveFile = new File(uploadFolder, uploadFileName);
			try {
				file.transferTo(saveFile);   //파일저장
				if(checkImageType(saveFile)) {  //이미지 파일은 썸네일 파일도 함께 만든다. 
					File thumbnail = new File(uploadFolder, "s_" + uploadFileName); //저장할 파일명
					Thumbnails.of(saveFile)  //썸네일 만들 원본
							  .size(100,100)  //썸네일 사이즈
							  .toFile(thumbnail); //썸네일 파일명
					
					
				} //썸네일 end
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}  //uploadAjax.do end
	
	@RequestMapping("/ajaxUploadForm.do")
	public String ajaxUploadForm(){
		
		return "ajax/ajaxFileUpload";
	}
	
	private boolean checkImageType(File file) {  //이미지 파일인지 아닌지 비교
		try {
			String contentType = Files.probeContentType(file.toPath());	
			return contentType.startsWith("image");
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		return false;
	}
}
