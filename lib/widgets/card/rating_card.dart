import 'package:allo_event/models/ordinal_rate_model.dart';
import 'package:allo_event/widgets/charts/horizontal_chart_bar.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RatingCard extends StatelessWidget {
  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalRate, String>> createSampleData() {
    final data = [
      new OrdinalRate('5', 65),
      new OrdinalRate('4', 15),
      new OrdinalRate('3', 10),
      new OrdinalRate('2', 3),
      new OrdinalRate('1', 7),
    ];
// static Palette get blue => const MaterialBlue();
//   static Palette get red => const MaterialRed();
//   static Palette get yellow => const MaterialYellow();
//   static Palette get green => const MaterialGreen();
//   static Palette get purple => const MaterialPurple();
//   static Palette get cyan => const MaterialCyan();
//   static Palette get deepOrange => const MaterialDeepOrange();
//   static Palette get lime => const MaterialLime();
//   static Palette get indigo => const MaterialIndigo();
//   static Palette get pink => const MaterialPink();
//   static Palette get teal => const MaterialTeal();
//   static MaterialGray get gray => const MaterialGray();
    final _colorPalettes = [
      MaterialPalette.teal,
      MaterialPalette.green,
      MaterialPalette.yellow,
      MaterialPalette.deepOrange,
      MaterialPalette.red,
    ];
    return [
      new charts.Series<OrdinalRate, String>(
        id: 'Rates',
        colorFn: (_, idx) => _colorPalettes[idx].shadeDefault,
        domainFn: (OrdinalRate rate, _) => rate.grade,
        measureFn: (OrdinalRate rate, _) => rate.score,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '4.4',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(fontSize: 40, color: Colors.black54),
              ),
              SizedBox(height: 5),
              SmoothStarRating(
                rating: 4.4,
                isReadOnly: true,
                size: 15,
                color: Colors.amber,
                borderColor: Colors.amber[400],
                filledIconData: Icons.star,
                halfFilledIconData: Icons.star_half,
                defaultIconData: Icons.star_border,
                starCount: 5,
                allowHalfRating: true,
                spacing: 2.0,
                onRated: (value) {
                  print("rating value -> $value");
                  // print("rating value dd -> ${value.truncate()}");
                },
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Icon(Icons.person, color: Colors.grey[400], size: 20),
                  Text(' 2 253 au total'),
                ],
              ),
            ],
          ),
          Container(
              height: 100,
              width: 200,
              child: HorizontalBarChart(createSampleData()))
        ],
      ),
    );
  }
}
