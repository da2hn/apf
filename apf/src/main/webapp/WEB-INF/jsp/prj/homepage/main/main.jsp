<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>경기도노인종합상담센터</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<META NAME="ROBOTS" CONTENT="INDEX"/>
<meta name="author" content="">
<!-- Bootstrap core CSS -->
<link href="/gnoincoun/assets/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="/gnoincoun/assets/css/font-awesome.min.css" rel="stylesheet">
<!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="/gnoincoun/assets/js/ie-emulation-modes-warning.js"></script>
<script src="/gnoincoun/js/jquery-1.11.2.min.js"></script>
<!-- <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet"> -->
<!-- <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" /> -->
<link rel="stylesheet"
	href="/gnoincoun/assets/css/swiper-bundle.min.css" />
<link rel="stylesheet" href="/gnoincoun/css/style2.css" />
<link href="/gnoincoun/assets/css/theme.css" rel="stylesheet">
<script src="/gnoincoun/assets/js/jquery.min.js"></script>
<script src="/gnoincoun/assets/js/bootstrap.min.js"></script>
<script src="/gnoincoun/assets/js/ie10-viewport-bug-workaround.js"></script>

<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
<script src="/gnoincoun/assets/js/jquery-3.3.1.min.js"></script>
<!-- <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script> -->
<script src="/gnoincoun/assets/js/swiper-bundle.min.js"></script>
<script src="/gnoincoun/js/script2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.navbar-toggle').on('click', function() {
			$('.social-icons').fadeToggle(200);
		});

		// 첨부파일 
		var fileTarget = $('.filebox .upload-hidden');
		fileTarget.on('change', function() { // 값이 변경되면 
			if (window.FileReader) { // modern browser 
				var filename = $(this)[0].files[0].name;
			} else { // old IE 
				var filename = $(this).val().split('/').pop()
						.split('\\').pop(); // 파일명만 추출 
			}
			// 추출한 파일명 삽입 
			$(this).siblings('.upload-name').val(filename);
		});

		let imageList = [];
		let numList = [];
		<c:forEach var="popupImg" items="${popup}" varStatus="status">
		imageList.push("${popupImg}");
		numList.push("${popupNum[status.index]}");
		</c:forEach>
		console.log(imageList);
		console.log(numList);

		for (var i = 0; i < "${popupCnt}"; i++) {
			var img = new Image();
			var imgsrc = imageList[i];
			var filePath = "/gnoincoundb/getPopup.do?fileNm=/";
			img.src = filePath + imgsrc;
			var path = filePath + imgsrc;
			var num = numList[i];
			onPopupList(img, path, num);
		}
		$('.border-btn-box > li').hover(function() {
			$(this).addClass('active');
		}, function() {
			$(this).removeClass('active');
		});
	});

	function getCookie(name) {
		var nameOfCookie = name + "=";
		var x = 0;
		while (x <= document.cookie.length) {
			var y = (x + nameOfCookie.length);
			if (document.cookie.substring(x, y) == nameOfCookie) {
				if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
					endOfCookie = document.cookie.length;
				return unescape(document.cookie.substring(y, endOfCookie));
			}
			x = document.cookie.indexOf(" ", x) + 1;
			if (x == 0)
				break;
		}
		return "";
	}

	function onPopupList(img, filePath, num) {
		img.onload = function() {
			var MAX_WIDTH = 850;
			var MAX_HEIGHT = 850;
			var width = this.width;
			var height = this.height;
			if (width > height) {
				if (width > MAX_WIDTH) {
					height *= MAX_WIDTH / width;
					width = MAX_WIDTH;
				}
			} else {
				if (height > MAX_HEIGHT) {
					width *= MAX_HEIGHT / height;
					height = MAX_HEIGHT;
				}
			}
			var url = "/gnoincoun/popup.do?filePath=" + filePath + "&num="
					+ num + "&width=" + width + "&height=" + height;
			if (getCookie(num) != "done") {
				height = height + 50;
				window.open(url, num, 'width=' + width + ', height=' + height
						+ ', menubars=no, scrollbars=auto');
			}
		};
	}

	function fn_fileDown(sysFileNm, filePath, fileNm) {
		$("#fileNm").val(fileNm);
		$("#sysFileNm").val(sysFileNm);
		$("#filePath").val(filePath);
		document.downForm.action = "/gnoincoundb/fileDown2.do";
		document.downForm.submit();
	}

	function goLink(idx) {
		switch (idx) {
		case 1:
			window.open("http://gpsilver.org/home/");
			break;
		case 2:
			window.open("https://test.narangdesign.com/mail/withnoin/201801/index.html");
			break;
		case 3:
			window.open("https://ilsansenior.org/");
			break;
		case 4:
			window.open("https://www.dh-seniorwelfarecenter.co.kr/index.php");
			break;
		case 5:
			window.open("https://www.gcsilver.or.kr/");
			break;
		case 6:
			window.open("http://www.gmsenior.or.kr/");
			break;
		case 7:
			window.open("http://www.gjswc.kr/gjnoin/index.do");
			break;
		case 8:
			window.open("http://www.guriwelfare.or.kr/bbs/view.php?id=TemP_kurinews&page=1");
			break;
		case 9:
			window.open("https://www.gpbokji.org/");
			break;
		case 10:
			window.open("http://www.nprsenior.or.kr/");
			break;
		case 11:
			window.open("https://gimposenior.org/");
			break;
		case 12:
			window.open("http://www.gpnsenior.org/main/");
			break;
		case 13:
			window.open("http://nyjsw.or.kr/");
			break;
		case 14:
			window.open("https://www.dongbusenior.or.kr/");
			break;
		case 15:
			window.open("http://www.js1004.kr/");
			break;
		case 16:
			window.open("http://www.ddcnoin.org/");
			break;
		case 17:
			window.open("http://senior.bucheon4u.kr/senior/seniorWelfareAgency/seniorWelfareAgency02/seniorWelfareAgency02_1.jsp");
			break;
		case 18:
			window.open("http://senior.bucheon4u.kr/senior/seniorWelfareAgency/seniorWelfareAgency03/seniorWelfareAgency03_1.jsp");
			break;
		case 19:
			window.open("http://senior.bucheon4u.kr/senior/seniorWelfareAgency/seniorWelfareAgency01/seniorWelfareAgency01_1.jsp");
			break;
		case 20:
			window.open("https://bdsenior.or.kr/main/main.php");
			break;
		case 21:
			window.open("http://sunobok.or.kr/");
			break;
		case 22:
			window.open("http://www.sswc.kr/online/");
			break;
		case 23:
			window.open("http://www.jwnoin.org/");
			break;
		case 24:
			window.open("http://www.ypinetree.or.kr/");
			break;
		case 25:
			window.open("http://www.gnoin.kr/");
			break;
		case 26:
			window.open("http://www.bambat.org/ ");
			break;
		case 27:
			window.open("http://www.seoho.or.kr/user/index.jsp");
			break;
		case 28:
			window.open("http://www.ggsenior.or.kr/");
			break;
		case 29:
			window.open("http://www.budnae.or.kr/");
			break;
		case 30:
			window.open("http://www.pangyonoin.or.kr/main/main.html");
			break;
		case 31:
			window.open("https://scsnoin.or.kr/");
			break;
		case 32:
			window.open("http://shsenior.or.kr/main/");
			break;
		case 33:
			window.open("https://cafe.daum.net/dwsws");
			break;
		case 34:
			window.open("http://www.ansansenior.or.kr/main/main.php");
			break;
		case 35:
			window.open("http://www.anseongnoin.or.kr/");
			break;
		case 36:
			window.open("http://www.happytown.or.kr/");
			break;
		case 37:
			window.open("http://www.yjhcsenior.or.kr/html/index/");
			break; // 양주시 접속문제 있음 400 error
		case 38:
			window.open("http://www.ypsilver21.or.kr/");
			break;
		case 39:
			window.open("http://www.yjsilver.or.kr/main.php");
			break;
		case 40:
			window.open("http://www.lycsenior.org/");
			break;
		case 41:
			window.open("http://www.osannoin.or.kr/main/ ");
			break;
		case 42:
			window.open("http://www.ygsenior.or.kr/");
			break;
		case 43:
			window.open("http://sujibokji.or.kr/main.php#1");
			break;
		case 44:
			window.open("http://www.yiswc.or.kr/website/");
			break;
		case 45:
			window.open("http://www.noinlove.or.kr/");
			break;
		case 46:
			window.open("http://uwsenior.or.kr/");
			break;
		case 47:
			window.open("https://www.songsan.ne.kr/");
			break;
		case 48:
			window.open("http://sgwelfare.org/");
			break;
		case 49:
			window.open("https://uswc4u.or.kr/ ");
			break;
		case 50:
			window.open("http://www.ichonold.or.kr/");
			break;
		case 51:
			window.open("https://www.pajusenior.or.kr/");
			break;
		case 52:
			window.open("http://www.ptsenior.or.kr/");
			break;
		case 53:
			window.open("https://bbnoin.or.kr:41004/");
			break;
		case 54:
			window.open("http://www.sbnoin.net/ ");
			break;
		case 55:
			window.open("http://pssenior.or.kr/");
			break;
		case 56:
			window.open("http://www.pcsc.kr/");
			break;
		case 57:
			window.open("http://www.youngnak-noin.or.kr/");
			break;
		case 58:
			window.open("https://www.dtsenior.or.kr/dongtan/index.do");
			break;
		case 59:
			window.open("https://www.hssenior.or.kr/index/");
			break;
		case 60:
			window.open("http://www.hs-seobu.or.kr/main");
			break;
		case 61:
			window.open("http://www.haansenior.or.kr/");
			break;
		case 62:
			window.open("http://www.8879.or.kr/");
			break;
		case 63:
			window.open("http://www.pdsenior.or.kr/");
			break;
		}
	}

	function listCenter(idx) {
		idx = Number(idx);
		console.log("idx : " + idx);
		var html = undefined;
		switch (idx) {
		case 1: //가평
			$("#nowMap").text('가평');
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >가평군 노인복지관</td>'
					+ '<td class="address">경기도 가평군 가평읍 읍내리 625-8</td>'
					+ '<td class="tel">031-581-6063</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(1)"></td>'
					+ '</tr>' 
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >청평노인복지관</td>'
					+ '<td class="address">경기도 가평군 청평면 은고개로 39</td>'
					+ '<td class="tel">031-582-8879</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(62)"></td>'
					+ '</tr>' + '</table>'
			break;
		case 2: // 고양
			$("#nowMap").text('고양')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" style="cursor:pointer;">고양시덕양노인종합복지관</td>'
					+ '<td class="address">경기도 고양시 덕양구 화정동 846</td>'
					+ '<td class="tel">031-969-7781</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(2)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">고양시일산노인종합복지관</td>'
					+ '<td class="address">경기도 고양시 일산동구 장항동 호수로 731</td>'
					+ '<td class="tel">031-919-8677</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(3)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">고양시대화노인종합복지관</td>'
					+ '<td class="address">경기도 고양시 일산동구 장항동 호수로 731</td>'
					+ '<td class="tel">031-919-8677</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(4)"></td>'
					+ '</tr>' + '</table>'
			break;
		case 3: // 과천 
			$("#nowMap").text('과천')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >과천시노인복지관</td>'
					+ '<td class="address">경기도 과천시 문원로57</td>'
					+ '<td class="tel">02-502-8500</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(5)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 4:
			$("#nowMap").text('광명');
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >광명소하노인종합복지관</td>'
					+ '<td class="address">경기도 광명시 소하로25</td>'
					+ '<td class="tel">02-2625-9300</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(6)"></td>'
					+ '</tr>' 
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >하안노인종합복지관</td>'
					+ '<td class="address">경기도 광명시 철망산로 48</td>'
					+ '<td class="tel">02-898-8830</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(61)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 5:
			$("#nowMap").text('광주')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >광주시노인복지관</td>'
					+ '<td class="address">경기도 광주시 파발로 202</td>'
					+ '<td class="tel">031-766-9129</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(7)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 6:
			$("#nowMap").text('구리')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >구리시종합사회복지관</td>'
					+ '<td class="address">경기도 구리시 벌말로129번길 50</td>'
					+ '<td class="tel">031-556-8100</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(8)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 7:
			$("#nowMap").text('군포')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >군포시노인복지관</td>'
					+ '<td class="address">경기 군포시 고산로 223</td>'
					+ '<td class="tel">031-556-8100</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(9)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >군포시늘푸른노인복지관</td>'
					+ '<td class="address">경기도 군포시 산본천로 101</td>'
					+ '<td class="tel">031-392-5755</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(10)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 8:
			$("#nowMap").text('김포')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >김포시노인종합복지관</td>'
					+ '<td class="address">경기도 김포시 사우중로 74번길 48</td>'
					+ '<td class="tel">031-997-9300</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(11)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >김포시북부노인복지관</td>'
					+ '<td class="address">경기도 김포시 통진읍 마송1로 16번길 40-2</td>'
					+ '<td class="tel">031-984-0108</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(12)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 9:
			$("#nowMap").text('남양주')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >남양주시노인복지관</td>'
					+ '<td class="address">경기도 남양주시 진건읍 진건오남로 359</td>'
					+ '<td class="tel">031-573-6598</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(13)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >남양주시동부노인복지관</td>'
					+ '<td class="address">경기도 남양주시 수동면 비룡로 801-47</td>'
					+ '<td class="tel">031-559-5880</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(14)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >해피누리노인복지관</td>'
					+ '<td class="address">경기도 남양주시 늘을2로 67</td>'
					+ '<td class="tel">031-590-3000</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(15)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 10:
			$("#nowMap").text('동두천')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >동두천노인복지관</td>'
					+ '<td class="address">경기도 동두천시 동두천로 264</td>'
					+ '<td class="tel">031-857-9918</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(16)"></td>'
					+ '</tr>' + '</tr>' + '</table>'
			break;

		case 11:
			$("#nowMap").text('부천')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >부천소사노인복지기관</td>'
					+ '<td class="address">경기도 부천시 길주로 210</td>'
					+ '<td class="tel">032-347-9534</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(17)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >부천오정노인복지관</td>'
					+ '<td class="address">경기도 부천시 길주로 210</td>'
					+ '<td class="tel">032-683-9290</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(18)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >부천시원미노인복지관</td>'
					+ '<td class="address">경기도 부천시 길주로 210</td>'
					+ '<td class="tel">032-667-0261</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(19)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 12:
			$("#nowMap").text('성남')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">분당노인종합복지관</td>'
					+ '<td class="address">경기도 성남시 분당구 불정로 50</td>'
					+ '<td class="tel">031-785-9200</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(20)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >수정노인종합복지관</td>'
					+ '<td class="address">경기도 성남시 수정구 수정남로 268번길 28</td>'
					+ '<td class="tel"> 031-731-3393</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(21)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >수정중앙노인종합복지관</td>'
					+ '<td class="address">경기도 성남시 수정구 성남대로 1480번길 38</td>'
					+ '<td class="tel">031-752-3366</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(22)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >중원노인종합복지관</td>'
					+ '<td class="address">경기도 성남시 중원구 제일로 35번길 51</td>'
					+ '<td class="tel"> 031-751-7450</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(23)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >황송노인종합복지관</td>'
					+ '<td class="address">경기도 성남시 중원구 금상로 132</td>'
					+ '<td class="tel">031-731-5520</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(24)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 13:
			$("#nowMap").text('수원')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >경기도노인종합상담센터</td>'
					+ '<td class="address">경기도 수원시 장안구 경수대로 1150</td>'
					+ '<td class="tel">031-222-1360</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(25)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >밤밭노인복지관</td>'
					+ '<td class="address">수원시 장안구 상률로 53</td>'
					+ '<td class="tel">031-271-8859</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(26)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >서호노인복지관</td>'
					+ '<td class="address">경기도 수원시 권선구 구운로4번길 34</td>'
					+ '<td class="tel">031-291-0911</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(27)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;" >'
					+ '<td class="title" >광교노인복지관</td>'
					+ '<td class="address">경기도 수원시 영통구 센트럴타운로 22</td>'
					+ '<td class="tel">031-8006-7400</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(28)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >버드내노인복지관</td>'
					+ '<td class="address">경기도 수원시 권선구 권선로 564번길 36</td>'
					+ '<td class="tel">031-898-6544</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(29)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >판교노인종합복지관</td>'
					+ '<td class="address">경기도 성남시 분당구 판교역로 99</td>'
					+ '<td class="tel">031-620-2810</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(30)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >SK청솔노인복지관</td>'
					+ '<td class="address">경기도 수원시 장안구 장안로 174</td>'
					+ '<td class="tel">031-257-6811</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(31)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title" >팔달노인복지관</td>'
					+ '<td class="address">경기도 수원시 팔달구 수원천로 343</td>'
					+ '<td class="tel">031-248-3800</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(63)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 14:
			$("#nowMap").text('시흥')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">시흥노인종합복지관</td>'
					+ '<td class="address">경기도 시흥시 장현능곡로 214</td>'
					+ '<td class="tel">031-404-3122</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(32)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 15:
			$("#nowMap").text('안산')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">단원구노인복지관</td>'
					+ '<td class="address">경기도 안산시 단원구 선부광장 1로 134</td>'
					+ '<td class="tel">031-405-1188</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(33)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">상록구노인복지관</td>'
					+ '<td class="address">경기도 안산시 상록구 고잔로 162</td>'
					+ '<td class="tel">031-414-2271</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(34)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 16:
			$("#nowMap").text('안성')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">안성시노인복지관</td>'
					+ '<td class="address">경기도 안성시 장기로 109</td>'
					+ '<td class="tel">031-674-0794</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(35)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 17:
			$("#nowMap").text('안양')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">안양시노인종합복지관</td>'
					+ '<td class="address">경기도 안양시 동안구 경수대로 665번길 74</td>'
					+ '<td class="tel">031-455-0551</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(36)"></td>'
					+ '</tr>' + '</tr>' + '</table>'
			break;

		case 18:
			$("#nowMap").text('양주')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">양주시회천노인복지관</td>'
					+ '<td class="address">경기도 양주시 화합로 1426번길 90</td>'
					+ '<td class="tel">031-859-9081</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(37)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 19:
			$("#nowMap").text('양평')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">양평군노인복지관</td>'
					+ '<td class="address">경기도 양평군 양평대교길 4번길 5</td>'
					+ '<td class="tel">031-774-9751</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(38)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 20:
			$("#nowMap").text('여주')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">여주시노인복지관</td>'
					+ '<td class="address">경기도 여주시 여흥로 160번길 27</td>'
					+ '<td class="tel"> 031-881-0050</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(39)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 21:
			$("#nowMap").text('연천')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">연천군노인복지관</td>'
					+ '<td class="address">경기도 연천군 연천읍 문화로108번길 11</td>'
					+ '<td class="tel">031-834-6080</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(40)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 22:
			$("#nowMap").text('오산')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">오산노인종합복지관</td>'
					+ '<td class="address">경기도 오산시 수청로 192</td>'
					+ '<td class="tel">031-290-8530</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(41)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 23:
			$("#nowMap").text('용인')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">용인기흥노인복지관</td>'
					+ '<td class="address">경기도 용인시 기흥구 산양로 71</td>'
					+ '<td class="tel">031-284-8852</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(42)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">용인시수지노인복지관</td>'
					+ '<td class="address">경기도 용인시 수지구 포은대로 435</td>'
					+ '<td class="tel">031-270-0000</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(43)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">용인시처인노인복지관</td>'
					+ '<td class="address">경기도 용인시 처인구 중부대로 1199</td>'
					+ '<td class="tel">031-324-9303</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(44)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 24:
			$("#nowMap").text('의왕')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">의왕시사랑채노인복지관</td>'
					+ '<td class="address">경기도 의왕시 복지로 109 내손동 공용청사내</td>'
					+ '<td class="tel">031-425-3676</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(45)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">의왕시아름채노인복지관</td>'
					+ '<td class="address">경기도 의왕시 문화공원로 47</td>'
					+ '<td class="tel">031-427-0580</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(46)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 25:
			$("#nowMap").text('의정부')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;" >'
					+ '<td class="title">송산노인종합복지관</td>'
					+ '<td class="address">경기 의정부시 용민로 99</td>'
					+ '<td class="tel">031-852-2595</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(47)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">신곡노인종합복지관</td>'
					+ '<td class="address">경기도 의정부시 금신로297번길 38</td>'
					+ '<td class="tel">031-840-5300</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(48)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">의정부노인종합복지관</td>'
					+ '<td class="address">경기도 의정부시 경의로85번길 16-12</td>'
					+ '<td class="tel">031-826-0742</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(49)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 26:
			$("#nowMap").text('이천')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">이천시노인종합복지관</td>'
					+ '<td class="address">경기도 이천시 남천로 31</td>'
					+ '<td class="tel">031-636-0190</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(50)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 27:
			$("#nowMap").text('파주')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">파주시노인복지관</td>'
					+ '<td class="address">경기도 파주시 가나무로 130</td>'
					+ '<td class="tel">031-943-0730</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(51)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 28:
			$("#nowMap").text('평택')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;" >'
					+ '<td class="title">평택남부노인복지관</td>'
					+ '<td class="address">경기 평택시 평택5로 220</td>'
					+ '<td class="tel">031-8036-4900</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(52)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">평택북부노인복지관</td>'
					+ '<td class="address">경기 평택시 서정로 295</td>'
					+ '<td class="tel">031-615-3915</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(53)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">평택서부노인복지관</td>'
					+ '<td class="address">경기도 평택시 안중읍 안현로 400</td>'
					+ '<td class="tel">031-683-0030</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(54)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">팽성노인복지관</td>'
					+ '<td class="address">경기도 평택시 팽성읍 팽성남산4길 6</td>'
					+ '<td class="tel">031-650-2640</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(55)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 29:
			$("#nowMap").text('포천')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">포천시노인복지관</td>'
					+ '<td class="address">경기도 포천시 군내면 청성로 5</td>'
					+ '<td class="tel">031-8083-7777</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(56)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 30:
			$("#nowMap").text('하남')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;" >'
					+ '<td class="title">영락재가노인지원서비스센터</td>'
					+ '<td class="address">경기도 하남시 안터로 55-1</td>'
					+ '<td class="tel">031-794-9368</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(57)"></td>'
					+ '</tr>' + '</table>'
			break;

		case 31:
			$("#nowMap").text('화성')
			html = '<table style="border:1px;">'
					+ '<colgroup>'
					+ '<col width="10%"><col width="10%"><col width="10%"><col width="5%">'
					+ '</colgroup>'
					+ '<tr>'
					+ '<th>센터명</th>'
					+ '<th>주소</th>'
					+ '<th>연락처</th>'
					+ '<th>홈페이지</th>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;" >'
					+ '<td class="title">화성시동탄노인복지관</td>'
					+ '<td class="address">경기도 화성시 동탄대로8길 36</td>'
					+ '<td class="tel">031-8077-1800</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(58)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">화성시남부노인복지관</td>'
					+ '<td class="address">경기도 화성시 향남읍 토성로 37-22</td>'
					+ '<td class="tel">031-366-5678</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(59)"></td>'
					+ '</tr>'
					+ '<tr style="cursor:pointer;">'
					+ '<td class="title">화성시서부노인복지관</td>'
					+ '<td class="address">경기도 화성시 남양읍 시청로 155</td>'
					+ '<td class="tel">031-8077-2605</td>'
					+ ' <td><image src="/gnoincoun/images/browserIcon.png" onclick="goLink(60)"></td>'
					+ '</tr>' + '</table>'
			break;
		}

		if (html) {
			$('.mapList').html(html);
			$(".mapList").children().children().children().children('th').css('background-color', 'gray');
			$(".mapList").children().children().children().children('th').css('color', 'white');
			$(".mapList").children().children().children().children('th').css('font-size', '17px');
			$(".mapList").children().children().children().children('th').css('text-align', 'center');
			$(".mapList").children().children().children().children('td').css('color', 'initial');
			var trTag = $(".mapList").children().children().children('tr');
			trTag.hover(function() {
				$(this).css('background-color', '#E8E8E8');
			}, function() {
				$(this).css('background-color', 'initial')
			});
			$("#localGb").val(idx).attr("selected", "selected");
			console.log(html);
		}

	}
