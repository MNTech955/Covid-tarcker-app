import 'dart:async';

import 'package:covid_tracker_app/view/world_state.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  //_controller help us to controll our animation 
  late final AnimationController _controller=AnimationController(
    duration: Duration(seconds: 3),
    vsync: this
    )..repeat();
    @override
  void initState() {
    
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>WorldStateScreen()));

     });
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //why we used animated builder because i want ke mera ju covid logo hai hu rotate kare
            AnimatedBuilder(
              animation: _controller,
              child: Container(
                height: 200,
                width: 200,
                child: Center(
                  child: Image(
                    image: AssetImage('images/virus.png'),
                  ),
                ),
              ),
               builder: (BuildContext context, Widget? child){
                return Transform.rotate(
                  angle: _controller.value *2.0 * math.pi,
                  child: child,
                  
                  );
               }
               ),
               SizedBox(height: MediaQuery.of(context).size.height*.08,),
               Align(
                alignment: Alignment.center,
                 child: Text("Covid-19\nTracker App",
                 textAlign: TextAlign.center,
                 style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                 ), 
                 ),
               )
        
        
        
        
        
          ],
        ),
      ),
    );
  }
}