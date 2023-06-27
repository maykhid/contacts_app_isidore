import 'package:contacts_app_isidore/app/feature/home/data/repository/contacts_repository.dart';
import 'package:contacts_app_isidore/app/feature/home/ui/provider/home_provider.dart';
import 'package:contacts_app_isidore/app/feature/home/ui/widgets/contacts.dart';
import 'package:contacts_app_isidore/app/feature/home/ui/widgets/no_contacts_view.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/loading_state.dart';
import 'package:contacts_app_isidore/core/extensions/sized_context.dart';
import 'package:contacts_app_isidore/core/service_locator.dart';
import 'package:contacts_app_isidore/core/ui/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          HomeProvider(contactsRepository: sl<ContactsRepository>())
            ..getAllContacts(),
      child: Scaffold(
        body: SizedBox.expand(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: context.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // greet
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi,',
                                style: AppTextStyles.largeTextPrimary,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'How are you doing today?',
                                style: AppTextStyles.smallTextGrey,
                              ),
                            ],
                          ),
            
                          // bell
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColors.lightPurple,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(Icons.notifications_none),
                          ),
                        ],
                      ),
                    ),
            
                    const SizedBox(
                      height: 40,
                    ),
            
                    Consumer<HomeProvider>(
                      builder: (context, homeProvider, _) {
                        switch (homeProvider.loadingState) {
                          case LoadingState.busy:
                            return const Center(
                              child: CupertinoActivityIndicator(),
                            );
                          case LoadingState.done:
                            if (homeProvider.contactResponse.contacts.isEmpty) {
                              return const NoContactsView();
                            } else {
                              return const Contacts();
                            }
            
                          case LoadingState.error:
                            return Center(child: Text(homeProvider.errorMsg));
            
                          case LoadingState.idle:
                            return const NoContactsView();
                        }
                      },
                    ),
            
                    // if no contacts
                    // const NoContactsView(),
            
                    // if contacts exist
                    // const Contacts(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
