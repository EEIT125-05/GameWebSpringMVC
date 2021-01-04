//$(document).ready(function() {
//		$('.deletelink').click(function() {
//			if (confirm('確定刪除此筆紀錄? ')) {
//				var href = $(this).attr('href');
//				$('form').attr('action', href).submit();
//			}
//			return false;
//
//		});
//	});
	
$(document).ready(function() {
		$('.deletelink').click(function() {
			swal({
				title:"確定刪除此筆紀錄?",
				icon:"warning",
				bottons:true,
				dangerMode:true
			});
//			if (confirm('確定刪除此筆紀錄? ')) {
//				var href = $(this).attr('href');
//				$('form').attr('action', href).submit();
//			}
			return false;

		
	});
	});
	
	