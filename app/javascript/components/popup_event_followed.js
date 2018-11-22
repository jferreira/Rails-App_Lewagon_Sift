// SWEET ALERT 2
import swal from 'sweetalert2';

// BOOKMARK A TOPIC ---------------------------------

function eventFollowed() {

  const followEvent = document.getElementById('follow-event');

  if (followEvent) {

      followEvent.addEventListener("click", () => {

      const toast = swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000
      });

      toast({
        type: 'success',
        title: 'Event Followed!'
      })

    })

  }
}

// EXPORT ---------------------------------

export { eventFollowed };
