import 'package:aiims_telephone_directory/config/theamdata.dart';
import 'package:aiims_telephone_directory/modal_view/GETDEAILS/get_details_cubit.dart';
import 'package:aiims_telephone_directory/modal_view/get_otp/get_otp_cubit.dart';
import 'package:aiims_telephone_directory/modal_view/login_cubit/login_cubit.dart';
import 'package:aiims_telephone_directory/route/pageroute.dart';
import 'package:aiims_telephone_directory/route/route_generater.dart';
import 'package:aiims_telephone_directory/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetOtpCubit(),
          ),
          BlocProvider(
            create: (context) => LoginCubit(),
          ),   BlocProvider(
            create: (context) => GetDetailsCubit(),
          ),
        ],
        child: MaterialApp(
          initialRoute: RoutePath.splash,
          onGenerateRoute: MyRoutes.generateRoute,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: lightMode
          // ThemeData(
          //   elevatedButtonTheme: ElevatedButtonThemeData(
          //       style: ElevatedButton.styleFrom(
          //           backgroundColor: Colors.green,
          //           foregroundColor: Colors.white)),
          //   primaryColor: Colors.green,
          //   useMaterial3: true,
          // ),
         //home: MyHomePage(),
        ),
      ),
    );
  }
}





class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // State variables for the main dropdown and drawer-specific dropdowns
  String? _selectedDrawer;
  String? _selectedItem1;
  String? _selectedItem2;
  String? _selectedItem3;
  String? _selectedItem4;

  // Sample lists for dropdown menus
  List<String> _drawerOptions = ['Drawer 1', 'Drawer 2'];
  List<String> _dropdownItems1 = ['Item 1', 'Item 2', 'Item 3'];
  Map<String, List<String>> _dropdownItemsMap1 = {
    'Item 1': ['Option 1A', 'Option 1B', 'Option 1C'],
    'Item 2': ['Option 2A', 'Option 2B'],
    'Item 3': ['Option 3A', 'Option 3B', 'Option 3C'],
  };

  List<String> _dropdownItems2 = ['Item A', 'Item B', 'Item C'];
  Map<String, List<String>> _dropdownItemsMap2 = {
    'Item A': ['Option A1', 'Option A2', 'Option A3'],
    'Item B': ['Option B1', 'Option B2'],
    'Item C': ['Option C1', 'Option C2', 'Option C3'],
  };

  // Variable to store the final selected value to be displayed on the screen
  String? _finalSelection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conditional Dropdowns in Drawer'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select a Drawer:',
                    style: TextStyle(fontSize: 16),
                  ),
                  DropdownButton<String>(
                    value: _selectedDrawer,
                    hint: Text('Select Drawer'),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedDrawer = newValue;
                        _selectedItem1 = null;
                        _selectedItem2 = null;
                        _selectedItem3 = null;
                        _selectedItem4 = null;
                        _finalSelection = null; // Reset final selection
                      });
                    },
                    items: _drawerOptions
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  if (_selectedDrawer == 'Drawer 1') ...[
                    SizedBox(height: 20),
                    Text(
                      'Select an item from Dropdown 1:',
                      style: TextStyle(fontSize: 16),
                    ),
                    DropdownButton<String>(
                      value: _selectedItem1,
                      hint: Text('Select Item'),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItem1 = newValue!;
                          _selectedItem2 = null; // Reset second dropdown
                          _finalSelection = null; // Reset final selection
                        });
                      },
                      items: _dropdownItems1
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    if (_selectedItem1 != null) ...[
                      SizedBox(height: 20),
                      Text(
                        'Select an option from Dropdown 2:',
                        style: TextStyle(fontSize: 16),
                      ),
                      DropdownButton<String>(
                        value: _selectedItem2,
                        hint: Text('Select Option'),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedItem2 = newValue!;
                            _finalSelection = 'Drawer 1 - $_selectedItem1: $_selectedItem2'; // Update final selection
                          });

                          // Close the drawer automatically after selecting the last dropdown value
                          Navigator.of(context).pop();
                        },
                        items: _dropdownItemsMap1[_selectedItem1]
                            ?.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ] else if (_selectedDrawer == 'Drawer 2') ...[
                    SizedBox(height: 20),
                    Text(
                      'Select an item from Dropdown 3:',
                      style: TextStyle(fontSize: 16),
                    ),
                    DropdownButton<String>(
                      value: _selectedItem3,
                      hint: Text('Select Item'),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItem3 = newValue!;
                          _selectedItem4 = null; // Reset second dropdown
                          _finalSelection = null; // Reset final selection
                        });
                      },
                      items: _dropdownItems2
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    if (_selectedItem3 != null) ...[
                      SizedBox(height: 20),
                      Text(
                        'Select an option from Dropdown 4:',
                        style: TextStyle(fontSize: 16),
                      ),
                      DropdownButton<String>(
                        value: _selectedItem4,
                        hint: Text('Select Option'),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedItem4 = newValue!;
                            _finalSelection = 'Drawer 2 - $_selectedItem3: $_selectedItem4'; // Update final selection
                          });

                          // Close the drawer automatically after selecting the last dropdown value
                          Navigator.of(context).pop();
                        },
                        items: _dropdownItemsMap2[_selectedItem3]
                            ?.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          _finalSelection != null
              ? 'Selected: $_finalSelection'
              : 'Make a selection in the drawer to see the result here!',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

