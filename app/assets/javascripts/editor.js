$(window).load(function(){
  var editor = ace.edit("editor");
    editor.setOptions({
      autoScrollEditorIntoView: true,
      theme: "ace/theme/monokai",
      showPrintMargin: false,
      mode: "ace/mode/c_cpp"
    });

  $('#lang').change(function(){
    editor.getSession().setMode("ace/mode/"+$('#lang').val());
  });

  $('#code-submit').click(function(){
    var imput = $('#input').val();
    $.ajax({
      type: "GET",
      url: "/tutorials/executecode",
      data: {code: editor.getValue(), input: imput, language: $('#lang').val()},
      //dataType: "text",
      //success: function(response){alert(response); }
    });
  });
});
