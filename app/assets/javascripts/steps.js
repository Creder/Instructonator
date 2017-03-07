$(document).ready(() => {

  var myDropzone = new Dropzone(document.getElementById('direct_upload'), {
    uploadMultiple: false,
    acceptedFiles:'.jpg,.png,.jpeg,.gif',
    parallelUploads: 6,
    url: cloudinarySettings.url
  });

  myDropzone.on('sending', (file, xhr, formData) => {
    formData.append('api_key', cloudinarySettings.api_key);
    formData.append('timestamp', Date.now() / 1000 | 0);
    formData.append('upload_preset', cloudinarySettings.upload_preset);
  });

  myDropzone.on('success', (file, response) => {
    sendImage(response);
  });

  myDropzone.on('complete', (file) => {
    myDropzone.removeFile(file);
  });

  function formatString(fullUrl, signature){
    var index = fullUrl.indexOf("image/upload");
    return `${fullUrl.substring(index)}#${signature}`;
  }

  function sendImage(data){
    setImageData(data);
    submitForm(data);
    clearImageData();
  }

  function setImageData(data){
    var stepimage = formatString(data.secure_url, data.signature);
    $('<input/>').attr({ name: 'step[stepimage]', value: stepimage, type: "hidden"}).appendTo('form');
    $('#photo_bytes').val(data.bytes);
  }

  function submitForm(response){
    $.post($("form").serialize())
      .done((step) => createImageElement(response, step.id));
  }

  function clearImageData(){
    $("#photo_bytes").val('');
    $('input[name="photo[image]"]').remove();
  }

 
  $('#direct_upload').on('drop',function(e){
    var imgUrl = e.originalEvent.dataTransfer.getData('Text');
    if (imgUrl && !imgUrl.includes("cloudinary.com")) {
      let fd = new FormData();
      fd.append('api_key', cloudinarySettings.api_key);
      fd.append('timestamp', Date.now() / 1000 | 0);
      fd.append('upload_preset', cloudinarySettings.upload_preset);
      fd.append('file', imgUrl);
      sendToCloud(fd, sendImage);
    }
  });

  function sendToCloud(formData, callback){
    $.ajax({
        url : cloudinarySettings.url,
        type: "POST",
        data : formData,
        processData: false,
        contentType: false,
        success: callback
    });
  }

  
});


