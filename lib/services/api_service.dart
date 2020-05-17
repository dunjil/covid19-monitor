import 'dart:convert';

import 'package:http/http.dart' as _http;
import 'package:ncov19_app/models/cases.dart';
class APIService{
  static String url = "https://api.thevirustracker.com/free-api?global=stats";
  String token="732d6143-5b82-3e2e-8307-20c3a24194f9";
  Future<List<Results>> fetchData() async{
    _http.Response response = await _http.get(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
    var  data=jsonDecode(response.body);
      CasesModel cases=CasesModel.fromJson(data);
      print(cases.results.length);
      return cases.results;
    }
  }
}