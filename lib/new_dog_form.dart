import 'package:flutter/material.dart';

import 'dog_model.dart';

class AddDogFormPage extends StatefulWidget {
  const AddDogFormPage({Key? key}) : super(key: key);

  @override
  State<AddDogFormPage> createState() => _AddDogFormPageState();
}

class _AddDogFormPageState extends State<AddDogFormPage> {
  // One TextEditingController for each form input:
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // You'll need the context in order for the Navigator to work.
  void submitPup(BuildContext context) {
    // First make sure there is some information in the form.
    // A dog needs a name, but may be location independent,
    // so we'll only abandon the save if there's no name.

    if (nameController.text.isEmpty) {
      print('Dogs need names!');

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          children: const <Widget>[
            Icon(
              Icons.warning,
              color: Colors.yellowAccent,
            ),
            Text('Pup need name')
          ],
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50))),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: 'got',
          onPressed: () {},
        ),
      ));
    } else {
      // Create a new dog with the information from the form.
      var newDog = Dog(nameController.text, locationController.text,
          descriptionController.text);
      // Pop the page off the route stack and pass the new
      // dog back to wherever this page was created.
      Navigator.of(context).pop(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new Dog'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: Colors.black54,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 32.0,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                    // Tell your textfield which controller it owns
                    controller: nameController,
                    // Every single time the text changes in a
                    // TextField, this onChanged callback is called
                    // and it passes in the value.
                    //
                    // Set the text of your controller to
                    // to the next value.
                    onChanged: (v) => {
                          nameController.text = v,
                          nameController.selection = TextSelection.fromPosition(
                              TextPosition(offset: nameController.text.length))
                        },
                    decoration: InputDecoration(
                      labelText: 'Name the Pup',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                    controller: locationController,
                    onChanged: (v) => {
                          locationController.text = v,
                          locationController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset: locationController.text.length))
                        },
                    decoration: InputDecoration(
                      labelText: "Pups location",
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                    controller: descriptionController,
                    onChanged: (v) => {
                          descriptionController.text = v,
                          descriptionController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset: descriptionController.text.length))
                        },
                    decoration: InputDecoration(
                      labelText: 'All about the pup',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Builder(
                  builder: (context) {
                    return ElevatedButton(
                      onPressed: () => submitPup(context),
                      child: const Text('Submit Pup'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
