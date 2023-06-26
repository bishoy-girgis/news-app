import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared_components/network/api_manager.dart';

import '../../model/articles_model.dart';

class NewsListViewModel extends Cubit<NewsListViewState> {
  NewsListViewModel() : super(LoadingState(loadingMessage: "Loading ..."));

  void loadArticles(String sourceId) async {
    try {
      var response = await ApiManager.fetchArticles(source: sourceId);
      if (response.status == "error") {
        emit(ErrorState(errorMessage: response.message));
      }
      if (response.status == "ok") {
        emit(SuccessState(response.articles!));
      }
    } on TimeoutException catch (e) {
      emit(ErrorState(
          errorMessage:
              "couldn't reach to server \n please check your internet connection"));
    } on Exception catch (e) {
      emit(ErrorState(errorMessage: "please try again"));
    }
  }
}

abstract class NewsListViewState {}

class LoadingState extends NewsListViewState {
  String? loadingMessage;

  LoadingState({this.loadingMessage});
}

class ErrorState extends NewsListViewState {
  String? errorMessage;
  Exception? exception;

  ErrorState({this.errorMessage, this.exception});
}

class SuccessState extends NewsListViewState {
  List<Articles> articles;

  SuccessState(this.articles);
}
