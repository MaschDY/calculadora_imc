class ImcInvalidoException implements Exception {
  String error() => "IMC Inválido!";

  @override
  String toString() {
    return "ImcInvalidoException: ${error()}";
  }
}
