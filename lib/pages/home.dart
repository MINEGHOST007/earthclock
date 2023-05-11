import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<dynamic, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    if(data == null) {
      final arguments = (ModalRoute
          .of(context)
          ?.settings
          .arguments);

      if (arguments is Map<dynamic, dynamic>) {
        data = arguments;
      }
    }
    //String bgImage = (data?['isDayTime'] is bool && data!['isDayTime']) ? 'day.png' : 'night.png';
    //String bgImage = (data?['isDayTime'] ?? false) as bool ? 'day.png' : 'night.png';
    //String bgImage = (data?['isDayTime'] ?? false) ? 'day.png' : 'night.png';
    //String bgImage= data!['isDayTime']? 'day.png':'night.png';
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/replacement.png'),
            fit:BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/${data!['flag']}'),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Card(
              color: Colors.blueGrey[100],
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Location:',
                      style: TextStyle(
                        fontSize: 20,

                      ),
                    ),
                    Text('${data!['location']}',
                      style: const TextStyle(
                        fontSize: 45,
                        letterSpacing: 3.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),

                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Card(
              color: Colors.blueGrey[100],
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Time:',
                      style: TextStyle(
                        fontSize: 20,

                      ),
                    ),
                    Text('${data!['time']}',
                      style: const TextStyle(
                        fontSize: 45,
                        letterSpacing: 5.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),

                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton.icon(

                onPressed: ()async{
                 dynamic result = await Navigator.pushNamed(context, '/loc');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDayTime': result['isDayTime'],
                      'flag': result['flag'],

                    };
                  });
                 },
              label: const Text('Change Location'),
                icon: const Icon(Icons.location_searching),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
