import 'package:intl/intl.dart';
String dateformatted(){
  var now =DateTime.now();
  var format=DateFormat("EEE,MMM d,'yy'");
  String formated=format.format(now);
  return formated;
}