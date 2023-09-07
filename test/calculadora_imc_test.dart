import 'package:calculadora_imc/exception/altura_invalida_exception.dart';
import 'package:calculadora_imc/exception/nome_invalido_exception.dart';
import 'package:calculadora_imc/exception/peso_invalido_exception.dart';
import 'package:calculadora_imc/model/pessoa.dart';
import 'package:test/test.dart';

void main() {
  test('Cria pessoa e gera IMC', () {
    expect(
        Pessoa("Adalberto", 100.0, 1.90).toString(),
        equals({
          "Nome": "Adalberto",
          "Peso": 100.0,
          "Altura": 1.90,
          "IMC": 28.0,
          "Classificação IMC": "Sobrepeso"
        }.toString()));
  });

  test(
      'Cria pessoa com nome inválido e espera Exception de NomeInvalidoException',
      () {
    expect(() => Pessoa("", 100.0, 1.90),
        throwsA(TypeMatcher<NomeInvalidoException>()));
  });

  test(
      'Cria pessoa com peso inválido e espera Exception de PesoInvalidoException',
      () {
    expect(() => Pessoa("Adalberto", -100.0, 1.90),
        throwsA(TypeMatcher<PesoInvalidoException>()));
  });

  test(
      'Cria pessoa com peso inválido e espera Exception de AlturaInvalidaException',
      () {
    expect(() => Pessoa("Adalberto", 100.0, -1.90),
        throwsA(TypeMatcher<AlturaInvalidaException>()));
  });
}
