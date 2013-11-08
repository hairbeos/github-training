/*global define*/

define([
    'jquery',
    'underscore',
    'backbone',
    'templates'
], function ($, _, Backbone, JST) {
    'use strict';

    var PersonView = Backbone.View.extend({
        template: JST['app/scripts/templates/Person.ejs']
    });

    return PersonView;
});