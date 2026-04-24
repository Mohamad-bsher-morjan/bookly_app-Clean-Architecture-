import 'package:bookly_app2/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app2/Features/home/data/data_sources/home_remote_source.dart';
import 'package:bookly_app2/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app2/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        apiService: getIt.get<ApiService>(),
      ),
    ),
  );
}
