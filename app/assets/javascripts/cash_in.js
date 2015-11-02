$(".tab-cash-in").click(function() {
  if($(this).attr("id") == "user-zhao") {
    $("#cash_in_user_type").val('UserZhao');
  } else if($(this).attr("id") == "user-song") {
    $("#cash_in_user_type").val('UserSong');
  } else {
    alert('wrong choice');
  }
})
