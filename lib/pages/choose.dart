import 'package:flutter/material.dart';
import 'package:earthclock/services/world_time.dart';

class Chooseloc extends StatefulWidget {
  const Chooseloc({Key? key}) : super(key: key);

  @override
  State<Chooseloc> createState() => _ChooselocState();
}

class _ChooselocState extends State<Chooseloc> {
  List<WorldTime> locations= [
    WorldTime(urla: 'America/New_York', location: 'CINCINNATI', flag: 'bearcats.png'),
    WorldTime(urla: 'Asia/Kolkata', location: 'SANKEERTH', flag: 'south_korea.png'),
    WorldTime(urla: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(urla: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(urla: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(urla: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(urla: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),


    WorldTime(urla: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getData();
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.location,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: AppBar(
        title: Text('earthclock'),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
          itemBuilder: (context,index){
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
              onTap: (){
                updateTime(index);
              },
              title: Text('${locations[index].location}' ,style: TextStyle(
                  fontWeight: FontWeight.bold,
              ),),
            ),
          );
          },
      ),
    );
  }
}
