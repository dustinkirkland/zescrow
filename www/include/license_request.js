$(document).ready(function(){
	$("#warning_acknowledge_event").bind("click", function(){
		if($("#warning_fieldset").css("visibility") == 'none'){
			$("#warning_fieldset").hide();
			$("#warning_fieldset").css("visibility", "visible");
			$("#warning_fieldset").fadeIn('slow');
		}else{
			$("#warning_fieldset").toggle('slow');
		}
	});
});