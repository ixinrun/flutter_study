class HttpResponse {
  bool isSuccess = false;
  String message = '';

  HttpResponse(this.isSuccess, this.message);

  HttpResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
  }
}
