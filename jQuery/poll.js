(function($){
	var defaults = {
		//plugin default options
	};

	function Poll(element, options){
		//determine that element will use the plugin, and the options to apply
		this.config = $.extend({}, defaults, options);
		this.element = element;
		this.init(); //running init method to initialize any task for executing
	}

	Poll.prototype.init = function(){
		//initialize
	}

	Poll.prototype.publicMethod = function(){
		//define method for plugin
	}
	$.fn.poll = function(options){
		new Poll(this.first(), options); //or this to apply to all elements

		return this.first(); //return the jQuery object to continue using jQuery functional
	}
})(jQuery);