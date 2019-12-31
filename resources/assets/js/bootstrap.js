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