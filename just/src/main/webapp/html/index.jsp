<%@ page language="java" import="java.util.*,cn.just.vo.*,java.io.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>首页</title>
	<link href="../css/reset_s.css" rel="stylesheet" type="text/css"/>
	<link href="../css/base.css" rel="stylesheet" type="text/css"/>
	<link href="../css/index.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="../js/comment.js"></script>
	
	 <script type="text/javascript">
	//	var isclock=false;
    	function like(user_id,content_id) {
    	//	if(isclock==false){		//防止重复点赞
    		//	isclock=true;
        var ajax = new XMLHttpRequest();
        ajax.open("GET", "../like/likeContent.spring?user_id="+user_id+"&content_id="+content_id);
        ajax.send();
        //判断请求的状态码
        ajax.onreadystatechange=function(){
        	var data=ajax.responseText;
            if(ajax.readyState===4&&ajax.status===200){
           //    document.getElementById("size").innerHTML=data;
              // alert(data);
            }else{
          //  alert("发生错误:"+ajax.status);
        }
    	}
    		//}
    }
	</script>
	
	
	
	
</head>
<body>
<!-- /********************头部start***************************/ -->
	
	<div class="scholor_head">
		<div class="scholor_content clearfix">
			<a href="../personal/show.spring" class=""><img src="${pageContext.request.contextPath}${newimage}" alt="我的头像"/></a>
			<div class="content_title">
				<a href="../message/showMessage.spring">首页</a>
	    		<a href="">专栏</a>
	    		<a href="">技术平台</a>
			</div>
            <div class="input_text clearfix"><span class="cursor_scholor"></span><span class="scholor_search"></span></div>
            <a href="personal_center.html" class="quiz">联系我们</a>
            <div class="information">
		      <a href="notice.html" class="inform"><span class="scholor"></span><span class="s_btn">1</span></a>
		      <a href="news.html" class="news"><span class="news_btn"></span><span class="s_btn">2</span></a>
		      <a href="../html/login.html" class="set"><span class="set_btn"></span><span class="quit">退出</span>退出</a>
              <a href="../html/register.html" class="zhuce_lj">注册</a>
		   </div>
	  </div>
	</div>
<!-- /********************头部end***************************/ -->
<!-- /********************主体start***************************/ -->
    <div class="scholor_main clearfix">  	
    	<!-- /********************整体内容start***************************/ -->
    	<div class="menu_main clearfix">
    	    <!-- /********************整体内容左边start***************************/ -->
    		<div class="menu_left">
    		    <div class="scholor_title">
		    		<a href="../html/applications_box.jsp?image=${pageContext.request.contextPath}${newimage}&user_id=${user_id}"><img src="../images/some.png" width=22 height=22 alt="发布动态"/><span>发布动态</span></a>
		    		<a href="../personal/show.spring"><img src="../images/paper.png" width=28 height=26 alt="我的空间"/><span>我的空间</span></a>
		    		<a href="../html/updateMessage.html"><img src="../images/relast.png" width=28 height=30 alt="修改信息"/><span>修改信息</span></a>
		    		<a href="../jsp/imageupload.jsp?user_id=${user_id}"><img src="../images/relast.png" width=28 height=30 alt="修改头像"/><span>修改头像</span></a>
		    	</div>
		    	<c:forEach items="${list}" var="list" varStatus="status">
    		     <div class="menu_left01">
    		     	 <a href="../personal/show2.spring?username=${list.username}&id=${list.id}" class="a_portrait clearfix">
    		     	 <!--  
    		     	     <span class="portrait_img"><img src="../images/tx_zbj.jpg"/></span>
    		     	      -->
    		     	      <span class="portrait_img"><img src="${pageContext.request.contextPath}${list.message_image }"/></span>
    		     	     <div class="portrait_title">
	    		     	      <span class="font_texts" style="color:#7D9EC0">${list.username}</span>
    		     	     </div>
    		     	 </a>
    		     	 <div class="text_scholor">
    		     	 	<span class="font_texts" style="color:#F00">
    		     	 	<!-- 
						 -->
    		     	 	</span>
						${list.content}
						
						
    		     	 </div>
    		     	   <div class="scholor_icon">
    		     	   <!-- 根据该动态的id查发该条动态的人 -->
    		     	   <a onclick="javascript:like(${user_id},${list.id});" class="attention clearfix"><img src="../images/collect.png" width=20 height=20 alt="点赞"/><span>点赞<a id="size">${list.like_num}</a></span></a>
    		     	 	<a href="../love/attention.spring?name=${list.username}" class="attention clearfix"><img src="../images/collect.png" width=20 height=20 alt="关注"/><span>关注</span></a>
    		     	 	<a href="../html/comment.jsp?id=${list.id}" class="reply clearfix"><img src="../images/reply.png" width=22 height=20 alt="评论"/><span>评论</span></a>
    		     	 	<a href="#2" class="num_scholor clearfix"><img src="../images/num.png" width=22 height=20 alt="关注"/><span>浏览数<i class="liulan">6</i></span></a>
    		     	 	<a href="../dispatcher.spring?username=${list.username}&content=${list.content}" class="num_six clearfix"><img src="../images/num_six.png" width=22 height=20 alt="转发"/><span>转发</span></a>
    		     	 </div>
    		     </div>
    		      </c:forEach>
    		     
	    	</div>
	    	 <!-- /********************整体内容左边end***************************/ -->
	    	  <!-- /********************整体内容右边start***************************/  -->
	    	<div class="menu_right">
	    		<div class="menu_right01">
	    			<div class="specialcolumn">
	    			   <span class="column">用户</span>
	    			   <a href="#2" class="special">换一批</a>
	    			</div>
	    			<c:forEach items="${userlist}" var="userlist" varStatus="status">
                    <div class="special_text">
                    	
                    	<a href="../personal/show2.spring?username=${userlist.username}&id=${userlist.id}" class="clearfix"><span class="special_span01">${userlist.username}</span><span class="special_span02">查看</span></a>
                    	
                    </div>
                    </c:forEach>
	    		</div>
	    		
	    		<div class="menu_right03">
	    			版权所有</br>
					联系我们   2018  </br>
	    		</div>
	    	</div>
	    	
	    	<!-- /********************整体内容右边end***************************/ -->
    	</div>
     <!-- /********************整体内容end***************************/ -->
    </div>
    <!-- /********************主体end***************************/ -->
</body>
</html>