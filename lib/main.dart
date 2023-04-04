import 'package:flutter/material.dart';
import 'package:newsapp/product/router/approuter.dart';
import 'package:newsapp/product/theme/my_theme.dart';

void main() {
  runApp(const App());
}

final appRouter = AppRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.config(),

      // routerDelegate: appRouter.delegate(),
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: AppTheme.lightTheme,
      // theme: ThemeData(
      //   useMaterial3: true,
      //   fontFamily: 'Monstreat',
      //   primarySwatch: Colors.blue,
      // ),
      // home: HomeView()
    );
  }
}
