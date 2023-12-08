import 'dart:convert';

import 'package:advice_app/core/constants/constants.dart';
import 'package:advice_app/core/error/exception.dart';
import 'package:advice_app/data/models/slip_model.dart';
import 'package:http/http.dart' as http;

abstract class AdviceSlipRemoteDataSource{

  Future<SlipModel> getSlip(int slipId);
}

class AdviceSlipRemoteDataSourceImpl extends AdviceSlipRemoteDataSource{
  final http.Client client;
  AdviceSlipRemoteDataSourceImpl({required this.client});

  @override
  Future<SlipModel> getSlip (int slipId) async {
    final response = await client.get(Uri.parse(Urls.currentAdviceById(slipId)));

    if (response.statusCode == 200) {
      return SlipModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
  
}