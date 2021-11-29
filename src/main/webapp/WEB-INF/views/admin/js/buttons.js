const circle = document.querySelectorAll('.circle');
const slide = document.querySelectorAll('.slideImg');
const slide_li = document.querySelectorAll('.jsSlide');

//Dot_slide
function dotSlide(n){
    const slideWidth = slide_li[0].clientWidth;
    slide[0].style.transition = `1s`;
    slide[0].style.transform = `translate3d(-${n*slideWidth}px, 0px, 0px)`;
}

function dotSlide1(n){
	const slideWidth1 = slide_li[1].clientWidth;
    slide[1].style.transition = `1s`;
    slide[1].style.transform = `translate3d(-${n*slideWidth1}px, 0px, 0px)`;
}

//Auto_slide
window.onload = function autoSlide(){
    let i = 0;
	let j = 0;
    
    setInterval(() => {
        const slideWidth = slide_li[0].clientWidth;
        slide[0].style.transition = `1s`;
        slide[0].style.transform = `translate3d(-${slideWidth*i}px, 0px, 0px)`;
        i++;

        if(i === 4){
            i = 0;
        }

		const slideWidth1 = slide_li[1].clientWidth;
        slide[1].style.transition = `1s`;
        slide[1].style.transform = `translate3d(-${slideWidth1*j}px, 0px, 0px)`;
        j++;

        if(j === 4){
            j = 0;
        }

    }, 6000);
}

//top
function handleTop(){
    window.scroll({top:0, behavior:'smooth'});
}