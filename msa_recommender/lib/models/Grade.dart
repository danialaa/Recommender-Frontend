enum Grade {
  A,
  A_minus,
  B_plus,
  B,
  B_minus,
  C_plus,
  C,
  C_minus,
  D_plus,
  D,
  F1,
  F2,
  F3
}

extension GradeExtension on Grade {
  String get text {
    String letter = this.toString().split(".").last.substring(0, 1);

    if(this.toString().contains("minus")) {
      return letter + "-";
    } else if(this.toString().contains("plus")) {
      return letter + "+";
    } else {
      return letter;
    }
  }

  double get value {
    switch(this) {
      case Grade.A:
        return 4.00;

      case Grade.A_minus:
        return 3.67;

      case Grade.B_plus:
        return 3.33;

      case Grade.B:
        return 3.00;

      case Grade.B_minus:
        return 2.67;

      case Grade.C_plus:
        return 2.33;

      case Grade.C:
        return 2.00;

      case Grade.C_minus:
        return 1.67;

      case Grade.D_plus:
        return 1.33;

      case Grade.D:
        return 0.00;

      case Grade.F1:
        return 1.00;

      case Grade.F2:
        return 1.00;

      case Grade.F3:
        return 1.00;
    }
  }
}






























