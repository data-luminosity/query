/*
 * Copyright (c) 2016-2017,  University of California, Los Angeles
 * Coded by Keshav Tadimeti
 * All rights reserved.
 *
 */

import UIKit
import Foundation
import Alamofire
import thrift


class QueryHandler{
    
    // to connect to server
    fileprivate let RESPONSE_PORT = 17273
    fileprivate let USER_AGENT = "crowdzen/ios"
    
    // experimental query fields
    fileprivate let EXPERIMENT_ANALYSTID = "US";
    fileprivate let EXPERIMENT_QUERYID = 5.0
    fileprivate let EXPERIMENT_RADIUS_MATCH = 45.0;
    fileprivate let EXPERIMENT_DISABLE_UPLOAD = true;
    fileprivate let EXPERIMENT_EPOCH=10000;
    fileprivate let EXPERIMENT_QUERY_INDEX = -1
    
    // query list
    fileprivate var queryList : [Query] = []
    fileprivate var initProcess : Bool = true;
    fileprivate var queryCount = 0
    fileprivate var newestQuery = -1
    fileprivate var lastProcessedQuery = -1;
    
    //Max number of epochs before loop and restart, default value can be overriden by a larger epoch query
    let MAX_EPOCH = 40;
    let EPOCH_LENGTH = 60000;
    
    // epoch query map to process queries
    fileprivate var epochQueryMap: [Int: [Int]] = [Int: [Int]]()
    fileprivate var currentEpochIteration = 0;
    
    // location query version
    fileprivate var LOCATION_QUERY_VERSION: Int64 = -1
    
    // Swift Sodium Library Handler
    let swiftSodium = SwiftSodiumHandler()

    // initialize QueryHandler
    func initQueryHandler() {
        usleep(1)
        downloadNewQueries()
    }
    
    // download new queries from the server
    func downloadNewQueries() {
        
        let queryVars = NSMutableDictionary()
        queryVars.setObject("queriesios", forKey: "topic" as NSCopying)
        queryVars.setObject(UUID().uuidString, forKey: "consumergroupid" as NSCopying)
        
        let params = ["topic" : "queriesios", "consumergroupid" : UUID().uuidString]
        
        let queryURL = URL(string: ServerHandler.getQueryUrl())
        let request = NSMutableURLRequest(url: queryURL!)
        request.httpShouldHandleCookies = false
        request.setValue(USER_AGENT, forHTTPHeaderField: "User-Agent")
        
        Alamofire.request(ServerHandler.getQueryUrl(), method: .get, parameters: params, headers: ["User-Agent" : USER_AGENT]).responseString { response in
            
            if (response.data != nil) {
                do{
                    let jsonData_primitive = try JSONSerialization.jsonObject(with: response.data!, options:JSONSerialization.ReadingOptions.allowFragments)

                    let jsonData :[NSDictionary] = jsonData_primitive as! [NSDictionary]
                    
                    for jsonDict: NSDictionary in jsonData {
                        
                        // get data from JSON dictionary
                        let base64Encoded: String = jsonDict.object(forKey: "queryvalue") as! String
                        
                        // base 64 decode data
                        let dataFromBase64String = Data(base64Encoded: base64Encoded, options: NSData.Base64DecodingOptions(rawValue: 0))
                        
                        // verify query signature
                        let verifiedDataFromBase64String: Data = self.swiftSodium.verifySignature(dataFromBase64String!)!
                        
                        let tBufferReceive = TMemoryBuffer(data: verifiedDataFromBase64String)
                        let tProtocolReceive = TBinaryProtocol(transport: tBufferReceive)
                        
                        let query = Query()
                        query?.read(tProtocolReceive)
                        self.addNewQueryToMap(query!)
                        return
                    }
                } catch let error as NSError {
                    print("Error in fetching queries: \(error.localizedDescription)")

                }
            }
        }
    }

