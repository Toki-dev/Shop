/* Center Div function */
/**
 * Product Thumbnails Scroller
 */
(function($) {
	

	var settings = {
		upButton: '#product-thumbs-up',
		upCount: '#product-thumbs-total-up',
		downButton: '#product-thumbs-down',
		downCount: '#product-thumbs-total-down',
		itemsToDisplay: 4,
		slideOffset: 0,
		target: ''
	};

	var totalItems = 0;
	var currentOffset = 0;
	var currentDownCount = 0;
	var currentUpCount = 0;
	var $currentItem = null;
	var $container = null

	var methods = {
		init: function(options) {
			settings = $.extend(settings, options);

			$container = $(this).find('ul');
			totalItems = $container.find('li').length;

			// Image selection
			$container.find('li a').click(function(e) {
				e.preventDefault();

				var $target = $(settings.target);
				if (typeof $(this).data('image') != "undefined") {
					$target.stop().fadeOut().attr('src', $(this).data('image')).fadeIn();
				} else {
					$target.stop().fadeOut().attr('src', $(this).attr('src')).fadeIn();
				}

				$target.parent().data({
					title: $(this).data('title'),
					image: $(this).data('zoom'),
					width: $(this).data('width')
				});

				$container.find('.current').removeClass('current');
				$(this).parent().addClass('current');
			});
			
			// Modal
			var modalPaginate = function($modal, $container, update) {
				var $active = $('.current', $container);
				$('.prev,.next', $modal).show();
				
				//Make sure there is an active item.
				if($active.length == 0)
				{
					var $active = $(':first-child', $container);
						$active.addClass('current');
				}
				
				if ($active.is(':first-child')) {
					$('.prev', $modal).hide();
				} else if ($active.is(':last-child')) {
					$('.next', $modal).hide();
				}

				$('h3', $modal).html($(settings.target).parent().data('title'));
				if ($('img', $modal).length) {
					$('img', $modal).remove();
				}
				
				$modal.centerFrameworkModal($(settings.target).parent().data('width'));

				$('.progress').show();
				var $img = $('<img />').load(function(){
					$('.progress', $modal).hide();
					$(this).hide().fadeIn();
				}).appendTo($('.modal-body', $modal)).attr('src', $(settings.target).parent().data('image'));

				return $active;
			};
			$(settings.target).parent().click(function(){
				var $modal = $($(this).attr('href'));
				var $active = modalPaginate($modal, $container);
				$('.next', $modal).click(function(e){
					e.preventDefault();
					$('a', $active.next()).click();
					$active = modalPaginate($modal, $container);
				});

				$('.prev', $modal).click(function(e){
					e.preventDefault();
					$('a', $active.prev()).click();
					$active = modalPaginate($modal, $container);
				});
			});
			
			if (totalItems <= settings.itemsToDisplay) {
				if (settings.upCount != false) {
					$(settings.upCount).hide();
				}

				if (settings.downCount != false) {
					$(settings.downCount).hide();
				}
				
			} else {
				$(settings.upButton).show();
				$(settings.downButton).show();
				$container.addClass('scrolling-thumbnails');
				$container.parent().addClass('has-thumbs');
								
				$currentItem = $container.find('li:first-child');
				$currentItem.addClass('current');
				if (settings.slideOffset == 0) {
					var height = (isNaN(parseInt($currentItem.css('height'))) ? 0 : parseInt($currentItem.css('height')));
						marginTop = (isNaN(parseInt($currentItem.css('margin-top'))) ? 0 : parseInt($currentItem.css('margin-top')));
						marginBottom = (isNaN(parseInt($currentItem.css('margin-bottom'))) ? 0 : parseInt($currentItem.css('margin-bottom')));				
					settings.slideOffset = height + marginTop + marginBottom + 2;
				}

				if ($currentItem[0] == $container.find('li:first-child')[0]) {
					$(settings.upButton).hide();
					if (settings.upCount != false) {
						$(settings.upCount).hide();
					}
				}

				// Initial item offsets
				var top = 0;
				$container.find('li').each(function() {
					$(this).css('top', top + 'px');
					top = top + settings.slideOffset;
				});

				// More items bottom
				currentDownCount = totalItems - settings.itemsToDisplay;
				if (settings.downCount != false) {
					$(settings.downCount).show();
					$(settings.downCount).find('span').html(currentDownCount);
				}

			
				//Setup Up/Down buttons.  Make sure they exist.
				if($(settings.upButton).length == 0)
				{
					$(this).prepend('<a style="display: none;" href="#" id="product-thumbs-up"><span>Up</span></a>');
				}
				if($(settings.downButton).length == 0)
				{
					$(this).append('<a href="#" id="product-thumbs-down"><span>Down</span></a>');
				}
				// Up Button
				$(settings.upButton).click(function(e) {
					e.preventDefault();

					// Slide the images down
					currentOffset = currentOffset + settings.slideOffset;
					$container.find('li').each(function() {
						$(this).css('top', $(this).position().top + settings.slideOffset);
					});

					// Decrement the up count
					currentUpCount = currentUpCount - 1;
					if (settings.upCount != false) {
						$(settings.upCount).find('span').html(currentUpCount);
					}

					// Hide the up arrow and count
					if (currentUpCount == 0) {
						if (settings.upCount != false) {
							$(settings.upCount).hide();
						}

						$(this).hide();
					}

					// Increment the down count
					currentDownCount = currentDownCount + 1;
					if (settings.downCount != false) {
						$(settings.downCount).find('span').html(currentDownCount);
					}

					if (currentDownCount >= 0) {
						if (settings.downCount != false) {
							$(settings.downCount).show();
						}
						$(settings.downButton).show();
					}
				});

				// Down Button
				$(settings.downButton).click(function(e) {
					e.preventDefault();

					// Slide the images up
					currentOffset = currentOffset - settings.slideOffset;
					$container.find('li').each(function() {
						$(this).css('top', $(this).position().top - settings.slideOffset);
					});

					// Decrement the down count
					currentDownCount = currentDownCount - 1;
					if (settings.downCount != false) {
						$(settings.downCount).find('span').html(currentDownCount);
					}

					// Hide the down arrow and count
					if (currentDownCount == 0) {
						if (settings.downCount != false) {
							$(settings.downCount).hide();
						}
						$(this).hide();
					}

					// Increment the up count
					currentUpCount = currentUpCount + 1;
					if (settings.upCount != false) {
						$(settings.upCount).find('span').html(currentUpCount);
					}

					if (currentUpCount >= 0) {
						if (settings.upCount != false) {
							$(settings.upCount).show();
						}
						$(settings.upButton).show();
					}
				});
			}
		}
	};

	$.fn.thumbScroller = function(method) {
		if (methods[method]) {
			return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
		} else if (typeof method === 'object' || !method) {
			return methods.init.apply(this, arguments);
		} else {
			$.error('Method ' + method + ' does not exist on jQuery.thumbScroller.');
		}
	};

})(jQuery);

