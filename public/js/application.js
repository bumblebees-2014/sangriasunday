$(document).ready(function () {

  $('.attend').on('click', function(){
    $('.popup').remove()
    $.ajax({
      url: '/sangria_sundays/' + $(this).attr('data-sundayId') + '/attend',
    }).done(function(data) {
      console.log("success");
      console.log(data);
      $('body').prepend(data)
      closePopup()
    })
  })

  $('.view-sunday').on('click', function(){
    $('.popup').remove()
    $.ajax({
      url: '/sangria_sundays/' + $(this).attr('data-sundayId'),
    }).done(function(data) {
      console.log(data);
      $('body').prepend(data)
      closePopup()
    })
  })

});


var closePopup = function() {
  $('.close').on('click', function(){
      console.log("success");
    $('.popup').remove()
  })
  $(document).keyup(function(e) {
    if(e.keyCode== 27) {
        $('.popup').remove()
    }
  });
}