    // if new queries, add them to epoch query map
    func addNewQueryToMap(_ q: Query) {
        
        // check if query is already in array of queries
        var isQueryAlreadyInList: Bool = false
        var isNewQueryVersionAvailable: Bool = false
        var indexOfOldQuery: Int = 0
        
        for query: Query in queryList {
            if (query.queryId == q.queryId && query.analystId == q.analystId)
            {
                // remove older query version if new version if available
                if (q.versionId > query.versionId) {
                    removeOldQuery(query)
                    isNewQueryVersionAvailable = true
                    break
                }
                else if (query.versionId != q.versionId && query.queryStartTime < q.queryStartTime) {
                    break
                }
                else if (q.versionId > query.versionId) {
                    break
                }
                else {
                    isQueryAlreadyInList = true
                }
            }
            indexOfOldQuery += 1
        }
        
        // if query already in list, leave function
        if (isQueryAlreadyInList) {
            return
        }
            
        // add query to list if new
        else {
            queryList.append(q)
        }
        
        var indexOfQueryToAdd = queryList.count-1
        
        // if removed an old query from queryList
        if (isNewQueryVersionAvailable) {
            indexOfQueryToAdd = indexOfOldQuery
        }
        
        // add queries to the appropriate place in epochQueryMap
        // for each epoch number, check if query can be added there in map
        for epochNum in 0...MAX_EPOCH-1 {
            
            if (epochQueryMap[epochNum] == nil) {
                epochQueryMap[epochNum] = []
            }
                        
            if (q.epoch > 0 && ((epochNum+1) * EPOCH_LENGTH) % Int(q.epoch) == 0 && epochQueryMap[epochNum] != nil &&
                !epochQueryMap[epochNum]!.contains(indexOfQueryToAdd)) {
                epochQueryMap[epochNum]!.append(indexOfQueryToAdd)
            }
        }
    }
    
    // remove older query version if new version if available
    func removeOldQuery(_ oldQuery: Query) {
        
        let indexToRemove: Int = queryList.index(of: oldQuery)!
        
        // remove old query from queryList
        queryList.remove(at: indexToRemove)
        
        for epochNum in 0...MAX_EPOCH-1 {
            if (epochQueryMap[epochNum]!.contains(indexToRemove)) {
                epochQueryMap[epochNum]!.remove(at: epochQueryMap[epochNum]!.index(of: indexToRemove)!)
                break
            }
        
        }
        
    }

    // create an experiment query to test
    fileprivate func createExperimentQuery(_ longitudes: [Double], latitudes: [Double], radii: [Double], regionIdentifiers: [String]){
        let query = Query()
        query?.sensorType = Int32(SensorType_LOCATION.rawValue)
        query?.queryId = Int64(self.EXPERIMENT_QUERYID)
        query?.epoch = Int64(EXPERIMENT_EPOCH)
        
        let queryVector = QueryVector();
        queryVector?.ranges = []
        
        for i in 0...regionIdentifiers.count-1{
            let longLang = String(longitudes[i]) + "," + String(latitudes[i])
            let range: String = longLang + "," + String(self.EXPERIMENT_RADIUS_MATCH) + "," + String(regionIdentifiers[i])
            queryVector?.ranges.add(range)
        }
        
        query?.queryVector = queryVector
        query?.matchingType = Int32(MatchingType_LOCATION_MATCHING.rawValue)
        query?.epsilon = 1.0
        
        // set p? set q?
        
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var components = DateComponents()
        components.year = 2016
        components.day = 30
        components.month = 2
        let futureDate: Date = (calendar.date(from: components))!
        
        query?.queryStartTime = Int64(Date().timeIntervalSince1970 * 1000)
        query?.queryEndTime = Int64(futureDate.timeIntervalSince1970 * 1000)
        
        if (EXPERIMENT_QUERY_INDEX == -1) {
            queryList.append(query!)
        }
        else {
            queryList[EXPERIMENT_QUERY_INDEX] = query!
        }
    }
}
