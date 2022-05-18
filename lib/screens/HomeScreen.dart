import 'package:flutter/material.dart';
import 'package:q10/Components/Functions.dart';
import 'package:q10/Components/Loaders.dart';
import 'package:q10/Constants/Styles.dart';
import 'package:q10/Constants/icons.dart';
import 'package:q10/screens/GoogleMaps.dart';
import 'package:q10/screens/PriceRange.dart';
import 'package:q10/screens/itemForm/HouseForm.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool gridView=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: basicMargin,
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (c){
                          return PriceRange();
                        }));
                      },
                      child: Icon(
                        Icons.location_on_outlined,
                        size: 40,
                      ),
                    ),
                    sbw(10),
                    Container(
                      width: 200,
                      height: 70,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.search_outlined),
                        ),
                      ),
                    ),
                    sbw(20),
                    IconButton(
                      onPressed: ()async{
                        showLoading(context);
                        await Future.delayed(Duration(seconds: 3));
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (c){
                          return PriceRange();
                        }));
                      },
                      icon: Icon(
                        Icons.sort,
                        size: 40,
                      ),
                    )
                  ],
                ),
                sbh(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categories"),
                    imageIcon(grid,onTap: (){
                      if(!gridView) {
                        gridView = true;
                      }
                      else gridView=false;
                      setState(() {});
                    }),
                  ],
                ),
                Visibility(
                  visible: !gridView,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        category(house,"Villa"),
                        sbw(30),
                        category(shop,"Shop"),
                        sbw(30),
                        category(office,"Office"),
                        sbw(30),
                        category(land,"Land"),
                        sbw(30),
                        category(apartment,"Apartments"),
                        sbw(30),
                        category(office,"Office"),
                        sbw(30),
                        category(land,"Land"),
                        sbw(30),
                        category(apartment,"Apartments"),
                      ],
                    ),
                  ),
                ),
                sbh(20),
                Visibility(
                  visible: gridView,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    child: GridView.count(
                      shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 4,
                      children: [
                        category(house,"Villa",onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (c){
                            return GoogleMaps();
                          }));
                        }),
                        category(shop,"Shop"),
                        category(office,"Office"),
                        category(land,"Land"),
                        category(apartment,"Apartments"),
                        category(office,"Office"),
                        category(land,"Land"),
                        category(apartment,"Apartments"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (c){
              return HouseForm();
            }));
          }, label: Text("Form"),
        ),
      ),
    );
  }

  Widget category(image,text,{onTap}) {
    return Row(
      children: [
        Column(
          children: [
            GestureDetector(
                onTap: onTap,
                child: imageIcon(image)),
            Center(child: Text(text,style: TextStyle(fontSize: 11),))],
        ),
      ],
    );
  }
}
