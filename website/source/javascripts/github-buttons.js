function jsonp(path) {
  var el = document.createElement('script');
  el.src = path + '?callback=callback';
  head.insertBefore(el, head.firstChild);
}

// Add commas to numbers
function addCommas(n) {
  return String(n).replace(/(\d)(?=(\d{3})+$)/g, '$1,')
}

function callback(obj) {
  if (obj.data.watchers) {
    document.getElementById('github--watch-count').innerHTML = addCommas(obj.data.watchers);
    document.getElementById('github--fork-count').innerHTML = addCommas(obj.data.forks);
  } else {
    document.getElementById('github--follow-count').innerHTML = addCommas(obj.data.followers);
  }
}

var types = ['watch', 'fork', 'follow'];
for (var i = 0; i < types.length; i++) {
  var user = 'hagenburger',
      repo = 'quotation-marks',
      type = types[i],
      count = 'true',
      size = 'none',
      head = document.getElementsByTagName('head')[0],
      button = document.getElementById('github--' + type + '-link'),
      mainButton = document.getElementById('github--' + type),
      text = document.getElementById('github--' + type + '-text'),
      counter = document.getElementById('github--' + type + '-count');

  // Set href to be URL for repo
  button.href = 'https://github.com/' + user + '/' + repo + '/';

  // Add the class, change the text label, set count link href
  if (type == 'watch') {
    mainButton.className += ' github-watchers';
    text.innerHTML = 'Star';
    counter.href = 'https://github.com/' + user + '/' + repo + '/stargazers';
  } else if (type == 'fork') {
    mainButton.className += ' github-forks';
    text.innerHTML = 'Fork';
    counter.href = 'https://github.com/' + user + '/' + repo + '/network';
  } else if (type == 'follow') {
    mainButton.className += ' github-me';
    text.innerHTML = 'Follow @' + user;
    button.href = 'https://github.com/' + user;
    counter.href = 'https://github.com/' + user + '/followers';
  }

  // Change the size
  if (size == 'large') {
    mainButton.className += ' github-btn-large';
  }

  if (type == 'follow') {
    jsonp('https://api.github.com/users/' + user);
  } else {
    jsonp('https://api.github.com/repos/' + user + '/' + repo);
  }
}

