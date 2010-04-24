$(document).ready(function(){
  $('.lesson').click(function(){
    lesson = $(this)

    if(lesson.hasClass('waiting') or lesson.hasClass('booked')) {
      return true;
    }

    lesson.addClass('waiting');

    if (lesson.hasClass('available')) {
      id = lesson.attr('data-id');
      $.ajax({
        type: 'DELETE',
        url: '/time_slots/' + id,
        data: {nothing: true},
        success: function() {
          lesson
            .removeAttr('id')
            .removeClass('waiting')
            .removeClass('available')
        }
      });
    } else {
      begins_at = lesson.attr('data-begins_at');
      $.post('/time_slots/', {time_slot: {begins_at: begins_at}}, function(response) {
        lesson
          .attr('data-id', response['id'])
          .removeClass('waiting')
          .addClass('available');

      });
    }
  });
});
