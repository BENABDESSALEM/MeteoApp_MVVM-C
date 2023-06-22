//
//  CityTableViewCell.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/20/23.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var meteoImgView: UIImageView!
    @IBOutlet weak var forwardImgView: UIImageView!
    @IBOutlet weak var detailsLabel: UILabel!
    
    var viewModel: CityCellViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupWith(city:CityWeather) {
        self.viewModel = CityCellViewModel(city: city)
    }
    
    func setupBindings() {
        cityName.bindTo(viewModel.cityName)
    }
}
