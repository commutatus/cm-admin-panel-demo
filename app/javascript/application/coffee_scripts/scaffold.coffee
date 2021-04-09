$(document).on "turbolinks:load", () ->
  $('#user_id').select2();

$(document).on "turbolinks:load", () ->
  $('.filter-rangepicker').daterangepicker()

$(document).on "turbolinks:load", () ->
  $('.rangepicker').daterangepicker()

$(document).on "turbolinks:load", () ->
  $(".single-select").select2({
    placeholder: "Select a state",
    allowClear: true
  });
  
$(document).on "turbolinks:load", () ->
  $(".multi-select").select2();

$(document).on 'change', '[data-behaviour="upload-image"]', () ->
  file_path_array = $(this).val().split('\\')
  file_name = file_path_array[file_path_array.length - 1]
  if $(this).val() != ""
    $('[data-behaviour="upload-title"]').text(file_name.substring(0,50) + '...')
    $('.upload-icon').addClass('hidden')
  else
    $('[data-behaviour="upload-title"]').text('Upload')
    $('.upload-icon').removeClass('hidden')

$(document).on 'change', '[data-behaviour="upload-file"]', () ->
  file_path_array = $(this).val().split('\\')
  file_name = file_path_array[file_path_array.length - 1]
  file_ext = file_name.substring(file_name.lastIndexOf('.') + 1)
  if file_name.length > 20
    file_name = file_name.substring(0, 15)+'...' + file_ext
  if $(this).val() != ""
    $('[data-behaviour="uploaded-file-name"]').text(file_name)
    if file_name.length > 20
      $('[data-behaviour="uploaded-file-name"]').tooltip({title: file_path_array[file_path_array.length - 1]})
      $('[data-behaviour="uploaded-file-name"]').tooltip()
    else 
      $('[data-behaviour="uploaded-file-name"]').tooltip('hide')
  else
    $('[data-behaviour="uploaded-file-name"]').text('')

$(document).on 'click', '.profile-avatar', (e) ->
  e.stopPropagation();
  if $('.auth-popup').hasClass('hidden')
    $('.auth-popup').removeClass('hidden')
  else
    $('.auth-popup').addClass('hidden')

$(document).on 'click', '.profile-name', (e) ->
  e.stopPropagation();
  if $('.profile-popup').hasClass('hidden')
    $('.profile-popup').removeClass('hidden')
  else
    $('.profile-popup').addClass('hidden')

$(document).on 'click', '.export-container', (e) ->
  e.stopPropagation();
  if $('.export-popup').hasClass('hidden')
    $('.export-popup').removeClass('hidden')
  else
    $('.export-popup').addClass('hidden')


$(document).click (e) ->
  if $(e.target).parents('.auth-popup').length == 0 
    $('.auth-popup').addClass('hidden')

$(document).on 'click', '.auth-popup', (e) ->
  e.stopPropagation();
  