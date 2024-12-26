import 'package:archie/common/data/services/api_constants.dart';
import 'package:dio/dio.dart';

class UserApiService {
  final Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> fetchUsers() async {
    try {
      final response = await _dio.get('${ApiConstants.usersBaseUrl}');
      return List<Map<String, dynamic>>.from(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
