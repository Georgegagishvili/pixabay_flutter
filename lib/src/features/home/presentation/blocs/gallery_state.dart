import 'package:equatable/equatable.dart';
import 'package:mvvm/src/features/exports.dart';

enum GalleryStatus { initial, success, failure }

final class GalleryState extends Equatable {
  final GalleryStatus status;
  final List<Art> arts;
  final bool hasReachedMax;

  const GalleryState({
    this.status = GalleryStatus.initial,
    this.arts = const <Art>[],
    this.hasReachedMax = false,
  });

  GalleryState copyWith({
    GalleryStatus? status,
    List<Art>? arts,
    bool? hasReachedMax,
  }) {
    return GalleryState(
      status: status ?? this.status,
      arts: arts ?? this.arts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, arts, hasReachedMax];

  @override
  String toString() {
    return 'GalleryState { status: $status, hasReachedMax: $hasReachedMax, arts: ${arts.length} }';
  }
}