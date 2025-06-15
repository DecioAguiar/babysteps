import 'package:babysteps/components/custom_input_field.dart';
import 'package:babysteps/components/primary_button.dart';
import 'package:babysteps/core/theme.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  int _resendCooldown = 0;
  Timer? _resendTimer;

  void _startResendCooldown() {
    _resendCooldown = 60;
    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendCooldown > 0) {
        setState(() {
          _resendCooldown--;
        });
      } else {
        timer.cancel();
        _resendTimer = null;
      }
    });
  }

  Future<void> _sendPasswordResetEmail() async {
    // Valida o formulário usando a chave global.
    // 'validate()' retorna true se todos os validadores dos campos retornarem null (sem erros).
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(const Duration(seconds: 2));

      // Após a "simulação da API", desativa o indicador de carregamento.
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Se o e-mail estiver cadastrado, as instruções foram enviadas para sua caixa de entrada. Verifique também a pasta de spam.',
          ),
          backgroundColor: Colors.green,
        ),
      );
      _startResendCooldown();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppTheme.backgroundColor, // Define a cor de fundo da página
      body: SafeArea(
        // Garante que o conteúdo não seja sobreposto pela barra de status, etc.
        child: Stack(
          // Permite posicionar o botão de voltar de forma absoluta
          children: [
            // --- Conteúdo Principal (Centralizado e Rolável) ---
            Center(
              // Centraliza o SingleChildScrollView na tela
              child: SingleChildScrollView(
                // Permite que o conteúdo seja rolável se for muito longo
                padding: const EdgeInsets.symmetric(
                  horizontal: 28.0,
                ), // Preenchimento horizontal
                child: Form(
                  // Widget para agrupar campos de formulário e validar
                  key: _formKey, // Chave para controlar o formulário
                  child: Column(
                    // Organiza os widgets verticalmente
                    // 2. Ajuste de Posicionamento: Inicia os elementos do topo da coluna
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .center, // Centraliza itens horizontalmente (ex: logo)
                    children: [
                      // Espaço superior para o botão de voltar e um respiro geral
                      const SizedBox(height: 80),

                      // 1. Sugestão: Adicionar o Logo da Marca
                      Image.asset(
                        'assets/img/babystepsLogo.png',
                        height: 100,
                      ), // Seu logo
                      const SizedBox(height: 30), // Espaço após o logo
                      // 2. Título principal da página
                      const Text(
                        'Recuperação de Senha',
                        textAlign:
                            TextAlign
                                .center, // Centraliza o texto dentro do seu espaço
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: AppTheme.textColor,
                        ),
                      ),
                      const SizedBox(height: 10), // Espaço após o título
                      // 2. Instrução principal para o usuário
                      const Text(
                        'Informe seu e-mail para enviarmos o link de recuperação.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.textColor,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ), // Espaço antes do campo de input
                      // Campo de entrada personalizado para o e-mail
                      CustomInputField(
                        icon: Icons.email,
                        hintText: 'E-mail de recuperação',
                        controller: _emailController,
                        keyboardType:
                            TextInputType
                                .emailAddress, // Teclado otimizado para e-mail
                        validator: (value) {
                          // Função de validação para o campo
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu e-mail.';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Insira um e-mail válido.';
                          }
                          return null; // Campo válido
                        },
                      ),
                      const SizedBox(height: 20), // Espaço antes do botão
                      // Exibe CircularProgressIndicator enquanto carrega ou o botão "Enviar"
                      _isLoading
                          ? const CircularProgressIndicator()
                          : PrimaryButton(
                            text: 'Enviar',
                            onPressed:
                                _sendPasswordResetEmail, // Chama o método de envio
                          ),
                      const SizedBox(height: 10), // Espaço após o botão
                      // 3. Sugestão: Refinar a Mensagem Pós-Envio (Footer Text)
                      const Text(
                        'As instruções para recuperação de senha serão enviadas para este e-mail. Verifique também a pasta de spam/lixo eletrônico.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 97, 97, 97),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ), // Espaço antes da opção de reenviar
                      // 4. Sugestão: Opção de "Reenviar E-mail" (com Cooldown)
                      if (_resendCooldown >
                          0) // Mostra o contador se ainda estiver em cooldown
                        Text(
                          'Reenviar em $_resendCooldown segundos',
                          style: TextStyle(
                            fontSize: 12,
                            color: const Color.fromARGB(255, 97, 97, 97),
                          ),
                        )
                      else // Mostra o botão de reenviar se o cooldown terminou
                        TextButton(
                          onPressed:
                              _isLoading
                                  ? null
                                  : _sendPasswordResetEmail, // Desabilitado se estiver carregando
                          child: const Text(
                            'Reenviar e-mail',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppTheme.secondaryColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10, // Distância do topo da SafeArea
              left: 10, // Distância da esquerda da SafeArea
              child: IconButton(
                iconSize: 36.0,
                padding: const EdgeInsets.all(12.0),
                icon: const Icon(Icons.arrow_back, color: AppTheme.textColor),
                onPressed: () {
                  Navigator.pop(context); // Volta para a tela anterior
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
