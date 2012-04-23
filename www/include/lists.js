var initial_text="";
$(document).ready(function(){
	$(".directory_link").each(function(){
		$(this).hide();
	});
	$(".file_link").each(function() {
		$(this).hide();
	});
	$("#root_directory").children().each(function(e){
		$(this).show();
		$(this).bind('click', expandAndActivate);
	});
	
	if($("#license_request_serial_number") == undefined){
		
	}else{
		initial_text = $("#license_request_serial_number").val();
		$("#license_request_serial_number").focus(function(){
			if($(this).val() == initial_text){
				$(this).val("");
			}
		});
	}
});

expandAndActivate = function(){
	$(this).children().each(function(e){
		$(this).show();
		if($(this).hasClass("directory_link")){
			$(this).bind('click', expandAndActivate);
		}
	});
}