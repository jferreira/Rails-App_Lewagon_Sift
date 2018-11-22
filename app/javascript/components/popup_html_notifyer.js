// NOTIFICATION FOR BOOK MARK

const popUpFollowed = () => {

  const button_topic = document.querySelector('.add-item-list-Topic');
  const button_event = document.querySelector('.add-item-list-Event');
  const notification_topic = document.querySelector('.list-notification-topic');
  const notification_event = document.querySelector('.list-notification-event');

  if (button_topic == 8) {

    button_topic.addEventListener('click', el => {
      if (notification_topic) {
        notification_topic.classList.add('fade');
        setTimeout(()=> notification_topic.classList.remove('fade'), 2000);
      }
    });

    button_event.addEventListener('click', el => {
      if (notification_event) {
        notification_event.classList.add('fade');
        setTimeout(()=> notification_event.classList.remove('fade'), 2000);
      }
    });

  }

}

export { popUpFollowed };
