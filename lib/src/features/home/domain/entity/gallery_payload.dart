import 'package:equatable/equatable.dart';

enum ImageType {
  all,
  photo,
  illustration,
  vector,
}

class GalleryPayload extends Equatable {
  final String query;
  final ImageType imageType;
  final int page;
  final int perPage;

  const GalleryPayload({
    this.query = '',
    this.imageType = ImageType.photo,
    this.page = 1,
    this.perPage = 20,
  });

  Map<String, dynamic> toJson() {
    return {
      'query': query,
      'imageType': imageType.name,
      'page': page,
      'per_page': perPage,
    };
  }

  @override
  List<Object?> get props => [query, imageType, page, perPage];
}
