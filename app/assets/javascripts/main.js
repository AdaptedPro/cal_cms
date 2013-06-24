$(function() {
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
