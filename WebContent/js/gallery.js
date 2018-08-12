$(document).ready(function () {

    $(".gallery a").nivoLightbox();

    var container = $(".gallery").masonry({
        itemSelector: ".item"
    });

    $(".gallery").imagesLoaded().always(function () {
        $(".gallery").fadeIn();
    }).progress(function (instance, image) {
        if (image.isLoaded) {
            $(image.img).addClass("loaded");
        }
    }).done(function () {
        $(".gallery-loader").addClass("hide");
        $(".gallery").removeClass("hide");
        container.masonry();
    });

    $(document).on("click", ".toggle-sidebar", function (e) {
        e.preventDefault();
        container.masonry({itemSelector: ".item"});
    });

    $(".gallery .item").on("mouseenter",function(){
        $(this).find(".overlay-text").addClass("bounceInUp");
    });
    $(".gallery .item").on("mouseleave",function(){
        $(this).find(".overlay-text").removeClass("bounceInUp");
    });

});
