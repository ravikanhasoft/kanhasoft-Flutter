class GetTokenResponse {
  final String? accessToken;
  final String? refreshToken;
  final String? scope;
  final String? idToken;
  final String? tokenType;
  final int? expiresIn;
  const GetTokenResponse(
      {this.accessToken,
      this.refreshToken,
      this.scope,
      this.idToken,
      this.tokenType,
      this.expiresIn});
  GetTokenResponse copyWith(
      {String? accessToken,
      String? refreshToken,
      String? scope,
      String? idToken,
      String? tokenType,
      int? expiresIn}) {
    return GetTokenResponse(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
        scope: scope ?? this.scope,
        idToken: idToken ?? this.idToken,
        tokenType: tokenType ?? this.tokenType,
        expiresIn: expiresIn ?? this.expiresIn);
  }

  Map<String, Object?> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'scope': scope,
      'id_token': idToken,
      'token_type': tokenType,
      'expires_in': expiresIn
    };
  }

  static GetTokenResponse fromJson(Map<String, Object?> json) {
    return GetTokenResponse(
        accessToken:
            json['access_token'] == null ? null : json['access_token'] as String,
        refreshToken: json['refresh_token'] == null
            ? null
            : json['refresh_token'] as String,
        scope: json['scope'] == null ? null : json['scope'] as String,
        idToken: json['id_token'] == null ? null : json['id_token'] as String,
        tokenType:
            json['token_type'] == null ? null : json['token_type'] as String,
        expiresIn: json['expires_in'] == null ? null : json['expires_in'] as int);
  }

  @override
  String toString() {
    return '''GetTokenResponse(
                access_token:$accessToken,
refresh_token:$refreshToken,
scope:$scope,
id_token:$idToken,
token_type:$tokenType,
expires_in:$expiresIn
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is GetTokenResponse &&
        other.runtimeType == runtimeType &&
        other.accessToken == accessToken &&
        other.refreshToken == refreshToken &&
        other.scope == scope &&
        other.idToken == idToken &&
        other.tokenType == tokenType &&
        other.expiresIn == expiresIn;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, accessToken, refreshToken, scope, idToken,
        tokenType, expiresIn);
  }
}
