import 'package:equatable/equatable.dart';

sealed class GalleryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class GalleryFetched extends GalleryEvent {}

final class GalleryRefreshed extends GalleryEvent {}

final class GallerySearch extends GalleryEvent {
  final String query;

  GallerySearch(this.query);

  @override
  List<Object> get props => [query];
}
