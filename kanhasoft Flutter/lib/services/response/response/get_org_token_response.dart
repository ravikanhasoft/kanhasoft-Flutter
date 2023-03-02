class GetOrgResponse {
  final Data? data;
  final Status? status;
  const GetOrgResponse({this.data, this.status});
  GetOrgResponse copyWith({Data? data, Status? status}) {
    return GetOrgResponse(
        data: data ?? this.data, status: status ?? this.status);
  }

  Map<String, Object?> toJson() {
    return {'data': data?.toJson(), 'status': status?.toJson()};
  }

  static GetOrgResponse fromJson(Map<String, Object?> json) {
    return GetOrgResponse(
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, Object?>),
        status: json['status'] == null
            ? null
            : Status.fromJson(json['status'] as Map<String, Object?>));
  }

  @override
  String toString() {
    return '''GetOrgResponse(
                data:${data.toString()},
status:${status.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is GetOrgResponse &&
        other.runtimeType == runtimeType &&
        other.data == data &&
        other.status == status;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, data, status);
  }
}

class Status {
  final String? code;
  final String? message;
  const Status({this.code, this.message});
  Status copyWith({String? code, String? message}) {
    return Status(code: code ?? this.code, message: message ?? this.message);
  }

  Map<String, Object?> toJson() {
    return {'code': code, 'message': message};
  }

  static Status fromJson(Map<String, Object?> json) {
    return Status(
        code: json['code'] == null ? null : json['code'] as String,
        message: json['message'] == null ? null : json['message'] as String);
  }

  @override
  String toString() {
    return '''Status(
                code:$code,
message:$message
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Status &&
        other.runtimeType == runtimeType &&
        other.code == code &&
        other.message == message;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, code, message);
  }
}

