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

    function validate() {
      if (hiddenRating < 1 || hiddenRating > 5) {
          alert("Please enter a rating.");
          return;
      }
    }

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
      success: function(data){
        // add reviews to show page
        $('#reviews').append("<li>" + review.comment + "</li>");
      },
      error: function(data){
        $('#reviews').append("<li>" + review.comment + "</li>");// required due to error possibly involving rails response format
        $('#review-comment').val(''); 
      }
    });
  });
});