
google.load("jquery", "1.4.2");

google.load("jqueryui", "1.8.1");

var uservoiceOptions = {
  /* required */
  key: 'rvm',
  host: 'rvm.uservoice.com',
  forum: '59385',
  showTab: true,
  /* optional */
  alignment: 'left',
  background_color:'#f00',
  text_color: 'white',
  hover_color: '#06C',
  lang: 'en'
};

function _loadUserVoice() {
  var s = document.createElement('script');
  s.setAttribute('type', 'text/javascript');
  s.setAttribute('src', ("https:" == document.location.protocol ? "https://" : "http://") + "cdn.uservoice.com/javascripts/widgets/tab.js");
  document.getElementsByTagName('head')[0].appendChild(s);
}

_loadSuper = window.onload;

window.onload = (typeof window.onload != 'function') ? _loadUserVoice : function() { _loadSuper(); _loadUserVoice(); };

