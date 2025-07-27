import 'package:flutter/material.dart';
import 'package:aa_toast/aa_toast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AAToast Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AAToast Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            _buildSection(
              context,
              'Basic Toast Types',
              [
                _buildButton(
                  context,
                  'Success Toast',
                  Colors.green,
                  () => Toast.success(context,
                      message: 'Operation completed successfully!'),
                ),
                _buildButton(
                  context,
                  'Error Toast',
                  Colors.red,
                  () => Toast.error(context, message: 'Something went wrong!'),
                ),
                _buildButton(
                  context,
                  'Info Toast',
                  Colors.blue,
                  () => Toast.info(context,
                      message: 'Here is some information for you.'),
                ),
                _buildButton(
                  context,
                  'Warning Toast',
                  Colors.orange,
                  () => Toast.warning(context, message: 'Please be careful!'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildSection(
              context,
              'Toast Positions',
              [
                _buildButton(
                  context,
                  'Top Position',
                  Colors.purple,
                  () => Toast.info(
                    context,
                    message: 'This toast appears at the top',
                    position: ToastPosition.top,
                  ),
                ),
                _buildButton(
                  context,
                  'Center Position',
                  Colors.teal,
                  () => Toast.info(
                    context,
                    message: 'This toast appears in the center',
                    position: ToastPosition.center,
                  ),
                ),
                _buildButton(
                  context,
                  'Bottom Position',
                  Colors.indigo,
                  () => Toast.info(
                    context,
                    message: 'This toast appears at the bottom',
                    position: ToastPosition.bottom,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildSection(
              context,
              'Custom Toast',
              [
                _buildButton(
                  context,
                  'Custom Toast',
                  Colors.deepPurple,
                  () => Toast.show(
                    context,
                    message: 'This is a custom toast with custom styling',
                    backgroundColor: Colors.deepPurple,
                    textColor: Colors.white,
                    icon: const Icon(Icons.star, color: Colors.white),
                    duration: const Duration(seconds: 5),
                  ),
                ),
                _buildButton(
                  context,
                  'Dismiss All',
                  Colors.grey,
                  () => Toast.dismissAll(),
                ),
              ],
            ),
            const SizedBox(height: 20), // Add bottom padding for scroll
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      BuildContext context, String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        ...children.map((child) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: child,
            )),
      ],
    );
  }

  Widget _buildButton(
    BuildContext context,
    String text,
    Color color,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      child: Text(text),
    );
  }
}
