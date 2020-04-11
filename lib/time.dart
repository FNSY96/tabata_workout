class Time {
  int hours, minutes, seconds;

//  Time({this.hours, this.minutes, this.seconds});
  Time(DateTime date) {
    var split = date.toString().substring(11,19).split(':');
    this.hours = int.parse(split[0]);
    this.minutes = int.parse(split[1]);
    this.seconds = int.parse(split[2]);
  }
}
