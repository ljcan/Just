	$(function(){
			$(".special_text").find("a").mouseover(function(){
               $(this).find(".special_span01").css({"color":"#698ebf"});

			 }).mouseout(function(){
			 	  $(this).find(".special_span01").css({"color":"#666"});

			 });
			 $(".specialmeau").find("a").mouseover(function(){
               $(this).find(".special_font").css({"color":"#698ebf"});
               $(this).find(".special_title").css({"color":"#698ebf"});

			 }).mouseout(function(){
			 	  $(this).find(".special_font").css({"color":"#666"});
                   $(this).find(".special_title").css({"color":"#333"});
			 });
			 $(".set").mouseover(function(){
			 	$(".quit").css({"display":"block"});
			 }).mouseout(function(){
			 	$(".quit").css({"display":"none"});
			 });
		})