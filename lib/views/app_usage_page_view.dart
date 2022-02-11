import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthify/models/appUsage.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:healthify/views/fitnessStats_page_view.dart';

class AppUsageHomePage extends StatefulWidget {
  @override
  _AppUsageHomePageState createState() {
    return _AppUsageHomePageState();
  }
}

class _AppUsageHomePageState extends State<AppUsageHomePage> {
  List<charts.Series<Usage, String>> _seriesPieData;
  List<Usage> mydata;
  _generateData(mydata) {
    // ignore: deprecated_member_use
    _seriesPieData = List<charts.Series<Usage, String>>();
    _seriesPieData.add(
      charts.Series(
        domainFn: (Usage usage, _) => usage.usageDetails,
        measureFn: (Usage usage, _) => usage.usageVal,
        colorFn: (Usage usage, _) =>
            charts.ColorUtil.fromDartColor(Color(int.parse(usage.colorVal))),
        id: 'usage',
        data: mydata,
        labelAccessorFn: (Usage row, _) => "${row.usageVal} min",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App Usage'), actions: [
        GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FitnessStatsPage(),
                  )),
              child: Icon(
                Icons.bar_chart,
                size: 28,
              )),
      ],),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('usage').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<Usage> usage = snapshot.data.docs
              .map((documentSnapshot) => Usage.fromMap(documentSnapshot.data()))
              .toList();
          return _buildChart(context, usage);
        }
      },
    );
  }

  Widget _buildChart(BuildContext context, List<Usage> usagedata) {
    mydata = usagedata;
    _generateData(mydata);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Time spent on app daily',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: charts.PieChart(_seriesPieData,
                    animate: true,
                    animationDuration: Duration(seconds: 5),
                    behaviors: [
                      new charts.DatumLegend(
                        outsideJustification:
                            charts.OutsideJustification.endDrawArea,
                        horizontalFirst: false,
                        desiredMaxRows: 2,
                        cellPadding: new EdgeInsets.only(
                            right: 4.0, bottom: 4.0, top: 4.0),
                        entryTextStyle: charts.TextStyleSpec(
                            color: charts.MaterialPalette.purple.shadeDefault,
                            fontSize: 18),
                      )
                    ],
                    defaultRenderer: new charts.ArcRendererConfig(
                        arcWidth: 100,
                        arcRendererDecorators: [
                          new charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.inside)
                        ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
