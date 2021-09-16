import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow{
    id:app
    width: 540
    height: 960
    visible: true

    ContactPage{
        id: contactPage
    }
    ConversationPage{
        id: conversationPage
    }
    AddContact{
        id: addContact
    }

    StackView{
        id: stackView
        anchors.fill:parent
        initialItem: contactPage
    }
    /*
    EzTox{
        id: chat
    }
    */
    onClosing:{
        //chat.stop();
    }
    Component.onCompleted: {
		//utility.getAvatar("sdfsdf", "sdfsdfsdfffsdfsd");
        //contactPage.pushChatPage.connect(onPushChatPage);
        //contactPage.menuItemClicked.connect(onMenuItemClicked);
        //chat.friendMessageReceived.connect(conversationPage.onMsgReceived)
        addContact.friendAdded.connect(onFriendAdded);
        //chat.start();
        EzTox.start();
        //MyApi.doSomething()
    }
    Component.onDestruction:
    {
        console.log("destruction");
    } 
    function onPushChatPage(name)  { 
        //stackView.push("./ConversationPage.qml", {inConversationWith: name});
        stackView.push(conversationPage, {inConversationWith: name});
    }
    function onMenuItemClicked(id)
    {
        if (0 == id){
            console.log(id);
            stackView.push(addContact);
        }
    }
    function onFriendAdded(name, toxid)
    {
        //var friendNum = chat.addFriend(toxid, "anyMsg");
    }
}
