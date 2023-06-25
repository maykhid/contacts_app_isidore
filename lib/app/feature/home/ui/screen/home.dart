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
                const NoContacts(),

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

class Contacts extends StatelessWidget {
  const Contacts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Contacts',
                style: AppTextStyles.normalTextPrimary,
              ),
              InkWell(
                onTap: () => AppModal.showAppModal(
                  context,
                  const AddContactView(),
                ),
                child: Container(
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
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          // contacts card
          const ContactsCard(),
        ],
      ),
    );
  }
}

class ContactsCard extends StatelessWidget {
  const ContactsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                        fontSize: context.width * 0.029,
                                        fontWeight: FontWeight.w600,
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
                                        fontSize: context.width * 0.029,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
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
                                      Icons.location_on_outlined,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                      width: context.width - 120,
                                      child: Text(
                                        'Plot 876, Akinsanya Oladosu street, Victoria Island, Lagos',
                                        style: TextStyle(
                                          fontSize: context.width * 0.029,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
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
    );
  }
}

class AddContactView extends StatelessWidget {
  const AddContactView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.82,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Contact',
                style: AppTextStyles.normalTextPrimary3,
              ),

              const SizedBox(
                height: 40,
              ),

              // name
              Text(
                'Name',
                style: AppTextStyles.normalTextPrimary,
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextField(
                hintText: 'Contact name',
                controller: TextEditingController(),
              ),

              const SizedBox(
                height: 25,
              ),

              // phone
              Text(
                'Phone',
                style: AppTextStyles.normalTextPrimary,
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextField(
                hintText: '+234',
                controller: TextEditingController(),
              ),

              const SizedBox(
                height: 25,
              ),

              // Email
              Text(
                'Email',
                style: AppTextStyles.normalTextPrimary,
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextField(
                hintText: 'example@email.com',
                controller: TextEditingController(),
              ),

              const SizedBox(
                height: 25,
              ),

              // Home Address
              Text(
                'Name',
                style: AppTextStyles.normalTextPrimary,
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextField(
                hintText: 'Enter address of contact',
                controller: TextEditingController(),
              ),

              const SizedBox(
                height: 35,
              ),

              // add contact
              AppButton(
                width: context.width,
                onPressed: () {},
                child: Text(
                  'Add Contact',
                  style: AppTextStyles.normalTextWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoContacts extends StatelessWidget {
  const NoContacts({
    super.key,
  });

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
            onPressed: () => AppModal.showAppModal(
              context,
              const AddContactView(),
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
