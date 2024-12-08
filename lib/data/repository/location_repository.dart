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

  Future<List<Location>> findByName(String query) async {
    try {
      final response = await _client.get(
        'https://openapi.naver.com/v1/search/local.json',
        queryParameters: {
          'query': query,
          'display': 5,
        },
        options: Options(
          headers: {
            'X-Naver-Client-Id': 'OqZwVS1YiHDn_0Tgjk0M',
            'X-Naver-Client-Secret': 'AnmZj3YNr1',
          },
        ),
      );
      if (response.statusCode == 200) {
        // response > result > items >> title
        final items = response.data['items'];
        return (items as List).map((item) => Location.fromJson(item)).toList();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
