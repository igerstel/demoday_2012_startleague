var Site = window.Site || {};
(function($) {
	$(function() {
		
		// PLACE HOLDER
		
		$('input, textarea').placeholder();
		
		// SLIDE SHOW

    $("#slider1").responsiveSlides({
      auto: true,
      pager: true,
      speed: 800,
      maxwidth: 600
    });
    
  //END FUNCTIONS  
	});
})(jQuery);