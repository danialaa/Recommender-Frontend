import 'package:msa_recommender/models/Semester.dart';
import 'Major.dart';

class Student {
  int _id;
  String name;
  Major major;
  List<Semester> semesters = new List();
  double _gpa;

  Student([this._id, this.name, this.major, this.semesters, this._gpa]);

  double get gpa => _gpa;

  set gpa(double value) {
    if(value >= 0.00 && value <= 4.00) {
      _gpa = double.parse(value.toStringAsFixed(2));
    }
  }

  int get id => _id;

  set id(int value) {
    if(value.remainder(2) != 0) {
      _id = value;
    }
  }
}