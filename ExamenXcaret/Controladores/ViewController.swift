//
//  ViewController.swift
//  ExamenXcaret
//
//  Created by Diana Reyes on 07/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    var usuario: String = ""
    var password: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let background = UIImage(named: "angryimg")
        self.view.backgroundColor = UIColor(patternImage: background!)
        
        let loginUsuario = UserDefaults.standard.value(forKey: "usuario") as? String
        let loginPassword = UserDefaults.standard.value(forKey: "password") as? String
        

        if (loginUsuario  == "diana" && loginPassword == "123"){
            txtCorreo.text = UserDefaults.standard.value(forKey: "usuario") as? String
            DispatchQueue.main.async{
                self.performSegue(withIdentifier: "segueLogin", sender: self)
            }
        }
    }
    
    @IBOutlet weak var txtCorreo: UITextField!
    
    @IBOutlet weak var txtContrasena: UITextField!
    
    @IBAction func btnIngresar(_ sender: UIButton) {
        
        if(txtCorreo.text == "diana" && txtContrasena.text == "123"){
            UserDefaults.standard.set(self.txtCorreo.text!, forKey: "usuario")
            UserDefaults.standard.set(self.txtContrasena.text!, forKey: "password")
            self.performSegue(withIdentifier: "segueLogin", sender: self)
        }
        else
        {
            let alertView = UIAlertController(
                title: "",
                message: "Datos incorrectos",
                preferredStyle: .alert)
            alertView.view.tintColor = .green
            let confirmAction = UIAlertAction(title: "Ok", style: .cancel) { (_) in
                 // Do confirm
            }
            alertView.addAction(confirmAction)
            let cancelAction = UIAlertAction(title: "Cancelar", style: .default) { (_) in
                // Do cancel
            }
            alertView.addAction(cancelAction)
            self.present(alertView, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueLogin"{
            let irListaP = segue.destination as! ListaPokemonesViewController
            irListaP.nombreUsuario = txtCorreo.text!
        }
    }
}
    

