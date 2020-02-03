import 'package:msa_recommender/models/Grade.dart';

class Course {
  String _id;
  Grade grade;
  int creditHours;

  Course([this._id, this.grade, this.creditHours]);

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}