// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_demo/services/response/api_constant.dart';
import 'package:flutter_demo/services/response/base_response.dart';
import 'package:flutter_demo/utils/utils.dart';

class ApiClient {
  Dio? _dio;
  static final ApiClient instance = ApiClient._internal();

  ApiClient._internal() {
    setUpClient();
  }

  setUpClient() {
    _dio = Dio();
    // ignore: deprecated_member_use
    (_dio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    var intercepator = InterceptorsWrapper(
      onRequest: (request, handler) {
        handler.next(request);
        printLog("Okhttp Url -->${request.method} : ${request.uri}");
        printLog("Okhttp Header -->${request.headers}");
        printLog("Okhttp Quary Param -->${request.queryParameters}");
        printLog("Okhttp Data -->${request.data}");
      },
      onResponse: (response, handler) {
        handler.next(response);
        printLog("Okhttp Response -->$response");
      },
      onError: (error, handler) {
        handler.next(error);
        printLog("Okhttp -->$error");
      },
    );
    _dio?.interceptors.add(intercepator);
  }

  Future<ApiResponse>? call(
      {String? url,
      String? baseUrl,
      Map<String, dynamic>? param,
      ApiMethod method = ApiMethod.GET,
      FormData? fileUploadData,
      Map<String, dynamic>? mHeader,
      fromurlEncode = false,
      String? token}) async {
    try {
      url = baseUrl != null ? "$baseUrl$url" : "${ApiConstant.API_URL}$url";
      Response? response;
      switch (method) {
        case ApiMethod.GET:
          response = await _dio?.get(url,
              queryParameters: param, options: Options(headers: mHeader));
          break;
        case ApiMethod.POST:
          response = await _dio?.post(url,
              data: param, options: Options(headers: mHeader));
          break;
        case ApiMethod.PUT:
          response = await _dio?.put(url,
              queryParameters: param, options: Options(headers: mHeader));
          break;
        case ApiMethod.DELETE:
          response = await _dio?.delete(url,
              queryParameters: param, options: Options(headers: mHeader));
          break;
        case ApiMethod.MULITPART:
          response = await _dio?.post(url,
              data: fileUploadData, options: Options(headers: mHeader));
          break;
        default:
          return ApiResponse.error(
              errorMessage: "You have set wrong http method");
      }
      if (response != null) {
        return ApiResponse.sucess(response.data);
      } else {
        return getErrorMessage(-1, "Something went wrong...");
      }
    } on SocketException {
      return getErrorMessage(
          ErrorCode.NO_INTERNET_CONNECTION, "No internet connection");
    } on FormatException {
      return getErrorMessage(ErrorCode.SERVER_DOWN, "server doun");
    } on DioError catch (e) {
      if (e.error == "Http status error [429]") {
        return getErrorMessage(ErrorCode.TOOMANY_REQUEST, e.message);
      } else if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return getErrorMessage(ErrorCode.CONNECTION_TIMEOUT, e.message);
      } else if (e.type == DioErrorType.cancel) {
        return getErrorMessage(ErrorCode.REQUEST_CANCELLED, e.message);
      } else if (e.response?.statusCode == ErrorCode.NOT_AUTHORIZED) {
        return getErrorMessage(ErrorCode.NOT_AUTHORIZED, e.message);
      } else if (e.response?.statusCode == ErrorCode.SESSION_EXPIRED) {
        return getErrorMessage(ErrorCode.SESSION_EXPIRED, e.message);
      } else if (e.response?.statusCode == ErrorCode.BAD_REQUEST) {
        return getErrorMessage(ErrorCode.BAD_REQUEST, e.message);
      } else {
        return getErrorMessage(ErrorCode.SERVER_DOWN, "Server sowun");
      }
    }
  }
}

Future<ApiResponse> getErrorMessage(int status, mesage) async {
  switch (status) {
    case ErrorCode.SERVER_DOWN:
      return ApiResponse.error(
          statusCode: ErrorCode.SERVER_DOWN, errorMessage: "Server dowun...!");

    case ErrorCode.CONNECTION_TIMEOUT:
      return ApiResponse.error(
          statusCode: ErrorCode.CONNECTION_TIMEOUT,
          errorMessage: "Api connection timeout...!");

    case ErrorCode.NO_INTERNET_CONNECTION:
      return ApiResponse.error(
          statusCode: ErrorCode.NO_INTERNET_CONNECTION,
          errorMessage: "Please check your internet connection.");

    case ErrorCode.TOOMANY_REQUEST:
      return ApiResponse.error(
          statusCode: ErrorCode.TOOMANY_REQUEST,
          errorMessage:
              "Too many request are in process please wait some time.");

    case ErrorCode.REQUEST_CANCELLED:
      return ApiResponse.error(
          statusCode: ErrorCode.REQUEST_CANCELLED,
          errorMessage: "Request cancelled by user");

    case ErrorCode.NOT_AUTHORIZED:
      return ApiResponse.error(
          statusCode: ErrorCode.NOT_AUTHORIZED,
          errorMessage: "You are not authorise user.");

    case ErrorCode.SESSION_EXPIRED:
      return ApiResponse.error(
          statusCode: ErrorCode.SESSION_EXPIRED,
          errorMessage: "Your session is expired.");
    case ErrorCode.BAD_REQUEST:
      return ApiResponse.error(
          statusCode: ErrorCode.BAD_REQUEST, errorMessage: "Bad Request");
    default:
      return ApiResponse.error(errorMessage: "Something went wrong.");
  }
}

enum ApiMethod { GET, POST, MULITPART, DELETE, PUT }

class ErrorCode {
  static const NO_INTERNET_CONNECTION = 502;
  static const CONNECTION_TIMEOUT = 408;
  static const REQUEST_CANCELLED = 499;
  static const SERVER_DOWN = 500;
  static const NOT_AUTHORIZED = 401;
  static const SESSION_EXPIRED = 440;
  static const TOOMANY_REQUEST = 429;

  static const BAD_REQUEST = 409;
}
