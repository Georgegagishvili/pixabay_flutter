import 'package:equatable/equatable.dart';
import 'package:mvvm/src/features/exports.dart';

enum GalleryStatus { initial, success, failure }

final class GalleryState extends Equatable {
  final GalleryStatus status;
  final List<Art> arts;
  final bool hasReachedMax;
  final String query;

  const GalleryState({
    this.status = GalleryStatus.initial,
    this.arts = const <Art>[],
    this.hasReachedMax = false,
    this.query = '',
  });

  GalleryState copyWith({
    GalleryStatus? status,
    List<Art>? arts,
    bool? hasReachedMax,
    String? query,
  }) {
    return GalleryState(
      status: status ?? this.status,
      arts: arts ?? this.arts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      query: query ?? this.query,
    );
  }

  @override
  List<Object> get props => [status, arts, hasReachedMax, query];

  @override
  String toString() {
    return 'GalleryState { status: $status, hasReachedMax: $hasReachedMax, arts: ${arts.length}, query: $query }';
  }
}