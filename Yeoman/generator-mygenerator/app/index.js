'use strict';
var util = require('util');
var path = require('path');
var yeoman = require('yeoman-generator');


var MygeneratorGenerator = module.exports = function MygeneratorGenerator(args, options, config) {
  yeoman.generators.Base.apply(this, arguments);

  this.on('end', function () {
    this.installDependencies({ skipInstall: options['skip-install'] });
  });

  this.pkg = JSON.parse(this.readFileAsString(path.join(__dirname, '../package.json')));
};

util.inherits(MygeneratorGenerator, yeoman.generators.Base);

MygeneratorGenerator.prototype.askFor = function askFor() {
  var cb = this.async();

  // have Yeoman greet the user.
  console.log(this.yeoman);

  var prompts = [{
    name: 'blog',
    message: 'Enter the blog name?',
    default: 'blogName'
  }];

  this.prompt(prompts, function (props) {
    this.blog = props.blog;

    cb();
  }.bind(this));
};

MygeneratorGenerator.prototype.app = function app() {
  this.mkdir('app');
  this.mkdir('app/templates');

  this.copy('_package.json', 'package.json');
  this.copy('_bower.json', 'bower.json');
};

MygeneratorGenerator.prototype.projectfiles = function projectfiles() {
  this.copy('editorconfig', '.editorconfig');
  this.copy('jshintrc', '.jshintrc');
};
