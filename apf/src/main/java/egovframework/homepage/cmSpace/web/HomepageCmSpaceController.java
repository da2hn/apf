package egovframework.homepage.cmSpace.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.annotation.Resource;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ams.cmm.AES256Crypto;
import egovframework.cmm.util.AES256Util;
import egovframework.homepage.cmSpace.service.CmSpaceVO;
import egovframework.homepage.cmSpace.service.HomepageCmSpaceService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller

public class HomepageCmSpaceController {
	
	/** homepageMainService */
	@Resource(name = "homepageCmSpaceService")
	private HomepageCmSpaceService homepageCmSpaceService;
	
	// 공지사항 목록
	@RequestMapping(value = "/noticeList.do")
	public String noticeList(CmSpaceVO vo, HttpServletRequest request, ModelMap model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		// 공지사항 목록 갯수
		int totalPageCnt = homepageCmSpaceService.getNoticeTotal(vo);
		paginationInfo.setTotalRecordCount(totalPageCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		// 공지사항 목록
		List<EgovMap> noticeList = homepageCmSpaceService.getNoticeList(vo);
		model.addAttribute("noticeList", noticeList);
		
		return "/comuSpace/noticeList.page";
	}
	
	// 공지사항 등록 페이지
	@RequestMapping(value = "/noticeWrite.do")
	public String noticeWrite(CmSpaceVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		String cnsrNm = (String)map.get("userNm");
		model.addAttribute("cnsrNm",cnsrNm);
		
		return "/comuSpace/noticeWrite.page";
	}
	
	// 공지사항 상세
	@RequestMapping(value = "/noticeDtl.do")
	public String noticeDtl(CmSpaceVO vo, HttpServletRequest request, ModelMap model) {
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		//String cnsrNm = (String)map.get("userNm");
		//model.addAttribute("cnsrNm",cnsrNm);
		
		// 공지사항 상세
		EgovMap notice = null;
		List<EgovMap> file = null;
		
		if(num !=""){
			// 공지사항 상세
			notice = homepageCmSpaceService.getNoticeDtl(vo);
			file = homepageCmSpaceService.getNoticeFileDtl(vo);
			
			model.addAttribute("notice",notice);
			model.addAttribute("file",file);
		}
		
		return "/comuSpace/noticeDtl.page";
	}
	
	// 공지사항 등록
	@RequestMapping(value = "/noticeReg.do")
	public String noticeReg(CmSpaceVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		vo.setRegId((String)map.get("userId"));
		// 공지사항 등록
		//homepageCmSpaceService.insertNoticeReg(vo);
		
		return "redirect:/gnoincoun/noticeList.do";
	}
	
	
	// 센터소식 목록
	@RequestMapping(value = "/centerNewsList.do")
	public String centerNewsList(CmSpaceVO vo,HttpServletRequest request, ModelMap model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		// 센터 목록 갯수
		int totalPageCnt = homepageCmSpaceService.getCenterNewsTotal(vo);
		paginationInfo.setTotalRecordCount(totalPageCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		// 센터 목록
		List<EgovMap> centerNewsList = homepageCmSpaceService.getCenterNewsList(vo);
		model.addAttribute("centerNewsList", centerNewsList);
		
		return "/comuSpace/centerNewsList.page";
	}
	
	// 센터소식 등록 페이지
	@RequestMapping(value = "/centerNewsWrite.do")
	public String centerNewsWrite(CmSpaceVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		String cnsrNm = (String)map.get("userNm");
		model.addAttribute("cnsrNm",cnsrNm);
		
		return "/comuSpace/centerNewsWrite.page";
	}
	
	// 센터소식 상세
	@RequestMapping(value = "/centerNewsDtl.do")
	public String centerNewsDtl(CmSpaceVO vo, HttpServletRequest request, ModelMap model) {
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");

		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		// 센터소식 상세
		EgovMap centerNews = null;
		List<EgovMap> file = null;
		
		if(num !=""){
			// 센터소식 상세
			centerNews = homepageCmSpaceService.getCenterNewsDtl(vo);
			file = homepageCmSpaceService.getCenterNewsFileDtl(vo);
			
			model.addAttribute("centerNews",centerNews);
			model.addAttribute("file",file);
		}
		
		return "/comuSpace/centerNewsDtl.page";
	}
	
	// 문서자료실 목록
	@RequestMapping(value = "/docLibraryList.do")
	public String docLibraryList(CmSpaceVO vo, HttpServletRequest request, ModelMap model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		// 문서자료실 목록 갯수
		int totalPageCnt = homepageCmSpaceService.getDocLibraryTotal(vo);
		paginationInfo.setTotalRecordCount(totalPageCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		// 문서자료실 목록
		List<EgovMap> docLibraryList = homepageCmSpaceService.getDocLibraryList(vo);
		model.addAttribute("docLibraryList", docLibraryList);
		
		return "/comuSpace/docLibraryList.page";
	}
	
	// 문서자료실 등록 페이지
	@RequestMapping(value = "/docLibraryWrite.do")
	public String docLibraryWrite(CmSpaceVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		String cnsrNm = (String)map.get("userNm");
		model.addAttribute("cnsrNm",cnsrNm);
		
		return "/comuSpace/docLibraryWrite.page";
	}
	
	// 문서자료실 상세
	@RequestMapping(value = "/docLibraryDtl.do")
	public String docLibraryDtl(CmSpaceVO vo, HttpServletRequest request, ModelMap model) {
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		// 문서자료실 상세
		EgovMap library = null;
		List<EgovMap> file = null;
		
		if(num !=""){
			// 센터소식 상세
			library = homepageCmSpaceService.getDocLibraryDtl(vo);
			file = homepageCmSpaceService.getDocLibraryFileDtl(vo);
			
			model.addAttribute("library", library);
			model.addAttribute("file", file);
		}
		
		return "/comuSpace/docLibraryDtl.page";
	}
	
	// 자유게시판 목록
	@RequestMapping(value = "/freeBoardList.do")
	public String freeBoardList(CmSpaceVO vo, HttpServletRequest request, ModelMap model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		// 자유게시판 목록 갯수
		int totalPageCnt = homepageCmSpaceService.getFreeBoardTotal(vo);
		paginationInfo.setTotalRecordCount(totalPageCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		// 자유게시판 목록
		List<EgovMap> freeBoardList = homepageCmSpaceService.getFreeBoardList(vo);
		model.addAttribute("freeBoardList", freeBoardList);
		
		return "/comuSpace/freeBoardList.page";
	}
	
	// 자유게시판 등록 페이지
	@RequestMapping(value = "/freeBoardWrite.do")
	public String freeBoardWrite(CmSpaceVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		String cnsrNm = (String)map.get("userNm");
		model.addAttribute("cnsrNm",cnsrNm);
		
		return "/comuSpace/freeBoardWrite.page";
	}
	
	// 자유게시판 상세
	@RequestMapping(value = "/freeBoardDtl.do")
	public String freeBoardDtl(CmSpaceVO vo, HttpServletRequest request, ModelMap model) {
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		// 자유게시판 상세
		EgovMap freeBoard = null;
		List<EgovMap> file = null;
		
		if(num !=""){
			// 자유게시판 상세
			freeBoard = homepageCmSpaceService.getFreeBoardDtl(vo);
			file = homepageCmSpaceService.getFreeBoardFileDtl(vo);
			
			model.addAttribute("freeBoard", freeBoard);
			model.addAttribute("file",file);
		}
		
		return "/comuSpace/freeBoardDtl.page";
	}
	
	// 자유게시판 등록
	@RequestMapping(value = "/freeBoardReg.do")
	public String freeBoardReg(CmSpaceVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		vo.setRegId((String)map.get("userId"));
		// 자유게시판 등록
		homepageCmSpaceService.insertFreeBoardReg(vo);
		
		return "redirect:/gnoincoun/freeBoardList.do";
	}
	
	// 온라인상담 목록
	@RequestMapping(value = "/onlineCnsList.do")
	public String onlineCnsList(CmSpaceVO vo, HttpServletRequest request, ModelMap model) {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		// 온라인상담 목록 갯수
		int totalPageCnt = homepageCmSpaceService.getOnlineCnsTotal(vo);
		paginationInfo.setTotalRecordCount(totalPageCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("vo", vo);
		
		String userId = map == null ? "" : (String)map.get("userId");
		model.addAttribute("userId",userId);
		
		// 온라인상담 목록
		List<EgovMap> onlineCnsList = homepageCmSpaceService.getOnlineCnsList(vo);
		model.addAttribute("onlineCnsList", onlineCnsList);
		
		return "/comuSpace/onlineCnsList.page";
	}
	
	// 온라인상담 등록 페이지
	@RequestMapping(value = "/onlineCnsWrite.do")
	public String onlineCnsWrite(CmSpaceVO vo, HttpServletRequest request, ModelMap model) {
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		String cnsrNm = (String)map.get("userNm");
		model.addAttribute("cnsrNm",cnsrNm);
		
		return "/comuSpace/onlineCnsWrite.page";
	}
	
	// 온라인상담 등록
	@RequestMapping(value = "/onlineCnsReg.do")
	public String onlineCnsReg(CmSpaceVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		vo.setRegId((String)map.get("userId"));
		// 온라인상담 등록
		homepageCmSpaceService.insertOnlineCnsReg(vo);
		
		return "redirect:/gnoincoun/onlineCnsList.do";
	}
	
	// 온라인상담 상세
	@RequestMapping(value = "/onlineCnsDtl.do")
	public String onlineCnsDtl(CmSpaceVO vo, HttpServletRequest request, ModelMap model) {
		String num = request.getParameter("num") == null ? "" : request.getParameter("num");
		EgovMap map = (EgovMap)request.getSession().getAttribute("LoginVO");
		if(map == null) {
			model.addAttribute("loginYn", "N");
		} else {
			model.addAttribute("loginYn", "Y");
		}
		
		
		// 온라인상담 상세
		EgovMap onlineCnsDtl = null;
		if(num !=""){
			// 온라인상담 상세
			onlineCnsDtl = homepageCmSpaceService.getOnlineCnsDtl(vo);
			model.addAttribute("detail", onlineCnsDtl);
		}
		
		String openStatYn = (String)onlineCnsDtl.get("openStatYn");
		String regId = (String)onlineCnsDtl.get("regId");
		String userId = map == null ? "" : (String)map.get("userId");
		
		if(openStatYn.equals("Y")) {
			return "/comuSpace/onlineCnsDtl.page";
		} else {
			if(regId.equals(userId)) {
				return "/comuSpace/onlineCnsDtl.page";
			} else {
				return "redirect:/gnoincoun/onlineCnsList.do";
			}
		} 
	}
	
	@RequestMapping(value="/fileDown.do", method=RequestMethod.GET)
    public void fileDown(CmSpaceVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String FileName = vo.getSysFileNm();
		String FilePathName = utility.func.filePath;
		System.out.println("FilePathName : " + FilePathName);
		File file = new File(FilenameUtils.getFullPath(FilePathName), FilenameUtils.getName(FileName));
		System.out.println("파일 객체의 값 : " + file);

		
		if (file.exists() && file.isFile()) {
			System.out.println("File Exists : " + utility.func.filePath + "/" + FileName);
			response.setContentType("application/octet-stream; charset=utf-8");
			response.setContentLength((int) file.length());
			String browser = getBrowser(request);
			String disposition = getDisposition(vo.getFileNm(), browser);
			response.setHeader("Content-Disposition", disposition);
			response.setHeader("Content-Transfer-Encoding", "binary");
			OutputStream out = response.getOutputStream();
			FileInputStream fis = null;
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
			if (fis != null)
				fis.close();
			out.flush();
			out.close();
			System.out.println("File Donwload Complete");
		}
    }
	//조현서 20210124
	@RequestMapping(value="/fileDown2.do")
    public void fileDown2(CmSpaceVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
        
		String FileName = "";

		try {
			FileName = AES256Crypto.getInstance().AESDecode(vo.getSysFileNm()); // 암호화 
		} catch (InvalidKeyException e) {
			FileName = vo.getSysFileNm();
			utility.func.Logging(this.getClass().getName(), "DECODE_ERROR : Invalid Key Exception");
		} catch (NoSuchAlgorithmException e) {
			FileName = vo.getSysFileNm();
			utility.func.Logging(this.getClass().getName(), "DECODE_ERROR : No Such AlgorithmException");
		} catch (NoSuchPaddingException e) {
			FileName = vo.getSysFileNm();
			utility.func.Logging(this.getClass().getName(), "DECODE_ERROR : No Such Padding Exception");
		} catch (InvalidAlgorithmParameterException e) {
			FileName = vo.getSysFileNm();
			utility.func.Logging(this.getClass().getName(), "DECODE_ERROR : Invaild Algorithm Parameter Exception");
		} catch (IllegalBlockSizeException e) {
			FileName = vo.getSysFileNm();
			utility.func.Logging(this.getClass().getName(), "DECODE_ERROR : Illegal Block Size Exception");
		} catch (BadPaddingException e) {
			FileName = vo.getSysFileNm();
			utility.func.Logging(this.getClass().getName(), "DECODE_ERROR : Bad Padding Exception");
		}

		String FilePathName2 = utility.func.filePath + FilenameUtils.getName(vo.getFilePath()) + "\\";
		String FilePathName = utility.func.filePath;
		System.out.println("FilePathName : " + FilePathName);
		System.out.println("FilePathName2 : " + FilePathName2);
		
		File file = new File(FilenameUtils.getFullPath(FilePathName), FilenameUtils.getName(FileName)); // Path 랑 이름을 주어 객체 획득 
		
		if (!file.exists()) {
			file = new File(FilenameUtils.getFullPath(FilePathName2), FilenameUtils.getName(FileName));
			System.out.println("파일 객체2의 값 : " + file);
		}
		
		System.out.println("파일 객체의 값 : " + file);

		if (file.exists() && file.isFile()) {
			
			System.out.println("File Exists : " + utility.func.filePath + vo.getFilePath() + "/" + FileName);
			response.setContentType("application/octet-stream; charset=utf-8");
			response.setContentLength((int) file.length());
			String browser = getBrowser(request); // 브라우저 종류 체크 
			String disposition = getDisposition(vo.getFileNm(), browser); // 파일이름 인코딩 
			response.setHeader("Content-Disposition", disposition);
			response.setHeader("Content-Transfer-Encoding", "binary"); // header 타입 , 즉 다운로드가 되는 Content 타입을 response 헤더에 세팅 
			OutputStream out = response.getOutputStream(); // outStream get 
			FileInputStream fis = null;						// Input 
			fis = new FileInputStream(file);				// read 함 
			FileCopyUtils.copy(fis, out); 					
			if (fis != null) fis.close();
			out.flush();									// path 에 있는 파일을 그대로 flush 함 . 
			out.close();
			
			System.out.println("File Donwload Complete");
		}
    }
	private String getBrowser(HttpServletRequest request) {
		String header = request.getHeader("User-Agent");
		if (header.indexOf("MSIE") > -1 || header.indexOf("Trident") > -1)
			return "MSIE";
		else if (header.indexOf("Chrome") > -1)
			return "Chrome";
		else if (header.indexOf("Opera") > -1)
			return "Opera";
		return "Firefox";
	}
	private String getDisposition(String filename, String browser) throws UnsupportedEncodingException {
		String dispositionPrefix = "attachment;filename=";
		String encodedFilename = null;
		if (browser.equals("MSIE")) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Firefox")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Opera")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = sb.toString();
		}
		return dispositionPrefix + encodedFilename;
	}
	
}