import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../models/leaderboard_user.dart';
import '../utils/dummy_data.dart';
import '../widgets/leaderboard_tile.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: DummyData.leaderboardUsers.length,
                  itemBuilder: (context, index) {
                    final user = DummyData.leaderboardUsers[index];
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 600),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: LeaderboardTile(
                            user: user,
                            rank: index + 1,
                          ).animate(delay: (100 * index).ms)
                            .slideX(begin: 0.2, end: 0)
                            .fadeIn(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Leaderboard',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
          )
          .animate()
          .fadeIn(duration: 600.ms)
          .scale(delay: 200.ms),
          const SizedBox(height: 16),
          Text(
            'Top Fundraisers This Month',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
                ),
          )
          .animate()
          .fadeIn(duration: 600.ms)
          .moveY(begin: 16, end: 0, delay: 400.ms),
          const SizedBox(height: 16),
          _buildTopThree(context),
        ],
      ),
    );
  }

  Widget _buildTopThree(BuildContext context) {
    final topThree = DummyData.leaderboardUsers.take(3).toList();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(topThree.length, (index) {
        final user = topThree[index];
        final rank = index + 1;
        final isFirst = rank == 1;
        final size = isFirst ? 80.0 : 60.0;

        return Column(
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: _getRankColor(rank).withOpacity(0.2),
                shape: BoxShape.circle,
                border: Border.all(
                  color: _getRankColor(rank),
                  width: 2,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.emoji_events,
                  size: isFirst ? 40 : 30,
                  color: _getRankColor(rank),
                ),
              ),
            )
            .animate()
            .scale(delay: (200 * index).ms, duration: 600.ms)
            .shimmer(delay: (400 * index).ms),
            const SizedBox(height: 8),
            Text(
              user.name,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: isFirst ? 16 : 14,
              ),
            ),
            Text(
              '${user.donations}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
                fontSize: isFirst ? 14 : 12,
              ),
            ),
          ],
        );
      }),
    );
  }

  Color _getRankColor(int rank) {
    switch (rank) {
      case 1:
        return Colors.amber; // Gold
      case 2:
        return Colors.grey[300]!; // Silver
      case 3:
        return Colors.brown[300]!; // Bronze
      default:
        return Colors.grey[100]!;
    }
  }
}