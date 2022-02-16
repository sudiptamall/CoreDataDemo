//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by comviva on 07/02/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tbl : UITableView!
    
    var empList : [Employee] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Sandbox dir: \(NSHomeDirectory)")
        empList = getEmployees()
        tbl.dataSource = self
        tbl.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addClicked))
    }
                                                            
    @objc func addClicked(){
        
            addEmployee(name: "John", id: 1, salary: 1000, city: "Bangalore")
            addEmployee(name: "Merry", id: 2, salary: 2000, city: "New York")
        
        empList = getEmployees()
        tbl.reloadData()
        }

}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return empList.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "empCell", for: indexPath) as? EmployeeCell)!
        
        let emp = empList[indexPath.row]
        cell.nameL.text = emp.empName
        cell.emp_idL.text = "\(emp.emp_Id)"
        cell.cityL.text = emp.city
        cell.salaryL.text = "\(emp.salary)"
        
        return cell
    }
}

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let emp = empList[indexPath.row]
        
        deleteEmp(empToDelete: emp) // deleted from database
        empList = getEmployees()
        
        tbl.reloadData()
        //tbl.deleteRows(at: [indexPath], with: .automatic)
    }
    
}

