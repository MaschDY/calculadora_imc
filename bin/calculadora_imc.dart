import 'dart:io';

import 'package:calculadora_imc/exception/altura_invalida_exception.dart';
import 'package:calculadora_imc/exception/imc_invalido_exception.dart';
import 'package:calculadora_imc/exception/nome_invalido_exception.dart';
import 'package:calculadora_imc/exception/peso_invalido_exception.dart';
import 'package:calculadora_imc/model/pessoa.dart';
import 'package:calculadora_imc/util/console_utils.dart';

void main(List<String> arguments) {
  print("Bem vindo(a) a calculadora de IMC!");

  String nome = ConsoleUtils.lerStringComTexto("Digite seu nome:");
  double peso = ConsoleUtils.lerDoubleComTexto("Digite seu peso:");
  double altura = ConsoleUtils.lerDoubleComTexto("Digite sua altura:");

  try {
    var pessoa = Pessoa(nome, peso, altura);
    print(pessoa);
    print("Seu IMC: ${pessoa.getImc()!.getValue()}");
    print("Sua classificação: ${pessoa.getImc()!.getClassificacao()}");
  } on NomeInvalidoException catch (e) {
    treatException(e);
  } on PesoInvalidoException catch (e) {
    treatException(e);
  } on AlturaInvalidaException catch (e) {
    treatException(e);
  } on ImcInvalidoException catch (e) {
    treatException(e);
  } catch (e) {
    treatException(e);
  }
}

void treatException(Object e) {
  print(e);
  exit(0);
}
