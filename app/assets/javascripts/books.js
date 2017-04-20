$(document).ready(function(){
  $('.borrow-book').click(function(event){
    var id = event.target.id;
    var url = '/book_users';
    var data = "id="+id;
    $.post(url,data);
  });
});
