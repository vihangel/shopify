import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopify/screens/home/home.dart';
import 'package:shopify/screens/home/home_controller.dart';
import 'package:shopify/screens/splash/splash_screen.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/home', child: (_, args) => const Home()),
    ChildRoute('/', child: (_, args) => const SplashScreen()),
  ];
}
