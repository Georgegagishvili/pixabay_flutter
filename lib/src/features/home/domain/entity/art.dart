import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Art extends Equatable{
  final int id;
  final String image;
  final String previewImage;
  final String authorImage;
  final Size imageSize;
  final String imageType;
  final List<String> tags;
  final String author;
  final int views;
  final int likes;
  final int commentsAmount;
  final int favorites;
  final int downloads;

  const Art({
    required this.id,
    required this.image,
    required this.previewImage,
    required this.authorImage,
    required this.imageSize,
    required this.imageType,
    required this.tags,
    required this.author,
    required this.views,
    required this.likes,
    required this.commentsAmount,
    required this.favorites,
    required this.downloads,
  });

  factory Art.fromJson(Map<String, dynamic> json) {
    return Art(
      id: json['id'] as int,
      image: json['webformatURL'],
      authorImage: json['userImageURL'],
      previewImage: json['previewURL'],
      imageSize: Size(
        json['webformatWidth'].toDouble(),
        json['webformatHeight'].toDouble(),
      ),
      imageType: json['type'],
      tags: json['tags'].split(','),
      author: json['user'],
      views: json['views'] as int,
      likes: json['likes'] as int,
      commentsAmount: json['comments'] as int,
      favorites: json['collections'] as int,
      downloads: json['downloads'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'webformatURL': image,
      'userImageURL': authorImage,
      'previewURL': previewImage,
      'webformatWidth': imageSize.width,
      'webformatHeight': imageSize.height,
      'type': imageType,
      'tags': tags.join(','),
      'user': author,
      'views': views,
      'likes': likes,
      'comments': commentsAmount,
      'collections': favorites,
      'downloads': downloads,
    };
  }

  @override
  String toString() {
    return 'Art(id: $id, image: $image, imageSize: $imageSize, imageType: $imageType, tags: $tags, author: $author, views: $views, likes: $likes, commentsAmount: $commentsAmount, favorites: $favorites, downloads: $downloads)';
  }

  @override
  List<Object?> get props => [
    id,
    image,
    previewImage,
    authorImage,
    imageSize,
    imageType,
    tags,
    author,
    views,
    likes,
    commentsAmount,
    favorites,
    downloads,
  ];
}
