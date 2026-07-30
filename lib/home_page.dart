import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class Transaction {
  final bool isDeposit;
  final String description;
  final double amount;
  final DateTime date;

  Transaction({
    required this.isDeposit,
    required this.description,
    required this.amount,
    required this.date,
  });
}

class _HomePageState extends State<HomePage> {
  double balance = 100000.00;
  int currentScreen = 0;
  List<Transaction> transactions = [];
  String formatCurrency(double amount) {
    return '₦${amount.toStringAsFixed(2)}';
  }

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _balanceChange(double amount, bool isDeposit, String description) {
    setState(() {
      if (isDeposit) {
        balance = balance + amount;
      } else {
        balance = balance - amount;
      }

      transactions.add(
        Transaction(
          isDeposit: isDeposit,
          description: description,
          amount: amount,
          date: DateTime.now(),
        ),
      );
    });
  }

  void _showAmountSheet(bool isDeposit) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(isDeposit ? 'Deposit Amount' : 'Withdraw Amount'),
              SizedBox(height: 12),
              TextField(
                controller: _amountController,
                decoration: InputDecoration(hintText: 'Enter Amount'),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(hintText: 'What was this for?'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  String typedText = _amountController.text;
                  double? amount = double.tryParse(typedText);
                  String description = _descriptionController.text;

                  if (amount == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter an amount')),
                    );
                  } else if (description.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter a description'),
                      ),
                    );
                  } else {
                    _balanceChange(amount, isDeposit, description);
                    _amountController.clear();
                    _descriptionController.clear();
                    Navigator.pop(context);
                  }
                },
                child: Text(isDeposit ? 'Confirm Deposit' : 'Confirm Withdraw'),
              ),
            ],
          ),
        );
      },
    );
  }

  double _totalIncome() {
    double total = 0;
    for (Transaction t in transactions) {
      if (t.isDeposit) {
        total = total + t.amount;
      }
    }
    return total;
  }

  double _totalExpense() {
    double total = 0;
    for (Transaction t in transactions) {
      if (!t.isDeposit) {
        total = total + t.amount;
      }
    }
    return total;
  }

  Widget _buildHomeContent() {
    return SafeArea(
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
                      Color.fromARGB(255, 13, 84, 62),
                      Color.fromARGB(255, 7, 67, 48),
                      Color.fromARGB(255, 3, 40, 28),
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
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: const Color.fromARGB(255, 6, 38, 6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 24,
                ),
                child: ElevatedButton.icon(
                  onPressed: () {
                    _showAmountSheet(true);
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
                  icon: Icon(Icons.south_east),
                  label: Text('Deposit'),
                ),
              ),
              SizedBox(width: 16),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 24.0,
                ),
                child: ElevatedButton.icon(
                  onPressed: () {
                    _showAmountSheet(false);
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
                  icon: Icon(Icons.north_east),
                  label: Text('Withdraw'),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                Transaction t = transactions[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: t.isDeposit ? Colors.green : Colors.red,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Icon(
                            t.isDeposit ? Icons.south_east : Icons.north_east,
                            color: t.isDeposit ? Colors.green : Colors.red,
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(formatCurrency(t.amount)),
                              Text(t.description),
                              Text(t.date.toString()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileContent() {
    return const Center(child: Text('Profile page coming soon'));
  }

  Widget _buildStatisticsContent() {
    return Center(
      child: Column(
        children: [
          PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: _totalIncome(),
                  color: Color.fromARGB(255, 3, 40, 28),
                  title: 'Income',
                ),
                PieChartSectionData(
                  value: _totalExpense(),
                  color: Color.fromARGB(255, 13, 84, 62),
                  title: 'Expense',
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Card(
                  elevation: 4,
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: 200,
                    color: Color.fromARGB(255, 3, 40, 28),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.south_east),
                        Text(
                          formatCurrency(_totalIncome()),
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  elevation: 4,
                  color: const Color.fromARGB(0, 4, 48, 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: 200,
                    color: Color.fromARGB(255, 13, 84, 62),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.north_east),
                        Text(
                          formatCurrency(_totalExpense()),
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlanningContent() {
    return const Center(child: Text('Planning page coming soon'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: switch (currentScreen) {
        0 => _buildHomeContent(),
        1 => _buildStatisticsContent(),
        2 => _buildPlanningContent(),
        3 => _buildProfileContent(),
        _ => _buildHomeContent(),
      },
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentScreen,
          backgroundColor: Color.fromARGB(255, 150, 203, 186),
          selectedItemColor: Color.fromARGB(255, 35, 81, 49),
          unselectedItemColor: Color(0xFF10B981),
          onTap: (index) {
            setState(() {
              currentScreen = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Statistics',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event_note),
              label: 'Planning',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
