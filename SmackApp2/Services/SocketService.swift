//
//  SocketService.swift
//  SmackApp2
//
//  Created by Sabri Sönmez on 2/17/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {
    
    static let instance = SocketService()
    
    let manager: SocketManager
    let socket: SocketIOClient
    
    override init() {
        self.manager = SocketManager(socketURL: URL(string: BASE_URL)!)
        self.socket = manager.defaultSocket
        super.init()
    }

    func establishConnection(){
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
    
    func addChanne(channelName: String, channelDescription: String, completion: @escaping CompletionHandler){
        socket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler) {
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else{return}
            guard let channelDesc = dataArray[1] as? String else{return}
            guard let channelId = dataArray[2] as? String else{return}
            
            let newChannel = Channel(channelTitle: channelName ,channelDescription:channelDesc, id: channelId)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
    func addMessageBody(messageBody:String , userId: String, channelId : String , completion: @escaping CompletionHandler) {
        let user = UserDataService.instance
        //need to look in api
        socket.emit("newMessage", messageBody, userId, channelId, user.name, user.avatarName, user.avatarColor)
        completion(true)
    }
    
    func getChatMessage(completion: @escaping CompletionHandler){
        socket.on("mesageCreated") { (dataArray, ack) in
            guard let msgBody = dataArray[0] as? String else{return}
            guard let channelId = dataArray[2] as? String else{return}
            guard let userName = dataArray[3] as? String else{return}
            guard let userAvatar = dataArray[4] as? String else{return}
            guard let userAvatarColor = dataArray[5] as? String else{return}
            guard let msgId = dataArray[6] as? String else{return}
            guard let timeStamp = dataArray[7] as? String else{return}
            
            if channelId == MessageService.instance.selectedChannel?.id && AuthService.instance.isLoggedIn{
                
               let newMessage = Message(message:msgBody, userName: userName, channelId : channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: msgId, timeStamp: timeStamp)
               
                MessageService.instance.messages.append(newMessage)
                completion(true)
                
            }else{
                completion(false)
            }
        }
    }
    
   func getTypingUsers(_ completionHandler: @escaping (_ typingUsers: [String: String]) -> Void) {
    
    socket.on("userTypingUpdate") { (dataArray, ack) in
        guard let typingUsers = dataArray[0] as? [String:String] else {return}
           
            completionHandler(typingUsers)
        }
    
    
    }
     
}
