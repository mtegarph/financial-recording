import 'package:flutter/material.dart';

typedef StatefulAppLifecycleSetter = void Function(
  BuildContext context,
  StateSetter setState,
  AppLifecycleState state,
);

/// A platonic widget that both has state and calls a closure to obtain its child widget.
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=syvT63CosNE}
///
/// The [StateSetter] function passed to the [builder] is used to invoke a
/// rebuild instead of a typical [State]'s [State.setState].
///
/// Since the [builder] is re-invoked when the [StateSetter] is called, any
/// variables that represents state should be kept outside the [builder] function.
///
/// {@tool snippet}
///
/// This example shows using an inline StatefulObservedBuilder that rebuilds and that
/// also has state.
///
/// ```dart
/// await showDialog<void>(
///   context: context,
///   builder: (BuildContext context) {
///     int? selectedRadio = 0;
///     return AlertDialog(
///       content: StatefulObservedBuilder(
///         builder: (BuildContext context, StateSetter setState) {
///           return Column(
///             mainAxisSize: MainAxisSize.min,
///             children: List<Widget>.generate(4, (int index) {
///               return Radio<int>(
///                 value: index,
///                 groupValue: selectedRadio,
///                 onChanged: (int? value) {
///                   setState(() => selectedRadio = value);
///                 },
///               );
///             }),
///           );
///         },
///       ),
///     );
///   },
/// );
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [Builder], the platonic stateless widget.
class StatefulObservedBuilder extends StatefulWidget {
  /// Creates a widget that both has state and delegates its build to a callback.
  ///
  /// The [builder] argument must not be null.
  const StatefulObservedBuilder({
    super.key,
    required this.builder,
    this.afterBuild,
    this.didChangeAppLifecycleState,
  });

  /// Called to obtain the child widget.
  ///
  /// This function is called whenever this widget is included in its parent's
  /// build and the old widget (if any) that it synchronizes with has a distinct
  /// object identity. Typically the parent's build method will construct
  /// a new tree of widgets and so a new Builder child will not be [identical]
  /// to the corresponding old one.
  final StatefulWidgetBuilder builder;

  final VoidCallback? afterBuild;

  final StatefulAppLifecycleSetter? didChangeAppLifecycleState;

  @override
  State<StatefulObservedBuilder> createState() =>
      _StatefulObservedBuilderState();
}

class _StatefulObservedBuilderState extends State<StatefulObservedBuilder>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    if (widget.afterBuild != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.afterBuild!();
        if (mounted) setState(() {});
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    widget.didChangeAppLifecycleState?.call(context, setState, state);
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, setState);
}
