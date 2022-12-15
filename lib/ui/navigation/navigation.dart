import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery/domain/cubits/photo_cubit.dart';
import 'package:unsplash_gallery/domain/entity/unsplash_photo.dart';
import 'package:unsplash_gallery/ui/screens/error_screen/error_screen.dart';
import 'package:unsplash_gallery/ui/screens/gallery_screen/gallery_screen.dart';
import 'package:unsplash_gallery/ui/screens/photo_screen/photo_screen.dart';

class NavigationRoutesNames {
  static const galleryScreen = '/gallery';
  static const errorScreen = '/error';
  static const photoScreen = '/gallery/photo';
}

class Navigation {
  final routes = <String, Widget Function(BuildContext)>{
    NavigationRoutesNames.galleryScreen: (context) => const GalleryScreen(),
    NavigationRoutesNames.errorScreen: (context) => const ErrorScreen(),
  };

  Route<Object>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationRoutesNames.photoScreen:
        final unsplashPhoto = settings.arguments as UnsplashPhoto;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => PhotoCubit(unsplashPhoto: unsplashPhoto),
            child: const PhotoScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorScreen(),
        );
    }
  }
}
