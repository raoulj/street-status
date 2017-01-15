//
//  ResponsesTable.swift
//  MySampleApp
//
//
// Copyright 2017 Amazon.com, Inc. or its affiliates (Amazon). All Rights Reserved.
//
// Code generated by AWS Mobile Hub. Amazon gives unlimited permission to 
// copy, distribute and modify it.
//
// Source code generated from template: aws-my-sample-app-ios-swift v0.8
//

import Foundation
import UIKit
import AWSDynamoDB
import AWSMobileHubHelper

class ResponsesTable: NSObject, Table {
    
    var tableName: String
    var partitionKeyName: String
    var partitionKeyType: String
    var sortKeyName: String?
    var sortKeyType: String?
    var model: AWSDynamoDBObjectModel
    var indexes: [Index]
    var orderedAttributeKeys: [String] {
        return produceOrderedAttributeKeys(model)
    }
    var tableDisplayName: String {

        return "responses"
    }
    
    override init() {

        model = Responses()
        
        tableName = model.classForCoder.dynamoDBTableName()
        partitionKeyName = model.classForCoder.hashKeyAttribute()
        partitionKeyType = "String"
        indexes = [

            ResponsesPrimaryIndex(),

            ResponsesUserIdTimestamp(),
        ]
        if (model.classForCoder.respondsToSelector("rangeKeyAttribute")) {
            sortKeyName = model.classForCoder.rangeKeyAttribute!()
            sortKeyType = "String"
        }
        super.init()
    }
    
    /**
     * Converts the attribute name from data object format to table format.
     *
     * - parameter dataObjectAttributeName: data object attribute name
     * - returns: table attribute name
     */

    func tableAttributeName(dataObjectAttributeName: String) -> String {
        return Responses.JSONKeyPathsByPropertyKey()[dataObjectAttributeName] as! String
    }
    
    func getItemDescription() -> String {
        return "Find Item with userId = \(AWSIdentityManager.defaultIdentityManager().identityId!) and responseId = \("demo-responseId-500000")."
    }
    
    func getItemWithCompletionHandler(completionHandler: (response: AWSDynamoDBObjectModel?, error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        objectMapper.load(Responses.self, hashKey: AWSIdentityManager.defaultIdentityManager().identityId!, rangeKey: "demo-responseId-500000", completionHandler: {(response: AWSDynamoDBObjectModel?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(response: response, error: error)
            })
        })
    }
    
    func scanDescription() -> String {
        return "Show all items in the table."
    }
    
