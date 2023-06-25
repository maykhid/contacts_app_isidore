import 'package:contacts_app_isidore/core/extensions/sized_context.dart';
import 'package:contacts_app_isidore/core/ui/ui.dart';
import 'package:flutter/material.dart';

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
