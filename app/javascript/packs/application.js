import "bootstrap";

// TYPED OUT TITLE
import { typedOutTitle } from '../components/animation_typed_title';
typedOutTitle();

// HTML NOTIFICATION
// import { popUpFollowed } from '../components/popup_html_notifyer';
// popUpFollowed();

// // // ANIMATE SCORE
// import { animate_score }  from '../components/animation_user_score';
// animate_score();

// // USER - SUGGEST URL - POPUP
import { userSuggestsUrl } from '../components/popup_article_suggestion';
userSuggestsUrl();

// // USER - BOOKMARKING TOPIC - ADDED
import { topicFollowed } from '../components/popup_topic_followed';
topicFollowed();

// // USER - BOOKMARKING EVENT - ADDED
import { eventFollowed } from '../components/popup_event_followed';
eventFollowed();


// USER - SAVE ARTICLE - ADDED
import { articleSaved } from '../components/popup_article_saved';
articleSaved();

// USER - UNSAVE ARTICLE - REMOVED
import { articleUnsaved } from '../components/popup_article_unsave';
articleUnsaved();
