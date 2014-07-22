$(document).ready(function(){
  $('.tutorial-section').click(function() {
    $('.content',this).toggle('slow');
    });

  $('#editor-button').toggle(function() {
      $('.tutorial-section').animate({
          width: '-=800px'
      });
      $('#todo-editor').animate({
          width: '+=800px'
      });
  },function(){
      $('.tutorial-section').animate({
          width: '+=800px'
      });
      $('#todo-editor').animate({
          width: '-=800px'
      });
  });
});
