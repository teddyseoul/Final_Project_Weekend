/* 오른쪽 작은 컨테이너 움직임 조절*/
$(document).ready(function() {
	var bodyOffset = jQuery('body').offset();
	$(window).scroll(function() {
		if (jQuery(document).scrollTop() > bodyOffset.top+400) {
			jQuery('#wingright').addClass('right_suv');
		} else {
			jQuery('#wingright').removeClass('right_suv');
		}
	});
	
});

/* 티켓 오픈 */
$(document).ready(function(){
	$('.tm5').mouseover(function(){
		$('.first1 img').attr('src','./resources/images/home/청춘페스티벌.gif');
	});
	$('.tm4').mouseover(function(){
		$('.first1 img').attr('src','./resources/images/home/워라벨왕산비치.jpg');
	});
	$('.tm3').mouseover(function(){
		$('.first1 img').attr('src','./resources/images/home/아시아뮤직페스티벌.jpg');
	});
	$('.tm2').mouseover(function(){
		$('.first1 img').attr('src','./resources/images/home/냉이축제.jpg');
	});
	$('.tm1').mouseover(function(){
		$('.first1 img').attr('src','./resources/images/home/신촌물총축제.jpg');
	});
});

/* 축제 랭크 */
$(document).ready(function(){
	
	
	$('.rankingItem1').mouseover(function(){
		var img11 = $('#fname1').val();
		$('.first2 img').attr('src','${pageContext.request.contextPath}/resources/images/board/'+img11);
	});
	$('.rankingItem2').mouseover(function(){
		var img11 = $('#fname2').val();
		$('.first2 img').attr('src','${pageContext.request.contextPath}/resources/images/board/'+img11);
	});
	$('.rankingItem3').mouseover(function(){
		var img11 = $('#fname3').val();
		$('.first2 img').attr('src','${pageContext.request.contextPath}/resources/images/board/'+img11);
	});
	$('.rankingItem4').mouseover(function(){
		var img11 = $('#fname4').val();
		$('.first2 img').attr('src','${pageContext.request.contextPath}/resources/images/board/'+img11);
	});
	$('.rankingItem5').mouseover(function(){
		var img11 = $('#fname5').val();
		$('.first2 img').attr('src','${pageContext.request.contextPath}/resources/images/board/'+img11);
	});

});

/* 공연 랭크 */
$(document).ready(function(){
	$('.ranking1').mouseover(function(){
		var img12 = $('#fname1').val();
		$('.first3 img').attr('src','${pageContext.request.contextPath}/resources/images/board/'+img12);
	});
	$('.ranking2').mouseover(function(){
		var img12 = $('#fname2').val();
		$('.first3 img').attr('src','${pageContext.request.contextPath}/resources/images/board/'+img12);
	});
	$('.ranking3').mouseover(function(){
		var img12 = $('#fname3').val();
		$('.first3 img').attr('src','${pageContext.request.contextPath}/resources/images/board/'+img12);
	});
	$('.ranking4').mouseover(function(){
		var img12 = $('#fname4').val();
		$('.first3 img').attr('src','${pageContext.request.contextPath}/resources/images/board/'+img12);
	});
	$('.ranking5').mouseover(function(){
		var img12 = $('#fname5').val();
		$('.first3 img').attr('src','${pageContext.request.contextPath}/resources/images/board/'+img12);
	});
});


/* 날씨API */
var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=Seoul+&appid=e06624cd1f1a4c3231e492d1970e4aed";
$.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function(resp) {
        console.log(resp);
        console.log("현재온도 : "+ (resp.main.temp- 273.15) );
        console.log("현재습도 : "+ resp.main.humidity);
        console.log("날씨 : "+ resp.weather[0].main );
        console.log("상세날씨설명 : "+ resp.weather[0].description );
        console.log("날씨 이미지 : "+ resp.weather[0].icon );
        console.log("바람   : "+ resp.wind.speed );
        console.log("나라   : "+ resp.sys.country );
        console.log("도시이름  : "+ resp.name );
        console.log("구름  : "+ (resp.clouds.all) +"%" );                 
	
    var imgURL = "http://openweathermap.org/img/w/"+resp.weather[0].icon+".png";
    var a = "온도: "+Math.round(resp.main.temp- 273.15);
    var b = "지역: "+resp.name;
	$("#weather").attr("src", imgURL);
	$(".a").attr("value", a);
	$(".b").attr("value", b);
    }
});
