// To parse this JSON data, do
//
//     final videoPosts = videoPostsFromJson(jsonString);

import 'dart:convert';

import 'package:toktik/domain/entities/video_post.dart';

LocalVideoModel videoPostsFromJson(String str) => LocalVideoModel.fromJson(json.decode(str));

String videoPostsToJson(LocalVideoModel data) => json.encode(data.toJson());

class LocalVideoModel {
    final String name;
    final String videoUrl;
    final int likes;
    final int views;

    LocalVideoModel({
        required this.name,
        required this.videoUrl,
        required this.likes,
        required this.views,
    });

    factory LocalVideoModel.fromJson(Map<String, dynamic> json) => LocalVideoModel(
        name: json["name"] ?? 'No name',
        videoUrl: json["videoUrl"],
        likes: json["likes"],
        views: json["views"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "videoUrl": videoUrl,
        "likes": likes,
        "views": views,
    };

   VideoPost toVideoPostEntity() => VideoPost(
    caption: name,
    videoUrl: videoUrl,
    likes: likes,
    views: views
   );
}
