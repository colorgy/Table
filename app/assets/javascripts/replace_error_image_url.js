function replaceErrorImageUrl(){
  $('img').error(function(){
    $(this).attr('src', 'https://placehold.it/500x500');
  })
  $('img').each(function(){
    if( $(this).attr('src') == ''){
      $(this).attr('src', 'https://placehold.it/500x500');
    }
  })
}
replaceErrorImageUrl();
