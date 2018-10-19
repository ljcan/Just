<%@ page language="java" import="java.util.*,cn.just.vo.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>发表评论</title>
	<link href="../css/reset_s.css" rel="stylesheet" type="text/css"/>
	<link href="../css/base.css" rel="stylesheet" type="text/css"/>
	<link href="../css/index.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="../css/wenda.css"/>
	<link rel="stylesheet" href="../css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="../css/wysiwyg-editor.css"/>
	<link rel="stylesheet" type="text/css" href="../css/applications_box.css"/>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/wysiwyg.js" type="text/javascript" charset="utf-8"></script>
	<script src="../js/wysiwyg-editor.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="../js/comment.js"></script>
	<script type="text/javascript">

$(document).ready(function(){

    // Full featured editor

    $('#editor1,#editor2,#editor3').each( function(index, element)

    {

        $(element).wysiwyg({

            classes: 'some-more-classes',

            position: index == 0 ? 'top-selection' : (index == 1 ? 'bottom' : 'selection'),

            buttons: {

                // Dummy-HTML-Plugin

                dummybutton1: index != 1 ? false : {

                    html: $('<input id="submit" type="button" value="bold" />').click(function(){

                                // We simply make 'bold'

                                if( $(element).wysiwyg('selected-html') )

                                    $(element).wysiwyg('bold');

                                else

                                    alert( 'Please selection some text' );

                            }),

                    //showstatic: true,    // wanted on the toolbar

                    showselection: false    // wanted on selection

                },

                // Dummy-Button-Plugin

                dummybutton2: index != 1 ? false : {

                    title: 'Dummy',

                    image: '\uf1e7',

                    click: function( $button ) {

                            alert('Do something');

                           },

                    //showstatic: true,    // wanted on the toolbar

                    showselection: false    // wanted on selection

                },

                // ../smiley-Plugin

                smilies: {

                    title: 'Smilies',

                    image: '\uf118', // <img src="path/to/image.png" width="16" height="16" alt="" />

                    popup: function( $popup, $button, $editor ) {

                            var list_smilies = [

                                    '<img src="../smiley/afraid.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/amorous.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/angel.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/angry.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/bored.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/cold.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/confused.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/cross.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/crying.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/devil.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/disappointed.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/dont-know.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/drool.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/embarrassed.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/excited.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/excruciating.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/eyeroll.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/happy.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/hot.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/hug-left.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/hug-right.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/hungry.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/invincible.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/kiss.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/lying.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/meeting.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/nerdy.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/neutral.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/party.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/pirate.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/pissed-off.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/question.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/sad.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/shame.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/shocked.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/shut-mouth.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/sick.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/silent.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/sleeping.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/sleepy.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/stressed.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/thinking.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/tongue.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/uhm-yeah.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/wink.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/working.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/bathing.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/beer.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/boy.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/camera.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/chilli.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/cigarette.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/cinema.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/coffee.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/girl.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/console.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/grumpy.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/in_love.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/internet.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/lamp.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/mobile.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/mrgreen.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/musical-note.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/music.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/phone.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/plate.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/restroom.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/rose.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/search.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/shopping.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/star.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/studying.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/suit.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/surfing.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/thunder.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/tv.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/typing.png" width="16" height="16" alt="" />',

                                    '<img src="../smiley/writing.png" width="16" height="16" alt="" />'

                            ];

                            var $smilies = $('<div/>').addClass('wysiwyg-toolbar-smilies')

                                                      .attr('unselectable','on');

                            $.each( list_smilies, function(index,../smiley){

                                if( index != 0 )

                                    $smilies.append(' ');

                                var $image = $(../smiley).attr('unselectable','on');

                                // Append ../smiley

                                var imagehtml = ' '+$('<div/>').append($image.clone()).html()+' ';

                                $image

                                    .css({ cursor: 'pointer' })

                                    .click(function(event){

                                        $(element).wysiwyg('inserthtml',imagehtml);

                                        // do not close popup

                                        //$(element).wysiwyg('close-popup');

                                    })

                                    .appendTo( $smilies );

                            });

                            $smilies.css({ maxWidth: parseInt($editor.width()*0.95)+'px' });

                            $popup.append( $smilies );

                            // Smilies do not close on click, so force the popup-position to cover the toolbar

                            var $toolbar = $button.parents( '.wysiwyg-toolbar' );

                            if( ! $toolbar.length ) // selection toolbar?

                                return ;

                            var left = 0,

                                top = 0,

                                node = $toolbar.get(0);

                            while( node )

                            {

                                left += node.offsetLeft;

                                top += node.offsetTop;

                                node = node.offsetParent;

                            }

                            left += parseInt( ($toolbar.outerWidth() - $popup.outerWidth()) / 2 );

                            if( $toolbar.hasClass('wysiwyg-toolbar-top') )

                                top -= $popup.height() - parseInt($button.outerHeight() * 1/4);

                            else

                                top += parseInt($button.outerHeight() * 3/4);

                            $popup.css({ left: left + 'px',

                                         top: top + 'px'

                                       });

                            // prevent applying position

                            return false;

                           },

                    //showstatic: true,    // wanted on the toolbar

                    showselection: index == 2 ? true : false    // wanted on selection

                },

                insertimage: {

                    title: 'Insert image',

                    image: '\uf030', // <img src="path/to/image.png" width="16" height="16" alt="" />

                    //showstatic: true,    // wanted on the toolbar

                    showselection: false    // wanted on selection

                },

                insertlink: {

                    title: 'Insert link',

                    image: '\uf08e' // <img src="path/to/image.png" width="16" height="16" alt="" />

                },

                // Fontanme + Fontsize Plugin

                fontname: index == 1 ? false : {

                    title: 'Font',

                    image: '\uf031', // <img src="path/to/image.png" width="16" height="16" alt="" />

                    popup: function( $popup, $button, $editor ) {

                            var list_fontnames = {

                                    // Name : Font

                                    'Arial, Helvetica' : 'Arial,Helvetica',

                                    'Verdana'          : 'Verdana,Geneva',

                                    'Georgia'          : 'Georgia',

                                    'Courier New'      : 'Courier New,Courier',

                                    'Times New Roman'  : 'Times New Roman,Times'

                                };

                            var $list = $('<div/>').addClass('wysiwyg-toolbar-list')

                                                   .attr('unselectable','on');

                            $.each( list_fontnames, function( name, font ){

                                var $link = $('<a/>').attr('href','#')

                                                    .css( 'font-family', font )

                                                    .html( name )

                                                    .click(function(event){

                                                        $(element).wysiwyg('fontname',font);

                                                        $(element).wysiwyg('close-popup');

                                                        // prevent link-href-#

                                                        event.stopPropagation();

                                                        event.preventDefault();

                                                        return false;

                                                    });

                                $list.append( $link );

                            });

                            $popup.append( $list );

                           },

                    //showstatic: true,    // wanted on the toolbar

                    showselection: index == 0 ? true : false    // wanted on selection

                },

                fontsize: index == 1 ? false : {

                    title: 'Size',

                    image: '\uf034', // <img src="path/to/image.png" width="16" height="16" alt="" />

                    popup: function( $popup, $button, $editor ) {

                            var list_fontsizes = {

                                // Name : Size

                                'Huge'    : 7,

                                'Larger'  : 6,

                                'Large'   : 5,

                                'Normal'  : 4,

                                'Small'   : 3,

                                'Smaller' : 2,

                                'Tiny'    : 1

                            };

                            var $list = $('<div/>').addClass('wysiwyg-toolbar-list')

                                                   .attr('unselectable','on');

                            $.each( list_fontsizes, function( name, size ){

                                var $link = $('<a/>').attr('href','#')

                                                    .css( 'font-size', (8 + (size * 3)) + 'px' )

                                                    .html( name )

                                                    .click(function(event){

                                                        $(element).wysiwyg('fontsize',size);

                                                        $(element).wysiwyg('close-popup');

                                                        // prevent link-href-#

                                                        event.stopPropagation();

                                                        event.preventDefault();

                                                        return false;

                                                    });

                                $list.append( $link );

                            });

                            $popup.append( $list );

                           }

                    //showstatic: true,    // wanted on the toolbar

                    //showselection: true    // wanted on selection

                },

                bold: {

                    title: 'Bold (Ctrl+B)',

                    image: '\uf032', // <img src="path/to/image.png" width="16" height="16" alt="" />

                    hotkey: 'b'

                },

                italic: {

                    title: 'Italic (Ctrl+I)',

                    image: '\uf033', // <img src="path/to/image.png" width="16" height="16" alt="" />

                    hotkey: 'i'

                },

                underline: {

                    title: 'Underline (Ctrl+U)',

                    image: '\uf0cd', // <img src="path/to/image.png" width="16" height="16" alt="" />

                    hotkey: 'u'

                },

                strikethrough: {

                    title: 'Strikethrough (Ctrl+S)',

                    image: '\uf0cc', // <img src="path/to/image.png" width="16" height="16" alt="" />

                    hotkey: 's'

                },

                forecolor: {

                    title: 'Text color',

                    image: '\uf1fc' // <img src="path/to/image.png" width="16" height="16" alt="" />

                },

                highlight: {

                    title: 'Background color',

                    image: '\uf043' // <img src="path/to/image.png" width="16" height="16" alt="" />

                },

                alignleft: index != 0 ? false : {

                    title: 'Left',

                    image: '\uf036', // <img src="path/to/image.png" width="16" height="16" alt="" />

                    //showstatic: true,    // wanted on the toolbar

                    showselection: false    // wanted on selection

                },

                aligncenter: index != 0 ? false : {

                    title: 'Center',

                    image: '\uf037', // <img src="path/to/image.png" width="16" height="16" alt="" />

                    //showstatic: true,    // wanted on the toolbar

                    showselection: false    // wanted on selection

                },

                alignright: index != 0 ? false : {

                    title: 'Right',

                    image: '\uf038', // <img src="path/to/image.png" width="16" height="16" alt="" />

                    //showstatic: true,    // wanted on the toolbar

                    showselection: false    // wanted on selection

                },

                alignjustify: index != 0 ? false : {

                    title: 'Justify',

                    image: '\uf039', // <img src="path/to/image.png" width="16" height="16" alt="" />

                    //showstatic: true,    // wanted on the toolbar

                    showselection: false    // wanted on selection

                },

                subscript: index == 1 ? false : {

                    title: 'Subscript',

                    image: '\uf12c', // <img src="path/to/image.png" width="16" height="16" alt="" />

                    //showstatic: true,    // wanted on the toolbar

                    showselection: true    // wanted on selection

                },

                superscript: index == 1 ? false : {

                    title: 'Superscript',

                    image: '\uf12b', // <img src="path/to/image.png" width="16" height="16" alt="" />

                    //showstatic: true,    // wanted on the toolbar

                    showselection: true    // wanted on selection

                },

                indent: index != 0 ? false : {

                    title: 'Indent',

                    image: '\uf03c', // <img src="path/to/image.png" width="16" height="16" alt="" />

                    //showstatic: true,    // wanted on the toolbar

                    showselection: false    // wanted on selection

                },

                outdent: index != 0 ? false : {

                    title: 'Outdent',

                    image: '\uf03b', // <img src="path/to/image.png" width="16" height="16" alt="" />

                    //showstatic: true,    // wanted on the toolbar

                    showselection: false    // wanted on selection

                },

                orderedList: index != 0 ? false : {

                    title: 'Ordered list',

                    image: '\uf0cb', // <img src="path/to/image.png" width="16" height="16" alt="" />

                    //showstatic: true,    // wanted on the toolbar

                    showselection: false    // wanted on selection

                },

                unorderedList: index != 0 ? false : {

                    title: 'Unordered list',

                    image: '\uf0ca', // <img src="path/to/image.png" width="16" height="16" alt="" />

                    //showstatic: true,    // wanted on the toolbar

                    showselection: false    // wanted on selection

                },

                removeformat: {

                    title: 'Remove format',

                    image: '\uf12d' // <img src="path/to/image.png" width="16" height="16" alt="" />

                }

            },

            // Submit-Button

            submit: {

                title: 'Submit',

                image: '\uf00c' // <img src="path/to/image.png" width="16" height="16" alt="" />

            },

            // Other properties

            dropfileclick: 'Drop image or click',

            placeholderUrl: 'www.example.com',

            maxImageSize: [600,200]

            /*

            onImageUpload: function( insert_image ) {

                            // Used to insert an image without XMLHttpRequest 2

                            // A bit tricky, because we can't easily upload a file

                            // via '$.ajax()' on a legacy browser.

                            // You have to submit the form into to a '<iframe/>' element.

                            // Call 'insert_image(url)' as soon as the file is online

                            // and the URL is available.

                            // Best way to do: http://malsup.com/jquery/form/

                            // For example:

                            //$(this).parents('form')

                            //       .attr('action','/path/to/file')

                            //       .attr('method','POST')

                            //       .attr('enctype','multipart/form-data')

                            //       .ajaxSubmit({

                            //          success: function(xhrdata,textStatus,jqXHR){

                            //            var image_url = xhrdata;

                            //            console.log( 'URL: ' + image_url );

                            //            insert_image( image_url );

                            //          }

                            //        });

                        },

            onKeyEnter: function() {

                            return false; // swallow enter

                        }

            */

        })

        .change(function(){

            if( typeof console != 'undefined' )

                console.log( 'change' );

        })

        .focus(function(){

            if( typeof console != 'undefined' )

                console.log( 'focus' );

        })

        .blur(function(){

            if( typeof console != 'undefined' )

                console.log( 'blur' );

        });

    });



    // Demo-Buttons

    $('#editor3-bold').click(function(){

        $('#editor3').wysiwyg('bold');

        return false;

    });

    $('#editor3-red').click(function(){

        $('#editor3').wysiwyg('highlight','#ff0000');

        return false;

    });

    $('#editor3-sethtml').click(function(){

        $('#editor3').wysiwyg('html', 'This is a the html text');

        return false;

    });

    $('#editor3-inserthtml').click(function(){

        $('#editor3').wysiwyg('inserthtml', 'This is some text');

        return false;

    });



    // Raw editor

    var option = {

        element: $('#editor0').get(0),

        onkeypress: function( code, character, shiftKey, altKey, ctrlKey, metaKey ) {

                        if( typeof console != 'undefined' )

                            console.log( 'RAW: '+character+' key pressed' );

                    },

        onselection: function( collapsed, rect, nodes, rightclick ) {

                        if( typeof console != 'undefined' && rect )

                            console.log( 'RAW: selection rect('+rect.left+','+rect.top+','+rect.width+','+rect.height+'), '+nodes.length+' nodes' );

                    },

        onplaceholder: function( visible ) {

                        if( typeof console != 'undefined' )

                            console.log( 'RAW: placeholder ' + (visible ? 'visible' : 'hidden') );

                    }

    };

    var wysiwygeditor = wysiwyg( option );

    //wysiwygeditor.setHTML( '<html>' );

});

