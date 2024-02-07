# timetrackingapp-codechallenge

## Summary of fulfilled goals for the project

1. No storyboard used in project. All programmatic UI.
2. Main screen written in ObjC and UIKit, contains a Start button which goes to DateTimePicker screen
3. DateTimePicker screen written in SwiftUI, displayed from ObjC proxied via `UIHostingViewController` with a DateTime picker and a Submit button.
3. App has a CoreData model with an entity `Employee` containing a single column `check_in_date_time` with datetime in string format `yyyy-MM-dd HH:mm`
4. On the every app launch the datetime picker checks for records in CoreData and display the **most recent datetime value**. Otherwise (usually on first app launch), it is initialized with the response of a mock GET HTTP API call `mock/api/check_in_date_time` with JSON structure `{"dateTime": "yyyy-MM-dd HH:mm”}`. API call should be done in background instead of main thread.
5. The response API call is set to be 06:30 of the current day and editable by user. User is not able to enter datetime later than current time via the picker.
6. When user presses Submit, the selected datetime is entered into CoreData.
7. Every subequent launches checks CoreData for records first, then get from API.

## Thought process

1. Used MVVM for project, initially started with Protocol Oriented Programming but it seems like MVVM with SwiftUI is counter intuitive so went back to just using concrete classes
2. Created abstractions for both CoreData and Service so that `SwiftUI Previews` can show mocked values on screens to make it slightly faster to view changes to UI
3. Created several extensions for String and Date to convert between them
4. Wanted to add some an alert dialog rejecting future datetimes if users selected it but its much easier to just not allow them to do so
5. Would have loved to add unit tests
 