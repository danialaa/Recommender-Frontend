import 'package:msa_recommender/models/Course.dart';

class Semester {
  int number;
  int totalCredits;
  List<Course> courses = new List();

  Semester([this.number, this.totalCredits, this.courses]);
}