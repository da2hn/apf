<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
    <script>
	  $(document).ready(function() {
		  
		  $('input:radio[name=gender]:input[value="${sessionScope.LoginVO.gender}"]').attr("checked", true);
		  $("#cnsleNm").val("${sessionScope.LoginVO.userNm}");
		  $("#telNo").val("${sessionScope.LoginVO.mobile}");
		  let today = new Date();
		  var year = today.getFullYear(); // 년도
		  var month = today.getMonth()+1;  // 월
		  var date = today.getDate();  // 날짜
		  var nowDate = year+"."+month+"."+date;
		  $("#writeDt").val(nowDate);
		  
	  });
	  
	  /* function fn_reg() {
		  if(confirm("등록 하시겠습니까?")){
			var total = 0;
			var no;
			for(i=1; i<26; i++) {
				no = $('input[name="no'+i+'"]:checked').val();
				if(no  == "Y") {
					total++;
				}
			}
			$("#sumCnt").val(total);
			var param = $("#frm").serialize(); 
			$.ajax({
				type : "POST",
				url : "/psyPerRelDocRegAjax.do",
				data : param,
				dataType : "json",
				success : function(json) {
					alert("심리검사 결과 점수는"+json.sumCnt+"점 입니다.");
				},
				error : function(e) {
					alert("서버와 통신 오류입니다.");
				}
			});
		  }
		} */
	  
	  function fn_reg() {
			
		  var arr = [];
		  for(i=1; i<35; i++) {
			  arr[i] = $('input[name="no'+i+'"]:checked').val();
			  
			  if (arr[i] == undefined) {
				  alert(i+"번 내용을 입력해주세요");
				  return false;
			  }
		  }	
		  
		  var total = 0;
		  var sumCnt = $("#sumCnt").val();
		  if(sumCnt != "") {
			  if(confirm("자가진단을 다시 하시겠습니까?")){
				  location.href="/gnoincoun/psyStressDoc.do";
				  return false;
			  }
			  return false;
		  }
		  if(confirm("자가진단 작성을 완료하셨습니까?")){
		    var no;
		    for(i=1; i<35; i++) {
		   	    no = $('input[name="no'+i+'"]:checked').val();
		   		total = total+parseInt(no);
		    }
			$("#sumCnt").val(total);
			var param = $("#frm").serialize(); 
			$.ajax({
				type : "POST",
				url : "/gnoincoun/psyStressDocRegAjax.do",
				data : param,
				dataType : "json",
				success : function(json) {
					showAlert(total);
					//alert("스트레스척도 심리검사 결과 점수는"+total+"점 입니다.");
				},
				error : function(e) {
					alert("서버와 통신 오류입니다.");
				}
			});
		  }
		}
		
		function showAlert(total) {
            const alertHTML =
            '<div class="alert-container">' +
            '<h3 style="margin-top: 10px;">스트레스척도</h3>' +
            '<div class="alert-header">&#9745; 검사결과</div>' +
            '<div>귀하의 검사 결과는 ' + total + '점입니다.</div>' +
            '<div class="alert-body">' +
            '<div>• 점수가 높을수록 스트레스의 정도가 크다는 것을 의미합니다.</div>' +
            '<div>• 심각한 수준(102점 이상)</div>' +
            '<div>&nbsp;&nbsp;&nbsp;스트레스로 인해 일상생활에서의 어려움이 나타날 수 있습니다.</div>' +
            '</div>' +
            '<div class="alert-footer">' +
            '자가검진의 결과가 정신과적 진단을 의미하는 것은 아닙니다.<br>' +
            '점수와 관계없이 정신건강이 염려되는 경우 거주하시는 곳의<br>' +
            '정신건강복지센터 혹은 정신건강의학과 등<br>' +
            '전문가의 도움을 받아보시기 바랍니다.' +
            '</div>' +
            '<button class="close-btn" onclick="closeAlert()">닫기</button>' +
            '</div>';
            
            const alertContainer = document.createElement('div');
            alertContainer.innerHTML = alertHTML;
            document.body.appendChild(alertContainer);
        }

        function closeAlert() {
        	const alertContainer = document.querySelector('.alert-container');
            if (alertContainer) {
                alertContainer.parentNode.removeChild(alertContainer);
            } 
        }
  </script>
<style>
	#wrap {width: 70%; margin: auto;}
	.alert-container {
            position: fixed;
			top: 27%;
			left: 50%;
			transform: translate(-50%, -50%);
			width: 502px;
			padding: 20px;
			background-color: white;
			border: 1px solid #ccc;
			box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
			z-index: 1000;
        }
        .alert-header {
            font-weight: bold;
			font-size: 17px;
            margin-bottom: 10px;
        }
        .alert-body {
            background-color: #e6f0ff;
            padding: 10px;
			margin: 10px;
        }
        .alert-footer {
            font-size: 15px;
            color: #555;
        }
        .close-btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            float: right;
        }
