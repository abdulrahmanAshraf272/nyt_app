import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_app/core/constants/app_colors.dart';
import 'package:nyt_app/logic/cubit/articles_cubit.dart';
import 'package:nyt_app/presentation/widgets/articles_app_bar.dart';
import 'package:nyt_app/presentation/widgets/articles_error_view.dart';
import 'package:nyt_app/presentation/widgets/articles_list_view.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  void didChangeDependencies() {
    context.read<ArticlesCubit>().getMostViewedArticles();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ArticlesAppBar(),
        drawer: const Drawer(),
        body: BlocBuilder<ArticlesCubit, ArticlesState>(
            builder: (context, state) {
          if (state is ArticlesLoaded) {
            return ArticlesListView(articles: state.articles);
          } else if (state is ArticlesError) {
            return ArticlesErrorView(errorMessage: state.errorMessage);
          } else {
            return const Center(
                child: CircularProgressIndicator(color: AppColors.green));
          }
        }));
  }
}
