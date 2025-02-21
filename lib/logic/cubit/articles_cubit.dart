import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nyt_app/core/network/network_exceptions.dart';
import 'package:nyt_app/data/models/article.dart';
import 'package:nyt_app/data/repositories/articles_repo_imp.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  final ArticlesRepo articlesRepo;
  final TextEditingController textEditingController = TextEditingController();
  List<Article> allArticles = [];
  ArticlesCubit(this.articlesRepo) : super(ArticlesInitial());

  getMostViewedArticles() async {
    emit(ArticlesLoading());

    final result = await articlesRepo.getMostViewedArticles();

    result.when(
      success: (articles) {
        allArticles = articles;
        emit(ArticlesLoaded(allArticles));
      },
      failure: (error) =>
          emit(ArticlesError(NetworkExceptions.getErrorMessage(error))),
    );
  }

  startSearch() {
    emit(ArticlesLoaded(allArticles, isSearching: true));
  }

  stopSearch() {
    textEditingController.clear();
    emit(ArticlesLoaded(allArticles, isSearching: false));
  }

  searchArticles(String query) {
    if (query.isEmpty) {
      emit(ArticlesLoaded(allArticles, isSearching: true));
    } else {
      final filteredArticles = allArticles
          .where((article) =>
              article.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(ArticlesLoaded(filteredArticles, isSearching: true));
    }
  }
}
