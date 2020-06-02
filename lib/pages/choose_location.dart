import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List locations = [
    WorldTime(url:'Africa/Khartoum', location:'Khartoum', flag:'sudan.jpg'),
    WorldTime(url:'Africa/Cairo', location:'Cairo', flag:'egypt.png'),
    WorldTime(url:'Africa/Johannesburg', location:'Johannesburg', flag:'south-africa.png'),
    WorldTime(url:'Africa/Nairobi', location:'Nairobi', flag:'kenya.png'),
    WorldTime(url:'Europe/London', location:'London', flag:'united-kingdom.jpg'),
    WorldTime(url:'Europe/Amsterdam', location:'Amsterdam', flag:'netherlands.jpg'),
    WorldTime(url:'America/Toronto', location:'Toronto', flag:'canada.png'),
    WorldTime(url:'America/New_York', location:'New York', flag:'usa.png'),
    WorldTime(url:'Australia/Sydney', location:'Sydeny', flag:'australia.png'),
    WorldTime(url:'Asia/Seoul', location:'Seoul', flag:'south-korea.jpg'),
    WorldTime(url:'America/Sao_Paulo', location:'Sao Paulo', flag:'brazil.jpg'),
    WorldTime(url:'Europe/Madrid', location:'Madrid', flag:'spain.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                )
              ),
            ),
          );
        }
      ),
    );
  }
}
