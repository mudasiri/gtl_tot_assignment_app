import 'package:agric_app_gtl_assignment/helpers/location.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/ghg.dart';
import '../models/soil.dart';


class HomePage extends StatefulWidget {

  const HomePage({Key? key, this.sdata, this.gdata}) : super(key: key);
 final gdata;
 final sdata;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late var moisture;
  late var temperature;
  late var ghgmessage ;
  late bool checkghgvalue = false;
  late String ozone;
  late String co2;
  late String ch4;
  late String watervapor;

  @override
  void initState() {
    super.initState();
    initUi(widget.gdata, widget.sdata);
  }

  void initUi(dynamic gdata, dynamic sdata){
    print(widget.gdata.runtimeType);
    setState(() {
      temperature = sdata['data'][0]['soil_temperature'];
      moisture = sdata['data'][0]['soil_moisture'];
      print(gdata['data'].toString() );
      if(gdata['data'].toString() == '[]'){
        checkghgvalue = true;
        ghgmessage = gdata['message'];

      }
      else{
       // print('Show the data');
         ozone = gdata['data'][0]['ozone']['value'];
        co2 = gdata['data'][0]['co2']['value'];
       ch4 = gdata['data'][0]['ch4']['value'];
         watervapor = gdata['data'][0]['water_vapor']['value'].toString();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soil and GHG APP'),
      ),
      body: Column(
        children: [
          SizedBox(height: 5,),
          Text('Soil Data' , style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Divider(thickness: 2,),
          Text('Current Soil Moisture is $moisture'),
          Text('Current Soil Temperature is $temperature'),
          Text('GHG Data', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(thickness: 2,),
          SizedBox(height: 5,),
          checkghgvalue ? noghgdata() : Column(
            children: [
              Text('Ozone: $ozone'),
              Text('Co2: $co2'),
              Text('Ch4: $ch4'),
              Text('Water Vapour: $watervapor'),
            ],
          ),
          SizedBox(height: 5,),
          ElevatedButton(onPressed: (){}, child: Text('View 7 Days Soil History'))
        ],
      ),
    );
  }

  Widget noghgdata(){

    return Text('No data');
}


}
