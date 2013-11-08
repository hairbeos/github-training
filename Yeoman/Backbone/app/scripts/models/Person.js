/*global define*/

define([
    'underscore',
    'backbone'
], function (_, Backbone) {
    'use strict';

    var PersonModel = Backbone.Model.extend({
        defaults: {
        }
    });

    return PersonModel;
});