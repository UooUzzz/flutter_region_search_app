

import 'package:flutter_region_search_app/data/repository/location_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  final locationRepo = LocationRepository();

  test('findByName test', () async {
    final result = await locationRepo.findByName('삼성동');
    expect(result.isEmpty, false);

    final result2 = await locationRepo.findByName('asd');
    expect(result2.isEmpty, true);
  });
}