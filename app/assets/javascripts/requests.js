// Search form.
$(function(){
  $('#requests_search input').keyup(function () {
    $.get($('#requests_search').attr('action'), 
      $('#requests_search').serialize(), null, 'script');
    return false;
  });

  $('#requests_search select').change(function () {
    $.get($('#requests_search').attr('action'), 
      $('#requests_search').serialize(), null, 'script');
    return false;
  });
});
