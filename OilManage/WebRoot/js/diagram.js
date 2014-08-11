
$(function(){
		$('#listGUIPro_modal>.modal-dialog').css({
		 'margin-top': function () {
		            return ($(window).height())/2-178;
		        },
		 'margin-right':function () {
		            return ($(window).width())/2-50;
		        },
		});

		$('#load_modal>.modal-dialog').css({
		 'margin-top': function () {
		            return ($(window).height())/2-323;
		        },
		 'margin-right':function () {
		            return ($(window).width())/2-300;
		        },
		});
	//$('#tab-container').easytabs();			
});
function loadFill(check) {
	if (check.checked === true) {
		if ($('#colorpickerHolder3').css('display') === 'none') {
			$('#colorSelector3').click();
		}
	} else {
		if ($('#colorpickerHolder3').css('display') === 'block') {
			$('#colorSelector3').click();
		}
	}
}
function closePraList(){
	$("#pointPra").hide();
}