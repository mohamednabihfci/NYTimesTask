
NYTimesTask

* I applied the MVVM design pattern with rx data binding.
    
* I applied the Coordinator patterrn for handling navigation in app.

* I install some dependeces:
   - `Moya/RxSwift` - `RxCocoa`: for handling network and binding the data.
   - `RxBlocking`: Provides testing capabilities for Rx-based systems.

* I wrote some unit tests
   - `testAriclesAPIRequest`: to test loading articles with mock object.
   - `testIfTitleBindedWithValue`: to test if title binding with value on article details.
   - `testIfDescriptionBindedWithValue`: to test if description binding with value on article details.
   
* I wrote  UI tests
   - `testClickToTableViewCell`: to test a click on a cell of table view.
 
* To generate the coverage report:
   - Select Edit Scheme from the scheme editor menu.
   - Select the Test action.
   - Enable the Code Coverage checkbox to gather coverage data.
   - Click on report icon from navigator ,under Test you will see Covergae then click to it you will see coverage report of app.

* The app show the list of articles in a screen, and  when tapped on cell i use coordinator pattern to open the details with selected object of artical passed on  coordinator.
