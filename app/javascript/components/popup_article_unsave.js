
// SWEET ALERT 2

import swal from 'sweetalert2';

// SAVE A ARTICLE POPUP ---------------------------------

function articleUnsaved() {

  const unsaveArticle = document.getElementById('js-unsave-article');

  if (unsaveArticle) {

      unsaveArticle.addEventListener("click", () => {

      const toast = swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000
      });

      toast({
        type: 'info',
        title: 'Article Unsaved!'
      })

    })

  }
}

// EXPORT ---------------------------------

export { articleUnsaved };
