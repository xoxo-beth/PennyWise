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

## Dev Log — [15/08/26]

### Bug Fixes
- **Case-sensitive category matching**: linking logic (`_balanceChange`) compared `category == budget.name` as a strict, case-sensitive match, so casing mismatches (e.g. "transport" vs "Transport") silently failed to update `spentAmount`. Fixed by normalizing both sides with `.toLowerCase()` before comparing.
- **Add Budget button unresponsive**: an unbounded `ListView.builder` was accidentally nested inside the bar chart's `Row`, causing a silent layout failure that broke touch handling across the whole Planning tab. Fixed by moving the card list back to its own top-level section in the outer `Column`.
- **Chart card showing white instead of themed color**: `Card` was wrapped in a `Container` with colored `BoxDecoration`, but `Card`'s own opaque background covered it, leaving only a thin colored outline visible. Fixed by removing the wrapper and using `Card`'s own `color:` property directly.
- **Overlapping axis labels**: fixed-width chart couldn't fit all category names side-by-side without collision. Fixed by making the chart horizontally scrollable — `SingleChildScrollView(scrollDirection: Axis.horizontal)` wrapping a `SizedBox` sized dynamically (`budgetCategories.length * 100`, converted to `double`), wrapped in `Expanded` inside the `Row` so the scroll view has a bounded viewport to scroll within.

### New Features
- **Bar chart wrapped in a themed `Card`**, matching the Statistics tab's pie chart styling.

### Known Issues — Next Session
1. **Legend not yet built** — still need a color key (e.g. "● Planned ● Spent") beside the chart, same pattern as the pie chart's legend.

## 👩🏽‍💻 Developer

Built by Beth.
