import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';
import 'package:toktik/shared/data/local_video_post.dart';

class VideoScrollableView extends StatelessWidget { 

  final List<VideoPost> videos;
  const VideoScrollableView({
    super.key,
    required this.videos
    });

  @override
  Widget build(BuildContext context) {
    //PageView: es un widget q nos permite hacer scroll a pantalla completa
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index)  {
        final VideoPost videoPosts = videos[index];

        return Stack(
          children: [
            //Video player + gradiente
            SizedBox.expand(
              child:FullScreenPlayer(
                caption: videoPosts.caption,
                videoUrl: videoPosts.videoUrl,
              )
              ),
            //buttons
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPosts),
            )
          ],
        );
      },
      // children: [
      //   Container(color: Colors.red),
      //   Container(color: Colors.blue),
      //   Container(color: Colors.amber),
      //   Container(color: Colors.deepPurple),
      //   Container(color: Colors.greenAccent),
      //   Container( color: Colors.brown)
      // ],
    );
  }
}

