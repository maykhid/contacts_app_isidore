import 'package:contacts_app_isidore/app/feature/home/ui/widgets/add_contact_view.dart';
import 'package:contacts_app_isidore/core/extensions/sized_context.dart';
import 'package:contacts_app_isidore/core/ui/ui.dart';
import 'package:contacts_app_isidore/core/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class NoContactsView extends StatelessWidget {
  const NoContactsView({
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
