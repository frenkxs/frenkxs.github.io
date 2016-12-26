/*
    Dimple.js Chart construction code - chart no. 1
*/

var svg = dimple.newSvg("#container01", 1300, 390);

d3.tsv("/data/disciplines.tsv", function (data) {
  data_d = dimple.filterData(data, "Discipline", "total");
  data_d = dimple.filterData(data_d, "Event_gender", ["men", "women"]);



  var disciplines = new dimple.chart(svg, data_d);
  disciplines.setBounds(100, 30, 1200, 300);
  var x = disciplines.addCategoryAxis("x", ["Edition", "Event_gender"]);
  var y = disciplines.addMeasureAxis("y", "c");
  disciplines.addSeries("Event_gender", dimple.plot.bar);

  // x.fontSize = "12px";

  disciplines.addLegend(800, 0, 360, 120, "right");

  disciplines.defaultColors = [
    new dimple.color("#333333"), // black
    new dimple.color("#E23D28"), // red
    new dimple.color("#bfbfbf")]; // grey

  disciplines.draw();
  x.titleShape.text("Olympic years");
  y.titleShape.text("% of disciplines by gender");
});
