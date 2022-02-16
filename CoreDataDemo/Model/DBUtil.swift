//
//  DBUtil.swift
//  CoreDataDemo
//
//  Created by comviva on 07/02/22.
//

import Foundation
import UIKit
import CoreData

// 1. managed object context - db operations

let MOContext = ((UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext)!

func addEmployee(name: String, id: Int, salary: Int, city: String) {
    
    //insert
    let emp = Employee(context: MOContext)
    emp.emp_Id = Int64(id)
    emp.empName = name
    emp.city = city
    emp.salary = Int64(salary)
    
    do {
    try MOContext.save()
    print("Inserted a new employee")
    }catch{
        print("Unable to add a employee: \(error.localizedDescription)")
        
        MOContext.delete(emp)
    }
}

func getEmployees() -> [Employee] {
    //select
    var empList: [Employee] = []
    
    let fRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
    do{
        // select * from Employee
        empList = try MOContext.fetch(fRequest)
    }catch{
        print("Unable to fetch data: \(error.localizedDescription)")
    }
    return empList
}

func deleteEmp(empToDelete: Employee){
    //delete
    
    MOContext.delete(empToDelete)
    do {
        try MOContext.save()
        print("Deleted employee: \(empToDelete.empName ?? "")")
    }catch{
        print("Unable to delete a employee: \(error.localizedDescription)")
        
    }
}
