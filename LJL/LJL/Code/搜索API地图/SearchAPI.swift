//
//  SearchAPI.swift
//  Locations
//
//  Created by 陈栋 on 2019/3/4.
//  Copyright © 2019 chdo. All rights reserved.
//

import UIKit
import AMapSearchKit

class SearchAPI: NSObject, AMapSearchDelegate {
    
    func search(place: String, complete results: @escaping ([LJAnnotaionVM]) -> Void ) {
        completeHandler = nil
        let request = AMapPOIKeywordsSearchRequest()
        request.keywords = place
        request.cityLimit = true
        request.requireSubPOIs = true
        api.aMapPOIKeywordsSearch(request)
        completeHandler = results
    }
    
    let api : AMapSearchAPI = AMapSearchAPI()
    
    override init() {
        super.init()
        api.delegate = self
    }
    
    private var completeHandler: (([LJAnnotaionVM]) -> Void)?
    
    // MARK: - AMapSearchDelegate
    func onPOISearchDone(_ request: AMapPOISearchBaseRequest!, response: AMapPOISearchResponse!)
    {
        if completeHandler != nil {
            var arr = [LJAnnotaionVM]()
            for poi in response.pois {
                let vm = LJAnnotaionVM()
                vm.apiModel = poi
                arr.append(vm)
            }
            completeHandler?(arr)
            completeHandler = nil
        }
    }
    
    func aMapSearchRequest(_ request: Any!, didFailWithError error: Error!) {
        
    }
}
