// Twlinkify
// an absurdly simple jQuery plugin to linkify the text of tweets

;(function($) {

   // from http://stackoverflow.com/questions/8020739/regex-how-to-replace-twitter-links
   function addTwitterLinks(text) {
        var e = /(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/gi;
        text = text.replace(e, "<a class='twlinked' href='$1' target='_blank'>$1</a>");
        e = /(^|\s)#(\w+)/g;
        text = text.replace(e, "$1<a class='twlinked' href='http://search.twitter.com/search?q=%23$2' target='_blank'>#$2</a>");
        e = /(^|\s)@(\w+)/g;
        text = text.replace(e, "$1<a class='twlinked' href='http://www.twitter.com/$2' target='_blank'>@$2</a>");
        return text;
    }

    $.fn.twlinkify = function() {
        return this.each(function() {
            var $el = $(this);
            $el.html(addTwitterLinks($el.text()));
        });
    };

})(jQuery);