// POPMOTION
import { easing, tween, styler } from 'popmotion';

// ANIMATION - SCORE ---------------------------------

const score_box = styler(document.querySelector('.article-score'));

  function animate_score() {

    if (score_box) {

      const buttons = document.getElementsByClassName("submit-score-btn");

      [...buttons].forEach( buttonList => {

        buttonList.addEventListener('click', button => {

            let direction = button.target.classList.contains("up") ? -5 : 5;

            let specs = {
              from: 0,
              to: { y: direction },
              duration: 500,
              yoyo: 1,
              ease: easing.backOut
            }

            tween(specs).start(score_box.set);

        });

      })

    }

  }
// EXPORT -----------------------------------------

export { animate_score };
