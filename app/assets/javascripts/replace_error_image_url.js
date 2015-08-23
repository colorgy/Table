function replaceErrorImageUrl(){
  var image_url = 'https://placehold.it/500x500';
  $('img').error(function(){
    $(this).attr('src', image_url);
  });
  $('img').each(function(){
    if( $(this).attr('src') == ''){
      $(this).attr('src', image_url);
    }
  });
}
replaceErrorImageUrl();
