// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
// require foundation
//= require_tree .

(function(root) {
  'use strict';

  var $ = root.$;

  root.Money = (function() {
    function Money(data) {
      this.data = data;
    }

    Money.prototype.amount = function() {
      return this.data.cents / 100;
    }

    Money.prototype.currencySymbol = function() {
      return this.data.currency.symbol;
    }

    Money.prototype.toString = function() {
      return this.currencySymbol() + this.amount().toString();
    }

    return Money;
  })();

  $(root.document).ready(function() {
    var $sidebar = $('#sidebar'),
        xhr = $.ajax({
          dataType: 'jsonp',
          ifModified: true,
          url: 'http://localhost:3004/api/v1/campaigns/au-13'
        });

    xhr.done(function(data) {
      var money    = new root.Money(data.campaign.funds_raised),
          $content = $('<div />');

      $content.html("Funds raised " + money.toString());
      $sidebar.append($content);
    });

    xhr.fail(function(xhr, textStatus, errorThrown) {
      alert('could not load funds raised');
    });
  });
})(this);
