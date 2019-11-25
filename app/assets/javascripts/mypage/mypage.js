$(function() {
  $("#todo-tab").click(function(e) {
    e.preventDefault();
    $("#todo-tab").addClass("active");
    $("#notice-tab").removeClass("active");
    $(".main__inner__body__notification__messages").hide();
    $(".main__inner__body__notification__alerts").show();
  });

  $("#notice-tab").click(function(e) {
    e.preventDefault();
    $("#todo-tab").removeClass("active");
    $("#notice-tab").addClass("active");
    $(".main__inner__body__notification__messages").show();
    $(".main__inner__body__notification__alerts").hide();
  });
});
