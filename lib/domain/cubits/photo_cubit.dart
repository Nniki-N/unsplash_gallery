import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery/domain/entity/unsplash_photo.dart';

class PhotoCubit extends Cubit<UnsplashPhoto> {
  late final Image _photoNetwork;
  ImageStream? _photoStream;
  late ImageStreamListener _photoStreamListener;
  bool _loading = true;

  Image get photoNetwork => _photoNetwork;
  bool get loading => _loading;

  PhotoCubit({required UnsplashPhoto unsplashPhoto}) : super(unsplashPhoto) {
    _photoNetwork = Image.network(unsplashPhoto.urls.full);

    _photoStream = _photoNetwork.image.resolve(const ImageConfiguration());
    _photoStreamListener = ImageStreamListener(
      (info, call) {
        _loading = false;
        emit(state);
      },
    );

    _photoStream?.addListener(_photoStreamListener);
  }

  @override
  Future<void> close() {
    _photoStream?.removeListener(_photoStreamListener);
    return super.close();
  }
}
