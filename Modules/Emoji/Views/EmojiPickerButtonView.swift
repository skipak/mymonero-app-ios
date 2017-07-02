//
//  EmojiPickerButtonView.swift
//  MyMonero
//
//  Created by Paul Shapiro on 7/1/17.
//  Copyright © 2017 MyMonero. All rights reserved.
//

import UIKit

struct EmojiUI
{
	class EmojiPickerButtonView: UICommonComponents.PushButton
	{
		//
		// Constants
		static let visual__w: CGFloat = 58
		static let visual__h: CGFloat = 31
		static let w = EmojiPickerButtonView.visual__w + 2*UICommonComponents.PushButtonCells.imagePaddingForShadow_h
		static let h = EmojiPickerButtonView.visual__h + 2*UICommonComponents.PushButtonCells.imagePaddingForShadow_v
		//
		static let visual__arrowRightPadding: CGFloat = 8
		//
		// Properties
		var tapped_fn: ((Void) -> Void)?
		//
		// Lifecycle - Init
		init()
		{
			super.init(pushButtonType: .utility)
			self.setup()
		}
		required init?(coder aDecoder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
		}
		override func setup()
		{
			super.setup()
			//
			let image = UIImage(named: "popoverDisclosureArrow")!
			self.setImage(image, for: .normal)
			self.imageEdgeInsets = UIEdgeInsetsMake(
				1,
				EmojiPickerButtonView.w - (UICommonComponents.PushButtonCells.imagePaddingForShadow_h + image.size.width + EmojiPickerButtonView.visual__arrowRightPadding),
				0,
				EmojiPickerButtonView.visual__arrowRightPadding + UICommonComponents.PushButtonCells.imagePaddingForShadow_h
			)
			//
			self.contentHorizontalAlignment = .left
			self.titleEdgeInsets = UIEdgeInsetsMake(0, 1, 0, 0)
			//
			self.frame = CGRect(
				x: 0, y: 0,
				width: EmojiPickerButtonView.w,
				height: EmojiPickerButtonView.h
			)
			//
			self.addTarget(self, action: #selector(tapped), for: .touchUpInside)
		}
		//
		// Accessors
		var selected_emojiCharacter: Emoji.EmojiCharacter {
			return self.titleLabel!.text! as Emoji.EmojiCharacter
		}
		//
		// Imperatives - Config
		func configure(withEmojiCharacter emojiCharacter: Emoji.EmojiCharacter)
		{
			self.setTitle(emojiCharacter, for: .normal)
		}
		//
		// Delegation - Interactions
		func tapped()
		{
			// the popover should be guaranteed not to be showing here… 
			if let tapped_fn = self.tapped_fn {
				tapped_fn()
			}
			DispatchQueue.main.async
			{ [unowned self] in // on next tick so as not to conflict with any responder resigns
				let popover = EmojiPickerPopoverView()
				popover.selectedEmojiCharacter_fn =
				{ [unowned self] (emojiCharacter) in
					self.configure(withEmojiCharacter: emojiCharacter)
				}
				let initial_emojiCharacter = self.titleLabel!.text! as Emoji.EmojiCharacter
				popover.show(fromView: self, selecting_emojiCharacter: initial_emojiCharacter)
			}
		}
	}
}