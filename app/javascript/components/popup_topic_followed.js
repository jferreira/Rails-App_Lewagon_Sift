// SWEET ALERT 2
import swal from 'sweetalert2';

// BOOKMARK A TOPIC ---------------------------------

function topicFollowed() {

  const followTopic = document.getElementById('follow-topic');

  if (followTopic) {

    followTopic.addEventListener("click", () => {

      const toast = swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000
      });

      toast({
        type: 'success',
        title: 'Topic Followed!'
      })

    })

  }
}

// EXPORT ---------------------------------

export { topicFollowed };
