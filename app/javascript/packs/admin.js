import './admin/style.scss'
// import "core-js/stable"
import 'bootstrap'
import "@coreui/coreui"
import toastr from 'toastr';
import queryString from 'query-string'
import ReactDOM from 'react-dom'
import "controllers"
import 'select2';
import PerfectScrollbar from 'perfect-scrollbar';
// https://chartkick.com/
require("chartkick")
require("chart.js")

window.queryString = queryString
window.toastr = toastr;
var Turbolinks = require("turbolinks")
Turbolinks.start()

require('jquery');


$(document).ajaxSend(function(e, xhr, options) {
  var token = $("meta[name='csrf-token']").attr('content');
  xhr.setRequestHeader('X-CSRF-Token', token);
});
window.Rails = require("@rails/ujs")
window.Rails.start()


var remote_select2 = function (el, url, opts = {}) {
  // var maxSize, url, placeholder;
  // url = $(el).data('url');
  // maxSize = $(el).data('maximumselectionsize') || 5;
  return $(el).select2({
    theme: "bootstrap4",
    ajax: {
      url: url,
      delay: 250,
      minimumInputLength: 1,

      data: function (params) {
        console.log('params', params)
        var query = {
          name: params.term,
          q: params.term,
        };
        return query
      },

      processResults: function (data) {
        // Tranforms the top-level key of the response object from 'items' to 'results'
        return {
          results: data
        };
      },

      templateResult: function (data) {
        return data.text;
      }
    }
  });
}

// var componentRequireContext = require.context("components", true);
// var ReactRailsUJS = require("react_ujs");
// ReactRailsUJS.useContext(componentRequireContext);

// turbolinks 加载的事件或者使用 stimulus
// 
document.addEventListener("turbolinks:load", function () {
  $(".search_form select").addClass('form-control');


})