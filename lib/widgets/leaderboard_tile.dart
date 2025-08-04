import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/leaderboard_user.dart';

class LeaderboardTile extends StatelessWidget {
  final LeaderboardUser user;
  final int rank;

  const LeaderboardTile({
    super.key,
    required this.user,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        elevation: 4,
        shadowColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.surface.withOpacity(0.9),
                Theme.of(context).colorScheme.surface.withOpacity(0.7),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              // Add tap animation using flutter_animate
              context.findAncestorStateOfType<State>()?.setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  _buildRankBadge(context),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                 color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Total Donations',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                              ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '₹${user.donations}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ).animate(onPlay: (controller) => controller.repeat())
  .shimmer(duration: 500.ms, delay: 500.ms)
  .animate() // This creates a new animation chain
  .scale(duration: 500.ms)
  .then()
  .scale(duration: 500.ms)
    );
  }

  Widget _buildRankBadge(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _getRankColor(rank).withOpacity(0.2),
        border: Border.all(
          color: _getRankColor(rank),
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          rank.toString(),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: _getRankColor(rank),
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    ).animate()
      .scale(duration: 300.ms)
      .then(delay: 200.ms)
      .shimmer(duration: 1000.ms);
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
        return Colors.grey[400]!;
    }
  }
}