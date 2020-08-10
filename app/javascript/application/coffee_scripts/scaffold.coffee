$(document).on "turbolinks:load", () ->
  $('#user_id').select2();

$(document).on "turbolinks:load", () ->
  $('.filter-rangepicker').daterangepicker()

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

$(document).on 'click', '.profile-avatar', (e) ->
  e.stopPropagation();
  if $('.auth-popup').hasClass('hidden')
    $('.auth-popup').removeClass('hidden')
  else
    $('.auth-popup').addClass('hidden')

$(document).click (e) ->
  if $(e.target).parents('.auth-popup').length == 0 
    $('.auth-popup').addClass('hidden')

$(document).on 'click', '.auth-popup', (e) ->
  e.stopPropagation();
  