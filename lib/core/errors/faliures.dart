abstract class Faliures {
  String errorMsg;
  Faliures({required this.errorMsg});
}

class ServerError extends Faliures {
  ServerError({required super.errorMsg});
}
class NetworkError extends Faliures {
  NetworkError({required super.errorMsg});
}