    func scanWithCompletionHandler(completionHandler: (response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        let scanExpression = AWSDynamoDBScanExpression()
        scanExpression.limit = 5

        objectMapper.scan(Responses.self, expression: scanExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(response: response, error: error)
            })
        })
    }
    
    func scanWithFilterDescription() -> String {
        return "Find all items with clubId < \("demo-clubId-500000")."
    }
    
    func scanWithFilterWithCompletionHandler(completionHandler: (response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        let scanExpression = AWSDynamoDBScanExpression()
        
        scanExpression.filterExpression = "#clubId < :clubId"
        scanExpression.expressionAttributeNames = ["#clubId": "clubId" ,]
        scanExpression.expressionAttributeValues = [":clubId": "demo-clubId-500000" ,]

        objectMapper.scan(Responses.self, expression: scanExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(response: response, error: error)
            })
        })
    }
    
    func insertSampleDataWithCompletionHandler(completionHandler: (errors: [NSError]?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        var errors: [NSError] = []
        let group: dispatch_group_t = dispatch_group_create()
        let numberOfObjects = 20
        

        let itemForGet = Responses()
        
        itemForGet._userId = AWSIdentityManager.defaultIdentityManager().identityId!
        itemForGet._responseId = "demo-responseId-500000"
        itemForGet._clubId = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("clubId")
        itemForGet._date = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("date")
        itemForGet._isOpen = NoSQLSampleDataGenerator.randomSampleBOOL()
        itemForGet._timestamp = NoSQLSampleDataGenerator.randomSampleNumber()
        
        
        dispatch_group_enter(group)
        

        objectMapper.save(itemForGet, completionHandler: {(error: NSError?) -> Void in
            if error != nil {
                dispatch_async(dispatch_get_main_queue(), {
                    errors.append(error!)
                })
            }
            dispatch_group_leave(group)
        })
        
        for _ in 1..<numberOfObjects {

            let item: Responses = Responses()
            item._userId = AWSIdentityManager.defaultIdentityManager().identityId!
            item._responseId = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("responseId")
            item._clubId = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("clubId")
            item._date = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("date")
            item._isOpen = NoSQLSampleDataGenerator.randomSampleBOOL()
            item._timestamp = NoSQLSampleDataGenerator.randomSampleNumber()
            
            dispatch_group_enter(group)
            
            objectMapper.save(item, completionHandler: {(error: NSError?) -> Void in
                if error != nil {
                    dispatch_async(dispatch_get_main_queue(), {
                        errors.append(error!)
                    })
                }
                dispatch_group_leave(group)
            })
        }
        
        dispatch_group_notify(group, dispatch_get_main_queue(), {
            if errors.count > 0 {
                completionHandler(errors: errors)
            }
            else {
                completionHandler(errors: nil)
            }
        })
    }
    
    func removeSampleDataWithCompletionHandler(completionHandler: (errors: [NSError]?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        let queryExpression = AWSDynamoDBQueryExpression()
        queryExpression.keyConditionExpression = "#userId = :userId"
        queryExpression.expressionAttributeNames = ["#userId": "userId"]
        queryExpression.expressionAttributeValues = [":userId": AWSIdentityManager.defaultIdentityManager().identityId!,]

        objectMapper.query(Responses.self, expression: queryExpression) { (response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void in
            if let error = error {
                dispatch_async(dispatch_get_main_queue(), {
                    completionHandler(errors: [error]);
                    })
            } else {
                var errors: [NSError] = []
                let group: dispatch_group_t = dispatch_group_create()
                for item in response!.items {
                    dispatch_group_enter(group)
                    objectMapper.remove(item, completionHandler: {(error: NSError?) -> Void in
                        if error != nil {
                            dispatch_async(dispatch_get_main_queue(), {
                                errors.append(error!)
                            })
                        }
                        dispatch_group_leave(group)
                    })
                }
                dispatch_group_notify(group, dispatch_get_main_queue(), {
                    if errors.count > 0 {
                        completionHandler(errors: errors)
                    }
                    else {
                        completionHandler(errors: nil)
                    }
                })
            }
        }
    }
    
    func updateItem(item: AWSDynamoDBObjectModel, completionHandler: (error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        

        let itemToUpdate: Responses = item as! Responses
        
        itemToUpdate._clubId = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("clubId")
        itemToUpdate._date = NoSQLSampleDataGenerator.randomSampleStringWithAttributeName("date")
        itemToUpdate._isOpen = NoSQLSampleDataGenerator.randomSampleBOOL()
        itemToUpdate._timestamp = NoSQLSampleDataGenerator.randomSampleNumber()
        
        objectMapper.save(itemToUpdate, completionHandler: {(error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(error: error)
            })
        })
    }
    
    func removeItem(item: AWSDynamoDBObjectModel, completionHandler: (error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        
        objectMapper.remove(item, completionHandler: {(error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(error: error)
            })
        })
    }
}

class ResponsesPrimaryIndex: NSObject, Index {
    
    var indexName: String? {
        return nil
    }
    
    func supportedOperations() -> [String] {
        return [
            QueryWithPartitionKey,
            QueryWithPartitionKeyAndFilter,
            QueryWithPartitionKeyAndSortKey,
            QueryWithPartitionKeyAndSortKeyAndFilter,
        ]
    }
    
    func queryWithPartitionKeyDescription() -> String {
        return "Find all items with userId = \(AWSIdentityManager.defaultIdentityManager().identityId!)."
    }
    
    func queryWithPartitionKeyWithCompletionHandler(completionHandler: (response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        let queryExpression = AWSDynamoDBQueryExpression()
        
        queryExpression.keyConditionExpression = "#userId = :userId"
        queryExpression.expressionAttributeNames = ["#userId": "userId",]
        queryExpression.expressionAttributeValues = [":userId": AWSIdentityManager.defaultIdentityManager().identityId!,]

        objectMapper.query(Responses.self, expression: queryExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(response: response, error: error)
            })
        })
    }
    
    func queryWithPartitionKeyAndFilterDescription() -> String {
        return "Find all items with userId = \(AWSIdentityManager.defaultIdentityManager().identityId!) and clubId > \("demo-clubId-500000")."
    }
    
    func queryWithPartitionKeyAndFilterWithCompletionHandler(completionHandler: (response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        let queryExpression = AWSDynamoDBQueryExpression()
        
        queryExpression.keyConditionExpression = "#userId = :userId"
        queryExpression.filterExpression = "#clubId > :clubId"
        queryExpression.expressionAttributeNames = [
            "#userId": "userId",
            "#clubId": "clubId",
        ]
        queryExpression.expressionAttributeValues = [
            ":userId": AWSIdentityManager.defaultIdentityManager().identityId!,
            ":clubId": "demo-clubId-500000",
        ]
        

        objectMapper.query(Responses.self, expression: queryExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(response: response, error: error)
            })
        })
    }
    
    func queryWithPartitionKeyAndSortKeyDescription() -> String {
        return "Find all items with userId = \(AWSIdentityManager.defaultIdentityManager().identityId!) and responseId < \("demo-responseId-500000")."
    }
    
    func queryWithPartitionKeyAndSortKeyWithCompletionHandler(completionHandler: (response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        let queryExpression = AWSDynamoDBQueryExpression()
        
        queryExpression.keyConditionExpression = "#userId = :userId AND #responseId < :responseId"
        queryExpression.expressionAttributeNames = [
            "#userId": "userId",
            "#responseId": "responseId",
        ]
        queryExpression.expressionAttributeValues = [
            ":userId": AWSIdentityManager.defaultIdentityManager().identityId!,
            ":responseId": "demo-responseId-500000",
        ]
        

        objectMapper.query(Responses.self, expression: queryExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(response: response, error: error)
            })
        })
    }
    
    func queryWithPartitionKeyAndSortKeyAndFilterDescription() -> String {
        return "Find all items with userId = \(AWSIdentityManager.defaultIdentityManager().identityId!), responseId < \("demo-responseId-500000"), and clubId > \("demo-clubId-500000")."
    }
    
    func queryWithPartitionKeyAndSortKeyAndFilterWithCompletionHandler(completionHandler: (response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        let queryExpression = AWSDynamoDBQueryExpression()
        
        queryExpression.keyConditionExpression = "#userId = :userId AND #responseId < :responseId"
        queryExpression.filterExpression = "#clubId > :clubId"
        queryExpression.expressionAttributeNames = [
            "#userId": "userId",
            "#responseId": "responseId",
            "#clubId": "clubId",
        ]
        queryExpression.expressionAttributeValues = [
            ":userId": AWSIdentityManager.defaultIdentityManager().identityId!,
            ":responseId": "demo-responseId-500000",
            ":clubId": "demo-clubId-500000",
        ]
        

        objectMapper.query(Responses.self, expression: queryExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(response: response, error: error)
            })
        })
    }
}

