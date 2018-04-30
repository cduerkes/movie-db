$(document).ready(function () {

  $("#hearts > span").hover(function() {
    $(this).prevAll().addClass('purple').removeClass('grey')
    $(this).addClass('purple').removeClass('grey')
    $(this).nextAll().addClass('grey').removeClass('purple')

    var rating = $(this).data( "rating" );
    console.log(rating);
  });

});