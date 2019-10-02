getCommentsList();
	/* 댓글 등록하기 - ajax */
	$('#commentsWrite').click(function() {
		var writer = $('#writer').val();
		var contents = $('#commentsContents').val();
		var num = '${dto.anum}';
		if('${member.nickname}' == ''){
			alert('로그인이 필요한 서비스입니다.');
		}else {
			if(contents == ''){
				alert('내용을 입력해주세요');
			} else {
				$.ajax({
					type:'POST',
					url:'./commentsWrite',
					data:{
						writer:writer,
						contents:contents,
						num:num
					},
					success:function(data){
		
						if(data == '1'){
							getCommentsList();
							$('#commentsContents').val('');
						} else {
							alert('다시 작성해주세요');
						}
					},
					error:function(data){
						console.log(data);
					}
				});
			}
		}
	});
	
	$('.update').click(function() {
		var num = $(this).attr('class');
	 });
	 
	
	function getCommentsList(){
		$.ajax({
			type:'GET',
			url:'./commentsList',
			data:{
				num:'${dto.anum}'
			},
			success:function(data){
				data = data.trim();    	
				$('#commentsList').html(data);
					
			}
		});
	}
	
	/* 글 삭제 */
	$('#delete').click(function() {
		var check = confirm('삭제하시겠습니까?');		
		if(check){
			$('#deleteFrm').submit();
		}
	});
	
	/* 글 수정 */
	$('#update').click(function() {
		var board = $(this).attr('class');
		var num = $('.anum').attr('id');
		location.href="./${board}Update?anum="+num;
	
		
	});
	
	/* 첨부파일 다운로드 */
	$('.down').click(function() {
		var fname=$(this).attr('title');
		var oname=$(this).val();
		$('#fname').val(fname);
		$('#oname').val(oname);
		$('#downForm').submit();
	});
	
	/* 목록 */
	$('#list').click(function() {
		var list = "";
		var board = $(this).attr('title');
		var num = $(this).attr('class');
		if(board == 'after'){
			list = "../festi/festiSelect?num=${dto.num}";		
		} else if (board == 'notice'||'qna'){
			list = "./"+board+"List";
		}
		location.href = list;
	});