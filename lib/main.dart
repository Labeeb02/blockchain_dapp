import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// function to trigger build when the app is run
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const HomeRoute(),
      '/second': (context) => const SecondRoute(),
      '/third': (context) => const ThirdRoute(),
    },
  )); //MaterialApp
}

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Owner Dapp'),
        backgroundColor: Colors.green,
      ), // AppBar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Send Details To RA'),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
            SizedBox(height: 16.0),// ElevatedButton
            ElevatedButton(
              child: const Text('Verify Public Key'),
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
            ), //
            SizedBox(height: 16.0),// ElevatedButton
            ElevatedButton(
              child: const Text('Publish To BlockChain'),
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
            ), // ElevatedButton
          ], // <Widget>[]
        ), // Column
      ), // Center
    ); // Scaffold
  }
}



class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dateOfBirthController = TextEditingController();


  final _phoneNumberController = TextEditingController();
  final _publicKeyController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _dateOfBirthController.dispose();
    _phoneNumberController.dispose();
    _publicKeyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Input"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return

                      'Please enter your name.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _dateOfBirthController,
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your date of birth.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return

                      'Please enter your phone number.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _publicKeyController,
                decoration: InputDecoration(
                  labelText: 'Public Key',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your public key.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    print(_nameController.text);
                    print(_dateOfBirthController.text);
                    print(_phoneNumberController.text);
                    print(_publicKeyController.text);
                    // final response = await http.post(
                    //   Uri.parse('http://localhost:3000/info'),
                    //   body: {
                    //     'name': _nameController.text,
                    //     'dateOfBirth': _dateOfBirthController.text,
                    //     'phoneNumber': _phoneNumberController.text,
                    //     'publicKey': _publicKeyController.text,
                    //   },
                    // );
                    //
                    // // Handle response
                    // if (response.statusCode == 200) {
                    //   // Show success message
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(content: Text('Data submitted successfully!')),
                    //   );
                    // } else {
                    //   // Show error message
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(content: Text('Error: ${response.statusCode}')),
                    //   );
                    // }
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 18), // Text style
                ),
              ),

              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                ),
                child: const Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Route"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final response = await http.get(
              Uri.parse('https://example.com/api/endpoint'),
            );
            // Handle the response
            if (response.statusCode == 200) {
              // Show success message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('API call successful!')),
              );
            } else {
              // Show error message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${response.statusCode}')),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            onPrimary: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 3,
          ),
          child: Text(
            'Call API',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}


//
// class ThirdRoute extends StatefulWidget {
//   const ThirdRoute({Key? key}) : super(key: key);
//   @override
//   _ThirdRouteState createState() => _ThirdRouteState();
// }
//
// class _ThirdRouteState extends State<ThirdRoute> {
//
// // class ThirdRoute extends StatelessWidget {
//
//
//   late Future<List<String>> onStrings;
//   late Future<List<String>> okStrings;
//   late Future<List<String>> vnStrings;
//   late Future<List<List<String>>> infoStrings;
//   Future<List<String>> getListFromMap(Future<Map<String, List<String>>> futureData,String which) async {
//     final Map<String, List<String>> dataMap = await futureData;
//
//     // Replace 'list1' with the key of the desired list
//     List<String> list1 = dataMap[which] ?? [];
//
//     return list1;
//   }
//   Future<List<List<String>>> transformFuture(Future<Map<String, List<String>>> futureMap) {
//     return futureMap.then((Map<String, List<String>> data) {
//       // Extract all the lists from the map and convert them to Future<List<String>>
//       List<Future<List<String>>> listFutures = data.values.map((list) async {
//         return list;
//       }).toList();
//
//       // Use Future.wait to wait for all list futures to complete
//       return Future.wait(listFutures);
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     Future<Map<String,List<String>>> m = fetchData();
//     onStrings = getListFromMap(m, 'onl');
//     okStrings = getListFromMap(m, 'okl');
//     vnStrings = getListFromMap(m, 'vnl');
//     infoStrings = transformFuture(m);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Requests"),
//         backgroundColor: Colors.green,
//       ),
//       body: FutureBuilder<List<List<String>>>(
//         future: infoStrings,//Future<List<String>>.value(['Item 1', 'Item 2', 'Item 3']),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             return StringListCardWidget(strings: snapshot.data ?? []);
//           }
//         },
//       ),// AppBar
//     ); // Scaffold
//   }
// }

Future<Map<String,List<String>>> fetchData() async {

  final response = await http.get(Uri.parse('http://localhost:3000/strings'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = jsonDecode(response.body);
    print(jsonData);
    // Assuming the API response contains two lists: list1 and list2
    List<String> list1 = (jsonData['ownerNameList'] as List).cast<String>();
    List<String> list2 = (jsonData['ownerKeyList'] as List).cast<String>();
    List<String> list3 = (jsonData['vehicleNoList'] as List).cast<String>();

    // Create a map to store the lists
    Map<String, List<String>> stringLists = {
      'onl': list1,
      'okl': list2,
      'vnl':list3,
    };

    return stringLists;
  } else {
    throw Exception('Failed to load data from the API');
  }
}

// Future<List<List<String>>> fetchData() async {
//   final response = await http.get(Uri.parse('http://localhost:3000/strings'));
//   if (response.statusCode == 200) {
//     final List<dynamic> data = jsonDecode(response.body);
//
//     // Assuming the API response is a list of strings
//     List<String> strings = data.cast<String>();
//
//     return strings;
//   } else {
//     throw Exception('Failed to load data from the API');
//   }
// }

class StringListCardWidget extends StatefulWidget {
  final List<List<String>> strings;

  StringListCardWidget({required this.strings});

  @override
  _StringListCardWidgetState createState() => _StringListCardWidgetState();
}

class _StringListCardWidgetState extends State<StringListCardWidget> {
  List<bool> isExpandedList=[];
  List<String> ownerNameList=[];
  List<String> ownerKeyList=[];
  List<String> vehicleNoList=[];
  @override
  void initState() {
    super.initState();
    // Initialize the isExpandedList with false for each card

    ownerNameList = widget.strings[0];
    ownerKeyList = widget.strings[1];
    vehicleNoList = widget.strings[2];
    isExpandedList = List.generate(ownerNameList.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ownerNameList.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              ListTile(
                title: Text(ownerNameList[index]),
                trailing: IconButton(
                  icon: Icon(
                    isExpandedList[index]
                        ? Icons.expand_less
                        : Icons.expand_more,
                  ),
                  onPressed: () {
                    setState(() {
                      isExpandedList[index] = !isExpandedList[index];
                    });
                  },
                ),
              ),
              if (isExpandedList[index])
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: [
                      Text(
                      'Additional content for ${ownerNameList[index]}',
                      style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Owner Public Key - ${ownerKeyList[index]}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Vehicle No - ${vehicleNoList[index]}',
                        style: TextStyle(fontSize: 16),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Add your validation logic here
                          // This function will be called when the button is pressed
                          // You can replace this with your own validation code.
                          print("Validation Button Pressed");
                        },
                        child: Text('Validate'),
                      )
                    ]
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
