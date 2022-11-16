//
//  OrderViewModel.swift
//  StarBucks
//
//  Created by luck woo on 2022/11/15.
//

//import UIKit
//import RxCocoa
//import RxSwift
//import NSObject_Rx
//
//class OrderViewModel {
//    let disposeBag = DisposeBag()
//    
////    let trigger:
//    let menusRelay = BehaviorRelay<[Menu]>(value: [])
//    
//    struct Input {
//        let trigger: BehaviorRelay<Void>
//    }
//    
//    struct Output {
//        let menusRelay: BehaviorRelay<[Menu]>
//    }
//    
//    func transform(req: Input) -> Output {
//        req.trigger
//            .bind { [weak self] _ in
//                guard let self = `self` else { return }
//                self.loadMenusData()
//            }.disposed(by: disposeBag)
//        
//        return Output(menusRelay: menusRelay)
//    }
//    
//    func loadMenusData() {
//        let url = "https://starbugs.herokuapp.com/api/menus"
//        let session = URLSession.shared
//        guard let requestURL = URL(string: url) else { return }
//        
//        // 네트워킹 시작
//        session.dataTask(with: requestURL) { data, response, error in
//            guard error == nil else {
//                print(error?.localizedDescription)
//                return
//            }
//            
//            if let data = data,
//            let response = response as? HTTPURLResponse,
//            response.statusCode == 200 {
//                do {
//                    // JSON타입의 데이터를 디코딩
//                    let userResponse = try JSONDecoder().decode(Menus.self, from: data)
//                    self.menusRelay.accept(userResponse.menus)
////                    DispatchQueue.main.async {
////
////                    }
//                    
//                } catch(let err) {
//                    print("Decoding Error")
//                    print(err.localizedDescription)
//                }
//            }
//        }.resume()
//    }
//}