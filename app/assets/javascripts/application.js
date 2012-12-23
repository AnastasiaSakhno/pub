// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function () {
    // Setup drop down menu
    $('.dropdown-toggle').dropdown();

    // Fix input element click problem
    $('.dropdown input, .dropdown label').click(function (e) {
        e.stopPropagation();
    });

    switchActiveMenu();
});

function switchActiveMenu() {
    var exec = /\/\w+$/.exec(window.location.href);
    if (exec) {
        var obj = getLinkParentByHref(exec[0]);
        if (obj) {
            setActive(getLinkParentByHref('/home'), false);
            setActive(obj, true);
        }
    }
}

function getLinkParentByHref(href) {
    return $('a[href="' + href + '"]:first').parent();
}

function setActive(el, active) {
    eval('el.' + (active ? 'add' : 'remove') + 'Class("active");');
}

function scrollUp() {
    $("html, body").animate({ scrollTop:0 }, 2000);
}
