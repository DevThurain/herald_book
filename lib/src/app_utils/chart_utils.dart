import 'package:charts_flutter/flutter.dart' as charts;

class ChartUtils {
  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> sampleData() {
    final myFakeDesktopData = [
      LinearSales(0, 400),
      LinearSales(1, 320),
      LinearSales(2, 500),
      LinearSales(3, 600),
      LinearSales(3, 430),
      LinearSales(3, 300),
    ];

    return [
      charts.Series<LinearSales, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeDesktopData,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
