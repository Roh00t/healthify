//Data Sets for Exercises Filtered based on difficulty
//Image URL is retrieved dynamically from Firebase


import 'package:healthify/models/exercise_set_model.dart';
import 'package:flutter/material.dart';

import 'exercise_dataSet.dart';

final exerciseSets = [
  ExerciseSet(
    name: 'Core',
    exercises: exercises1,
    imageUrl: 'assets/workouts/workout1.png',
    exerciseType: ExerciseType.low,
    color: Colors.blue.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Abs',
    exercises: exercises3,
    imageUrl: 'assets/workouts/crunch.png',
    exerciseType: ExerciseType.low,
    color: Colors.green.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Upper Body',
    exercises: exercises1,
    imageUrl: 'assets/workouts/pushup.png',
    exerciseType: ExerciseType.low,
    color: Colors.orange.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Yoga',
    exercises: exercises2,
    imageUrl: 'assets/workouts//yoga.png',
    exerciseType: ExerciseType.low,
    color: Colors.purple.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Cardio',
    exercises: exercises3,
    imageUrl: 'assets/workouts/workout3.png',
    exerciseType: ExerciseType.low,
    color: Colors.red.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Stretching',
    exercises: exercises4,
    imageUrl: 'assets/workouts/workout2.png',
    exerciseType: ExerciseType.mid,
    color: Colors.pink.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Core',
    exercises: exercises2,
    imageUrl: 'assets/workouts/workout3.png',
    exerciseType: ExerciseType.mid,
    color: Colors.yellowAccent.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Cardio',
    exercises: exercises3,
    imageUrl: 'assets/workouts/workout1.png',
    exerciseType: ExerciseType.mid,
    color: Colors.orange.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Yoga',
    exercises: exercises1,
    imageUrl: 'assets/workouts/yoga.png',
    exerciseType: ExerciseType.mid,
    color: Colors.purple.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Abs',
    exercises: exercises1,
    imageUrl: 'assets/workouts/crunch.png',
    exerciseType: ExerciseType.mid,
    color: Colors.blue.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Shoulder',
    exercises: exercises2,
    imageUrl: 'assets/workouts/pushup.png',
    exerciseType: ExerciseType.mid,
    color: Colors.teal.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Acrobatic',
    exercises: exercises2,
    imageUrl: 'assets/workouts/workout3.png',
    exerciseType: ExerciseType.hard,
    color: Colors.orange.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Hands',
    exercises: exercises2,
    imageUrl: 'assets/workouts/pushup.png',
    exerciseType: ExerciseType.hard,
    color: Colors.blue.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Abs',
    exercises: exercises4,
    imageUrl: 'assets/workouts/crunch.png',
    exerciseType: ExerciseType.hard,
    color: Colors.teal.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Core',
    exercises: exercises1,
    imageUrl: 'assets/workouts/workout2.png',
    exerciseType: ExerciseType.hard,
    color: Colors.purple.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Yoga',
    exercises: exercises3,
    imageUrl: 'assets/workouts/yoga.png',
    exerciseType: ExerciseType.hard,
    color: Colors.orange.shade100.withOpacity(0.6),
  ),
];
