import 'package:agric_app_gtl_assignment/helpers/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/ghg.dart';
import '../models/soil.dart';
import 'home.dart';

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {
  soil soi = soil();
  gHG ghg = gHG();
  Location location = Location();
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async{
    var point = await location.getLocation();
    double lati = point.latitude;
    double longi = point.longitude;
    var soildata = await soi.getSoilLatest(lati,longi);
    var ghgdata = await ghg.getghgLatest(lati,longi);
    //print(soildata['data'][0]['soil_temperature']);
    //print(ghgdata);
    Fluttertoast.showToast(
        msg: 'Lat {$lati}',
        toastLength: Toast.LENGTH_LONG
    );
    Navigator.push(context, MaterialPageRoute(builder: (context) {

      return HomePage(sdata: soildata, gdata: ghgdata,);
    }
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPulse(
          size: 100,
          color: Colors.grey,
        ),
      ),
    );
  }

}

