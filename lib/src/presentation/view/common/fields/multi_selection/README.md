# Multi Dropdown Form Field

A modern multi-select form field component with an improved UI inspired by SearchFormField, using the same logic structure as the existing multi-select field.

## Features

- ✅ **Same Logic Structure** - Uses the existing `FormFiledDynamicListStateInterface` 
- ✅ **Remote & Local Data** - Full support for both remote API calls and local data sources
- ✅ **Modern UI** - Improved dropdown UI with InputDecorator, proper borders, and Card elevation
- ✅ **Search Functionality** - Built-in search with customizable hints and styling
- ✅ **Form Integration** - Full integration with Flutter Form Builder
- ✅ **Validation Support** - Built-in form validation
- ✅ **Customizable Styling** - Flexible decoration options with DecorationField support
- ✅ **Max Selection Limits** - Optionally limit number of selections
- ✅ **Selection Callbacks** - Handle individual item selections
- ✅ **Nice Visual Design** - Follows SearchFormField design patterns

## Implementation Note

This implementation uses a custom dropdown UI inspired by SearchFormField's design patterns, providing:
- **InputDecorator** with FormFieldBorders for consistent styling
- **Card** with ClipRRect and elevation for modern dropdown appearance
- **ListTile** with proper visual density for clean item display
- **Chip-based** selection display with colored indicators

## Local Data Source Support

The component fully supports local data sources by passing a list of models directly:

```dart
// Define your model
class Category {
  final int id;
  final String name;
  final String description;
  
  Category({required this.id, required this.name, required this.description});
}

// Local data
final List<Category> categories = [
  Category(id: 1, name: 'Electronics', description: 'Electronic devices'),
  Category(id: 2, name: 'Clothing', description: 'Apparel and accessories'),
  Category(id: 3, name: 'Books', description: 'Books and literature'),
];

// Usage with local data
MultiDropdownFormField<Category, int>(
  name: 'categories',
  dataSource: DataSource.local,
  localData: categories,
  endPoint: '', // Not used for local data
  itemBuilder: (category) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(category.name, style: TextStyle(fontWeight: FontWeight.bold)),
      Text(category.description, style: TextStyle(fontSize: 12, color: Colors.grey)),
    ],
  ),
  itemLabelExtractor: (category) => category.name,
  converter: (category) => category.id,
  searchEnabled: true,
  maxSelections: 5,
  decorationField: DecorationField(
    hintText: 'Select categories',
    borderColor: Colors.blue,
    radiusBorder: 12,
  ),
)
```

### Enum Support

The component works excellently with Dart enums:

```dart
// Using Gender enum from the app
MultiDropdownFormField<Gender, String>(
  name: 'gender',
  dataSource: DataSource.local,
  localData: Gender.values,
  endPoint: '', // Not used for local data
  itemBuilder: (gender) => Row(
    children: [
      Icon(
        gender.name.toLowerCase() == 'male' ? Icons.male : Icons.female,
        color: gender.name.toLowerCase() == 'male' ? Colors.blue : Colors.pink,
      ),
      SizedBox(width: 8),
      Text(gender.name.toLowerCase() == 'male' ? 'Male' : 'Female'),
    ],
  ),
  itemLabelExtractor: (gender) => gender.name.toLowerCase() == 'male' ? 'Male' : 'Female',
  converter: (gender) => gender.apiType, // Convert to API format
  searchEnabled: false, // Not needed for only 2 options
)
```

## Basic Usage

### Local Data Source

```dart
MultiDropdownFormField<Country, int>(
  name: 'countries',
  dataSource: DataSource.local,
  localData: _countries,
  endPoint: '', // Not used for local data
  itemBuilder: (country) => ListTile(
    title: Text(country.name),
    subtitle: Text(country.code),
  ),
  itemLabelExtractor: (country) => country.name,
  converter: (country) => country.id,
  searchEnabled: true,
  searchHintText: 'Search countries...',
  maxSelections: 3,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please select at least one country';
    }
    return null;
  },
)
```

### Remote Data Source

```dart
MultiDropdownFormField<User, int>(
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
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please select users';
    }
    return null;
  },
)
```

## Parameters

| Parameter | Type | Description | Required |
|-----------|------|-------------|----------|
| `name` | `String` | Form field name | ✅ |
| `itemBuilder` | `Widget Function(MODEL)` | Widget builder for each item | ✅ |
| `itemLabelExtractor` | `String Function(MODEL)` | Extract display label from model | ✅ |
| `endPoint` | `String` | API endpoint for remote data | ✅ |
| `converter` | `R Function(MODEL)` | Convert model to return type | ✅ |
| `dataSource` | `DataSource?` | Local or remote data source | ❌ |
| `localData` | `List<MODEL>?` | Data for local source | ❌ |
| `initValue` | `List<MODEL>?` | Initial selected values | ❌ |
| `queries` | `Map<String, dynamic>?` | Query parameters for API | ❌ |
| `selectItem` | `Function(MODEL)?` | Callback for item selection | ❌ |
| `maxSelections` | `int?` | Maximum number of selections | ❌ |
| `searchEnabled` | `bool` | Enable search functionality | ❌ |
| `searchHintText` | `String?` | Search field hint text | ❌ |
| `dropdownHeight` | `double?` | Max height of dropdown | ❌ |
| `validator` | `String? Function(List<R>?)?` | Form validation function | ❌ |

## Data Models

Your data models should implement proper `==` and `hashCode` methods:

```dart
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
```

## Form Integration

```dart
final _formKey = GlobalKey<FormBuilderState>();

FormBuilder(
  key: _formKey,
  child: Column(
    children: [
      MultiDropdownFormField<Country, int>(
        name: 'countries',
        // ... other parameters
      ),
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.saveAndValidate() ?? false) {
            final formData = _formKey.currentState!.value;
            // Handle form data
            print('Selected countries: ${formData['countries']}');
          }
        },
        child: Text('Submit'),
      ),
    ],
  ),
)
```

## Styling

The component uses the app's color scheme and can be customized through:

- **Chip Decoration** - Selected items appear as colored chips
- **Search Styling** - Search field with app colors
- **Dropdown Styling** - Modern dropdown with elevation and border radius
- **Item Styling** - Custom item builders with selection indicators

## Dependencies

Make sure you have these packages in your `pubspec.yaml`:

```yaml
dependencies:
  flutter_form_builder: ^9.3.0
  flutter_bloc: ^8.1.6
```

## File Structure

```
lib/src/presentation/view/common/fields/multi_selection/
├── multi_dropdown_form_field.dart           # Main form field
├── assistance/
│   └── multi_dropdown_field_widget.dart     # Internal widget
├── usage_examples/
│   └── multi_dropdown_usage_example.dart    # Usage examples
└── README.md                                # This documentation
```

## Migration from MultiSelectFormField

The new `MultiDropdownFormField` has the same API as `MultiSelectFormField` with one additional required parameter:

```dart
// Add this parameter when migrating:
itemLabelExtractor: (model) => model.displayName,
```

All other parameters remain the same, making migration straightforward. 