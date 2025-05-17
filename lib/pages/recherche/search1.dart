import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newtest/providers/theme_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Fonction utilitaire pour normaliser les chaînes (accents, casse)
String _normalize(String input) {
  return input
      .toLowerCase()
      .replaceAll(RegExp(r'[éèêë]'), 'e')
      .replaceAll(RegExp(r'[àâä]'), 'a')
      .replaceAll(RegExp(r'[îï]'), 'i')
      .replaceAll(RegExp(r'[ôö]'), 'o')
      .replaceAll(RegExp(r'[ùûü]'), 'u')
      .replaceAll(RegExp(r'[ç]'), 'c');
}

void main() {
  runApp(const RechercheApp());
}

class RechercheApp extends StatelessWidget {
  const RechercheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const RecherchePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
    );
  }
}

class RecherchePage extends StatefulWidget {
  const RecherchePage({super.key});

  @override
  State<RecherchePage> createState() => _RecherchePageState();
}

class _RecherchePageState extends State<RecherchePage> {
  late final List<String> _noms;
  late List<String> _nomsFiltres;
  final TextEditingController _controleurRecherche = TextEditingController();
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _noms = {
      // ... Mets ici ta liste complète ...
      'The Godfather',
      'Game of Thrones',
      'Interstellar',
      'Friends',
      'The Matrix',
      'La Casa de Papel',
      'Forrest Gump',
      'Black Mirror',
      'Titanic',
      'The Office (US)',
      'Fight Club',
      'Narcos',
      'Avengers: Endgame',
      'Sherlock',
      'Gladiator',
      'The Witcher',
      'Star Wars: Episode V',
      'Stranger Things',
      'The Shawshank Redemption',
      'Westworld',
      'Jurassic Park',
      'The Crown',
      'Inception',
      'Breaking Bad',
      'The Mandalorian',
      'Pulp Fiction',
      'Peaky Blinders',
      'Back to the Future',
      'The Social Network',
      'Dune',
      'Squid Game',
      'The Lord of the Rings',
      'House of Cards',
      'Joker',
      'Chernobyl',
      'The Revenant',
      'Money Heist',
      'The Big Bang Theory',
      'Blade Runner 2049',
      'The Simpsons',
      'Parasite',
      'Mad Max: Fury Road',
      'Better Call Saul',
      'Harry Potter',
      'The Queen’s Gambit',
      'The Irishman',
      'Dark',
      'La La Land',
      'The Avengers',
      // ... Ajoute le reste de ta liste ici, sans doublons ...
    }.toList();
    _nomsFiltres = List.from(_noms);
    _controleurRecherche.addListener(_filtrerNoms);
  }

  void _filtrerNoms() {
    final recherche = _normalize(_controleurRecherche.text);
    setState(() {
      _nomsFiltres =
          _noms.where((nom) => _normalize(nom).contains(recherche)).toList();
    });
  }

  void _openGoogleResults(BuildContext context, String query) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (_, __, ___) => GoogleResultsPage(query: query),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween(begin: 0.95, end: 1.0);
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: animation.drive(tween),
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controleurRecherche.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF181A20) : colorScheme.surface,
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF181A20) : colorScheme.surface,
        elevation: 0,
        title: const Text(
          'Recherche',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        titleTextStyle: TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: isDark ? Colors.white : Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: EdgeInsets.only(
              top: _hasFocus ? 24 : 36,
              left: 20,
              right: 20,
              bottom: 12,
            ),
            decoration: BoxDecoration(
              color: isDark ? Colors.white10 : Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                if (_hasFocus)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
              ],
            ),
            child: Focus(
              onFocusChange: (focus) => setState(() => _hasFocus = focus),
              child: TextField(
                controller: _controleurRecherche,
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  hintText: 'Rechercher un film ou une série...',
                  hintStyle: TextStyle(
                    color: isDark ? Colors.white54 : Colors.black45,
                  ),
                  prefixIcon: Icon(Icons.search, color: colorScheme.primary),
                  suffixIcon: _controleurRecherche.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.clear, color: colorScheme.primary),
                          onPressed: () {
                            _controleurRecherche.clear();
                            FocusScope.of(context).unfocus();
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 18),
                ),
              ),
            ),
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: _nomsFiltres.isEmpty
                  ? Center(
                      key: const ValueKey('empty'),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeInOut,
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isDark
                                  ? Colors.white12
                                  : colorScheme.primary.withOpacity(0.08),
                            ),
                            child: Icon(Icons.sentiment_dissatisfied,
                                color: isDark
                                    ? Colors.white54
                                    : colorScheme.primary,
                                size: 54),
                          ),
                          const SizedBox(height: 18),
                          Text(
                            'Aucun résultat trouvé',
                            style: TextStyle(
                              color: isDark ? Colors.white54 : Colors.black45,
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      key: const ValueKey('list'),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      itemCount: _nomsFiltres.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final nom = _nomsFiltres[index];
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(18),
                            splashColor: colorScheme.primary.withOpacity(0.13),
                            highlightColor:
                                colorScheme.primary.withOpacity(0.07),
                            onTap: () => _openGoogleResults(context, nom),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeOut,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? const Color(0xFF23242B)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.07),
                                    blurRadius: 12,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                leading: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blue.shade400,
                                        Colors.red.shade400,
                                        Colors.yellow.shade600,
                                        Colors.green.shade400,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: Image.network(
                                      'https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg',
                                      width: 22,
                                      height: 22,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  nom,
                                  style: TextStyle(
                                    color:
                                        isDark ? Colors.white : Colors.black87,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                  ),
                                ),
                                trailing: Icon(Icons.open_in_new,
                                    color: colorScheme.primary, size: 22),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

// Nouvelle page WebView pour afficher les résultats Google

class GoogleResultsPage extends StatefulWidget {
  final String query;
  const GoogleResultsPage({super.key, required this.query});

  @override
  State<GoogleResultsPage> createState() => _GoogleResultsPageState();
}

class _GoogleResultsPageState extends State<GoogleResultsPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    final url =
        'https://www.google.com/search?q=${Uri.encodeComponent(widget.query)}';
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Résultats pour "${widget.query}"'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: WebViewWidget(controller: _controller),
      ),
    );
  }
}
