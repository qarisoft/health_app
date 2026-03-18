import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app/di.dart';
import 'package:health_app/features/doctor/data/providers/search_patient.dart';
import 'package:health_app/shared/ex.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_dugs.freezed.dart';
part 'search_dugs.g.dart';

@freezed
abstract class SearchDrugsState with _$SearchDrugsState {
  const factory SearchDrugsState({
    @Default([]) List<MedicationSearchResult> drugs,
    @Default(false) bool isLoading,
    String? error,
  }) = _SearchDrugsState;
}

@riverpod
class SearchDrugs extends _$SearchDrugs {
  CancelToken? _cancelToken;

  @override
  SearchDrugsState build() {
    ref.cacheTheState();
    // Initial state: empty list, not loading, no errors
    return const SearchDrugsState();
  }

  Future<void> search(String name) async {
    _cancelToken?.cancel('New search started');
    _cancelToken = CancelToken();

    if (name.trim().isEmpty) {
      // Clear everything if the search box is empty
      // state = const SearchDrugsState();
      return;
    }

    // THE MAGIC: Set loading to true, but KEEP the existing drugs list
    // using the Freezed .copyWith() method!
    state = state.copyWith(isLoading: true, error: null);

    try {
      // Debounce to prevent spamming the server
      await Future.delayed(const Duration(milliseconds: 300));
      if (_cancelToken!.isCancelled) return;

      final res = await getDio.get(
        '/Pharmacist/search-drugs',
        queryParameters: {'query': name},
        cancelToken: _cancelToken,
      );

      final data = res.data;
      if (data is List) {
        final results = data
            .map((s) => MedicationSearchResult.fromJson(s))
            .toList();

        // Update with the fresh data and turn off the loading flag
        state = state.copyWith(drugs: results, isLoading: false);
      }
    } on DioException catch (e) {
      if (CancelToken.isCancel(e)) {
        // Quietly exit if cancelled by the user typing more letters
        return;
      }

      // If a real network error happens, turn off loading, show the error,
      // but KEEP the previous drugs on the screen!
      state = state.copyWith(
        isLoading: false,
        error: e.message ?? 'Connection error',
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
