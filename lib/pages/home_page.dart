import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movieapp/controllers/movie_controller.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/repositories/movies_repository_imp.dart';
import 'package:movieapp/service/dio_service_imp.dart';
import 'package:movieapp/widgets/custom_list_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller =
      MovieController(MoviesRepositoryImp(DioServiceImp()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(28.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (__, movies, _) {
                  return Visibility(
                    visible: movies != null,
                    child: Text(
                      'Movies',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  );
                }),
            ValueListenableBuilder<Movies?>(
              valueListenable: _controller.movies,
              builder: (_, movies, __) {
                return movies != null
                    ? ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: movies.results.length,
                        itemBuilder: (_, index) =>
                            CustomListCardWidget(movie: movies.results[index]),
                        separatorBuilder: (_, __) => const Divider(),
                      )
                    : Lottie.asset('assets/lottie.json');
              },
            ),
          ],
        ),
      ),
    ));
  }
}