</script>
</head>
<style>
a {
	text-decoration: none;
	color: #000;
}

body {
	min-width: 320px;
}

.logo-box img {
	width: auto;
	height: auto;
	max-width: 350px;
}

table {
	border: 1px solid #444444;
	border-collapse: collapse;
}

table.table-condensed{
	border: none!important;
}

#rightQuick {
	position: absolute;
    top: 364px;
    left: 44%;
    margin: 0 0 0 760px;
}

#rightQuick .list {
    position: relative;
}

#rightQuick .list > li > * {
    background-position: 0 -210px;
    display: block;
    width: 67px;
    height: 67px;
    text-align: left;
    text-indent: -9999px;
}
#rightQuick .list > li .nav-instagram {
    background: url('/gnoincoun/images/instagram.png') no-repeat 0 0;
}
#rightQuick .list > li .nav-facebook {
    background: url('/gnoincoun/images/facebook.png') no-repeat 0 0;
}
#rightQuick .list > li .nav-yutube {
    background: url('/gnoincoun/images/yutube.png') no-repeat 0 0;
}


</style>
<body>
	<div id="wrap">
		<form name="downForm" id="downForm" method="get"
			enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden" id="fileNm"
				name="fileNm" value="" /> <input type="hidden" id="sysFileNm"
				name="sysFileNm" value="" /> <input type="hidden" id="filePath"
				name="filePath" value="" />
		</form>
		<header class="navbar-wrapper">
			<nav class="navbar navbar-static-top">
				<div class="navbar-header">
					<div class="container">
						<a class="navbar-brand" href="/gnoincoun/homepageMainList.do"><img
							src="/gnoincoun/assets/img/logo.png" alt="경기도노인종합상담센터" /></a>
						<div class="social-icons pull-right">
							<ul class="nav nav-pills">
								<li><a href="/gnoincoun/homepageMainList.do"
									class="btn btn-primary btn-xs"><i class="fa fa-home mr5"></i>홈</a></li>
								<c:choose>
									<c:when test="${loginYn eq 'Y'}">
										<li><a href="/gnoincoun/logout.do"
											class="btn btn-primary btn-xs"><i class="fa fa-lock mr5"></i>로그아웃</a></li>
										<li><a href="/gnoincoun/mypageView.do"
											class="btn btn-primary  btn-xs"><i class="fa fa-user mr5"></i>마이페이지</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="/gnoincoun/login.do"
											class="btn btn-primary btn-xs"><i
												class="fa fa-unlock-alt mr5"></i>로그인</a></li>
										<li><a href="/gnoincoun/agree.do"
											class="btn btn-primary  btn-xs"><i class="fa fa-user mr5"></i>회원가입</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar"
							aria-expanded="false" aria-controls="navbar">
							<span class="sr-only">전체메뉴</span> <span class="icon-bar"></span>
							<span class="icon-bar"></span> <span class="icon-bar"></span>
						</button>
					</div>
				</div>

				<div id="navbar" class="collapse navbar-collapse">
					<div class="container">
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">센터소개<i class="fa fa-angle-down"></i></a>
								<ul class="dropdown-menu" role="menu">
									<li class="dropdown-item">
						                <a href="/gnoincoun/salutation.do">인사말
						                <i class="fa fa-caret-right"></i></a>
					                </li>
									<li class="dropdown-item">
										<a href="/gnoincoun/operatCorp.do">운영법인
										<i class="fa fa-caret-right"></i></a>
									</li>
									<li class="dropdown-item">
										<a href="/gnoincoun/missionVis.do">미션과 비젼 
										<i class="fa fa-caret-right"></i></a>
									</li>
									<li class="dropdown-item">
										<a href="/gnoincoun/centerFoot.do">걸어온길
										<i class="fa fa-caret-right"></i></a>
									</li>
									<li class="dropdown-item">
										<a href="/gnoincoun/peopleTg.do">함께하는 사람들
										<i class="fa fa-caret-right"></i></a>
									</li>
									<li class="dropdown-item">
										<a href="/gnoincoun/centerMap.do">시군센터
										<i class="fa fa-caret-right"></i></a>
									</li>
									<li class="dropdown-item">
										<a href="/gnoincoun/directions.do">오시는길
										<i class="fa fa-caret-right"></i></a>
									</li>
								</ul></li>
							<li><a href="/gnoincoun/oldCnsCenter.do">시&middot;군
									노인상담센터</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">사업소개<i class="fa fa-angle-down"></i></a>
								<ul class="dropdown-menu" role="menu">
									<li class="dropdown-item">
						                <a href="/gnoincoun/sigunSupport.do">노인상담지원사업
						                <i class="fa fa-caret-right"></i></a>
					                </li>
									<li class="dropdown-item">
										<a href="/gnoincoun/noin24.do">24시노인온상담
										<i class="fa fa-caret-right"></i></a>
									</li>
									<li class="dropdown-item">
										<a href="/gnoincoun/middleCns.do">베이비부머 마음돌봄 전화상담
										<i class="fa fa-caret-right"></i></a>
									</li>
									<!-- <li class="dropdown-item">
										<a href="/gnoincoun/genderEdu.do">성인지교육사업
										<i class="fa fa-caret-right"></i></a>
									</li>-->
								</ul></li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">소통의 공간
								<i class="fa fa-angle-down"></i></a>
								<ul class="dropdown-menu" role="menu">
									<li class="dropdown-item">
										<a href="/gnoincoun/centerNewsList.do">센터소식
										<i class="fa fa-caret-right"></i></a>
									</li>
									<li class="dropdown-item">
										<a href="/gnoincoun/noticeList.do">공지사항
										<i class="fa fa-caret-right"></i></a>
									</li>
									<li class="dropdown-item">
										<a href="/gnoincoun/docLibraryList.do">문서자료실
										<i class="fa fa-caret-right"></i></a>
									</li>
									<!--<li class="dropdown-item">
										<a href="/gnoincoun/freeBoardList.do">자유게시판
										<i class="fa fa-caret-right"></i></a>
									</li> -->
									<li class="dropdown-item">
										<a href="/gnoincoun/onlineCnsList.do">온라인상담
										<i class="fa fa-caret-right"></i></a>
									</li>
									<%--
									<li class="dropdown-item">
										<a href="/gnoincoun/comfCnsWrite.do">맘편한 상담
										<i class="fa fa-caret-right"></i></a>
									</li>
									 --%>
									<li class="dropdown-item">
										<a href="/gnoincoun/psyInfo.do">간편한 심리검사
										<i class="fa fa-caret-right"></i></a>
									</li>
									<!--  <li class="dropdown-item">
										<a href="/gnoincoun/eduAppWrite.do">교육신청
										<i class="fa fa-caret-right"></i></a>
									</li>-->
								</ul>
							</li>
						</ul>
					</div>
				</div>
				<!-- navbar-collapse -->
			</nav>
		</header>
		<div style="margin-bottom: 130px;"></div>

		<div class="main-content" style="width: 1130px; margin: 0 auto;">
			<div class='banner-box-01' style="width: 1200px;">
				<li><a href="/gnoincoun/salutation.do"><img
						src="/gnoincoun/images/banner_01.png" alt="센터소개" style="width:265px; height:200px;"/></a></li>
				<li><a href="/gnoincoun/psyInfo.do"><img
						src="/gnoincoun/images/banner_02.png" alt="간편한 심리검사" /></a></li>
				<%-- <li><a href="/gnoincoun/comfCnsWrite.do"><img
						src="/gnoincoun/images/banner_03.png" alt="맘편한 상담" /></a></li>--%>
				<li><a href="/gnoincoun/mypageView.do"><img
						src="/gnoincoun/images/banner_04.png" alt="마이페이지" /></a></li>
				<li style="text-align: initial;"><a href="/gnoincoun/onlineCnsList.do"><img
						src="/gnoincoun/images/banner_05.png" alt="온라인상담" /></a></li>
			</div>
		</div>
		<div class='wrap main-content'>
			<div class='banner-box-02'>
				<li><a href="/gnoincoun/sigunSupport.do"><img
						src="/gnoincoun/images/banner_06.png" alt="시군지원사업" /></a></li>
				<li><a href="/gnoincoun/noin24.do"><img
						src="/gnoincoun/images/banner_07.png" alt="24시노인온상담" /></a></li>
				<!--  <li><a href="/gnoincoun/busiIntroList.do?gubun=gender"><img
						src="/gnoincoun/images/banner_08.png" alt="성인지교육사업" /></a></li> -->
				<li><a href="/gnoincoun/middleCns.do"><img
						src="/gnoincoun/images/banner_09.png" alt="베이비부머 마음돌봄 전화상담" style = "width:310px; height:190px;"/></a></li>
			</div>
		</div>
		<div id="rightQuick" style="margin-left: 760px;">
			<ul class="list">
				<li><a href="https://www.instagram.com/gyeongnosang/" class="nav-instagram">instagram</a></li>
			</ul>
			<ul class="list">
				<li><a href="https://www.facebook.com/gnoin/" class="nav-facebook">facebook</a></li>
			</ul>
			<ul class="list">
				<li><a href="https://www.youtube.com/channel/UCX1sK-yW8JkZI2UAZtla28w" class="nav-yutube">yutube</a></li>
			</ul>
		</div>

				<%-- 
				<div class='banner-one'>
					<a href="/gnoincoun/comfCnsWrite.do"><img
						src="/gnoincoun/images/banner_zero.png" alt="상담 신청하기" style = "width:1120px; height:200px;"/></a>
				</div>
				--%>



				<div class="container content-wrapper" style="padding-bottom:10px;">
			      <div class="content">
			        <div class="acronym" style="display:block">
			          <p style="background-image:url('/gnoincoun/assets/img/acronym03.png');"><strong> 경기도의 31개 시ㆍ군에는
			                  어르신 가까운 곳에 노인상담센터가 있습니다. <span>왼쪽 지도를 클릭하시면 해당 권역 지역 센터가 안내되며, 해당 센터 홈페이지 <img src="/gnoincoun/assets/img/blit_internet.png" align="middle"> 를
			                      클릭하시면 보다 자세히 안내됩니다.
			                  </span></strong>
			          </p>
			        </div>
			        <div class="panel-map sub-map">
			              <h2 class="title">상담센터</h2>
			              <!-- 기관 정보 -->
			              <script language="javascript">
			                function selectGigan(data){ 
			                  for(var i = 1; i <= 10;i++){ 
			                    var boxOn = "details"+data; 
			                    var boxOff = "details"+i; 
			
			                    if(i == data){ 
			                      var boxOn = "details"+data; 
			                      document.getElementById(boxOn).style.display = "block";
			                    } else {
			                      var boxOff = "details"+i; 
			                      document.getElementById(boxOff).style.display = "none";
			                    }	
			
			                  }
			                }
			              </script>
			              <div class="construct">
			                <div class="territory"><img src="/gnoincoun/assets/img/bg_map.png" usemap="#Map" border="0" alt="경기도 지도">
			                  <map name="Map">
			                    <area shape="poly" coords="104,5,123,26,135,23,136,29,163,33,162,45,133,75,133,84,116,89,103,100,88,104,67,118,32,117,24,112,16,120,3,111,3,93,24,88,28,71,32,59,43,52,61,43,70,32,79,15,103,4" href="#" alt="북부권역">
			                    <area shape="poly" coords="165,45,190,59,191,73,180,76,182,111,198,110,233,126,220,136,225,147,217,156,219,185,200,197,195,205,176,210,174,200,150,184,144,174,135,176,137,163,125,159,115,160,122,146,109,140,116,124,104,123,101,105,117,90,133,88,135,76" href="#" alt="동부권역">
			                    <area shape="poly" coords="95,141,81,141,80,146,70,166,73,175,79,179,98,180,105,166,121,147,110,138" href="#" alt="중부권역">
			                    <area shape="poly" coords="45,128,38,136,50,143,41,148,28,162,44,171,66,172,79,141,59,139,59,129,49,124" href="#" alt="서부권역">
			                    <area shape="poly" coords="52,174,47,181,34,176,26,184,30,199,44,191,54,193,43,201,38,211,54,223,69,233,95,231,108,224,131,235,142,230,150,232,155,221,173,212,171,202,153,188,146,186,144,178,131,177,134,163,111,159,99,181,81,181,70,171" href="#" alt="남부권역">
			                  </map>
			                  <ul>
			                    <li onmouseover="javascript:selectGigan('1');">동부권역<em>11</em></li>
			                    <li onmouseover="javascript:selectGigan('2');">서부권역<em>11</em></li>
			                    <li onmouseover="javascript:selectGigan('3');">남부권역<em>13</em></li>
			                    <li onmouseover="javascript:selectGigan('4');">북부권역<em>13</em></li>
			                    <li onmouseover="javascript:selectGigan('5');">중부권역<em>15</em></li>
			                  </ul>
			                </div>
			                <div class="implication">
			                  <div id="details1" class="details table-responsive" style="display: none;">
			                    <h4>동부권역<em>11개 기관</em></h4>
			                    <table class="table table-condensed">
			                      <tbody>
			                        <tr>
			                          <th> 기관명 </th>
			                          <th> 주소 </th>
			                          <th> 전화번호 </th>
			                          <th> 홈페이지 </th>
			                      </tr>
			                      <tr>
			                          <td> 가평군노인복지관 </td>
			                          <td class="l"> 경기도 가평군 가평읍 가화로 161번지 </td>
			                          <td> 031-581-0763 </td>
			                          <td><a href="http://gpsilver.org" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 광주시노인종합복지회관 </td>
			                          <td class="l"> 경기도 광주시 파발로 202 </td>
			                          <td> 031-766-9995 </td>
			                          <td><a href="https://www.gjswc.kr/gjnoin/index.do" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 구리시노인복지관 </td>
			                          <td class="l"> 경기도 구리시 동구릉로 30번길 25-8 </td>
			                          <td> 031-556-9988 </td>
			                          <td><a href="http://www.guriwelfare.or.kr/bbs/view.php?id=TemP_kurinews&page=1" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 남양주시노인복지관 </td>
			                          <td class="l"> 경기도 남양주시 진건읍 진건오남로 359 </td>
			                          <td> 031-573-6598 </td>
			                          <td><a href="http://nyjsw.or.kr " target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 남양주시동부노인복지관 </td>
			                          <td class="l"> 경기도 남양주시 수동면 비룡로 801-47 </td>
			                          <td> 031-559-6099 </td>
			                          <td><a href="http://dongbusenior.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 양평군노인복지관 </td>
			                          <td class="l"> 경기도 양평군·읍 양평대교길 4번길 5 </td>
			                          <td> 031-775-6684 </td>
			                          <td><a href="http://ypsilver21.or.kr " target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 여주시노인복지관 </td>
			                          <td class="l"> 경기도 여주시 여흥로 160번길 27 </td>
			                          <td> 070-4488-4773 </td>
			                          <td><a href="http://yjsilver.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 영락재가복지노인지원서비스센터 </td>
			                          <td class="l"> 경기도 하남시 안터로 29-16 </td>
			                          <td> 031-793-9369 </td>
			                          <td><a href="http://www.youngnak-noin.or.kr/" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 이천시노인종합복지관 </td>
			                          <td class="l"> 경기도 이천시 남천로 31 </td>
			                          <td> 031-636-1361 </td>
			                          <td><a href="http://ichonold.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 해피누리노인복지관 </td>
			                          <td class="l"> 경기도 남양주시 늘을2로 67</td>
			                          <td> 031-593-3000</td>
			                          <td><a href="http://www.js1004.kr/" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 청평노인복지관 </td>
			                          <td class="l"> 경기도 가평군 청평면 은고개로 39</td>
			                          <td>031-582-8879</td>
			                          <td><a href="http://www.8879.or.kr/" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                  </tbody></table>
			                  </div>
			                  <div id="details2" class="details table-responsive" style="display: block;">
			                    <h4>서부권역<em>11개 기관</em> </h4>
			                    <table class="table table-condensed">
			                      <tbody>
			                        <tr>
			                          <th> 기관명 </th>
			                          <th> 주소 </th>
			                          <th> 전화번호 </th>
			                          <th> 홈페이지 </th>
			                      </tr>
			                      <tr>
			                          <td> 광명시립소하노인복지관 </td>
			                          <td class="l"> 경기도 광명시 소하로 25 </td>
			                          <td> 02-2625-9300 </td>
			                          <td><a href="http://gmsenior.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 군포시노인복지관 </td>
			                          <td class="l"> 경기도 군포시 고산로 223 </td>
			                          <td> 070-4480-0037 </td>
			                          <td><a href="http://gpbokji.org" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 군포시늘푸른노인복지관 </td>
			                          <td class="l"> 경기도 군포시 산본천로 101 </td>
			                          <td> 031-392-5755 </td>
			                          <td><a href="http://nprsenior.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 단원구노인복지관 </td>
			                          <td class="l"> 경기도 안산시 단원구 선부광장1로 134 </td>
			                          <td> 031-489-5073 </td>
			                          <td><a href="http://cafe.daum.net/dwsws" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 부천시소사노인복지관 </td>
			                          <td class="l"> 경기도 부천시 범안로 38 </td>
			                          <td> 032-347-0365 </td>
			                          <td><a href="https://senior.bucheon4u.kr/senior/seniorWelfareAgency/seniorWelfareAgency02/seniorWelfareAgency02_1.jsp" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 부천시오정노인복지관 </td>
			                          <td class="l"> 경기도 부천시 성오로 172 </td>
			                          <td> 032-683-9290 </td>
			                          <td><a href="https://senior.bucheon4u.kr/senior/seniorWelfareAgency/seniorWelfareAgency03/seniorWelfareAgency03_1.jsp" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 부천시원미노인복지관 </td>
			                          <td class="l"> 경기도 부천시 부천로 136번길 27 </td>
			                          <td> 070-7545-6914 </td>
			                          <td><a href="https://senior.bucheon4u.kr/senior/seniorWelfareAgency/seniorWelfareAgency01/seniorWelfareAgency01_1.jsp" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 시흥시노인종합복지관 </td>
			                          <td class="l"> 경기도 시흥시 장현능곡로 214 </td>
			                          <td> 031-313-7979 </td>
			                          <td><a href="http://shsenior.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 안산시상록구노인복지관 </td>
			                          <td class="l"> 경기도 안산시 상록구 고잔로 162번지 </td>
			                          <td> 031-414-3271 </td>
			                          <td><a href="http://ansansenior.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 안양시노인종합복지관 </td>
			                          <td class="l"> 경기도 안양시 동안구 경수대로 665번길 74-30 </td>
			                          <td> 031-427-6799 </td>
			                          <td><a href="https://www.aysilver.kr/" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 하안노인종합복지관 </td>
			                          <td class="l"> 경기도 광명시 철망산로 48 </td>
			                          <td> 02-898-8830 </td>
			                          <td><a href="http://www.haansenior.or.kr/" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                  </tbody></table>
			                  </div>
			                  <div id="details3" class="details table-responsive" style="display: none;">
			                    <h4>남부권역<em>13개 기관</em></h4>
			                    <table class="table table-condensed">
			                      <tbody>
			                        <tr>
			                          <th> 기관명 </th>
			                          <th> 주소 </th>
			                          <th> 전화번호 </th>
			                          <th> 홈페이지 </th>
			                        </tr>
			                        <tr>
			                            <td> 화성시동탄노인복지관 </td>
			                            <td class="l"> 경기도 화성시 동탄대로8길 36,<br>화성시동탄호수어울림센터 내 C동 1층 사무실</td>
			                            <td> 031- 8077-1800 </td>
			                            <td><a href=" http://www.dtsenior.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                        </tr>
			                        <tr>
			                            <td> 안성시노인복지관 </td>
			                            <td class="l"> 경기도 안성시 장기로 109 </td>
			                            <td> 031-673-5590 </td>
			                            <td><a href="http://anseongnoin.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                        </tr>
			                        <tr>
			                            <td> 오산노인종합복지관 </td>
			                            <td class="l"> 경기도 오산시 수청로 192, 3F </td>
			                            <td> 031-290-8530 </td>
			                            <td><a href="http://www.osannoin.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                        </tr>
			                        <tr>
			                            <td> 용인시기흥노인복지관 </td>
			                            <td class="l"> 경기도 용인시 기흥구 산양로 71 </td>
			                            <td> 070-4908-6958 </td>
			                            <td><a href="http://ygsenior.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                        </tr>
			                        <tr>
			                            <td> 용인시수지노인복지관 </td>
			                            <td class="l"> 경기도 용인시 수지구 포은대로 435 </td>
			                            <td> 031-270-0035 </td>
			                            <td><a href="http://sujibokji.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                        </tr>
			                        <tr>
			                            <td> 용인시처인노인복지관 </td>
			                            <td class="l"> 경기도 용인시 처인구 중부대로 1199 </td>
			                            <td> 031-324-9304 </td>
			                            <td><a href="http://yiswc.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                        </tr>
			                        <tr>
			                            <td> 평택남부노인복지관 </td>
			                            <td class="l"> 경기도 평택시 중앙1로 56번길 25 </td>
			                            <td> 070-5102-0122 </td>
			                            <td><a href="http://ptsenior.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                        </tr>
			                        <tr>
			                            <td> 평택북부노인복지관 </td>
			                            <td class="l"> 경기도 평택시 서정로 295 </td>
			                            <td> 031-615-3912 </td>
			                            <td><a href="https://bbnoin.or.kr:41004/ " target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                        </tr>
			                        <tr>
			                            <td> 평택서부노인복지관 </td>
			                            <td class="l"> 경기도 평택시 안중읍 서동대로 1557, 서부복지타운 2층 </td>
			                            <td> 031-683-0030 </td>
			                            <td><a href="http://www.sbnoin.net/ " target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                        </tr>
			                        <tr>
			                            <td> 팽성노인복지관 </td>
			                            <td class="l"> 경기도 평택시 팽성읍 팽성남산 4길 6 </td>
			                            <td> 031-650-2661 </td>
			                            <td><a href="https://www.pssenior.or.kr:41006/" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                        </tr>
			                        <tr>
			                            <td> 화성시남부노인복지관 </td>
			                            <td class="l"> 경기도 화성시 향남읍 토성로 37-22 </td>
			                            <td> 031-366-5678 </td>
			                            <td><a href="http://hssenior.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                        </tr>
			                        <tr>
			                            <td> 화성시서부노인복지관 </td>
			                            <td class="l"> 경기도 화성시 남양읍 시청로 155 모두누림센터 4층 </td>
			                            <td> 031-8077-2605 </td>
			                            <td><a href="https://www.hs-seobu.or.kr/" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                        </tr>
									<tr>
			                          <td> 화성시정조효노인복지관 </td>
			                          <td class="l"> 경기도 화성시 용주로 152번길 27 </td>
			                          <td> 031-898-9833 </td>
			                          <td><a href="https://www.jjhyo.or.kr/index.do" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
									</tr>
			                      </tbody>
			                    </table>
			                  </div>
			                  <div id="details4" class="details table-responsive" style="display: none;">
			                    <h4>북부권역<em>13개 기관</em></h4>
			                    <table class="table table-condensed">
			                      <tbody>
			                        <tr>
			                          <th> 기관명 </th>
			                          <th> 주소 </th>
			                          <th> 전화번호 </th>
			                          <th> 홈페이지 </th>
			                      </tr>
			                      <tr>
			                          <td> 고양시덕양노인종합복지관 </td>
			                          <td class="l"> 경기도 고양시 덕양구 어울림로 49 </td>
			                          <td> 031-969-0672 </td>
			                          <td><a href="http://withnoin.org" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 고양시일산노인종합복지관 </td>
			                          <td class="l"> 경기도 고양시 일산동구 호수로 731 </td>
			                          <td> 031-919-9898 </td>
			                          <td><a href="http://ilsansenior.org" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 고양시대화노인종합복지관 </td>
			                          <td class="l"> 경기도 고양시 일산서구 일산로 778 </td>
			                          <td> 070-7707-8614 </td>
			                          <td><a href="http://dh-seniorwelfarecenter.co.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 김포시노인종합복지관 </td>
			                          <td class="l"> 경기도 김포시 사우중로 74번길 48 </td>
			                          <td> 031-8048-1116 </td>
			                          <td><a href="http://gimposenior.org" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 김포시북부노인복지관 </td>
			                          <td class="l"> 경기도 김포시 통진읍 마송1로 16번길 40-2 </td>
			                          <td> 070-7710-3874 </td>
			                          <td><a href="http://gpnsenior.org" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 동두천시노인복지관 </td>
			                          <td class="l"> 경기도 동두천시 동두천로 264 </td>
			                          <td> 070-4173-4142 </td>
			                          <td><a href="http://ddcnoin.org " target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 양주회천노인복지관 </td>
			                          <td class="l"> 경기도 양주시 화합로 1426번길 90, 4층</td>
			                          <td> 031-859-9081 </td>
			                          <td><a href="http://www.yjhcsenior.or.kr/" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 송산노인종합복지관 </td>
			                          <td class="l"> 경기도 의정부시 용민로 99 </td>
			                          <td> 031-852-2674 </td>
			                          <td><a href="http://songsan.ne.kr " target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 신곡노인종합복지관 </td>
			                          <td class="l"> 경기도 의정부시 금신로 297번길 38 </td>
			                          <td> 070-7209-5505 </td>
			                          <td><a href="http://sgwelfare.org " target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 연천군노인복지관 </td>
			                          <td class="l"> 경기도 연천군 연천읍 문화로 108번길 11 </td>
			                          <td> 031-834-6080 </td>
			                          <td><a href="http://lycsenior.org" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 의정부노인종합복지관 </td>
			                          <td class="l"> 경기도 의정부시 경의로 85번길 16-12 </td>
			                          <td> 070-7443-2613 </td>
			                          <td><a href="http://uswc4u.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 파주시노인복지관 </td>
			                          <td class="l"> 경기도 파주시 가나무로 130 </td>
			                          <td> 070-4759-5559 </td>
			                          <td><a href="http://pajusenior.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 포천시노인복지관 </td>
			                          <td class="l"> 경기도 포천시 군내면 청성로 5 </td>
			                          <td> 031-8083-2261 </td>
			                          <td><a href="http://pcsc.kr/" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                  </tbody></table>
			                  </div>
			                  <div id="details5" class="details table-responsive" style="display: none;">
			                    <h4>중부권역<em>15개 기관</em> </h4>
			                    <table class="table table-condensed">
			                      <tbody>
			                        <tr>
			                          <th> 기관명 </th>
			                          <th> 주소 </th>
			                          <th> 전화번호 </th>
			                          <th> 홈페이지 </th>
			                      </tr>
	<!--		                      <tr>
			                          <td> 경기도노인종합상담센터 </td>
			                          <td class="l"> 경기도 수원시 장안구 경수대로 1150 </td>
			                          <td> 031-222-1360 </td>
			                          <td><a href="https://www.gg.go.kr/gnoincoun" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr> -->
			                      <tr>
			                          <td> 과천시노인복지관 </td>
			                          <td class="l"> 경기도 과천시 문원로 57 </td>
			                          <td> 02-509-7631 </td>
			                          <td><a href="http://gcsilver.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 밤밭노인복지관 </td>
			                          <td class="l"> 경기도 수원시 장안구 상률로 53 </td>
			                          <td> 070-7586-8724 </td>
			                          <td><a href="http://bambat.org" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 버드내노인복지관 </td>
			                          <td class="l"> 경기도 수원시 권선구 권선로 564번길 36 </td>
			                          <td> 031-547-6288 </td>
			                          <td><a href="http://budnae.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 분당노인종합복지관 </td>
			                          <td class="l"> 경기도 성남시 분당구 불정로 50 </td>
			                          <td> 031-785-9244 </td>
			                          <td><a href="http://bdsenior.or.kr " target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 서호노인복지관 </td>
			                          <td class="l"> 경기도 수원시 권선구 구운로 4번길 34 </td>
			                          <td> 070-8915-5949 </td>
			                          <td><a href="http://seoho.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 수원시광교노인복지관 </td>
			                          <td class="l"> 경기도 수원시 영통구 센트럴타운로 22 </td>
			                          <td> 031-8006-7423 </td>
			                          <td><a href="http://ggsenior.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 수정노인종합복지관 </td>
			                          <td class="l"> 경기도 성남시 수정구 수정남로 268번길 28 </td>
			                          <td> 031-739-2925 </td>
			                          <td><a href="http://sunobok.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 수정중앙노인종합복지관 </td>
			                          <td class="l"> 경기도 성남시 수정구 성남대로 1480번길 38 </td>
			                          <td> 031-752-3366 </td>
			                          <td><a href="http://sswc.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 의왕시사랑채노인복지관 </td>
			                          <td class="l"> 경기도 의왕시 복지로 109 </td>
			                          <td> 070-8915-5978 </td>
			                          <td><a href="http://noinlove.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 의왕시아름채노인복지관 </td>
			                          <td class="l"> 경기도 의왕시 문화공원로 47 </td>
			                          <td> 070-8915-2222 </td>
			                          <td><a href="http://uwsenior.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 중원노인종합복지관 </td>
			                          <td class="l"> 경기도 성남시 중원구 제일로 35번길 51 </td>
			                          <td> 031-751-6262 </td>
			                          <td><a href="http://jwnoin.org" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 판교노인종합복지관 </td>
			                          <td class="l"> 경기도 성남시 분당구판교역로 99</td>
			                          <td> 031-620-2810 </td>
			                          <td><a href="http://www.pangyonoin.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 팔달노인복지관 </td>
			                          <td class="l"> 경기도 수원시 팔달구 수원천로 343 </td>
			                          <td> 031-248-3800 </td>
			                          <td><a href="http://www.pdsenior.or.kr/" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> SK청솔노인복지관 </td>
			                          <td class="l"> 경기도 수원시 장안구 장안로 174 </td>
			                          <td> 070-4014-3955 </td>
			                          <td><a href="http://scsnoin.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                      <tr>
			                          <td> 황송노인종합복지관 </td>
			                          <td class="l"> 경기도 성남시 중원구 금상로 132 </td>
			                          <td> 031-602-1360 </td>
			                          <td><a href="http://ypinetree.or.kr" target="_blank"><img src="/gnoincoun/assets/img/blit_internet.png"></a></td>
			                      </tr>
			                   </tbody>
			                  </table>
			                  </div>
			                </div>
			              </div>
			              <!-- 기관 정보 //-->
			            </div>
			
			      </div><!-- .content /-->
    </div><!-- .container /-->



		<div class='wrap board-box'>
			<div class='border-header'>
				<h2>센터소식</h2>
				<ul class='border-btn-box'>
					<li><a href="/gnoincoun/centerNewsList.do">센터소식</a></li>
					<li><a href="/gnoincoun/noticeList.do">공지사항</a></li>
					<li><a href="/gnoincoun/docLibraryList.do">문서자료실</a></li>
					<%-- <li><a href="/gnoincoun/freeBoardList.do">자유게시판</a></li>--%>
				</ul>
			</div>
	
			<div class='board-list'>
				<c:forEach items="${centerNewsImage}" var="result" begin="0" end="1"
					step="1" varStatus="status">
					<ul>
						<a href="/gnoincoun/centerNewsDtl.do?num=${result.num}"
							target="_blank">
							<li class='board-image'><img
								src="/gnoincoundb/getImage.do?fileNm=/${result.image}"
								alt="${result.title}" /></li>
							<ul class='board-text'>
								<li class='date'><span class='date_ym'>${result.yearmonth}</span><br>
									<span class='date_d'>${result.date}</span></li>
								<li class='subject'>${result.title}</li>
								<dd class='icon_arrow'></dd>
							</ul>
						</a>
					</ul>
				</c:forEach>
				<c:forEach items="${youtubeList}" var="result" begin="0" end="1"
					step="1" varStatus="status">
					<ul>
						<li class='board-image'>${result.youtube}</li> 
						<%-- <ul class='board-text'>
							<li class='date'><span class='date_ym'>${result.yearmonth}</span><br>
								<span class='date_d'>${result.date}</span></li>
							<li class='subject'>${result.title}</li>
							<dd class='icon_arrow'></dd>
						</ul> --%>
					</ul>
				</c:forEach>
				<!-- <ul>
					<a href="/gnoincoun/centerNewsDtl.do?num=${centerNews0.num}" target="_blank">
						<li class='board-image'>
							<img src="/gnoincoundb/getImage.do?fileNm=/${centerNews0.image}" alt="${centerNews0.title}"/>
						</li>
					<ul class='board-text'>
						<li class='date'>
							<span class='date_ym'>${centerNews0.yearmonth}</span><br>
							<span class='date_d'>${centerNews0.date}</span>
						</li>
						<li class='subject'>${centerNews0.title}</li>
						<dd class='icon_arrow'></dd>
					</ul>
					</a>
				</ul>

				<ul>
					<a href="/gnoincoun/centerNewsDtl.do?num=${centerNews1.num}" target="_blank">
						<li class='board-image'>
							<img src="/gnoincoundb/getImage.do?fileNm=/${centerNews1.image}" alt="${centerNews1.title}"/>
						</li>
					<ul class='board-text'>
						<li class='date'>
							<span class='date_ym'>${centerNews1.yearmonth}</span><br>
							<span class='date_d'>${centerNews1.date}</span>
						</li>
						<li class='subject'>${centerNews1.title}</li>
						<dd class='icon_arrow'></dd>
					</ul>
					</a>
				</ul>

				<ul>
					<a href="/gnoincoun/centerNewsDtl.do?num=${centerNews2.num}" target="_blank">
						<li class='board-image'>
							<img src="/gnoincoundb/getImage.do?fileNm=/${centerNews2.image}" alt="${centerNews2.title}"/>
						</li>
					<ul class='board-text'>
						<li class='date'>
							<span class='date_ym'>${centerNews2.yearmonth}</span><br>
							<span class='date_d'>${centerNews2.date}</span>
						</li>
						<li class='subject'>${centerNews2.title}</li>
						<dd class='icon_arrow'></dd>
					</ul>
					</a>
				</ul>

				<ul>
					<a href="/gnoincoun/centerNewsDtl.do?num=${centerNews3.num}" target="_blank">
						<li class='board-image'>
							<img src="/gnoincoundb/getImage.do?fileNm=/${centerNews3.image}" alt="${centerNews3.title}"/>
						</li>
					<ul class='board-text'>
						<li class='date'>
							<span class='date_ym'>${centerNews3.yearmonth}</span><br>
							<span class='date_d'>${centerNews3.date}</span>
						</li>
						<li class='subject'>${centerNews3.title}</li>
						<dd class='icon_arrow'></dd>
					</ul>
					</a>
				</ul> -->
			</div>



			<div class="swiper-container mySwiper site-list">
				<div class="swiper-wrapper">
				
					<div class="swiper-slide">
						<a href="https://www.gg.go.kr/">
							<img src="/gnoincoun/images/site_02.png" alt="경기도청" />
						</a>
					</div>
					
					<div class="swiper-slide">
						<a href="https://gg.pass.or.kr/">
							<img src="/gnoincoun/images/site_03.png" alt="경기도사회서비스원" />
						</a>
					</div>
					
					<div class="swiper-slide">
						<a href="http://www.mohw.go.kr/">
							<img src="/gnoincoun/images/site_01.png" alt="보건복지부" />
						</a>
					</div>
					
					<div class="swiper-slide">
						<a href="https://ggwf.gg.go.kr/">
							<img src="/gnoincoun/images/site_04.png" alt="경기복지재단" />
						</a>
					</div>
					
					<div class="swiper-slide">
						<a href="https://www.ggwf.or.kr/">
							<img src="/gnoincoun/images/site_05.png" alt="경기복지플랫폼" />
						</a>
					</div>
					
					<div class="swiper-slide">
						<a href="https://www.gg.go.kr/oldman_job/">
							<img src="/gnoincoun/images/site_06.png" alt="경기도노인일자리지원센터" />
						</a>
					</div>
					
					<div class="swiper-slide">
						<a href="https://ggss.or.kr/">
							<img src="/gnoincoun/images/site_07.png" alt="경기도지역사회서비스지원단" />
						</a>
					</div>
					
					<div class="swiper-slide">
						<a href="https://gg1389.or.kr/">
							<img src="/gnoincoun/images/site_08.png" alt="경기도노인보호전문기관" />
						</a>
					</div>
					<%--
					<div class="swiper-slide">
						<a href="https://gepa.co.kr/">
							<img src="/gnoincoun/images/site_08.png" alt="경기도노인보호전문기관" />
						</a>
					</div>
					
					<div class="swiper-slide">
						<a href="https://kg1389.or.kr/">
							<img src="/gnoincoun/images/site_09.png" alt="경기동부노인보호전문기관" />
						</a>
					</div>
					
					<div class="swiper-slide">
						<a href="https://www.gnnoin.kr/">
							<img src="/gnoincoun/images/site_10.png" alt="경기북부노인보호전문기관" />
						</a>
					</div>
					
					<div class="swiper-slide">
						<a href="https://www.ggw1389.or.kr/main/main.php/">
							<img src="/gnoincoun/images/site_11.png" alt="경기서부노인보호전문기관" />
						</a>
					</div>
					 --%>
					
					<div class="swiper-slide">
						<a href="http://www.gaswc.or.kr/">
							<img src="/gnoincoun/images/site_12.png" alt="경기도노인종합복지관협회" />
						</a>
					</div>
					
					<div class="swiper-slide">
						<a href="https://gyeonggi.nid.or.kr/">
							<img src="/gnoincoun/images/site_13.png" alt="경기도광역치매센터" />
						</a>
					</div>
					
					<div class="swiper-slide">
						<a href="http://www.kgacold.co.kr/">
							<img src="/gnoincoun/images/site_14.png" alt="경기도재가노인복지협회" />
						</a>
					</div>
					
					<div class="swiper-slide">
						<a href="http://www.noininfo.or.kr/">
							<img src="/gnoincoun/images/site_15.png" alt="경기도노인복지시설엽합회" />
						</a>
					</div>
					
					<div class="swiper-slide">
						<a href="https://www.mentalhealth.or.kr/">
							<img src="/gnoincoun/images/site_17.png" alt="경기도정신건강복지센터" />
						</a>
					</div>
					
					<div class="swiper-slide">
						<a href="https://ggscw.or.kr/">
							<img src="/gnoincoun/images/site_18.png" alt="경기도장기요양요원지원센터" />
						</a>
					</div>
					
					<div class="swiper-slide">
						<a href="http://www.koreapeople.co.kr/">
							<img src="/gnoincoun/images/site_19.png" alt="(사)대한노인회" />
						</a>
					</div>
					
					
					<div class="swiper-slide">
						<a href="https://www.mois.go.kr/frt/sub/a03/corruptionDeclareInfo/screen.do">
							<img src="/gnoincoun/images/site_20.png" alt="행안부 공직비리익명신고" />
						</a>
					</div>
					
				</div>
				<div class='swiper-button-prev'></div>
				<div class="swiper-button-next"></div>
			</div>

		</div>

		<div id="footer">
			<div class='footer-top'>
				<div class='wrap'>
					<!-- <div class='logo-image'>
						<img src="/gnoincoun/images/logo_slogan_white.png" />
					</div> -->
					<div class='text-content'>
						<p>경기도노인종합상담센터</p>
						<div>16207  경기도 수원시 장안구 경수대로 1150, 건강증진센터 1층 고유번호 : 722-82-00367<br>
							  전화 :  031-222-1360     팩스 : 070-4832-6366     이메일 :  ggnoincoun@gmail.com</div>
					</div>
					
					<select class="selectpicker" onchange="if(this.value) window.open(this.value);" style="height:30px; float:right; position:relative; font-size:16px; appearance:menulist; color:black;">
						<option value="">유관사이트 바로가기</option>
						<option value="https://www.gg.go.kr/">경기도청</option>
						<option value="https://gg.pass.or.kr/">경기도사회서비스원</option>
						<option value="https://ggwf.gg.go.kr/">경기복지재단</option>
						<option value="https://www.ggwf.or.kr/">경기복지플랫폼</option>
						<option value="https://www.gg.go.kr/oldman_job/">경기도노인일자리지원센터</option>
						<option value="https://ggss.or.kr/">경기도지역사회서비스지원단</option>
						<option value="https://gepa.co.kr/">경기도노인보호전문기관</option>
						<option value="https://kg1389.or.kr/">경기동부노인보호전문기관</option>
						<option value="https://www.gnnoin.kr/">경기북부노인보호전문기관</option>
						<option value="https://www.ggw1389.or.kr/main/main.php/">경기서부노인보호전문기관</option>
						<option value="http://www.gaswc.or.kr/">경기도노인종합복지관협회</option>
						<option value="https://gyeonggi.nid.or.kr/home/main/main.aspx/">경기도광역치매센터</option>
						<option value="http://www.kgacold.co.kr/">경기도재가노인복지협회</option>
						<option value="http://noininfo.or.kr/">경기도노인복지시설엽합회</option>
						<!-- <option value="https://happycam5060.or.kr:45870/">경기도중장년해피캠퍼스 남부센터</option> -->
						<option value="https://www.mentalhealth.or.kr/">경기도정신건강복지센터</option>
						<option value="http://www.mohw.go.kr/">보건복지부</option>
						<option value="https://ggscw.or.kr/">경기도장기요양요원지원센터</option>
						<option value="http://www.koreapeople.co.kr/">(사)대한노인회</option>
					</select>

				</div> 
			</div>
			<div class='footer-bottom'>
				<div class='wrap'>
					<!--<span><a href="">이용약관</a></span> -->
					<span><a href="/gnoincoun/noticeDtl.do?num=57">개인정보처리방침</a></span>
					<span><a href="/gnoincoun/noticeDtl.do?num=60">이메일무단수집거부</a></span>
					<!--<span><a href="/gnoincoun/noticeDtl.do?num=61">장애인차별금지법</a></span>-->
					<span><a href="/gnoincoun/directions.do">찾아오시는 길</a></span>
					<span class='copyright'>Copyright (c) 2021 GNOIN. All rights reserved.</span>
				</div>
			</div>

		</div>


	</div>
</body>
</html>