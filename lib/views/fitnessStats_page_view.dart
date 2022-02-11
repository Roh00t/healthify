import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:healthify/models/fitness_Stats_model.dart';

class FitnessStatsPage extends StatefulWidget {
  @override
  _FitnessStatsPageState createState() {
    return _FitnessStatsPageState();
  }
}

class _FitnessStatsPageState extends State<FitnessStatsPage> {
  List<charts.Series<FitnesssStats, String>> _seriesBarData;
  List<FitnesssStats> mydata;
  _generateData(mydata) {
    // ignore: deprecated_member_use
    _seriesBarData = List<charts.Series<FitnesssStats, String>>();
    _seriesBarData.add(
      charts.Series(
        domainFn: (FitnesssStats fitnesssStats, _) => fitnesssStats.fitnesssStatsYear.toString(),
        measureFn: (FitnesssStats fitnesssStats, _) => fitnesssStats.fitnesssStatsVal,
        colorFn: (FitnesssStats fitnesssStats, _) =>
            charts.ColorUtil.fromDartColor(Color(int.parse(fitnesssStats.colorVal))),
        id: 'FitnesssStats',
        data: mydata,
        labelAccessorFn: (FitnesssStats row, _) => "${row.fitnesssStatsYear}",
      ),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fitnesss Statistics')),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('fitnesssStats').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<FitnesssStats> fitnesssStats = snapshot.data.docs
              .map((documentSnapshot) => FitnesssStats.fromMap(documentSnapshot.data()))
              .toList();
          return _buildChart(context, fitnesssStats);
        }
      },
    );
  }
  Widget _buildChart(BuildContext context, List<FitnesssStats> fitnessdata) {
    mydata = fitnessdata;
    _generateData(mydata);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Your Fitness Statistics',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: charts.BarChart(_seriesBarData,
                    animate: true,
                    animationDuration: Duration(seconds:5),
                     behaviors: [
                      new charts.DatumLegend(
                        entryTextStyle: charts.TextStyleSpec(
                            color: charts.MaterialPalette.purple.shadeDefault,
                            fontSize: 18),
                      )
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}