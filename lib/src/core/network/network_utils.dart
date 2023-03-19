import 'dart:convert';
import 'dart:io';

import 'package:bloc_test/src/core/errors/errors.dart';
import 'package:bloc_test/src/core/errors/messages.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../helpers/helper_methods.dart';

class Network {

  static Future<http.Response> getRequest({required String api, params}) async {
    if (!await hasInternet) {
      throw Message.noInternet;
    }

    kPrint("\nYou hit: $api");
    kPrint("Request Params: $params");

    var headers = {
      'Accept': 'application/json',
      // "Authorization": "Bearer ${LocalStorage.getData(key: LocalStorageKey.token)}"
    };

    http.Response response = await http.get(
      Uri.parse(api).replace(queryParameters: params),
      headers: headers,
    );
    return response;
  }

  static Future<http.Response> postRequest({required String api, body}) async {
    if (!await hasInternet) {
      throw Message.noInternet;
    }

    kPrint('\nYou hit: $api');
    kPrint('Request Body: ${jsonEncode(body)}');

    var headers = {
      'Accept': 'application/json',
      // "Authorization": "Bearer ${LocalStorage.getData(key: LocalStorageKey.token)}"
    };

    http.Response response = await http.post(
      Uri.parse(api),
      body: body,
      headers: headers,
    );
    return response;
  }

  static multipartAddRequest({
    required String api,
    required Map<String, String> body,
    required String fileKeyName,
    required String filePath,
  }) async {
    if (!await hasInternet) {
      throw Message.noInternet;
    }

    kPrint("\nYou hit: $api");
    kPrint("Request body: $body");

    var headers = {
      'Accept': 'application/json',
      // "Authorization": "Bearer ${LocalStorage.getData(key: LocalStorageKey.token)}"
    };

    http.MultipartRequest request;
    if (filePath.isEmpty || filePath == '') {
      request = http.MultipartRequest('POST', Uri.parse(api))
        ..fields.addAll(body)
        ..headers.addAll(headers);
    } else {
      request = http.MultipartRequest('POST', Uri.parse(api))
        ..fields.addAll(body)
        ..headers.addAll(headers)
        ..files.add(await http.MultipartFile.fromPath(fileKeyName, filePath));
    }

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    return response;
  }

  static handleResponse(http.Response response) async {
    try {
      if (!await hasInternet) {
        throw Message.noInternet;
      }

      if (response.statusCode >= 200 && response.statusCode <= 210) {
        kPrint('SuccessCode: ${response.statusCode}');
        kPrint('SuccessResponse: ${response.body}');

        if (response.body.isNotEmpty) {
          return json.decode(response.body);
        } else {
          return response.body;
        }
      } else if (response.statusCode == 401) {
        _logout();
        String msg = "Unauthorized";
        if (response.body.isNotEmpty) {
          if(json.decode(response.body)['errors'] != null){
            msg = json.decode(response.body)['errors'];
          }
        }
        throw msg;
      } else if (response.statusCode == 404) {
        throw 'Page Not Found!';
      } else if (response.statusCode == 500) {
        throw "Server Error";
      } else {
        kPrint('ErrorCode: ${response.statusCode}');
        kPrint('ErrorResponse: ${response.body}');

        String msg = "Something went wrong";
        if (response.body.isNotEmpty) {
          var data = jsonDecode(response.body)['errors'];
          if(data == null){
            msg = jsonDecode(response.body)['message'] ?? msg;
          }
          else if (data is String) {
            msg = data;
          } else if (data is Map) {
            msg = data['email'][0];
          }
        }

        throw msg;
      }
    } on SocketException catch (_) {
      throw Message.noInternet;
    } on FormatException catch (_) {
      throw "Bad response format";
    } catch (e) {
      throw e.toString();
    }
  }

  static handleResponse2(http.Response response) async {
    try {
      if (!await hasInternet) {
        throw NetworkError(message: Message.noInternet);
      }

      if (response.statusCode >= 200 && response.statusCode <= 210) {
        kPrint('SuccessCode: ${response.statusCode}');
        kPrint('SuccessResponse: ${response.body}');

        if (response.body.isNotEmpty) {
          return json.decode(response.body);
        } else {
          return response.body;
        }
      } else if (response.statusCode == 401) {
        _logout();
        String msg = "Unauthorized";
        if (response.body.isNotEmpty) {
          if(json.decode(response.body)['errors'] != null){
            msg = json.decode(response.body)['errors'];
          }
        }
        throw UnknownError(message: msg);
      } else if (response.statusCode == 404) {
        throw PageNotFoundError(message: 'Page Not Found!');
      } else if (response.statusCode == 500) {
        throw ServerError(message: 'Server Error!');
      } else {
        kPrint('ErrorCode: ${response.statusCode}');
        kPrint('ErrorResponse: ${response.body}');

        String msg = "Something went wrong";
        if (response.body.isNotEmpty) {
          var data = jsonDecode(response.body)['errors'];
          if(data == null){
            msg = jsonDecode(response.body)['message'] ?? msg;
          }
          else if (data is String) {
            msg = data;
          } else if (data is Map) {
            msg = data['email'][0];
          }
        }

        throw UnknownError(message: msg);
      }
    } on SocketException catch (_) {
      throw NetworkError(message: Message.noInternet);
    } on FormatException catch (_) {
      throw BadRequestError(message: 'Bad Response!');
    } catch (e) {
      rethrow;
    }
  }

  static void _logout() {
    // LocalStorage.removeData(key: LocalStorageKey.token);
    // Get.offAll(() => const LoginScreen());
  }
}