//Center Framework Modal
;( function ( $ ){
  $.fn.extend({
    centerModalDiv : function (options){
		var o = this.eq(0);
		
		$(o).each(function(){
			var left = ($(window).width() - $(this).actual('outerWidth'))/2;
	
			$(this).css({
				position:'absolute',
				left: left,
				top: top
			});
		});
		
		$(window).bind('load resize',function(){
			$(o).each(function(){
				var left = ($(window).width() - $(this).actual('outerWidth'))/2;
		
				$(this).css({
					position:'absolute',
					left: left,
					top: top
				});
			});
		});	
    }
  });
})( jQuery );		

//Center Framework Modal
;( function ( $ ){
  $.fn.extend({
    centerFrameworkModal : function (modalContentWidth){
		this.eq( 0 ).each(function(){
			var $modal = $(this);
				$modalBody = $modal.find('.modal-body');
				addition = 50;
				bodyWidth = (modalContentWidth < 1024 ? modalContentWidth : modalContentWidth - addition);
				
				
			$modal.width(modalContentWidth + addition);
			$modalBody.css({width:bodyWidth});		
			
			$modal.centerModalDiv();	
		});	 
    }
  });
})( jQuery );


$(function() {
	$('#product-image').hover(function(e) {
		$('#product-zoom').addClass('show');
	}, function(e) {
		$('#product-zoom').removeClass('show');
	});

	// Thumbs
	if ($('#product-image-container.extended').length) {
		$('#product-thumbs').thumbScroller({
			itemsToDisplay: 6,
			upCount: false,
			downCount: false,
			target: '#product-image-display'
		});
	} else {
		$('#product-thumbs').thumbScroller({
			upCount: false,
			downCount: false,
			target: '#product-image-display'
		});
	}

	// Tabs
	$('#expandedDetails a').click(function(e) {
		e.preventDefault();
		$(this).tab('show');
	});

	$('#expandedDetails a').on('shown', function(e) {
		$(e.relatedTarget).find('i').remove();
		$(e.target).append('<i class="icon-active"></i>');
	});	

	
	// Dynamic, centered image modal.	
	$('#image-zoom').each(function() {
		var $modal = $(this);
		
		$modal.wrap('<div id="image-zoom-wrapper" style="display: none;" />');
			
		$modal.on('show', function(e) {
			$('#image-zoom-wrapper').show();
			
			
			//Hide modal, if zoom-wrapper is clicked.
			$('body').mouseup(function (e)
			{		
				if ($modal.has(e.target).length === 0)
				{
					//Prototype object method. 
					$modal.data('modal').hide();		
				}
			});
			
		});
		
		$modal.on('hidden', function(e) {
				$('#image-zoom-wrapper').hide();
		});	
	})
	
	$('#seller_info_thumbs').carousel({interval: false});
	
});