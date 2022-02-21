part of '../home_page.dart';

String imageString = "";

class AddTodoAlertDialog extends StatelessWidget {
  const AddTodoAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _titleController = TextEditingController();
    final _descriptionController = TextEditingController();
    return AlertDialog(
      backgroundColor: Colors.purple.shade200,
      title: const Text(
        "Add ToDo",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Title'),
            controller: _titleController,
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Description'),
            controller: _descriptionController,
          ),
          ElevatedButton.icon(
            icon: const Icon(
              Icons.image,
              color: Colors.white,
              size: 24.0,
            ),
            label: const Text('Add image'),
            onPressed: () {
              pickImage(context);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.purple.shade300,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          )
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () async {
            final todo = ToDoItem(
                title: _titleController.value.text.toString(),
                description: _descriptionController.value.text.toString(),
                imageUrl: imageString);
            context.read<TodoBloc>().add(AddTodo(toDoItem: todo));

            imageString = "";
            Navigator.pop(context);
          },
          child: const Text(
            "ADD",
            style: TextStyle(color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.black12,
          ),
        )
      ],
    );
  }

  Future pickImage(BuildContext context) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);
    imageString = ImageConverter.base64String(imageTemporary.readAsBytesSync());
  }
}
