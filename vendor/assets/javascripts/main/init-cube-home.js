$(function($) {
    "use strict";

    $("#js-grid-masonry").cubeportfolio({
        filters: "#js-filters-masonry",
        layoutMode: "grid",
        defaultFilter: "*",
        animationType: "slideDelay",
        gapHorizontal: 0,
        gapVertical: 0,
        gridAdjustment: "responsive",
        mediaQueries: [{
            width: 1500,
            cols: 4
        }, {
            width: 1100,
            cols: 4
        }, {
            width: 800,
            cols: 3
        }, {
            width: 480,
            cols: 2
        }, {
            width: 320,
            cols: 1
        }],
        caption: "overlayBottomAlong",
        displayType: "bottomToTop",
        displayTypeSpeed: 100,

        // lightbox
        lightboxDelegate: ".cbp-lightbox",
        lightboxGallery: true,
        lightboxTitleSrc: "data-title",
        lightboxCounter: "<div class='cbp-popup-lightbox-counter'>{{current}} of {{total}}</div>"
    });

});
