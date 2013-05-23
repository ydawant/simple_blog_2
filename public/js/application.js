$(document).ready(function() {
  $(".delete_button").submit(function(e) {
    if(confirm("Click OK to delete") != true) {
      e.preventDefault();
    }
  });
});
