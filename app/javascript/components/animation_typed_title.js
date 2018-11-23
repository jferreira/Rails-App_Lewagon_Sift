// TYPED.JS
import Typed from 'typed.js';

// [ TYPE OUT A TITLE ] ---------------------------------

function typedOutTitle() {

  const txtHeading = document.getElementById("txt-heading")

  if (txtHeading) {

    var typed = new Typed('#txt-heading', {
      strings: [
      // News Articles...
        "Aggregated by event",
        "Navigatible by story",
        "Contextulised in history",
        "In perspective",
        ],
      startDelay: 1000,
      typeSpeed: 70,
      backSpeed: 10,
      loop: true,
      loopCount: Infinity,
    });

  }

}

// [ TYPE OUT A TITLE ] ---------------- EXPORTED -----------------

export { typedOutTitle };

// document.addEventListener('DOMContentLoaded', function() {
//   var typed = new Typed('#typed', {
//     stringsElement: '#typed-strings',
//     typeSpeed: 20,
//     backSpeed: 20,
//     startDelay: 1000,
//     loop: false,
//     loopCount: Infinity,
//     onComplete: function(self) { prettyLog('onComplete ' + self) },
//     preStringTyped: function(pos, self) { prettyLog('preStringTyped ' + pos + ' ' + self); },
//     onStringTyped: function(pos, self) { prettyLog('onStringTyped ' + pos + ' ' + self) },
//     onLastStringBackspaced: function(self) { prettyLog('onLastStringBackspaced ' + self) },
//     onTypingPaused: function(pos, self) { prettyLog('onTypingPaused ' + pos + ' ' + self) },
//     onTypingResumed: function(pos, self) { prettyLog('onTypingResumed ' + pos + ' ' + self) },
//     onReset: function(self) { prettyLog('onReset ' + self) },
//     onStop: function(pos, self) { prettyLog('onStop ' + pos + ' ' + self) },
//     onStart: function(pos, self) { prettyLog('onStart ' + pos + ' ' + self) },
//     onDestroy: function(self) { prettyLog('onDestroy ' + self) }
//   });

//   document.querySelector('.toggle').addEventListener('click', function() {
//     typed.toggle();
//   });
//   document.querySelector('.stop').addEventListener('click', function() {
//     typed.stop();
//   });
//   document.querySelector('.start').addEventListener('click', function() {
//     typed.start();
//   });
//   document.querySelector('.reset').addEventListener('click', function() {
//     typed.reset();
//   });
//   document.querySelector('.destroy').addEventListener('click', function() {
//     typed.destroy();
//   });
//   document.querySelector('.loop').addEventListener('click', function() {
//     toggleLoop(typed);
//   });

//   var typed2 = new Typed('#typed2', {
//     strings: ['Some <i>strings</i> with', 'Some <strong>HTML</strong>', 'Chars &times; &copy;'],
//     typeSpeed: 0,
//     backSpeed: 0,
//     fadeOut: true,
//     loop: true
//   });
//   document.querySelector('.loop2').addEventListener('click', function() {
//     toggleLoop(typed2);
//   });

//   new Typed('#typed3', {
//     strings: ['My strings are: <i>strings</i> with', 'My strings are: <strong>HTML</strong>', 'My strings are: Chars &times; &copy;'],
//     typeSpeed: 0,
//     backSpeed: 0,
//     smartBackspace: true,
//     loop: true
//   });

//   new Typed('#typed4', {
//     strings: ['Some strings without', 'Some HTML', 'Chars'],
//     typeSpeed: 0,
//     backSpeed: 0,
//     attr: 'placeholder',
//     bindInputFocusEvents: true,
//     loop: true
//   });

//   new Typed('#typed5', {
//     strings: ['1 Some <i>strings</i> with', '2 Some <strong>HTML</strong>', '3 Chars &times; &copy;'],
//     typeSpeed: 0,
//     backSpeed: 0,
//     shuffle: true,
//     cursorChar: '_',
//     smartBackspace: false,
//     loop: true
//   });

//   new Typed('#typed6', {
//     strings: ['npm install^1000\n`installing components...` ^1000\n`Fetching from source...`'],
//     typeSpeed: 40,
//     backSpeed: 0,
//     loop: true
//   });
// });

// function prettyLog(str) {
//   console.log('%c ' + str, 'color: green; font-weight: bold;');
// }

// function toggleLoop(typed) {
//   if (typed.loop) {
//     typed.loop = false;
//   } else {
//     typed.loop = true;
//   }
// }
//

// ---------------------------------------------------------

// CONDITIONAL JAVASCRIPT
  // weather = "rainy"

  // if (weather === "rainy") {
  //   puts "something"
  // } else {
  //   puts "another thing"
  // }

  // if weather == "rainy"
  //   puts "something"
  // else
  //   puts "another thing"
  // end


// METHOD
// const sayHello
// const sayHello = (params)
// const sayHello = (params) => {
//   // what the function does,
//   // lines of code!
// }

// const sayHello = (name) => {
//   console.log("hello man " + name)
// }

// sayHello("john");


