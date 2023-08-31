
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart';

class WorldTime {

  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});


  Future<void> getTime() async {
    try {
      // Make the request
      Response response = await get(
          Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);


      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);


      // create A dateTime Object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // set time property
      isDayTime = now.hour >6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('CAUGHT ERROR: $e');
      time = 'Could not get time data';
    }
  }
}