//
//  ParameterKeys.swift
//  Pods-veraID-sdk-ios_Example
//
//  Created by Shukhrat Sagatov on 21.06.2020.
//

import Foundation

public enum VeraIdParamKey: String {
    case photo
    case phone
    case fio
    case email__value

    case verification_level
    case date_of_birth
    case country
    
    case passport__document_state
    case passport__name
    case passport__surname
    case passport__patronymic
    case passport__date_of_birth
    case passport__place_of_issue
    
    case passport__place_of_birth
    case passport__date_of_issue
    case passport__expiry_date
    case passport__gender
    case passport__code_of_the_issuing

    case passport__number
    case passport__serial
    case passport__registration
    case passport__code
    case passport__general_page
    case passport__place_page
    case passport__selfie_page
    case passport__painting_page
    
    case driver_license__document_state
    case driver_license__name
    case driver_license__surname
    case driver_license__patronymic
    case driver_license__date_of_birth
    case driver_license__place_of_issue
    case driver_license__date_of_issue
    case driver_license__expiry_date
    case driver_license__gender
    case driver_license__place_of_birth
    case driver_license__number
    case driver_license__residence
    case driver_license__general_page
    case driver_license__back_page
    
    case international_passport__document_state
    case international_passport__name
    case international_passport__surname
    case international_passport__patronymic
    case international_passport__date_of_birth
    case international_passport__date_of_issue
    case international_passport__gender
    case international_passport__name_eng
    case international_passport__surname_eng
    case international_passport__expiry_date
    case international_passport__number
    case international_passport__type
    case international_passport__authority
    case international_passport__general_page
    
    case inn__document_state
    case inn__number
    case inn__page
    
    case insurance_cert__document_state
    case insurance_cert__name
    case insurance_cert__surname
    case insurance_cert__patronymic
    case insurance_cert__date_of_birth
    case insurance_cert__number
    case insurance_cert__place_of_birth
    case insurance_cert__gender
    case insurance_cert__page
}
