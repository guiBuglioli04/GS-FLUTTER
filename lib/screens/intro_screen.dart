import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  final VoidCallback onComplete;

  const IntroScreen({Key? key, required this.onComplete}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _currentPage = 0;

  final List<IntroPage> _pages = [
    IntroPage(
      icon: Icons.rocket_launch,
      title: 'Bem-vindo à Logística Interplanetária',
      description:
          'Gerencie seus envios entre planetas com segurança e eficiência.',
    ),
    IntroPage(
      icon: Icons.location_on,
      title: 'Rastreamento em Tempo Real',
      description:
          'Acompanhe suas encomendas em todo o sistema solar com precisão.',
    ),
    IntroPage(
      icon: Icons.analytics,
      title: 'Análises Detalhadas',
      description:
          'Visualize relatórios completos sobre seus envios e operações.',
    ),
    IntroPage(
      icon: Icons.settings,
      title: 'Gerenciamento Completo',
      description:
          'Controle total sobre suas operações logísticas interplanetárias.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return _buildPage(_pages[index]);
            },
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _pages.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.deepPurple
                            : Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _currentPage > 0
                          ? () {
                              setState(() => _currentPage--);
                            }
                          : null,
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Voltar'),
                    ),
                    ElevatedButton.icon(
                      onPressed: _currentPage < _pages.length - 1
                          ? () {
                              setState(() => _currentPage++);
                            }
                          : widget.onComplete,
                      icon: Icon(
                        _currentPage < _pages.length - 1
                            ? Icons.arrow_forward
                            : Icons.check,
                      ),
                      label: Text(
                        _currentPage < _pages.length - 1
                            ? 'Avançar'
                            : 'Começar',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(IntroPage page) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            page.icon,
            size: 120,
            color: Colors.deepPurple,
          ),
          const SizedBox(height: 32),
          Text(
            page.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              page.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IntroPage {
  final IconData icon;
  final String title;
  final String description;

  IntroPage({
    required this.icon,
    required this.title,
    required this.description,
  });
}
