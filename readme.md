## UserListDemo

Basic operation of this project is to show list of users from locate storage and fetch new data from remote api. Right not fetching data is limited to 100 users.  If all 100 users is loaded into local store then no new network request will trigger for more data(we can change implementation depend on use case like fetch updated data or remove deleted records).

## Flow

As soon as application is loaded it will first try to load from local storage, if local store is empty then it will load from network and save to local storage. Once data is stored UI will update(fetch from local). 

### API and CoreData

For this project I have used swift language for implementing data layer which is include network calls, core data features

### Presenation

UI layer devided in to two language, first screen is implemented using Objective C,  `UserListViewController` and `UserListViewModel` and `UserDetailViewController` is in swift language.

Navigation is handle by `Coordinator` and object creation for done by `DIContainer` which located in `Coordinator` folder
