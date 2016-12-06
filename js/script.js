/*
    Page transition
*/

$(function() {
                $('ul.nav a').bind('click',function(event){
                    var $anchor = $(this);

                    $('html, body').stop().animate({
                        scrollLeft: $($anchor.attr('href')).offset().left
                    }, 1500,'easeInOutExpo');

                    $('html, body').stop().animate({
                        scrollLeft: $($anchor.attr('href')).offset().left
                    }, 1000);
                    event.preventDefault();
                });
            });

/*
    Dimple.js Chart construction code - chart no. 1
*/

var svg_1 = dimple.newSvg(".chartContainer01", 1300, 500);
d3.tsv("/data/open.tsv", function (data) {

    "use strict";

    var open = new dimple.chart(svg_1, data);
    open.setBounds(60, 30, 1200, 430);
    open.addCategoryAxis("y", "Sport");
    open.addCategoryAxis("x", "Edition");
    var z = open.addMeasureAxis("z", "c");
    z.overrideMin = -12;
    z.overrideMax = 62;
    open.addMeasureAxis("p", "c");

    open.addSeries(["Sport", "Gender"], dimple.plot.pie);
    open.addLegend(200, 10, 360, 20, "right");
    open.ease = "cubic";

    open.draw(1000);
  });
