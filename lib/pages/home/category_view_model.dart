import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared_components/network/api_manager.dart';
import '../../model/articles_model.dart';

class CategoryViewModel extends Cubit<CategoryViewState> {
  CategoryViewModel() : super(LoadingState());

  void loadNewsSources(String category) async {
    try {
      var response = await ApiManager.fetchSources(category);
      if (response.status == "error") {
        emit(ErrorState(errorMessage: response.message));
      }
      if (response.status == "ok") {
        emit(SuccessState(response.sources!.cast<Source>()));
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

abstract class CategoryViewState {}

class LoadingState extends CategoryViewState {
  String? loadingMessage;

  LoadingState({this.loadingMessage});
}

class ErrorState extends CategoryViewState {
  String? errorMessage;
  Exception? exception;

  ErrorState({this.errorMessage, this.exception});
}

class SuccessState extends CategoryViewState {
  List<Source> sources;

  SuccessState(this.sources);
}
