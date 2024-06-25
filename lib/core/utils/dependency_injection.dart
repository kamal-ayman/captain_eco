import 'package:captain_eco/core/network/api_service.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:captain_eco/core/utils/shared_preferences.dart';
import 'package:get_it/get_it.dart';

import '../translations/appLanguage.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init () {
    // shared preferences
    sl.registerLazySingleton<MySharedPreferences>(() => MySharedPreferences());
    sl.registerLazySingleton<AppLanguage>(() => AppLanguage());
    // web services
    sl.registerLazySingleton<ApiService>(() => ApiServiceImp());
    // login
    // sl.registerLazySingleton<LoginRepo>(() => LoginRepo(sl()));
      // // otp
      // sl.registerLazySingleton<OTPRepo>(() => OTPRepo(sl()));
      // // profile
      // sl.registerLazySingleton<ProfileRepo>(() => ProfileRepo(sl()));
      //
      // sl.registerLazySingleton<AccountRepo>(() => AccountRepo(sl()));
  }
}

// Future<void> setupGetIt() async {
//   // setup language
//
//   // firebase
//   // getIt.registerLazySingleton<FirebaseAuth>(
//   //   () => FirebaseAuth.instance,
//   // );
//   // getIt.registerLazySingleton<FirebaseStorage>(
//   //   () => FirebaseStorage.instance,
//   // );
//   // getIt.registerLazySingleton<FirebaseFirestore>(
//   //   () => FirebaseFirestore.instance,
//   // );
//
//   // home
//   // getIt.registerLazySingleton<HomeRepo>(
//   //   () => HomeRepo(
//   //     getIt(),
//   //   ),
//   // );
//   //
//   // getIt.registerFactory<EditProfileDataCubit>(
//   //   () => EditProfileDataCubit(
//   //     getIt(),
//   //   ),
//   // );
//   //
//   // // login
//   // getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
//   // getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
//
//   //saved items
//   // getIt.registerLazySingleton<DataBaseHelper>(() => DataBaseHelper());
//   // getIt.registerFactory<SavedItemsCubit>(() => SavedItemsCubit(getIt()));
//   // getIt.registerLazySingleton<SavedItemsRepo>(() => SavedItemsRepo(getIt()));
// }
