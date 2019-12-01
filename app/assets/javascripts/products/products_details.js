var $;
$(document).on("turbolinks:load", function() {
  $(".product-detail__content__main__photo__slide-show").slick({
    infinite: true, //スライドのループ有効化
    arrows: false, //矢印非表示
    fade: true, //フェードの有効化
    centerMode: true,
    draggable: false, //ドラッグ操作の無効化
    autoplay: true
  });
  $(".product-detail__content__main__photo__thumbnails").slick({
    infinite: true, //スライドのループ有効化
    slidesToShow: 8, //表示するスライドの数
    focusOnSelect: true, //フォーカスの有効化
    asNavFor: ".product-detail__content__main__photo__slide-show"
    //thumbnailクラスのナビゲーション
  });
  // var slides = ".product-detail__content__main__photo__slide-show";
  // $(slides).slick({
  //   dots: true,
  //   infinite: true,
  //   speed: 300,
  //   slidesToShow: 1,
  //   adaptiveHeight: true
  // });
  // $(slides).slick({ infinite: true, slidesToShow: 1, slidesToScroll: 3 });
});
