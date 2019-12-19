var $;

$(document).on("turbolinks:load", function() {
  var imagePreview = ".exhibit-center__main__form-section__images__preview";
  var imagePreviewItem =
    ".exhibit-center__main__form-section__images__preview__item";
  var imageFileInputParent =
    ".exhibit-center__main__form-section__images__residue";
  var imageFileInput =
    ".exhibit-center__main__form-section__images__residue__input";
  var imageInputLabel =
    ".exhibit-center__main__form-section__images__residue > label";
  var imageDeleteButton =
    ".exhibit-center__main__form-section__images__preview__item__button-delete > span";
  var imagesCountUpperLimit = 5;

  function buildPreviewItem(src, alt, image_id) {
    var template = `
    <li class="exhibit-center__main__form-section__images__preview__item" data-image-id="${image_id}">
      <div class="exhibit-center__main__form-section__images__preview__item__image">
        <img alt="${alt}" src="${src}">
      </div>
      <div class="exhibit-center__main__form-section__images__preview__item__button-delete">
        <span>削除</span>
      </div>
    </li>
    `;
    return template;
  }

  function buildImageInput(imageId) {
    var template = `
    <input multiple="multiple" class="exhibit-center__main__form-section__images__residue__input"
      type="file"
      name="product[product_images_attributes][${imageId}][image][]"
      id="product_product_images_attributes_${imageId}_image"
      data-image-id="${imageId}">
    `;
    return template;
  }

  function getLastImageId() {
    var imagePreviewItems = $(imagePreviewItem);
    if (imagePreviewItems.length === 0) {
      return -1;
    }

    var lastImageId = imagePreviewItems.last().data("image-id");
    return lastImageId;
  }

  function getLastInputId() {
    var currentInput = $(imageFileInput).first();
    var currentDataId = currentInput.data("image-id");
    return currentDataId;
  }

  function countPreviewItems() {
    return $(imagePreviewItem).length;
  }

  function hideImageLabel() {
    $(imageInputLabel).hide();
  }

  function showImageLabel() {
    $(imageInputLabel).show();
  }

  function updateImageLabel(updatedImageId) {
    $(imageInputLabel).attr(
      "for",
      `product_product_images_attributes_${updatedImageId}_image`
    );
  }

  function appendImageInput(imageId) {
    var html = buildImageInput(imageId);
    $(imageFileInputParent).prepend(html);
  }

  if (countPreviewItems() >= imagesCountUpperLimit) {
    hideImageLabel();
  }

  $(imageFileInputParent).on("change", imageFileInput, function(e) {
    var file = this.files[0];
    var fileReader = new FileReader();
    var imagesCount = countPreviewItems();
    var lastImageId = getLastInputId();

    fileReader.onload = function(e) {
      var html = buildPreviewItem(e.target.result, file.name, lastImageId);
      $(imagePreview).append(html);
    };
    fileReader.readAsDataURL(file);
    updateImageLabel(lastImageId + 1);
    appendImageInput(lastImageId + 1);
    if (imagesCount + 1 >= imagesCountUpperLimit) {
      hideImageLabel();
    }
  });
  $(imagePreview).on("click", imageDeleteButton, function() {
    showImageLabel();
    var targetImageItem = $(this)
      .parent()
      .parent();
    var imageId = targetImageItem.data("image-id");
    var associatedInput = $(
      `.exhibit-center__main__form-section__images__residue > [data-image-id=${imageId}]`
    );
    var associatedHiddenInput = $(
      `.exhibit-center__main__form-section__images__residue > input[value=${imageId}]`
    );
    targetImageItem.remove();
    associatedInput.remove();
    associatedHiddenInput.remove();
  });
});
