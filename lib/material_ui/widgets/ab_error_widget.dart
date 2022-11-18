import 'package:flutter/material.dart';

class ABErrorWidget extends StatelessWidget {
  final String? message;
  final String? error;
  final String? stack;
  final VoidCallback retry;

  const ABErrorWidget(
      {super.key, this.message, this.error, this.stack, required this.retry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(message ?? 'Something went wrong'),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple,
            ),
            onPressed: retry,
            child: const Text('Retry'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => ABErrorDialog(error: error, stack: stack),
              );
            },
            child: const Text('View Error'),
          )
        ],
      ),
    );
  }
}

class ABErrorDialog extends StatelessWidget {
  final String? error;
  final String? stack;
  const ABErrorDialog({super.key, this.error, this.stack});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Text('Error: $error, StackTrace: $stack'),
          ),
        ),
      ),
    );
  }
}
