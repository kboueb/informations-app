import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../model/WorldStateModel.dart';
import '../services/states_services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'countries-list.dart';

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
    StatesServices statesServices = StatesServices();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .01,),
              FutureBuilder(
                future: statesServices.fetchWorldStateRecords(),
                builder: (context , AsyncSnapshot<WorldStateModel> snapshot){
                  if(snapshot.hasData){
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            "Total de cas" : double.parse(snapshot.data!.cases!.toString()),
                            "Rétablis" : double.parse(snapshot.data!.recovered!.toString()),
                            'Morts' : double.parse(snapshot.data!.deaths!.toString())
                          },
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true,
                          ),
                          animationDuration: const Duration(seconds: 2),
                          chartType: ChartType.ring,
                          chartRadius: 120,
                          colorList: const [
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
                              ReusableRow(title: "Total de cas", value: snapshot.data!.cases!.toString(),),
                              Divider(height: 1, color: Colors.grey),
                              ReusableRow(title: "Rétablis", value: snapshot.data!.recovered!.toString(),),
                              Divider(height: 1, color: Colors.grey),
                              ReusableRow(title: "Morts", value: snapshot.data!.deaths!.toString(),),
                              Divider(height: 1, color: Colors.grey),
                              ReusableRow(title: "Nbre cas aujourd'hui", value: snapshot.data!.todayCases!.toString(),),
                              Divider(height: 1, color: Colors.grey),
                              ReusableRow(title: "Morts aujourd'hui", value: snapshot.data!.todayDeaths!.toString(),),
                              Divider(height: 1, color: Colors.grey),
                              ReusableRow(title: "Rétablis aujourd'hui", value: snapshot.data!.todayRecovered!.toString(),),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30,),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> CountriesList()));
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: Text('Tracker les données'),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  else{
                    return Expanded(
                      child: SpinKitFadingCircle(
                        controller: _controller,
                        size: 50,
                        color: Colors.white,
                      ),
                    );
                  }
                },
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