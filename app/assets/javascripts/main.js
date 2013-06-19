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


	/*	
      var canvas = document.getElementById('myCanvas');
      var context = canvas.getContext('2d');
      context.rect(0, 0, canvas.width, canvas.height);

      // add linear gradient
      var grd = context.createLinearGradient(0, 0, canvas.width, canvas.height);
      // light blue
      grd.addColorStop(0, '#8ED6FF');   
      // dark blue
      grd.addColorStop(1, '#004CB3');
      context.fillStyle = grd;
      context.fill();    
      */
});
