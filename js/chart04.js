/*
    Dimple.js Chart construction code - chart no. 4
*/

var svg_4 = dimple.newSvg("#container04", 1300, 400);

d3.tsv("/data/open.tsv", function (data) {
  var open = new dimple.chart(svg_4, data);
  open.setBounds(100, 30, 1200, 320);
  var y = open.addCategoryAxis("y", "Sport");
  var x = open.addCategoryAxis("x", "Edition");
  var z = open.addMeasureAxis("z", "c");
  open.addMeasureAxis("p", "c");
  open.addSeries(["Sport", "Gender"], dimple.plot.pie);
  open.addLegend(800, 10, 360, 20, "right");

  // chart styling
  y.fontSize = "13px";
  x.fontSize = "12px";

  // min and max size for individual pies
  z.overrideMin = -19;
  z.overrideMax = 50;

  // legend.fontFamily = 'Raleway', 'sans-serif';
  // legend.fontSize = "15px";

  open.defaultColors = [
    new dimple.color("#333333"), // black
    new dimple.color("#E23D28")]; // red

    open.draw();
    y.titleShape.remove();
    x.titleShape.text("Olympic years");
  });
