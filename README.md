# CustoManager

An iOS customer relationship management app.

## Installation

There are *no* external Libraries or frameworks being used in this project, hence no need to do any addition downloading or setup (except having Xcode downloaded).

Simply download/clone the project.

## Setup

Open the CustoManager.xcodeproj in Xcode.

For the first run, navigate to "CustoManager" project -> "CustoManager" folder -> "Customers" folder -> "CustomersViewModel".swift file and uncomment the for loop underneath the "// TODO: Uncomment this to create a sample of customers." [lines 33 - 35].

(Simply comment these lines after the first run - this is only to provide user with some dummy data to work with.)

Run the project as needed.

## CustoManager Functionality

Once you have added the data [as described in Setup], on the startup of the app, there will be a list of 11 customers. The scrollable customer list shows an overview of each customer currently in the data store.  
  
This list of customers can sorted and filtered -  
  
Simply use the search bar (top of the screen underneath the title) to filter the customer [the entered keyword filters through the list of customer and checks if the keyword exists in any of the customer's name/id/status, eg: search keyword "1" will display the list of all customers with "1" in their name, id or status].  

The list can be sorted by using the sort button (top right corner, the button next to search bar with 3 lines). The user can sort the list of customers by ID, Name or Status. Once clicked, the list will appropriately be sorted.
In addition to sorting the list by type, the user can also sort the list in an ascending or descending order by click the right most button, beside this filter button.    

Clicking on a customer opens a detail view of the customer, allowing a user to view all the details about this customer.  
The user has the ability to change this customer's status by clicking on the user status [in blue], which opens a selectable menu - where their status can be updated.  
  
The detailed user page also has the ability to add new opportunity by tapping the plus button on the top right corner of the screen.  
This allows a view to appear, where the user can add a new opportunity name and status.    

Simply tap save to save this new opportunity, or drag the view down/click outside the view to dismiss the new opportunity forum to discard it. 

All saved opportunities related to a customer are available in a scrollable view underneath the customer details. These opportunities can be edited by tapping the pencil icon on the top right corner of an opportunity - displaying a familiar opportunity view to edit any changes as required, and  allowing the user to save/discard the changes.
