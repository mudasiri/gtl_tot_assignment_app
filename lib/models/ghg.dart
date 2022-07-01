

import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../helpers/constants.dart';
import '../helpers/location.dart';

class gHG{
  var temp;
  var moist;

  gHG();

  Future<dynamic> getghgLatest(double lat, double lon) async{

    var url = Uri.parse('${kGHGBaseurl}');
   // var url = Uri.parse('${kGHGBaseurl}lat=$lat&lng=$lon');
    Map<String, String> header = {'Content-Type':'application/json','x-api-key':'$kAPIKey'} ;
    var response = await http.get(url,headers: header);

    if(response.statusCode == 200){

      var body = response.body;
      //print(body);
      var decoded = jsonDecode(body);
      /* var json = decoded[0];*/

      /* var sozlukanlam = json["anlamlarListe"][0]["anlam"];
      print(sozlukanlam);*/
      return decoded ;
    }
    else{

      return null;
    }
  }
}