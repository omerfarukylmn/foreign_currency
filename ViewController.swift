import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usdLabel: UILabel!
    
    @IBOutlet weak var eurLabel: UILabel!
    
    @IBOutlet weak var gbpLAbel: UILabel!
    
    @IBOutlet weak var rubLabel: UILabel!
    
    @IBOutlet weak var cnyLabel: UILabel!
    
    @IBOutlet weak var audLabel: UILabel!
    
    @IBOutlet weak var cadLabel: UILabel!
    
    @IBOutlet weak var chbLabel: UILabel!
    
    @IBOutlet weak var sekLabel: UILabel!
    
    @IBOutlet weak var tryLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func refresh(_ sender: Any){
        
        //        1) Request & Session
        //        2) Response & Data
        //        3) Parsing & JSON Serialization
        
        
        //      1) Request & Session
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=adf6f35b68821208c12200b9eabc493a")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription , preferredStyle: UIAlertController.Style.alert)
                
                let button = UIAlertAction(title: "OK", style: UIAlertAction.Style.default , handler: nil)
                alert.addAction(button)
                self.present(alert, animated: true, completion: nil)
                
            }else{
//                2.Response & Data
                if data != nil {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data! , options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary< String , Any>
                        
                        DispatchQueue.main.async {
                            if let rates = json["rates"] as? [String : Any] {
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = String(cad)
                                }
                                if let eur = rates["EUR"] as? Double {
                                    self.eurLabel.text = String(eur)
                                }
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = String(usd)
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpLAbel.text = String(gbp)
                                }
                                if let rub = rates["RUB"] as? Double {
                                    self.rubLabel.text = String(rub)
                                }
                                if let cny = rates["CNY"] as? Double {
                                    self.cnyLabel.text = String(cny)
                                }
                                if let aud = rates["AUD"] as? Double {
                                    self.audLabel.text = String(aud)
                                }
                                if let chf = rates["CHF"] as? Double {
                                    self.chbLabel.text = String(chf)
                                }
                                if let sek = rates["SEK"] as? Double {
                                    self.sekLabel.text = String(sek)
                                }
                                if let türk = rates["TRY"] as? Double {
                                    self.tryLabel.text = String(türk)
                                }
                            }
                        }
                    } catch{
                        print("ERROR")
                    }
                }
            }
        }
        task.resume()
    }
}
