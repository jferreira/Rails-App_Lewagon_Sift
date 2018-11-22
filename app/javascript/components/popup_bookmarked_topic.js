// SWEET ALERT 2
import swal from 'sweetalert2';

// BOOKMARK A TOPIC ---------------------------------

function bookmarkTopic() {

  const selected = document.getElementById('bookmarked-topic');

  if (selected) {

    // bookmarkedTopicButton.addEventListener('click', () => {
      selected.addEventListener("click", () => {

      const toast = swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000
      });

      toast({
        type: 'success',
        title: 'Topic added to your bookmarks!'
      })

    })

    // }
  }
}

// EXPORT ---------------------------------

export { bookmarkTopic };
