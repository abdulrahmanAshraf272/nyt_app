import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_app/logic/cubit/articles_cubit.dart';

class ArticlesErrorView extends StatelessWidget {
  final String errorMessage;
  const ArticlesErrorView({
    super.key,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, color: Colors.red, size: 50),
          const SizedBox(height: 10),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red, fontSize: 16),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () =>
                context.read<ArticlesCubit>().getMostViewedArticles(),
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }
}
