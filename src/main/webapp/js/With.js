$(document).ready(function() {
		$('.deletelink').click(function() {
			if (confirm('確定刪除此筆紀錄? ')) {
				var href = $(this).attr('href');
				$('form').attr('action', href).submit();
			}
			return false;

		});
	});