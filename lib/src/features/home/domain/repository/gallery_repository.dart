import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/exports.dart';

abstract interface class GalleryRepository {
  Future<ApiResource<List<Art>>?> fetchGallery({GalleryPayload? payload});
}
