/*
    Dimple.js Chart construction code - chart no. 3
*/

var svg_3 = dimple.newSvg("#container03", 1300, 500);

d3.tsv("/data/exclusives.tsv", function (data) {

  var exclusives = new dimple.chart(svg_3, data);

  exclusives.setBounds(100, 30, 1200, "60%");
  var x = exclusives.addCategoryAxis("x", ["Edition", "Gender"]);
  var y = exclusives.addMeasureAxis("y", "c");
  exclusives.addSeries("Gender", dimple.plot.bar);
  exclusives.addLegend(800, 10, 360, 20, "right");

  exclusives.defaultColors = [
    new dimple.color("#333333"), // black
    new dimple.color("#E23D28")]; // red

  exclusives.draw();
  x.titleShape.text("Olympic years");
  y.titleShape.text("Number of exclusive disciplines");
});
