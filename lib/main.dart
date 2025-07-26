import 'package:flutter/material.dart';

void main() => runApp(const AlertDialogDemo());

class AlertDialogDemo extends StatelessWidget {
  const AlertDialogDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlertDialog Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DialogScreen(),
    );
  }
}

class DialogScreen extends StatelessWidget {
  const DialogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AlertDialog Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _showBasicDialog(context),
              child: const Text('Basic Dialog'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showStyledDialog(context),
              child: const Text('Styled Dialog'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showActionDialog(context),
              child: const Text('Action Dialog'),
            ),
          ],
        ),
      ),
    );
  }

  // Basic Alert Dialog
  void _showBasicDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Basic Alert'),
        content: const Text('This is a basic alert dialog example.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // Styled Alert Dialog
  void _showStyledDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Congratulations!'),
        content: const Text('You completed the tutorial successfully.'),
        backgroundColor: Colors.amber[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.amber, width: 2),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.thumb_up),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  // Action Alert Dialog
  void _showActionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Action'),
        content: const Text('Do you want to save changes?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Changes discarded')),
              );
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Changes saved successfully!')),
              );
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
