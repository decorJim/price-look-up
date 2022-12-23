//
//  DataLoader.swift
//  Berevage
//
//  Created by Victor Kim on 2022-12-06.
//  Copyright © 2022 Dep16. All rights reserved.
//

import Foundation

public class DataLoader {
    @Published var beverages=[Berevage]()
    
    init() {
        load()
    }
    func load() {
        if let fileLocation=Bundle.main.url(forResource: "beer", withExtension: "json")
        {
            do {
                let data=try Data(contentsOf: fileLocation)
                let jsonDecoder=JSONDecoder()
                let dataFromJson=try jsonDecoder.decode([Berevage].self,from:data)
                self.beverages=dataFromJson
            } catch {
                print(error)
            }
        }
        
    }
}
