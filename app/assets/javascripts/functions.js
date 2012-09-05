var Site = window.Site || {};
(function($) {
	$(function() {
		
		// PLACE HOLDER
		
		$('input, textarea').placeholder();
		
		// SLIDE SHOW

    $("#slideshow").responsiveSlides({
      auto: true,
      pager: true,
      speed: 800,
      maxwidth: 600
    });
    
    // ANY STRETCH
    
    $('#home .top').anystretch("/assets/background/home-top-bg.jpg");
    
  // END FUNCTIONS  
	});
})(jQuery);