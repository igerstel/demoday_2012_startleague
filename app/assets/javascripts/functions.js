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
        
    $('aside .toggler a').click(function() {
	    $('aside nav').slideToggle();
    });
    
    $('.add-product h3 a').click(function() {
	    $('.add-product form').slideToggle();
    });
    
     $('.add-location h3 a').click(function() {
	    $('.add-location form').slideToggle();
    });
    
  // END FUNCTIONS  
	});
})(jQuery);