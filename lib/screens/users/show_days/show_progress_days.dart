import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduate/components/header.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/models/day_model.dart';
import 'package:graduate/models/programs_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ShowProgressDays extends StatefulWidget {
  const ShowProgressDays({super.key, required this.program, required this.days});

  final ProgramModel program;
  final List<DayModel> days;

  @override
  State<ShowProgressDays> createState() => _ShowProgressDaysState();
}

class _ShowProgressDaysState extends State<ShowProgressDays> {
  late List<_ChartData> data = [];
  late TooltipBehavior _tooltip;

  Future<double> getProgressDay(int idD) async {
    var response =
        await Dio().get('http://10.0.2.2:8000/api/days/showTotalSets', data: {
      'day_id': idD,
    });
    var total = response.data['totalSets'].toString();
    return double.parse(total);
  }

  @override
  void initState() {
    fetchData();
    super.initState();
    _tooltip = TooltipBehavior(enable: true);
  }

  Future<void> fetchData() async {
    List<_ChartData> chartData = [];
    for (var element in widget.days) {
      double totalSets = await getProgressDay(element.id);
      chartData.add(_ChartData(element.name, totalSets*10));
    }
    setState(() {
      data = chartData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 20, right: 8),
            child: Column(
              children: [
                Header(
                  'Program Progress',
                  rightSide: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      size: 35,
                      Icons.arrow_forward_ios_outlined,
                      color: baseColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 500,
                  child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    primaryXAxis: const CategoryAxis(),
                    primaryYAxis: const NumericAxis(
                        minimum: 0, maximum: 100, interval: 10),
                    tooltipBehavior: _tooltip,
                    series: <CartesianSeries<_ChartData, String>>[
                      ColumnSeries<_ChartData, String>(
                          dataSource: data,
                          xValueMapper: (_ChartData data, _) => data.x,
                          yValueMapper: (_ChartData data, _) => data.y,
                          name: 'Progress',
                          color: baseColor)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
