<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
<head>
	<script>
		$(document).ready(function() {
			$("#pathwayBtn2").css("display","none");
			$("#pathwayBtn3").css("display","none");
			$("#pathwayBtn4").css("display","none");
		});
	
		function pathwayBtn(no) {
			if(no == "1") {
				$("#pathwayBtn1").css("display","");
				$("#pathwayBtn2").css("display","none");
				$("#pathwayBtn3").css("display","none");
				$("#pathwayBtn4").css("display","none");
			} else if(no == "2") {
				$("#pathwayBtn1").css("display","none");
				$("#pathwayBtn2").css("display","");
				$("#pathwayBtn3").css("display","none");
				$("#pathwayBtn4").css("display","none");
			}else if(no == "3") {
				$("#pathwayBtn1").css("display","none");
				$("#pathwayBtn2").css("display","none");
				$("#pathwayBtn3").css("display","");
				$("#pathwayBtn4").css("display","none");
			} else if(no == "4") {
				$("#pathwayBtn1").css("display","none");
				$("#pathwayBtn2").css("display","none");
				$("#pathwayBtn3").css("display","none");
				$("#pathwayBtn4").css("display","");
			}
		}
	</script>
</head>
<section class="title_explain hidden-xs">
	<div class="container">
		<dl>
			<dt>센터소개</dt>
			<dd class="explanation">마음으로 만나는 어르신과 베이비부머의 행복한 노후</dd>
			<dd class="explanEng">GNOIN Hall Introdution</dd>
		</dl>
	</div>
