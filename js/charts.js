/*
    Dimple.js Chart construction code - chart no. 1
*/

var svg_1 = dimple.newSvg("#chartContainer01", 1300, 600);
d3.tsv("open.tsv", function (data) {

    "use strict";

    var open = new dimple.chart(svg_1, data);
    open.setBounds(60, 30, 1200, 530);
    open.addCategoryAxis("y", "Sport");
    open.addCategoryAxis("x", "Edition");
    var z = open.addMeasureAxis("z", "c");
    z.overrideMin = 0.4;
    z.overrideMax = 22;
    open.addMeasureAxis("p", "c");

    open.addSeries(["Sport", "Gender"], dimple.plot.pie);
    open.addLegend(200, 10, 360, 20, "right");
    open.ease = "cubic";

    open.draw(1000);
});
