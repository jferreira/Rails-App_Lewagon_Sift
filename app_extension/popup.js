let perpButton = document.getElementById('persp-btn');
let jokeBtn = document.getElementById('joke-btn')
let joke = document.getElementById('joke')
perpButton.addEventListener('click', () => {
  // chrome.tabs.create()
  let tabUrl;
  chrome.tabs.getSelected(null, function(tab) {
    tabUrl = tab.url;
  });
  chrome.tabs.query({currentWindow: true, active: true}, function (tab) {
    let your_new_url = `https://www.lewagon.com?url=${tabUrl}`;
    console.log(window.location)
    chrome.tabs.update(tab.id, {url: your_new_url});
  });
})

jokeBtn.addEventListener('click', () => {
  fetch(`https://api.github.com/users/InouRidder`)
  .then(response => response.json())
  .then(data => {
    joke.innerText = data.name
  })
})
