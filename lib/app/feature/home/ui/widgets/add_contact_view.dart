import 'package:contacts_app_isidore/core/extensions/sized_context.dart';
import 'package:contacts_app_isidore/core/ui/ui.dart';
import 'package:contacts_app_isidore/core/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

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

