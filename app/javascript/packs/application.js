import "bootstrap";

// TYPED OUT TITLE
import { typedOutTitle } from '../components/typed_title';
typedOutTitle();

// HTML NOTIFICATION
import { hideAndDisplayNotif } from '../components/notifyer';
hideAndDisplayNotif();

// // ANIMATE SCORE
import { animate_score}  from '../components/score_animation';
animate_score();

// // USER - SUGGEST URL - POPUP
import { userSuggestsUrl } from '../components/popup_suggest_url';
userSuggestsUrl();

// // USER - BOOKMARKING TOPIC - ADDED
import { bookmarkTopic } from '../components/popup_bookmarked_topic';
bookmarkTopic();
