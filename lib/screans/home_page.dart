// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_super_parameters

import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_app3/api/api.dart';
import 'package:flutter_app3/models/user.dart';
import 'package:flutter_app3/provuder/user_provider.dart';

import 'package:provider/provider.dart';

import '../widget/user_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Users',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: userProvider.isLoading
            ? Center(child: CircularProgressIndicator())
            : userProvider.errorMessage != null
                ? Center(child: Text(userProvider.errorMessage!))
                : ListView.builder(
                    itemCount: userProvider.users.length,
                    itemBuilder: (context, index) {
                      User user = userProvider.users[index];
                      int n = Random().nextInt(4) + 1;
                      return UserCard(
                        imagePath: 'assets/images/${n}.png',
                        user: user,
                      );
                    }),
      ),
    );
  }
}
