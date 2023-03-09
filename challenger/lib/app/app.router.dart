// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:flutter/material.dart';
import 'package:game_challenger/core/models/challenge.dart' as _i6;
import 'package:game_challenger/core/models/player.dart' as _i5;
import 'package:game_challenger/views/challenge/challenge.dart' as _i2;
import 'package:game_challenger/views/register/register.dart' as _i3;
import 'package:stacked/src/code_generation/router_annotation/transitions_builders.dart'
    as _i4;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;

class Routes {
  static const challenge = '/Challenge';

  static const register = '/';

  static const all = <String>{
    challenge,
    register,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.challenge,
      page: _i2.Challenge,
    ),
    _i1.RouteDef(
      Routes.register,
      page: _i3.Register,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.Challenge: (data) {
      final args = data.getArgs<ChallengeArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => _i2.Challenge(
            player: args.player, question: args.question, key: args.key),
        settings: data,
        transitionsBuilder:
            data.transition ?? _i4.TransitionsBuilders.slideLeft,
        transitionDuration: const Duration(milliseconds: 250),
      );
    },
    _i3.Register: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i3.Register(),
        settings: data,
        transitionsBuilder: data.transition ?? _i4.TransitionsBuilders.zoomIn,
        transitionDuration: const Duration(milliseconds: 250),
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ChallengeArguments {
  const ChallengeArguments({
    required this.player,
    required this.question,
    this.key,
  });

  final _i5.Player player;

  final _i6.Question question;

  final _i7.Key? key;

  @override
  String toString() {
    return '{"player": "$player", "question": "$question", "key": "$key"}';
  }
}

extension NavigatorStateExtension on _i8.NavigationService {
  Future<dynamic> navigateToChallenge({
    required _i5.Player player,
    required _i6.Question question,
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.challenge,
        arguments:
            ChallengeArguments(player: player, question: question, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegister([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.register,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChallenge({
    required _i5.Player player,
    required _i6.Question question,
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.challenge,
        arguments:
            ChallengeArguments(player: player, question: question, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegister([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.register,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
