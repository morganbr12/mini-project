import 'package:flutter/material.dart';

class BusinessCard<T> extends StatelessWidget {
  final T item;
  final String title;
  final String subtitle;
  final String trailing;
  final VoidCallback? onTap;

  const BusinessCard({
    super.key,
    required this.item,
    required this.title,
    required this.subtitle,
    required this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(trailing),
        onTap: onTap,
      ),
    );
  }
}
