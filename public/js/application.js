$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $("#index-container").on("mouseenter mouseleave", ".author", function(event){
    // console.log($(this));
    $author = $(this);
    $author.toggleClass("hover");
  })
  $('#create-poem-link').on('click', function(event){
    event.preventDefault();
    // console.log("bound");
    // console.log($(this));
    var $link = $(this);
    // console.log($link);
    var url = $link.attr("href");
    // console.log(url);
    var $request = $.ajax({
      url: url
    })
    $request.done(function(response){
      // console.log(response);
      $link.closest("#new-poem-form-section").append(response);
      $link.hide();
    })
  })

  $("#new-poem-form-section").on("submit", ".new-poem-form", function(event){
    event.preventDefault();
    // console.log("bound");
    var $form = $(this);
    // console.log($form);
    var url = $form.attr("action");
    var method = $form.attr("method");
    var data = $form.serialize();
    // console.log(data);
    $request = $.ajax({
      url: url,
      method: method,
      data: data
    })
    $request.done(function(response){
      // console.log(response);
      $(".index-container").append('<li>' + response);
      $("#create-poem-link").show();
      $(".new-poem-form").remove();
    })
  })
});
