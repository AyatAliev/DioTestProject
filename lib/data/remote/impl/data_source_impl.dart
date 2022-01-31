import 'package:dio/dio.dart';
import 'package:example_project/common/network/api_endpoints.dart';
import 'package:example_project/common/network/dio_client.dart';
import 'package:example_project/data/local/hive_helper.dart';
import 'package:example_project/domain/model/dto/profile_dto.dart';
import 'package:example_project/domain/model/profile.dart';
import 'package:example_project/domain/model/send_code.dart';
import 'package:example_project/domain/model/success.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import '../data_source.dart';

class DataSourceImpl extends DataSource {

  final DioClient _dioClient;

  DataSourceImpl({
    required DioClient dioClient,
  }) : _dioClient = dioClient;

  @override
  Future<Success?> sendCode(SendCode sendCode) async {
    try {
      Response response = await _dioClient.dio.post(ApiEndpoints.sendCode,data: sendCode.toJson());
      return Success.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
        return null;
      }
    }
  }

  @override
  Future<Profile?> confirmCode(SendCode sendCode) async {
    try {
      Response response = await _dioClient.dio.post(ApiEndpoints.confirmCode,data: sendCode.toJson());
      return Profile.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
        return null;
      }
    }
  }

  @override
  Future<Profile?> updateProfile(ProfileDTO profileDTO) async {
    try {
      Response response = await _dioClient.dio.post(ApiEndpoints.updateProfile,data: profileDTO.toJson());
      return Profile.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
        return null;
      }
    }
  }

  @override
  Future<Profile?> loginToken(ProfileDTO profileDTO) async {
    try {
      Response response = await _dioClient.dio.post(ApiEndpoints.confirmCode,data: profileDTO.toJson());
      return Profile.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
        return null;
      }
    }
  }
}