// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
//
// ajax:before - right before ajax call
// ajax:loading - before ajax call made, but after XmlHttpRequest object is created)
// ajax:success - successful ajax call (HTTP 200 or 300 status code)
// ajax:failure - failed ajax call (HTTP 400 or 500 status code)
// ajax:complete - completion of ajax call (after ajax:success and ajax:failure)
// ajax:after - after ajax call is sent (note: not after it returns)
//
//
// ___NEW UPDATES___
// ajax:beforeSend // equivalent to ajax:loading in earlier versions
// ajax:success
// ajax:complete
// ajax:error // equivalent to ajax:failure in earlier versions
//
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
