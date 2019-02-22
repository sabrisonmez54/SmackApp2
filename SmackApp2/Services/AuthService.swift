//
//  AuthService.swift
//  SmackApp2
//
//  Created by Sabri Sönmez on 2/14/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService{
    // singleton
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    //log in check
    var isLoggedIn : Bool{
        get{
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken: String{
        get{
         return defaults.value(forKey: TOKEN_KEY) as! String

        }
        set{
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
        
        var userEmail: String{
            get{
        return defaults.value(forKey: USER_EMAIL) as! String
        }
        set{
        defaults.set(newValue, forKey: USER_EMAIL)
         }
    }
    
    func registerUser(email:String, password:String, completion: @escaping CompletionHandler){
        let lowerCaseEmail = email.lowercased()
        
        let body : [String:Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            if response.result.error == nil{
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func loginUser(email:String, password:String , completion : @escaping CompletionHandler){
       
        let lowerCaseEmail = email.lowercased()

        let body : [String:Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
                if response.result.error == nil{

//                if let json = response.result.value as? Dictionary<String, Any>{
//                    if let email = json["user"] as? String{ self.userEmail = email }
//                    if let token = json["token"] as? String{self.authToken = token}
//                }
                //SwiftyJson
                guard let data = response.data else{return}
                let json = try! JSON(data:data)
                self.userEmail = json["user"].stringValue
                self.authToken = json["token"].stringValue

                self.isLoggedIn = true
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "name": name,
            "email": lowerCaseEmail,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else { return }
                self.setUserInfo(data: data)
                completion(true)
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
 
    
    func findUserByEmail(completion: @escaping CompletionHandler) {
        
        Alamofire.request("\(URL_USER_BY_EMAIL)\(userEmail)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                self.setUserInfo(data: data)
                completion(true)
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func findUserById(completion: @escaping CompletionHandler) {
        
        Alamofire.request("\(URL_USER_BY_EMAIL)\(userEmail)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                self.setUserInfo(data: data)
                completion(true)
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func setUserInfo(data: Data) {
     
        let json = try! JSON(data: data)
        let id = json["_id"].stringValue
        let color = json["avatarColor"].stringValue
        let avatarName = json["avatarName"].stringValue
        let email = json["email"].stringValue
        let name = json["name"].stringValue
        
        UserDataService.instance.setUserData(id: id, color: color, avatarName: avatarName, email: email, name: name)
    }
    
    
    func updateUserName(name : String, completion : @escaping CompletionHandler)  {
        
        let body : [String:Any] = ["name": name]
       
        Alamofire.request(URL_USERNAME_UPDATE, method: .put, parameters: body, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
             guard let data = response.data else { return }
             let json = try! JSON(data: data)
             let name = json["name"].stringValue
             UserDataService.instance.setUserName(userName: name)
        }
        
    }
    
}
