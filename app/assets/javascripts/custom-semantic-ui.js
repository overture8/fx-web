$(function () {
  $('.currency-from.dropdown')
    .dropdown('setting', 'transition', 'vertical flip')
    .dropdown('set selected', 'USD')
    .popup('setting', 'content', 'Select From Currency');

  $('.currency-to.dropdown')
    .dropdown('setting', 'transition', 'vertical flip')
    .dropdown('set selected', 'USD')
    .popup('setting', 'content', 'Select To Currency');

  $('.message .close').on('click', function() {
    $(this).closest('.message').fadeOut();
  });
});
