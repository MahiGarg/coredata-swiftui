//
//  EmployeeEntity+CoreDataProperties.swift
//  CoreDataInSwiftUI
//
//  Created by Suneet  Agrawal on 04/08/23.
//
//

import Foundation
import CoreData


extension EmployeeEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmployeeEntity> {
        return NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: Int16

}

extension EmployeeEntity : Identifiable {

}
