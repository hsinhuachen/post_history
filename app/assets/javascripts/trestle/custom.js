// This file may be used for providing additional customizations to the Trestle
// admin. It will be automatically included within all admin pages.
//
// For organizational purposes, you may wish to define your customizations
// within individual partials and `require` them here.
//
//  e.g. //= require "trestle/custom/my_custom_js"
//= require froala_editor.min.js

//= require plugins/align.min.js
//= require plugins/char_counter.min.js
//= require plugins/code_beautifier.min.js
//= require plugins/code_view.min.js
//= require plugins/colors.min.js
//= require plugins/emoticons.min.js
//= require plugins/entities.min.js
//= require plugins/file.min.js
//= require plugins/font_family.min.js
//= require plugins/font_size.min.js
//= require plugins/fullscreen.min.js
//= require plugins/help.min.js
//= require plugins/image.min.js
//= require plugins/image_manager.min.js
//= require plugins/inline_class.min.js
//= require plugins/inline_style.min.js
//= require plugins/line_breaker.min.js
//= require plugins/line_height.min.js
//= require plugins/link.min.js
//= require plugins/lists.min.js
//= require plugins/paragraph_format.min.js
//= require plugins/paragraph_style.min.js
//= require plugins/print.min.js
//= require plugins/quick_insert.min.js
//= require plugins/quote.min.js
//= require plugins/save.min.js
//= require plugins/table.min.js
//= require plugins/special_characters.min.js
//= require plugins/url.min.js
//= require plugins/video.min.js

$(document).on('turbolinks:load', function() {
	$('#editor').froalaEditor({
		inlineMode: false,
		heightMin: '200px',
		imageUploadParam: 'image',
		imageUploadURL: '/upload_image',
		imageUploadMethod: 'POST',
		imageMaxSize: 2 * 1024 * 1024,
		imageInsertButtons: ['imageBack', '|', 'imageUpload', 'imageByURL'],
		imageDefaultAlign: null,
		imageDefaultDisplay: null,
		imageDefaultWidth: null
		// toolbarButtons: ['bold', 'italic', 'underline'],
	})
})
