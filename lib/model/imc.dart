import '../exception/imc_invalido_exception.dart';

class Imc {
  double _value = 0.0;
  String _classificacao = "";

  double getValue() => _value;

  String getClassificacao() => _classificacao;

  static double calculateImc(double peso, double altura) =>
      (peso / (altura * altura)).roundToDouble();

  static String generateClassification(double imc) {
    String classificacao = "";
    switch (imc) {
      case >= 0 && < 16.0:
        classificacao = "Magreza Grave";
        break;
      case >= 16.0 && < 17:
        classificacao = "Magreza Moderada";
        break;
      case >= 17.0 && < 18.5:
        classificacao = "Magreza Leve";
        break;
      case >= 18.5 && < 25:
        classificacao = "Saudável";
        break;
      case >= 25 && < 30:
        classificacao = "Sobrepeso";
        break;
      case >= 30 && < 35:
        classificacao = "Obesidade Grau I";
        break;
      case >= 35 && < 40:
        classificacao = "Obesidade Grau II (Severa)";
        break;
      case >= 40:
        classificacao = "Obesidade Grau III (Mórbida)";
        break;
      default:
        throw ImcInvalidoException();
    }
    return classificacao;
  }

  Imc(double peso, double altura) {
    _value = calculateImc(peso, altura);
    _classificacao = generateClassification(_value);
  }
}
