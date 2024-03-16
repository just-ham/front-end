import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_ham/features/community/community_screen.dart';
import 'package:just_ham/features/dilemma/dilemma_catagory_screen.dart';
import 'package:just_ham/features/dilemma/dilemma_screen.dart';
import 'package:just_ham/features/home/home_screen.dart';
import 'package:just_ham/features/wizard/wizard_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
        path: '/dilemma/:catagory/:id',
        builder: (context, state) {
          return DilemmaScreen(
            catagory: state.pathParameters['catagory']!,
            id: state.pathParameters['id']!,
          );
        }),
    GoRoute(
        path: '/dilemmaCatagory',
        builder: (context, state) {
          return const DilemmaCatagoryScreen();
        }),
    GoRoute(
        path: '/wizard',
        builder: (context, state) {
          return const WizardScreen();
        }),
    GoRoute(
        path: '/community',
        builder: (context, state) {
          return const CommunityScreen();
        }),
  ],
);
