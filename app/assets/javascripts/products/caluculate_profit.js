var $;
$(document).on("turbolinks:load", function() {
  var feeInjectTarget =
    ".exhibit-center__main__form-section__calculate__result--fee > span";
  var profitInjectTarget =
    ".exhibit-center__main__form-section__calculate__result--profit > span";
  var priceInputField =
    ".exhibit-center__main__form-section__group__form__input";
  var priceNull = "---";

  function getInputPrice(inputField) {
    var price = $(inputField).val();
    price = parseInt(price);
    if (isNaN(price) || price < 300) {
      return false;
    } else {
      return price;
    }
  }

  $(priceInputField).on("change", function() {
    var price = getInputPrice(this);
    var fee = price ? Math.round(price * 0.1) : priceNull;
    var profit = price ? Math.round(price * 0.9) : priceNull;
    $(feeInjectTarget).text(fee);
    $(profitInjectTarget).text(profit);
  });
});
