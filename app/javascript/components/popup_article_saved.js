// SWEET ALERT 2
import swal from 'sweetalert2';

// SAVE A ARTICLE POPUP ---------------------------------

function articleSaved() {

  const saveArticle = document.getElementById('follow-event');

  if (saveArticle) {

      saveArticle.addEventListener("click", () => {

      const toast = swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000
      });

      toast({
        type: 'success',
        title: 'Article Saved!'
      })

    })

  }
}

// EXPORT ---------------------------------

export { articleSaved };
