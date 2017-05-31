//
//  ListedObject.swift
//  MyMonero
//
//  Created by Paul Shapiro on 5/19/17.
//  Copyright © 2017 MyMonero. All rights reserved.
//

import Foundation
//
protocol ListedObject
{
	// (read existing)
	init?(withPlaintextDictRepresentation dictRepresentation: DocumentPersister.DocumentJSON) throws
}