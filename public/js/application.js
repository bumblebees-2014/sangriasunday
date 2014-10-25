$(document).ready(function () {
  loginButton()
  viewPastSunday()
  viewUpcomingSunday()
});


function loginButton() {
  $('#login-button').on('click', function(){
    var data = '<div class="login popup"><div class="splash-featurette"><h2>Login</h2><form action="/login" method="post"><p>Email:</p><input name="email"><p>Password:</p><input name="password" type="password"><p></p><input type="submit" value="submit"></form></div><button class="close">close</button></div>'
    $('body').prepend(data)
    closePopup()
  })
}


function viewUpcomingSunday() {
  $('.view-upcoming-sunday').on('click', function(){
    $('.popup').remove()
    $.ajax({
      url: '/sangria_sundays/' + $(this).attr('data-sundayId') + '/attend',
      type: 'GET'
    }).done(function(data) {
      console.log("success");
      $('body').prepend(data)
      closePopup()
      attendSunday()
      leaveSunday()
      showBringSomething()
    })
  })
}

viewPastSunday = function() {
  $('.view-past-sunday').on('click', function(){
    $('.popup').remove()
    $.ajax({
      url: '/sangria_sundays/' + $(this).attr('data-sundayId'),
    }).done(function(data) {
      $('body').prepend(data)
      closePopup()
    })
  })
}

attendSunday = function() {
  $('.i-am-going').on('click', function(){
    $.ajax({
      url: '/sangria_sundays/' + $('.popup').attr('data-sundayId')+ '/attend',
      type: 'POST'
    }).done(function(data) {
      console.log('success');
      $('.popup').remove()
      $('body').prepend(data)
      showBringSomething()
      leaveSunday()
    })
  })
}

leaveSunday = function() {
    $('.change-your-mind').on('click', function(){
    $.ajax({
      url: '/sangria_sundays/' + $('.popup').attr('data-sundayId')+ '/leave',
      type: 'POST'
    }).done(function(data) {
      console.log('success');
      $('.popup').remove()
      $('body').prepend(data)
      attendSunday()
    })
  })
}

showBringSomething = function() {
  $('.show-bring-something').on('click', function(){
    console.log('!!!')
    $('.bring-something-container').html("<form class='bring-something'><h3>Your Dish</h3><p>Title:</p><p><input name='title'></p><p>Recipe:</p><p><input name='recipe'></p><p>Course:</p><p><input name='course'></p><p><input type='submit' value='bring it!'></p></form>")
  })
  submitBringSomething()
}

submitBringSomething = function() {
  $('.bring-something').on('submit', function(e){
    e.preventDefault()
    $.ajax({
      url: '/sangria_sundays/' + $('.popup').attr('data-sundayId')+ '/bring',
      type: 'POST',
      data: $('bring-something').serialize()
    })
    .success(function() {
      console.log("success");
      $('.popup').remove()
      $('body').prepend(data)
      attendSunday()
    })


  })
}


closePopup = function() {
  $('.close').on('click', function(){
    $('.popup').remove()
  })
  $(document).keyup(function(e) {
    if(e.keyCode== 27) {
        $('.popup').remove()
    }
  });
}
