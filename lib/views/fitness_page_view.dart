import 'package:flutter/material.dart';
import 'package:healthify/views/map_view.dart';
import 'package:healthify/views/profile_page_view.dart';
import 'package:healthify/widgets/exercises_widget.dart';
import 'package:healthify/widgets/line_chart_widget.dart';

class FitnessPage extends StatefulWidget {
  @override
  _FitnessPageState createState() => _FitnessPageState();
}

class _FitnessPageState extends State<FitnessPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            buildAppBar(context),
            ExercisesWidget(),
          ],
        ),
      );
  SliverAppBar buildAppBar(BuildContext context) => SliverAppBar(
        flexibleSpace: FlexibleSpaceBar(background: LineChartWidget()),
        expandedHeight: MediaQuery.of(context).size.height * 0.5,
        stretch: true,
        title: Text('Statistics'),
        centerTitle: true,
        leading: GestureDetector(
           onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MapPage(),)),
                  child: Icon(Icons.map_outlined)),
        pinned: true,
        actions: [
          GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  )),
              child: Icon(
                Icons.person,
                size: 28,
              )),
          SizedBox(width: 12),
        ],
      );
}