</script>
	<style>

body {

    font-family: Arial,Verdana;

}



.button {

    -moz-user-select: none;

    -webkit-touch-callout: none;

    -webkit-user-select: none;

    -khtml-user-select: none;

    -ms-user-select: none;

    user-select: none;

}

/* CSS for the font-name + font-size plugin */

.wysiwyg-toolbar-list {

    max-height: 16em;

    overflow: auto;

    overflow-x: hidden;

    overflow-y: scroll;

}

.wysiwyg-toolbar-list a,

.wysiwyg-toolbar-list a:link,

.wysiwyg-toolbar-list a:visited {

    display: block;

    color: black;

    padding: 5px 10px;

    text-decoration: none;

    cursor: pointer;

}

.wysiwyg-toolbar-list a:hover {

    color: HighlightText;

    background-color: Highlight;

}

/* CSS for the ../smiley plugin */

.wysiwyg-toolbar-smilies {

    padding: 10px;

    text-align: center;

    white-space: normal;

}

.wysiwyg-toolbar-smilies img {

    display: -moz-inline-stack; /* inline-block: http://blog.mozilla.org/webdev/2009/02/20/cross-browser-inline-block/ */

    display: inline-block;

    *display: inline;

}

</style>
</head>
<body>
<!-- /********************头部start***************************/ -->
    <div class="scholor_head">
        <div class="scholor_content clearfix">
            <a href="#2" class="scholor_logo"><img src="../images/just01.png" alt="义工站"/></a>
            <div class="content_title">
               <a href="../message/showMessage.spring">首页</a>
                <a href="special_column.html">专栏</a>
                <a href="research_group.html">技术平台</a>
            </div>
            <div class="input_text clearfix"><span class="cursor_scholor"></span><span class="scholor_search"></span></div>
            <a href="personal_center.html" class="quiz">联系我们</a>
            <div class="information">
              <a href="notice.html" class="inform"><span class="scholor"></span><span class="s_btn">1</span></a>
              <a href="news.html" class="news"><span class="news_btn"></span><span class="s_btn">2</span></a>
              <a href="../html/login.html" class="set"><span class="set_btn"></span><span class="quit">退出</span>退出</a>
              <a href="register.html" class="zhuce_lj">注册</a>
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
                   <a href="applications_box.html"><img src="../images/some.png" width=22 height=22 alt="发布动态"/><span>发布动态</span></a>
		    		<a href="../personal/show.spring"><img src="../images/paper.png" width=28 height=26 alt="我的空间"/><span>我的空间</span></a>
		    		<a href="../html/updateMessage.html"><img src="../images/relast.png" width=28 height=30 alt="修改信息"/><span>修改信息</span></a>
		    		<a href="#2"><img src="../images/relast.png" width=28 height=30 alt="修改头像"/><span>修改头像</span></a>
                </div>
    			<div class="menu_left01" style="height: auto !important;">
    		     	<div class="crumbs">
    		     		<span class="icon"></span>
    		     		<a href="../message/showMessage.spring">个人首页</a>
    		     		<a href="#2">></a>
    		     		<a href="../comment/showAllComment.spring?c_message_id=${param.id}">全部评论</a>
    		     		<a href="#2">></a>
    		     		<a href="../html/comment.jsp?id=${param.id}" class="add_color">添加</a>
    		     	</div>
    		     	<div class="strip"></div>
    		     	 <form action="../comment/publishComment.spring" method="post" class="form">
    		     	 	
	    		     	<label for="">评论：</label><textarea  rows="10" cols="50" name="c_comment" value="" placeholder="发表你的评论......" style="padding-left:1rem"></textarea>
	    		     	<br />
	    		     	<input type="hidden" name="c_message_id" value="${param.id}"/>
					 	<input class="btn" type="submit" name="" id="" value="发布" />
	    		     </form>
	    		</div>   
    		</div>
    		
	    	 <!-- /********************整体内容左边end***************************/ -->
	    	  <!-- /********************整体内容右边start***************************/ -->
	    	<!--
            <div class="menu_right">
	    		<div class="menu_right01">
	    			<p class="menu_right01_title">研究内容及专长</p>
	    			<div class="Label">
	    				<p>科学研究</p>
	    				<p>生物研究</p>
	    				<p>考研</p>
	    				<p>硕士生</p>
	    				<p>科学研究</p>
	    				<p>生物研究</p>
	    				<p>考研</p>
	    				<p>硕士生</p>
	    				<p>科学研究</p>
	    				<p>生物研究</p>
	    				<p>考研</p>
	    				<p>硕士生</p>
	    			</div>
                </div>
	    		<div class="menu_right02 menu_right-02">
	    			<p class="menu_right02_title">组长</p>
	    			<ul>
	    				<li>
	    					<img src="img/head01.jpg"/>
	    					<div class="dec">
	    						<p>默默人</p>
	    						<p>聊天专业.创世神</p>
	    					</div>
	    					<div class="clearfix"></div>
	    				</li>
	    				
	    			</ul>
	    		</div>
	    		<div class="menu_right02 menu_right-02 menu_right-03">
	    			<p class="menu_right02_title">组内老师</p>
	    			<ul>
	    				<li>
	    					<img src="img/head01.jpg"/>
	    					<div class="dec">
	    						<p>默默人</p>
	    						<p>聊天专业.创世神</p>
	    					</div>
	    					<div class="clearfix"></div>
	    				</li>
	    			</ul>
	    		</div>
	    		<div class="menu_right02 menu_right-02 menu_right-03">
	    			<p class="menu_right02_title">组内学生</p>
	    			<ul>
	    				<li>
	    					<img src="img/head01.jpg"/>
	    					<div class="dec">
	    						<p>默默人</p>
	    						<p>聊天专业.创世神</p>
	    					</div>
	    					<div class="clearfix"></div>
	    				</li>
	    				<li>
	    					<img src="img/head01.jpg"/>
	    					<div class="dec">
	    						<p>默默人</p>
	    						<p>聊天专业.创世神</p>
	    					</div>
	    					<div class="clearfix"></div>
	    				</li>
	    				<li>
	    					<img src="img/head01.jpg"/>
	    					<div class="dec">
	    						<p>默默人</p>
	    						<p>聊天专业.创世神</p>
	    					</div>
	    					<div class="clearfix"></div>
	    				</li>
	    			</ul>
	    		</div>
	    		<div class="menu_right03">
	    			版权所有</br>
					联系我们 © 2017 schalor </br>
					网站备案信息： 沪ICP备15041378号</br>
	    		</div>
	    	</div>
	    	-->
	    	<!-- /********************整体内容右边end***************************/ -->
    	</div>
     <!-- /********************整体内容end***************************/ -->
    </div>
    <!-- /********************主体end***************************/ -->
