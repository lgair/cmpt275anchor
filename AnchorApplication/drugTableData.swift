//
//  drugTableData.swift
//  ios-swift-collapsible-table-section
//
//  Created by Yong Su on 8/1/17.
//  Copyright © 2017 Yong Su. All rights reserved.
//
// Team Siwash - Group 12
// CMPT 275
//
// forked from: https://github.com/jeantimex/ios-swift-collapsible-table-section
//
// drugTableData.swift stores Levodopa and Dopamine Agonists drug information into the following user defined data structures:
// 1) Item - the cells within a collapsible table
// 2) Section - the cell seperated between each header
//
// Modified: Joon
import Foundation
import UIKit

//
// MARK: - Section Data Structure
//
public struct Item {
    var name: String
    var detail: String
    
    public init(name: String, detail: String) {
        self.name = name
        self.detail = detail
    }
}

public struct Section {
    var name: String
    var items: [Item]
    var collapsed: Bool
    
    public init(name: String, items: [Item], collapsed: Bool = true) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }
}

public var sectionsData: [Section] = [
    Section(name: "Bromocriptine", items: [
        Item(name: "Type", detail: "generics"),
        Item(name: "Price", detail: "$$$-$$$$"),
        Item(name: "Dosage", detail: "Initial: 1.25 mg BID PO\nUsual: 5–10 mg TID PO"),
        Item(name: "Adverse Effect", detail: "Nausea, vomiting, orthostatic hypotension, hallucinations, psychosis, erythromelalgia (burning pain, warmth and redness of the extremities), pleural fibrosis (obtain a baseline chest x-ray before initiating therapy).\nRisk of parkinsonism-hyperpyrexia syndrome with abrupt discontinuation; taper gradually.\nDrug holidays not recommended."),
        Item(name: "Drug Interactions", detail: "Antihypertensives, diuretics, tricyclic antidepressants may increase hypotensive action.")
        
    ]),
    Section(name: "Pramipexole", items: [
        Item(name: "Type", detail: "Mirapex, Pramipexole, other"),
        Item(name: "Price", detail: "$"),
        Item(name: "Dosage", detail: "Initial: 0.125 mg TID PO\nUsual: 0.5–1 mg TID PO"),
        Item(name: "Adverse Effect", detail: "Orthostatic hypotension, somnolence, confusion, hallucinations, nausea, vomiting, sudden sleep attacks; caution patients about driving or operating dangerous machinery. Caution patients about potential compulsive behaviours such as pathologic gambling or hypersexual behaviour.\nRisk of parkinsonism-hyperpyrexia syndrome with abrupt discontinuation; taper gradually.\nDrug holidays not recommended."),
        Item(name: "Drug Interactions", detail: "Antihypertensives, diuretics, tricyclic antidepressants may increase hypotensive action.")
    ]),
    Section(name: "Ropinirole", items: [
        Item(name: "Type", detail: "ReQuip, generics"),
        Item(name: "Price", detail: "$$"),
        Item(name: "Dosage", detail: "Initial: 0.25 mg TID PO\nUsual: 3–6 mg TID PO"),
        Item(name: "Adverse Effect", detail: "Orthostatic hypotension, somnolence, confusion, hallucinations, nausea, vomiting, sudden sleep attacks; caution patients about driving or operating dangerous machinery. Caution patients about potential compulsive behaviours such as pathologic gambling or hypersexual behaviour.\nRisk of parkinsonism-hyperpyrexia syndrome with abrupt discontinuation; taper gradually.\nDrug holidays not recommended."),
        Item(name: "Drug Interactions", detail: "Antihypertensives, diuretics, tricyclic antidepressants may increase hypotensive action. Ciprofloxacin increases levels of ropinirole.")
    ]),
    Section(name: "Rotigotine", items: [
        Item(name: "Type", detail: "Neupro"),
        Item(name: "Price", detail: "$$$$$"),
        Item(name: "Dosage", detail: "Initial: 2 mg/24 h transdermal patch once daily\nIncrease at weekly intervals as needed, to a maximum of\n16 mg/24 h\nUsual: 6–8 mg/24 h\nApply to clean, dry, intact skin on abdomen, thigh, hip, flank, shoulder or upper arm.\nAvoid using same site twice within 14 days"),
        Item(name: "Adverse Effect", detail: "Orthostatic hypotension, somnolence, confusion, hallucinations, nausea, vomiting, sudden sleep attacks; caution patients about driving or operating dangerous machinery. Caution patients about potential compulsive behaviours such as pathologic gambling or hypersexual behaviour.\nRisk of parkinsonism-hyperpyrexia syndrome with abrupt discontinuation; taper gradually.\nDrug holidays not recommended. Application site reactions can occur."),
        Item(name: "Drug Interactions", detail: "Antihypertensives, diuretics, tricyclic antidepressants may increase hypotensive action.")
    ])
]

