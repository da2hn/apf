<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
  <script>
	  $(document).ready(function() {
		  $('input:radio[name=gender]:input[value="${sessionScope.LoginVO.gender}"]').attr("checked", true);
		  $("#cnsleNm").val("${sessionScope.LoginVO.userNm}");
		  $("#telNo").val("${sessionScope.LoginVO.mobile}");
		  $("#age").val("${sessionScope.LoginVO.age}");
		  let today = new Date();
		  var year = today.getFullYear(); // 년도
		  var month = today.getMonth()+1;  // 월
		  var date = today.getDate();  // 날짜
		  var nowDate = year+"."+month+"."+date;
		  $("#writeDt").val(nowDate);
	  });
	  function fn_reg() {
		  
		  var arr = [];
		  for(i=1; i<8; i++) {
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
				  location.href="/gnoincoun/psyDukeDoc.do";
				  return false;
			  }
			  return false;
		  }
		  
		  if(confirm("자가진단 작성을 완료하셨습니까?")){
		    var no;
		    var check;
		    for(i=1; i<8; i++) {
		   	    no = $('input[name="no'+i+'"]:checked').val();
		   	    	    
		   		total = total+parseInt(no);
		    }
			$("#sumCnt").val(total);
			var param = $("#frm").serialize(); 
			$.ajax({
				type : "POST",
				url : "/gnoincoun/psyDukeDocRegAjax.do",
				data : param,
				dataType : "json",
				success : function(json) {
					showAlert(total);
					//alert("DUKE-AD 심리검사 결과 점수는"+total+"점 입니다.");
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
          '<h3 style="margin-top: 10px;">듀크 불안-우울척도</h3>' +
          '<div class="alert-header">&#9745; 검사결과</div>' +
          '<div>귀하의 검사 결과는 ' + total + '점입니다.</div>' +
          '<div class="alert-body">' +
          '<div>• 정상(5점 미만)</div>' +
          '<div>&nbsp;&nbsp;&nbsp;유의한 수준의 우울감이 보이지 않습니다.</div>' +
          '<div>• 심각한 수준(5점~7점)</div>' +
          '<div>&nbsp;&nbsp;&nbsp;불안이나 우울이 심각한 수준일 수 있습니다.</div>' +
          '<div>• 매우 심각한 수준(8점 이상)</div>' +
          '<div>&nbsp;&nbsp;&nbsp;불안이나 우울이 매우 심각한 수준으로 볼 수 있습니다.</div>' +
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
			top: 32%;
			left: 50%;
			transform: translate(-50%, -50%);
			width: 470px;
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
        <h2 class="title">듀크 불안-우울 척도</h2>
      <form id="frm" name="frm" method="post">
      <input type="hidden" id="cnsleId" name="cnsleId" value="${sessionScope.LoginVO.userId}" >
      <div class="table-wrap">
      		<!-- 
      		<table class="table table-condensed">
                <caption>DUKE-AD</caption>
                <colgroup>
                	<col width="50px"/>
          			<col width="100px"/>
          			<col width="70px"/>
          			<col width="120px"/>
          			<col width="60px"/>
          			<col width="100px"/>
                    <%-- <col style="width: 8%;" />
                    <col style="width: 10%;" />
                    <col style="width: 8%;" />
                    <col style="width: 10%;" />
                    <col style="width: 8%;" />
                    <col style="width: 10%;" /> --%>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="col" style="vertical-align: middle;">이&nbsp;&nbsp;름</th>
                        <td style="width: 100px;">
                            <input type="text" class="form-control" id="cnsleNm" name="cnsleNm" readonly="readonly">
                        </td>
                        <th scope="col" style="vertical-align: middle;">성별</th>
                        <td style="vertical-align: middle;">
                            <label for="gender1" style="margin-right: 10px;">남</label><input type="radio" id="gender1" name="gender" value="M" style="margin-bottom: 5px;" /> /
                            <label for="gender2" style="margin-right: 10px;">여</label><input type="radio" id="gender2" name="gender" value="F" style="margin-bottom: 5px;" />
                        </td>
                        <th scope="col" style="vertical-align: middle;">검사일</th>
                        <td>
                            <input type="text" id="writeDt" class="form-control" name="writeDt" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <th scope="col" style="vertical-align: middle;">나&nbsp;&nbsp;이</th>
                        <td>
                            <input type="text" id="age" name="age" class="form-control" readonly="readonly" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                        </td>
                        <th scope="col" style="vertical-align: middle;">연 락 처</th>
                        <td colspan="3">
                            <input type="text" id="telNo" class="form-control" style="width: 150px;" name="telNo" readonly="readonly" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
                        </td>
                    </tr>
                </tbody>
            </table>
      		 -->
            <div class="txt mt15">
                ※ 다음은 당신의 건강과 느낌에 대한 질문입니다. 각 문항을 자세히 읽고 당신이 느끼는 가장 적합한 곳에 ‘√’표 해 주십시오.<br>
                다음 문항에 맞거나 틀린 답은 없습니다.
            </div>
            <table class="table table-condensed">
                <caption>DUKE-AD</caption>
                <colgroup>
                    <col style="width: 8%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="2">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
                        <th scope="col">매우 그렇다</th>
                        <th scope="col">보통이다 </th>
                        <th scope="col" class="bRight-none">매우 아니다</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="bRight-none">1.</td>
                        <td class="txt-left">나는 쉽게 포기한다.</td>
                        <td><input type="radio" id="no11" name="no1" value="2" /></td>
                        <td><input type="radio" id="no12" name="no1" value="1" /></td>
                        <td class="bRight-none"><input type="radio" id="no13" name="no1" value="0" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">2.</td>
                        <td class="txt-left">나는 집중하는 것이 어렵다.</td>
                        <td><input type="radio" id="no21" name="no2" value="2" /></td>
                        <td><input type="radio" id="no22" name="no2" value="1" /></td>
                        <td class="bRight-none"><input type="radio" id="no23" name="no2" value="0" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">3.</td>
                        <td class="txt-left">나는 사람들이 주변에 있는 것이 편안하다.</td>
                        <td><input type="radio" id="no31" name="no3" value="0" /></td>
                        <td><input type="radio" id="no32" name="no3" value="1" /></td>
                        <td class="bRight-none"><input type="radio" id="no33" name="no3" value="2" /></td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-condensed">
                <caption>DUKE-AD</caption>
                <colgroup>
                    <col style="width: 8%;" />
                    <col style="width: 50%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="2" class="txt-left">&nbsp;&nbsp;지난 <span class="txt-Under">일주일 동안...</span></th>
                        <th scope="col">매우 그렇다</th>
                        <th scope="col">보통이다 </th>
                        <th scope="col" class="bRight-none">매우 아니다</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="bRight-none">4.</td>
                        <td class="txt-left">잠을 자는 것이 어렵다.</td>
                        <td><input type="radio" id="no41" name="no4" value="2" /></td>
                        <td><input type="radio" id="no42" name="no4" value="1" /></td>
                        <td class="bRight-none"><input type="radio" id="no43" name="no4" value="0" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">5.</td>
                        <td class="txt-left">쉽게 피로해진다.</td>
                        <td><input type="radio" id="no51" name="no5" value="2" /></td>
                        <td><input type="radio" id="no52" name="no5" value="1" /></td>
                        <td class="bRight-none"><input type="radio" id="no53" name="no5" value="0" /></td>
                    </tr>
                    <tr>
                        <td class="bRight-none">6.</td>
                        <td class="txt-left">슬프거나 우울한 기분이 든다.</td>
                        <td><input type="radio" id="no61" name="no6" value="2" /></td>
                        <td><input type="radio" id="no62" name="no6" value="1" /></td>
                        <td class="bRight-none"><input type="radio" id="no63" name="no6" value="0" /></td>
                    </tr>
                    <tr class="bBottom">
                        <td class="bRight-none">7.</td>
                        <td class="txt-left">불안한 기분이 든다.</td>
                        <td><input type="radio" id="no71" name="no7" value="2" /></td>
                        <td><input type="radio" id="no72" name="no7" value="1" /></td>
                        <td class="bRight-none"><input type="radio" id="no73" name="no7" value="0" /></td>
                    </tr>
                </tbody>
            </table>
      	</div>
      </form>
      <div class="btn-wrap line pb20">
        <button type="button" class="btn btn-primary btn-lg w100p" onClick="javascript:fn_reg();">자가진단</button>
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
</section>