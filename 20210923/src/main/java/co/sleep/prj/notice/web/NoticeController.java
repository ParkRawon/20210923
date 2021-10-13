package co.sleep.prj.notice.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.sleep.prj.notice.service.NoticeService;
import co.sleep.prj.notice.vo.NoticeVO;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeDao;
	
	@Autowired
	private String filePath; //개발시 파일이 저장될 경로(절대경로), 하드에 저장
	
	@RequestMapping("/noticeSelectList.do")
	private String noticeSelectList(Model model) {
		model.addAttribute("notices", noticeDao.noticeSelectList());
		
		return "notice/noticeSelectList";
	}
	
	@RequestMapping("/noticeInsert.do")
	private String noticeInsert(MultipartFile attchfile, NoticeVO notice, Model model, HttpServletRequest request) {
		String fileName = attchfile.getOriginalFilename();
//		String filePath = request.getServletContext().getRealPath("/"); //서버에서 파일 저장 경로
//		filePath = filePath + "fileUp";   //파일이 저장될 최종 폴더
		
		File fileSave = new File(filePath,fileName);
		
		notice.setFileName(fileName);
		notice.setWriter("park");
		
		try {
			attchfile.transferTo(fileSave);  //파일업로드
			if(fileSave.exists()) {
				noticeDao.noticeInsert(notice);
				model.addAttribute("message", "전송성공");
			}else {
				model.addAttribute("message", "전송실패");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "notice/noticeInsertResult";
	}
	
	@RequestMapping("/noticeForm.do")
	private String noticeForm() {
		return "notice/noticeForm";
	}
	
//	@RequestMapping("/noticeDownLoad.do")  //이미지 다운로드 하기
//	@ResponseBody
//	private String noticeDownLoad(HttpServletRequest request, HttpServletResponse response) {
//		String fileName = "b.jpg";
//		String FILE_URL = request.getServletContext().getRealPath("/");
//		FILE_URL = FILE_URL + "fileUp//" ;
//		try {
//			OutputStream os = response.getOutputStream();
//			File file = new File(FILE_URL, fileName);
//			response.setHeader("Cache-Control", "no-cache");
//			response.addHeader("Content-disposition", "attachment; fileName=" + fileName);
//			InputStream in = new FileInputStream(file);
//			byte[] buffer = new byte[1024*1024];
//			while(true) {
//				int count = in.read(buffer);
//				if(count<0) {
//					break;
//				}
//				os.write(buffer, 0 , count);  //실제 다운로드 되는 부분
//			}
//			os.close();
//			in.close();
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//		return null;   //아무것도 안돌려 준다.
//	}	
	
	   @RequestMapping("/noticeDownLoad.do")   //파일 다운로드 하기
	   @ResponseBody
	   String noticeDownLoad(HttpServletRequest request, HttpServletResponse response) {
	      String fileName = request.getParameter("file");
	      String FILE_URL = request.getServletContext().getRealPath("/");   //severpath 찾기
	      FILE_URL = FILE_URL + "fileUp";
	      try{
	         OutputStream os = response.getOutputStream();  //파일출력 객체
	         File file = new File(FILE_URL, fileName);
	         response.setHeader("Cache-Control", "no-cache");
	         response.setHeader("content-disposition", "attachment; fileName" +fileName);
	         FileInputStream in = new FileInputStream(file);  //파일입력 객체
	         byte[] buffer = new byte[1024*1024];  //한번에 읽는 패킷사이즈
	         while(true) {
	            int count= in.read(buffer);
	            if(count < 0) {  //eof를 비교 -1이 리턴
	               break;
	            }
	            os.write(buffer, 0, count); //실제 다운로드 되는 부분
	            }
	         os.close();
	         in.close();
	      }catch(Exception e){
	         e.printStackTrace();
	      }
	      return null;
	   }
	
}	

