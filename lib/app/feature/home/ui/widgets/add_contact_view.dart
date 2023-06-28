import 'package:contacts_app_isidore/app/feature/home/ui/provider/home_provider.dart';
import 'package:contacts_app_isidore/core/data/data_source/remote/loading_state.dart';
import 'package:contacts_app_isidore/core/extensions/sized_context.dart';
import 'package:contacts_app_isidore/core/extensions/validation_extension.dart';
import 'package:contacts_app_isidore/core/router/navigation_service.dart';
import 'package:contacts_app_isidore/core/service_locator.dart';
import 'package:contacts_app_isidore/core/ui/ui.dart';
import 'package:contacts_app_isidore/core/ui/widgets/app_snackbar.dart';
import 'package:contacts_app_isidore/core/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:provider/provider.dart';

class AddContactView extends StatefulWidget {
  const AddContactView({
    required this.homeProvider,
    super.key,
  });

  final HomeProvider homeProvider;

  @override
  State<AddContactView> createState() => _AddContactViewState();
}

class _AddContactViewState extends State<AddContactView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _homeAddressController = TextEditingController();

  final _emailValidator = ValidationBuilder().email().build();
  final _phoneValidator = ValidationBuilder().phone().build();
  final _nameValidator = ValidationBuilder().name().build();
  final _homeAddressValidator = ValidationBuilder().homeAddress().build();

  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _phone = '';
  String _name = '';
  String _home = '';

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    _homeAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.82,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  controller: _nameController,
                  validate: _nameValidator,
                  onSaved: (String? name) => _name = name!,
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
                  controller: _phoneController,
                  validate: _phoneValidator,
                  textInputType: TextInputType.phone,
                  onSaved: (String? phone) => _phone = phone!,
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
                  controller: _emailController,
                  validate: _emailValidator,
                  textInputType: TextInputType.emailAddress,
                  onSaved: (String? email) => _email = email!,
                ),

                const SizedBox(
                  height: 25,
                ),

                // Home Address
                Text(
                  'Home Address',
                  style: AppTextStyles.normalTextPrimary,
                ),
                const SizedBox(
                  height: 10,
                ),
                AppTextField(
                  hintText: 'Enter address of contact',
                  controller: _homeAddressController,
                  validate: _homeAddressValidator,
                  onSaved: (String? home) => _home = home!,
                ),

                const SizedBox(
                  height: 35,
                ),

                // add contact
                ChangeNotifierProvider.value(
                  value: widget.homeProvider,
                  // updateShouldNotify: (previous, current) =>
                  //     current.loadingState != previous.loadingState,
                  builder: (context, _) {
                    return Consumer<HomeProvider>(
                      builder: (context, homeProvider, _) {
                        return AppButton(
                          isLoading:
                              homeProvider.loadingState == LoadingState.busy,
                          width: context.width,
                          onPressed: () => _handleAddContact(context),
                          child: Text(
                            'Add Contact',
                            style: AppTextStyles.normalTextWhite,
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleAddContact(BuildContext context) async {
    final isValid = _formKey.currentState!.validate();
    final homeProvider = context.read<HomeProvider>();

    if (isValid) {
      _formKey.currentState!.save();
      await homeProvider.addContact(
        name: _name,
        address: _home,
        email: _email,
        phone: _phone,
      );

      if (homeProvider.loadingState == LoadingState.done) {
        await homeProvider.getAllContacts();
        sl<NavigationService>().pop();
      } else {
        // show error
         sl<NavigationService>().pop();
        // ignore: use_build_context_synchronously
        AppSnackBar.showErrorSnackBar(context, homeProvider.errorMsg);
      }
    }
  }
}
