import 'package:random/data/Response/status.dart';

class ApiResponse<T> {
  Status? status;
  String? message;
  T? data;
  ApiResponse(this.status, this.message, this.data);
  ApiResponse.Loading() : status = Status.loading;
  ApiResponse.Error() : status = Status.error;
  ApiResponse.Complete() : status = Status.complete;
}
