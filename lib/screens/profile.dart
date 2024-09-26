import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('images/profile.png'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hey',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Ahmed',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Logged in via ahmed@gmail.com',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Divider(),
              buildProfileOption(
                icon: Icons.shopping_bag_outlined,
                title: 'My Orders',
                subtitle: 'Check your order status',
              ),
              buildProfileOption(
                icon: Icons.favorite_border,
                title: 'Wishlist',
                subtitle:
                    'Buy or collaborate from items and makers saved in Wishlist',
              ),
              buildProfileOption(
                icon: Icons.collections_bookmark_outlined,
                title: 'Collections',
                subtitle: 'Save and refer your Fashion collections',
              ),
              buildProfileOption(
                icon: Icons.card_giftcard_outlined,
                title: 'Coupons',
                subtitle: 'Browse coupons to get discount on HandmadeHive',
              ),
              buildProfileOption(
                icon: Icons.account_balance_wallet_outlined,
                title: 'Wallet',
                subtitle: 'Check your Wallet balance',
              ),
              buildProfileOption(
                icon: Icons.help_outline,
                title: 'Help and Support',
                subtitle: 'Get help for your account or orders',
              ),
            ],
          ),
        ),
      ),
    
    );
  }

  Widget buildProfileOption({IconData? icon, String? title, String? subtitle}) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.red),
          title: Text(title!),
          subtitle: Text(subtitle!),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),
        const Divider(),
      ],
    );
  }
}