</section>
<section class="service-2 section" style="margin-top:-14px;">
	<div id="wrap">
		<div style="width: 100%; margin: auto; text-align: center; margin-top: 30px; margin-bottom: 30px;">
			<button type="button" class="btn btn-primary sub-menu" onclick="javascript: pathwayBtn('1')"><font size = "4px">2020 ~ 2024</font></button>
			<button type="button" class="btn btn-primary sub-menu" onclick="javascript: pathwayBtn('2')"><font size = "4px">2018 ~ 2019</font></button>
			<button type="button" class="btn btn-primary sub-menu" onclick="javascript: pathwayBtn('3')"><font size = "4px">2016 ~ 2017</font></button>
			<button type="button" class="btn btn-primary sub-menu" onclick="javascript: pathwayBtn('4')"><font size = "4px">1999 ~ 2012</font></button>
		</div>

		<div id="pathwayBtn1" class="menu">
			<div class="content">
				<div class="yearhistory">
				
					<p><span> 2024 </span></p>
					<ul>
						<li>
							<strong>9월</strong>
							<span> 2024년 경기도노인종합상담센터 홍보영상 제작 </span>
						</li>
						
						<li>
							<strong>7월</strong>
							<span>(사)경기도지체장애인협회 업무협약<br>
								       베이비부머 마음돌봄 전화상담 홍보영상 제작
							 </span>
						</li>
						
						<li>
							<strong>4월</strong>
							<span>2024 경기도 노인 마음돌봄사업 “남성 어르신 희망네트워크 사업” 운영 </span>
						</li>
						
						<li>
							<strong>3월</strong>
							<span>노인성인지교육사업 경기남부노인보호전문기관 이관<br>
								  베이비부머 마음돌봄 전화상담 지원 사업 재개
							</span>
						</li>
						<li>
							<strong>1월</strong>
							<span>(사)한국노인상담학회 업무협약<br/> 
								김향자 센터장 취임
							</span>
						</li>
					</ul>
				
					<p><span> 2023 </span></p>
					<ul>
						<li>
							<strong>12월</strong>
							<span>노인성인지교육 동영상 ‘건강한 노년의 성’, ‘슬기로운 노년의 성’ 제작 및 유튜브 게시<br/> 
								비대면상담 대응력 강화 비대면상담 매뉴얼 워크북 제작<br/>
								노인심리·사회적 인식개선 및 노인상담사업 활성화를 위한 ‘한국노년학회’ 업무협약 체결
							</span>
						</li>
						<li>
							<strong>10월</strong>
							<span>경로의 달 기념 공개강좌 “노인의 자기결정권 – 내 인생은 나의 것” 실시</span>
						</li>
						<li>
							<strong>8월</strong>
							<span>(사)한국상담심리학회 연계 노인자아통합집단상담프로그램 연구 개발<br/> 
								(사)한국상담학회 업무협약 체결
							</span>
						</li>
						<li>
							<strong>6월</strong>
							<span>엘림양로원 업무협약, 노인심리방역 소통과 참여 효(孝)프로젝트 사회공헌활동 실시</span>
						</li>
						<li>
							<strong>5월</strong>
							<span>가정의 달 기념 공개강좌 “역사의 소용돌이 속에서 노인세대를 보다” 개최<br/> 
								대한민국상이군경회 경기도지부, 노인심리방역 소통과 참여 효(孝)프로젝트 사회공헌활동 실시<br/>
								나눔의 샘 양로원업무협약, 노인심리방역 소통과 참여 효(孝)프로젝트 사회공헌활동 실시
							</span>
						</li>
						<li>
							<strong>4월</strong>
							<span>경기베이비부머 마음돌봄 전화상담 수기 공모전 “마음과 마음의 따순(溫) 이야기” 실시<br/> 
								  대한민국상이군경회 경기도지부 업무협약 체결
							</span>
						</li>
						<li>
							<strong>2월</strong>
							<span>(사)한국상담심리학회 업무협약 체결</span>
						</li>
					</ul>
					
					<p><span> 2022 </span></p>
					<ul>
						<li>
							<strong>12월</strong>
							<span>경기도 노인심리방역 심리상담프로그램 성과보고집 발간<br/> 
								비대면상담대응력강화 상담매뉴얼 ‘온라인 첫만남’ 발간<br/>
								노인성인지교육 동영상 ‘안전하고 행복한 노년의 삶’, ‘노년의 사랑’ 제작 및 유튜브 게시<br/>
								경기도노인종합상담센터·경기복지재단, ‘2022년 경기도 중장년 지원방향 토론회’ 공동 주최
							</span>
						</li>
						<li>
							<strong>11월</strong>
							<span>경기도노인종합상담센터·노인보호전문기관·경기도사회서비스지원단, 공공 상담서비스 질<br/> 
								 제고를 위한 워크숍 ‘노인 가족 갈등 개입’ 공동 개최<br/>
								화성시서부노인복지관과 노인심리방역프로그램 기관연계 및 시범운영
							</span>
						</li>
						<li>
							<strong>10월</strong>
							<span>경기도노인종합상담센터·대한노인회 경기도연합회·경기도노인종합복지관협회<br/> 
								노인의 날 기념 노인인식개선 공개강좌 ‘불편, 불손한 디지털 문화 뒤집기’ 공동 개최<br/>
								경기도노인종합상담센터, 제26회 노인의 날 기념 공로상 수상
							</span>
						</li>
						<li>
							<strong>5월</strong>
							<span>경기도 노인맞춤돌봄 응급안전안심서비스 광역기관 분리 <br/> 
								희망의마을양로원, 노인요양원다정마을, 다사랑요양원 업무협약 <br/>
								5월 가정의달 특집 효(孝)프로젝트 사회공헌활동
							</span>
						</li>
					</ul>
					<p><span> 2021 </span></p>
					<ul>
						<li>
							<strong>11월</strong>
							<span>경기도노인종합복지관협회 업무협약 <br/> 
								화성시서부노인복지관 업무협약
							</span>
						</li>
						<li><strong>9월</strong><span>경기도의회 최종현의원 일일 명예기관장 위촉</span></li>
						<li>
							<strong>7월</strong>
							<span>경기도일자리재단 업무협약 <br/> 
								경기도노인복지시설협회 업무협약
							</span>
						</li>
						<li>
							<strong>5월</strong>
							<span>24시 노인온(ON-溫)상담사업(1833-2255) 실시 <br/> 
								경기광역자활센터(중장년심리방역사업) 업무협약 <br/> 
								경기도광역치매센터 '경기도 노인 통합돌봄 협력체계 구축을 위한 업무협약' 체결
							</span>
						</li>
						<li><strong>4월</strong><span>경기도 어르신 인생노트 사업 기관 지정</span></li>
						<li><strong>3월</strong><span>대한 노인회 경기도 연합회 업무협약 <br /> 사회서비스원 공공센터<br/>
							(경기도노인종합상담센터, 경기도노인일자리지원센터, 경기도노인보호전문기관)
						</span></li>
						<li><strong>2월</strong><span>「중장년 전화심리상담사업 」기관 지정</span></li>
						<li><strong>1월</strong><span>「노인성인지교육사업」 통합 운영</span></li>
					</ul>
					<p><span> 2020 </span></p>
					<ul>
						<li><strong>12월</strong><span>경기도형 노인맞춤돌봄서비스 종사자안전관리메뉴얼<br>"생활지원사의 마음 속 이야기를 켜다 ON"제작 및 배포</span></li>
						<li><strong>11월</strong><span>경기도노인종합상담센터 20주년 심포지엄<br>"새로운경기, 새로운 노인상담-ON(溫)텍트로"</span></li>
						<li><strong>8월</strong><span>수원시환경성질환 아토피센터 업무협약</span></li>
						<li><strong>4월</strong><span>경기도노인종합상담센터 위·수탁 협약 체결(경기도사회서비스원)</span></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="pathwayBtn2" class="menu">
			<div class="content">
				<div class="yearhistory">
					<p><span> 2019 </span></p>
					<ul>
						<li><strong>12월</strong><span>김미나센터장 경기거버넌스 유공 표창</span></li>
						<li><strong>10월</strong><span>여주대학교, 여주시노인복지관, 한국노인상담연구소 후진학선도형 거버넌스 협약</span></li>
						<li><strong>3월</strong><span>경기도 사회복지기금(노인복지사업),'사별노인지원서비스·함께하는 홀로서기'선정</span></li>
						<li><strong>1월</strong><span>경기도노인종합상담센터 위·수탁 협약 체결(경기복지재단	)</span></li>
					</ul>
					<p><span> 2018 </span></p>
					<ul>
						<li>
							<strong>11월</strong>
							<span>2018년 동년배상담지원봉사자 양성을 위한 상담사 역량강화 교육<br/>
							경기도정신건강증진센터(자살예방센터) 연계·협력 간담회</span>
						</li>
						<li>
							<strong>10월</strong>
							<span>시군 노인상담센터 상담사 4차 보수교육<br/>
								시군 노인상담센터 상담사 공개 슈퍼비전<br/>
								솔루션센터 MOU업무 협약체결
							</span>
						</li>
						<li><strong>9월</strong><span>시군 노인상담센터 2차 신입상담사 교육</span></li>
						<li><strong>8월</strong><span>시군 노인상담센터 상담사 3차 보수교육</span></li>
						<li>
							<strong>6월</strong>
							<span>경기도 노인복지상담사 역량강화 프로젝트 "JUMP UP"사별애도상담교육<br/>
							시군 노인상담센터 상담사 2차 보수교육</span>
						</li>
						<li>
							<strong>5월</strong>
							<span>시군 노인상담센터 상담사 1차 보수교육</span>
						</li>
						<li>
							<strong>4월</strong>
							<span>경기도 노인복지상담사 역량강화 프로젝트 "JUMP UP"해결중심상담모델 교육</span>
						</li>
						<li>
							<strong>3월</strong>
							<span>경기도 노인복지상담사 역량강화 프로젝트 "JUMP UP"힐링워크숍</span>
						</li>
						<li>
							<strong>2월</strong>
							<span>시군 노인상담센터 신입상담사 교육</span>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div id="pathwayBtn3" class="menu">
			<div class="content">
				<div class="yearhistory">
					<p><span> 2017 </span></p>
					<ul>
						<li><strong>7월</strong><span>경기도노인종합상담센터 김미나 센터장 취임</span></li>
						<li><strong>6월</strong><span>시·군 노인상담센터 2차 보수교육 '내러티브 접근법을 활용한 노인상담 기술의 적용'진행</span></li>
						<li><strong>5월</strong><span>농촌지역 찾아가는 집단상담 진행</span></li>
						<li><strong>4월</strong>
							<span>
								노인복지상담학교 '유앤아이'진행 <br/>
								노인복지상담 1차 보수교육 '메타기억교실'진행		
							</span>
						</li>
						<li><strong>3월</strong>
							<span>
								시·군 노인상담센터 실무자 DB교육 및 신규교육<br/>
								어르신 고민 제로를 위한 찾아가는 노인전문상담 프로젝트<br/>
								'지역밀착형 노인상담을 위한 실무자 네트워크 워크숍'진행<br/>
								노인돌봄기본서비스 경기도 수행입력 집합교육<br/>
								노인학대 예방 및 노인상담사업 추진 방안 회의 참석
							</span>
						</li>
						<li><strong>2월</strong><span>경기도광역치매센터 2017'아름다운 백세'사업 진행(43개소 상담센터)</span></li>
						<li><strong>1월</strong>
							<span>
								경기도 사회복지공동모금회 신청사업 선정 <br/>
								'어르신 고민 Zero를 위한 찾아가는 노인전문상담 프로젝트'
							</span>
						</li>
					</ul>
					<p><span> 2016 </span></p>
					<ul>
						<li><strong>11월</strong><span>제1회 경기도노인종합상담센터 세미나 개최</span></li>
						<li><strong>10월</strong><span>경기도노인종합상담센터 개소식</span></li>
						<li><strong>7월</strong>
							<span>
								동수원 우체국 MOU 체결 <br/>
								독거노인 의료지원 협의체 업무협약 체결(경기도노인복지관협회 외 20개 기관)
							</span>
						</li>
						<li><strong>6월</strong>
							<span>
								시·군 노인상담센터 56개소 현판전달 및 현장방문<br/>
								경기도 광역치매센터 MOU 체결
							</span>
						</li>
						<li><strong>5월</strong>
							<span>
								2016년 우체국 "행복배달부"지원사업 수행기관 선정 <br/>
								2016년 노년 행복컨설턴트 경기도 남부권역 지원센터 지정
							</span>
						</li>
						<li><strong>3월</strong><span>2016년 경기도노인상담지원 운영 지침 설명회</span></li>
						<li><strong>2월</strong><span>경기도 노인종합상담센터 고유번호증 발급(136-82-61243)</span></li>
						<li><strong>1월</strong>
							<span>
								노인자살예방사업 건강증진과 이관 및 시군 노인상담센터 45개소에서 56개로 확대 설치 <br/>
								경기도노인종합상담센터 설치 및 운영에 관한 조례 제정 <br/>
								경기도노인종합상담센터 위·수탁 협약 체결(경기도·한국노인종합복지관협회)
							</span>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div id="pathwayBtn4" class="menu">
			<div class="content">
				<div class="yearhistory">
					<p><span> 2012 </span></p>
					<ul>
						<li>42개 시·군 노인자살전문상담원 파견</li>
					</ul>
					<p><span> 2011 </span></p>
					<ul>
						<li>31개 시·군 노인자살전문상담원 파견 <br/>
							지역사회서비스투자사업 자살고위험군 건간증진서비스 진행
						</li>
					</ul>
					<p><span> 2010 </span></p>
					<ul>
						<li>'노인복지 우수프로그램'대통령상 수상<br/>
							노인자살예방을 위한 교육용 DVD제작 및 보급
						</li>
					</ul>
					<p><span> 2009 </span></p>
					<ul>
						<li>'경기도노인종합상담센터'지정<br/>
							18개 시·군 노인자살전문상담원 파견<br/>
							'경기도 노인자살예방 지원 조례'제정(2009.10.30)
						</li>
					</ul>
					<p><span> 2008 </span></p>
					<ul><li>'경기도노인종합상담센터'로 기관 명칭 변경</li></ul>
					<p><span> 1999 </span></p>
					<ul><li>경기도노인복지상담실 설치</li></ul>
				</div>
			</div>
		</div>
	</div>
</section> <!-- End section -->