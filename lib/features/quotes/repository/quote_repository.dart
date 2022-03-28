import 'package:flutter_consume_api_bloc/models/quote_model.dart';
import 'package:flutter_consume_api_bloc/network/network_helper.dart';
import 'package:flutter_consume_api_bloc/network/network_service.dart';

class QuotesRepository {
  final String _baseUrl = "https://api.quotable.io/random";

  Future<QuoteModel> getQuote() async {
    final response = await NetworkService.sendRequest(
        requestType: RequestType.get, url: _baseUrl);

    return NetworkHelper.filterResponse(
        callBack: (json) => QuoteModel.fromJson(json),
        response: response,
        onFailureCallBackWithMessage: (errorType, msg) =>
        throw Exception('An Error has happened. $errorType - $msg'));
  }
}