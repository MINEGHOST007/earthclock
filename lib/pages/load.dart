import 'package:flutter/material.dart';
import 'package:earthclock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'Loading';

  void setupEarthTime() async{
    WorldTime instance = WorldTime(location: 'Berlin', flag:'germany.png', urla: 'Europe/Berlin' );
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/home' , arguments: { 'isDaytime':  instance.isDaytime,'location': instance.location, 'time':instance.time, 'flag': instance.flag });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupEarthTime();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: SpinKitWaveSpinner(
            color: Colors.indigoAccent,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
