import 'package:healthify/models/exercise_set_model.dart';
import 'package:healthify/services/storage_service.dart';
import 'package:healthify/views/exercise_page_view.dart';
import 'package:flutter/material.dart';

class ExerciseSetWidget extends StatelessWidget {
  final ExerciseSet exerciseSet;

  const ExerciseSetWidget({
    @required this.exerciseSet,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ExercisePage(exerciseSet: exerciseSet),
        )),
        child: FutureBuilder(
          future: Storage().downloadURL(exerciseSet.imageUrl),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
              return Container(
              padding: const EdgeInsets.all(16),
              height: 100,
              decoration: BoxDecoration(
                color: exerciseSet.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(flex: 3, child: buildText()),
                  Expanded(child: Image.network(snapshot.data))
                ],
              ),
            );
            }
            if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
              return CircularProgressIndicator();
            }
            return Container();
          },
        ),
      );

  Widget buildText() {
    final exercises = exerciseSet.exercises.length;
    final minutes = exerciseSet.totalDuration;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          exerciseSet.name,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        SizedBox(height: 10),
        Text('$exercises Exercises $minutes Mins'),
      ],
    );
  }
}
