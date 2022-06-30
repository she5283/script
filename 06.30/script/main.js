const init = () => {
  // html 화면은 조립한다
  // $.load는 html을 읽어와 화면을 조립하기 위한 ajax 함수
  // ajax에는 CORS정책이 적용된다
  //    즉 ajax를 요청하는 주소와 응답하는 주소가 일치해야 한다
  //     www.naver.com에서 ad.naver.com로 ajax를 보내면 거부한다
  $('header').load('/06.30/fragment/header.html');
  $('nav').load('/06.30/fragment/nav.html')
  $('aside').load('/06.30/fragment/aside.html')
  $('footer').load('/06.30/fragment/footer.html')
}