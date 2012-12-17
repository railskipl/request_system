function remove_fields(link) {
  $(link).previous("input[type=hidden]").value = "1";
  $(link).up(".fields").hide();
}

function add_fields(link, association, content) {
   if(jQuery(".fields :file").length < 5) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  jQuery(link).up().insert({
    before: content.replace(regexp, new_id)
  });
}
}