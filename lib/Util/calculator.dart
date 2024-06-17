// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:math';

import 'package:flutter/material.dart';

class Calculator {
  void appendText(String text, TextEditingController _controller) {
    final textInserted = _controller.text;
    final selection = _controller.selection;
    final newText =
        textInserted.replaceRange(selection.start, selection.end, text);
    _controller.value = _controller.value.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: selection.start + text.length),
    );
  }

  void removeLastCharacter(TextEditingController _controller) {
    final text = _controller.text;
    if (text.isNotEmpty) {
      _controller.text = text.substring(0, text.length - 1);
      _controller.selection =
          TextSelection.collapsed(offset: _controller.text.length);
    }
  }

  void calculatePercentage(TextEditingController _controller) {
    final text = _controller.text;
    double? value = double.tryParse(text);
    if (value != null) {
      final percentage = value / 100;
      _controller.text = percentage.toString();
      _controller.selection =
          TextSelection.collapsed(offset: _controller.text.length);
    }
  }

  void equate(TextEditingController _controller) {
    final text = _controller.text;
    if (text.contains('+')) {
      final parts = text.split('+');
      double? leftValue = double.tryParse(parts[0].trim());
      double? rightValue = double.tryParse(parts[1].trim());
      final result = leftValue! + rightValue!;
      _controller.text = result.toString();
      _controller.selection =
          TextSelection.collapsed(offset: _controller.text.length);
    } else if (text.contains('-')) {
      final parts = text.split('-');
      double? leftValue = double.tryParse(parts[0].trim());
      double? rightValue = double.tryParse(parts[1].trim());
      final result = leftValue! - rightValue!;
      _controller.text = result.toString();
      _controller.selection =
          TextSelection.collapsed(offset: _controller.text.length);
    } else if (text.contains('X')) {
      final parts = text.split('X');
      double? leftValue = double.tryParse(parts[0].trim());
      double? rightValue = double.tryParse(parts[1].trim());
      final result = leftValue! * rightValue!;
      _controller.text = result.toString();
      _controller.selection =
          TextSelection.collapsed(offset: _controller.text.length);
    } else {
      final parts = text.split('÷');
      if (parts.length == 2) {
        double? leftValue = double.tryParse(parts[0].trim());
        double? rightValue = double.tryParse(parts[1].trim());
        if (leftValue != null && rightValue != null && rightValue != 0) {
          final result = leftValue / rightValue;
          _controller.text = result.toString();
          _controller.selection =
              TextSelection.collapsed(offset: _controller.text.length);
        } else {
          _controller.text = 'Error';
          _controller.selection =
              TextSelection.collapsed(offset: _controller.text.length);
        }
      }
    }
  }

  void calculateSquareRoot(TextEditingController _controller) {
    final text = _controller.text;
    if (text.isEmpty) {
      return;
    }
    double? value = double.tryParse(text);
    if (value != null && value >= 0) {
      double sqrtValue = sqrt(value);
      _controller.text = sqrtValue.toString();
      _controller.selection =
          TextSelection.collapsed(offset: _controller.text.length);
    } else {
      _controller.text = 'Invalid input';
      _controller.selection =
          TextSelection.collapsed(offset: _controller.text.length);
    }
  }

  void calculatePie(TextEditingController _controller) {
    final text = _controller.text;
    if (text.isEmpty) {
      _controller.text = '3.14';
      _controller.selection =
          TextSelection.collapsed(offset: _controller.text.length);
    }
    double? value = double.tryParse(text);
    double result = value! * 3.14;
    _controller.text = result.toString();
    _controller.selection =
        TextSelection.collapsed(offset: _controller.text.length);
  }

  void calculateSquare(TextEditingController _controller) {
    final text = _controller.text;
    if (text.isEmpty) {
      return;
    }
    double? value = double.tryParse(text);
    if (value != null) {
      double square = value * value;
      _controller.text = square.toString();
      _controller.selection =
          TextSelection.collapsed(offset: _controller.text.length);
    } else {
      _controller.text = 'Invalid input';
      _controller.selection =
          TextSelection.collapsed(offset: _controller.text.length);
    }
  }

  int factorial(int n) {
    if (n == 0) {
      return 1;
    }
    return n * factorial(n - 1);
  }

  void calculateFactorial(TextEditingController _controller) {
    final text = _controller.text;
    if (text.isEmpty) {
      return;
    }

    int? value = int.tryParse(text);
    if (value != null && value >= 0) {
      int result = factorial(value);
      _controller.text = result.toString();
      _controller.selection =
          TextSelection.collapsed(offset: _controller.text.length);
    } else {
      _controller.text = 'Invalid input';
      _controller.selection =
          TextSelection.collapsed(offset: _controller.text.length);
    }
  }
}
