part of '../screen.dart';

class _ImageContainer extends StatelessWidget {
  const _ImageContainer({
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: user.color.withValues(alpha: 0.2),
        ),
        child: Center(
          child: Icon(
            user.image,
            size: 80,
            color: user.color,
          ),
        ),
      ),
    );
  }
}
