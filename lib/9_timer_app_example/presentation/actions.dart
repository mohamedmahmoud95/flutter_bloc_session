// import 'package:bloc_session/9_timer_app_example/bloc/timer_bloc.dart';
// import 'package:bloc_session/9_timer_app_example/bloc/timer_events.dart';
// import 'package:bloc_session/9_timer_app_example/bloc/timer_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Actions extends StatelessWidget {
//   const Actions({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TimerBloc, TimerState>(
//       buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
//       builder: (context, state) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             ...switch (state) {
//               TimerInitial() => [
//                   FloatingActionButton(
//                     child: const Icon(Icons.play_arrow),
//                     onPressed: () => context
//                         .read<TimerBloc>()
//                         .add(TimerStarted(duration: state.duration)),
//                   ),
//                 ],
//               TimerRunInProgress() => [
//                   FloatingActionButton(
//                     child: const Icon(Icons.pause),
//                     onPressed: () =>
//                         context.read<TimerBloc>().add(const TimerPaused()),
//                   ),
//                   FloatingActionButton(
//                     child: const Icon(Icons.replay),
//                     onPressed: () =>
//                         context.read<TimerBloc>().add(const TimerReset()),
//                   ),
//                 ],
//               TimerRunPause() => [
//                   FloatingActionButton(
//                     child: const Icon(Icons.play_arrow),
//                     onPressed: () =>
//                         context.read<TimerBloc>().add(const TimerResumed()),
//                   ),
//                   FloatingActionButton(
//                     child: const Icon(Icons.replay),
//                     onPressed: () =>
//                         context.read<TimerBloc>().add(const TimerReset()),
//                   ),
//                 ],
//               TimerRunComplete() => [
//                   FloatingActionButton(
//                     child: const Icon(Icons.replay),
//                     onPressed: () =>
//                         context.read<TimerBloc>().add(const TimerReset()),
//                   ),
//                 ]
//             }
//           ],
//         );
//       },
//     );
//   }
// }