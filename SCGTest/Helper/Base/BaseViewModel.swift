//
//  BaseViewModel.swift
//  SCGTest
//
//  Created by Irshad Ahmad on 04/06/23.
//

import Combine
import Foundation
import NetworkInterface

class BaseViewModel {
    var isDataLoading = false
    var refreshView = PassthroughSubject<Bool, Never>()
    var showLoader = PassthroughSubject<Bool?, Never>()
    var errorPublisher = PassthroughSubject<RequestError?, Never>()
    
    func finishLoadingRequest() {
        isDataLoading = false
        showLoader.send(false)
        refreshView.send(true)
    }
    
    func startMakingRequest() {
        isDataLoading = true
        showLoader.send(true)
    }
}
