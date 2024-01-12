# rank_assessment
A credit card capturing app for the Rank Assessment.

## Getting Started

This app is built using Clean Architecture using test driven development. External libraries used by this app include
* flutter_credit_card [used to build widgets the credit cards in the page view of the list of credit cards]
* credit_card_scanner [used to scan a credit card]
* flutter_bloc [used to handle state management between business logic components and the presentation layer components]
* equatable [used to simply comparing flutter and dart objects which in this instance would be models and entities from data and domain layers, it simplifies comparing the states in the bloc layer]
* get_it [used for dependancy injection, allowing setup of singletons to adhere to SOLID principles]
* floor [used as sqlite abstraction, that will assist in storing data on the local device]
* mockito [used for unit testing of components]
* build_runner [used to generate mocks for the testable components of the app, as well as the low level sqlite code]
* bloc_test [used when testing bloc components of the app]
* sqflite [used as local storage for the credits cards]
* flutter_hooks [used to hook up widgets to blocs]
## Usage

When the users opens the app, they will be presented with a home screen and the message 'No cards captured yet'. In
the title bar of the app will be the app name and a plus icon button, which when pressed will open the card capturing
screen, the credit card capturing screen will have a form that captures the following form fields, Card Number, Card Type, CVV, Issuing Country, Cardholder. Next to the Issuing Country form field we place a Text button toggle which when pressed will allow the user to add/remove the issuing country, to and from a list of banned countries stored on the local storage of the device which in this case would be the sqlite database.
On the credit card capturing screen we will also make provision for capturing a credit card using the device's camera. The last UI component on this screen is the Add Card button which will allow the user to save the card to the local storage of the device. Once the card has been captured, the user will be returned to the home screen displaying a list of all the cards captured. Additional logic will allow the app to infer the card type from the card number, by checking if the card number starts with 4[Visa], 5[Mastercard], 
34 or 7 [American Express], 300 to 305, 6011 or 63 [Discover] or 35 [Japan Credit Bureau] based on a quick google search. Also validate that a card is not capture more than once. Because sqlite does not have an enum type, we will use 1 for banned and 0 for allowed