<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.*, java.util.Locale, org.springframework.context.i18n.LocaleContextHolder" %>
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
      <title>.:: ${project.title }::.</title>
         <style >
         .articleInnerAside {
              width: 19%;
    }
    .itemTagsBlock table th, .itemTagsBlock table td{
    	padding:10px 5px!important;
    }
    
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
  
}
thead th{
	background: linear-gradient(to bottom, #1e5799 0%,#2989d8 47%,#0086b2 100%,#207cca 100%);;
	color:white;
}
td, th {
  border: 1px solid #dddddd!important;
  text-align: left;
  padding: 8px!important;
}

tr:nth-child(even) {
  background-color: #efefef!important;
}

.nomargin{
	margin:0px;
}

h4{
	margin-top:20px!important;
}
         </style>
   </head>
   <body>
      <div class="t3-wrapper t3-homepage-2">
          <jsp:include page="../includes/Header.jsp" />
         
        
		<div class="clear"></div>
    <%--   <div class="container">
         <section class="wrap t3-navhelper" style="margin-top: 0px;">
               <div class="row">
                  <ol class="breadcrumb ">
                  <li class="active"><spring:message code="navigation.container.li1"  /> &nbsp;</li><li><i class="fas fa-caret-right"></i> <a href="./index.htm" class="pathway"><spring:message code="navigation.container.li2"  /></a><li><i class="fas fa-caret-right"></i> <a href="#" class="pathway"><spring:message code="navigation.project"  /></a><span class="divider">\</span></li><li><i class="fas fa-caret-right"></i> <span><spring:message code="navigation.project.Ringroad"  /></span></li></ol>
               </div>
            </section>
            <hr/>
      </div> --%>




 <div id="t3-mainbody" class="container-fluid t3-mainbody projects-container" style="margin-top:30px;">
<div class="row">

<div id="t3-content" class="t3-content col-xs-12 col-sm-9 col-md-9 col-lg-9" style="padding-right: 25px;">
<div id="system-message-container">

</div>
<div class="t3-component">

<span id="startOfPageId78"></span>
<div id="k2Container" class="itemView">


<div class="itemHeader">

<h2 class="itemTitle">${ project.title}</h2>
<div class="heading-underline" style="width: 175px;">
               <div class="left"></div><div class="right"></div>
            </div>

<div class="clr"></div>
</div>




<div class="articleInnerAside" style="width:19%">

<div class="itemCategory">
<span><spring:message code="ringroad.t3-mainbody.articleInnerAside.itemCategory.span" /></span>${project.title}</div>

<div class="itemHits">
<span><spring:message code="ringroad.t3-mainbody.articleInnerAside.itemHits.span1"  /></span>${project.date}</div>

<div class="itemRatingBlock">
<span><spring:message code="ringroad.t3-mainbody.articleInnerAside.itemRatingBlock.span1"  /></span>${project.specification }<div class="clr"></div>
</div>

<div class="itemTagsBlock">
<span><spring:message code="ringroad.t3-mainbody.articleInnerAside.itemTagsBlock.span1"  /></span>${project.projectCordinator }<div class="clr"></div>
</div>

<div class="itemTagsBlock">
<span><spring:message code="ringroad.t3-mainbody.articleInnerAside.itemTagsBlock.span2"  />
<table class="table table-bordered table-striped dl-table" cellspacing="0" rules="cols" border="1" id="SitePH_grdupload" style="width:10%;border-collapse:collapse;">
       <thead>
       <tr>
       <th>Title</th>
       <th>Download</th>
       </tr>
       </thead>
         <tbody>
                <c:forEach items="${attachmentlist}" var="attachmentlist">
                       <tr>
                           <td>${attachmentlist.title}</td>
                                   <td><a href="attachmentProjectDownload?path=${attachmentlist.path}">${ attachmentlist.size}KB</a></td>
                                </tr>
                      </c:forEach> 
          </tbody>
 </table>
</span>
<div class="clr"></div>
</div>

</div>
<div class="itemBody articlePushRight">


<div class="itemFullText"><p>${project.description }</p>




<div class="itemRelated">

 <c:if test="${not empty  features}">
 <h3><spring:message code="ringroad.itemFullText.h"/></h3>


<table class="table table-bordered table-striped dl-table" cellspacing="0" rules="cols" border="1" id="SitePH_grdupload" style="width:100%;border-collapse:collapse;">
         <tbody>
                         <c:forEach items="${features}" var="features">
                          <tr>
                                  <td><span id="SitePH_grdupload_lblSN_0">${features.feature}</span></td>
                                   <td><span id="SitePH_grdupload_lblCategory_0">${features.value}</span></td>
                                </tr>
                      </c:forEach> 

       
      </tbody>
      
      </table> 
</c:if>

      
<div class="clr"></div>
</div>

<div class="itemVideoEmbedded">
<span class="itemVideoCaption"><spring:message code="ringroad.pagetitle"/></span>
<div class="clr"></div>
<div class="heading-underline" style="width: 135px;">
               <div class="left"></div><div class="right"></div>
            </div>
<iframe width="560" height="315" src="https://www.youtube.com/embed/bOTKemntuZg" frameborder="0" allowfullscreen=""></iframe> </div>
<div class="clr"></div>

</div>

<div class="itemContentFooter">

<span class="itemDateModified">
Last modified on Wednesday, 15 February 2012 08:41 </span>
<div class="clr"></div>
</div>


<div class="clr"></div>
</div>

<div class="clr"></div>

<a name="itemCommentsAnchor" id="itemCommentsAnchor"></a>
<div class="itemComments">

</div>
<div class="itemBackToTop">
<a class="k2Anchor" href="78-invasion-an-art-installation.htm#startOfPageId78">
back to top </a>
</div>
<div class="clr"></div>
</div>


</div>
</div>


 <div class="t3-sidebar t3-sidebar-right col-xs-12 col-sm-3 col-md-3 col-lg-3">

     <div class="carousel-img-overlay">
                                 
                       </div>
                       <div class="carousel-img projects" style="height: auto;">
                          <div id="myCarousel-4" class="carousel slide" data-ride="carousel">
                       <!-- Wrapper for slides -->
                       <div class="carousel-inner">
                         <div class="item">
                           <img src="staticResources/images/Projects/tp.jpg" alt="Los Angeles" height="100%" width="100%">
                         </div>

                         <div class="item">
                           <img src="staticResources/images/Projects/hyperloop.jpg" alt="Chicago" height="100%" width="100%">
                         </div>

                         <div class="item">
                           <img src="staticResources/images/Projects/tp.jpg" alt="New York" height="100%" width="100%">
                         </div>
                       </div>

                         <a class="left carousel-control" href="#myCarousel-4" data-slide="prev">
                       
                       </a>
                       <a class="right carousel-control" href="#myCarousel-4" data-slide="next">
                        
                       </a>
                     </div>
                       </div>
                              <div id="myCarousel-3" class="carousel slide" data-ride="carousel">
          
                       <div class="carousel-inner">
                         <div class="item active">
                           <img src="staticResources/images/Projects/tp.jpg" alt="Los Angeles">
                         </div>

                         <div class="item">
                           <img src="staticResources/images/Projects/hyperloop.jpg" alt="Chicago">
                         </div>

                         <div class="item">
                           <img src="staticResources/images/Projects/tp.jpg" alt="New York">
                         </div>
                       </div>

                       <!-- Left and right controls -->
                       <a class="left carousel-control" href="#myCarousel-3" data-slide="prev">
                       
                       </a>
                       <a class="right carousel-control" href="#myCarousel-3" data-slide="next">
                         <!--<span class="glyphicon glyphicon-chevron-right"></span>
                         <span class="sr-only">Next</span>-->
                       </a>
                     </div>

<div class="t3-module module listed-news " id="Mod249">
      <div class="module-inner"><h3 class="module-title "><span><spring:message code="ringroad.otherprojectTitle"/></span></h3>
             <div class="module-ct"> 
                   <div class="nspMain listed-news activated" id="nsp-nsp-249" data-config="{
                            'animation_speed': 400,
                            'animation_interval': 5000,
                             'animation_function': 'Fx.Transitions.Expo.easeIn',
                              'news_column': 1,
                            'news_rows': 5,
                             'links_columns_amount': 1,
                              'links_amount': 0
                                  }">
                                 <div class="nspArts bottom" style="width:100%;">
                                      <div class="nspArtScroll1">
                                            <div class="nspArtScroll2 nspPages1">
                                                 <div class="nspArtPage active nspCol1">
                                                 
                                                 
                                                 <c:forEach items="${projectlist}" var="projectlist"> 
                                                       <div class="nspArt nspCol1" style="padding:5px 0px;">
                                                            <div><h4 class="nspHeader tleft fnull has-image">${projectlist.title }</h4><p class="nspInfo nspInfo1 tleft fnone">${projectlist.date}</p></div> 
                                                         </div>
                                                       </c:forEach>
                                                 
                                                 </div>
                                           </div>
                                    </div>
                           </div>
                  </div>
           </div>
      </div>
</div> 


</div>

 
 
</div>
</div>




         
      

         <footer id="t3-footer" class="wrap t3-footer footer-section">
            <jsp:include page="../includes/Footer.jsp" />
         </footer>
      </div>   
   </body>
</html>