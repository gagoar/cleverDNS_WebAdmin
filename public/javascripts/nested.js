replace_ids = function(s){
  var new_id = new Date().getTime();
  return s.replace(/NEW_RECORD/g, new_id);
}

$(function () {
  $('.remove').live('click', function() {
      el = $(this)
      target = el.attr('href').replace(/.*#/, '.')
      $(this).parent().hide();
      $(this).parent().find("select").remove();
      if(hidden_input = $(this).parent().find("input[id$=_delete]")) hidden_input.val('1')
    });

  $('.add_nested_item').live('click', function(){
      el = $(this);
      template = eval(el.attr('href').replace(/.*#/, ''))
      $(el.attr('rel')).append(replace_ids(template));
    });
});  
