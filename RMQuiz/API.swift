// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class CharactersQuestionQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query CharactersQuestion($ids: [ID!]!) {
      charactersByIds(ids: $ids) {
        __typename
        name
        image
      }
    }
    """

  public let operationName: String = "CharactersQuestion"

  public let operationIdentifier: String? = "dec53fa94dca7e92f7032bccaed8644d7c2233aa8bbc17991b2fff5b26e1c6d8"

  public var ids: [GraphQLID]

  public init(ids: [GraphQLID]) {
    self.ids = ids
  }

  public var variables: GraphQLMap? {
    return ["ids": ids]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("charactersByIds", arguments: ["ids": GraphQLVariable("ids")], type: .list(.object(CharactersById.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(charactersByIds: [CharactersById?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "charactersByIds": charactersByIds.flatMap { (value: [CharactersById?]) -> [ResultMap?] in value.map { (value: CharactersById?) -> ResultMap? in value.flatMap { (value: CharactersById) -> ResultMap in value.resultMap } } }])
    }

    /// Get a list of characters selected by ids
    public var charactersByIds: [CharactersById?]? {
      get {
        return (resultMap["charactersByIds"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [CharactersById?] in value.map { (value: ResultMap?) -> CharactersById? in value.flatMap { (value: ResultMap) -> CharactersById in CharactersById(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [CharactersById?]) -> [ResultMap?] in value.map { (value: CharactersById?) -> ResultMap? in value.flatMap { (value: CharactersById) -> ResultMap in value.resultMap } } }, forKey: "charactersByIds")
      }
    }

    public struct CharactersById: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Character"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("image", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, image: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Character", "name": name, "image": image])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The name of the character.
      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// Link to the character's image.
      /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
      public var image: String? {
        get {
          return resultMap["image"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image")
        }
      }
    }
  }
}
