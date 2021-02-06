/**
 * 
 */


function LoadingWithMask(gif) {
    //화면의 높이와 너비를 구합니다.
    var maskHeight = $(document).height();
    var maskWidth  = window.document.body.clientWidth;
     
    //화면에 출력할 마스크를 설정해줍니다.
    var loadingImg ='';
      
    loadingImg +=" <div id='loadingImg'><img src='http://192.168.42.46/CFMS/images/Spinner-1s-200px.gif'></div>";
    var mask ="<div id='mask'></div>";
  
    //화면에 레이어 추가
    $('body').append(loadingImg)
    
    $('body').append(mask)
        
    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다.
    $('#mask').css({
            'width' : maskWidth
            ,'height': maskHeight
            ,'opacity' :'0.3'
    });
  
    //마스크 표시
    $('#loadingImg').show();
  
    $('#mask').show();  
    //로딩중 이미지 표시
}

function closeLoadingWithMask() {
    $('#mask').hide();
    $('#loadingImg').hide();
    $('#mask').remove();
    $('#loadingImg').remove();  
}




