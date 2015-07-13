// toast messages adopter
//
// API: toast.info(message, actions, title);
//            ^
//            can be info, success, error or warning
//
// The "actions" parameter can be a string of HTML, or an array containing
// title and callbacks like this:
//
//   cancelCallback = function() { alert('Canceled!'); };
//   showDetailsCancelCallback = function() { alert('Canceled!'); };
//   [['Cancel', function() { alert('Canceled!'); }], ['Details', function() { alert('Yo!'); }]]
//
//= require ../lib/toastr

toast = {};

toast.count = 0;
toast.onShown = function() {
  toast.count++;
  var $toast = toast.hideFirstToast();
  setTimeout(function() {
    $toast.css({
      'margin-top': '0',
      '-moz-transition-property': 'margin, margin-top',
      '-o-transition-property': 'margin, margin-top',
      '-webkit-transition-property': 'margin, margin-top',
      'transition-property': 'margin, margin-top',
      '-moz-transition-duration': '0.3s',
      '-o-transition-duration': '0.3s',
      '-webkit-transition-duration': '0.3s',
      'transition-duration': '0.3s'
    });
  }, 10);
};

toast.hideFirstToast = function() {
  var $target = $('#toast-container .toast:first-of-type');
  var tHight = $target.outerHeight(true);
  $target.css({
    'margin-top': '-' + (tHight) + 'px',
    '-moz-transition-property': 'none',
    '-o-transition-property': 'none',
    '-webkit-transition-property': 'none',
    'transition-property': 'none',
    '-moz-transition-duration': '0',
    '-o-transition-duration': '0',
    '-webkit-transition-duration': '0',
    'transition-duration': '0'
  });
  return $target;
};

toastr.options = {
  "closeButton": false,
  "debug": false,
  "newestOnTop": true,
  "progressBar": false,
  "positionClass": "toast-top-center",
  "preventDuplicates": false,
  "onclick": null,
  "showDuration": 0,
  "hideDuration": 1000,
  "timeOut": 5000,
  "extendedTimeOut": 800,
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut",
  "onShown": toast.onShown
};

toast.info = function(message, actions, title) {
  toastr.info(message, title, { 'actions': actions });
};

toast.notice = toast.info;

toast.success = function(message, actions, title) {
  toastr.success(message, title, { 'actions': actions });
};

toast.error = function(message, actions, title) {
  toastr.error(message, title, { 'actions': actions });
};

toast.warning = function(message, actions, title) {
  toastr.warning(message, title, { 'actions': actions });
};

toast.alert = toast.warning;

window.toast = toast;

// Alias
window.flash = toast;
