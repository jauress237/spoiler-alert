import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newtest/models/content_details.dart';
import 'package:newtest/models/info.dart';
import 'package:newtest/pages/detail/detail.dart';
import 'package:newtest/providers/theme_provider.dart';
import 'package:newtest/pages/recherche/search1.dart';

class SeriesPage extends StatelessWidget {
  const SeriesPage({super.key});

  void _showAddSerieDialog(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String title = '';
    String image = '';
    String genre = '';
    String description = '';
    bool isLoading = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => Dialog(
            backgroundColor: Colors.white.withOpacity(0.97),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) => const LinearGradient(
                              colors: [Color(0xFF5F67EA), Color(0xFFD32727)],
                            ).createShader(rect),
                            child: const Text(
                              'Ajouter une série',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 1.1,
                              ),
                            ),
                          ),
                          const SizedBox(height: 18),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Titre',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              prefixIcon: const Icon(Icons.title_rounded),
                            ),
                            validator: (value) => value == null || value.isEmpty
                                ? 'Titre requis'
                                : null,
                            onSaved: (value) => title = value ?? '',
                          ),
                          const SizedBox(height: 14),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Image (chemin ou URL)',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              prefixIcon: const Icon(Icons.image_rounded),
                            ),
                            onSaved: (value) => image = value ?? '',
                          ),
                          const SizedBox(height: 14),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Genre',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              prefixIcon: const Icon(Icons.category_rounded),
                            ),
                            onSaved: (value) => genre = value ?? '',
                          ),
                          const SizedBox(height: 14),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Description',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              prefixIcon: const Icon(Icons.description_rounded),
                            ),
                            maxLines: 2,
                            onSaved: (value) => description = value ?? '',
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.black87,
                                    side: const BorderSide(
                                        color: Color(0xFF5F67EA)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14)),
                                  ),
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('Annuler'),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF5F67EA),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14)),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                  ),
                                  onPressed: isLoading
                                      ? null
                                      : () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _formKey.currentState!.save();
                                            setState(() => isLoading = true);
                                            await Future.delayed(const Duration(
                                                milliseconds: 900));
                                            setState(() => isLoading = false);
                                            Navigator.of(context).pop();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    'Série "$title" ajoutée !'),
                                                backgroundColor:
                                                    const Color(0xFF5F67EA),
                                              ),
                                            );
                                            // Ajoute ici la logique pour ajouter la série à ta liste
                                          }
                                        },
                                  child: isLoading
                                      ? const SizedBox(
                                          height: 18,
                                          width: 18,
                                          child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: Colors.white),
                                        )
                                      : const Text('Ajouter',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final size = MediaQuery.of(context).size;

    final List<String> seriesTitles = [
      'Breaking Bad',
      'Game of Thrones',
      'Stranger Things',
      'The Crown',
      'The Mandalorian',
      'The Witcher',
      'Peaky Blinders',
      'Money Heist',
      'Dark',
      'The Boys',
    ];

    final List<ContentDetails> series = List.generate(55, (index) {
      final title = seriesTitles[index % seriesTitles.length];
      final imageNumber = (index % 55) + 1;
      return ContentDetails(
        title: title,
        image: 'assets/images/series-img/series-img-$imageNumber.png',
        rating: 4.0 + (index % 2) * 0.5,
        year: 2020 + (index % 5),
        genre: index % 3 == 0
            ? 'Drame, Thriller'
            : index % 3 == 1
                ? 'Science-Fiction, Fantastique'
                : 'Comédie, Romance',
        description:
            'Description détaillée de la série $title. Une histoire captivante qui vous tiendra en haleine du début à la fin.',
        actors: ['Acteur 1', 'Acteur 2', 'Acteur 3'],
        streamingPlatforms: index % 3 == 0
            ? ['Netflix', 'Amazon Prime']
            : index % 3 == 1
                ? ['Disney+', 'HBO Max']
                : ['Apple TV+', 'Paramount+'],
        episodes: 10 + (index % 20),
        seasons: 1 + (index % 5),
        releaseDate: '${1 + (index % 28)} ${[
          'Janvier',
          'Février',
          'Mars',
          'Avril',
          'Mai',
          'Juin',
          'Juillet',
          'Août',
          'Septembre',
          'Octobre',
          'Novembre',
          'Décembre'
        ][index % 12]} ${2020 + (index % 5)}',
      );
    });

    final List<Info> seriesInfos =
        series.map((serie) => Info.fromContentDetails(serie)).toList();

    return Scaffold(
      backgroundColor:
          themeProvider.isDarkMode ? const Color(0xFF1A1A1A) : Colors.white,
      body: CustomScrollView(
        slivers: [
          // AppBar moderne
          SliverAppBar(
            floating: true,
            pinned: true,
            backgroundColor: themeProvider.isDarkMode
                ? const Color(0xFF1A1A1A)
                : Colors.white,
            elevation: 0,
            title: ShaderMask(
              shaderCallback: (rect) => const LinearGradient(
                colors: [Color(0xFF5F67EA), Color(0xFFD32727)],
              ).createShader(rect),
              child: Text(
                'Séries',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RecherchePage(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.filter_list,
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
                onPressed: () {},
              ),
            ],
          ),

          // Bannière principale avec effet glass
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  height: size.height * 0.48,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(seriesInfos[0].bgImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.85),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShaderMask(
                          shaderCallback: (rect) => const LinearGradient(
                            colors: [Color(0xFF5F67EA), Color(0xFFD32727)],
                          ).createShader(rect),
                          child: Text(
                            seriesInfos[0].name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.1,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.redAccent.withOpacity(0.18),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Text(
                                'TENDANCE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.1,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Icon(Icons.star_rounded,
                                color: Colors.amber, size: 20),
                            Text(
                              '${seriesInfos[0].score}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              seriesInfos[0].type,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.play_arrow_rounded,
                                  size: 26),
                              label: const Text('Lecture'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF5F67EA),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 28, vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                elevation: 6,
                              ),
                            ),
                            const SizedBox(width: 18),
                            InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () => _showAddSerieDialog(context),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.18),
                                    width: 1.2,
                                  ),
                                ),
                                child: const Icon(Icons.add,
                                    color: Colors.white, size: 26),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Sections de contenu stylées
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildContentSection(
                  '🔥 Tendance',
                  seriesInfos.sublist(1, 11),
                  themeProvider,
                  context,
                ),
                _buildContentSection(
                  '🆕 Nouveautés',
                  seriesInfos.sublist(11, 21),
                  themeProvider,
                  context,
                ),
                _buildContentSection(
                  '⏩ Continuation',
                  seriesInfos.sublist(21, 31),
                  themeProvider,
                  context,
                ),
                _buildContentSection(
                  '⭐ Populaires',
                  seriesInfos.sublist(31, 41),
                  themeProvider,
                  context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentSection(String title, List<Info> items,
      ThemeProvider themeProvider, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(18),
          child: ShaderMask(
            shaderCallback: (rect) => const LinearGradient(
              colors: [Color(0xFF5F67EA), Color(0xFFD32727)],
            ).createShader(rect),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return _SerieCard(item: item, themeProvider: themeProvider);
            },
          ),
        ),
      ],
    );
  }
}

