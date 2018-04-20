<<<<<<< HEAD

$(document).ready(function($) {
	setTimeout(function() {
	   $('#spinner-omnitours').fadeOut().remove();
	   $('#content-ready').fadeIn().removeClass('hidden');
	}, 1000);;
=======
$('#header, #content-data, #footer').hide('fast');
$('#spinner-omnitours').show();
$(document).ready(function($) {

setTimeout(function() {
		$('#spinner-omnitours').fadeOut().remove();
		$('#header, #content-data, #footer').fadeIn().show();
}, 3000);;
>>>>>>> 456e9aa0f9d9b69cdde9df3c87851d5e181340ae


});

