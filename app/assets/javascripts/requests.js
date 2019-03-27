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

  tinyMCE.init({
    selector: '#request_description',
    menubar: false,
    plugins: [
        'advlist autolink lists link charmap print preview anchor',
        'searchreplace visualblocks code fullscreen',
        'insertdatetime media table contextmenu paste code'
    ],
    toolbar: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
  });
});
