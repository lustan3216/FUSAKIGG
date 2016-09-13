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


$(function() {
    "use strict";

    // for revolution slider
    var tpj = jQuery;
    tpj(document).ready(function() {
        if(tpj("#rev_slider_46_1").revolution === undefined){
            revslider_showDoubleJqueryError("#rev_slider_46_1");
        }else{
            tpj("#rev_slider_46_1").show().revolution({
                sliderType: "standard",
                jsFileLocation: "../../revolution/js/",
                sliderLayout: "fullscreen",
                dottedOverlay: "none",
                delay: 5000,
                responsiveLevels: [1240, 1024, 778, 480],
                gridwidth: [1240, 1024, 778, 480],
                gridheight: [868, 768, 960, 720],
                lazyType: "none",
                shadow: 0,
                spinner: "off",
                stopLoop: "on",
                stopAfterLoops: 0,
                stopAtSlide: 1,
                shuffle: "off",
                autoHeight: "off",
                fullScreenAlignForce: "off",
                fullScreenOffsetContainer: "",
                fullScreenOffset: "0px",
                disableProgressBar: "off",
                hideThumbsOnMobile: "off",
                hideSliderAtLimit: 0,
                hideCaptionAtLimit: 0,
                hideAllCaptionAtLilmit: 0,
                debugMode: false,
                fallbacks: {
                    simplifyAll: "off",
                    nextSlideOnWindowFocus: "off",
                    disableFocusListener: false
                }
            });
        }
    });
});
