package egovframework.homepage.cmSpace.service;

import java.util.List;

import egovframework.homepage.main.service.PopupVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomepageCmSpaceService {
	
	// 공지사항 목록
	List<EgovMap> getNoticeList(CmSpaceVO vo);
	
	// 공지사항 목록 갯수
	int getNoticeTotal(CmSpaceVO vo);
	
	// 공지사항 등록
	void insertNoticeReg(CmSpaceVO vo) throws Exception;
	
	// 공지사항 상세
	EgovMap getNoticeDtl(CmSpaceVO vo);
	
	// 공지사항 파일 상세
	List<EgovMap> getNoticeFileDtl(CmSpaceVO vo);
	
	// 센터소식 목록
	List<EgovMap> getCenterNewsList(CmSpaceVO vo);
	
	// 메인화면 센터소식(이미지 목록)
	List<EgovMap> getCenterNewsImage(CmSpaceVO vo);
	
	// 메인화면 유튜브 목록
	List<EgovMap> getYoutubeList(CmSpaceVO vo);
		
	// 센터소식 목록 갯수
	int getCenterNewsTotal(CmSpaceVO vo);
	
	// 센터소식 상세
	EgovMap getCenterNewsDtl(CmSpaceVO vo);
	
	// 센터소식 파일 상세
	List<EgovMap> getCenterNewsFileDtl(CmSpaceVO vo);
	
	// 문서자료실 목록
	List<EgovMap> getDocLibraryList(CmSpaceVO vo);
	
	// 메인화면 문서자료실(보여질 목록 4개)
	List<EgovMap> getDocLibraryListM(CmSpaceVO vo);
	
	// 문서자료실 목록 갯수
	int getDocLibraryTotal(CmSpaceVO vo);
	
	// 문서자료실 상세
	EgovMap getDocLibraryDtl(CmSpaceVO vo);
	
	// 문서자료실 파일상세
	List<EgovMap> getDocLibraryFileDtl(CmSpaceVO vo);
	
	// 자유게시판 목록
	List<EgovMap> getFreeBoardList(CmSpaceVO vo);
	
	// 메인화면 자유게시판(보여질 목록 4개)
	List<EgovMap> getFreeBoardListM(CmSpaceVO vo);
	
	// 자유게시판 목록 갯수
	int getFreeBoardTotal(CmSpaceVO vo);
	
	// 메인화면 팝업
	List<EgovMap> getPopupListM(PopupVO vo);
	
	// 자유게시판 등록
	void insertFreeBoardReg(CmSpaceVO vo) throws Exception;
	
	// 자유게시판 상세
	EgovMap getFreeBoardDtl(CmSpaceVO vo);
	
	// 자유게시판 파일상세
	List<EgovMap> getFreeBoardFileDtl(CmSpaceVO vo);
	
	// 온라인상담 목록
	List<EgovMap> getOnlineCnsList(CmSpaceVO vo);
	
	// 온라인상담 목록 갯수
	int getOnlineCnsTotal(CmSpaceVO vo);
	
	// 온라인상담 등록
	void insertOnlineCnsReg(CmSpaceVO vo) throws Exception;
	
	// 온라인상담 상세
	EgovMap getOnlineCnsDtl(CmSpaceVO vo);
	
}