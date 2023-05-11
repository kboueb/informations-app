import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math'  as math;

import 'package:infos_app/screens/home-page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this
  )..repeat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: AnimatedBuilder(
                    animation: _controller,
                    child: const SizedBox(
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Image(image: AssetImage('images/virus.png')),
                      ),
                    ),
                    builder: (BuildContext context, Widget? child){
                      return Transform.rotate(
                          angle: _controller.value * 2.0 * math.pi,
                        child: child,
                      );
                    }
                ),
              ),
              const SizedBox(height: 40,),
              const Text('Tracking App', style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),)
            ],
          ),
      ),
    );
  }
}
