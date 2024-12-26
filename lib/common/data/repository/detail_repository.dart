import 'package:archie/common/data/models/detail_model.dart';
import 'package:archie/common/data/services/detail_api_service.dart';

class DetailRepository {
  DetailRepository({required this.apiService});
  final DetailApiService apiService;

  Future<List<DetailModel>> getDetail(int userId) async {
    try {
      final detailjson = await apiService.fetchDetail(userId: userId);
      return detailjson
          .map((detailjson) => DetailModel.fromJson(detailjson))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
