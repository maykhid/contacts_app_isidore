import 'package:contacts_app_isidore/core/extensions/sized_context.dart';
import 'package:contacts_app_isidore/core/router/navigation_service.dart';
import 'package:contacts_app_isidore/core/router/route_names.dart';
import 'package:contacts_app_isidore/core/service_locator.dart';
import 'package:contacts_app_isidore/core/ui/ui.dart';
import 'package:contacts_app_isidore/core/ui/widgets/widgets.dart';
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
                // const _NoContacts(),

                // if contacts exist
                SizedBox(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My Contacts',
                            style: AppTextStyles.normalTextPrimary,
                          ),
                          Container(
                            height: 35,
                            width: 45,
                            decoration: BoxDecoration(
                              color: AppColors.deepPurple,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 140,
                        width: context.width,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            // name container
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: AppColors.lightPink,
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                ),
                              ),

                              // name
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'John Doe',
                                      style: AppTextStyles.normalTextPrimary,
                                    ),
                                    const Icon(Icons.more_vert),
                                  ],
                                ),
                              ),
                            ),

                            // phone - email - address
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(12),
                                            child: SizedBox(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // phone  - email
                                                  Row(
                                                    children: [
                                                      // phone
                                                      const Icon(
                                                        Icons.phone_outlined,
                                                        color: Colors.grey,
                                                        size: 20,
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        '+2348089787654',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              context.width *
                                                                  0.029,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),

                                                      const SizedBox(
                                                        width: 10,
                                                      ),

                                                      // email
                                                      const Icon(
                                                        Icons.email_outlined,
                                                        color: Colors.grey,
                                                        size: 20,
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        'henryifebunandu@gmail.com',
                                                        style: TextStyle(
                                                          fontSize:
                                                              context.width *
                                                                  0.029,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  const SizedBox(
                                                    height: 8,
                                                  ),

                                                  // address
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons
                                                            .location_on_outlined,
                                                        color: Colors.grey,
                                                        size: 20,
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            context.width - 120,
                                                        child: Text(
                                                          'Plot 876, Akinsanya Oladosu street, Victoria Island, Lagos',
                                                          style: TextStyle(
                                                            fontSize:
                                                                context.width *
                                                                    0.029,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NoContacts extends StatelessWidget {
  const _NoContacts();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: AppColors.lightPurple,
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Center(
              child: Text(
                '😔',
                style: TextStyle(
                  fontSize: 70,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            'No Contacts',
            style: AppTextStyles.extraLargeTextPrimary,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: context.width * 0.7,
            child: Text(
              'To start adding your contacts, tap on "Add" button below',
              textAlign: TextAlign.center,
              style: AppTextStyles.largeTextGrey,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          AppButton(
            width: context.width * 0.45,
            onPressed: () => sl<NavigationService>().navigateTo(
              RouteNames.home,
            ),
            child: Text(
              'Add',
              style: AppTextStyles.normalTextWhite,
            ),
          ),
        ],
      ),
    );
  }
}
