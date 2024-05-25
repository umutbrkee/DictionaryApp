//
//  ViperSearchViewInterface.swift
//  Dictionary
//
//  Created by Umut on 25.05.2024.
//
import CoreData
protocol ViperSearchViewInterface: AnyObject {
    func show(error:String)
    func show(entries:[SearchEntry])
}
