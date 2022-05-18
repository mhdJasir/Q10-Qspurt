import 'package:flutter/material.dart';
import 'package:q10/Components/Functions.dart';

class HouseForm extends StatefulWidget {
  const HouseForm({Key key}) : super(key: key);

  @override
  _HouseFormState createState() => _HouseFormState();
}

class _HouseFormState extends State<HouseForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CloseButton(),
                  sbw(10),
                  Text('Price and other facilities'),
                ],
              ),
              Divider(),
              sbh(10),
              buildListTile('Price'),
              buildListTile('Square feet'),
              buildListTile('Square feet'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Checkbox(value: isFurnished, onChanged: (val){
                        isFurnished=val;
                        setState(() {});
                      }),
                     sbw(10),
                      Text("Furnished"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: !isFurnished, onChanged: (val){
                        isFurnished=!val;
                        setState(() {});
                      }),
                      sbw(10),
                      Text("Semi Furnished"),
                    ],
                  ),
                ],
              ),
              Divider(),
              buildListTile('Number of attached bathrooms'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Number of rooms"),
                  Text("Number of parking"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Power backup"),
                  Checkbox(value: powerBackup, onChanged: (val){
                    powerBackup=val;
                    setState(() {});
                  }),
                  Checkbox(value: !powerBackup, onChanged: (val){
                    powerBackup=!val;
                    setState(() {});
                  }),
                ],
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.all(20),
                height: 60,width: width(context),
                color: Colors.grey,
                child: Center(
                  child: Text("Next",style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
    );
  }
  bool powerBackup=true;
  bool isFurnished=true;
  Widget buildListTile(text){
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),
          Divider(),
          sbh(10),
        ],
      ),

    );
  }
}
