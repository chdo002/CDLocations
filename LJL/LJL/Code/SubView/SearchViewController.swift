//
//  SearchViewController.swift
//  Locations
//
//  Created by  chdo on 2019/3/3.
//  Copyright © 2019 chdo. All rights reserved.
//

import UIKit
import SnapKit

protocol SearchViewProtocal: BaseMapActionProtocal {
    
}

/// 搜索视图
class SearchViewController: UIViewController, UITextFieldDelegate, BaseMapActionProtocal {
    
    // MARK: - MapActionProtocalsDelegate
    var delegate: SearchViewProtocal?
    
    let searchBar = UIView()
    let searchBut = UIButton()
    let textFiled = UITextField()
    
    let backTap = UITapGestureRecognizer()
    lazy var search = APIService()
    
    lazy var backView = UIView(frame: UIScreen.main.bounds)
    lazy var tableVc = LocationTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    // MARK: - backActions
    
    fileprivate func openBack() {
        
        if (backView.superview == nil) {
            view.superview?.insertSubview(backView, belowSubview: view)
        }
        
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            self?.backView.alpha = 1
        }) {  (_) in

        }
    }
    
    fileprivate func closeBack() {
        removeTableView()
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            self?.backView.alpha = 0
        }) {  (_) in
            
        }
    }
    
    /// 点击背景
    ///
    /// - Parameter tapGes: 手势
    @objc func tapBack(_ tapGes: UITapGestureRecognizer){
        textFiled.resignFirstResponder()
        closeBack()
    }
    
    // MARK:- MapActionProtocal
    func selectLocation(_ vm: LJAnnotaionVM, from: AnyObject) {
        self.delegate?.selectLocation(vm, from: self)
        self.closeBack()
    }
    
    // MARK: - SearchActions
    
    func searchPace(place string: String) {
        textFiled.resignFirstResponder()
        search.search(place: string) { [weak self] (res:[LJAnnotaionVM]) in
            self?.addTableView()
            self?.tableVc.showLocations(res)
        }
    }

    func addTableView() {
        if tableVc.view.superview != nil {
            return
        }
        backTap.isEnabled = false
        searchBut.setImage(UIImage(named: "x"), for: .normal)
        self.parent?.addChild(tableVc)
        backView.addSubview(tableVc.view)
        tableVc.didMove(toParent: self)
        tableVc.delegate = self
        tableVc.view.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(self.view)
            make.top.equalTo(searchBar.snp.bottom).offset(20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    func removeTableView() {
        textFiled.text = nil
        backTap.isEnabled = true
        searchBut.setImage(UIImage(named: "search"), for: .normal)
        tableVc.view.removeFromSuperview()
        tableVc.removeFromParent()
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        openBack()
        return true
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        if (string == "\n") {
            if let text = textField.text {
                if text.lengthOfBytes(using: .utf8) > 0 {
                    searchPace(place: text)
                }
            }
        }
        return true
    }
    
    @objc func tapSearchBut() {
        if tableVc.view.superview == nil {
            if let text = textFiled.text {
                if text.lengthOfBytes(using: .utf8) > 0 {
                    searchBut.setImage(UIImage(named: "guanbi"), for: .normal)
                    searchPace(place: text)
                }
            }
        } else {
            searchBut.setImage(UIImage(named: "search"), for: .normal)
            closeBack()
        }
    }

    // MARK: - LIFE CIRCLE
    fileprivate func initUI() {
        
        searchBar.layer.cornerRadius = 5;
        searchBar.backgroundColor = .white
        searchBar.layer.shadowColor = UIColor.black.cgColor
        searchBar.layer.shadowOffset = CGSize(width: 5, height: 5)
        searchBar.layer.shadowOpacity = 0.2;
        
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(view.statusBarHeight + 10)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(50)
            make.bottom.equalTo(-20)
        }
        
        searchBut.setImage(UIImage(named: "search"), for: .normal)
        searchBut.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        searchBut.addTarget(self, action: #selector(tapSearchBut), for: .touchUpInside)
        searchBut.imageView?.contentMode = .scaleAspectFit
        searchBar.addSubview(searchBut)
        searchBut.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview().inset(10)
            make.trailing.equalToSuperview()
            make.width.equalTo(searchBar.snp.height)
        }
        
        textFiled.delegate = self
        textFiled.borderStyle = .none
        searchBar.addSubview(textFiled)
        textFiled.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.top.bottom.equalToSuperview()
            make.trailing.equalTo(searchBut.snp.leading)
        }
        
        backView.backgroundColor = UIColor(white: 1, alpha: 0.4)
        backTap.addTarget(self, action: #selector(tapBack(_:)))
        backView.addGestureRecognizer(backTap)
    }
    
}
