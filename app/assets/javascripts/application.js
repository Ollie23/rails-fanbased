//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require cable


$('.tab').on('click', function(){
  var target = $(this).data('target');
  $('.tab-content').addClass('hidden');
  $(target).removeClass('hidden');
  $('.tab').removeClass('active');
  $(this).addClass('active')
})
