# NY Times App
a simple app to hit the NY Times Most Popular Articles API and show a list of most viewed articles, and ability to search for specific article, and show details when items on the list are tapped.

# Screenshots
<div >
  <img src = "https://github.com/user-attachments/assets/f2847376-b0f2-4b9f-b92d-421a9baad09e" width = "40%">
  <       >    
  <img src = "https://github.com/user-attachments/assets/66d1ffa9-38ec-476e-84c1-49c0495e1c87" width = "40%">

# App Architecture
This app follows the BLoC Architecture, which is a specialized implementation of the Clean Architecture principle.

Bloc allows us to structure the application into three distinct layers:

### 1- Presentation Layer
- Handle UI components and user interactions.
- Use Flutter widgets along with bloc widgets for state management.
- Ensure UI remains separate from Business logic.

### 2- Business Logic Layer
- Acts as a mediator between the UI and the Data Layer.
- Ensures that the UI does not directly interact with data sources.

### 3- Data Layer
- Responsible for fetching and managing data.
## Code Flow
<img src = "https://github.com/user-attachments/assets/96ddf1da-e512-4fb8-8e9f-4bb506bcaa92">

1. User click on button making event (start talking to Bloc by event)
2. Bloc made request with Repository (Data)
3. Repository (Data) requested data from Web Services (Data)
4. Web services (Data) get data from internet
5. Web services (Data) send data to Repository (Data)
6. Repository send data to Bloc
7. Bloc send state to presentation 
