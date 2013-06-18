$(function() {
    $("#start_date").datepicker({
        //numberOfMonths: 2,
        onSelect: function(selected) {
          $("#end_date").datepicker("option","minDate", selected)
        }
    });
    $("#end_date").datepicker({ 
        //numberOfMonths: 2,
        onSelect: function(selected) {
           $("#start_date").datepicker("option","maxDate", selected)
        }
    });
    
	var checkstate = 'all';
	$(".check_all").change(function() {
		if ($(this).val() == "check") {
			$('.cbox').prop('checked',true);
		} else {
			$('.cbox').removeAttr('checked');
		}
	});

	$(".cbox").change(function() {
		$('.check_all').prop('checked',false);
	});

	$("#lookup").select2({
        placeholder: "Search Calendar",
        allowClear: true,
		data:[
			{id:0,text:'enhancement'},{id:1,text:'bug'},
			{id:2,text:'duplicate'},
			{id:3,text:'invalid'},{id:4,text:'wontfix'}
		]
    });	
	
});
