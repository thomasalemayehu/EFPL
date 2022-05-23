import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/fixtures/fixtures_view.dart';
import 'package:efpl/presentation/leagues/leagues_view.dart';
import 'package:efpl/presentation/points/points_view.dart';
import 'package:efpl/presentation/settings/settings_view.dart';
import 'package:efpl/presentation/stats/stats_view.dart';
import 'package:efpl/presentation/team/team_view.dart';
import 'package:efpl/presentation/transfers/transfers_view_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainTabView extends StatelessWidget {
  const MainTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      initialIndex: 1,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: ConstantColors.primary_800,
                ),
                child: Center(child: Text('Drawer Header')),
              ),
              ListTile(
                title: const Text('EPL Table'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Watch List'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Credit'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('How To'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Settings'),
                onTap: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 8.0,
          backgroundColor: ConstantColors.primary_900,
          bottom: const TabBar(
            indicatorColor: ConstantColors.primary_900,
            tabs: [
              // My Team
              Tab(
                icon: Icon(
                  MdiIcons.accountGroup,
                  color: ConstantColors.neutral_200,
                ),
              ),

              // My Points
              Tab(
                icon: Icon(
                  MdiIcons.counter,
                  color: ConstantColors.neutral_200,
                ),
              ),
              // Transfers

              Tab(
                icon: Icon(
                  Boxicons.bx_transfer,
                  color: ConstantColors.neutral_200,
                ),
              ),

              // Fixtures
              Tab(
                icon: Icon(
                  MdiIcons.calendarMonth,
                  color: ConstantColors.neutral_200,
                ),
              ),
              // My Leagues
              Tab(
                icon: Icon(
                  MdiIcons.trophy,
                  color: ConstantColors.neutral_200,
                ),
              ),
              // Stats
              Tab(
                icon: Icon(
                  Icons.leaderboard,
                  color: ConstantColors.neutral_200,
                ),
              ),

              // Settings
              Tab(
                icon: Icon(
                  Icons.settings,
                  color: ConstantColors.neutral_200,
                ),
              ),
            ],
          ),
          title: const Text(
            'Ethiopian Fantasy PL',
            style: TextStyle(
              color: ConstantColors.neutral_200,
              fontSize: 24,
              letterSpacing: 1,
              fontFamily: "Architect",
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            TeamView(),
            PointsView(),
            TransfersView(),
            FixturesView(),
            LeaguesView(),
            StatsView(),
            SettingsView()
          ],
        ),
      ),
    );
  }
}
