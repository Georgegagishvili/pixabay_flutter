import 'package:equatable/equatable.dart';

sealed class GalleryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class GalleryFetched extends GalleryEvent {}

final class GalleryRefreshed extends GalleryEvent {}
