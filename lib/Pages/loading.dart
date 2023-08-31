
import 'package:flutter/material.dart';
import 'Servises/World_Time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
    const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();


}

class _LoadingState extends State<Loading> {

 void setupWorldTime()async{
   WorldTime instance = WorldTime(location: 'Uganda', flag: 'Uganda.png', url: 'Africa/Nairobi');
  await instance.getTime();
  Navigator.pushReplacementNamed(context, '/home',arguments: {
    'location': instance.location,
    'flag': instance.flag,
    'time': instance.time,
    'isDayTime': instance.isDayTime,
  });

 }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: SpinKitCubeGrid(
            color: Colors.white,
            size: 50.0,
          ),
        ),
      );
  }
}
