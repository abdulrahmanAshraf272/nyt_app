import 'package:get_it/get_it.dart';
import 'package:nyt_app/data/apis/articles_api_services.dart';
import 'package:nyt_app/data/repositories/articles_repo_imp.dart';
import 'package:nyt_app/logic/cubit/articles_cubit.dart';

final getit = GetIt.instance;

Future<void> setupGetIt() async {
  getit.registerLazySingleton<ArticlesApiServices>(() => ArticlesApiServices());
  getit.registerLazySingleton<ArticlesRepo>(() => ArticlesRepo(getit()));
  getit.registerLazySingleton<ArticlesCubit>(() => ArticlesCubit(getit()));
}
