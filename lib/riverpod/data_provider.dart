import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/model.dart';
import '../network/api_service.dart';
import 'base_state.dart';
import 'data_notifier.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

final dataNotifierProvider = StateNotifierProvider<DataNotifier, DataState<ApiResponse>>((ref) {
  return DataNotifier(ref.read(apiServiceProvider));
});
