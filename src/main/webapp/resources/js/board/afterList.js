/* 각 행 선택 시 select 페이지 이동 */
$('.select').click(function() {
	var anum = $(this).children('.selectRow').attr('id');
	location.href = "./${board}Select?anum=" + anum;
});

/* board 글쓰기 이동 */
$('#boardWrite').click(function() {
	var board = $(this).val();
	location.href = "./" + board + "Write"
});

/* 테이블의 num 앞에 구분 문자 안보이게 */
$('.selectRow').each(function() {
	var num = $(this).attr('id');
	num = num.substring(1);
	$(this).children('p').append(num);
});