//
//  ViewController.swift
//  Machine_Test
//
//  Created by Nixon on 25/05/21.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var activityInd: UIActivityIndicatorView!
    @IBOutlet weak var myTable: UITableView!
    var serverDta = [dataSet]()
    var timer:Timer!
    var min = 0
    var max = 100
    var userName : String!
    var image : URL!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         services.instance.webServices(url: API)
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(startLoading), userInfo: nil, repeats: true)
        activityInd.style = .large
        activityInd.color = .blue
    }
    @objc func startLoading()  {
        if min != max {
            min += 50
            activityInd.startAnimating()
            myTable.isHidden = true
        }
        else{
            myTable.reloadData()
            
            activityInd.stopAnimating()
            activityInd.isHidden = true
            myTable.isHidden = false
            timer.invalidate()
        }
    }

}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? myCell
        cell?.dataView.layer.borderWidth = 1
        cell?.dataView.layer.cornerRadius = 10
        cell?.dataView.clipsToBounds = true
        cell?.userImage.layer.cornerRadius = ((cell?.userImage.frame.size.width)!)/2
        cell?.userImage.clipsToBounds = true
         
        cell?.emailLabel.text = dataArray[indexPath.row].email as! String
         userName = dataArray[indexPath.row].first_name + " "+dataArray[indexPath.row].last_name
        cell?.nameLabel.text = userName as! String
        let urlImage = URL(string: dataArray[indexPath.row].avatar)
            // cell.imageViewNew.kf.setImage(with: urlImage)
       // image = urlImage
        cell?.userImage.kf.setImage(with: urlImage)
        

        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(withIdentifier: "popUpViewController") as? popUpViewController
        let urlImage = URL(string: dataArray[indexPath.row].avatar)
        userName = dataArray[indexPath.row].first_name + " "+dataArray[indexPath.row].last_name
    
        controller?.imagUser = urlImage
        controller?.name = userName
        present(controller!, animated: true, completion: nil)
        
    }
    
    
}

