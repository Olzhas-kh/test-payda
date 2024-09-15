import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_payda/core/get_it/injection_container.dart';
import 'package:test_payda/core/routes/app_router.dart';
import 'package:test_payda/feature/post_detail/logic/bloc/detail_bloc_bloc.dart';
import 'package:test_payda/feature/posts/logic/bloc/posts_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  
  runApp(const MyApp(
  ));
}

class MyApp extends StatelessWidget {

  const MyApp({super.key, });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostsBloc>(
          create: (_) => sl(),
        ),
        BlocProvider<DetailBloc>(
          create: (_) => sl(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.indigo,
          scaffoldBackgroundColor: Colors.white,
          buttonTheme: const ButtonThemeData(
            buttonColor: Colors.indigo,
            textTheme: ButtonTextTheme.primary,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.black87),
            bodyMedium: TextStyle(color: Colors.black87),
            labelLarge: TextStyle(color: Colors.black87),
            labelMedium: TextStyle(color: Colors.black87),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.indigo),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
        darkTheme: ThemeData.dark().copyWith(
          primaryColor: Colors.indigo,
          scaffoldBackgroundColor: Colors.black,
          buttonTheme: const ButtonThemeData(
            buttonColor: Colors.indigo,
            textTheme: ButtonTextTheme.primary,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white70),
            bodyMedium: TextStyle(color: Colors.white70),
            labelLarge: TextStyle(color: Colors.white70),
            labelMedium: TextStyle(color: Colors.white70),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            fillColor: Colors.grey,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.indigo),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
        themeMode: ThemeMode.dark,
        routerConfig: AppRouter().config(),
      ),
    );
  }
}
