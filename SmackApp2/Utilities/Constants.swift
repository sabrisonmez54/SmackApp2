//
//  Constants.swift
//  SmackApp2
//
//  Created by Sabri on 2/8/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import Foundation


typealias CompletionHandler = (_ Success: Bool)  -> ()

//url constants
let BASE_URL = "https://smackapp2chat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

//Notification
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")

//USER DEFAULTS
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
let HEADER = ["Content-Type" : "application/json; charset=utf-8"]
