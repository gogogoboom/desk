
extension CountdownExt on int {

  String get asCountdown {
    if(this < 10) {
      return '0$this';
    }
    if(this > 99) {
      return '99';
    }
    return '$this';
  }
}