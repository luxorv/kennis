$(document).ready(function(){
  var editor = ace.edit("editor");
    editor.setOptions({
      autoScrollEditorIntoView: true,
      theme: "ace/theme/monokai",
      showPrintMargin: false,
      mode: "ace/mode/c_cpp"
    });
  
  $('#code-submit').click(function(){
    
    console.log(editor.getValue());
   
    //$.post("/tutorials/execute_code",{code: editor.getValue()},function(data){alert(data)});
    //$.get("/tutorials/execute_code", function( data ) {alert(data ); });
    var imput = $('#input').val();
    $.ajax({
      type: "GET",
      url: "/tutorials/executecode",
      data: {code: editor.getValue(), input: imput },
      //dataType: "text",
      //success: function(response){alert(response); } 
    });
  });
});
