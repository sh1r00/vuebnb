
window._ = require('lodash');

/**
 * We'll load jQuery and the Bootstrap jQuery plugin which provides support
 * for JavaScript based Bootstrap features such as modals and tabs. This
 * code may be modified to fit the specific needs of your application.
 */

 window.$ = window.jQuery = require('jquery');

require('bootstrap-sass');

import Echo from "laravel-echo"
window.Pusher = require('pusher-js');

window.Echo = new Echo({
    broadcaster: 'pusher',
    key: 'c15690730971334fa412',
    cluster: 'us2',
    encrypted: true,
    /** 
     * If using passport
     * 
     * auth: {
        headers: {
            Authorization: 'Bearer ****'
        }
    }
    */
});