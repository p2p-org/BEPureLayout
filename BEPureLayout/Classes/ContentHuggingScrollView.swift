//
//  ContentHuggingScrollView.swift
//  Commun
//
//  Created by Chung Tran on 11/1/19.
//  Copyright © 2019 Commun Limited. All rights reserved.
//

import Foundation

public class ContentHuggingScrollView: UIScrollView {
    // MARK: - Subviews
    public lazy var contentView = UIView(forAutoLayout: ())
    var scrollableAxis: NSLayoutConstraint.Axis
    
    // MARK: - Methods
    public init(scrollableAxis: NSLayoutConstraint.Axis, contentInset: UIEdgeInsets = .zero) {
        self.scrollableAxis = scrollableAxis
        super.init(frame: .zero)
        self.contentInset = contentInset
        commonInit()
    }
    
    @available(*, unavailable,
    message: "Loading this view from a nib is unsupported in favor of initializer dependency injection."
    )
    public required init?(coder: NSCoder) {
        fatalError("Loading this view from a nib is unsupported in favor of initializer dependency injection.")
    }
    
    func commonInit() {
        configureForAutoLayout()
        addSubview(contentView)
        contentView.autoPinEdgesToSuperviewEdges()
        if scrollableAxis == .vertical {
            contentView.widthAnchor.constraint(equalTo: widthAnchor, constant: -(contentInset.left + contentInset.right) ).isActive = true
        } else {
            contentView.heightAnchor.constraint(equalTo: heightAnchor, constant: -(contentInset.top + contentInset.bottom)).isActive = true
        }
    }
}
