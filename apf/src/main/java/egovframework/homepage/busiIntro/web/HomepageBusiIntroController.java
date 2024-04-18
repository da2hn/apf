package egovframework.homepage.busiIntro.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.rte.psl.dataaccess.util.EgovMap;


@Controller
public class HomepageBusiIntroController {
	
	// 시군지원사업 페이지
	@RequestMapping(value = "/sigunSupport.do")
	public String sigunSupport(HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		return "/businIntro/sigunSupport.page";
	}
	
	// 24시 노인온상담 페이지
	@RequestMapping(value = "/noin24.do")
	public String noin24(HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		return "/businIntro/noin24.page";
	}
	
	// 중장년 마음돌봄 전화상담사업 페이지
	@RequestMapping(value = "/middleCns.do")
	public String middleCns(HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		return "/businIntro/middleCns.page";
	}
	
	// 성인지 교육사업 페이지
	@RequestMapping(value = "/genderEdu.do")
	public String genderEdu(HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		return "/businIntro/genderEdu.page";
	}
	
	/*// 교육사업 페이지
	@RequestMapping(value = "/eduBusin.do")
	public String eduBusin(HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		return "homepage/businIntro/eduBusin";
	}
	
	// 홍보사업 페이지
	@RequestMapping(value = "/linkBusin.do")
	public String linkBusin(HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		return "homepage/businIntro/linkBusin";
	}
	
	// 연계협력사업 페이지
	@RequestMapping(value = "/publicBusin.do")
	public String publicBusin(HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		return "homepage/businIntro/publicBusin";
	}*/
	
	// 센터사업소개
	@RequestMapping(value = "/busiIntroList.do")
	public String busiIntroList(HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		String gubun = request.getParameter("gubun");
		
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		model.addAttribute("gubun", gubun);
		return "/businIntro/busiIntroList.page";
	}
	
}