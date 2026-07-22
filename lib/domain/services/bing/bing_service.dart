import 'package:dio/dio.dart';
import 'package:performance_online_system/core/errors/api_exception.dart';
import 'package:performance_online_system/core/networks/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bing_service.g.dart';

@riverpod
class BingService extends _$BingService {
  @override
  Future<String> build() async {
    final Dio dio = ref.read(dioProvider);

    try {
      final Response<Map<String, dynamic>> response = await dio.get<Map<String, dynamic>>(
        'https://www.bing.com/HPImageArchive.aspx',
        queryParameters: {
          'format': 'js',
          'idx': 0,
          'n': 1,
          'mkt': 'en-US',
        },
      );

      final Map<String, dynamic> json = response.data!;
      final images = json['images'] as List<dynamic>;
      final image = images.first as Map<String, dynamic>;

      return 'https://www.bing.com${image['url'] as String}';
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    } catch (_) {
      rethrow;
    }
  }
}
