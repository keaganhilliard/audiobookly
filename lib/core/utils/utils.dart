class Utils {
  static format(Duration d) => d.toString().split('.').first.padLeft(8, "0");
}