class _SerieCard extends StatefulWidget {
  final Info item;
  final ThemeProvider themeProvider;
  const _SerieCard({required this.item, required this.themeProvider, Key? key})
      : super(key: key);

  @override
  State<_SerieCard> createState() => _SerieCardState();
}

class _SerieCardState extends State<_SerieCard>
    with SingleTickerProviderStateMixin {
  bool _hovered = false;
  bool _pressed = false;
  bool _favorite = false;
  late AnimationController _favController;

  @override
  void initState() {
    super.initState();
    _favController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
      lowerBound: 1.0,
      upperBound: 1.25,
    );
  }

  @override
  void dispose() {
    _favController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() {
        _hovered = false;
        _pressed = false;
      }),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(widget.item),
            ),
          );
        },
        child: AnimatedScale(
          scale: _pressed
              ? 0.94
              : _hovered
                  ? 1.09
                  : 1.0,
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOutBack,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            margin: const EdgeInsets.only(right: 20, bottom: 10, top: 10),
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: _hovered
                      ? const Color(0xFF5F67EA).withOpacity(0.30)
                      : Colors.black.withOpacity(0.13),
                  blurRadius: _hovered ? 36 : 16,
                  spreadRadius: _hovered ? 2 : 0,
                  offset: const Offset(0, 10),
                ),
              ],
              border: Border.all(
                color: _hovered
                    ? const Color(0xFFD32727).withOpacity(0.7)
                    : Colors.transparent,
                width: 2.2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Stack(
                children: [
                  // Image de fond avec glow animé
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    foregroundDecoration: BoxDecoration(
                      boxShadow: [
                        if (_hovered)
                          BoxShadow(
                            color: const Color(0xFF5F67EA).withOpacity(0.25),
                            blurRadius: 40,
                            spreadRadius: 2,
                          ),
                      ],
                    ),
                    child: Image.asset(
                      widget.item.bgImage,
                      width: 160,
                      height: 230,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 160,
                          height: 230,
                          color: Colors.grey[800],
                          child: const Center(
                            child: Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Badge score gradient
                  Positioned(
                    top: 14,
                    left: 14,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFFD600), Color(0xFFFF6A00)],
                        ),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.amber.withOpacity(0.22),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star_rounded,
                              color: Colors.white, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            widget.item.score.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              shadows: [
                                Shadow(
                                  color: Colors.black38,
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Bouton favori animé avec glow
                  Positioned(
                    top: 14,
                    right: 14,
                    child: GestureDetector(
                      onTap: () async {
                        setState(() => _favorite = !_favorite);
                        await _favController.forward();
                        await _favController.reverse();
                      },
                      child: ScaleTransition(
                        scale: Tween<double>(begin: 1.0, end: 1.25).animate(
                          CurvedAnimation(
                              parent: _favController, curve: Curves.elasticOut),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.22),
                            shape: BoxShape.circle,
                            boxShadow: [
                              if (_favorite)
                                BoxShadow(
                                  color: Colors.pinkAccent.withOpacity(0.35),
                                  blurRadius: 18,
                                  spreadRadius: 2,
                                ),
                            ],
                          ),
                          child: Icon(
                            _favorite ? Icons.favorite : Icons.favorite_border,
                            color: _favorite ? Colors.pinkAccent : Colors.white,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Titre avec glass et gradient
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(28),
                        bottomRight: Radius.circular(28),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 13),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.60),
                          ),
                          child: ShaderMask(
                            shaderCallback: (rect) => const LinearGradient(
                              colors: [Color(0xFF5F67EA), Color(0xFFD32727)],
                            ).createShader(rect),
                            child: Text(
                              widget.item.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: 0.9,
                                shadows: [
                                  Shadow(
                                    color: Colors.black54,
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
