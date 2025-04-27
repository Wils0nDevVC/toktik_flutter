import 'package:flutter/cupertino.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repository/video_posts_repository.dart';
import 'package:toktik/infrestructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {

  //TODO: Repository, DataSource 
  final VideoPostsRepository videoPostsRepository;

  DiscoverProvider({
    required this.videoPostsRepository
  });

  bool initialLoadin = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    //simulamos un comunicación http asincrona
    //await Future.delayed(const Duration(seconds: 2));
   //todo: cargar videos
    // final List<VideoPost> newVideos = videoPosts.map(
    //   (video)=> LocalVideoModel.fromJson(video).toVideoPostEntity()).toList();

    final newVideos = await videoPostsRepository.getTrendingVideosByPage(1);
    
    videos.addAll(newVideos);
    initialLoadin = false;
    notifyListeners();
  }
  
}