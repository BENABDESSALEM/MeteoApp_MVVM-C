//
//  CityTableViewCell.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/20/23.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    // MARK: Outlets.
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var meteoImgView: UIImageView!
    @IBOutlet weak var forwardImgView: UIImageView!
    @IBOutlet weak var detailsLabel: UILabel!
    
    // MARK: Variable.
    var gradientLayer = CAGradientLayer()
    
    // MARK: Property observer.
    var viewModel: CityCellViewModel! {
        didSet {
            setupBindings()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = contentView.bounds
    }
    
    func setupWith(viewModel:CityCellViewModel) {
        self.viewModel = viewModel
    }
    
    func setupBindings() {
        cityName.bindTo(viewModel.cityName)
        meteoImgView.bindTo(viewModel.pictoImage)
    }
    
    func setupViews() {
        containerView.setBackgroundGradient(gradientLayer: gradientLayer, colors: buttonColors, isVertical: false)
        containerView.layer.cornerRadius = 20
        containerView.layer.masksToBounds = true
        self.selectionStyle = .none
    }
}
