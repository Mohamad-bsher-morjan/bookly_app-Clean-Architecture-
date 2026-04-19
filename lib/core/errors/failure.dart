import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.formDioException(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection timeout with the server');

      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send timeout with the server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive timeout with the server');

      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'Bad SSL certificate');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Request to the server was canceled');

      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: 'No Internet connection');

      case DioExceptionType.unknown:
        if (dioError.message?.contains('SocketException') ?? false) {
          return ServerFailure(errMessage: 'No Internet Connection');
        }
        return ServerFailure(errMessage: 'Unexpected Error, Please try again!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
        errMessage: 'Your request not found, please try later',
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        errMessage: 'Internal Server error , please try later ',
      );
    } else {
      return ServerFailure(
        errMessage: 'Opps, There was an Error , please try again',
      );
    }
  }
}
