//
//  ViewController.swift
//  Tarea6
//
//  Created by David Adolfo Garcia Giron on 13/04/19.
//  Copyright © 2019 Tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    var notas:[Notas] = []
    
    var promedio = 0

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        
        let cell = UITableViewCell()
        
        let nota = notas[indexPath.row]
        
        promedio = (((Int(nota.promedioLab)) + (Int(nota.promedioPrac)) + (Int(nota.examenFinal)))/3)
        
        let aprovado = "✅ El \(nota.cursos) esta aprovado con: \(promedio)"
        let desaprovado = "❌ El \(nota.cursos) esta desaprovado con: \(promedio)"
        
        
        
        if promedio >= 13 {
            cell.backgroundColor = UIColor.cyan
            cell.textLabel?.text = "\(aprovado)"
        }else if promedio < 13 {
            cell.backgroundColor = UIColor.yellow
            cell.textLabel?.text = "\(desaprovado)"
        }else {
            cell.textLabel?.text = "OCURRIO UN ERROR"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.notas.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    
    
    
    
    func crearNotas() -> [Notas]{
        let nota1 = Notas()
        nota1.cursos = "Matematicas"
        nota1.promedioPrac = 10
        nota1.promedioLab = 10
        nota1.examenFinal = 10
        
        let nota2 = Notas()
        nota2.cursos = "Comunicacion"
        nota2.promedioPrac = 15
        nota2.promedioLab = 10
        nota2.examenFinal = 15
        
        let nota3 = Notas()
        nota3.cursos = "Ciencias Basicas"
        nota3.promedioPrac = 18
        nota3.promedioLab = 19
        nota3.examenFinal = 20
        
        return [nota1, nota2, nota3]
    }
    
    @IBAction func agregarTarea(_ sender: Any) {
        performSegue(withIdentifier: "agregarSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let siguienteVC = segue.destination as! CrearNotaViewController
        siguienteVC.anteriorVC = self
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        notas = crearNotas()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let cancelButton = UITableViewRowAction(style: .normal, title: "Cancel") { (rowAction, indexpath) in
            print("Cancel Clicked\(indexPath.row)")
        }
        cancelButton.backgroundColor = UIColor.gray
        return [cancelButton]
    }
    
}

