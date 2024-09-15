import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/exports.dart';

class MockGalleryRepository extends Mock implements GalleryRepository {}

class MockHttpClient extends Mock implements HttpService {}

void main() {
  final Map<String, dynamic> pixabayRes = {
    'id': 7679117,
    'pageURL':
        'https://pixabay.com/photos/flower-stamens-hypericum-macro-7679117/',
    'type': 'photo',
    'tags': 'flower, beautiful flowers, stamens',
    'previewURL':
        'https://cdn.pixabay.com/photo/2022/12/26/13/50/flower-7679117_150.jpg',
    'previewWidth': 150,
    'previewHeight': 100,
    'webformatURL':
        'https://pixabay.com/get/gbb1939144c4c0a2601ea31e6c4dff014e4c6374ef38e80aafa33308b4c540b81997686e59671005e457f0ce6b0b1b0a1981af505da852c714a6c93dda688d3d4_640.jpg',
    'webformatWidth': 640,
    'webformatHeight': 427,
    'largeImageURL':
        'https://pixabay.com/get/ga416bc2fa595963b4520a65bf41cc1eb555f28d26dad8fee53c453d0aa3e318d02c68b5a07944c169a2ad08f97184ce7dd741fdd6bcfdefc158b7cda810d0027_1280.jpg',
    'imageWidth': 6000,
    'imageHeight': 4000,
    'imageSize': 8137356,
    'views': 23149,
    'downloads': 17587,
    'collections': 50,
    'likes': 116,
    'comments': 19,
    'user_id': 4379051,
    'user': 'Alfred_Grupstra',
    'userImageURL':
        'https://cdn.pixabay.com/user/2024/08/25/22-05-08-334_250x250.jpg'
  };

  group(GalleryBloc, () {
    late GalleryBloc galleryBloc;

    setUp(() {
      galleryBloc = GalleryBloc(
        galleryRepository: MockGalleryRepository(),
      );
    });

    test('initial state is GalleryInitial', () {
      expect(galleryBloc.state, const GalleryState());
    });

    test('emits [GallerySuccess] when GalleryFetched is added', () {
      galleryBloc.add(GalleryFetched());

      final gallery = Art.fromJson(pixabayRes);
      when(() => galleryBloc.galleryRepository.fetchGallery())
          .thenAnswer((_) async => ApiResource<List<Art>>.success([gallery]));

      final expected = [
        GalleryState(
          status: GalleryStatus.success,
          arts: [gallery],
          hasReachedMax: false,
          query: '',
        ),
      ];
      expectLater(galleryBloc.stream, emitsInOrder(expected));
    });

    test('emits [GallerySuccess] when GallerySearched is added', () {
      galleryBloc.add(GallerySearch('flower'));

      final gallery = Art.fromJson(pixabayRes);
      when(() => galleryBloc.galleryRepository.fetchGallery(
            payload: const GalleryPayload(query: 'flower'),
          )).thenAnswer((_) async => ApiResource<List<Art>>.success([gallery]));

      final expected = [
        const GalleryState(
          status: GalleryStatus.initial,
          arts: [],
          hasReachedMax: false,
          query: '',
        ),
        GalleryState(
          status: GalleryStatus.success,
          arts: [gallery],
          hasReachedMax: false,
          query: 'flower',
        ),
      ];
      expectLater(galleryBloc.stream, emitsInOrder(expected));
    });

    test('emits [GalleryFailure] when GalleryFetched is added and fails', () {
      galleryBloc.add(GalleryFetched());

      when(() => galleryBloc.galleryRepository.fetchGallery())
          .thenAnswer((_) async => ApiResource<List<Art>>.error('error'));

      final expected = [
        const GalleryState(
          status: GalleryStatus.failure,
          arts: [],
          hasReachedMax: false,
          query: '',
        ),
      ];
      expectLater(galleryBloc.stream, emitsInOrder(expected));
    });
  });
}
