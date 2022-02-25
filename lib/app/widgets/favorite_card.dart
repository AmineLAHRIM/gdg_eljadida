import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    Key? key,
    required this.onPressed,
    this.isFavorite = false,
  }) : super(key: key);

  final VoidCallback onPressed;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Card(
        child: IconButton(
          onPressed: () => onPressed(),
          icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
