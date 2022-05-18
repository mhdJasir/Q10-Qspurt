import 'package:flutter/material.dart';

sbh(double height) => SizedBox(height: height);

sbw(double width) => SizedBox(width: width);

height(context) => MediaQuery.of(context).size.height;

width(context) => MediaQuery.of(context).size.width;

Widget imageIcon(icon, {onTap}) {
  return Column(
    children: [
      GestureDetector(
        onTap: onTap,
        child: Image.asset(
          icon,
          height: 40,
          width: 40,
        ),
      ),
      sbh(10),
    ],
  );
}

RangeValues currentRangeValues = RangeValues(1000, 15000);

class PriceRangePicker extends StatefulWidget {
  const PriceRangePicker({Key key}) : super(key: key);

  @override
  State<PriceRangePicker> createState() => _PriceRangePickerState();
}

class _PriceRangePickerState extends State<PriceRangePicker> {
  @override
  void initState() {
    currentRangeValues = RangeValues(1000, 15000);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
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
        setState(() {});
      },
    );
  }
}
