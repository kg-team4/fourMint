const circle = document.querySelectorAll('.circle');
const slide = document.querySelector('.slideImg');
const slide_li = document.querySelectorAll('.jsSlide');
const heart = document.querySelectorAll('.fa-heart');
const modal = document.querySelector('.modal');
const modalImg = document.querySelector('.modalImg'); 

//Dot_slide
function dotSlide(n){
    const slideWidth = slide_li[0].clientWidth;
    slide.style.transition = `1s`;

    slide.style.transform = `translate3d(-${n*slideWidth}px, 0px, 0px`;
}

//Auto_slide
window.onload = function autoSlide(){
    let i = 0;
    
    setInterval(() => {
        const slideWidth = slide_li[0].clientWidth;
        slide.style.transition = `1s`;
        slide.style.transform = `translate3d(-${slideWidth*i}px, 0px, 0px`;
        i++;

        if(i === 4){
            i = 0;
        }
    }, 6000);
}

//Best

function handleModal(n){
    //clickColor
    let boolean = heart[n].classList.toggle('clickHeart');

    //modal
    if(boolean === true){
        modalImg.setAttribute('src', `img/best${[n+1]}.png`);
        modal.style.display = 'block';

        setTimeout(() => {
            modal.style.display = 'none';
        }, 10000)
    }
}

//top
function handleTop(){
    window.scroll({top:0, behavior:'smooth'});
}