public var sectionsData2: [Section] = [
    Section(name: "Levodopa/carbidopa, immediate- release", items: [
        Item(name: "Type", detail: "Sinemet, generics"),
        Item(name: "Price", detail: "$"),
        Item(name: "Dosage", detail: "Initial: 50/12.5 mg BID PO\nUsual: 100/25 mg–150/37.5 mg TID–QID PO"),
        Item(name: "Adverse Effect", detail: "Nausea, vomiting, orthostatic hypotension, dyskinesias, hallucinations, confusion.\nRisk of parkinsonism-hyperpyrexia syndrome with abrupt discontinuation; taper gradually.\nDrug holidays not recommended."),
        Item(name: "Drug Interactions", detail: "Antihypertensives, diuretics, tricyclic antidepressants may increase hypotensive action.")
        ]),
    Section(name: "Levodopa/carbidopa, controlled- release", items: [
        Item(name: "Type", detail: "Sinemet CR, generics"),
        Item(name: "Price", detail: "$$"),
        Item(name: "Dosage", detail: "Initial: 100/25 mg[d] BID PO\nUsual: 200/50 mg[d] QID PO"),
        Item(name: "Adverse Effect", detail: "Nausea, vomiting, orthostatic hypotension, dyskinesias, hallucinations, confusion.\nRisk of parkinsonism-hyperpyrexia syndrome with abrupt discontinuation; taper gradually.\nDrug holidays not recommended.\nDecreased “kick” compared to Sinemet immediate-release; patterns of dyskinesia may be more complex."),
        Item(name: "Drug Interactions", detail: "Antihypertensives, diuretics, tricyclic antidepressants may increase hypotensive action.")
        ]),
    Section(name: "Levodopa/carbidopa, intestinal gel", items: [
        Item(name: "Type", detail: "Duodopa"),
        Item(name: "Price", detail: "$$$$/100 mL cassette"),
        Item(name: "Dosage", detail: "Individualized based on previous total dopaminergic dug needs\nUsual: Morning bolus (5–10 mL) then continuous infusion (2–6 mL/h) for 16 h + bolus doses (0.5–2 mL) throughout the day PRN"),
        Item(name: "Adverse Effect", detail: "Nausea, vomiting, orthostatic hypotension, dyskinesias, hallucinations, confusion.\nRisk of parkinsonism-hyperpyrexia syndrome with abrupt discontinuation; taper gradually.\nDrug holidays not recommended.\nComplications related to percutaneous intrajejunal tube placement e.g., infection, intestinal obstruction."),
        Item(name: "Drug Interactions", detail: "Antihypertensives, diuretics, tricyclic antidepressants may increase hypotensive action.")
        ]),
    Section(name: "Levodopa/benserazide", items: [
        Item(name: "Type", detail: "Prolopa"),
        Item(name: "Price", detail: "$$"),
        Item(name: "Dosage", detail: "Initial: 50/12.5 mg BID PO\nUsual: 100/25 mg–150/37.5 mg TID–QID PO"),
        Item(name: "Adverse Effect", detail: "Nausea, vomiting, orthostatic hypotension, dyskinesias, hallucinations, confusion.\nRisk of parkinsonism-hyperpyrexia syndrome with abrupt discontinuation; taper gradually.\nDrug holidays not recommended."),
        Item(name: "Drug Interactions", detail: "Antihypertensives, diuretics, tricyclic antidepressants may increase hypotensive action.")
        ])
]

