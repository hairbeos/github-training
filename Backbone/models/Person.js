var Person = Backbone.Model.extend({
    defaults: {
        name: '',
        age: 0
    },

    initialize: function() {
        //console.log(this);
        this.on('change', function(e) {
            //listening changing on all attrs
            console.log('Model has changed: ' + JSON.stringify(e));
        });

        this.on('change:name', function(e) {
            //listening changing on specific attr
            console.log('Name of Person has changed to: ', JSON.stringify(e));
            //console.log(e.age);
        });

        this.on('invalid', function(model, error) {
            console.log(error);
        });
    },

    validate: function(attrs) {
        if (!attrs.name) {
            return "Name is required";
        };

        if (attrs.age == 0) {
            return "Age must be greater than zero";
        };
    },
});