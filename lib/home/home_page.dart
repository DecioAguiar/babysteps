import 'package:babysteps/education/question_detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFEDE1F7),
        foregroundColor: const Color(0xFF3E3666),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFFEDE1F7)),
        child: Column(
          children: [
            const SizedBox(height: 110),
            Center(
              child: Container(
                height: 450,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xffad95df),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView(
                        children: [
                          _buildMenuItem(
                            context,
                            title: "Desenvolvimento com afeto",
                            icon: Icons.baby_changing_station,
                            onTap: () {
                              Navigator.pushNamed(context, '/desenvolvimento_com_afeto');
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildMenuItem(
                            context,
                            title: "Definição dos domínios do bebê",
                            icon: Icons.description,
                            onTap: () {
                              Navigator.pushNamed(context, '/definicao_dominios');
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildMenuItem(
                            context,
                            title: "Técnicas de estimulação",
                            icon: Icons.play_circle_fill,
                            onTap: () {
                              Navigator.pushNamed(context, '/tecnicas_estimulacao');
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildMenuItem(
                            context,
                            title: "Puericultura",
                            icon: Icons.medical_services,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const QuestionDetailPage(
                                    question: 'Puericultura',
                                    pages: [
                                      'A consulta de puericultura é uma ação do Ministério da Saúde para a efetivação do pleno crescimento e desenvolvimento infantil. É uma consulta de rotina, que deve ser realizada na unidade básica de saúde por meio da estratégia de saúde da família mais próxima do seu local de residência.',
                                      'O que deve ser abordado/conversado: amamentação/alimentação, imunização, prevenção de quedas/acidentes, marcos do desenvolvimento infantil, medidas para acompanhamento das curvas de crescimento físico (peso, altura, IMC), medidas de saúde bucal, avaliação dos sinais de deficiência, com foco nas alterações sensoriais.',
                                      'Quando realizar: O Ministério da saúde recomenda pelo menos 7 consultas no primeiro ano de vida (na 1ª semana, no 1º mês, 2º mês, 4º mês, 6º mês, 9º mês e 12º mês). Ao completar dois anos, as consultas de rotina devem acontecer sempre uma vez no ano. É importante que essa consulta anual seja realizada sempre próximo a data de aniversário.',
                                      'Importante: Lembre-se, isso é o recomendado! Se você tem a oportunidade de levar a criança mais vezes, é importante pois o processo de acompanhamento de crescimento e desenvolvimento será ainda mais presente e constante.',
                                      'A consulta da primeira semana de vida é muito importante pois ela avalia a saúde da mãe e do recém-nascido, amamentação, vacinas e também orientações de cuidado e higiene. Ela pode ser realizada no domicílio ou na unidade de saúde onde foi realizado o pré-natal, na unidade mais próxima de sua residência. Mas lembre-se: você deverá levar a criança em todas as datas que falei acima.',
                                      'Atenção! Não deixe para levar a criança somente quando ela apresentar algum sinal de que esteja doente. É necessário avaliar como ela cresce e se desenvolve.',
                                      'O que devo levar ou perguntar na consulta de puericultura? Você deverá ir junto com a criança. É importante a presença dos pais ou de cuidadores nesse momento. Lembre-se de levar a caderneta da criança que recebeu na maternidade, pois o profissional irá preencher todas as informações nela e lhe repassará informações a partir dela. Se possível, registre todas as suas dúvidas para perguntar no momento da consulta e lembre de verificar se o profissional faz a checagem dos marcos do desenvolvimento da criança para a idade. A consulta deve ser um momento de conversa, análise e registros da criança. Aproveite bem esse momento!',
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFD7CFF2),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 36, color: const Color(0xFF5D3B91)),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Color(0xFF5D3B91),
            ),
          ],
        ),
      ),
    );
  }
}
