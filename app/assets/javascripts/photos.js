$(function() {

  $('.direct-upload').each(function() {
    
		var form = $(this)		
		var food_type = form.find('span').data('foodie-type')
		var food_type_string = '#' + food_type + '_file'
    var upload_area = '#upload_area_' + food_type
		var progress_type = $(upload_area).find('.progress').data('foodie-type')
		
    $(this).fileupload({
      url: form.attr('action'),
      type: 'POST',
      autoUpload: true,
      dataType: 'xml',
      add: function (event, data) {
        $.ajax({
          url: "/signed_urls",
          type: 'GET',
          dataType: 'json',
          data: {doc: {title: data.files[0].name}},
          async: false,
          success: function(data) {
            form.find('input[name=key]').val(data.key)
            form.find('input[name=policy]').val(data.policy)
            form.find('input[name=signature]').val(data.signature)
          }
        })
        data.submit();
      },
      send: function(e, data) {
        $('.progress').fadeIn();
      },
      progress: function(e, data){
        var percent = Math.round((e.loaded / e.total) * 100)
        var progress_bar = '.progress' + ' #' + food_type
        $(progress_bar).css('width', percent + '%')
      },
      fail: function(e, data) {
        console.log('fail')
      },
			success: function(data) {
				var url = decodeURIComponent($(data).find('Location').text())
				$(food_type_string).val(url)
			},
			done: function (event, data) {
				if (progress_type === food_type) {
					var b = '.progress' + '#' + progress_type
					$(b).fadeOut(1500, function() {
						$('.bar').css('width', 0)
						$('#file_input').hide()
						var	c        = $(food_type_string).val()
						var d        = '.image-field-' + food_type
						$(d).append(
							"<p id      = 'name'>" + data.files[0].name + "</p>" +
							"<img style = 'height: 400px; width: 450px; left: 200px' src=" + c + ">"
						)

						$('#drag-area, #direct-upload-button').hide()
						var e = '.image-field-' + food_type + ' #name'
						$(e).fadeOut(1500)
					})
				}
			}
    })
  })
})
