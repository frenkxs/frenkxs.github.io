/*
    Dimple.js Chart construction code - chart no. 2
*/

var svg_2 = dimple.newSvg("#container02", 1300, 430);

d3.tsv("/data/disciplines.tsv", function (data) {

  // column 1
  // row 1
  data_s = dimple.filterData(data, "Discipline", "swimming");

  var swimming = new dimple.chart(svg_2, data_s);
  swimming.setBounds(80, 30, 570, 116);
  var x_s = swimming.addCategoryAxis("x", ["Edition", "Event_gender"]);
  var y_s = swimming.addMeasureAxis("y", "c");
  var s = swimming.addSeries("Event_gender", dimple.plot.area);
  s.interpolation = "step";

  swimming.addLegend(800, 0, 360, 20, "right");

  swimming.defaultColors = [
    new dimple.color("#333333"), // black
    new dimple.color("#E23D28")]; // red

  swimming.draw();
    x_s.titleShape.remove();
    y_s.titleShape.text("Disciplines");

  // row 2
  data_a = dimple.filterData(data, "Discipline", "athletics");

  var athletics = new dimple.chart(svg_2, data_a);
  athletics.setBounds(80, 230, 570, 116);
  var x_a = athletics.addCategoryAxis("x", ["Edition", "Event_gender"]);
  var y_a = athletics.addMeasureAxis("y", "c");
  var a = athletics.addSeries("Event_gender", dimple.plot.area);
  a.interpolation = "step";

  athletics.defaultColors = [
    new dimple.color("#333333"), // black
    new dimple.color("#E23D28")]; // red

  athletics.draw();
    x_a.titleShape.text("Olympic years");
    y_a.titleShape.text("Disciplines");

  svg_2.append("text")
    .attr("x", 33)
    .attr("y", 15)
    .style("font-size", "0.8em")
    .text("Swimming")

  svg_2.append("text")
    .attr("x", 30)
    .attr("y", 215)
    .style("font-size", "0.8em")
    .text("Athletics")

  // column 2
  // row 1
  data_a = dimple.filterData(data, "Discipline", "rowing");

  var rowing = new dimple.chart(svg_2, data_a);
  rowing.setBounds(770, 30, 530, 116);
  var x_r = rowing.addCategoryAxis("x", ["Edition", "Event_gender"]);
  var y_r = rowing.addMeasureAxis("y", "c");
  var r = rowing.addSeries("Event_gender", dimple.plot.area);
  r.interpolation = "step";

  rowing.defaultColors = [
    new dimple.color("#333333"), // black
    new dimple.color("#E23D28")]; // red

  rowing.draw();
  x_r.titleShape.remove();
  y_r.titleShape.remove();

  // column 2
  // row 2
  data_s = dimple.filterData(data, "Discipline", "canoe / kayak f");
  var canoe = new dimple.chart(svg_2, data_s);
  canoe.setBounds(770, 230, 530, 116);
  var x_c = canoe.addCategoryAxis("x", ["Edition", "Event_gender"]);
  var y_c = canoe.addMeasureAxis("y", "c");
  c = canoe.addSeries("Event_gender", dimple.plot.area);
  c.interpolation = "step";

  canoe.defaultColors = [
    new dimple.color("#333333"), // black
    new dimple.color("#E23D28")]; // red

  canoe.draw();
    x_c.titleShape.text("Olympic years");
    y_c.titleShape.remove();

  svg_2.append("text")
    .attr("x", 720)
    .attr("y", 15)
    .style("font-size", "0.8em")
    .text("Rowing")

  svg_2.append("text")
    .attr("x", 720)
    .attr("y", 215)
    .style("font-size", "0.8em")
    .text("Canoe/Kayak - sprint")
});
