$(document).ready(function () {

  $("#rating > span").hover(function() {
    $(this).prevAll().addClass('purple').removeClass('grey')
    $(this).addClass('purple').removeClass('grey')
    $(this).nextAll().addClass('grey').removeClass('purple')

    var rating = $(this).data( "rating" );
    $('#hidden-cache').data("findme", rating);
  });

  $('#review-submit').on( "click", function() {

    var hiddenRating = $('#hidden-cache').data('findme');
    var url = $('#rating').data('post-url');
    var comment = $('#review-comment').val();

    var review = {
      comment: comment,
      rating: hiddenRating
    }

    $.ajax({
      type: "POST",
      url: url,
      dataType: 'json',
      data: { 
        review: review
      },
      success: function(){
        window.location.href = BASE_URL;
      },
      error: function(){

        window.location.href = BASE_URL; // required because of response rails response format
      }
    });

  });

});