// SWEETALERT2
import swal from 'sweetalert2';

// [SUGGEST A URL ---------------------------------

function userSuggestsUrl() {

  const selected = document.getElementById('user-suggests-url');

  if (selected) {

    let h2 = document.querySelector('h2 > span');
    let location = document.querySelector('.article-location').innerText;
    let time = document.querySelector('.article-time').innerText;
    let topic_title = document.querySelector('.topic-title').innerText;
    let event_title = document.querySelector('.event-title').innerText;
    let event_description = document.querySelector('.event-description').innerText;

    selected.addEventListener('click', () => {

      let html_block = '<h4>Suggest an article about</h4>' +
        `<input id="swal-input1" class="swal2-input" placeholder="${topic_title}">` +
        `<input id="swal-input1" class="swal2-input" placeholder="${event_description}">` +
        `<input id="swal-input1" class="swal2-input" placeholder="${event_title}">` +
        `<input id="swal-input1" class="swal2-input" placeholder="${location}">` +
        `<input id="swal-input1" class="swal2-input" placeholder="${time}">`;

      const {value: formValues} = swal({
        title: '<h2>Suggest and article</h2>',
        width: 1000,
        background: 'background-color: rgba(255, 255, 255, 0.3);',
        showCloseButton: true,
        html: html_block,
        focusConfirm: false,
        preConfirm: () => {
          return [ document.getElementById('swal-input1').value, document.getElementById('swal-input2').value]
        }
      })

      if (formValues) {
        swal(json.stringify(formValues))
      }

    })
  }
}

// EXPORT ---------------------------------

export { userSuggestsUrl };