</style>
<section class="service-2 section">
	<div id="wrap">
        <h2 class="title">스트레스척도</h2>
      	<form id="frm" name="frm" method="post">
      	   <input type="hidden" id="cnsleId" name="cnsleId" value="${sessionScope.LoginVO.userId}" >
            <!-- 
            <table class="table table-condensed">
                <caption>스트레스척도</caption>
                <colgroup>
                    <col width="50px"/>
	       			<col width="90px"/>
	       			<col width="60px"/>
	       			<col width="100px"/>
	       			<col width="60px"/>
	       			<col width="80px"/>
                </colgroup>
                <tbody>
                    <tr>
                      <th scope="col" style="vertical-align: middle; text-align: center;">이&nbsp;&nbsp;&nbsp;&nbsp;름</th>
                      <td>
                          <input type="text" class="form-control" id="cnsleNm" name="cnsleNm" readonly="readonly">
                      </td>
                      <th scope="col" style="vertical-align: middle; text-align: center;">연락처</th>
                      <td>
                          <input type="text" class="form-control" id="telNo" name="telNo" readonly="readonly" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                      </td>
                      <th scope="col" style="vertical-align: middle; text-align: center;">검사일</th>
                      <td>
                          <input type="text" class="form-control" id="writeDt" name="writeDt" readonly="readonly" >
                      </td>
                    </tr>
                </tbody>
            </table>
             -->
            <div class="txt mt15">
                ※ 다음은 어르신이 평상시 일상생활에서 경험할 수 있는 것들입니다. <span class="txt-Under">“지난 1년 동안”</span>을 돌이켜 보면서 어르신께서 경험을 통해서 마음이 얼마나 상하였는지 어르신의 느낌이나 생각과 잘 맞는 곳에 ‘√’표 해주십시오.
            </div>
            <table class="table table-condensed">
                <caption>스트레스척도</caption>
                <colgroup>
                    <col style="width: 5%;" />
                    <col style="width: 50%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                    <col style="width: 8%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="2">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
                        <th scope="col">전혀<br>그렇지<br>않다</th>
                        <th scope="col">대체로<br>그렇지<br>않다</th>
                        <th scope="col">보통<br>이다</th>
                        <th scope="col">대체로<br>그렇다</th>
                        <th scope="col" class="bRight-none">매우<br>그렇다</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="bRight-none">1.</td>
                        <td class="txt-left">가족(자녀, 손자녀)들이 나와 함께 대화하는 시간이 줄어들거나 대화를 회피했다.</td>
                        <td><input type="radio" id="no11" name="no1" value="1" /></td>
                        <td><input type="radio" id="no12" name="no1" value="2" /></td>
                        <td><input type="radio" id="no13" name="no1" value="3" /></td>
                        <td><input type="radio" id="no14" name="no1" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no15" name="no1" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">2.</td>
                        <td class="txt-left">나는 가족(아들, 딸, 며느리)들과 갈등을 일으키는 일이 있었다.(예: 제사문제, 집안 살림, 경제 등)</td>
                        <td><input type="radio" id="no21" name="no2" value="1" /></td>
                        <td><input type="radio" id="no22" name="no2" value="2" /></td>
                        <td><input type="radio" id="no23" name="no2" value="3" /></td>
                        <td><input type="radio" id="no24" name="no2" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no25" name="no2" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">3.</td>
                        <td class="txt-left">가족 중에 지나치게 술, 담배를 하는 사람이 있었다.</td>
                        <td><input type="radio" id="no31" name="no3" value="1" /></td>
                        <td><input type="radio" id="no32" name="no3" value="2" /></td>
                        <td><input type="radio" id="no33" name="no3" value="3" /></td>
                        <td><input type="radio" id="no34" name="no3" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no35" name="no3" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">4.</td>
                        <td class="txt-left">나는 집안에서의 실권이 많이 줄어들었다(예: 집안의 중요한 일 결정, 자녀관계 등).</td>
                        <td><input type="radio" id="no41" name="no4" value="1" /></td>
                        <td><input type="radio" id="no42" name="no4" value="2" /></td>
                        <td><input type="radio" id="no43" name="no4" value="3" /></td>
                        <td><input type="radio" id="no44" name="no4" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no45" name="no4" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">5.</td>
                        <td class="txt-left">나는 집안에 해결되지 못한 문제들이 있었다.</td>
                        <td><input type="radio" id="no51" name="no5" value="1" /></td>
                        <td><input type="radio" id="no52" name="no5" value="2" /></td>
                        <td><input type="radio" id="no53" name="no5" value="3" /></td>
                        <td><input type="radio" id="no54" name="no5" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no55" name="no5" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">6.</td>
                        <td class="txt-left">자녀들과 의견이 맞지 않는 경우가 여러 번 있었다.</td>
                        <td><input type="radio" id="no61" name="no6" value="1" /></td>
                        <td><input type="radio" id="no62" name="no6" value="2" /></td>
                        <td><input type="radio" id="no63" name="no6" value="3" /></td>
                        <td><input type="radio" id="no64" name="no6" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no65" name="no6" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">7.</td>
                        <td class="txt-left">죽기 전에 병들어 자식에게 고통이나 부담을 줄까봐 걱정이 되었다.</td>
                        <td><input type="radio" id="no71" name="no7" value="1" /></td>
                        <td><input type="radio" id="no72" name="no7" value="2" /></td>
                        <td><input type="radio" id="no73" name="no7" value="3" /></td>
                        <td><input type="radio" id="no74" name="no7" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no75" name="no7" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">8.</td>
                        <td class="txt-left">집안의 중요한 일을 결정할 때 내 의견을 묻지 않았다.</td>
                        <td><input type="radio" id="no81" name="no8" value="1" /></td>
                        <td><input type="radio" id="no82" name="no8" value="2" /></td>
                        <td><input type="radio" id="no83" name="no8" value="3" /></td>
                        <td><input type="radio" id="no84" name="no8" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no85" name="no8" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">9.</td>
                        <td class="txt-left">자녀와 말다툼으로 사이가 불편한 적이 있었다.</td>
                        <td><input type="radio" id="no91" name="no9" value="1" /></td>
                        <td><input type="radio" id="no92" name="no9" value="2" /></td>
                        <td><input type="radio" id="no93" name="no9" value="3" /></td>
                        <td><input type="radio" id="no94" name="no9" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no95" name="no9" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">10.</td>
                        <td class="txt-left">자녀들의 이혼이나 별거로 인해 마음이 상했다.</td>
                        <td><input type="radio" id="no101" name="no10" value="1" /></td>
                        <td><input type="radio" id="no102" name="no10" value="2" /></td>
                        <td><input type="radio" id="no103" name="no10" value="3" /></td>
                        <td><input type="radio" id="no104" name="no10" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no105" name="no10" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">11.</td>
                        <td class="txt-left">자녀들에게 소외감 혹은 무시를 당했다.</td>
                        <td><input type="radio" id="no111" name="no11" value="1" /></td>
                        <td><input type="radio" id="no112" name="no11" value="2" /></td>
                        <td><input type="radio" id="no113" name="no11" value="3" /></td>
                        <td><input type="radio" id="no114" name="no11" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no115" name="no11" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">12.</td>
                        <td class="txt-left">병원비나 약값으로 돈이 필요했었다.</td>
                        <td><input type="radio" id="no121" name="no12" value="1" /></td>
                        <td><input type="radio" id="no122" name="no12" value="2" /></td>
                        <td><input type="radio" id="no123" name="no12" value="3" /></td>
                        <td><input type="radio" id="no124" name="no12" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no125" name="no12" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">13.</td>
                        <td class="txt-left">노후에 경제적인 생활대책이 없었다.</td>
                        <td><input type="radio" id="no131" name="no13" value="1" /></td>
                        <td><input type="radio" id="no132" name="no13" value="2" /></td>
                        <td><input type="radio" id="no133" name="no13" value="3" /></td>
                        <td><input type="radio" id="no134" name="no13" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no135" name="no13" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">14.</td>
                        <td class="txt-left">용돈이 부족해서 불편했었다.</td>
                        <td><input type="radio" id="no141" name="no14" value="1" /></td>
                        <td><input type="radio" id="no142" name="no14" value="2" /></td>
                        <td><input type="radio" id="no143" name="no14" value="3" /></td>
                        <td><input type="radio" id="no144" name="no14" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no145" name="no14" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">15.</td>
                        <td class="txt-left">생활비가 적어서 힘이 들었다.</td>
                        <td><input type="radio" id="no151" name="no15" value="1" /></td>
                        <td><input type="radio" id="no152" name="no15" value="2" /></td>
                        <td><input type="radio" id="no153" name="no15" value="3" /></td>
                        <td><input type="radio" id="no154" name="no15" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no155" name="no15" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">16.</td>
                        <td class="txt-left">주위의 다른 노인과 비교해 볼 때 나는 경제적인 여유가 없는 편이었다.</td>
                        <td><input type="radio" id="no161" name="no16" value="1" /></td>
                        <td><input type="radio" id="no162" name="no16" value="2" /></td>
                        <td><input type="radio" id="no163" name="no16" value="3" /></td>
                        <td><input type="radio" id="no164" name="no16" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no165" name="no16" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">17.</td>
                        <td class="txt-left">수입이 이전에 비해 줄어들었다.</td>
                        <td><input type="radio" id="no171" name="no17" value="1" /></td>
                        <td><input type="radio" id="no172" name="no17" value="2" /></td>
                        <td><input type="radio" id="no173" name="no17" value="3" /></td>
                        <td><input type="radio" id="no174" name="no17" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no175" name="no17" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">18.</td>
                        <td class="txt-left">투자실패 혹은 보증으로 금전적으로 손해를 보았다.</td>
                        <td><input type="radio" id="no181" name="no18" value="1" /></td>
                        <td><input type="radio" id="no182" name="no18" value="2" /></td>
                        <td><input type="radio" id="no183" name="no18" value="3" /></td>
                        <td><input type="radio" id="no184" name="no18" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no185" name="no18" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">19.</td>
                        <td class="txt-left">금전적으로 어려워서 필요한 물품을 구입을 구입할 수 없었다.</td>
                        <td><input type="radio" id="no191" name="no19" value="1" /></td>
                        <td><input type="radio" id="no192" name="no19" value="2" /></td>
                        <td><input type="radio" id="no193" name="no19" value="3" /></td>
                        <td><input type="radio" id="no194" name="no19" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no195" name="no19" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">20.</td>
                        <td class="txt-left">가까운 친구가 사망해서 마음이 상했다.</td>
                        <td><input type="radio" id="no201" name="no20" value="1" /></td>
                        <td><input type="radio" id="no202" name="no20" value="2" /></td>
                        <td><input type="radio" id="no203" name="no20" value="3" /></td>
                        <td><input type="radio" id="no204" name="no20" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no205" name="no20" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">21.</td>
                        <td class="txt-left">배우자가 사망해서 마음이 상했다.</td>
                        <td><input type="radio" id="no211" name="no21" value="1" /></td>
                        <td><input type="radio" id="no212" name="no21" value="2" /></td>
                        <td><input type="radio" id="no213" name="no21" value="3" /></td>
                        <td><input type="radio" id="no214" name="no21" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no215" name="no21" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">22.</td>
                        <td class="txt-left">가족 중 누군가가 사망해서 마음이 상했다.</td>
                        <td><input type="radio" id="no221" name="no22" value="1" /></td>
                        <td><input type="radio" id="no22" name="no22" value="2" /></td>
                        <td><input type="radio" id="no223" name="no22" value="3" /></td>
                        <td><input type="radio" id="no224" name="no22" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no225" name="no22" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">23.</td>
                        <td class="txt-left">가까운 친구가 사망해서 마음이 상했다.</td>
                        <td><input type="radio" id="no231" name="no23" value="1" /></td>
                        <td><input type="radio" id="no232" name="no23" value="2" /></td>
                        <td><input type="radio" id="no233" name="no23" value="3" /></td>
                        <td><input type="radio" id="no234" name="no23" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no235" name="no23" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">24.</td>
                        <td class="txt-left">다치거나 매우 아픈 적이 있었다.</td>
                        <td><input type="radio" id="no241" name="no24" value="1" /></td>
                        <td><input type="radio" id="no242" name="no24" value="2" /></td>
                        <td><input type="radio" id="no243" name="no24" value="3" /></td>
                        <td><input type="radio" id="no244" name="no24" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no245" name="no24" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">25.</td>
                        <td class="txt-left">시력, 청력, 치아상태가 나빠져서 불편을 느꼈다.</td>
                        <td><input type="radio" id="no251" name="no25" value="1" /></td>
                        <td><input type="radio" id="no252" name="no25" value="2" /></td>
                        <td><input type="radio" id="no253" name="no25" value="3" /></td>
                        <td><input type="radio" id="no254" name="no25" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no255" name="no25" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">26.</td>
                        <td class="txt-left">만성적 질병이 있었다(예: 고혈압, 당뇨, 관절염 등).</td>
                        <td><input type="radio" id="no261" name="no26" value="1" /></td>
                        <td><input type="radio" id="no262" name="no26" value="2" /></td>
                        <td><input type="radio" id="no263" name="no26" value="3" /></td>
                        <td><input type="radio" id="no264" name="no26" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no265" name="no26" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">27.</td>
                        <td class="txt-left">건강이 악화되었다.</td>
                        <td><input type="radio" id="no2717" name="no27" value="1" /></td>
                        <td><input type="radio" id="no272" name="no27" value="2" /></td>
                        <td><input type="radio" id="no273" name="no27" value="3" /></td>
                        <td><input type="radio" id="no274" name="no27" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no275" name="no27" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">28.</td>
                        <td class="txt-left">피로 때문에 할 일을 제대로 못했다.</td>
                        <td><input type="radio" id="no281" name="no28" value="1" /></td>
                        <td><input type="radio" id="no282" name="no28" value="2" /></td>
                        <td><input type="radio" id="no283" name="no28" value="3" /></td>
                        <td><input type="radio" id="no284" name="no28" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no285" name="no28" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">29.</td>
                        <td class="txt-left">체중이 과도하게 줄거나 증가했다.</td>
                        <td><input type="radio" id="no291" name="no29" value="1" /></td>
                        <td><input type="radio" id="no292" name="no29" value="2" /></td>
                        <td><input type="radio" id="no293" name="no29" value="3" /></td>
                        <td><input type="radio" id="no294" name="no29" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no295" name="no29" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">30.</td>
                        <td class="txt-left">기력이 많이 약해졌다.</td>
                        <td><input type="radio" id="no301" name="no30" value="1" /></td>
                        <td><input type="radio" id="no302" name="no30" value="2" /></td>
                        <td><input type="radio" id="no303" name="no30" value="3" /></td>
                        <td><input type="radio" id="no304" name="no30" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no305" name="no30" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">31.</td>
                        <td class="txt-left">나쁜 집으로 이사를 갔다.</td>
                        <td><input type="radio" id="no311" name="no31" value="1" /></td>
                        <td><input type="radio" id="no312" name="no31" value="2" /></td>
                        <td><input type="radio" id="no313" name="no31" value="3" /></td>
                        <td><input type="radio" id="no314" name="no31" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no315" name="no31" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">32.</td>
                        <td class="txt-left">현재 살고 있는 집의 구조가 사용함에 불편을 느꼈다(예: 너무 높다, 난방시설, 아파트라 답답하다 등).</td>
                        <td><input type="radio" id="no321" name="no32" value="1" /></td>
                        <td><input type="radio" id="no322" name="no32" value="2" /></td>
                        <td><input type="radio" id="no323" name="no32" value="3" /></td>
                        <td><input type="radio" id="no324" name="no32" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no325" name="no32" value="5" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">33.</td>
                        <td class="txt-left">현재 내가 사용하고 있는 방에 대해 불편을 느꼈다(예: 너무 좁다, 환기가 안된다 등).</td>
                        <td><input type="radio" id="no331" name="no33" value="1" /></td>
                        <td><input type="radio" id="no332" name="no33" value="2" /></td>
                        <td><input type="radio" id="no333" name="no33" value="3" /></td>
                        <td><input type="radio" id="no334" name="no33" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no335" name="no33" value="5" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">34.</td>
                        <td class="txt-left">주거 및 이웃 환경이 신경에 거슬렸다.(예: 시끄럽다, 잡소리가 심하다, 이사)</td>
                        <td><input type="radio" id="no341" name="no34" value="1" /></td>
                        <td><input type="radio" id="no342" name="no34" value="2" /></td>
                        <td><input type="radio" id="no343" name="no34" value="3" /></td>
                        <td><input type="radio" id="no344" name="no34" value="4" /></td>
                        <td class="bRight-none"><input type="radio" id="no345" name="no34" value="5" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
	      <div class="btn-wrap line pb20">
	        <button type="button" class="btn btn-primary btn-lg w100p" onClick="javascript:fn_reg();">자가진단하기</button>
	        <!-- <button type="button" class="btn btn-primary btn-lg w100p" id="save" onclick="location.href='/gnoincoun/psyCnsList.do'" style="color: #fff; background-color: #78849E; border-color: #78849E;">목록</button> -->
	        <button type="button" class="btn btn-primary btn-lg w100p" id="save" onclick="javascript: history.back();" style="color: #fff; background-color: #78849E; border-color: #78849E;">목록</button>
	      </div>
	      <div style="height: 50px;">
	           <div class="total fr mt15">
	               <div style="float: left; line-height: 30px; margin-right: 10px;">
	                   총 점
	               </div>
	               <div style="float: left;">
	                   <input type="text" class="inp num2" id="sumCnt" name="sumCnt" readonly="readonly" style="border:1px solid black; margin-top: 5px; width: 60px;">
	          	 	</div>
	           </div>
	      </div>    
	</div>
</section> <!-- End section -->