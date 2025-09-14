class ErrorResponse {
  final String message;
  final bool? isSuccessful;
  final Map<String, dynamic>? validationErrors;

  ErrorResponse(
    this.isSuccessful,
    this.validationErrors, {
    required this.message,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      json['isSuccessful'] as bool?,
      json['validationErrors'] as Map<String, dynamic>?,
      message: json['message'] as String,
    );
  }
}
