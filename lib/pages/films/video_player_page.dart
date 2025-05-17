import 'package:flutter/material.dart';
import 'package:newtest/pages/films/ArchivesPage.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoPlayerPage extends StatefulWidget {
  // Le chemin de la vidéo asset est passé ici
  final String videoUrl;

  const VideoPlayerPage({super.key, required this.videoUrl});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;
  bool _showControls = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl);

    _controller.initialize().then((_) {
      if (mounted) setState(() {});
      _controller.play();
    });
    _controller.addListener(() {
      if (_controller.value.hasError && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erreur de lecture vidéo')),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Impossible d\'ouvrir le lien')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title:
            const Text('Lecture vidéo', style: TextStyle(color: Colors.white)),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.facebook, color: Color(0xFF4267B2)),
            tooltip: 'Partager sur Facebook',
            onPressed: () {
              _launchUrl('https://www.facebook.com/share/16Cc3gcDR6/');
            },
          ),
          IconButton(
            icon: const Icon(Icons.share, color: Color(0xFF1DA1F2)),
            tooltip: 'Partager sur X',
            onPressed: () {
              _launchUrl(
                  'https://x.com/intent/tweet?url=https://votre-lien-video.com');
            },
          ),
          IconButton(
            icon: const Icon(Icons.chat, color: Color(0xFF25D366)),
            tooltip: 'Partager sur WhatsApp',
            onPressed: () {
              _launchUrl('https://wa.me/?text=https://votre-lien-video.com');
            },
          ),
          IconButton(
            icon: const Icon(Icons.ondemand_video, color: Colors.red),
            tooltip: 'Ouvrir sur Netflix',
            onPressed: () {
              _launchUrl('https://www.netflix.com/');
            },
          ),
          IconButton(
            icon: const Icon(Icons.ondemand_video, color: Color(0xFF00A8E1)),
            tooltip: 'Ouvrir sur Prime Video',
            onPressed: () {
              _launchUrl('https://www.primevideo.com/');
            },
          ),
          IconButton(
            icon: const Icon(Icons.snapchat, color: Color(0xFFFFFC00)),
            tooltip: 'Partager sur Snapchat',
            onPressed: () {
              _launchUrl('https://www.snapchat.com/');
            },
          ),
          IconButton(
            icon: const Icon(Icons.archive, color: Colors.white),
            tooltip: 'Archives',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ArchivesPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? GestureDetector(
                onTap: _toggleControls,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                    if (_showControls)
                      Positioned(
                        bottom: 30,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                _controller.value.isPlaying
                                    ? Icons.pause_circle_filled
                                    : Icons.play_circle_filled,
                                color: Colors.white,
                                size: 48,
                              ),
                              onPressed: () {
                                setState(() {
                                  _controller.value.isPlaying
                                      ? _controller.pause()
                                      : _controller.play();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    if (_showControls)
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: VideoProgressIndicator(
                          _controller,
                          allowScrubbing: true,
                          colors: const VideoProgressColors(
                            playedColor: Color(0xFF5F67EA),
                            backgroundColor: Colors.white24,
                            bufferedColor: Colors.white38,
                          ),
                        ),
                      ),
                  ],
                ),
              )
            : const CircularProgressIndicator(color: Color(0xFF5F67EA)),
      ),
    );
  }
}

// Pour ouvrir cette page avec ta vidéo locale, fais :
/// Navigator.push(
///   context,
///   MaterialPageRoute(
///     builder: (context) => VideoPlayerPage(
///       videoUrl: 'newtest/assets/video/TUTO Flutter #7_ Comment Créer un Splash Screen en 3 MIN ! (et éviter une Grosse ERREUR !).mp4',
///     ),
///   ),
/// );
