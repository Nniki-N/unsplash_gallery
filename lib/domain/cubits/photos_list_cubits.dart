import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery/domain/clients/photo_api_client.dart';
import 'package:unsplash_gallery/domain/entity/unsplash_photo.dart';

class PhotosListCubit extends Cubit<List<UnsplashPhoto>> {
  final _photoApiClient = PhotoApiClient();

  final _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  int page = 1;

  PhotosListCubit() : super(<UnsplashPhoto>[]) {
    _initialize();

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        loadPhotos();
      }
    });
  }

  Future<void> _initialize() async {
    final list = await _photoApiClient.fetchImages(page: page);
    emit(list);
  }

  Future<void> loadPhotos() async {
    page += 1;

    final newState = state.toList();
    newState.addAll(await _photoApiClient.fetchImages(page: page));

    emit(newState);
  }
}