class ResponsesUserIdTimestamp: NSObject, Index {
    
    var indexName: String? {

        return "userId-timestamp"
    }
    
    func supportedOperations() -> [String] {
        return [
            QueryWithPartitionKey,
            QueryWithPartitionKeyAndFilter,
            QueryWithPartitionKeyAndSortKey,
            QueryWithPartitionKeyAndSortKeyAndFilter,
        ]
    }
    
    func queryWithPartitionKeyDescription() -> String {
        return "Find all items with userId = \(AWSIdentityManager.defaultIdentityManager().identityId!)."
    }
    
    func queryWithPartitionKeyWithCompletionHandler(completionHandler: (response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        let queryExpression = AWSDynamoDBQueryExpression()
        

        queryExpression.indexName = "userId-timestamp"
        queryExpression.keyConditionExpression = "#userId = :userId"
        queryExpression.expressionAttributeNames = ["#userId": "userId",]
        queryExpression.expressionAttributeValues = [":userId": AWSIdentityManager.defaultIdentityManager().identityId!,]

        objectMapper.query(Responses.self, expression: queryExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(response: response, error: error)
            })
        })
    }
    
    func queryWithPartitionKeyAndFilterDescription() -> String {
        return "Find all items with userId = \(AWSIdentityManager.defaultIdentityManager().identityId!) and responseId > \("demo-responseId-500000")."
    }
    
    func queryWithPartitionKeyAndFilterWithCompletionHandler(completionHandler: (response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        let queryExpression = AWSDynamoDBQueryExpression()
        

        queryExpression.indexName = "userId-timestamp"
        queryExpression.keyConditionExpression = "#userId = :userId"
        queryExpression.filterExpression = "#responseId > :responseId"
        queryExpression.expressionAttributeNames = [
            "#userId": "userId",
            "#responseId": "responseId",
        ]
        queryExpression.expressionAttributeValues = [
            ":userId": AWSIdentityManager.defaultIdentityManager().identityId!,
            ":responseId": "demo-responseId-500000",
        ]
        

        objectMapper.query(Responses.self, expression: queryExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(response: response, error: error)
            })
        })
    }
    
    func queryWithPartitionKeyAndSortKeyDescription() -> String {
        return "Find all items with userId = \(AWSIdentityManager.defaultIdentityManager().identityId!) and timestamp < \(1111500000)."
    }
    
    func queryWithPartitionKeyAndSortKeyWithCompletionHandler(completionHandler: (response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        let queryExpression = AWSDynamoDBQueryExpression()
        

        queryExpression.indexName = "userId-timestamp"
        queryExpression.keyConditionExpression = "#userId = :userId AND #timestamp < :timestamp"
        queryExpression.expressionAttributeNames = [
            "#userId": "userId",
            "#timestamp": "timestamp",
        ]
        queryExpression.expressionAttributeValues = [
            ":userId": AWSIdentityManager.defaultIdentityManager().identityId!,
            ":timestamp": 1111500000,
        ]
        

        objectMapper.query(Responses.self, expression: queryExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(response: response, error: error)
            })
        })
    }
    
    func queryWithPartitionKeyAndSortKeyAndFilterDescription() -> String {
        return "Find all items with userId = \(AWSIdentityManager.defaultIdentityManager().identityId!), timestamp < \(1111500000), and responseId > \("demo-responseId-500000")."
    }
    
    func queryWithPartitionKeyAndSortKeyAndFilterWithCompletionHandler(completionHandler: (response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void) {
        let objectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper()
        let queryExpression = AWSDynamoDBQueryExpression()
        

        queryExpression.indexName = "userId-timestamp"
        queryExpression.keyConditionExpression = "#userId = :userId AND #timestamp < :timestamp"
        queryExpression.filterExpression = "#responseId > :responseId"
        queryExpression.expressionAttributeNames = [
            "#userId": "userId",
            "#timestamp": "timestamp",
            "#responseId": "responseId",
        ]
        queryExpression.expressionAttributeValues = [
            ":userId": AWSIdentityManager.defaultIdentityManager().identityId!,
            ":timestamp": 1111500000,
            ":responseId": "demo-responseId-500000",
        ]
        

        objectMapper.query(Responses.self, expression: queryExpression, completionHandler: {(response: AWSDynamoDBPaginatedOutput?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(response: response, error: error)
            })
        })
    }
}
