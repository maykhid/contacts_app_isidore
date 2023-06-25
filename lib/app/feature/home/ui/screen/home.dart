import 'package:contacts_app_isidore/app/feature/home/ui/widgets/no_contacts_view.dart';
import 'package:contacts_app_isidore/core/extensions/sized_context.dart';
import 'package:contacts_app_isidore/core/ui/ui.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: SafeArea(
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

                // if no contacts
                const NoContactsView(),

                // if contacts exist
                // const Contacts(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
