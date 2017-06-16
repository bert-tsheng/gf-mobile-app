//
//  ViewModel.swift
//  Sample
//
//  Created by Olivin Esguerra on 15/06/2017.
//  Copyright © 2017 Sample. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Moya
import Moya_ObjectMapper

class ViewModel: NSObject {
    
    let disposeBag = DisposeBag()
    
    var provider: RxMoyaProvider<TEST>!
    
    var itemArray : [ItemModelItemMapper] = []
    
    override init() {
        super.init()
        self.provider = RxMoyaProvider<TEST>(endpointClosure: endpointClosure,requestClosure : requestClosure,plugins: [NetworkLoggerPlugin(verbose: true)])
    }

    
    
    func login(onSuccess : @escaping (_ success : Bool) -> (),onFailed : @escaping (_ errorTitle : String,_ errorMessage : String) -> ()){
        self.provider.request(.login(email: "meowmeowmeow123@gmail.com", password: "123123123"))
            .debug()
            .subscribe { event in
                switch event {
                case .next(let response):
                    
                    if response.statusCode == 500 || response.statusCode == 1004 ||  response.statusCode == 404 ||  response.statusCode == 401 {
                        let mapObj = try! response.mapObject(ResponseErrorMapper.self)
                        print(mapObj.errorString)
                        onFailed(mapObj.error.removeUnderScore().capitalized,mapObj.errorString)
                    }else{
                        let mapUserData = try! response.mapObject(UserInfoMapper.self)
                        AppData.sharedInstance.token = mapUserData.token!
                        print(mapUserData.token!)
                        onSuccess(true)
                    }
                    break
                case .error(let error):
                    print(error.localizedDescription)
                    onFailed("Error",error.localizedDescription)
                default:
                    break
                }
            }.addDisposableTo(disposeBag)
    }
    
    func getItems(
        mode : Bool?,
        onSuccess : @escaping (_ isSuccess : Bool) -> (),
        onFailed : @escaping (_ errorTitle : String,_ errorMessage : String) -> ()){

        
        self.provider.request(.getFresh(offset : 1))
            .debug()
            .subscribe { event in
                switch event {
                case .next(let response):
                    
                    //print(try! response.mapJSON())
                    
                    if response.statusCode == 500 || response.statusCode == 1004 ||  response.statusCode == 404 ||  response.statusCode == 401 ||  response.statusCode == 400{
                        let mapObj = try! response.mapObject(ResponseErrorMapper.self)
                        //print(mapObj.errorString)
                        onFailed(mapObj.error.removeUnderScore().capitalized,mapObj.errorString)
                    }else{
                        let mapObj = try! response.mapObject(ItemModel.self).result.result
                        
                        if (mapObj?.count)! > 0 {
                            
                            if mode! {
                                self.itemArray.removeAll()
                            }
                            
                            for obj in mapObj!{
                                self.itemArray.append(obj)
                            }
                            
                        }else{
                            
                        }
                        
                        //print(self.freshObservable.value.count)
                        onSuccess(true)
                    }
                    break
                case .error(let error):
                    //print(error.localizedDescription)
                    onFailed("Error",error.localizedDescription)
                default:
                    break
                }
            }.addDisposableTo(disposeBag)
    }

}
