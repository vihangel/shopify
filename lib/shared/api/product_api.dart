import 'dart:convert';

import 'package:http/http.dart';
import 'package:shopify/shared/utils/constants.dart';

class ProductApi {
  ProductApi();

  Future products({int limit = 30}) async {
    try {
      String url =
          '${Constants.URL}limit=$limit&access_token=${Constants.ACCESS_TOKEN}';
      final response = await get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
        // "Authorization": HttpUtils.getAuthorizationBasicOSB(),
      });

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print("Status code 200");
        return data;
      } else {
        print('products statusCode : ${response.statusCode} ${response.body}');
      }
    } catch (ex) {
      print('products exception : $ex');
    }
    return null;
  }
}
