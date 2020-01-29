//
// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//

import CoreData

public typealias JsonDictionary = [String: Any]
public typealias JsonArray = [JsonDictionary]

// MARK: ObjC types

extension NSPropertyDescription
{
    @objc(ebm_keyPath) public var keyPath: String {
        return userInfo?["jsonKeyPath"] as? String ?? name
    }
}

public extension NSSet
{
    @objc(ebm_dictionaryRepresentation)
    var dictionaryRepresentation: [JsonDictionary] {
        return self.map {
            guard let modelObj = $0 as? ManagedObject else { return [:] }
            return modelObj.encodedValues(parent: nil)
        }
    }
}

public extension NSOrderedSet
{
    @objc(ebm_dictionaryRepresentation)
    var dictionaryRepresentation: [JsonDictionary] {
        return self.map {
            guard let modelObj = $0 as? ManagedObject else { return [:] }
            return modelObj.encodedValues(parent: nil)
        }
    }
}

public extension Bundle
{
//    @objc(ebm_managedObjectModelWithName:frameworkName:)
//    public func managedObjectModel(name: String, frameworkName: String) -> NSManagedObjectModel? {
//        guard let url = frameworkUrl(frameworkName: frameworkName) else { return nil }
//        return NSManagedObjectModel(contentsOf: url.appendingPathComponent("\(name).momd"))
//    }
    
    @objc(ebm_frameworkUrlWithName:)
    func frameworkUrl(frameworkName: String) -> URL? {
        return bundleURL
            .appendingPathComponent("Frameworks")
            .appendingPathComponent("\(frameworkName).framework")
    }
}

extension NSRelationshipDescription
{
    @objc(ebm_isReverseToParent:)
    func isReverse(to parent: ManagedObject?) -> Bool {
        guard let destination = destinationEntity, let parent = parent?.entity else { return false }
        return destination.name == parent.name
    }
}

public extension NSDictionary
{
    @objc(ebm_serializedAsJsonWithPretty:error:)
    func serializedAsJson(pretty: Bool) throws -> Data
    {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: pretty ? .prettyPrinted : JSONSerialization.WritingOptions(rawValue: 0))
        }
        catch let error as NSError {
            print("Unable to deserialize as JSON due to error: \(error)")
            throw error
        }
    }
    
    @objc(ebm_dictionaryWithContentsOfUrl:)
    class func dictionary(contentsOf url: URL) -> NSDictionary?
    {
        guard let data = try? Data(contentsOf: url),
            let dict = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: 0)) else {
                return nil
        }
        return dict as? NSDictionary
    }
}

// MARK: - Swift types

public extension Array where Element: ManagedObject
{
    var dictionaryRepresentation: [JsonDictionary] {
        return self.map { $0.encodedValues(parent: nil) }
    }
}

public extension URL
{
    static var documentsDirectoryUrl: URL? {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
    
    static func documentUrl(for documentName: String, type: String) -> URL? {
        return documentsDirectoryUrl?.appendingPathComponent(documentName).appendingPathExtension(type)
    }
}

public extension Data
{
    func deserializeJson() throws -> Any
    {
        do {
            return try JSONSerialization.jsonObject(with: self, options: JSONSerialization.ReadingOptions(rawValue: 0))
        }
        catch let error as NSError {
            print("Unable to deserialize JSON due to error: \(error)")
            throw error
        }
    }
}

public extension IndexPath
{
    static var zero: IndexPath { return IndexPath(row: 0, section: 0) }
}

public extension String
{
    var keyPathComponents: [String] {
        return (self as NSString).components(separatedBy: ".")
    }
}
