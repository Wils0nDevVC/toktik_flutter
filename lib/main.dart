import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/infrestructure/datasource/local_video_posts_datasource_impl.dart';
import 'package:toktik/infrestructure/repository/video_posts_repository_impl.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
 

  const MyApp({
    super.key
    });

  @override
  Widget build(BuildContext context) {

     final videoPostsRepository = VideoPostsRepositoryImpl(
      videoPostsDatasource: LocalVideoPostsDatasource());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          //lazy: false si queremos que el constructor se lanse cuando referenciamos a DiscoverProvider
          //Es decir se cree la instancia y que ya este lista
          //Esto es conveniente cuando saben que el usuario llegara ahí pero
          //despues de hacer una funcionalidad asincrona
          lazy: false,
         //..loadNextPage() : ".." operador de cascada
          create:(_) => DiscoverProvider(videoPostsRepository : videoPostsRepository)..loadNextPage()
          )
      ],
      child: MaterialApp(
        title: 'TokTik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home:const DiscoverScreen()
      ),
    );
  }
}