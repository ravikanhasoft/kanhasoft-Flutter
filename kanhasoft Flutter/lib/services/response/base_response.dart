abstract class ApiResponse {
  ApiResponse();

  factory ApiResponse.sucess(json) => BaseResponse.fromJson(json);

  factory ApiResponse.error({int? statusCode, String? errorMessage}) =>
      ErrorResponse(statusCode: statusCode, errorMessage: errorMessage);
}

class BaseResponse extends ApiResponse {
  // ignore: unnecessary_question_mark
  dynamic? data;
  BaseResponse({this.data});
  factory BaseResponse.fromJson(json) {
    return BaseResponse(data: json);
  }
}

class ErrorResponse extends ApiResponse {
  int? statusCode;
  String? errorMessage;

  ErrorResponse({statusCode, errorMessage});
}
