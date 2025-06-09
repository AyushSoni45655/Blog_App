abstract class Failuress {
  final String error;
  Failuress({required this.error});

  @override
  String toString() => error; // 👈 यही fix है
}

class ServerFailure extends Failuress {
  ServerFailure(String serverMessage) : super(error: serverMessage);
}

class AuthFailure extends Failuress {
  AuthFailure(String authMessage) : super(error: authMessage);
}
