import swal from 'sweetalert2';

// SUGGEST A URL ---------------------------------

function userSuggestsUrl() {

  const swalButton = document.getElementById('user-suggests-url');

  if (swalButton) {
    swalButton.addEventListener('click', () => {

      let html_block = '<p>Suggest an article about</p>' +
        '<input id="swal-input1" class="swal2-input">' +
        '<input id="swal-input2" class="swal2-input">' +
        '<input id="swal-input2" class="swal2-input">' +
        '<input id="swal-input2" class="swal2-input">';

        const {value: formValues} = swal({
          title: 'Suggest and article',
          width: 1000,
          html: html_block,
          focusConfirm: false,
          preConfirm: () => {
            return [
              document.getElementById('swal-input1').value,
              document.getElementById('swal-input2').value
            ]
          }
        })

        if (formValues) {
          swal(json.stringify(formValues))
        }

    })


  }

}

export { userSuggestsUrl };
