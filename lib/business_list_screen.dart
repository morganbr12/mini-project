

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mini_app/business_provider.dart';
import 'package:mini_app/business_card.dart';

class BusinessListScreen extends StatelessWidget {
  const BusinessListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BusinessProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Businesses')),
      body: Builder(
        builder: (context) {
          if (provider.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.error != null) {
            return Center(child: Text(provider.error!));
          }
          if (provider.businesses.isEmpty) {
            return const Center(child: Text('No businesses found'));
          }
          return ListView.builder(
            itemCount: provider.businesses.length,
            itemBuilder: (context, index) {
              final business = provider.businesses[index];
              return BusinessCard<Business>(
                item: business,
                title: business.name,
                subtitle: business.location,
                trailing: business.contact,
              );
            },
          );
        },
      ),
    );
  }
}
