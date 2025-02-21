import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_app/core/dependency_injection.dart';
import 'package:nyt_app/core/routes/routes_names.dart';
import 'package:nyt_app/data/models/article.dart';
import 'package:nyt_app/logic/cubit/articles_cubit.dart';
import 'package:nyt_app/presentation/screens/article_details_screen.dart';
import 'package:nyt_app/presentation/screens/articles_screen.dart';

class AppRoutes {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.articlesScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ArticlesCubit(getit()),
                  child: const ArticlesScreen(),
                ));

      case RoutesNames.articleDetailsScreen:
        final argument = settings.arguments as Article;
        return MaterialPageRoute(
            builder: (context) => ArticleDetailsScreen(article: argument));

      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
