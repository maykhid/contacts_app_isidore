import 'package:contacts_app_isidore/app/feature/home/ui/screen/home.dart';
import 'package:contacts_app_isidore/app/feature/home/ui/widgets/contacts_card.dart';
import 'package:contacts_app_isidore/core/ui/ui.dart';
import 'package:contacts_app_isidore/core/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
