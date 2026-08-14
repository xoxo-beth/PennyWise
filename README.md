# 💚 PennyWise

A modern expense tracker built with Flutter to help users manage income, expenses, and understand their spending habits.

## ✨ Features

- Splash Screen
- Login Screen
- Home Dashboard (In Progress)
- Add Transactions
- Transaction History
- Spending Statistics

## 🛠️ Built With

- Flutter
- Dart

## 🚧 Project Status

Currently under development.

## 📸 Screenshots

(Coming Soon)
# What I learnt
How to use scaffold
How to use themes and applying them
How to work with statefulwidget
How to use Git
How to work with userinput using TextEditingController
The difference between Navigator.push and Navigator.pushReplacement and when to use them
The difference between setState and initState and when to use them
Using Cards
How to use NavigationBar and bottomNavigationBar
Snackbar and its uses
How to use bottomNavigation bar
Fixed an overflow bug in the bottom sheet
Added a compulsory category validation
Started the planning tab UI
Created a new class called BudgetClassCategory for the planning tab

## Dev Log — [14/08/26]

### New Features (in progress)
- **`_buildBarGroups()` helper**: converts `budgetCategories` into `List<BarChartGroupData>` — one group per category, each with two `BarChartRodData` (planned amount, spent amount) in distinct colors. Built using an indexed `for` loop (chosen over `.map()`/`.asMap()` for familiarity).
- **Add Budget button redesigned**: swapped from a full-width `ElevatedButton.icon` to a compact, right-aligned, icon-only `ElevatedButton` (via `Row(mainAxisAlignment: MainAxisAlignment.end)`), matching a new reference UI design (grouped bar chart layout, inspired by an Analytics screen mockup).

### Known Issues — Next Session
1. `BarChart` widget itself not yet placed in `_buildPlanningContent()` — `_buildBarGroups()` exists but isn't wired to any visible chart yet.
2. Linking logic still not built — withdrawal transactions don't yet update the matching `BudgetCategory`'s `spentAmount`, so both bars (and the old progress-bar cards) will show `0` for spent until this is done.
3. Old card-list UI (with `LinearProgressIndicator`) is likely being replaced by the new bar chart design — decide whether to keep both or remove the card list/progress bars entirely.

## 👩🏽‍💻 Developer

Built by Beth.
