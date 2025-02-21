import 'package:nyt_app/core/network/api_result.dart';
import 'package:nyt_app/data/apis/articles_api_services.dart';
import 'package:nyt_app/data/models/article.dart';

class ArticlesRepo {
  final ArticlesApiServices articlesApiService;
  ArticlesRepo(this.articlesApiService);

  Future<ApiResult<List<Article>>> getMostViewedArticles() async {
    final apiResult = await articlesApiService.getMostViewedArticles();

    return apiResult.when(success: (rawArticles) {
      List<Article> articles =
          rawArticles.map((article) => Article.fromJson(article)).toList();
      return ApiResult.success(articles);
    }, failure: (failure) {
      return ApiResult.failure(failure);
    });
  }
}
