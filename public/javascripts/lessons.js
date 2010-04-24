$(document).ready(function(){
  $('.lesson').click(function(){
    lesson = $(this).addClass('waiting');
    alert('hi')
    lesson.removeClass('waiting');
    lesson.toggleClass('available');
  });
});