# Query app for data collection
The idea of this app is to enable the user collect structured data from their daily life, so that overtime they can see trends and correlations from which to draw insights from.

Current functionality only supports the collecion part, storaging and visualization will be built later.

Next steps include enhancing the UI and adding more functionality, and also building a backend for data storage. The visualization part will be handled (at least for now. Maybe I'll build something with Flutter at some point.) by a Scala desktop app I'm building for a CS course at school.

## Structure
The project consists of a main screen and two action specific screens: querymanager and querysession. Both have their own folders.

In querymanager the user can configure a set of questions and their questiontypes.

Most of the business-logic of the query is handled in the query.dart. 

For statemanagement I've used Provider.