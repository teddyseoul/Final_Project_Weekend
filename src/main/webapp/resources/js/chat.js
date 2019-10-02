// 실시간 채팅 API
tocplusTop=1150;
tocplusLeft=50;
tocplusMinimizedImage='http://kr03.tocplus007.com/img/minimized_ko.gif';
tocplusHAlign='right'; // float: right ? left ?
tocplusWidth=180; // 상담창 크기
tocplusHeight=220;
tocplusUserName='손님'; // 유저 이름 변경
tocplusFrameColor='#00d344'; // 대화창 테마 색상
tocplusFloatingWindow=true; // 상담창 위치를 고정으로 줄 것인지 움직이게 할것인지 지정
var tocplusHost = (("https:" == document.location.protocol) ? "https://" : "http://");
document.write(unescape("%"+"3Cscript src='" + tocplusHost 
		+ "kr03.tocplus007.com/chatLoader.do?userId=kws332' type='text/javascript'"
				+"%"+"3E"+"%"+"3C/script"+"%"+"3E"));