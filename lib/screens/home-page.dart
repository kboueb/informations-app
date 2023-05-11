import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this
  )..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color> [
    Colors.red.shade900,
    Colors.blue.shade500,
    Colors.yellow.shade900,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .01,),
              const PieChart(
                dataMap: {
                  "Total" : 20,
                  "Recovered" : 15,
                  'Deaths' : 5
                },
                animationDuration: Duration(seconds: 2),
                chartType: ChartType.ring,
                chartRadius: 120,
                colorList: [
                  Colors.blue,
                  Colors.green,
                  Colors.red,

                ],

                // colorList: colorList,
              ),
            ],
          ),
        ),

      ),
    );
  }
}
