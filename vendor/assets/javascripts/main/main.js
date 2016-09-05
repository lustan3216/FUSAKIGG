$(function () {
    "use strict";
    $(".menu > ul > li:has( > ul)").addClass("menu-dropdown-icon"), $(".menu > ul > li > ul:not(:has(ul))").addClass("normal-sub"), $(".menu > ul").before('<a href="#" class="menu-mobile"></a>'), $(".menu > ul > li").hover(function (t) {
        $(window).width() > 991 && ($(this).children("ul").stop(!0, !1).fadeToggle(150), t.preventDefault())
    }), $(".menu > ul > li > ul > .has-subsubmenu").hover(function (t) {
        $(window).width() > 991 && ($(this).children("ul").stop(!0, !1).fadeToggle(50), t.preventDefault())
    }), $(".menu > ul > li").click(function () {
        $(window).width() <= 991 && ($(".menu > ul > li > ul").fadeOut(50), $(this).children("ul").fadeIn(150))
    }), $(".menu > ul > li > ul > li").click(function () {
        $(window).width() <= 991 && ($(".menu > ul > li > ul > li > .sub-submenu").fadeOut(50), $(this).children("ul").fadeIn(150))
    }), $(".menu-mobile").click(function (t) {
        $(".menu > ul").toggleClass("show-on-mobile"), t.preventDefault()
    })
});
$(function (e) {
    "use strict";
    e(window).load(function () {
        e(".page-loader").fadeOut("slow")
    }), e(window).on("scroll resize", function () {
        e(window).scrollTop() >= 75 && (e("body").addClass("secondNav"), e(".scroll-to-top").css("bottom", "0px")), e(window).scrollTop() < 75 && (e("body").removeClass("secondNav"), e(".scroll-to-top").css("bottom", "-50px"))
    }), e(".scroll-to-top", "footer").on("click", function () {
        return e("html, body").animate({scrollTop: 0})
    }), e(".client-carousel").owlCarousel({
        loop: !0,
        items: 6,
        autoplay: !0,
        dots: !1
    }), e(".open-nav-button").on("click", function () {
        var o;
        o = e(this).data("clicks"), o ? (e(".main-menu").removeClass("animated fadeIn"), e(".main-menu").css("display", "none")) : (e(".main-menu").css("display", "block"), e(".main-menu").addClass("animated fadeIn")), e(this).data("clicks", !o)
    })
});

