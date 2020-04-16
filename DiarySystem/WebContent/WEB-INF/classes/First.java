import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.JFreeChart;
import org.jfree.data.DefaultPieDataset;
public class First {

public static void main(String[] args) {
// create a dataset...
DefaultPieDataset data = new DefaultPieDataset();
data.setValue("Category 1", 250);
data.setValue("Category 2", 500);
data.setValue("Category 3", 310);
// create a chart...
JFreeChart chart = ChartFactory.createPieChart(
"Sample Pie Chart",
data,
true, // legend?
true, // tooltips?
false // URLs?
);
// create and display a frame...
ChartFrame frame = new ChartFrame("First", chart);
frame.pack();
frame.setVisible(true);
}
}
