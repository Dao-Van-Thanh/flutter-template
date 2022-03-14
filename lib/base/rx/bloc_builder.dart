import 'package:flutter/material.dart';
import 'package:untitled/constants/size_box.dart';

class BlocBuilder<T> extends StatelessWidget {
  final T? initialData;
  final Stream<T> stream;
  final Widget Function(BuildContext context, T value) builder;
  final Widget placeholder;

  const BlocBuilder({
    this.initialData,
    required this.stream,
    required this.builder,
    this.placeholder = SizedBoxConstants.shrink,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      initialData: initialData,
      stream: stream,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            return builder(context, snapshot.data as T);
          default:
            return placeholder;
        }
      },
    );
  }
}