<!--遮罩层start-->
<div class="yinying"></div>
<!--遮罩层end-->
</body>
<script type="text/javascript">
	$(".select").on("click",function(){
		$(".yinying").fadeIn();
		$(".Bomb").fadeIn();
	});
//	$(".yinying").on("click",function(){
//		$(".Bomb").fadeOut();
//		$(".yinying").fadeOut();
//	});
	$(".first_class li").on("click",function(){
		$(this).addClass("curent");
		$(this).find("a").addClass("curentA");
		$(this).siblings("li").removeClass("curent");
		$(this).siblings("li").find("a").removeClass("curentA");
	});
	$(".second_class li").on("click",function(){
		$(this).addClass("curentB");
		$(this).find("a").addClass("curentA");
		$(this).find("img").show();
	});
	
	$(".bty").click(function(e){
		$(this).parent(".second_class li").removeClass("curentB");
		e.stopPropagation();
		$(this).prev().removeClass("curentA");
		$(this).hide();
	});	
	$(".Bomb button").on("mouseover",function(){
		$(".Bomb button").css({"background":"#60abe8","transition":"all ease-in-out 0.3s"});
	});
	$(".Bomb button").on("mouseout",function(){
		$(".Bomb button").css({"background":"#0F88EB","transition":"all ease-in-out 0.3s"});
	});
	$(".Bomb button").on("click",function(){
		$(".Bomb").fadeOut();
		$(".yinying").fadeOut();
	});
</script>
</html>