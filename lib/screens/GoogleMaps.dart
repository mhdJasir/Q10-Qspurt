import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:q10/Components/Functions.dart';
import 'package:q10/Constants/Styles.dart';
import 'package:q10/Providers/MapProvider.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({Key key}) : super(key: key);

  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  Completer<GoogleMapController> _controller = Completer();

  MarkerId _id=MarkerId("test");
  Marker _marker;
  @override
  void initState() {
    getLatLong();
    super.initState();
  }
  String place=null;
  @override
  Widget build(BuildContext context) {
    final _provider=  Provider.of<MapProvider>(context, listen: false);
    return Scaffold(
      body: _position==null?Center(child: CircularProgressIndicator()):
      Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _position,
            markers: {_marker},
            mapType: MapType.normal,
            myLocationEnabled: true,
            onTap: (val)async{
              setMarker(val);
            place= await _provider.getAddress(val.latitude, val.longitude, context);
              setState(() {});
            },
            onCameraMove: (_position)async{
              _updatePosition(_position);
             place= await _provider.getAddress(_position.target.latitude, _position.target.longitude, context);
              setState(() {});
            },
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Visibility(
            visible: place!=null,
            child: Positioned(
              bottom: 0,left: 0,
                child: Container(
                  height: 100,width: width(context),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: width(context),
                        padding: basicPadding,
                        child: Text(place??"",style: TextStyle(
                          color: Colors.white70,fontSize: 16
                        ),),
                      )
                    ],
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }

  void _updatePosition(CameraPosition _position) {
      _marker = _marker.copyWith(
          positionParam: LatLng(_position.target.latitude, _position.target.longitude));
      setState(() {});
  }
  setMarker(LatLng val){
    Marker tappedMarker;
    MarkerId id=MarkerId("here");
    tappedMarker=Marker(
        position: LatLng(val.latitude,val.longitude), markerId: id,
        draggable: true,onDrag: (latLng){
      lat=latLng.latitude;
      long=latLng.longitude;
      setState(() {});
    }
    );
    _marker=tappedMarker;
    setState(() {});
  }
  var lat,long;
  CameraPosition _position;
  getLatLong()async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    lat=position.latitude;
    long=position.longitude;
    print(lat+long);
    _position=CameraPosition(target: LatLng(lat,long),zoom: 17);
    _marker=Marker(markerId: _id,position: LatLng(lat,long),draggable: true,onDrag: (latLng){
      lat=latLng.latitude;
      long=latLng.longitude;
      setState(() {});
    });
    setState(() {});
  }
}
