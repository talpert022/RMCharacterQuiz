# RMCharacterQuiz

RMCharactrerQuiz is a quiz app for the characters in Rick and Morty. This app is written in SwiftUI and leverages GraphQL for networking calls. 

<p float="left">
  <img src="https://github.com/talpert022/RMCharacterQuiz/blob/main/Screenshots/screenshot2.png" width="300" height = "600" />
  <img src="https://github.com/talpert022/RMCharacterQuiz/blob/main/Screenshots/screenshot3.png" width="300" height = "600" />
</p>

## Installation 
The installation involves setting up the Apollo iOS client for GraphQL, which uses a process called swift scripting that converts graphql queries and mutations into specific Swift model types. The full description of the setup used can be found [here](https://www.apollographql.com/docs/ios/swift-scripting/), but because the correct schema, queries, and code generation are already in the project, all thats left to do is complete the following steps.

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
    
