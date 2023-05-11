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
          padding: const EdgeInsets.all(20.0),
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
              const SizedBox(height: 50,),
              Card(
                child: Column(
                  children: [
                    ReusableRow(title: "Total", value: '20',),
                    Divider(height: 1, color: Colors.grey),
                    ReusableRow(title: "Total", value: '20',),
                    Divider(height: 1, color: Colors.grey),
                    ReusableRow(title: "Total", value: '20',),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green.shade700,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text('Track data'),
                ),
              ),

            ],
          ),
        ),

      ),
    );
  }
}



class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title),
              Text(value),
            ],
          ),
        ),
      ],
    );
  }
}