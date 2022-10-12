/**
 * url: login.jsp
 */
let id = $('#id');
let pwd = $('#pwd');
let btn = $('#btn');
/* 버튼이벤트 클릭했을때 id의 자식객체 label에 class="warning"을 추가해주기 */
$(btn).on('click', function() {
	if ($(id).val() == "") {
		$(id).next('label').addClass('warning');

		/* 1.5초 초과시 추가해준 warning클래스 삭제 */
		setTimeout(function() {
			$('label').removeClass('warning');
		}, 1500);

	} else if ($(pwd).val() == "") {
		$(pwd).next('label').addClass('warning');

		setTimeout(function() {
			$('label').removeClass('warning');
		}, 1500);
	}
});