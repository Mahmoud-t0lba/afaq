import 'package:afaq/home.dart';
import 'package:afaq/wethar/blocs/weather/weather_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_repository/weather_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(
      WeatherApp(
        weatherRepository: WeatherRepository(
          apiKey: "f84c0cf53b69e3addc6d4e2349bcf5cf",
        ),
      ),
    ),
    storage: storage,
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key, required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository,
        super(key: key);

  final WeatherRepository _weatherRepository;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _weatherRepository,
      child: const WeatherAppView(),
    );
  }
}

class WeatherAppView extends StatelessWidget {
  const WeatherAppView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(
        weatherRepository: context.read<WeatherRepository>(),
      ),
      child:  const MaterialApp(
        locale: Locale('ar'),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
        // home: DateTime.now().isBefore(DateTime(2022, 3, 14))
        //     ? const WeatherPage()
        //     : MyHomePage(),
      ),
    );
  }
}
