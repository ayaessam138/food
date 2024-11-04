import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/BlocObsever.dart';
import 'package:food/core/Layout.dart';
import 'package:food/core/colors.dart';

import 'package:food/core/increpted_Shared_perfence.dart';
import 'package:food/features/Login/persentation/Views/Login.dart';
import 'package:food/features/home/data/repo/home_Reo_Impl.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:food/features/home/persentation/controller/home_cubit.dart';
import 'package:food/firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Bloc.observer = MyBlocObserver();
//
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   await CacheHelperEncrypted.init();
//   runApp(
//     DevicePreview(
//       enabled: true,
//       builder: (context) => MyApp(), // Wrap your app
//     ),
//   );
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String? uid;
//   @override
//   void initState()  {
//     _loadUid();
//   }
//
//   Future<void> _loadUid() async {
//     uid = await SharedPreferenceValueEncrypted.getUid(); // Fetch the UID
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // print('object');
//     // print(SharedPreferenceValueEncrypted.getUid().then((uid) {
//     //   print('UID: $uid');
//     // }));
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (context) => HomeCubit(HomeReoImpl())..getItems())
//       ],
//       child: MaterialApp(
//           useInheritedMediaQuery: true,
//           locale: DevicePreview.locale(context),
//           builder: DevicePreview.appBuilder,
//           theme: ThemeData.light(),
//           darkTheme: ThemeData.dark(),
//           debugShowCheckedModeBanner: false,
//           home: uid == '' || FirebaseAuth.instance.currentUser == null
//               ? Login()
//               : AppLayout()),
//     );
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelperEncrypted.init();

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? uid;

  @override
  void initState() {
    super.initState();
    _loadUid();
  }

  Future<void> _loadUid() async {
    uid = await SharedPreferenceValueEncrypted.getUid();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          List<ConnectivityResult> connectivity,
          Widget child,
        ) {
          final bool connected =
              !connectivity.contains(ConnectivityResult.none);
          if (connected) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) => HomeCubit(HomeReoImpl())..getItems()),
              ],
              child: MaterialApp(
                useInheritedMediaQuery: true,
                locale: DevicePreview.locale(context),
                builder: DevicePreview.appBuilder,
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
                debugShowCheckedModeBanner: false,
                home: uid == '' || FirebaseAuth.instance.currentUser == null
                    ? Login()
                    : AppLayout(),
              ),
            );
          } else {
            return MaterialApp(
                useInheritedMediaQuery: true,
                locale: DevicePreview.locale(context),
                builder: DevicePreview.appBuilder,
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
                debugShowCheckedModeBanner: false,
                home: Scaffold(
                    body: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.signal_wifi_connected_no_internet_4,
                        color: AppColors.primary,
                      ),
                      const Text(
                        textAlign: TextAlign.center,
                        'Check your internet Connection Please,Try Again',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )));
          }
        },
        child: const SizedBox.shrink());
  }
}
