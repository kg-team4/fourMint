document.addEventListener('DOMContentLoaded', function(){
    setInterval(function(){
        const nextNode = document.querySelector('.wide-slide input:checked').nextElementSibling;
        if(nextNode.nodeName == 'INPUT'){
            nextNode.checked = true;
        }else{
            document.querySelector('.wide-slide input:first-child').checked = true;
        }
    },3000);

	document.querySelector(".mobile-menu").addEventListener("click", function(e){
        const checker = document.querySelector('#mobile_menu');
		if (checker.checked){
		    //페이지 스크롤 락 해제
            document.body.removeChild(document.querySelector('#dimmed'));
		} else {
		    //페이지 스크롤 락 레이어 추가
		    let div = document.createElement('div');
		    div.id = 'dimmed';
            document.body.appendChild(div);
            
            //스크롤 락 레이어 터치/클릭
            document.querySelector("#dimmed").addEventListener("click", function(){
                document.body.removeChild(document.querySelector('#dimmed'));
                document.querySelector('#mobile_menu').checked = false;
            });

			//모바일 사이드 메뉴 온 컨텐츠 스크롤 락
			const events = ["scroll","touchmove","mousewheel"];
			for(let i = 0;i < events.length;i++){
				document.querySelector('#dimmed').addEventListener(events[i], function(event){
					event.preventDefault();
					event.stopPropagation();
					return false;
				});					
			}    
		}
	});	    
});