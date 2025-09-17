// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

// Project imports:
import '../../../../../../core/config/app_colors.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../../../../core/utils/extension.dart';
import '../../../text_widget.dart';
import '../../_field_helper/decoration_field.dart';
import '../multi_dropdown_form_field.dart';
import '../multi_select_form_field.dart';

// Sample data models
class Country {
  final int id;
  final String name;
  final String code;

  Country({required this.id, required this.name, required this.code});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Country && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class Company {
  final int id;
  final String name;
  final String type;

  Company({required this.id, required this.name, required this.type});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Company && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class MultiDropdownUsageExample extends StatefulWidget {
  const MultiDropdownUsageExample({super.key});

  @override
  State<MultiDropdownUsageExample> createState() =>
      _MultiDropdownUsageExampleState();
}

class _MultiDropdownUsageExampleState extends State<MultiDropdownUsageExample> {
  final _formKey = GlobalKey<FormBuilderState>();

  // Sample data
  final List<Country> _countries = [
    Country(id: 1, name: 'United States', code: 'US'),
    Country(id: 2, name: 'Canada', code: 'CA'),
    Country(id: 3, name: 'United Kingdom', code: 'UK'),
    Country(id: 4, name: 'Germany', code: 'DE'),
    Country(id: 5, name: 'France', code: 'FR'),
    Country(id: 6, name: 'Japan', code: 'JP'),
    Country(id: 7, name: 'Australia', code: 'AU'),
  ];

  final List<Company> _companies = [
    Company(id: 1, name: 'Apple Inc.', type: 'Technology'),
    Company(id: 2, name: 'Microsoft Corp.', type: 'Technology'),
    Company(id: 3, name: 'Google LLC', type: 'Technology'),
    Company(id: 4, name: 'Amazon Inc.', type: 'E-commerce'),
    Company(id: 5, name: 'Tesla Inc.', type: 'Automotive'),
    Company(id: 6, name: 'Meta Platforms', type: 'Social Media'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(text: 'Multi Dropdown Examples'),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                TextWidget(
                  text: 'Multi Dropdown Form Fields',
                  style: context.titleL?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimaryColor,
                  ),
                ),
                24.ph,

                // Countries Multi Dropdown (Local Data)
                TextWidget(
                  text: '1. Countries Selection (Local Data - Improved UI)',
                  style: context.titleM?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimaryColor,
                  ),
                ),
                12.ph,
                // MultiDropdownFormField<Country, int>(
                //   name: 'countries',
                //   dataSource: DataSource.local,
                //   localData: _countries,
                //   endPoint: '', // Not used for local data
                //   itemBuilder: (country) => Row(
                //     children: [
                //       Container(
                //         width: 30,
                //         height: 20,
                //         decoration: BoxDecoration(
                //           color: AppColors.primaryColor.withValues(alpha: 0.1),
                //           borderRadius: BorderRadius.circular(4),
                //           border: Border.all(
                //               color: AppColors.primaryColor
                //                   .withValues(alpha: 0.3)),
                //         ),
                //         child: Center(
                //           child: TextWidget(
                //             text: country.code,
                //             style: context.bodyS?.copyWith(
                //               fontSize: 10,
                //               fontWeight: FontWeight.bold,
                //               color: AppColors.primaryColor,
                //             ),
                //           ),
                //         ),
                //       ),
                //       12.pw,
                //       Expanded(
                //         child: TextWidget(
                //           text: country.name,
                //           style: context.bodyM?.copyWith(
                //             color: AppColors.textPrimaryColor,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                //   itemLabelExtractor: (country) => country.name,
                //   converter: (country) => country.id,
                //   searchEnabled: true,
                //   searchHintText: 'Search countries...',
                //   maxSelections: 3, // Limit to 3 selections
                //   decorationField: DecorationField(
                //     hintText: 'Select up to 3 countries',
                //     fillBackgroundColor: false,
                //     borderColor: AppColors.grey100,
                //     radiusBorder: 8,
                //   ),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please select at least one country';
                //     }
                //     return null;
                //   },
                //   selectItem: (country) {
                //     // Handle individual selection if needed
                //     print('Selected country: ${country.name}');
                //   },
                // ),
                24.ph,

                // Companies Multi Dropdown (Local Data with different styling)
                TextWidget(
                  text: '2. Companies Selection (Local Data)',
                  style: context.titleM?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimaryColor,
                  ),
                ),
                12.ph,
                MultiDropdownFormField<Company, int>(
                  name: 'companies',
                  compareItem: (model1, model2) => model1.id == model2.id,
                  dataSource: DataSource.local,
                  localData: _companies,
                  endPoint: '', // Not used for local data
                  itemBuilder: (company) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: company.name,
                        style: context.bodyM?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimaryColor,
                        ),
                      ),
                      4.ph,
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: _getCompanyTypeColor(company.type)
                              .withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: _getCompanyTypeColor(company.type)
                                .withValues(alpha: 0.3),
                          ),
                        ),
                        child: TextWidget(
                          text: company.type,
                          style: context.bodyS?.copyWith(
                            fontSize: 10,
                            color: _getCompanyTypeColor(company.type),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  itemLabelExtractor: (company) => company.name,
                  converter: (company) => company.id,
                  searchEnabled: true,
                  searchHintText: 'Search companies...',
                  selectItem: (company) {
                    print(
                        'Selected company: ${company.name} (${company.type})');
                  },
                ),
                24.ph,

                // Gender Multi Dropdown (Enum Data)
                TextWidget(
                  text: '3. Gender Selection (Enum Data)',
                  style: context.titleM?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimaryColor,
                  ),
                ),
                12.ph,
                MultiDropdownFormField<Gender, String>(
                  name: 'gender',
                  dataSource: DataSource.local,
                  compareItem: (model1, model2) => model1 == model2,
                  localData: Gender.values,
                  endPoint: '', // Not used for local data
                  itemBuilder: (gender) => Row(
                    children: [
                      Icon(
                        gender.name.toLowerCase() == 'male'
                            ? Icons.male
                            : Icons.female,
                        color: gender.name.toLowerCase() == 'male'
                            ? Colors.blue
                            : Colors.pink,
                        size: 20,
                      ),
                      12.pw,
                      Expanded(
                        child: TextWidget(
                          text: gender.name.toLowerCase() == 'male'
                              ? 'Male'
                              : 'Female',
                          style: context.bodyM?.copyWith(
                            color: AppColors.textPrimaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  itemLabelExtractor: (gender) =>
                      gender.name.toLowerCase() == 'male' ? 'Male' : 'Female',
                  converter: (gender) => gender.apiType,
                  searchEnabled: false, // Not needed for only 2 options
                  decorationField: DecorationField(
                    hintText: 'Select gender',
                    fillBackgroundColor: false,
                    borderColor: AppColors.grey100,
                    radiusBorder: 8,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select gender';
                    }
                    return null;
                  },
                  selectItem: (gender) {
                    print('Selected gender: ${gender.apiType}');
                  },
                ),
                24.ph,

                // Remote Data Example (Commented out - would need actual API)
                TextWidget(
                  text: '4. Remote Data Example',
                  style: context.titleM?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimaryColor,
                  ),
                ),
                12.ph,
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.grey100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.grey100),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Remote Data Usage:',
                        style: context.bodyM?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimaryColor,
                        ),
                      ),
                      8.ph,
                      const TextWidget(
                        text: '''MultiDropdownFormField<User, int>(
  name: 'users',
  dataSource: DataSource.remote,
  endPoint: '/api/users',
  queries: {'active': true, 'limit': 100},
  itemBuilder: (user) => ListTile(
    leading: CircleAvatar(child: Text(user.initials)),
    title: Text(user.name),
    subtitle: Text(user.email),
  ),
  itemLabelExtractor: (user) => user.name,
  converter: (user) => user.id,
  searchEnabled: true,
  decoration: InputDecoration(
    labelText: 'Select Users',
    border: OutlineInputBorder(),
  ),
),''',
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 12,
                          color: AppColors.textSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                24.ph,

                // Form Actions
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.saveAndValidate() ??
                              false) {
                            final formData = _formKey.currentState!.value;
                            _showFormData(formData);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const TextWidget(
                          text: 'Submit Form',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    16.pw,
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          _formKey.currentState?.reset();
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColors.primaryColor),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const TextWidget(
                          text: 'Reset Form',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getCompanyTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'technology':
        return Colors.blue;
      case 'e-commerce':
        return Colors.orange;
      case 'automotive':
        return Colors.green;
      case 'social media':
        return Colors.purple;
      default:
        return AppColors.primaryColor;
    }
  }

  void _showFormData(Map<String, dynamic> formData) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const TextWidget(text: 'Form Data'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget(
                text:
                    'Selected Countries: ${formData['countries']?.toString() ?? 'None'}',
                style: context.bodyM,
              ),
              8.ph,
              TextWidget(
                text:
                    'Selected Companies: ${formData['companies']?.toString() ?? 'None'}',
                style: context.bodyM,
              ),
              8.ph,
              TextWidget(
                text:
                    'Selected Gender: ${formData['gender']?.toString() ?? 'None'}',
                style: context.bodyM,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const TextWidget(text: 'Close'),
          ),
        ],
      ),
    );
  }
}
