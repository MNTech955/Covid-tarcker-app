import 'package:covid_tracker_app/view/world_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsScreen extends StatefulWidget {
 int  totalCases,totalDeaths, totalRecovered,critical,todayRecovered,test, active;
 String name, image;

  
 DetailsScreen({super.key, 
  required this.active,
  required this.critical,
  required this.image,
  required this.name,
  required this.test, 
  required this.todayRecovered,
  required this.totalCases,
  required this.totalDeaths,
  required this.totalRecovered
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*.067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*.07,),
                      ReusableRow(title: "Cases", value: widget.totalCases.toString()),
                      ReusableRow(title: "TotalRecovered", value: widget.totalRecovered.toString()),
                      ReusableRow(title: "Deaths", value: widget.totalDeaths.toString()),
                      ReusableRow(title: "Critical", value: widget.critical.toString()),
                      ReusableRow(title: "TodayRecovered", value: widget.todayRecovered.toString()),
                      ReusableRow(title: "Tests", value: widget.test.toString()),
                      ReusableRow(title: "active", value: widget.active.toString()),
                      
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}