<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>인사말</title>
    <link href="/gnoincoun/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/gnoincoun/assets/css/font-awesome.min.css" rel="stylesheet">
    <script src="/gnoincoun/assets/js/ie-emulation-modes-warning.js"></script>
    <link href="/gnoincoun/assets/css/theme.css" rel="stylesheet">
    <link rel="stylesheet" href="/gnoincoun/css/style2.css" />
    <style>
    	h2 {
		  font-size: 26px;
		  margin: 20px 0;
		  text-align: center;
		  small {
		    font-size: 0.5em;
		  }
			}
		
		.responsive-table {
		  li {
		    border-radius: 3px;
		    padding: 10px 15px;
		    display: flex;
		    justify-content: space-between;
		    margin-bottom: 15px;
		  }
		  .table-header {
		    background-color: #95A5A6;
		    font-size: 15px;
		    text-transform: uppercase;
		    letter-spacing: 0.03em;
		  }
		  .table-row {
		    background-color: #ffffff;
		    box-shadow: 0px 0px 9px 0px rgba(0,0,0,0.1);
		    font-size:13.5px;
		  }
		  .table-header .col-1 {
		    flex-basis: 25%;
		  }
		  .table-header .col-2 {
		    flex-basis: 40%;
		  }
		  .table-header .col-3 {
		    flex-basis: 20%;
		  }
		  .table-header .col-4 {
		    flex-basis: 11%;
		  }
		  
		  @media all and (max-width: 767px) {
		    .table-header {
		      display: none;
		    }
		    .table-row{
		      
		    }
		    li {
		      display: block;
		    }
		    .col {
		      
		      flex-basis: 100%;
		      
		    }
		    .col {
		      display: flex;
		      padding: 10px 0;
		      &:before {
		        color: #6C7A89;
		        padding-right: 10px;
		        content: attr(data-label);
		        flex-basis: 50%;
		        text-align: right;
		      }
		    }
		  }
		}
    </style>
    <script>
    
    	$(document).ready(function(){
    		
    		console.log("Page Load Success");
    		
    	});
    	
    	function listCenter(name){
    			
    		
    		$("#nowMap").html(name);
    		
    		$.ajax({
				type : "POST",
				url : "/gnoincoun/relatedCenterAjax.do",
				data : {"reloadtName":name} , 
				dataType : "json",
				success : function(json) {
					
					var list = json.resultList;
					var length = list.length;
										
					if($(".responsive-table").children().length >= 2){
						
						$(".responsive-table").html('<li class="table-header"><div class="col col-1">기관명</div><div class="col col-2">주소</div><div class="col col-3">전화번호</div><div class="col col-4">홈페이지</div></li>');
						
					}
					
					for(var index = 0; index<length; index++){
						
						console.log(list[index]);
						
						var html = '<li class="table-row">'
							  +' <div class="col col-1" data-label="Job Id" style="flex-basis: 25%">'+list[index].relOrgNm+'</div>'
							  +' <div class="col col-2" data-label="Job Id" style="flex-basis: 40%">'+list[index].addr+'</div>'
							  +' <div class="col col-3" data-label="Job Id" style="flex-basis: 20%">'+list[index].tel+'</div>'
							  +' <div class="col col-4" data-label="Job Id" style="flex-basis: 11%">'
							  +' <a href="'+list[index].url+'">'
							  +'<image src="/gnoincoun/images/browserIcon.png" onclick="goLink(60)">'
							  +'</a>'
							  +'</div>'
							  +'</li>'
						
						$(".responsive-table").append(html);
					}
					
					
				},
				error : function(e) {
				  	console.log(e);
				}
			});
    	
    	}
    
    </script>
    
  </head>
  <body>
    <!-- 컨텐츠  ================================================== -->
    <!-- 서브 비쥬얼 영역 -->
    <section class="title_explain hidden-xs">
      <div class="container">
        <dl>
          <dt>
            시·군 노인상담센터    </dt>
          <dd class="explanation">
            경기도가 하나로, 함께하여 더욱 가까워집니다.    </dd>
          <dd class="explanEng">
            Counseling Center    </dd>
        </dl>
      </div>
    </section>
    <!-- 서브 비쥬얼 영역 //-->
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
              <div class='map-box'>
					<div class='main-title'>
						<div class='left' style= "flex:0.46">
							<img src="/gnoincoun/images/map/icon_map.png" alt="icon"
								class='map_icon' />&nbsp;지도에 표시된 지역을 선택해주세요
						</div>
						<div>
							선택지역 : <span id='nowMap'></span>
						</div>
					</div>
					<div class='main-content'>
						<div class='left' style="flex:0.48">
							<div class='map_img'>
								<img src="/gnoincoun/images/map/map.png" alt="경기도청"
									usemap="#marker" />
								<map name="marker">
									<area shape="poly"
										coords="215,109,233,78,254,91,253,98,269,101,273,121,261,126,252,133,249,147,246,153,253,157,253,165,246,166,254,175,256,191,250,202,257,207,257,217,249,216,241,219,238,217,237,205,233,196,230,192,222,189,212,197,212,182,197,158,188,154,193,129,198,135,200,115,211,109"
										href="javascript:listCenter('가평군');" alt="가평" />
									<area shape="poly"
										coords="88,215,92,199,102,195,111,200,114,193,109,185,99,189,93,189,96,170,68,171,64,180,33,183,36,189,66,207,65,206"
										href="javascript:listCenter('고양시');" alt="고양" />
									<area shape="circle" coords="122,237,18"
										href="javascript:listCenter('과천시');" alt="과천" />
									<area shape="rectangle" coords="75,216,101,249"
										href="javascript:listCenter('광명시');" alt="광명" />
									<area shape="poly"
										coords="152,291,171,274,171,250,191,248,195,237,201,233,212,248,209,262,226,289,213,298,204,303,201,314,187,313,188,293,173,286,169,286"
										href="javascript:listCenter('광주시');" alt="광주" />
									<area shape="circle" coords="142,206,17"
										href="javascript:listCenter('구리시');" alt="구리" />
									<area shape="circle" coords="96,303,17"
										href="javascript:listCenter('군포시');" alt="군포" />
									<area shape="poly"
										coords="0,160,7,157,27,152,39,198,29,195,25,211,7,211,-0,192,157"
										href="javascript:listCenter('김포시');" alt="김포" />
									<area shape="poly"
										coords="157,169,181,161,201,165,212,191,206,204,192,238,188,212,168,210,163,214,162,196,158,187,147,186,155,169"
										href="javascript:listCenter('남양주시');" alt="남양주" />
									<area shape="circle" coords="139,114,18"
										href="javascript:listCenter('동두천시');" alt="동두천" />
									<area shape="circle" coords="55,234,20"
										href="javascript:listCenter('부천시');" alt="부천" />
									<area shape="circle" coords="150,262,17"
										href="javascript:listCenter('성남시');" alt="성남" />
									<area shape="poly"
										coords="137,314,132,327,113,332,114,323,107,320,116,309,115,302,127,309,138,309,141,308"
										href="javascript:listCenter('수원시');" alt="수원" />
									<area shape="circle" coords="54,274,17"
										href="javascript:listCenter('시흥시');" alt="시흥" />
									<area shape="poly"
										coords="53,304,63,291,77,278,84,281,76,297,75,308,70,314"
										href="javascript:listCenter('안산시');" alt="안산" />
									<area shape="poly"
										coords="146,376,148,389,156,393,156,401,148,409,161,409,169,417,169,425,179,421,194,419,216,413,217,402,233,391,233,389,245,375,245,370,237,360,225,355,223,362,225,369,221,373,217,366,197,369,189,361,181,359,173,372,156,376,154,375"
										href="javascript:listCenter('안성시');" alt="안성" />
									<area shape="circle" coords="101,268,16"
										href="javascript:listCenter('안양시');" alt="안양" />
									<area shape="poly"
										coords="98,186,108,182,120,186,118,180,114,173,116,159,121,150,137,149,145,147,146,134,130,134,121,128,119,118,118,109,112,109,103,133,105,134,98,137,97,153,105,155,101,165,100,176,101,178"
										href="javascript:listCenter('양주시');" alt="양주" />
									<area shape="poly"
										coords="309,287,301,237,319,230,321,227,316,222,296,195,282,204,266,199,257,205,263,212,258,217,252,217,235,218,234,199,231,196,206,205,197,235,208,234,215,249,212,258,217,266,221,261,228,263,241,263,249,263,257,271,264,265,277,269,280,266,292,269,292,269,296,272,296,281"
										href="javascript:listCenter('양평군');" alt="양평" />
									<area shape="poly"
										coords="221,269,226,285,237,287,254,297,256,305,253,311,253,318,252,330,249,345,259,344,267,343,283,355,288,357,303,332,305,318,307,303,305,286,291,279,279,270,269,274,264,269,255,272,248,270,247,265,231,267,231,271"
										href="javascript:listCenter('여주시');" alt="여주" />
									<area shape="poly"
										coords="94,48,81,52,86,60,83,72,82,78,73,89,77,94,86,90,93,97,90,86,104,93,115,85,122,90,114,105,119,109,128,94,141,94,154,89,153,77,147,75,143,65,156,66,161,69,165,68,160,47,162,26,145,13,145,3,138,2,123,17,114,20,106,33,101,37,113,45,111,48,96,48"
										href="javascript:listCenter('연천군');" alt="연천" />
									<area shape="circle" coords="127,350,17"
										href="javascript:listCenter('오산시');" alt="오산" />
									<area shape="poly"
										coords="157,331,159,341,148,355,143,357,149,365,155,371,172,375,171,362,181,356,193,360,193,368,214,368,225,371,220,361,222,356,216,352,213,349,216,346,197,334,198,312,181,313,185,292,172,289,147,302,140,322,135,328,152,328"
										href="javascript:listCenter('용인시');" alt="용인" />
									<area shape="circle" coords="128,289,16"
										href="javascript:listCenter('의왕시');" alt="의왕" />
									<area shape="circle" coords="135,169,18"
										href="javascript:listCenter('의정부시');" alt="의정부" />
									<area shape="poly"
										coords="208,305,198,333,220,345,222,353,231,355,247,366,248,379,241,382,269,377,273,368,275,352,261,338,255,346,247,346,241,337,247,336,251,301,229,290,229,289"
										href="javascript:listCenter('이천시');" alt="이천" />
									<area shape="poly"
										coords="39,105,34,135,27,151,39,184,45,181,61,179,67,169,89,168,97,165,100,156,93,153,91,136,97,129,101,116,107,107,115,95,78,96,75,101,69,97,65,93,38,97,38,97"
										href="javascript:listCenter('파주시');" alt="파주" />
									<area shape="poly"
										coords="90,430,82,417,74,401,89,374,109,373,115,367,141,370,145,377,144,392,153,397,140,409,120,421,109,417"
										href="javascript:listCenter('평택시');" alt="평택" />
									<area shape="poly"
										coords="162,32,173,41,187,33,182,45,186,49,193,59,204,53,215,53,226,53,226,66,221,91,205,106,201,112,198,128,193,128,184,158,180,158,156,164,150,148,148,148,150,130,157,129,161,114,160,101,152,93,161,88,153,73,149,68,164,69,167,69,161,50,162,38"
										href="javascript:listCenter('포천시');" alt="포천" />
									<area shape="circle" coords="171,230,17"
										href="javascript:listCenter('하남시');" alt="하남" />
									<area shape="poly"
										coords="42,322,37,336,32,346,42,346,37,359,47,365,48,349,57,341,58,343,70,353,57,359,60,377,53,386,73,401,84,380,89,373,105,374,113,369,106,357,105,342,109,334,113,329,103,322,77,323,67,313,56,321,58,321,53,321"
										href="javascript:listCenter('화성시');" alt="화성" />
								</map>
							</div>
						</div>

						<div class='right'>
							<div class='map-search'>
								<div class='map-search-text'>

									 <ul class="responsive-table">
									    <li class="table-header">
									      <div class="col col-1">기관명</div>
									      <div class="col col-2">주소</div>
									      <div class="col col-3">전화번호</div>
									      <div class="col col-4">홈페이지</div>
									    </li>

									  </ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
              
              
             
              <!-- 기관 정보 //-->
            </div>
      
      </div><!-- .content /-->
    </div><!-- .container /-->

    <script src="/gnoincoun/assets/js/jquery.min.js"></script>
    <script src="/gnoincoun/assets/js/bootstrap.min.js"></script>
    <script src="/gnoincoun/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>