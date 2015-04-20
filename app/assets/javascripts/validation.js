$(function () {
  $('.ui.form').form({
    gender: {
      identifier  : 'amount',
      rules: [
        {
          type   : 'empty',
          prompt : 'Please enter an amount'
        }
      ]
    },
    name: {
      identifier  : 'date',
      rules: [
        {
          type   : 'empty',
          prompt : 'Please enter a date'
        }
      ]
    },
  });
});
