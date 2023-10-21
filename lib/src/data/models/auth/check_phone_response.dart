class CheckPhoneResponse {
  Error? error;

  CheckPhoneResponse({this.error});

  CheckPhoneResponse.fromJson(Map<String, dynamic> json) {
    error = json['Error'] != null ? Error.fromJson(json['Error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (error != null) {
      data['Error'] = error!.toJson();
    }
    return data;
  }
}

class Error {
  String? code;
  String? message;

  Error({this.code, this.message});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}
