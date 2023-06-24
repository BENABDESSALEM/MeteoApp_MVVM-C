//
//  WeekCollectionViewCell.swift
//  MeteoApp
//
//  Created by Wajih Benabdessalem on 6/24/23.
//

import UIKit

class WeekCollectionViewCell: UICollectionViewCell {
    
    // MARK: Outlets.
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherImgView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    
    // MARK: Variable.
    var gradientLayer = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = contentView.bounds
    }
    
    func setupWith(viewModel:WeekCellViewModel) {

    }
    
    func setupBindings() {

    }
    
    func setupViews() {
        containerView.setBackgroundGradient(gradientLayer: gradientLayer, colors: buttonColors, isVertical: true)
        containerView.layer.cornerRadius = 25
        containerView.layer.masksToBounds = true
    }
}
