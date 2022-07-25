<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.*, java.util.Locale, org.springframework.context.i18n.LocaleContextHolder" %>
<%@taglib prefix="botDetect" uri="https://captcha.com/java/jsp"%>


<!DOCTYPE html>
<html prefix="og: http://ogp.me/ns#" lang="en-gb" dir="ltr" class='com_content view-featured itemid-550 j38 mm-hover'>
   <head>
   <%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);  
  %>
  <meta name="viewport" content="width=device-width" />
      <link rel="icon" href="staticResources/images/PMRDALogo1.png" type="image/png" >
      <title>.:: <spring:message code="footer.li.28"  /> ::.</title>
      
      <style>
      .error{
      	color:red;
      }
      sup{
                 color: red;font-size: 14px;
      }
      .formarea input,textarea{
      	width:90%!important;
      }
      </style>
	
   </head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $("a[title ~= 'BotDetect']").removeAttr("style");
    $("a[title ~= 'BotDetect']").removeAttr("href");
    $("a[title ~= 'BotDetect']").css('visibility', 'hidden');

});
</script>
   <body>
      <div class="t3-wrapper t3-homepage-2">
          
         <jsp:include page="../includes/Header.jsp" />
        
      <div class="clear"></div>
      <div id="maincontent"   class="container-fluid" style="margin-top:30px;">
       <div class="row">
       <div class="col-sx-12 col-sm-12 col-md-2 left-side" style="padding-right: 25px;">
                  <div  class="b-l-m-container">
                    <ul>
				             <li>  <a href="#"><spring:message code="Header.Menu.AboutUs.citizenservice"  /></a></li>
							<li>	<a href="https://zonecertificate.pmrda.gov.in/" target="_blank"><spring:message code="Header.Menu.AboutUs.zonecrt"  /></a></li>
							    <li>  <a class="no_click" href="https://www.pmrda-obpas.com/" target="_blank"><spring:message code="Header.Menu.AboutUs.obpas"  /></a></li>
								<li><a href="pmay" ><spring:message code="Header.Menu.AboutUspmay"  /></a></li>
						      <li><a href="feedback"><spring:message code="index.feedback"  /></a></li>						      
						     <li>   <a  class="active" href="enquiry"><spring:message code="footer.li.28"  /></a></li>
                       
                     </ul>
                  </div>
            </div>
            
            <div class="col-sx-12 col-sm-12 col-md-10" style="border-left: 1px solid #eaeaea; padding: 0px 25px;">
                  <div class="static_content">
                  <div class="row">
            <div class="itemHeader" style="width:100%;">

               <h3 class="itemTitle">
               
              <spring:message code="footer.li.28"/>
               </h3>

            </div>
               
            <div class="heading-underline" style="width: 200px;  ">
               <div class="left"></div><div class="right"></div>
            </div>

         </div>
                            <div class="bloginfo">
                           
                           
                           <form:form modelAttribute="enquiryForm" id="enquiryForm">
		<div class="container-fluid formarea citizen_form">
			<div class="row filter-container ">
				<div class="col-md-2 flabel">
					 <spring:message code="index.feedback.name"  /> :
					 <sup >*</sup>
				</div>
				<div class="col-md-4" style="margin-bottom:10px;">
				<input class="form-control" type="text" name="name" id="name" size="40" onkeyup="validatename()">
				<span id="nameerror" class="text-danger font-weight-bold"></span>
				</div>
				<div class="col-md-2 flabel">
				<spring:message code="index.feedback.phone"  /> :
				<sup >*</sup>
				</div>
				<div class="col-md-4" style="margin-bottom:10px;">
				<div class="col-md-3 col-xs-3">
				<!-- country codes (ISO 3166) and Dial codes. -->
	<select name="code" class="ContryCode" id="ccode" style="width:100%!important;" onchange="validateCode()">
	
		<option data-countryCode="IN" value="91" Selected> +91</option>
		<option data-countryCode="CA" value="1"> +1</option>
		<option data-countryCode="DZ" value="213"> +213</option>
		<option data-countryCode="AD" value="376"> +376</option>
		<option data-countryCode="AO" value="244"> +244</option>
		<option data-countryCode="AI" value="1264"> +1264</option>
		<option data-countryCode="AG" value="1268">  +1268</option>
		<option data-countryCode="AR" value="54"> +54</option>
		<option data-countryCode="AM" value="374"> +374</option>
		<option data-countryCode="AW" value="297"> +297</option>
		<option data-countryCode="AU" value="61"> +61</option>
		<option data-countryCode="AT" value="43"> +43</option>
		<option data-countryCode="AZ" value="994"> +994</option>
		<option data-countryCode="BS" value="1242"> +1242</option>
		<option data-countryCode="BH" value="973"> +973</option>
		<option data-countryCode="BD" value="880"> +880</option>
		<option data-countryCode="BB" value="1246"> +1246</option>
		<option data-countryCode="BY" value="375"> +375</option>
		<option data-countryCode="BE" value="32"> +32</option>
		<option data-countryCode="BZ" value="501"> +501</option>
		<option data-countryCode="BJ" value="229"> +229</option>
		<option data-countryCode="BM" value="1441"> +1441</option>
		<option data-countryCode="BT" value="975"> +975</option>
		<option data-countryCode="BO" value="591"> +591</option>
		<option data-countryCode="BA" value="387"> +387</option>
		<option data-countryCode="BW" value="267"> +267</option>
		<option data-countryCode="BR" value="55"> +55</option>
		<option data-countryCode="BN" value="673"> +673</option>
		<option data-countryCode="BG" value="359"> +359</option>
		<option data-countryCode="BF" value="226"> +226</option>
		<option data-countryCode="BI" value="257"> 257</option>
		<option data-countryCode="KH" value="855"> +855</option>
		<option data-countryCode="CM" value="237"> +237</option>
		<option data-countryCode="CV" value="238"> +238</option>
		<option data-countryCode="KY" value="1345"> +1345</option>
		<option data-countryCode="CF" value="236"> +236</option>
		<option data-countryCode="CL" value="56"> +56</option>
		<option data-countryCode="CN" value="86"> +86</option>
		<option data-countryCode="CO" value="57"> +57</option>
		<option data-countryCode="KM" value="269"> +269</option>
		<option data-countryCode="CG" value="242"> +242</option>
		<option data-countryCode="CK" value="682">  +682</option>
		<option data-countryCode="CR" value="506"> +506</option>
		<option data-countryCode="HR" value="385"> +385</option>
		<option data-countryCode="CU" value="53"> +53</option>
		<option data-countryCode="CY" value="90392"> +90392</option>
		<option data-countryCode="CY" value="357"> +357</option>
		<option data-countryCode="CZ" value="42"> +42</option>
		<option data-countryCode="DK" value="45"> +45</option>
		<option data-countryCode="DJ" value="253"> +253</option>
		<option data-countryCode="DM" value="1809"> +1809</option>
		<option data-countryCode="DO" value="1809">  +1809</option>
		<option data-countryCode="EC" value="593"> +593</option>
		<option data-countryCode="EG" value="20"> +20</option>
		<option data-countryCode="SV" value="503"> +503</option>
		<option data-countryCode="GQ" value="240"> +240</option>
		<option data-countryCode="ER" value="291"> +291</option>
		<option data-countryCode="EE" value="372"> +372</option>
		<option data-countryCode="ET" value="251"> +251</option>
		<option data-countryCode="FK" value="500"> +500</option>
		<option data-countryCode="FO" value="298"> +298</option>
		<option data-countryCode="FJ" value="679"> +679</option>
		<option data-countryCode="FI" value="358"> +358</option>
		<option data-countryCode="FR" value="33"> +33</option>
		<option data-countryCode="GF" value="594">  +594</option>
		<option data-countryCode="PF" value="689">  +689</option>
		<option data-countryCode="GA" value="241"> +241</option>
		<option data-countryCode="GM" value="220"> +220</option>
		<option data-countryCode="GE" value="7880"> +7880</option>
		<option data-countryCode="DE" value="49"> +49</option>
		<option data-countryCode="GH" value="233"> +233</option>
		<option data-countryCode="GI" value="350"> +350</option>
		<option data-countryCode="GR" value="30"> +30</option>
		<option data-countryCode="GL" value="299"> +299</option>
		<option data-countryCode="GD" value="1473"> +1473</option>
		<option data-countryCode="GP" value="590"> +590</option>
		<option data-countryCode="GU" value="671"> +671</option>
		<option data-countryCode="GT" value="502"> +502</option>
		<option data-countryCode="GN" value="224"> +224</option>
		<option data-countryCode="GW" value="245">  +245</option>
		<option data-countryCode="GY" value="592"> +592</option>
		<option data-countryCode="HT" value="509"> +509</option>
		<option data-countryCode="HN" value="504"> +504</option>
		<option data-countryCode="HK" value="852"> +852</option>
		<option data-countryCode="HU" value="36"> +36</option>
		<option data-countryCode="IS" value="354"> +354</option>
 		<option data-countryCode="ID" value="62"> +62</option>
		<option data-countryCode="IR" value="98"> +98</option>
		<option data-countryCode="IQ" value="964"> +964</option>
		<option data-countryCode="IE" value="353"> +353</option>
		<option data-countryCode="IL" value="972"> +972</option>
		<option data-countryCode="IT" value="39"> +39</option>
		<option data-countryCode="JM" value="1876"> +1876</option>
		<option data-countryCode="JP" value="81"> +81</option>
		<option data-countryCode="JO" value="962"> +962</option>
		<option data-countryCode="KZ" value="7"> +7</option>
		<option data-countryCode="KE" value="254"> +254</option>
		<option data-countryCode="KI" value="686"> +686</option>
		<option data-countryCode="KP" value="850"> +850</option>
		<option data-countryCode="KR" value="82"> +82</option>
		<option data-countryCode="KW" value="965"> +965</option>
		<option data-countryCode="KG" value="996"> +996</option>
		<option data-countryCode="LA" value="856"> +856</option>
		<option data-countryCode="LV" value="371"> +371</option>
		<option data-countryCode="LB" value="961"> +961</option>
		<option data-countryCode="LS" value="266"> +266</option>
		<option data-countryCode="LR" value="231"> +231</option>
		<option data-countryCode="LY" value="218"> +218</option>
		<option data-countryCode="LI" value="417"> +417</option>
		<option data-countryCode="LT" value="370"> +370</option>
		<option data-countryCode="LU" value="352"> +352</option>
		<option data-countryCode="MO" value="853"> +853</option>
		<option data-countryCode="MK" value="389"> +389</option>
		<option data-countryCode="MG" value="261"> +261</option>
		<option data-countryCode="MW" value="265"> +265</option>
		<option data-countryCode="MY" value="60"> +60</option>
		<option data-countryCode="MV" value="960"> +960</option>
		<option data-countryCode="ML" value="223"> +223</option>
		<option data-countryCode="MT" value="356"> +356</option>
		<option data-countryCode="MH" value="692">+692</option>
		<option data-countryCode="MQ" value="596"> +596</option>
		<option data-countryCode="MR" value="222"> +222</option>
		<option data-countryCode="YT" value="269"> +269</option>
		<option data-countryCode="MX" value="52"> +52</option>
		<option data-countryCode="FM" value="691"> +691</option>
		<option data-countryCode="MD" value="373"> +373</option>
		<option data-countryCode="MC" value="377"> +377</option>
		<option data-countryCode="MN" value="976"> +976</option>
		<option data-countryCode="MS" value="1664"> +1664</option>
		<option data-countryCode="MA" value="212"> +212</option>
		<option data-countryCode="MZ" value="258"> +258</option>
		<option data-countryCode="MN" value="95"> +95</option>
		<option data-countryCode="NA" value="264"> +264</option>
		<option data-countryCode="NR" value="674"> +674</option>
		<option data-countryCode="NP" value="977"> +977</option>
		<option data-countryCode="NL" value="31"> +31</option>
		<option data-countryCode="NC" value="687"> +687</option>
		<option data-countryCode="NZ" value="64"> +64</option>
		<option data-countryCode="NI" value="505"> +505</option>
		<option data-countryCode="NE" value="227"> +227</option>
		<option data-countryCode="NG" value="234"> +234</option>
		<option data-countryCode="NU" value="683"> +683</option>
		<option data-countryCode="NF" value="672">  +672</option>
		<option data-countryCode="NP" value="670"> +670</option>
		<option data-countryCode="NO" value="47"> +47</option>
		<option data-countryCode="OM" value="968"> +968</option>
		<option data-countryCode="PW" value="680"> +680</option>
		<option data-countryCode="PA" value="507"> +507</option>
		<option data-countryCode="PG" value="675"> +675</option>
		<option data-countryCode="PY" value="595"> +595</option>
		<option data-countryCode="PE" value="51"> +51</option>
		<option data-countryCode="PH" value="63"> +63</option>
		<option data-countryCode="PL" value="48"> +48</option>
		<option data-countryCode="PT" value="351"> +351</option>
		<option data-countryCode="PR" value="1787"> +1787</option>
		<option data-countryCode="QA" value="974"> +974</option>
		<option data-countryCode="RE" value="262"> +262</option>
		<option data-countryCode="RO" value="40"> +40</option>
		<option data-countryCode="RU" value="7"> +7</option>
		<option data-countryCode="RW" value="250"> +250</option>
		<option data-countryCode="SM" value="378"> +378</option>
		<option data-countryCode="ST" value="239"> +239</option>
		<option data-countryCode="SA" value="966"> +966</option>
		<option data-countryCode="SN" value="221"> +221</option>
		<option data-countryCode="CS" value="381"> +381</option>
		<option data-countryCode="SC" value="248"> +248</option>
		<option data-countryCode="SL" value="232"> +232</option>
		<option data-countryCode="SG" value="65"> +65</option>
		<option data-countryCode="SK" value="421"> +421</option>
		<option data-countryCode="SI" value="386"> +386</option>
		<option data-countryCode="SB" value="677">  +677</option>
		<option data-countryCode="SO" value="252"> +252</option>
		<option data-countryCode="ZA" value="27"> +27</option>
		<option data-countryCode="ES" value="34"> +34</option>
		<option data-countryCode="LK" value="94"> +94</option>
		<option data-countryCode="SH" value="290"> +290</option>
		<option data-countryCode="KN" value="1869"> +1869</option>
		<option data-countryCode="SC" value="1758"> +1758</option>
		<option data-countryCode="SD" value="249"> +249</option>
		<option data-countryCode="SR" value="597"> +597</option>
		<option data-countryCode="SZ" value="268"> +268</option>
		<option data-countryCode="SE" value="46"> +46</option>
		<option data-countryCode="CH" value="41"> +41</option>
		<option data-countryCode="SI" value="963"> +963</option>
		<option data-countryCode="TW" value="886"> +886</option>
		<option data-countryCode="TJ" value="7"> +7</option>
		<option data-countryCode="TH" value="66"> +66</option>
		<option data-countryCode="TG" value="228"> +228</option>
		<option data-countryCode="TO" value="676"> +676</option>
		<option data-countryCode="TT" value="1868"> +1868</option>
		<option data-countryCode="TN" value="216"> +216</option>
		<option data-countryCode="TR" value="90"> +90</option>
		<option data-countryCode="TM" value="7"> +7</option>
		<option data-countryCode="TM" value="993"> +993</option>
		<option data-countryCode="TC" value="1649"> +1649</option>
		<option data-countryCode="TV" value="688"> +688</option>
		<option data-countryCode="UG" value="256"> +256</option>
		 <option data-countryCode="GB" value="44"> +44</option> 
		<option data-countryCode="UA" value="380"> +380</option>
		<option data-countryCode="AE" value="971"> +971</option>
		<option data-countryCode="UY" value="598"> +598</option>
		 <option data-countryCode="US" value="1"> +1</option>
		<option data-countryCode="UZ" value="7"> +7</option>
		<option data-countryCode="VU" value="678"> +678</option>
		<option data-countryCode="VA" value="379"> +379</option>
		<option data-countryCode="VE" value="58"> +58</option>
		<option data-countryCode="VN" value="84"> +84</option>
		<option data-countryCode="VG" value="84"> +1284</option>
		<option data-countryCode="VI" value="84"> +1340</option>
		<option data-countryCode="WF" value="681"> +681</option>
		<option data-countryCode="YE" value="969">+969</option>
		<option data-countryCode="YE" value="967"> +967</option>
		<option data-countryCode="ZM" value="260"> +260</option>
		<option data-countryCode="ZW" value="263"> +263</option>
	
