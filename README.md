# RMCharacterQuiz

The Rick and Morty Character Quiz is a quiz app that tests a users knowledge about the characters in the show. This app is written in SwiftUI and leverages GraphQL for networking calls. 

## Installation 
The installation process relies on the Apollo iOS client for GraphQL. This client allows you to run graphql queries and mutations that return specific Swift model types that conforms to the data returned. A `schema.json` file defines what type of operations are valid for the Rick and Morty [GraphQL server](https://rickandmortyapi.com/graphql). Code generation, done by the iOS client's swift scripting process, is used to create data models from the operations defined in `Queries.graphql`. More information about this process can be found [here](https://www.apollographql.com/docs/ios/swift-scripting/). The correct schema, queries, and code generation command (found in the build phases) are already setup, all thats left to do is complete the following steps. 

    1. Download and unzip the iOS Codegen Template from https://github.com/apollographql/iOSCodegenTemplate.
    2. Move the ApolloCodegen folder to the same level as the top level targets in the RMCharacterQuiz repository. 
       See the example structure:
       
       RMCharacterQuiz // Source root
        | RMQuiz.xcodeproj
        | - RMQuiz // Contains app target source files
        | - README.md // Contains project readme 
        | - ApolloCodegen // Contains swift scripting files
        
    3. Inside the ApolloCodegen folder, go to Sources/ApolloCodegen/main.swift. 
    4. Locate the folderForDownloadedSchema and targetRootURL variables inside the run() functions of DownloadSchema and Generate Code, respectively. 
    5. Replace the foldername parameter in each with "RMQuiz" (lines 34 and 62).
    6. Open RMQuiz.xcodeproj, build and run.

       
