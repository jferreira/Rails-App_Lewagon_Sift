import swal from 'sweetalert';

// SUGGEST AN ARTICLE ---------------------------------

function suggestAnArticle() {

  const swalButton = document.getElementById('suggest-article');

  if (swalButton) {
    swalButton.addEventListener('click', () => {
      swal({
        title: "Add Article",
        text: "Add a url below",
        icon: "success",
        timer: 6000
      });
    });
  }



}

export { suggestAnArticle };
