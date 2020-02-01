import 'package:msa_recommender/models/Grade.dart';

class Course {
  String _id;
  Grade grade;
  String name;
  int creditHours;

  Course([this._id, this.grade, this.name, this.creditHours]);

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}