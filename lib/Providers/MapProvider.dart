import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var apiKey='AIzaSyDDN38H0d7sTuQNmi8pfst27a0OG8S5dbo';


class MapProvider extends ChangeNotifier{
  getAddress(lat,lng,context)async{
    final queryParameters = {
      'key': '',
      'latlng':"$lat,$lng"
    };
    final uri = Uri.https('maps.googleapis.com', '/maps/api/geocode/json', queryParameters);
    var response=await http.get(uri);
    var address;
    if(response.statusCode==200){
      var data=json.decode(response.body);
      print(data['status']);
      print("$lat,$lng");
      if(data['status']=="OK"){
     address= data['results'][1]['formatted_address'];
    var placeId= data['results'][1]['place_id'];
      }
      else {
        // Scaffold.of(context).showSnackBar(SnackBar(content: Text('something went wrong')));
      }
    }
    else {
      // Scaffold.of(context).showSnackBar(
      //     SnackBar(content: Text('something went wrong')));
    }
    notifyListeners();
    return address;
  }
}


