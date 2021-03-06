import 'package:charts_flutter/flutter.dart' as charts;
import 'package:candlesticks/candlesticks.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:herald_book/src/network/models/vos/match_vo.dart';

class ChartUtils {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

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

  LineChartData mainData(List<FlSpot> spotList) {
    double maxY = findMaxY(spotList);
    double maxX = spotList.last.x;
    double minY = findMinY(spotList);

    print("x -> $minY && y -> $maxY");

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: false,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => TextStyle(
              color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
          // getTitles: (value) {
          //   switch (value.toInt()) {
          //     case 2:
          //       return 'MAR';
          //     case 3:
          //       return 'JUN';
          //     case 6:
          //       return 'SEP';
          //   }
          //   return '';
          // },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          interval: 1,
          getTextStyles: (context, value) => TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          // getTitles: (value) {
          //   switch (value.toInt()) {
          //     case 1:
          //       return '10k';
          //     case 3:
          //       return '30k';
          //     case 5:
          //       return '50k';
          //   }
          //   return '';
          // },
          reservedSize: 32,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: maxX,
      minY: minY,
      maxY: maxY,
      lineBarsData: [
        LineChartBarData(
          spots: spotList,
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  static List<FlSpot> calculateScore(List<MatchVO> matchList) {
    List<MatchScore> matchScoreList = [];
    int id = 0;
    int score = 0;

    matchList.forEach((match) {
      var playerSide = checkPlayerSide(match.playerSlot ?? 0);
      if (match.radiantWin!) {
        if (playerSide == Side.Radient) {
          score += 1;
          var matchScore = MatchScore(id, score);
          matchScoreList.add(matchScore);
        } else {
          score -= 1;
          var matchScore = MatchScore(id, score);
          matchScoreList.add(matchScore);
        }
      } else {
        if (playerSide == Side.Dire) {
          score += 1;
          var matchScore = MatchScore(id, score);
          matchScoreList.add(matchScore);
        } else {
          score -= 1;
          var matchScore = MatchScore(id, score);
          matchScoreList.add(matchScore);
        }
      }
      id++;
    });

    List<FlSpot> spotList = [];

    matchScoreList.forEach((element) {
      spotList.add(FlSpot(element.matchId.toDouble(), element.score.toDouble()));
    });

    return spotList;
  }

  static Side checkPlayerSide(int value) {
    return value < 128 ? Side.Radient : Side.Dire;
  }

  double findMaxY(List<FlSpot> spList) {
    List<FlSpot> tempList = [];
    spList.forEach((element) {
      tempList.add(FlSpot(element.x, element.y));
    });
    tempList.sort(((a, b) => a.y.compareTo(b.y)));
    return tempList.last.y;
  }

  double findMinY(List<FlSpot> spotList) {
    List<FlSpot> tempList = [];
    spotList.forEach((element) {
      tempList.add(FlSpot(element.x, element.y));
    });
    tempList.sort(((a, b) => a.y.compareTo(b.y)));
    return tempList.first.y;
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

class MatchScore {
  final int matchId;
  final int score;
  MatchScore(this.matchId, this.score);
}

enum Side { Radient, Dire }
