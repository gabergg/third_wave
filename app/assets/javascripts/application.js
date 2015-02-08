// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$.widget("custom.catcomplete", $.ui.autocomplete, {
    _create: function () {
        this._super();
        this.widget().menu("option", "items", "> :not(.ui-autocomplete-category)");
    },
    _renderMenu: function (ul, items) {
        var that = this,
            currentCategory = "";
        $.each(items, function (index, item) {
            var li;
            if (item.category != currentCategory) {
                ul.append("<li class='ui-autocomplete-category'>" + item.category + "</li>");
                currentCategory = item.category;
            }
            li = that._renderItemData(ul, item);
            if (item.category) {
                li.attr("aria-label", item.category + " : " + item.label);
            }
        });
    }
});


function init_auto_complete() {
    $(".search").catcomplete({
        delay: 0,
        source: $(".search").data('autocomplete-complete-source'),
        select: function (event, ui) {
            window.location = ui.item.url;
        }
    });
}

$(function () {
    $(".need_slider").change(function () {
        $form = $(this);
        $input_value = $form.find("#review_rating").val();
        $final_input = $input_value == 0 ? "None" : $input_value;
        $label = $form.find("#review_rating").prev();
        $label.text("Rating: " + $final_input);
    });
});