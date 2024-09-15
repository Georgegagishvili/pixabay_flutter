import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm/src/features/exports.dart';
import 'package:stream_transform/stream_transform.dart';

const _galleryLimit = 20;
const debounceDuration = Duration(milliseconds: 200);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc({required this.galleryRepository}) : super(const GalleryState()) {
    on<GalleryFetched>(
      _onGalleryFetched,
      transformer: throttleDroppable(debounceDuration),
    );

    on<GalleryRefreshed>(
      _onGalleryRefreshed,
      transformer: throttleDroppable(debounceDuration),
    );
  }

  final GalleryRepository galleryRepository;

  Future<void> _onGalleryRefreshed(
      GalleryRefreshed event, Emitter<GalleryState> emit) async {
    try {
      emit(state.copyWith(status: GalleryStatus.initial));

      final gallery = await galleryRepository.fetchGallery();
      emit(
        state.copyWith(
          status: GalleryStatus.success,
          arts: gallery?.data,
          hasReachedMax: false,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: GalleryStatus.failure));
    }
  }

  Future<void> _onGalleryFetched(
      GalleryFetched event, Emitter<GalleryState> emit) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == GalleryStatus.initial) {
        final gallery = await galleryRepository.fetchGallery();
        return emit(
          state.copyWith(
            status: GalleryStatus.success,
            arts: gallery?.data,
            hasReachedMax: false,
          ),
        );
      }

      final gallery = await galleryRepository.fetchGallery(
        payload: GalleryPayload(
          page: state.arts.length ~/ _galleryLimit,
          perPage: _galleryLimit,
        ),
      );
      final data = gallery?.data ?? [];

      emit(
        data.isEmpty
            ? state.copyWith(hasReachedMax: true)
            : state.copyWith(
                status: GalleryStatus.success,
                arts: List.of(state.arts)..addAll(data),
                hasReachedMax: false,
              ),
      );
    } catch (_) {
      emit(state.copyWith(status: GalleryStatus.failure));
    }
  }
}
