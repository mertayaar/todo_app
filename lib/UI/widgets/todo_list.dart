part of '../home_page.dart';

class ListOfTodo extends StatelessWidget {
  final ToDoItem toDoItem;

  const ListOfTodo({Key? key, required this.toDoItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Image? decodeImg;
    if (toDoItem.imageUrl!.length > 1) {
      decodeImg = ImageConverter.imageFromBase64String(toDoItem.imageUrl!);
    }
    return Padding(
      padding: const EdgeInsets.only(
        top: 82,
        left: 25,
        right: 25,
      ),
      child: Container(
        width: 268,
        height: 130,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0)
          ],
          border: Border.all(color: Colors.black12, width: 2),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(27),
            topRight: Radius.circular(27),
            bottomLeft: Radius.circular(27),
            bottomRight: Radius.circular(27),
          ),
          color: const Color.fromRGBO(196, 196, 196, 1),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => TodoPage(
                  descp: toDoItem.description.toString(),
                  image: decodeImg,
                  title: toDoItem.title.toString(),
                ),
              ),
            );
          },
          child: Stack(
            children: [
              Positioned(
                  top: 20,
                  left: 20,
                  child: Text(
                    toDoItem.title!.length > 20
                        ? '${toDoItem.title!.substring(0, 20)}...'
                        : toDoItem.title!,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'HelveticaNeueLTPro',
                        inherit: false,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1),
                  )),
              Positioned(
                  top: 50,
                  left: 20,
                  child: Text(
                    toDoItem.description!.length > 26
                        ? '${toDoItem.description!.substring(0, 26)}...'
                        : toDoItem.description!,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'HelveticaNeueLTPro',
                        fontSize: 14,
                        inherit: false,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  )),
              Positioned(
                  top: 10,
                  left: 246,
                  child: Container(
                      width: 62,
                      height: 57,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(62, 57)),
                      ),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.elliptical(62, 57)),
                        child: decodeImg,
                      ))),
              Positioned(
                  top: 80,
                  left: 262,
                  child: InkWell(
                    onTap: () {
                      context
                          .read<TodoBloc>()
                          .add(DeleteTodo(id: toDoItem.id!));
                    },
                    child: Container(
                        width: 30,
                        height: 28,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(43),
                            topRight: Radius.circular(43),
                            bottomLeft: Radius.circular(43),
                            bottomRight: Radius.circular(43),
                          ),
                          image: DecorationImage(
                              image: AssetImage('assets/images/delete11.png'),
                              fit: BoxFit.fitWidth),
                        )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
