import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/models/url_response_model.dart';

class NetworkClass {
  final urlString = "https://reqres.in/api/users?page=1";
  Future<UrlApi>? callUrlData() async {
    var isCacheExists = await APICacheManager().isAPICacheKeyExist("CACHE_API");
    if (!isCacheExists) {
      var computerUrl = Uri.parse(urlString);
      final response = await http.get(computerUrl);
      if (response.statusCode == 200) {
        APICacheDBModel cacheDBModel =
            APICacheDBModel(key: "CACHE_API", syncData: response.body);
        await APICacheManager().addCacheData(cacheDBModel);
        print("From URL");
        return UrlApi.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    } else {
      var cacheData = await APICacheManager().getCacheData("CACHE_API");
        print("From Cache");

      return UrlApi.fromJson(jsonDecode(cacheData.syncData));
    }
  }
}
