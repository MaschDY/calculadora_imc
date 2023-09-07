import 'package:calculadora_imc/exception/nome_invalido_exception.dart';

import '../exception/altura_invalida_exception.dart';
import '../exception/imc_invalido_exception.dart';
import '../exception/peso_invalido_exception.dart';
import 'imc.dart';

class Pessoa {
  String _nome = "";
  double _peso = 0.0;
  double _altura = 0.0;
  Imc? _imc;

  void setNome(String nome) => _nome = nome;

  String getNome() => _nome;

  void setPeso(double peso) => _peso = peso;

  double getPeso() => _peso;

  void setAltura(double altura) => _altura = altura;

  double getAltura() => _altura;

  Imc? getImc() => _imc;

  void validateInputFields(String nome, double peso, double altura) {
    if (nome.trim().isEmpty) {
      throw NomeInvalidoException();
    } else if (peso <= 0.0 || peso.isNaN) {
      throw PesoInvalidoException();
    } else if (altura <= 0.0 || altura.isNaN) {
      throw AlturaInvalidaException();
    }
  }

  Pessoa(String nome, double peso, double altura) {
    validateInputFields(nome, peso, altura);

    _nome = nome;
    _peso = peso;
    _altura = altura;
    _imc = Imc(_peso, _altura);
  }

  @override
  String toString() {
    if (_imc == null) {
      throw ImcInvalidoException();
    }

    return {
      "Nome": _nome,
      "Peso": _peso,
      "Altura": _altura,
      "IMC": _imc!.getValue(),
      "Classificação IMC": _imc!.getClassificacao()
    }.toString();
  }
}
