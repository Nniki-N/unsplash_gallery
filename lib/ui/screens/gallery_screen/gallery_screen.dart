import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery/domain/cubits/photos_list_cubits.dart';
import 'package:unsplash_gallery/domain/entity/unsplash_photo.dart';
import 'package:unsplash_gallery/ui/navigation/navigation.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final photosCubit = context.watch<PhotosListCubit>();
    final list = photosCubit.state;

    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final columnsCount = isPortrait ? 2 : 3;

    return Scaffold(
      body: GridView.builder(
        controller: photosCubit.scrollController,
        padding: const EdgeInsets.only(top: 35, left: 10, right: 10),
        itemBuilder: (context, index) {
          if (index < list.length) {
            return GalleryItem(unsplashPhoto: list[index]);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
        itemCount: list.length + columnsCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columnsCount,
          childAspectRatio: 5 / 6,
          crossAxisSpacing: 10,
        ),
      ),
    );
  }
}

class GalleryItem extends StatelessWidget {
  const GalleryItem({
    Key? key,
    required this.unsplashPhoto,
  }) : super(key: key);

  final UnsplashPhoto unsplashPhoto;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(NavigationRoutesNames.photoScreen,
            arguments: unsplashPhoto);
      },
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 5 / 4,
              child: Image.network(
                unsplashPhoto.urls.thumb,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            unsplashPhoto.description == null
                ? const SizedBox.shrink()
                : Text(
                    unsplashPhoto.description!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
            unsplashPhoto.description == null
                ? const SizedBox.shrink()
                : const SizedBox(height: 5),
            Text(
              'Author: ${unsplashPhoto.user.name}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey[850],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
