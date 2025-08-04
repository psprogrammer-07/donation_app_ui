import '../models/leaderboard_user.dart';

class DummyData {
  static final List<LeaderboardUser> leaderboardUsers = [
    LeaderboardUser(name: 'John Doe', donations: 10000),
    LeaderboardUser(name: 'Jane Smith', donations: 8500),
    LeaderboardUser(name: 'Alex Johnson', donations: 7200),
    LeaderboardUser(name: 'Sarah Wilson', donations: 6800),
    LeaderboardUser(name: 'Mike Brown', donations: 5500),
  ];

  static final List<Map<String, dynamic>> announcements = [
    {
      'title': 'New Fundraising Campaign',
      'description': 'Join our latest campaign to support education for underprivileged children',
      'date': '2024-01-15',
    },
    {
      'title': 'Monthly Achievement Awards',
      'description': 'Congratulations to our top performers this month!',
      'date': '2024-01-10',
    },
    {
      'title': 'Upcoming Virtual Event',
      'description': 'Don\'t miss our virtual fundraising workshop next week',
      'date': '2024-01-05',
    },
  ];

  static final List<Map<String, dynamic>> rewards = [
    {
      'title': 'Bronze Badge',
      'description': 'Raise ₹1,000',
      'icon': 'assets/bronze_badge.svg',
      'isUnlocked': true,
    },
    {
      'title': 'Silver Badge',
      'description': 'Raise ₹5,000',
      'icon': 'assets/silver_badge.svg',
      'isUnlocked': true,
    },
    {
      'title': 'Gold Badge',
      'description': 'Raise ₹10,000',
      'icon': 'assets/gold_badge.svg',
      'isUnlocked': false,
    },
  ];
}