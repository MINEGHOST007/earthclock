import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime {

  String location;
  String time="";
  String flag;
  String urla;
  bool isDaytime=false;

  WorldTime({required this.location,  required this.flag , required this.urla}){}


  Future<void> getData() async{
    print('outside');
    //delay
    // await Future.delayed(Duration(seconds:3),(){
    //   print('vinni');

    // });
    Uri url = Uri.parse('http://worldtimeapi.org/api/timezone/${urla}');
    Response response = await get(url);
    Map data = jsonDecode(response.body);
    //print(data);
    //get properties from data

    String datetime= data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    // print(datetime);
    // print(offset);
    //create date time object

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    // print(now);
    //time = now.toString();
    isDaytime = ( (now.hour > 6) && (now.hour< 20) )? true : false;
    time= DateFormat.jm().format(now);


  }

}
