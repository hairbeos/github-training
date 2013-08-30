(function($) {
    var defaults = {
        url: '/',
        processData: function(data){
            return data;
        },
        minLength: 1, //min length of input to start autocomplete
        maxResults: 0, //0 to display all results
        wrapper: "<div></div>",
        wrapperClass: "autocomplete-wrapper",
        containerClass: "autocomplete-container",
        itemClass: "autocomplete-item",
        itemHoverClass: "autocomplete-item-hover",
        fadeInDuration: 500,
        fadeOutDuration: 300,
    };

    function AutoComplete(input, options) {
        this.config = $.extend({}, defaults, options);
        this.input = input;
        this.init();
    }

    AutoComplete.prototype.init = function() {
        this.wrapper = $(this.config.wrapper).insertAfter(this.input);
        this.wrapper.addClass(this.config.wrapperClass);

        this.container = $("<ul></ul>").appendTo(this.wrapper);
        this.container.addClass(this.config.containerClass);
        this.container.hide();

        this.initData();
        this.initTyping();
        this.initControls();
    }
    AutoComplete.prototype.initData = function() {
        this.config.data = [];
        var self = this;
        $.ajax({
            url: this.config.url,
            type: 'GET',
            dataType: "text",
            //contentType: 'text/plain; charset=x-user-defined',
            error: function(e, status, reason) {
                console.log(e);
            },
            success: function(data, status, xhr) {
                var items = data.split('\n');
                self.config.data = self.config.processData(items);
            },
        });

        //console.log(self.config.data);
    }

    AutoComplete.prototype.initTyping = function() {
        var self = this;
        var input = this.input;
        var config = this.config;

        input.keyup(function(e) {
            //not control key
            if (
                e.keyCode != '40' &&
                e.keyCode != '38' &&
                e.keyCode != '12' &&
                e.keyCode != '37' &&
                e.keyCode != '39' &&
                e.keyCode != '13'
            ) {
                var value = input.val();
                if (value.length >= config.minLength) {
                    self.getHints(value, function(data) {
                        self.showHints(data);
                    });
                } else {
                    self.container.html('');
                }
            }
        })
    }

    AutoComplete.prototype.initControls = function() {
        var input = this.input;
        var self = this;
        var config = this.config;
        input.keydown(function(e) {
            if (e.keyCode == '40') { //down
                var next = self.container.find('.' + config.itemHoverClass).next();
                if (next.length == 0) {
                    next = self.container.find('.' + config.itemClass).first();
                }
                self.container.find('.' + config.itemHoverClass).removeClass(config.itemHoverClass);
                next.addClass(config.itemHoverClass);
            }

            if (e.keyCode == '38') { //up
                var prev = self.container.find('.' + config.itemHoverClass).prev();

                if (prev.length == 0) {
                    prev = self.container.find('.' + config.itemClass).last();
                }
                self.container.find('.' + config.itemHoverClass).removeClass(config.itemHoverClass);
                prev.addClass(config.itemHoverClass);
            }

            if (e.keyCode == '13') { //enter
                e.preventDefault();
                self.setInputValue();
            }
        })
    }

    AutoComplete.prototype.getHints = function(value, onComplete) {
        var data = this.config.data;
        var config = this.config;
        if (data instanceof Array && data.length > 0) {
            var hints = [];
            $(data).each(function(i) {
                var val = data[i].toLowerCase().trim();
                var rev = val.search(value.toLowerCase().trim());

                if (rev != -1) {
                    hints.push({
                        index: rev,
                        value: data[i]
                    });
                }
            });
            //sort by 
            hints.sort(function(a, b) {
                return a.index - b.index
            });
            if (hints.length > 0) {
                onComplete(hints);
            } else {
                this.container.html('');
            }
            //console.log(hints);
        }
    }

    AutoComplete.prototype.showHints = function(data) {
        var self = this;
        //reset container
        this.container.html('');

        //add matched item to container
        var max = (this.config.maxResults > 0 ? this.config.maxResults : data.length);
        max = (max < data.length ? max : data.length);

        for (var i = 0; i < max; i++) {
            self.addHint(data[i]);
        };

        this.showContainer();
    }

    AutoComplete.prototype.addHint = function(item) {
        var config = this.config;
        var hintItem = $("<li></li>");
        hintItem.addClass(config.itemClass);
        //hintItem.addClass("index-1");
        hintItem.html(item.value);
        hintItem.appendTo(this.container);


        //set textbox value when item is clicked
        var self = this;
        hintItem.click(function(e) {
            self.setInputValue();
        });

        hintItem.hover(
            function() {
                self.container.find('.' + config.itemHoverClass).removeClass(config.itemHoverClass);
                hintItem.addClass(config.itemHoverClass);
            },
            function() {
                self.container.find('.' + config.itemHoverClass).removeClass(config.itemHoverClass);
                hintItem.removeClass(config.itemHoverClass);
            }
        );
    }

    AutoComplete.prototype.showContainer = function() {
        this.container.fadeIn(this.config.fadeInDuration, function() {
            //set container size, position
        })
    }

    AutoComplete.prototype.hideContainer = function() {
        this.container.fadeOut(this.config.fadeOutDuration, function() {

        })
    }

    AutoComplete.prototype.setInputValue = function(item) {
        var selected = this.container.find('.' + this.config.itemHoverClass);

        if (selected.length > 0) {
            this.input.val(selected.text());
            this.hideContainer();
        }
    }
    $.fn.autocomplete = function(options) {
        var acp = new AutoComplete(this.first(), options);

        return this.first();
    }
})(jQuery)