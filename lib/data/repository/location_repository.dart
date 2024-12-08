import 'package:dio/dio.dart';
import 'package:flutter_region_search_app/data/model/location.dart';

class LocationRepository {
  final Dio _client = Dio(BaseOptions(
    validateStatus: (status) => true, // 설정안하면 실패함
  ));

// https://api.vworld.kr/req/search
// request=search
// key=13F2292F-8ECD-3502-827E-073057EAD096
// query=삼성동
// type=DISTRICT
// category=L4

  Future<List<String>> findByName(String query) async {
    try {
      final response = await _client.get(
        'https://api.vworld.kr/req/search',
        queryParameters: {
          'request': 'search',
          'key': '13F2292F-8ECD-3502-827E-073057EAD096',
          'query': query,
          'type': 'DISTRICT',
          'category': 'L4',
        },
      );
      if (response.statusCode == 200 &&
          response.data['response']['status'] == 'OK') {
        // response > result > items >> title
        final items = response.data['response']['result']['items'];
        final itemList = List.from(items);
        final iterable = itemList.map((item) {
          // return '${item['title']}';
          return itemList.map((item) => Location.fromJson(item)).toList();
        });
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
