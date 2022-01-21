//
//  inDosData.swift
//  InDos
//
//  Created by Andy Jones on 06/01/2022.
//

import Foundation
import Combine

class InDosData : ObservableObject {
    
    @Published var coverageCarbContent: Double = UserDefaults.standard.double(forKey: "coverageCarbContent") {
        didSet {
            coverageDoseRequired = getCoverageDoseRequired()
            UserDefaults.standard.set(coverageCarbContent, forKey: "coverageCarbContent")
        }
    }
    
    @Published var coverageCarbRatio: Double = UserDefaults.standard.double(forKey: "coverageCarbRatio") {
        didSet {
            coverageDoseRequired = getCoverageDoseRequired()
            UserDefaults.standard.set(coverageCarbRatio, forKey: "coverageCarbRatio")
        }
    }


    @Published var correctionCurrentBloodGlucose: Double = UserDefaults.standard.double(forKey: "correctionCurrentBloodGlucose") {
        didSet {
            correctionDoseRequired = getCorrectionDoseRequired()
            UserDefaults.standard.set(correctionCurrentBloodGlucose, forKey: "correctionCurrentBloodGlucose")
        }
    }
    
    @Published var correctionTargetBloodGlucose: Double = UserDefaults.standard.double(forKey: "correctionTargetBloodGlucose") {
        didSet {
            correctionDoseRequired = getCorrectionDoseRequired()
            UserDefaults.standard.set(correctionTargetBloodGlucose, forKey: "correctionTargetBloodGlucose")
        }
    }
    
    @Published var correctionInsulinSensitivity: Double = UserDefaults.standard.double(forKey: "correctionInsulinSensitivity") {
        didSet {
            correctionDoseRequired = getCorrectionDoseRequired()
            UserDefaults.standard.set(correctionInsulinSensitivity, forKey: "correctionInsulinSensitivity")
        }
    }

    @Published var coverageDoseRequired: Double = 0.0 { didSet { totalDoseRequired = getTotalDoseRequired() }}
    @Published var correctionDoseRequired: Double = 0.0 { didSet { totalDoseRequired = getTotalDoseRequired() }}
    @Published var totalDoseRequired: Double = 0.0
    
    init() {
        coverageDoseRequired = getCoverageDoseRequired()
        correctionDoseRequired = getCorrectionDoseRequired()
        totalDoseRequired = getTotalDoseRequired()
    }
    
    func getCoverageDoseRequired() -> Double {
        if (coverageCarbRatio > 0) {
            return coverageCarbContent / (10 / coverageCarbRatio)
        } else {
            return 0
        }
    }
    
    func getCorrectionDoseRequired() -> Double {
        if ((correctionCurrentBloodGlucose - correctionTargetBloodGlucose) > 0) {
            if (correctionInsulinSensitivity > 0) {
                return (correctionCurrentBloodGlucose - correctionTargetBloodGlucose) / correctionInsulinSensitivity
            } else {
                return 0
            }
        } else {
            return 0
        }
    }
    
    func getTotalDoseRequired() -> Double {
        return coverageDoseRequired + correctionDoseRequired
    }

}
