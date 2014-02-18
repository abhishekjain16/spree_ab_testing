if (typeof(ab_test) === 'undefined') { ab_test = {}; }

$(document).ready(function() {
  $(window).resize(function(){
    $(".ui-dialog-content").dialog("option","position","center");
  });

  ab_test.click_on_overlay = function(pop_up_div) {
    $('div.ui-widget-overlay').on('click', function(){
      $('div.ui-widget-overlay').remove();
      pop_up_div.dialog("close");
    });
  }

  ab_test.ModalPopUp = function(pop_up_div) {
    var self = {
      init: function() {
        pop_up_div.dialog({ 
          autoOpen: false,
          modal: true,
          width:"500",
          closeText: "X",
          dialogClass:"test_container",
          close: function(event, ui) {
            pop_up_div.remove();
          }
        });
      },
      show: function() {
        pop_up_div.dialog("open");
        ab_test.click_on_overlay(pop_up_div);
      } 
    }
    self.init();
    return self;
  }  
});