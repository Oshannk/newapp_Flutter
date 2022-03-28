class signInResponse {
  final String message;
  final int status_code;

  const signInResponse({required this.message,required this.status_code});

  factory signInResponse.fromJson(Map<String, dynamic> json) {
    return signInResponse(
      message: json['message'],
      status_code: json['status_code'],
    );
  }
}
