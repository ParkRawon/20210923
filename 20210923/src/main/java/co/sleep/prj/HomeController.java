package co.sleep.prj;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {
	
	
	@RequestMapping("/home.do")
	public String home(Locale locale, Model model) {
		
		return "home/home";
	}
	
//	@RequestMapping("/ajaxTest.do")
//	public String ajaxTest() {  //ajax 페이지 호출
//		
//		return "notice/testAjax";
//	}
	
}
