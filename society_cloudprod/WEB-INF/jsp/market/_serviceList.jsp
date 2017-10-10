<%@page import="app.societywala.common.bo.AttachementConstatnt"%>
<%@include file="../common/ajaxConfig.jsp" %>
<c:forEach items="${advertiseDetailsBOList}" var="advertiseDetailsBO">
<%
String imglocStr = CommonConstant.USER_IMAGE_CONTEXT_URL + "/Thumbnail/" + AttachementConstatnt.getEntityFolderName(AttachementConstatnt.ADMIN_ENTITY)+ "/" +  AttachementConstatnt.ADMIN_ADVERTISE_SPONSOR_ENTITY_ID + "/" + AttachementConstatnt.getImageModuleFolderName(AttachementConstatnt.IMG_ADVERTISE_SPONSOR_MODULE)+"/";
request.setAttribute("imglocStr", imglocStr);
%>
<c:set var="imglocation" value="${imglocStr}${advertiseDetailsBO.imageFileName}"/>

<div class="ct-blog-header media">
	<div class="media-left">
		<!-- <div class="ct-blog-date">
			<span class="ct-blog-date-number h3">28</span> 
			<span class="ct-blog-date-month">Aug 2015</span>
		</div> -->
		<a class="ct-js-magnificPopupImage" href=<c:out value="${imglocation}"/>>
        <figure class="ct-gallery-item sail-boats" style="width:100%">
            <img src=<c:out value="${imglocation}"/>>
            <figcaption>
                <div class="ct-u-displayTableVertical">
                    <div class="ct-u-displayTableCell">
                        <span class="ct-iconButton ct-iconButton--larger ct-u-marginBottom20"><i class="fa fa-search"></i></span>
                        <h6 class="ct-u-hr ct-u-hr--center text-uppercase ct-fw-bold ct-u-marginBottom15">${advertiseDetailsBO.providerName}</h6>
                        <p>${advertiseDetailsBO.providerName}</p>
                    </div>
                </div>
            </figcaption>
        </figure>
    	</a>
	</div>
	<div class="media-body media-middle">
		<h4 class="ct-blog-title">${advertiseDetailsBO.providerName}</h4>
		<h3 class="ct-blog-title">${advertiseDetailsBO.address}</h3>
		<p class="ct-blog-meta">
			<span> <input id="input-2" name="input-2" class="rating rating-loading" data-min="0" data-max="5" data-step="0.1"></span>
			<span> <i class="fa fa-user"></i> Since <a href="#">${advertiseDetailsBO.providerSinceYear}</a> </span>
			<span> <i class="fa fa-comments"></i> <a href="#">0 comments</a>	</span>
		</p>
	</div>
</div>
<div class="ct-blog-content">
	<p>${advertiseDetailsBO.aboutProvider}</p>
</div>
<a href="javascript:;" onclick="javascript:aboutProvider('${advertiseDetailsBO.advertiseDetailsId}');" class="btn btn-md btn-motive pull-right"><span>Read
		More <span class="ct-iconButton ct-iconButton--larger"><i
			class="fa fa-arrow-right"></i></span>
</span></a>
<div class="clearfix"></div>
</c:forEach>

<script>
$(document).on('ready', function(){
    $('#input-2').rating({rtl: true, containerClass: 'is-star'});
});
</script>