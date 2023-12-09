import 'dart:convert';
import 'dart:developer';
import 'package:bharat_mandi/model/DataModelResponse.dart';
import 'package:bharat_mandi/services/api_constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<DataModelResponse?> getData() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.dataEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        DataModelResponse _dataModel = DataModelResponse.fromJson(jsonDecode(response.body));
            return _dataModel;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}