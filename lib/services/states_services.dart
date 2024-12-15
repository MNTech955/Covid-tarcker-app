import 'dart:convert';

import 'package:covid_tracker_app/model/world_states_model.dart';
import 'package:covid_tracker_app/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;


class StatesServices{
  Future<WorldStateModel> fetchWorldStatesRecord()async{
    final response=await http.get(Uri.parse(AppUrl.worldStateApi));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      return WorldStateModel.fromJson(data);

    }else{
      throw Exception("Error");

    }
    
  }
    Future<List<dynamic>> countriesListApi()async{
      var data;
    final response=await http.get(Uri.parse(AppUrl.countriesList));
     data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      return data;

    }else{
      throw Exception("Error");

    }
    
  }
}