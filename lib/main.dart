import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/logic/blocs/news/news_bloc.dart';
import 'package:newsapp/presentation/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News App',
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Monstreat',
            primarySwatch: Colors.blue,
          ),
          home: HomeView()),
    );
  }
}
