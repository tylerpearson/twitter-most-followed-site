(function() {

    $('.js-lazy').lazyload();

    $('.person-description p').twlinkify();

    setInterval(function() {
        $(".percentage-bar").each(function() {
            var $this = $(this);
            $this.width($this.data('width'));
        });
    }, 1000);

}());