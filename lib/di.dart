import 'package:certain_salon/common/providers/localization_provider.dart';
import 'package:certain_salon/common/reposotories/langauge_repo.dart';
import 'package:certain_salon/components/appointment/domain/reposotories/appointment_repo.dart';
import 'package:certain_salon/components/appointment/providers/appointment_provider.dart';
import 'package:certain_salon/components/auth/domian/reposotories/auth_repo.dart';
import 'package:certain_salon/components/auth/providers/auth_provider.dart';
import 'package:certain_salon/components/gallery/domain/reposotories/gallery_repo.dart';
import 'package:certain_salon/components/gallery/providers/gallery_provider.dart';
import 'package:certain_salon/components/home/domain/reposotories/banner_repo.dart';
import 'package:certain_salon/components/home/providers/banner_provider.dart';
import 'package:certain_salon/components/profile/domain/reposotories/profile_repo.dart';
import 'package:certain_salon/components/profile/providers/profile_provider.dart';
import 'package:certain_salon/components/service/domain/reposotories/service_repo.dart';
import 'package:certain_salon/components/service/providers/service_provider.dart';
import 'package:certain_salon/components/splash/domain/reposotories/SplashRepo.dart';
import 'package:certain_salon/components/splash/providers/splash_provider.dart';
import 'package:certain_salon/network/dio_client.dart';
import 'package:certain_salon/util/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerLazySingleton(() => DioClient(AppConstants.baseUrl, sl(), sharedPreferences: sl()));

  //Repository
  sl.registerLazySingleton(() => SplashRepo(dioCLient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => LanguageRepo(dioClient: sl()));
  sl.registerLazySingleton(() => BannerRepo(dioClient: sl()));
  sl.registerLazySingleton(() => AppointmentRepo(dioClient: sl()));
  sl.registerLazySingleton(() => ServiceRepo(dioClient: sl()));
  sl.registerLazySingleton(() => ProfileRepo(dioClient: sl(),sharedPrefrences: sl()));
  sl.registerLazySingleton(() => GalleryRepo(dioClient: sl()));
  



  //Providers
  sl.registerFactory(() => SplashProvider(splashRepo: sl()));
  sl.registerFactory(() => AuthProvider(sharedPreferences:sl(),authRepo: sl()));
  sl.registerFactory(() => LocalizationProvider(dioClient: sl(), sharedPreferences: sl(), languageRepo: sl()));
  sl.registerFactory(() => BannerProvider(bannerRepo: sl()));
  sl.registerFactory(() => AppointmentProvider(sharedPreferences: sl(),appointmentRepo: sl()));
  sl.registerFactory(() => ServiceProvider(serivceRepo: sl()));
  sl.registerFactory(() => ProfileProvider(profileRepo: sl()));
  sl.registerFactory(() => GalleryProvider(galleryRepo: sl()));




  final sharedPrefrences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPrefrences);
  sl.registerLazySingleton(() => Dio());
}
