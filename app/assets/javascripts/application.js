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
//= require jquery_nested_form

$(function () {
    initCarousel();
    // Setup drop down menu
    $('.dropdown-toggle').dropdown();

    // Fix input element click problem
    $('.dropdown input, .dropdown label').click(function (e) {
        e.stopPropagation();
    });

    switchActiveMenu();

    $('.create-ingredient').click(function(){
        var id = $(this).attr('id');
        var re = /create-ingredient-(\d+)/;
        var menu_id = id.match(re)[1];
        $('#ingredient_menu_id').val(menu_id);
        $('#create-ingredient').modal('show');
    });

    //--------------table headers always on the top-----------------
    $("table.table").each(function() {
        $(this).wrap("<div class=\"divTableWithFloatingHeader\" style=\"position:relative\"></div>");

        var originalHeaderRow = $("tr:first", this)
        originalHeaderRow.before(originalHeaderRow.clone());
        var clonedHeaderRow = $("tr:first", this)

        clonedHeaderRow.addClass("tableFloatingHeader");
        clonedHeaderRow.css("position", "absolute");
        clonedHeaderRow.css("top", "0px");
        clonedHeaderRow.css("left", $(this).css("margin-left"));
        clonedHeaderRow.css("visibility", "hidden");

        originalHeaderRow.addClass("tableFloatingHeaderOriginal");
    });
    UpdateTableHeaders();
    $(window).scroll(UpdateTableHeaders);
    $(window).resize(UpdateTableHeaders);
});

function initCarousel(){
    $('.carousel').carousel({
        interval: 4000
    });

    $('.carousel').carousel('cycle');
}

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

/**
 * table headers always on the top
 */
function UpdateTableHeaders() {
    $("div.divTableWithFloatingHeader").each(function() {
        var originalHeaderRow = $(".tableFloatingHeaderOriginal", this);
        var floatingHeaderRow = $(".tableFloatingHeader", this);
        var offset = $(this).offset();
        var scrollTop = $(window).scrollTop() + 43;
        if ((scrollTop > offset.top) && (scrollTop < offset.top + $(this).height())) {
            floatingHeaderRow.css("visibility", "visible");
            floatingHeaderRow.css("top", Math.min(scrollTop - offset.top, $(this).height() - floatingHeaderRow.height()) + "px");

            // Copy cell widths from original header
            $("th", floatingHeaderRow).each(function(index) {
                var cellWidth = $("th", originalHeaderRow).eq(index).css('width');
                $(this).css('width', cellWidth);
            });

            // Copy row width from whole table
            floatingHeaderRow.css("width", $(this).css("width"));
        }
        else {
            floatingHeaderRow.css("visibility", "hidden");
            floatingHeaderRow.css("top", "0px");
        }
    });
}