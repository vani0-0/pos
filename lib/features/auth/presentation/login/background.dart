import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:performance_online_system/domain/services/bing/bing_service.dart';

class BingWallpaper extends ConsumerWidget {
  const BingWallpaper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<String> wallpaper = ref.watch(bingServiceProvider);

    return wallpaper.when(
      data: (url) => CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        alignment: const Alignment(.6, 0),
        width: double.infinity,
        height: double.infinity,
        placeholder: (context, url) => _fallbackImage(),
        errorWidget: (context, url, error) => const Icon(Icons.broken_image),
      ),
      error: (_, _) => _fallbackImage(),
      loading: () => const CircularProgressIndicator(),
    );
  }

  Widget _fallbackImage() {
    return Image.asset('assets/images/cat.jpg', fit: BoxFit.cover);
  }
}
