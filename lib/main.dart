import 'package:blog_preview_card/theme/colors.dart';
import 'package:blog_preview_card/theme/sizes.dart';
import 'package:flutter/material.dart';

const imgCard = 'lib/assets/blog_image.png';
const imgOwner = 'lib/assets/image-avatar.webp';

void main() {
  runApp(const BlogPreviewCardApp());
}

class BlogPreviewCardApp extends StatelessWidget {
  const BlogPreviewCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Figtree'),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        backgroundColor: AppColors.yellow,
        body: Center(
          child: CardPreview(
            chipText: 'Learning',
            publishDate: 'Published 21, Dec 2023',
            title: 'HTML & CSS foundations',
            subtitle:
                'These languages are the backbone of every website, defining structure, content, and presentation.',
            ownerName: 'Greg Hopper',
          ),
        ),
      ),
    );
  }
}

class CardPreview extends StatelessWidget {
  final String chipText;
  final String publishDate;
  final String title;
  final String subtitle;
  final String ownerName;

  const CardPreview({
    super.key,
    required this.chipText,
    required this.publishDate,
    required this.title,
    required this.subtitle,
    required this.ownerName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: AppColors.gray950,
              offset: Offset(8, 8),
              blurRadius: 0,
            ),
          ],
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: AppColors.gray950, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacings.sp300),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ImageCardPreview(),
                SizedBox(height: AppSpacings.sp300),
                _CardChip(label: chipText),
                SizedBox(height: AppSpacings.sp150),
                _PublishDate(text: publishDate),
                SizedBox(height: AppSpacings.sp150),
                _TitleCard(text: title),
                SizedBox(height: AppSpacings.sp150),
                _SubtitleCard(text: subtitle),
                SizedBox(height: AppSpacings.sp300),
                OwnerInfo(ownerName: ownerName),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OwnerInfo extends StatelessWidget {
  final String ownerName;

  const OwnerInfo({super.key, required this.ownerName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(backgroundImage: AssetImage(imgOwner), radius: 16),
        const SizedBox(width: AppSpacings.sp150),
        Text(
          ownerName,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            letterSpacing: 0,
            fontSize: AppFontSizes.txtSizeSm,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class _ImageCardPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: SizedBox(
        height: 200,
        child: Image.asset(imgCard, fit: BoxFit.cover),
      ),
    );
  }
}

class _CardChip extends StatelessWidget {
  final String label;

  const _CardChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacings.sp50,
        horizontal: AppSpacings.sp100,
      ),
      label: Text(
        label,
        style: const TextStyle(
          fontSize: AppFontSizes.txtSizeSm,
          color: AppColors.gray950,
          fontWeight: FontWeight.w900,
          letterSpacing: 0,
          height: 1.5,
        ),
      ),
      backgroundColor: AppColors.yellow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side: BorderSide.none,
    );
  }
}

class _PublishDate extends StatelessWidget {
  final String text;

  const _PublishDate({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.gray950,
        fontSize: AppFontSizes.txtSizeSm,
        letterSpacing: 0,
        height: 1.5,
      ),
    );
  }
}

class _TitleCard extends StatelessWidget {
  final String text;

  const _TitleCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.pressed) ||
              states.contains(WidgetState.hovered)) {
            return AppColors.yellow;
          }
          return AppColors.gray950;
        }),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: AppFontSizes.txtSizeLg,
          fontWeight: FontWeight.w900,
          letterSpacing: 0,
          height: 1.5,
        ),
      ),
    );
  }
}

class _SubtitleCard extends StatelessWidget {
  final String text;

  const _SubtitleCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.gray500,
        letterSpacing: 0,
        height: 1.5,
      ),
    );
  }
}
