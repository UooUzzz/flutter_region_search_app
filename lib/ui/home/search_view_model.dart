import 'package:flutter_region_search_app/data/model/location.dart';
import 'package:flutter_region_search_app/data/repository/location_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 상태 클래스 만들기
// List<String>

// 2. 뷰모델 만들기 - Notifier 상속
class SearchViewModel extends AutoDisposeNotifier<List<Location>> {
  @override
  List<Location> build() {
    return [];
  }

  final locationRepository = LocationRepository();

  Future<void> searchByName(String query) async {
    final result = await locationRepository.findByName(query);
    state = result;
  }
}

// 3. 뷰모델 관리자 만들기 - NotifierProvider 객체
final searchViewModelProvider =
    NotifierProvider.autoDispose<SearchViewModel, List<Location>>(() {
  return SearchViewModel();
});
