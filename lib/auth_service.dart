/// Serviço simples para gerenciar o estado de autenticação do usuário.
/// Usa padrão singleton para manter o estado global da aplicação.
class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  bool _isLoggedIn = false;
  String? _currentUser;

  bool get isLoggedIn => _isLoggedIn;
  String? get currentUser => _currentUser;

  /// Realiza o login do usuário
  void login(String username) {
    _isLoggedIn = true;
    _currentUser = username;
  }

  /// Realiza o logout do usuário
  void logout() {
    _isLoggedIn = false;
    _currentUser = null;
  }

  /// Método de convenience para verificar autenticação
  static AuthService get auth => AuthService();
}