//= require jquery-ui/draggable

$(function () {
  // Append the draggable widget to all the img objects
  $("img").draggable({
    containment: "#board",

    // Capture the "stop drag" event
    stop:function (event, ui) {
 
      // Generate the img object with the new coordinates.
      var img = {
        "top":$(this).position().top.toString(),
        "left":$(this).position().left.toString()
      };

      // Update border color to green
      $(this).removeClass("green orange red").addClass("green")

      $.ajax({
        context: this,
        type:"POST",
        url:"/users/" + $(this).attr('id') + "/moods",
        data:JSON.stringify(img),
        contentType:'application/json',
        dataType:'json',
 
        // In case that an error happens, capture it and show the details.
        error:function (xhr, msg, error) {
          alert(msg + ": " + error);
        }
      })
    }
  });
});