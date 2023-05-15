import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../model/WorldStateModel.dart';
import './utilities/url-app.dart';

class StatesServices {

  Future<WorldStateModel> fetchWorldStateRecords() async {
    Response response = await http.get(Uri.parse(AppUrl.woldState));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body.toString());
      return WorldStateModel.fromJson(data);
    }
    else{
      throw Exception('Error');
    }
  }
}