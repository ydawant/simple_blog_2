$(document).ready(function() {
  $(".delete").submit(function(e) {
    if(confirm("Click OK to delete") != true) {
      e.preventDefault();
    }
  });
  $(".find_tag").submit(function(e){


  });
});
