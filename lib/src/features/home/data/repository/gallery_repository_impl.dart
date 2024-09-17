import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/exports.dart';

class GalleryRepositoryImpl implements GalleryRepository {
  GalleryRepositoryImpl({required this.client});

  final HttpService client;

  @override
  Future<ApiResource<List<Art>>?> fetchGallery(
      {GalleryPayload? payload}) async {
    try {
      final response = await client.get(
        '',
        queryParameters: {
          'q': payload?.query ?? 'cat',
          'image_type': payload?.imageType.name ?? ImageType.photo.name,
          'page': '${payload?.page ?? 1}',
          'per_page': '${payload?.perPage ?? 20}',
        },
      );

      if (response.statusCode == 200) {
        final data = response.data['hits'] as List;
        final arts = data.map((e) => Art.fromJson(e)).toList();
        return ApiResource.success(arts);
      }

      return ApiResource.error(response.data);
    } catch (e) {
      return ApiResource.error(e.toString());
    }
  }
}
