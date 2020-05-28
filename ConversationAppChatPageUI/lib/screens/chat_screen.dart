import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_starter/models/user_model.dart';
import 'package:flutter_chat_ui_starter/models/message_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  ChatScreen({this.user});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessageComposer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple[900],
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 50.0,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.insert_emoticon),
            iconSize: 25.0,
            color: Colors.white,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              cursorColor: Colors.white,
              decoration: InputDecoration.collapsed(
                hintText: 'Send a Message ...',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.attach_file),
            iconSize: 25.0,
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            iconSize: 25.0,
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  _buildMessage(Message message, bool isMe) {
    return Row(
      children: <Widget>[
        Container(
          margin: isMe
              ? EdgeInsets.only(
                  top: 2.0,
                  bottom: 2.0,
                  left: 100.8,
                )
              : EdgeInsets.only(
                  top: 2.0,
                  bottom: 2.0,
                  left: 2.0,
                ),
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
            color: isMe ? Colors.deepPurple[900] : Colors.indigo[800],
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    message.time,
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 12.0,
                    ),
                  ),
                  if (!isMe)
                    Row(
                      children: <Widget>[
                        Text(
                          "~",
                          style: TextStyle(color: Colors.white60),
                        ),
                        Text(
                          widget.user.name,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              SizedBox(height: 8.0),
              Text(
                message.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
        if (!isMe)
          IconButton(
            icon: message.isLiked
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
            iconSize: 20.0,
            color: message.isLiked ? Colors.red[600] : Colors.blueGrey,
            onPressed: () {},
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: Text(
          widget.user.name,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: ClipRRect(
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
