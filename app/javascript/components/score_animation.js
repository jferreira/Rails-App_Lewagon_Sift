import { easing, tween, styler } from 'popmotion';


function animate_score() {

}

const divStyler = styler(document.querySelector('.tweet'));

document.querySelector('.tweet').addEventListener('click', ()=>{

 tween({
  from: 0,
  to: { y: -5},
  duration: 500,
  yoyo: 1,
  ease: easing.backOut
}).start(divStyler.set);


});


export { animate_score };
