<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="file:///C|/Users/asdf/Documents/favicon.ico">
    <title>상담문의하기</title>
    <!-- Bootstrap core CSS -->
    <link href="/gnoincoun/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/gnoincoun/assets/css/font-awesome.min.css" rel="stylesheet">
    <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/gnoincoun/assets/js/ie-emulation-modes-warning.js"></script>
    <script src="/gnoincoun/js/jquery-1.11.2.min.js" ></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.min.js"></script>
      <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <!-- Custom styles for this template -->
    <link href="/gnoincoun/assets/css/theme.css" rel="stylesheet">
      <style>
	  	#cntn::placeholder {
		  color: red;
		}
	  </style>
  </head>
  <script>
  
	$(document).ready(function() {
		var writer = "${cnsrNm}";
  		$("#writer").val(writer);
	});
	
	function fn_onlineCnsReg() {
		if(confirm("등록 하시겠습니까?")){
			document.frm.action = "/gnoincoun/onlineCnsReg.do";
	       	document.frm.submit();
		}	
	}
  </script>
  <body>
    <!-- 서브 비쥬얼 영역 -->
    <section class="title_explain hidden-xs">
      <div class="container">
        <dl>
          <dt>
            소통의 공간    </dt>
          <dd class="explanation">
            함께 나누는 사랑, 모두가 행복해집니다.    </dd>
          <dd class="explanEng">
            Communication Board    </dd>
        </dl>
      </div>
    </section>
    <!-- 서브 비쥬얼 영역 //-->
    <div class="container content-wrapper">
      <div class="page-header">
        <h1 class="title"><i class="fa fa-comments-o"></i>온라인상담</h1>
        <ol class="breadcrumb">
          <li><a href="/gnoincoun/homepageMainList.do">홈</a></li>
          <li><a href="#">소통의 공간</a></li>
          <li class="active">온라인상담</li>
        </ol>
      </div>
      <div class="content-area">
        <form class="form-wrap" id="frm" name="frm" method="post" enctype="multipart/form-data">
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label class="control-label" for="title">제목<i class="cr">*</i></label>
                <input type="text" class="form-control" id="title" name="title">
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
	            <label class="control-label" for="writer">작성자<i class="cr">*</i></label>
	            <input type="text" class="form-control" id="writer" name="writer" readonly="readonly">
              </div>
            </div>
            <div class="col-sm-6">
              <label class="control-label" for="openStatYn">공개유무<i class="cr">*</i></label>
              <!--<div class="label-tit">공개유무</div>-->
              <div class="form-group">
                <span class="radio-custom">
                    <input type="radio" name="openStatYn" id="openStatYn1" value="Y">
                    <label for="openStatYn1"><i></i><span>공개</span></label>
                </span>
                <span class="radio-custom">
                    <input type="radio" name="openStatYn" id="openStatYn2" value="N">
                    <label for="openStatYn2"><i></i><span>비공개</span></label>
                </span>
              </div>
            </div>
          </div>
          </div>
          <div class="form-group">
            <label class="control-label" for="cntn">내용</label>
            <textarea rows="5" class="form-control" id="cntn" name="cntn" placeholder="자세한 상담을 희망하실 경우 전화번호를 남겨주시기 바랍니다."></textarea>
          </div>
          <!-- 파일첨부 -->
          <!-- <div class="form-group clearfix">
            <label class="control-label" for="">첨부파일</label>
            <div class="filebox"> <input class="upload-name" value="파일선택" disabled="disabled"><label for="ex_filename">파일</label> <input type="file" id="ex_filename" name="file" class="upload-hidden"></div>
          </div> -->
          <!-- 등록하기 -->
          <div class="btn-wrap line bt bb pt10 pb10 mt20 text-center hidden-xs">
            <button type="button" onclick="javascript:fn_onlineCnsReg();"class="btn btn-primary btn-lg fr">등록하기</button>
          </div>
           <!-- 모바일용 -->
          <div class="btn-wrap line bt mt20 pt20 pb20  visible-xs">
            <button type="button" onclick="javascript:fn_onlineCnsReg();" class="btn btn-primary btn-lg w100p">등록하기</button>
          </div>
          
        </form>
      </div><!-- .content-area /-->
    </div><!-- .container.content-wrapper /-->
    <!-- FOOTER -->
    <footer>
      <div class="copyaddress">
        <ul>
          <li><b>경기도노인종합상담센터</b></li>
          <li><span>주소 : </span><a href="javascript:top_address()">경기도 수원시 장안구 경수대로 1150, 도서관 3층</a></li>
          <li><span>사업자등록번호 : </span>722-82-00367<span class="ml10">대표 : </span>김미나</li>
          <li><span> TEL : </span> <a href="javascript:top_tel()">031-222-1360</a></li>
          <li><span> FAX : </span><a href="javascript:top_fax()">070-4832-6366</a></li>
          <li><span>E-mail : </span><a href="javascript:top_email()">ggnoincoun@gmail.com</a></li>
          <li><span>개인정보담당자 : </span>김지원  </li>
          <li class="copyright">COPYRIGHT(c) <b>GNOIN</b> ALL RIGHT RESERVED</li>
        </ul>
      </div>
    </footer>

    <script src="/gnoincoun/assets/js/jquery.min.js"></script>
    <script src="/gnoincoun/assets/js/bootstrap.min.js"></script>
    <!--<script src="assets/js/docs.min.js"></script>-->
    <script src="/gnoincoun/assets/js/ie10-viewport-bug-workaround.js"></script>
    <script>
      $(document).ready(function(){ 
        // 로그인 회원가입 관리자 메뉴  
          $('.navbar-toggle').on('click', function() {
            $('.social-icons').fadeToggle(200);
          });
        
        // 첨부파일 
        var fileTarget = $('.filebox .upload-hidden'); 
        fileTarget.on('change', function(){  // 값이 변경되면 
          if(window.FileReader){ // modern browser 
            var filename = $(this)[0].files[0].name; 
          } 
          else {  // old IE 
              var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출 
          } 
          // 추출한 파일명 삽입 
          $(this).siblings('.upload-name').val(filename); 
          }); 
        
        
        });
		</script>
  </body>