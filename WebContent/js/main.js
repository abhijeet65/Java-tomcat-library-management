var options = {
    "storageName": "cameo",
    "menuStateStorage": true
};

var app = {
    initialize: function() {
        if (Modernizr.localstorage && $(".app").data("sidebar") !== "locked") {
            app.menuState();
        }
    },
    menuState: function () {
        if (window.localStorage.getItem(options.storageName + "_navigation") !== null && options.menuStateStorage === true) {
            if (window.localStorage.getItem(options.storageName + "_navigation") === "0") {
                app.openMenuState();
            } else {
                app.closeMenuState();
            }
        }
    },
    closeMenuState: function () {
        $(".app").addClass("small-sidebar");
        $(".toggle-sidebar  i").removeClass("fa-angle-left").addClass("fa-angle-right");
    },
    openMenuState: function () {
        $(".app").removeClass("small-sidebar");
        $(".toggle-sidebar i").removeClass("fa-angle-right").addClass("fa-angle-left");
    }
};

! function ($) {
    "use strict";

    function simulateLoad(el) {
        $(el).block({
            message: '<div class="loader"><i class="fa fa-spinner fa-spin"></i></div>',
            css: {
                border: "none",
                backgroundColor: "none"
            },
            overlayCSS: {
                backgroundColor: "#fff",
                opacity: 0.5
            }
        });
    }

    $(function () {


        if ($.isFunction($.fn.wizard)) {
            $("#datepicker").datepicker();
        }

        if ($.isFunction($.fn.wizard)) {
            $(".wizard").wizard();
        }

        if ($.isFunction($.fn.pillbox)) {
            $(".pillbox").pillbox();
        }

        if ($.isFunction($.fn.spinner)) {
            $(".spinner").spinner();
        }

        if ($.isFunction($.fn.selectpicker)) {
            $("select").selectpicker();
        }

        $(".no-touch .slimscroll").each(function () {
            var data = $(this).data();

            $(this).slimScroll(data);

        });

        if ($.isFunction($.fn.audioPlayer)) {
            $("audio").audioPlayer();
        }

        $(document).on("click", ".view-options label", function (e) {
            e.preventDefault();

            if ($(this).data("view") === "grid") {
                $(".switcher").addClass("view-grid").removeClass("view-list");
            } else if ($(this).data("view") === "list") {
                $(".switcher").addClass("view-list").removeClass("view-grid");
            }
        });

        $(document).on("click", ".toggle-sidebar ", function (e) {
            e.preventDefault();

            if ($(".app").hasClass("small-sidebar")) {
                app.openMenuState();
                window.localStorage.setItem(options.storageName + "_navigation", "0");
            } else {
                app.closeMenuState();
                window.localStorage.setItem(options.storageName + "_navigation", "1");
            }
        });

        $(document).on("click", ".dropdown-menu .settings", function (e) {
            e.stopPropagation();
        });

        $(document).on("click", ".toggle-active", function (e) {
            e.preventDefault();

            $(this).toggleClass("active");
        });

        $(document).on("click", ".help", function (e) {
            e.preventDefault();
            e.stopPropagation();

            $(this).toggleClass("active");

            if ($(".about-app").hasClass("open")) {
                $(".about-app").removeClass("pulse").addClass("bounceOut");

                window.setTimeout(function () {
                    $(".about-app").removeClass("open");
                }, 1000);

            } else {
                $(".about-app").removeClass("bounceOut").addClass("pulse").addClass("open");
            }
        });

        $(document).on("click", ".panel-collapsible", function (e) {
            e.preventDefault();
            e.stopPropagation();

            var el = $(this).parents(".panel").children(".panel-body");

            if ($(this).hasClass("fa-chevron-down")) {
                $(this).removeClass("fa-chevron-down").addClass("fa-chevron-up");
                el.slideUp(200);
            } else {
                $(this).removeClass("fa-chevron-up").addClass("fa-chevron-down");
                el.slideDown(200);
            }
        });

        $(document).on("click", ".panel-remove", function (e) {
            e.preventDefault();
            e.stopPropagation();

            $(this).parents(".panel").addClass("animated fadeOutRight").attr("id", "obsolete");
            setTimeout(function () {
                $("#obsolete").remove();
            }, 600);
        });

        $(document).on("click", ".panel-refresh", function (e) {
            e.preventDefault();
            e.stopPropagation();

            var elm = $(this).parents(".panel");
            simulateLoad(elm);
            window.setTimeout(function () {
                $(elm).unblock();
            }, 3000);
        });

        $(document).on("click", ".collapsible .main-navigation > ul > li > a", function (e) {
            e.stopPropagation();

            var subMenu = $(this).next(),
                parent = $(this).closest("li");

            $(".collapsible li").removeClass("collapse-open");

            parent.addClass("collapse-open");

            if ((subMenu.is("ul")) && (subMenu.is(":visible")) && (!$(".app").hasClass("small-sidebar"))) {
                parent.removeClass("collapse-open").removeClass("open");
                subMenu.slideUp();
            }

            if ((subMenu.is("ul")) && (!subMenu.is(":visible")) && (!$(".app").hasClass("small-sidebar"))) {
                $(".collapsible ul ul:visible").slideUp();
                subMenu.slideDown();
                parent.addClass("collapse-open");
            }

            if (subMenu.is("ul")) {
                return false;
            }
        
            return true;
        });


        app.initialize();

    });

}(window.jQuery);
