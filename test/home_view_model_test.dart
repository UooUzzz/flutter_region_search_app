import 'package:flutter_region_search_app/ui/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('HomeViewModel test', () async {

    // 테스트 환경용(ProviderScope)
    final providerContainer = ProviderContainer();
    addTearDown(providerContainer.dispose);
    final homeVm = providerContainer.read(homeViewModelProvider.notifier);
    // 처음 HomeViewModel의 상태 => 빈 리스트 인걸 테스트
    final firstState = providerContainer.read(homeViewModelProvider);
    expect(firstState.locations.isEmpty, true);

    // HomeViewModel에서 searchBooks 메서드 호출 수 상태가 변경이 정상적으로 되는지 테스트
    await homeVm.searchLocation('samseong-dong');
    final afterState = providerContainer.read(homeViewModelProvider);
    expect(afterState.locations.isEmpty, false);

    afterState.locations.forEach((element) {
      print(element.toJson());
    });
  });
}