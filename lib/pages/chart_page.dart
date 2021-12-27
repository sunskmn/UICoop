import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Charts extends StatefulWidget {
  const Charts({Key? key}) : super(key: key);

  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  String dropdownValue = 'Day';
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40),
  ];
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Chart'),
          ),
        ),
        body: SafeArea(
          child: Container(
            child: Stack(
              children: <Widget>[
                Container(
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    // Chart title
                    // title: ChartTitle(text: 'Half yearly sales analysis'),
                    // Enable legend
                    // legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<_SalesData, String>>[
                      LineSeries<_SalesData, String>(
                          dataSource: data,
                          xValueMapper: (_SalesData sales, _) => sales.year,
                          yValueMapper: (_SalesData sales, _) => sales.sales,
                          name: 'Sales',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true))
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.topCenter,
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down_outlined),
                    iconSize: 36,
                    borderRadius: BorderRadius.circular(15),
                    elevation: 16,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                    underline: Container(
                      height: 1,
                      color: Colors.blue,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['Day', 'Month', 'Year']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}






//  DropdownButton<String>(
//           value: dropdownValue,
//           icon: const Icon(Icons.arrow_drop_down_outlined),
//           iconSize: 36,
//           borderRadius: BorderRadius.circular(15),
//           elevation: 16,
//           style: const TextStyle(
//               color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
//           underline: Container(
//             height: 1,
//             color: Colors.blue,
//           ),
//           onChanged: (String? newValue) {
//             setState(() {
//               dropdownValue = newValue!;
//             });
//           },
//           items: <String>['Day', 'Month', 'Year']
//               .map<DropdownMenuItem<String>>((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//         ),
       