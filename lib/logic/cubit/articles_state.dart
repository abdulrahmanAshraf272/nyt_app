part of 'articles_cubit.dart';

@immutable
sealed class ArticlesState {}

final class ArticlesInitial extends ArticlesState {}

final class ArticlesLoading extends ArticlesState {}

final class ArticlesLoaded extends ArticlesState {
  final bool isSearching;
  final List<Article> articles;
  ArticlesLoaded(this.articles, {this.isSearching = false});
}

final class ArticlesError extends ArticlesState {
  final String errorMessage;
  ArticlesError(this.errorMessage);
}
