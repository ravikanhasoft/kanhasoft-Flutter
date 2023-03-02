class SimpleResponse {
  final String? status;
  final Data? data;
  final String? message;
  const SimpleResponse({this.status, this.data, this.message});
  SimpleResponse copyWith({String? status, Data? data, String? message}) {
    return SimpleResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  Map<String, Object?> toJson() {
    return {'status': status, 'data': data?.toJson(), 'message': message};
  }

  static SimpleResponse fromJson(Map<String, Object?> json) {
    return SimpleResponse(
        status: json['status'] == null ? null : json['status'] as String,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, Object?>),
        message: json['message'] == null ? null : json['message'] as String);
  }

  @override
  String toString() {
    return '''SimpleResponse(
                status:$status,
data:${data.toString()},
message:$message
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is SimpleResponse &&
        other.runtimeType == runtimeType &&
        other.status == status &&
        other.data == data &&
        other.message == message;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, status, data, message);
  }
}

class Data {
  const Data();
  Data copyWith() {
    return const Data();
  }

  Map<String, Object?> toJson() {
    return {};
  }

  static Data fromJson(Map<String, Object?> json) {
    return const Data();
  }
}
