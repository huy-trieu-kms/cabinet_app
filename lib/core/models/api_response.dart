class ApiResponse<T> {
  final bool isSuccessful;
  final T? resultObj;

  ApiResponse({required this.isSuccessful, this.resultObj});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return ApiResponse(
      isSuccessful: json['isSuccessed'] as bool,
      resultObj: json['resultObj'] != null
          ? fromJsonT(json['resultObj'])
          : null,
    );
  }
}
