abstract class HiveModel<T> {
  String get modelKey => T.toString();
}