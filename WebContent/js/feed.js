$(document).ready(function () {
    $(window).load(function(){

        var container = $(".feed");

        // initialize
        container.masonry({itemSelector: ".switch-item"});

        var msnry = container.data("masonry");

        $(document).on("click", ".toggle-sidebar", function (e) {
            e.preventDefault();
            container.masonry({itemSelector: ".switch-item"});
          });

        $(document).on("click", ".view-options label", function (e) {
            e.preventDefault();
            if ($(this).data("view") === "grid") {
                container.masonry({itemSelector: ".switch-item"});
            } else if ($(this).data("view") === "list") {
                msnry.destroy();
            }
        });

    });
});
