// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .
//= require dropzone



var id;
var setHeight = function(ll, list) {
  for (var i = 0; i < ll; i++) {
    var item = $(list.children()[i]);
    var dasHeight = $(item.children()[0]).height()
    item.height(dasHeight);
  }
}

$(function(){ $(document).foundation();
  id = $(document.getElementById('procedureid')).data('procedure-id')
  var listLength = $(document.getElementById('stage-sort')).children().length;
  var list = $(document.getElementById('stage-sort'));
  setHeight(listLength,list);
});


$(function() {
   $( "#stage-sort" ).sortable( {
     accept: ".stage-option",
     axis: "y",
     placeholder: "highlight",
     connectWith: "#stage-sort",
     start: function(e, ui){
       ui.item.height($(ui.item.context.childNodes[1]).outerHeight());
       ui.placeholder.height($(ui.item.context.childNodes[1]).outerHeight());
     },

     update: function(event, ui) {
       var stageOrder = $(this).sortable('toArray');
       $.ajax({
         method: 'POST',
         url: "/levels/update",
         data: {stages: stageOrder, procedure_id: id}
       });

       for (var i = 0; i < stageOrder.length; i++) {
        var stage = $(document.getElementById('stage-' + stageOrder[i]));
        stage.text('Step #' + (i+1));
      }
    },
    receive: function( event, ui ) {

    }
   });

   $( "#stage-options-box" ).sortable( {
     connectWith: "#stage-sort",
   });

   $( ".stage-option" ).draggable({
     connectToSortable: "#stage-sort"
  });
});

$(function() {
  $('.dropzone').on("addedfile", function(file){
    event.preventDefault();
    var request = $.ajax({
      method: 'POST',
      url: "/uploads/update",
      data: {document_file: file}
    });
    request.done(function(response) {
      console.log('hi!');
      var icon_holder = $(document).getElementById('icon-' + response.id);
      icon_holder.text("<%=image_tag('" + response.icon.icon_img + "', height: 60, width: 60)%>");
    });
    request.error(function(response) {
      console.log('error!');
      var icon_holder = $(document).getElementById('icon-' + response.id);
      icon_holder.text("<%=image_tag('" + response.icon.icon_img + "', height: 60, width: 60)%>");
    });
  });
})
