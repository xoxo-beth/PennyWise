import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double balance = 100000.00;
  String formatCurrency(double amount) {
    return '₦${amount.toStringAsFixed(2)}';
  }

  final TextEditingController _amountController = TextEditingController();

  void _balanceChange(double amount, bool isDeposit) {
    setState(() {
      if (isDeposit) {
        balance = balance + amount;
      } else {
        balance = balance - amount;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4,
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 131, 207, 132),
                        Color.fromARGB(255, 92, 186, 106),
                        Color(0xFF10B981),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_balance_wallet,
                          size: 32,
                          color: Color(0XFFD1FAE5),
                        ),
                        SizedBox(width: 8),
                        Text(
                          formatCurrency(balance),
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: const Color.fromARGB(255, 6, 38, 6),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(hintText: 'Enter Amount'),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 24,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      String typedText = _amountController.text;
                      double? amount = double.tryParse(typedText);
                      if (amount == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter an amount'),
                          ),
                        );
                      } else {
                        _balanceChange(amount, true);
                        _amountController.clear();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 150, 203, 185),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: Text('Deposit'),
                  ),
                ),
                SizedBox(width: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 24.0,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      String typedText = _amountController.text;
                      double? amount = double.tryParse(typedText);
                      if (amount == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter an amount'),
                          ),
                        );
                      } else {
                        _balanceChange(amount, false);
                        _amountController.clear();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 150, 203, 185),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: Text('Withdraw'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
