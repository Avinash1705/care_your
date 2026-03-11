import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/foodScanner/presentation/bloc/food_bloc.dart';
import 'feature/foodScanner/presentation/pages/scanner_page.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<FoodBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AI Food Scanner',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const ScannerPage(),
      ),
    );
  }
}