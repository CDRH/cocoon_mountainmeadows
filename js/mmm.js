                    
                    
                    function highlightSpan(spanTitle)
                    {
   					   var spans = document.getElementsByTagName("span");
					  //take away color
                      for (var i = 0; i < spans.length; ++i)
                      {
                        spans[i].style.backgroundColor = "transparent";
                      }
					  //add color
					  for (var i = 0; i < spans.length; ++i)
                      {
                      if (spans[i].getAttribute('title') == spanTitle)
                      { 
                        spans[i].style.backgroundColor = "#CE8C27";
                        } 
                      }
					  
                    }
					
					
function jfInit(){
		
	 $("table#concepts tr.odd, table#concepts tr.subType").hide();
	 
	 	 $("h3.typeTitle").bind("click", 
			function(e)
			{
				var show = $(this).attr("title");
				$("tr[title=" + show + "]").toggle();
			}
		);
		 
		 $("h3.typeTitle").wrap("<a href=\"javascript:void(0)\"></a>");

}
					
$(document).ready(jfInit);

/* Javascript File */

//pretty photo 
$(document).ready(function(){
    $("a[rel^='prettyPhoto']").prettyPhoto({
    social_tools: false,
    theme: 'pp_default',
    show_title: true,
    deeplinking: false,
    overlay_gallery: false
    });
  });
  

// Switch box
  
$(document).ready(function(){

$("#switch_box .switch_box--switch").toggle(function() {
	$(this).html('Disable highlighting of handwritten text.');
	$('.handwritten').addClass("switch_box_highlight");
}, function() {
	$(this).html('Enable highlighting of handwritten text.');
	$('.handwritten').removeClass("switch_box_highlight"); 
});

});

//More text 

  $(document).ready(function(){
  	$(".descriptionmore").hide();	
  	$(".descriptionfirst").append('<a href="javascript:void(0)" class="morelink">More...</a>');
  	$(".descriptionmore p:last-child").append('<a href="javascript:void(0)" class="lesslink">Less...</a>');
  	$(".morelink").click(function() {
  		$(".descriptionmore").show();
  		$(".descriptionfirst a").hide();
  		});    
  	$(".lesslink").click(function() {
  		$(".descriptionmore").hide();
  		$(".descriptionfirst a").show();
  		}); 
  
  
  //$(.descriptionfirst)
  
  });
  

// Tooltips 

$(document).ready(function(){
    
    var globalTip = "";
  
    //Select all anchor tag with rel set to tooltip
    $('a[rel=tooltip]').mouseenter(function(e) {

        if( globalTip == "" ) {
            //Grab the title attribute's value and assign it to a variable
            var tip = $(this).attr('title');
            globalTip = tip;

            //Remove the title attribute's to avoid the native tooltip from the browser
            $(this).attr('title','');

            //Append the tooltip template and its value
            $(this).prepend('<div id="tooltip" style="text-decoration: none;">' + tip + '</div>');     

            //Set the X and Y axis of the tooltip
            $('#tooltip').css('top', e.pageY + 10 );
            $('#tooltip').css('left', e.pageX + 20 );

            //Show the tooltip with faceIn effect
            $('#tooltip').fadeIn('500');
            $('#tooltip').fadeTo('10',1);
        }
         
    }).mousemove(function(e) {

    }).mouseout(function() {
        if( globalTip != "" ) {
            //Put back the title attribute's value
            /*$(this).attr('title',$('#tooltip').html());*/
        
            $(this).attr('title',globalTip);
        
            /*        $(this).attr('title',function() { 
                      $('#tooltip').html();
                      });
                      */     
            //Remove the appended tooltip template
            $(this).children('div#tooltip').remove();

            globalTip = "";
        }
    });

});