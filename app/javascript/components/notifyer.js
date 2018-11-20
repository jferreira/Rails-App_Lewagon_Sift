const hideAndDisplayNotif = ()=> {

  const notification = document.querySelector('.list-notification');

  const button = document.querySelector('.add-item-list');

  button.addEventListener('click', el => {
      if (notification) {
        notification.classList.add('fade');
        setTimeout(()=> notification.classList.remove('fade'), 2000);
      }
  });

}

export { hideAndDisplayNotif };