</select>
<!-- 				<input class="form-control" type="text" name="" id="ccode" size="40"> -->
				<span id="codeerror" class="text-danger font-weight-bold"></span>
				</div>
				<div class="col-md-9 col-xs-9">
				<input class="form-control" type="text" name="phone" id="phone" size="40" style="width:85%!important;" onkeyup="validatephone()">
				<span id="phoneerror" class="text-danger font-weight-bold"></span>
				</div>
				</div>
				<!-- <div class="col-md-1">
				<input class="form-control" type="text" name="" id="ccode" size="40">
				<span id="codeerror" class="text-danger font-weight-bold"></span>
				</div>
				<div class="col-md-3">
				<input class="form-control" type="text" name="" id="phone" size="40">
				<span id="phoneerror" class="text-danger font-weight-bold"></span>
				</div> -->
			</div>
			<div class="row filter-container">
				<div class="col-md-2 flabel">
					<spring:message code="index.feedback.email"  />:
					<sup >*</sup>
				</div>
				<div class="col-md-4" style="margin-bottom:10px;">
				<input class="form-control" type="text" name="email" id="email" size="40" onkeyup="validateemail()">
				<span id="emailerror" class="text-danger font-weight-bold"></span>
				</div>
				<%-- <div class="col-md-2">
				<spring:message code="index.feedback.title"  /> :
				<sup >*</sup>
				</div>
				<div class="col-md-4">
				<input class="form-control" type="text" name="" id="title" size="40">
				<span id="titleerror" class="text-danger font-weight-bold"></span>
				</div> --%>
				<div class="col-md-2 flabel">
				<spring:message code="filter.form.documenttype"  /> :
				<sup >*</sup>
				</div>
				<div class="col-md-4" style="margin-bottom:10px;">				
				<select id="title" class="form-control" style="width:90%!important;" onchange="validateTitle()">
					 <c:choose>
								 	  <c:when test="${localLang eq 'marathi'}">
								 	  	
								 	  	   <option selected="selected" value="0">विभाग निवडा</option>
									  	 <c:forEach var="department" items="${list}">
						<option value="${department.deptId}">${department.departmentName_h}</option>
					</c:forEach>
								 	  </c:when>
								 	  <c:otherwise>
								 	  	   <option selected="selected" value="0">Select Department</option>
										  	<c:forEach var="department" items="${list}">
						<option value="${department.deptId}">${department.departmentName}</option>
					</c:forEach>	
								 	  </c:otherwise>
							 	 </c:choose>				
				</select>
				 <!-- <input class="form-control" type="text" name="" id="title" size="40">  -->
				<span id="titleerror" class="text-danger font-weight-bold"></span>
				</div>
				
				<div class="col-md-2 flabel">
				<spring:message code="index.feedback.subject"  /> :
				<sup >*</sup>
				</div>
				<div class="col-md-4" style="margin-bottom:10px;">
				<input class="form-control" type="text" name="subject" id="subject" size="40" onkeyup="validatesubject()">
				<span id="subjecterror" class="text-danger font-weight-bold"></span>
				</div>
			
				<div class="col-md-2 flabel">
				<spring:message code="index.feedback.description"  /> :
				<sup >*</sup>
				</div>
				<div class="col-md-4" style="margin-bottom:10px;">
				<textarea cols="42" rows="30" id="description" name="description" onkeyup="validatedes()"></textarea>
				<span id="descriptionerror" class="text-danger font-weight-bold"></span>
				</div>			
				
				<div class="col-md-2 flabel">
				Verification Code :
				<sup >*</sup>
				</div>
				<div class="col-md-4" style="margin-bottom:10px;">
				<botDetect:captcha id="enquiryCaptcha" userInputID="captchaCodeEnquiry" codeStyle="ALPHANUMERIC"/>
									  <div class="input-group" style="margin-top:5px;">
											<input type="text" id="captchaCodeEnquiry" class="form-control"/>
									  </div>
				<span id="captcherror" class="text-danger font-weight-bold"></span>
				</div>
			</div>
			
				</div>
				<div class="clear"></div>
				<br />
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="  background: aliceblue; padding:10px 30px;">
						<input class="btnSearch pull-right btn btn-success" type="button"
							value="<spring:message code="feedback.button.submit"  />" onclick="formvalidation()">
					</div>
				
				</div>
			</form:form>
                           
                        </div>
               </div>
               
              
      </div>
       
       
       </div>
            
                 


	</div>	
	  
			
	<input type="hidden" value="${save}" id="doneBtn">
	<script>
	$(function() {
		  // choose target dropdown
		  var select = $('.ContryCode');
		  select.html(select.find('option').sort(function(x, y) {
		    // to change to descending order switch "<" for ">"
		    return $(x).text() > $(y).text() ? 1 : -1;
		  }));

		  // select default item after sorting (first item)
		  // $('select').get(0).selectedIndex = 0;
			
		});
	</script>
	<script>
	
	function validatename(){	
		var name = document.getElementById('name').value;
		if(name!=""){
			document.getElementById('nameerror').innerHTML = " ";
			return true;
		}else{
			document.getElementById('nameerror').innerHTML = " ** <spring:message code="feedback.validation.msg1"  /> " ;			
			return false;
		}
	}
	
	function validatephone(){
		var phone = document.getElementById('phone').value;
		if(phone!=""){
			document.getElementById('phoneerror').innerHTML = " ";
			if(!validatephonepattern(phone)){
				return false;
			}else{
				return true;
			}
			
		}else{
			document.getElementById('phoneerror').innerHTML = " ** <spring:message code="feedback.validation.msg1"  /> " ;
			return false;
		}
	}
	
	function validatephonepattern(phone){
		var phonecheck = /^[0-9]{10}$/ ;
		if(phonecheck.test(phone)){
			document.getElementById('phoneerror').innerHTML = " ";
			return true;
		}else{
			document.getElementById('phoneerror').innerHTML = " ** <spring:message code="feedback.validation.msg2"  />" ;
			return false;
		}
	}
	
	function validateemail(){	
		var email = document.getElementById('email').value;
		if(email!=""){
			document.getElementById('emailerror').innerHTML = " ";
			if(!validateemailpattern(email)){
				return false;
			}else{
				return true;
			}			
		}else{
			document.getElementById('emailerror').innerHTML = " ** <spring:message code="feedback.validation.msg1"  /> " ;
			return false;
		}
	}
	
	function validateemailpattern(email){
		var emailcheck = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		if(emailcheck.test(email)){
			document.getElementById('emailerror').innerHTML = " ";
			return true;
		}else{
			document.getElementById('emailerror').innerHTML = " ** <spring:message code="feedback.validation.msg3"  /> " ;
			return false;
		}
	}
	
	function validatesubject(){
		var subject = document.getElementById('subject').value;
		if(subject!=""){
			document.getElementById('subjecterror').innerHTML = " ";
			return true;
		}else{
			document.getElementById('subjecterror').innerHTML = " ** <spring:message code="feedback.validation.msg1"  /> " ;
			return false;
		}
	}
	
	function validatedes(){
		var description = document.getElementById('description').value;
		if(description!=""){
			document.getElementById('descriptionerror').innerHTML = " ";
			return true;
		}else{
			document.getElementById('descriptionerror').innerHTML = " ** <spring:message code="feedback.validation.msg1"  /> " ;
			return false;
		}
	}
	
	function validateTitle(){
		var title = document.getElementById('title').value;
		if(title>0){
			document.getElementById('titleerror').innerHTML = " ";
			return true;
		}else{
			document.getElementById('titleerror').innerHTML = " ** <spring:message code="feedback.validation.msg1"  /> " ;
			return false;
		}
	}
	
	function validateCode(){
		var ccode = document.getElementById('ccode').value;
		var phonecheck = /^[0-9]{2,4}$/ ;
		if(phonecheck.test(ccode)){
			document.getElementById('codeerror').innerHTML = " ";
			return true;
		}else{
			document.getElementById('codeerror').innerHTML = " ** <spring:message code="feedback.validation.msg4"  /> " ;
			return false;
		}
	}
	
	var clicks = 0;
    function formvalidation(){
   	 clicks += 1;//alert(clicks)   	 
   	 if(clicks>1){
   		resetErrors();
   		formvalidation1();
      }
      else{   	 
        	formvalidation1();
    	}
    }
    
    function resetErrors() {
   	 $('form input,form textarea, form select').removeClass('error');
   	 $('span.error').remove();
   	 }
	
	function formvalidation1(){
		/* var name = document.getElementById('name').value;
		var phone = document.getElementById('phone').value;
		var email = document.getElementById('email').value;
		var title = document.getElementById('title').value;
		var subject = document.getElementById('subject').value;
		var description = document.getElementById('description').value;
		var ccode = document.getElementById('ccode').value;	 */
		var captchaCodeEnquiry=document.getElementById('captchaCodeEnquiry').value;	
		var title = document.getElementById('title').value;
		
		var dataForm=$("#enquiryForm").serialize();
		
		/* validatename(name);
		validatephone(phone);
		validateemail(email);	
		validatesubject(subject);
		validatedes(description);
		validateTitle(title);
		validateCode(ccode); */
		
		//if(validatename(name) && validatephone(phone) && validateemail(email) && validatesubject(subject) && validatedes(description) && validateCode(ccode)){
			//alert("in if")
			$.ajax({
				/*  url:"submitFeedback?name="+name+"&phone="+phone+"&email="+email+"&subject="+subject+"&description="+description+"&ccode="+ccode+"&captchaCodeFeedback="+captchaCodeFeedback,
				 */
				 url:"submitEnquiry?captchaCodeEnquiry="+captchaCodeEnquiry+"&dept="+title,
					data:dataForm,	 
						 success:function(response){
							 document.getElementById('captcherror').innerHTML = "" ;
							 document.getElementById('nameerror').innerHTML = "" ;
							 document.getElementById('phoneerror').innerHTML = "" ;
							 document.getElementById('emailerror').innerHTML = "" ;
							 document.getElementById('subjecterror').innerHTML = "" ;
							 document.getElementById('descriptionerror').innerHTML = "" ;
							 document.getElementById('titleerror').innerHTML = "" ;
							 document.getElementById('codeerror').innerHTML = "";
							 
						if(response.status=="FAIL"){
							$.each(response.errorMessages,function(key,value){
    			  	            $('input[name='+key+']').after('<span class="error">'+value+'</span>');
    			  	            $('textarea[name='+key+']').after('<span class="error">'+value+'</span>');
    			  	            $('select[name='+key+']').after('<span class="error">'+value+'</span>');    			  	          	
    			              });
							$('.BDC_ReloadIcon').trigger('click');
						}else if(response.status=="SUCCESS"){
							alert("<spring:message code="enquiry.alert.msg1"  />");
							window.location.href="enquiry";
						}else if(response.status=="CAPTCHAFAIL"){
							document.getElementById('captcherror').innerHTML = " ** <spring:message code="feedback.captcha.validation"  /> " ;
							$('.BDC_ReloadIcon').trigger('click');
						}
						
					}
		    });
		/* }else{ //alert("in else")
			return false;
		} */
		
				
	}
		
	</script>
	
			
	<footer id="t3-footer" class="wrap t3-footer footer-section">
            <jsp:include page="../includes/Footer.jsp" />
         </footer>	
</div>   
   </body>
</html>