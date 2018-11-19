import swal from 'sweetalert2';

// SUGGEST A URL ---------------------------------

function userSuggestsUrl() {

  const swalButton = document.getElementById('user-suggests-url');

  if (swalButton) {
    swalButton.addEventListener('click', () => {

    // ASK FOR URL
    const {value: url} = await swal({
      input: 'url',
      inputPlaceholder: 'Enter the URL'
    })

    if (url) {
      swal('Entered URL: ' + url)
    }

    // 3 STEP PROCESS
    //     swal.mixin({
    //       input: 'text',
    //       confirmButtonText: 'Next &rarr;',
    //       showCancelButton: true,
    //       progressSteps: ['1', '2', '3']
    //     }).queue([
    //       {
    //         title: 'Suggest an article',
    //         text: 'Suggest an article about'
    //       },
    //       'Question 3'
    //     ]).then((result) => {
    //       if (result.value) {
    //         swal({
    //           title: 'Sent!',
    //           html:
    //             'Your answers: <pre><code>' +
    //               JSON.stringify(result.value) +
    //             '</code></pre>',
    //           confirmButtonText: 'Suggestion Sent! Thanks'
    //         })
    //       }
    //     })

    // });


  }
}

export { userSuggestsUrl };


