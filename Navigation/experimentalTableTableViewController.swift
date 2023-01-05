//
//  experimentalTableTableViewController.swift
//  Navigation
//
//  Created by Alan on 29.12.2022.
//

import UIKit

class experimentalTableTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // Раскомментируйте следующую строку, чтобы сохранить выделение между презентациями
        
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // Раскомментируйте следующую строку, чтобы отобразить кнопку «Редактировать» на панели навигации для этого контроллера представления.
        
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        // #warning Неполная реализация, возвращаем количество секций
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // #warning Неполная реализация, возвращаем количество строк
        return 5
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        // Настроить ячейку...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        // Return false if you do not want the specified item to be editable.
        // Возвращайте false, если вы не хотите, чтобы указанный элемент был редактируемым.
     
        return true
    }
    */

    /*
    // Override to support editing the table view.
    // Переопределить для поддержки редактирования табличного представления.
     
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
     
            // Delete the row from the data source
            // Удалить строку из источника данных
     
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
     
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            // Создаем новый экземпляр соответствующего класса, вставляем его в массив и добавляем новую строку в табличное представление
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    // Переопределить для поддержки изменения представления таблицы.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    // Переопределить для поддержки условного изменения представления таблицы.
     
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        // Возвращаем false, если вы не хотите, чтобы товар можно было заказать повторно.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    // В приложении на основе раскадровки вам часто нужно будет немного подготовиться перед навигацией
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        // Получить новый контроллер представления, используя segue.destination.
        // Передаем выбранный объект новому контроллеру представления.
    }
    */

}
