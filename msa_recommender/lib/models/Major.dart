enum Major {
  Arts_and_Design,
  Computer_Science,
  Engineering,
  Pharmacy,
  Management,
  Mass_Communication,
  Languages,
  Dentistry,
  Bio_Technology
}

extension MajorExtension on Major {
  String get name {
    return this.toString().split(".").last.replaceAll("_", " ");
  }
}