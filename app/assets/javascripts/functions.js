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
    
    // SLIDE TOGGLE
    
    var slideTrigger = $('aside h3 a');
    
    $(slideTrigger).click(function() {
	    $('aside nav').slideToggle();
    });
    
  // END FUNCTIONS  
	});
})(jQuery);