//
//  AddRegistrationTableViewController.swift
//  HotelBookingBootcamp
//
//  Created by user1 on 11/01/24.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController , selectRoomTypeTableViewControllerDelegate{
    func selectRoomTypeTableViewController(_ controller: SelectRoomTypeTableViewController, didSelect roomType: RoomType) {
        
        self.roomType = roomType
        updateRoomType()
    }
    
    var registration : Registeration?{
        guard let roomType = roomType else { return nil}
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate  = checkInDatePicker.date
        
        let checkOutDate = checkOutDateDatePicker.date
        let numberOfAdults = Int(numberOfAdultStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        
        let hasWifi = WifiSwitchLabel.isOn
        
        return Registeration(firstName: firstName, lastName: lastName, emailAddress: email, checkInDate: checkInDate, checkOutDate: checkOutDate, numberOfAdults: numberOfAdults, numberOfChildren: numberOfChildren, wifi: hasWifi, roomType: roomType)
        
    }
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var checkInDateLabel: UILabel!
    
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    
    @IBOutlet weak var checkOutDateLabel: UILabel!
    
    @IBOutlet weak var checkOutDateDatePicker: UIDatePicker!
    
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    
    let checkInDateLabelIndexPath = IndexPath(row: 0 , section: 1)
    

    let checkOutDateLabelIndexPath = IndexPath(row: 2 , section: 1)
    
    var isCheckInDatePickerCellVisible : Bool = false {
        didSet{
            checkInDatePicker.isHidden = !isCheckInDatePickerCellVisible
        }
    }
    
    
    var isCheckOutDatePickerCellVisible : Bool = false {
        didSet{
            checkOutDateDatePicker.isHidden = !isCheckOutDatePickerCellVisible
        }
    }
    
    
    
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    
    @IBOutlet weak var numberOfAdultStepper: UIStepper!
    
    
    @IBOutlet weak var numberOfChildrenlabel: UILabel!
    
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    
    @IBOutlet weak var WifiSwitchLabel: UISwitch!
    
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    var roomType : RoomType?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let midnightToday = Calendar.current.startOfDay(for: Date())
            
        updateRoomType()
        updateNumberofGuests()
        updateDateViews()
        checkInDatePicker.minimumDate = midnightToday
        
        checkInDatePicker.date = midnightToday

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    /*override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
     */

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        
        let checkInDate  = checkInDatePicker.date
        
        let checkOutDate = checkOutDateDatePicker.date
        print("\(firstName) \(lastName) \(email) \(checkInDate) \(checkOutDate)")
        
        
        print("Adults : \(String(describing: numberOfAdultStepper.value))")
        
        print("Children : \(String(describing:numberOfChildrenStepper.value))")
    }
    
    func updateDateViews(){
        
        checkOutDateDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: checkInDatePicker.date)
        
        checkInDateLabel.text = checkInDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        
        checkOutDateLabel.text = checkOutDateDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        
    }
    
    
    func updateRoomType(){
        if let roomType = roomType{
            roomTypeLabel.text = roomType.name
        }
        else{
            roomTypeLabel.text = "Not Set"
        }
    }
    
    @IBAction func datePickerValueChanged(sender : UIDatePicker){
        updateDateViews()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
            case checkInDatePickerCellIndexPath where isCheckInDatePickerCellVisible == false:
            return 0
            
            case checkOutDatePickerCellIndexPath where isCheckOutDatePickerCellVisible == false:
            return 0
        default:
            return UITableView.automaticDimension
        }
    }
    
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath{
        case checkInDatePickerCellIndexPath :
            return 190
        case checkOutDatePickerCellIndexPath :
            return 190
            
        default :
            return UITableView.automaticDimension
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath  == checkInDateLabelIndexPath && isCheckOutDatePickerCellVisible == false {
            isCheckInDatePickerCellVisible.toggle()
        }
        
        else if indexPath == checkOutDateLabelIndexPath && isCheckInDatePickerCellVisible == false{
            isCheckOutDatePickerCellVisible.toggle()
        }
        
        else if indexPath == checkInDateLabelIndexPath || indexPath == checkOutDateLabelIndexPath{
            isCheckInDatePickerCellVisible.toggle()
            isCheckOutDatePickerCellVisible.toggle()
        }
        else{
            return
        }
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    func updateNumberofGuests() {
        numberOfAdultsLabel.text = "\(Int(numberOfAdultStepper.value))"
        
        numberOfChildrenlabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberofGuests()
    }
    
    
    @IBAction func WifiSwitchToggle(_ sender: Any) {
    }
    
    @IBSegueAction func selectRoomType(_ coder: NSCoder) -> SelectRoomTypeTableViewController? {
        let  selectRoomTypeController = SelectRoomTypeTableViewController(coder: coder)
                
                selectRoomTypeController?.delegate = self
                selectRoomTypeController?.roomType = roomType
            
                return selectRoomTypeController
    }
    
}
