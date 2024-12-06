import 'dart:convert';

import 'package:flutter_region_search_app/data/model/location.dart';
import 'package:http/http.dart';

class LocationRepository {
  Future<List<Location>> searchLocation(String query) async {
    final client = Client();
    final response = await client.get(
      Uri.parse('https://openapi.naver.com/v1/search/local.json?query=$query'),
      headers: {
        'X-Naver-Client-Id': 'OqZwVS1YiHDn_0Tgjk0M',
        'X-Naver-Client-Secret': 'AnmZj3YNr1',
      },
    );
    // Get 요청시 성공 => 200
    // 응답코드가 200일때!
    // body 데이터를 jsonDecode 함수 사용해서 map으로 바꾼 후 List<Book> 로 반환
    if(response.statusCode == 200){
      Map<String, dynamic> map = jsonDecode(response.body);
      final items = List.from(map['items']);
      final iterable = items.map((e) {
        return Location.fromJson(e);
      }).toList();
      
      return iterable;
    }

    // 아닐땐 빈 리스트 반환
    return [];
  }
}
