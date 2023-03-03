//
//  File.swift
//  
//
//  Created by Kevin on 4/9/23.
//

import Foundation
public protocol CVPMetadataType {

}

public struct CVPIImageDataMetadata: CVPMetadataType {
    let title: String
    let subtitle: String
}
public struct CVPPageContent {
    let pageType: CVPPageContentType
    let nextButtonText: String
    let metadata: CVPMetadataType

    init(pageType: CVPPageContentType, nextButtonText: String, metadata: CVPMetadataType) {

        self.pageType = pageType
        self.nextButtonText = nextButtonText
        self.metadata = metadata
    }
}

public struct CVPContentConfiguration {
    let duration: Float
    var pageContents: [CVPPageContent]
}

public enum CVPPageContentType: String {
    case standarWithImage
    case standarWithBackgroundImage
}
