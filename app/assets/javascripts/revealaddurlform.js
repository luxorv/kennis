dialog = $( "#dialog-form" ).dialog({
  autoOpen: false,
  height: 300,
  width: 350,
  modal: true,
  buttons: {
    //"Create an account": alert("me pasate,
    Cancel: function() {
    dialog.dialog( "close" );
      }
    },
    close: function() {
    form[0].reset();
      allFields.removeClass( "ui-state-error" );
    }
});
$(document).ready(function() {
document.getElementById('addtutorial').addEventListener("click", function() {document.write("carajo")});});