class Data {
  final String? userId;
  final String? userName;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? status;
  final String? lastLoginAt;
  final List<dynamic>? contacts;
  final List<dynamic>? addresses;
  final List<ListCustomFields>? listCustomFields;
  final List<dynamic>? employmentDetails;
  final List<Memberships>? memberships;
  final KycDetails? kycDetails;
  final List<Apps>? apps;
  final List<String>? listRoles;
  final List<dynamic>? permissions;
  final String? createdAt;
  final bool? passwordExpired;
  final String? updatedAt;
  const Data(
      {this.userId,
      this.userName,
      this.firstName,
      this.lastName,
      this.email,
      this.status,
      this.lastLoginAt,
      this.contacts,
      this.addresses,
      this.listCustomFields,
      this.employmentDetails,
      this.memberships,
      this.kycDetails,
      this.apps,
      this.listRoles,
      this.permissions,
      this.createdAt,
      this.passwordExpired,
      this.updatedAt});
  Data copyWith(
      {String? userId,
      String? userName,
      String? firstName,
      String? lastName,
      String? email,
      String? status,
      String? lastLoginAt,
      List<dynamic>? contacts,
      List<dynamic>? addresses,
      List<ListCustomFields>? listCustomFields,
      List<dynamic>? employmentDetails,
      List<Memberships>? memberships,
      KycDetails? kycDetails,
      List<Apps>? apps,
      List<String>? listRoles,
      List<dynamic>? permissions,
      String? createdAt,
      bool? passwordExpired,
      String? updatedAt}) {
    return Data(
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        status: status ?? this.status,
        lastLoginAt: lastLoginAt ?? this.lastLoginAt,
        contacts: contacts ?? this.contacts,
        addresses: addresses ?? this.addresses,
        listCustomFields: listCustomFields ?? this.listCustomFields,
        employmentDetails: employmentDetails ?? this.employmentDetails,
        memberships: memberships ?? this.memberships,
        kycDetails: kycDetails ?? this.kycDetails,
        apps: apps ?? this.apps,
        listRoles: listRoles ?? this.listRoles,
        permissions: permissions ?? this.permissions,
        createdAt: createdAt ?? this.createdAt,
        passwordExpired: passwordExpired ?? this.passwordExpired,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  Map<String, Object?> toJson() {
    return {
      'user_id': userId,
      'user_name': userName,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'status': status,
      'last_login_at': lastLoginAt,
      'contacts': contacts,
      'addresses': addresses,
      'list_custom_fields': listCustomFields
          ?.map<Map<String, dynamic>>((data) => data.toJson())
          .toList(),
      'employment_details': employmentDetails,
      'memberships': memberships
          ?.map<Map<String, dynamic>>((data) => data.toJson())
          .toList(),
      'kyc_details': kycDetails?.toJson(),
      'apps': apps?.map<Map<String, dynamic>>((data) => data.toJson()).toList(),
      'list_roles': listRoles,
      'permissions': permissions,
      'created_at': createdAt,
      'password_expired': passwordExpired,
      'updated_at': updatedAt
    };
  }

  static Data fromJson(Map<String, Object?> json) {
    return Data(
        userId: json['user_id'] == null ? null : json['user_id'] as String,
        userName: json['user_name'] == null ? null : json['user_name'] as String,
        firstName:
            json['first_name'] == null ? null : json['first_name'] as String,
        lastName: json['last_name'] == null ? null : json['last_name'] as String,
        email: json['email'] == null ? null : json['email'] as String,
        status: json['status'] == null ? null : json['status'] as String,
        lastLoginAt:
            json['last_login_at'] == null ? null : json['last_login_at'] as String,
        contacts:
            json['contacts'] == null ? null : json['contacts'] as List<dynamic>,
        addresses: json['addresses'] == null
            ? null
            : json['addresses'] as List<dynamic>,
        listCustomFields: json['list_custom_fields'] == null
            ? null
            : (json['list_custom_fields'] as List)
                .map<ListCustomFields>((data) =>
                    ListCustomFields.fromJson(data as Map<String, Object?>))
                .toList(),
        employmentDetails: json['employment_details'] == null
            ? null
            : json['employment_details'] as List<dynamic>,
        memberships: json['memberships'] == null
            ? null
            : (json['memberships'] as List)
                .map<Memberships>((data) =>
                    Memberships.fromJson(data as Map<String, Object?>))
                .toList(),
        kycDetails: json['kyc_details'] == null
            ? null
            : KycDetails.fromJson(json['kyc_details'] as Map<String, Object?>),
        apps: json['apps'] == null
            ? null
            : (json['apps'] as List)
                .map<Apps>(
                    (data) => Apps.fromJson(data as Map<String, Object?>))
                .toList(),
        listRoles: json['list_roles'] == null
            ? null
            : json['list_roles'] as List<String>,
        permissions: json['permissions'] == null
            ? null
            : json['permissions'] as List<dynamic>,
        createdAt:
            json['created_at'] == null ? null : json['created_at'] as String,
        passwordExpired: json['password_expired'] == null
            ? null
            : json['password_expired'] as bool,
        updatedAt: json['updated_at'] == null ? null : json['updated_at'] as String);
  }

  @override
  String toString() {
    return '''Data(
                user_id:$userId,
user_name:$userName,
first_name:$firstName,
last_name:$lastName,
email:$email,
status:$status,
last_login_at:$lastLoginAt,
contacts:$contacts,
addresses:$addresses,
list_custom_fields:${listCustomFields.toString()},
employment_details:$employmentDetails,
memberships:${memberships.toString()},
kyc_details:${kycDetails.toString()},
apps:${apps.toString()},
list_roles:$listRoles,
permissions:$permissions,
created_at:$createdAt,
password_expired:$passwordExpired,
updated_at:$updatedAt
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Data &&
        other.runtimeType == runtimeType &&
        other.userId == userId &&
        other.userName == userName &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.status == status &&
        other.lastLoginAt == lastLoginAt &&
        other.contacts == contacts &&
        other.addresses == addresses &&
        other.listCustomFields == listCustomFields &&
        other.employmentDetails == employmentDetails &&
        other.memberships == memberships &&
        other.kycDetails == kycDetails &&
        other.apps == apps &&
        other.listRoles == listRoles &&
        other.permissions == permissions &&
        other.createdAt == createdAt &&
        other.passwordExpired == passwordExpired &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        userId,
        userName,
        firstName,
        lastName,
        email,
        status,
        lastLoginAt,
        contacts,
        addresses,
        listCustomFields,
        employmentDetails,
        memberships,
        kycDetails,
        apps,
        listRoles,
        permissions,
        createdAt,
        passwordExpired,
        updatedAt);
  }
}

class Apps {
  final String? appName;
  const Apps({this.appName});
  Apps copyWith({String? appName}) {
    return Apps(appName: appName ?? this.appName);
  }

  Map<String, Object?> toJson() {
    return {'appName': appName};
  }

  static Apps fromJson(Map<String, Object?> json) {
    return Apps(
        appName: json['appName'] == null ? null : json['appName'] as String);
  }

  @override
  String toString() {
    return '''Apps(
                appName:$appName
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Apps &&
        other.runtimeType == runtimeType &&
        other.appName == appName;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, appName);
  }
}

class KycDetails {
  final List<dynamic>? documents;
  const KycDetails({this.documents});
  KycDetails copyWith({List<dynamic>? documents}) {
    return KycDetails(documents: documents ?? this.documents);
  }

  Map<String, Object?> toJson() {
    return {'documents': documents};
  }

  static KycDetails fromJson(Map<String, Object?> json) {
    return KycDetails(
        documents: json['documents'] == null
            ? null
            : json['documents'] as List<dynamic>);
  }

  @override
  String toString() {
    return '''KycDetails(
                documents:$documents
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is KycDetails &&
        other.runtimeType == runtimeType &&
        other.documents == documents;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, documents);
  }
}

class Memberships {
  final String? membershipId;
  final String? organisationId;
  final String? roleName;
  final String? token;
  const Memberships(
      {this.membershipId, this.organisationId, this.roleName, this.token});
  Memberships copyWith(
      {String? membershipId,
      String? organisationId,
      String? roleName,
      String? token}) {
    return Memberships(
        membershipId: membershipId ?? this.membershipId,
        organisationId: organisationId ?? this.organisationId,
        roleName: roleName ?? this.roleName,
        token: token ?? this.token);
  }

  Map<String, Object?> toJson() {
    return {
      'membershipId': membershipId,
      'organisationId': organisationId,
      'roleName': roleName,
      'token': token
    };
  }

  static Memberships fromJson(Map<String, Object?> json) {
    return Memberships(
        membershipId: json['membershipId'] == null
            ? null
            : json['membershipId'] as String,
        organisationId: json['organisationId'] == null
            ? null
            : json['organisationId'] as String,
        roleName: json['roleName'] == null ? null : json['roleName'] as String,
        token: json['token'] == null ? null : json['token'] as String);
  }

  @override
  String toString() {
    return '''Memberships(
                membershipId:$membershipId,
organisationId:$organisationId,
roleName:$roleName,
token:$token
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Memberships &&
        other.runtimeType == runtimeType &&
        other.membershipId == membershipId &&
        other.organisationId == organisationId &&
        other.roleName == roleName &&
        other.token == token;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, membershipId, organisationId, roleName, token);
  }
}

class ListCustomFields {
  final String? customFieldId;
  final String? customKey;
  final String? customValue;
  const ListCustomFields(
      {this.customFieldId, this.customKey, this.customValue});
  ListCustomFields copyWith(
      {String? customFieldId, String? customKey, String? customValue}) {
    return ListCustomFields(
        customFieldId: customFieldId ?? this.customFieldId,
        customKey: customKey ?? this.customKey,
        customValue: customValue ?? this.customValue);
  }

  Map<String, Object?> toJson() {
    return {
      'custom_fieldId': customFieldId,
      'custom_key': customKey,
      'custom_value': customValue
    };
  }

  static ListCustomFields fromJson(Map<String, Object?> json) {
    return ListCustomFields(
        customFieldId: json['custom_field_id'] == null
            ? null
            : json['custom_field_id'] as String,
        customKey:
            json['custom_key'] == null ? null : json['custom_key'] as String,
        customValue:
            json['custom_value'] == null ? null : json['custom_value'] as String);
  }

  @override
  String toString() {
    return '''ListCustomFields(
                custom_field_id:$customFieldId,
custom_key:$customKey,
custom_value:$customValue
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ListCustomFields &&
        other.runtimeType == runtimeType &&
        other.customFieldId == customFieldId &&
        other.customKey == customKey &&
        other.customValue == customValue;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, customFieldId, customKey, customValue);
  }
}
