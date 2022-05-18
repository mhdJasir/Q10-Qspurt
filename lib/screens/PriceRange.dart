import 'package:flutter/material.dart';
import 'package:q10/Constants/Styles.dart';

import '../Components/Functions.dart';

class PriceRange extends StatefulWidget {
  const PriceRange({Key key}) : super(key: key);

  @override
  _PriceRangeState createState() => _PriceRangeState();
}

class _PriceRangeState extends State<PriceRange> {
  RangeValues currentRangeValues =  RangeValues(1000, 15000);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: basicMargin,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              sbh(150),
              Text("Im Looking for Apartment"),
              sbh(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${currentRangeValues.start}'),
                  Text('${currentRangeValues.end}'),
                ],
              ),
          RangeSlider(
            values: currentRangeValues,
            min: 0,
            max: 100000,
            divisions: 5,
            labels: RangeLabels(
              currentRangeValues.start.round().toString(),
              currentRangeValues.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              currentRangeValues = values;
              setState(() { });
            },
          ),
            ],
          ),
        ),
      ),
    );
  }
}
