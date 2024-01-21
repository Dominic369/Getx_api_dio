import 'package:dio/dio.dart';

/*
const baseUrl = '';

// ignore: non_constant_identifier_names
var API_DPO = Dio(
  BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 60).inSeconds,
    receiveTimeout: const Duration(seconds: 60).inSeconds,
    contentType: Headers.jsonContentType,
  ),
);
*/

const baseUrl = 'https://jsonplaceholder.typicode.com';

// ignore: non_constant_identifier_names
var API_DPO = Dio(
  BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 60).inMilliseconds,
    receiveTimeout: const Duration(seconds: 60).inMilliseconds,
    contentType: Headers.jsonContentType,
  ),
);
