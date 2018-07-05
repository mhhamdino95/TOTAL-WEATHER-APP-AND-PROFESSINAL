import UIKit

class MyCell: UITableViewCell {
    
    
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    func configureCell(cellFr: Forcast) {
        lowTemp.text = "\(cellFr.lTemp)"
        highTemp.text = "\(cellFr.hTemp)"
        weatherType.text = cellFr.weatherType
        weatherIcon.image = UIImage(named: cellFr.weatherType)
        dayLabel.text = cellFr.date
    }
}
