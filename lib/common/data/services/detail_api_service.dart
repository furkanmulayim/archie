import 'package:archie/common/data/services/api_constants.dart';
import 'package:dio/dio.dart';

class DetailApiService {
  final Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> fetchDetail({required int userId}) async {
    try {
      // API çağrısına userId sorgu parametresini ekleme
      final response = await _dio.get(
        ApiConstants.detailBaseUrl,
        queryParameters: {'userId': userId},
      );
      return List<Map<String, dynamic>>.from(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
