import 'package:flutter/material.dart';

class BtgSelectionOption<T> {
  final String label;
  final String subtitle;
  final IconData icon;
  final T value;

  const BtgSelectionOption({
    required this.label,
    required this.subtitle,
    required this.icon,
    required this.value,
  });
}
