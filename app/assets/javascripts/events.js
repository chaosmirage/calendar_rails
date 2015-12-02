$(".js-event-delete").click( function() {
  var current_event_tr = $(this).parents('tr')[0];

  if (confirm("Точно удалить событие?")) {
    $.ajax({
      url: '/events/' + $(current_event_tr).attr('data_event_id'),
      type: 'POST',
      data: {_method: 'DELETE'},
      success: function(result){
        console.log(result);
        $(current_event_tr).fadeOut(200);
      }
    });
  };
});
