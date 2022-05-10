//
//  SchoolViewController.swift
//  NYHighSchoolProject
//

import UIKit

class SchoolViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // These data structures will hold the data passed in from the json files read in
    var additionalSchoolData: [NYCHighSchoolsData] = []
    var satData: [SATData] = []
        
    var schoolTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSchoolListData()
        loadSATData()
        setupConstraintsAndTableViewDelegates()
        setupNavigationController()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // Created a dictionary to map the unique identifier of dbn to the SATData struct. It allows the ability to lookup a record based on the dbn.
        var highSchoolDataLookup = [String : SATData]()
        satData.forEach { highSchoolDataLookup[$0.dbn] = $0 }
        
        // Utilized the dictionary in the compact map to generate the combined final array output
        let nyc = additionalSchoolData.compactMap { data -> ViewModel? in
            guard let readingScore = highSchoolDataLookup[data.dbn]?.sat_critical_reading_avg_score else { return nil }
            guard let mathScore = highSchoolDataLookup[data.dbn]?.sat_math_avg_score else { return nil }
            guard let writingScore = highSchoolDataLookup[data.dbn]?.sat_writing_avg_score else { return nil }
            return ViewModel(dbn: data.dbn, school_name: data.school_name, sat_critical_reading_avg_score: readingScore, sat_math_avg_score: mathScore, sat_writing_avg_score: writingScore, neighborhood: data.neighborhood, phone_number: data.phone_number, fax_number: data.fax_number)
        }
        return nyc.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Use this method to display the specific SAT details and additional information for the selected school
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Same as in numberOfSections function
        var highSchoolDataLookup = [String : SATData]()
        satData.forEach { highSchoolDataLookup[$0.dbn] = $0 }
        
        let nyc = additionalSchoolData.compactMap { data -> ViewModel? in
            guard let readingScore = highSchoolDataLookup[data.dbn]?.sat_critical_reading_avg_score else { return nil }
            guard let mathScore = highSchoolDataLookup[data.dbn]?.sat_math_avg_score else { return nil }
            guard let writingScore = highSchoolDataLookup[data.dbn]?.sat_writing_avg_score else { return nil }
            return ViewModel(dbn: data.dbn, school_name: data.school_name, sat_critical_reading_avg_score: readingScore, sat_math_avg_score: mathScore, sat_writing_avg_score: writingScore, neighborhood: data.neighborhood, phone_number: data.phone_number, fax_number: data.fax_number)
        }
        if nyc[indexPath.section].sat_critical_reading_avg_score == "s" {
            nyc[indexPath.section].sat_critical_reading_avg_score = "N/A"
        }
        if nyc[indexPath.section].sat_math_avg_score == "s" {
            nyc[indexPath.section].sat_math_avg_score = "N/A"
        }
        if nyc[indexPath.section].sat_writing_avg_score == "s" {
            nyc[indexPath.section].sat_writing_avg_score = "N/A"
        }
        let schoolName = nyc[indexPath.section].school_name
        let readingScore = nyc[indexPath.section].sat_critical_reading_avg_score
        let mathScore = nyc[indexPath.section].sat_math_avg_score
        let writingScore = nyc[indexPath.section].sat_writing_avg_score
        let phoneNumber = nyc[indexPath.section].phone_number ?? "N/A"
        let faxNumber = nyc[indexPath.section].fax_number ?? "N/A"
        let neighborhood = nyc[indexPath.section].neighborhood ?? "N/A"
        let newViewController = SchoolDetailView()
        newViewController.nameOfSchool.text = schoolName + " Average SAT Scores"
        newViewController.readingScore.setTitle("Average SAT Reading Score: " + readingScore, for: .normal)
        newViewController.mathScore.setTitle("Average SAT Math Score: " + mathScore, for: .normal)
        newViewController.writingScore.setTitle("Average SAT Writing Score: " + writingScore, for: .normal)
        newViewController.contactTitle.text = "Contact/Address Information"
        newViewController.phoneNumber.setTitle("Contact Number: " + phoneNumber, for: .normal)
        newViewController.faxNumber.setTitle("Fax Number: " + faxNumber, for: .normal)
        newViewController.neighborhood.setTitle("Neighborhood: " + neighborhood, for: .normal)
        self.navigationController?.pushViewController(newViewController, animated: false)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "schoolCell", for: indexPath) as! SchoolListDataCell
        
        // Same as in numberOfFunctions function
        var highSchoolDataLookup = [String : SATData]()
        satData.forEach { highSchoolDataLookup[$0.dbn] = $0 }
        
        let nyc = additionalSchoolData.compactMap { data -> ViewModel? in
            guard let readingScore = highSchoolDataLookup[data.dbn]?.sat_critical_reading_avg_score else { return nil }
            guard let mathScore = highSchoolDataLookup[data.dbn]?.sat_math_avg_score else { return nil }
            guard let writingScore = highSchoolDataLookup[data.dbn]?.sat_writing_avg_score else { return nil }
            return ViewModel(dbn: data.dbn, school_name: data.school_name, sat_critical_reading_avg_score: readingScore, sat_math_avg_score: mathScore, sat_writing_avg_score: writingScore, neighborhood: data.neighborhood, phone_number: data.phone_number, fax_number: data.fax_number)
        }
        
        let schoolName = nyc[indexPath.section].school_name
        cell.schoolLabel.text = schoolName
        
        return cell
    }
}

