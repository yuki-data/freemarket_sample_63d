var $;
var categoryGroupList = ".exhibit-center__main__form-section__group-list";
var categoryBase = "#product_category";
var categoryChild = "#product_category_child";
var liCategoryChild = "#select_category_child";
var liCategoryGrandChild = "#select_category_grandchild";

$(document).on("turbolinks:load", function() {
  $(categoryBase).on("change", function(e) {
    $(liCategoryChild).remove();
    $(liCategoryGrandChild).remove();
    var categoryValue = $(categoryBase).val();
    if (categoryValue === "") {
      return;
    }
    $.ajax({
      url: "/products/get_category_children",
      type: "GET",
      data: { category_id: categoryValue },
      dataType: "script"
    })
      .done(function(data) {})
      .fail(function() {
        alert("子カテゴリーの取得に失敗しました");
      });
  });

  $(categoryGroupList).on("change", categoryChild, function(e) {
    $(liCategoryGrandChild).remove();
    var categoryValue = $(categoryChild).val();
    $.ajax({
      url: "/products/get_category_grandchildren",
      type: "GET",
      data: { child_id: categoryValue },
      dataType: "script"
    })
      .done(function(data) {})
      .fail(function() {
        alert("孫カテゴリーの取得に失敗しました");
      });
  });
});
