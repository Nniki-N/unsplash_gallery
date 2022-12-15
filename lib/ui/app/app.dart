import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery/domain/cubits/photos_list_cubits.dart';
import 'package:unsplash_gallery/ui/navigation/navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigation = Navigation();

    return BlocProvider(
      create: (context) => PhotosListCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: navigation.routes,
        onGenerateRoute: navigation.onGenerateRoute,
        initialRoute: NavigationRoutesNames.galleryScreen,
      ),
    );
  }
}
