import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ruta/src/bloc/bloc/home_bloc_bloc.dart';
import 'package:flutter_ruta/src/screens/index.dart';
import 'package:flutter_ruta/src/services/notification_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => HomeBlocBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'MyRuta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (_) => const HomeScreen(),
        'detail': (_) => const DetalleScreen(),
        'ocio': (_) => const ServicioScreen(),
      },
    );
  }
}
