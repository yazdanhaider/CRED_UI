import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';

import '../model/model.dart';
import '../network/api_service.dart';
import 'base_state.dart';

class DataNotifier extends StateNotifier<DataState<ApiResponse>> {
  final ApiService apiService;

  DataNotifier(this.apiService) : super(DataState(status: DataStatus.loading));

  Future<void> fetchItems(String url) async {
    try {
      // Set state to Loading while fetching data
      state = DataState(status: DataStatus.loading);

      // Call the ApiService to fetch data
      final response = await apiService.fetchData(url: url);

      // Check if the status code is 200 (success)
      if (response.statusCode == 200) {
        // Decode the response body
        final data = json.decode(response.body);

        // Parse the data into ApiResponse model
        final apiResponse = ApiResponse.fromJson(data);
        state = DataState(status: DataStatus.success, data: apiResponse);
      } else {
        // Set state to error if status code is not 200
        state = DataState(
          status: DataStatus.error,
          message: 'Failed to load data. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      // Handle any errors during the fetch
      print(e);
      state = DataState(
        status: DataStatus.error,
        message: 'Failed to load data. Error: $e',
      );
    }
  }
}
