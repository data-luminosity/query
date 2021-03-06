/**
 * Autogenerated by Thrift Compiler (0.9.3)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */

#import <Foundation/Foundation.h>

#import <thrift/TProtocol.h>
#import <thrift/TApplicationException.h>
#import <thrift/TProtocolException.h>
#import <thrift/TProtocolUtil.h>
#import <thrift/TProcessor.h>
#import <thrift/TObjective-C.h>
#import <thrift/TBase.h>
#import <thrift/TAsyncTransport.h>
#import <thrift/TProtocolFactory.h>
#import <thrift/TBaseClient.h>


#import "Query.h"

@implementation QueryVector

- (id) init
{
  self = [super init];
#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
#endif
  return self;
}

- (id) initWithRanges: (NSMutableArray *) ranges
{
  self = [super init];
  __ranges = [ranges retain_stub];
  __ranges_isset = YES;
  return self;
}

- (id) initWithCoder: (NSCoder *) decoder
{
  self = [super init];
  if ([decoder containsValueForKey: @"ranges"])
  {
    __ranges = [[decoder decodeObjectForKey: @"ranges"] retain_stub];
    __ranges_isset = YES;
  }
  return self;
}

- (void) encodeWithCoder: (NSCoder *) encoder
{
  if (__ranges_isset)
  {
    [encoder encodeObject: __ranges forKey: @"ranges"];
  }
}

- (NSUInteger) hash
{
  NSUInteger hash = 17;
  hash = (hash * 31) ^ __ranges_isset ? 2654435761 : 0;
  if (__ranges_isset)
  {
    hash = (hash * 31) ^ [__ranges hash];
  }
  return hash;
}

- (BOOL) isEqual: (id) anObject
{
  if (self == anObject) {
    return YES;
  }
  if (![anObject isKindOfClass:[QueryVector class]]) {
    return NO;
  }
  QueryVector *other = (QueryVector *)anObject;
  if ((__ranges_isset != other->__ranges_isset) ||
      (__ranges_isset && ((__ranges || other->__ranges) && ![__ranges isEqual:other->__ranges]))) {
    return NO;
  }
  return YES;
}

- (void) dealloc
{
  [__ranges release_stub];
  [super dealloc_stub];
}

- (NSMutableArray *) ranges {
  return [[__ranges retain_stub] autorelease_stub];
}

- (void) setRanges: (NSMutableArray *) ranges {
  [ranges retain_stub];
  [__ranges release_stub];
  __ranges = ranges;
  __ranges_isset = YES;
}

- (BOOL) rangesIsSet {
  return __ranges_isset;
}

- (void) unsetRanges {
  [__ranges release_stub];
  __ranges = nil;
  __ranges_isset = NO;
}

- (void) read: (id <TProtocol>) inProtocol
{
  NSString * fieldName;
  int fieldType;
  int fieldID;

  [inProtocol readStructBeginReturningName: NULL];
  while (true)
  {
    [inProtocol readFieldBeginReturningName: &fieldName type: &fieldType fieldID: &fieldID];
    if (fieldType == TType_STOP) { 
      break;
    }
    switch (fieldID)
    {
      case 1:
        if (fieldType == TType_LIST) {
          int _size0;
          [inProtocol readListBeginReturningElementType: NULL size: &_size0];
          NSMutableArray * fieldValue = [[NSMutableArray alloc] initWithCapacity: _size0];
          int _i1;
          for (_i1 = 0; _i1 < _size0; ++_i1)
          {
            NSString * _elem2 = [inProtocol readString];
            [fieldValue addObject: _elem2];
          }
          [inProtocol readListEnd];
          [self setRanges: fieldValue];
          [fieldValue release_stub];
        } else { 
          [TProtocolUtil skipType: fieldType onProtocol: inProtocol];
        }
        break;
      default:
        [TProtocolUtil skipType: fieldType onProtocol: inProtocol];
        break;
    }
    [inProtocol readFieldEnd];
  }
  [inProtocol readStructEnd];
}

- (void) write: (id <TProtocol>) outProtocol {
  [outProtocol writeStructBeginWithName: @"QueryVector"];
  if (__ranges_isset) {
    if (__ranges != nil) {
      [outProtocol writeFieldBeginWithName: @"ranges" type: TType_LIST fieldID: 1];
      {
        [outProtocol writeListBeginWithElementType: TType_STRING size: [__ranges count]];
        int idx4;
        for (idx4 = 0; idx4 < [__ranges count]; idx4++)
        {
          [outProtocol writeString: [__ranges objectAtIndex: idx4]];
        }
        [outProtocol writeListEnd];
      }
      [outProtocol writeFieldEnd];
    }
  }
  [outProtocol writeFieldStop];
  [outProtocol writeStructEnd];
}

- (void) validate {
  // check for required fields
}

- (NSString *) description {
  NSMutableString * ms = [NSMutableString stringWithString: @"QueryVector("];
  [ms appendString: @"ranges:"];
  [ms appendFormat: @"%@", __ranges];
  [ms appendString: @")"];
  return [NSString stringWithString: ms];
}

@end

@implementation Query

- (id) init
{
  self = [super init];
#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
#endif
  return self;
}

- (id) initWithAnalystId: (int64_t) analystId queryId: (int64_t) queryId queryStartTime: (int64_t) queryStartTime queryEndTime: (int64_t) queryEndTime epoch: (int64_t) epoch sensorType: (int) sensorType matchingType: (int) matchingType queryVector: (QueryVector *) queryVector epsilon: (double) epsilon flipOne: (NSString *) flipOne flipTwo: (NSString *) flipTwo versionId: (int64_t) versionId
{
  self = [super init];
  __analystId = analystId;
  __analystId_isset = YES;
  __queryId = queryId;
  __queryId_isset = YES;
  __queryStartTime = queryStartTime;
  __queryStartTime_isset = YES;
  __queryEndTime = queryEndTime;
  __queryEndTime_isset = YES;
  __epoch = epoch;
  __epoch_isset = YES;
  __sensorType = sensorType;
  __sensorType_isset = YES;
  __matchingType = matchingType;
  __matchingType_isset = YES;
  __queryVector = [queryVector retain_stub];
  __queryVector_isset = YES;
  __epsilon = epsilon;
  __epsilon_isset = YES;
  __flipOne = [flipOne retain_stub];
  __flipOne_isset = YES;
  __flipTwo = [flipTwo retain_stub];
  __flipTwo_isset = YES;
  __versionId = versionId;
  __versionId_isset = YES;
  return self;
}

- (id) initWithCoder: (NSCoder *) decoder
{
  self = [super init];
  if ([decoder containsValueForKey: @"analystId"])
  {
    __analystId = [decoder decodeInt64ForKey: @"analystId"];
    __analystId_isset = YES;
  }
  if ([decoder containsValueForKey: @"queryId"])
  {
    __queryId = [decoder decodeInt64ForKey: @"queryId"];
    __queryId_isset = YES;
  }
  if ([decoder containsValueForKey: @"queryStartTime"])
  {
    __queryStartTime = [decoder decodeInt64ForKey: @"queryStartTime"];
    __queryStartTime_isset = YES;
  }
  if ([decoder containsValueForKey: @"queryEndTime"])
  {
    __queryEndTime = [decoder decodeInt64ForKey: @"queryEndTime"];
    __queryEndTime_isset = YES;
  }
  if ([decoder containsValueForKey: @"epoch"])
  {
    __epoch = [decoder decodeInt64ForKey: @"epoch"];
    __epoch_isset = YES;
  }
  if ([decoder containsValueForKey: @"sensorType"])
  {
    __sensorType = [decoder decodeIntForKey: @"sensorType"];
    __sensorType_isset = YES;
  }
  if ([decoder containsValueForKey: @"matchingType"])
  {
    __matchingType = [decoder decodeIntForKey: @"matchingType"];
    __matchingType_isset = YES;
  }
  if ([decoder containsValueForKey: @"queryVector"])
  {
    __queryVector = [[decoder decodeObjectForKey: @"queryVector"] retain_stub];
    __queryVector_isset = YES;
  }
  if ([decoder containsValueForKey: @"epsilon"])
  {
    __epsilon = [decoder decodeDoubleForKey: @"epsilon"];
    __epsilon_isset = YES;
  }
  if ([decoder containsValueForKey: @"flipOne"])
  {
    __flipOne = [[decoder decodeObjectForKey: @"flipOne"] retain_stub];
    __flipOne_isset = YES;
  }
  if ([decoder containsValueForKey: @"flipTwo"])
  {
    __flipTwo = [[decoder decodeObjectForKey: @"flipTwo"] retain_stub];
    __flipTwo_isset = YES;
  }
  if ([decoder containsValueForKey: @"versionId"])
  {
    __versionId = [decoder decodeInt64ForKey: @"versionId"];
    __versionId_isset = YES;
  }
  return self;
}

- (void) encodeWithCoder: (NSCoder *) encoder
{
  if (__analystId_isset)
  {
    [encoder encodeInt64: __analystId forKey: @"analystId"];
  }
  if (__queryId_isset)
  {
    [encoder encodeInt64: __queryId forKey: @"queryId"];
  }
  if (__queryStartTime_isset)
  {
    [encoder encodeInt64: __queryStartTime forKey: @"queryStartTime"];
  }
  if (__queryEndTime_isset)
  {
    [encoder encodeInt64: __queryEndTime forKey: @"queryEndTime"];
  }
  if (__epoch_isset)
  {
    [encoder encodeInt64: __epoch forKey: @"epoch"];
  }
  if (__sensorType_isset)
  {
    [encoder encodeInt: __sensorType forKey: @"sensorType"];
  }
  if (__matchingType_isset)
  {
    [encoder encodeInt: __matchingType forKey: @"matchingType"];
  }
  if (__queryVector_isset)
  {
    [encoder encodeObject: __queryVector forKey: @"queryVector"];
  }
  if (__epsilon_isset)
  {
    [encoder encodeDouble: __epsilon forKey: @"epsilon"];
  }
  if (__flipOne_isset)
  {
    [encoder encodeObject: __flipOne forKey: @"flipOne"];
  }
  if (__flipTwo_isset)
  {
    [encoder encodeObject: __flipTwo forKey: @"flipTwo"];
  }
  if (__versionId_isset)
  {
    [encoder encodeInt64: __versionId forKey: @"versionId"];
  }
}

- (NSUInteger) hash
{
  NSUInteger hash = 17;
  hash = (hash * 31) ^ __analystId_isset ? 2654435761 : 0;
  if (__analystId_isset)
  {
    hash = (hash * 31) ^ [@(__analystId) hash];
  }
  hash = (hash * 31) ^ __queryId_isset ? 2654435761 : 0;
  if (__queryId_isset)
  {
    hash = (hash * 31) ^ [@(__queryId) hash];
  }
  hash = (hash * 31) ^ __queryStartTime_isset ? 2654435761 : 0;
  if (__queryStartTime_isset)
  {
    hash = (hash * 31) ^ [@(__queryStartTime) hash];
  }
  hash = (hash * 31) ^ __queryEndTime_isset ? 2654435761 : 0;
  if (__queryEndTime_isset)
  {
    hash = (hash * 31) ^ [@(__queryEndTime) hash];
  }
  hash = (hash * 31) ^ __epoch_isset ? 2654435761 : 0;
  if (__epoch_isset)
  {
    hash = (hash * 31) ^ [@(__epoch) hash];
  }
  hash = (hash * 31) ^ __sensorType_isset ? 2654435761 : 0;
  if (__sensorType_isset)
  {
    hash = (hash * 31) ^ [@(__sensorType) hash];
  }
  hash = (hash * 31) ^ __matchingType_isset ? 2654435761 : 0;
  if (__matchingType_isset)
  {
    hash = (hash * 31) ^ [@(__matchingType) hash];
  }
  hash = (hash * 31) ^ __queryVector_isset ? 2654435761 : 0;
  if (__queryVector_isset)
  {
    hash = (hash * 31) ^ [__queryVector hash];
  }
  hash = (hash * 31) ^ __epsilon_isset ? 2654435761 : 0;
  if (__epsilon_isset)
  {
    hash = (hash * 31) ^ [@(__epsilon) hash];
  }
  hash = (hash * 31) ^ __flipOne_isset ? 2654435761 : 0;
  if (__flipOne_isset)
  {
    hash = (hash * 31) ^ [__flipOne hash];
  }
  hash = (hash * 31) ^ __flipTwo_isset ? 2654435761 : 0;
  if (__flipTwo_isset)
  {
    hash = (hash * 31) ^ [__flipTwo hash];
  }
  hash = (hash * 31) ^ __versionId_isset ? 2654435761 : 0;
  if (__versionId_isset)
  {
    hash = (hash * 31) ^ [@(__versionId) hash];
  }
  return hash;
}

- (BOOL) isEqual: (id) anObject
{
  if (self == anObject) {
    return YES;
  }
  if (![anObject isKindOfClass:[Query class]]) {
    return NO;
  }
  Query *other = (Query *)anObject;
  if ((__analystId_isset != other->__analystId_isset) ||
      (__analystId_isset && (__analystId != other->__analystId))) {
    return NO;
  }
  if ((__queryId_isset != other->__queryId_isset) ||
      (__queryId_isset && (__queryId != other->__queryId))) {
    return NO;
  }
  if ((__queryStartTime_isset != other->__queryStartTime_isset) ||
      (__queryStartTime_isset && (__queryStartTime != other->__queryStartTime))) {
    return NO;
  }
  if ((__queryEndTime_isset != other->__queryEndTime_isset) ||
      (__queryEndTime_isset && (__queryEndTime != other->__queryEndTime))) {
    return NO;
  }
  if ((__epoch_isset != other->__epoch_isset) ||
      (__epoch_isset && (__epoch != other->__epoch))) {
    return NO;
  }
  if ((__sensorType_isset != other->__sensorType_isset) ||
      (__sensorType_isset && (__sensorType != other->__sensorType))) {
    return NO;
  }
  if ((__matchingType_isset != other->__matchingType_isset) ||
      (__matchingType_isset && (__matchingType != other->__matchingType))) {
    return NO;
  }
  if ((__queryVector_isset != other->__queryVector_isset) ||
      (__queryVector_isset && ((__queryVector || other->__queryVector) && ![__queryVector isEqual:other->__queryVector]))) {
    return NO;
  }
  if ((__epsilon_isset != other->__epsilon_isset) ||
      (__epsilon_isset && (__epsilon != other->__epsilon))) {
    return NO;
  }
  if ((__flipOne_isset != other->__flipOne_isset) ||
      (__flipOne_isset && ((__flipOne || other->__flipOne) && ![__flipOne isEqual:other->__flipOne]))) {
    return NO;
  }
  if ((__flipTwo_isset != other->__flipTwo_isset) ||
      (__flipTwo_isset && ((__flipTwo || other->__flipTwo) && ![__flipTwo isEqual:other->__flipTwo]))) {
    return NO;
  }
  if ((__versionId_isset != other->__versionId_isset) ||
      (__versionId_isset && (__versionId != other->__versionId))) {
    return NO;
  }
  return YES;
}

- (void) dealloc
{
  [__queryVector release_stub];
  [__flipOne release_stub];
  [__flipTwo release_stub];
  [super dealloc_stub];
}

- (int64_t) analystId {
  return __analystId;
}

- (void) setAnalystId: (int64_t) analystId {
  __analystId = analystId;
  __analystId_isset = YES;
}

- (BOOL) analystIdIsSet {
  return __analystId_isset;
}

- (void) unsetAnalystId {
  __analystId_isset = NO;
}

- (int64_t) queryId {
  return __queryId;
}

- (void) setQueryId: (int64_t) queryId {
  __queryId = queryId;
  __queryId_isset = YES;
}

- (BOOL) queryIdIsSet {
  return __queryId_isset;
}

- (void) unsetQueryId {
  __queryId_isset = NO;
}

- (int64_t) queryStartTime {
  return __queryStartTime;
}

- (void) setQueryStartTime: (int64_t) queryStartTime {
  __queryStartTime = queryStartTime;
  __queryStartTime_isset = YES;
}

- (BOOL) queryStartTimeIsSet {
  return __queryStartTime_isset;
}

- (void) unsetQueryStartTime {
  __queryStartTime_isset = NO;
}

- (int64_t) queryEndTime {
  return __queryEndTime;
}

- (void) setQueryEndTime: (int64_t) queryEndTime {
  __queryEndTime = queryEndTime;
  __queryEndTime_isset = YES;
}

- (BOOL) queryEndTimeIsSet {
  return __queryEndTime_isset;
}

- (void) unsetQueryEndTime {
  __queryEndTime_isset = NO;
}

- (int64_t) epoch {
  return __epoch;
}

- (void) setEpoch: (int64_t) epoch {
  __epoch = epoch;
  __epoch_isset = YES;
}

- (BOOL) epochIsSet {
  return __epoch_isset;
}

- (void) unsetEpoch {
  __epoch_isset = NO;
}

- (int) sensorType {
  return __sensorType;
}

- (void) setSensorType: (int) sensorType {
  __sensorType = sensorType;
  __sensorType_isset = YES;
}

- (BOOL) sensorTypeIsSet {
  return __sensorType_isset;
}

- (void) unsetSensorType {
  __sensorType_isset = NO;
}

- (int) matchingType {
  return __matchingType;
}

- (void) setMatchingType: (int) matchingType {
  __matchingType = matchingType;
  __matchingType_isset = YES;
}

- (BOOL) matchingTypeIsSet {
  return __matchingType_isset;
}

- (void) unsetMatchingType {
  __matchingType_isset = NO;
}

- (QueryVector *) queryVector {
  return [[__queryVector retain_stub] autorelease_stub];
}

- (void) setQueryVector: (QueryVector *) queryVector {
  [queryVector retain_stub];
  [__queryVector release_stub];
  __queryVector = queryVector;
  __queryVector_isset = YES;
}

- (BOOL) queryVectorIsSet {
  return __queryVector_isset;
}

- (void) unsetQueryVector {
  [__queryVector release_stub];
  __queryVector = nil;
  __queryVector_isset = NO;
}

- (double) epsilon {
  return __epsilon;
}

- (void) setEpsilon: (double) epsilon {
  __epsilon = epsilon;
  __epsilon_isset = YES;
}

- (BOOL) epsilonIsSet {
  return __epsilon_isset;
}

- (void) unsetEpsilon {
  __epsilon_isset = NO;
}

- (NSString *) flipOne {
  return [[__flipOne retain_stub] autorelease_stub];
}

- (void) setFlipOne: (NSString *) flipOne {
  [flipOne retain_stub];
  [__flipOne release_stub];
  __flipOne = flipOne;
  __flipOne_isset = YES;
}

- (BOOL) flipOneIsSet {
  return __flipOne_isset;
}

- (void) unsetFlipOne {
  [__flipOne release_stub];
  __flipOne = nil;
  __flipOne_isset = NO;
}

- (NSString *) flipTwo {
  return [[__flipTwo retain_stub] autorelease_stub];
}

- (void) setFlipTwo: (NSString *) flipTwo {
  [flipTwo retain_stub];
  [__flipTwo release_stub];
  __flipTwo = flipTwo;
  __flipTwo_isset = YES;
}

- (BOOL) flipTwoIsSet {
  return __flipTwo_isset;
}

- (void) unsetFlipTwo {
  [__flipTwo release_stub];
  __flipTwo = nil;
  __flipTwo_isset = NO;
}

- (int64_t) versionId {
  return __versionId;
}

- (void) setVersionId: (int64_t) versionId {
  __versionId = versionId;
  __versionId_isset = YES;
}

- (BOOL) versionIdIsSet {
  return __versionId_isset;
}

- (void) unsetVersionId {
  __versionId_isset = NO;
}

- (void) read: (id <TProtocol>) inProtocol
{
  NSString * fieldName;
  int fieldType;
  int fieldID;

  [inProtocol readStructBeginReturningName: NULL];
  while (true)
  {
    [inProtocol readFieldBeginReturningName: &fieldName type: &fieldType fieldID: &fieldID];
    if (fieldType == TType_STOP) { 
      break;
    }
    switch (fieldID)
    {
      case 1:
        if (fieldType == TType_I64) {
          int64_t fieldValue = [inProtocol readI64];
          [self setAnalystId: fieldValue];
        } else { 
          [TProtocolUtil skipType: fieldType onProtocol: inProtocol];
        }
        break;
      case 2:
        if (fieldType == TType_I64) {
          int64_t fieldValue = [inProtocol readI64];
          [self setQueryId: fieldValue];
        } else { 
          [TProtocolUtil skipType: fieldType onProtocol: inProtocol];
        }
        break;
      case 3:
        if (fieldType == TType_I64) {
          int64_t fieldValue = [inProtocol readI64];
          [self setQueryStartTime: fieldValue];
        } else { 
          [TProtocolUtil skipType: fieldType onProtocol: inProtocol];
        }
        break;
      case 4:
        if (fieldType == TType_I64) {
          int64_t fieldValue = [inProtocol readI64];
          [self setQueryEndTime: fieldValue];
        } else { 
          [TProtocolUtil skipType: fieldType onProtocol: inProtocol];
        }
        break;
      case 5:
        if (fieldType == TType_I64) {
          int64_t fieldValue = [inProtocol readI64];
          [self setEpoch: fieldValue];
        } else { 
          [TProtocolUtil skipType: fieldType onProtocol: inProtocol];
        }
        break;
      case 6:
        if (fieldType == TType_I32) {
          int fieldValue = [inProtocol readI32];
          [self setSensorType: fieldValue];
        } else { 
          [TProtocolUtil skipType: fieldType onProtocol: inProtocol];
        }
        break;
      case 7:
        if (fieldType == TType_I32) {
          int fieldValue = [inProtocol readI32];
          [self setMatchingType: fieldValue];
        } else { 
          [TProtocolUtil skipType: fieldType onProtocol: inProtocol];
        }
        break;
      case 8:
        if (fieldType == TType_STRUCT) {
          QueryVector *fieldValue = [[QueryVector alloc] init];
          [fieldValue read: inProtocol];
          [self setQueryVector: fieldValue];
          [fieldValue release_stub];
        } else { 
          [TProtocolUtil skipType: fieldType onProtocol: inProtocol];
        }
        break;
      case 9:
        if (fieldType == TType_DOUBLE) {
          double fieldValue = [inProtocol readDouble];
          [self setEpsilon: fieldValue];
        } else { 
          [TProtocolUtil skipType: fieldType onProtocol: inProtocol];
        }
        break;
      case 10:
        if (fieldType == TType_STRING) {
          NSString * fieldValue = [inProtocol readString];
          [self setFlipOne: fieldValue];
        } else { 
          [TProtocolUtil skipType: fieldType onProtocol: inProtocol];
        }
        break;
      case 11:
        if (fieldType == TType_STRING) {
          NSString * fieldValue = [inProtocol readString];
          [self setFlipTwo: fieldValue];
        } else { 
          [TProtocolUtil skipType: fieldType onProtocol: inProtocol];
        }
        break;
      case 12:
        if (fieldType == TType_I64) {
          int64_t fieldValue = [inProtocol readI64];
          [self setVersionId: fieldValue];
        } else { 
          [TProtocolUtil skipType: fieldType onProtocol: inProtocol];
        }
        break;
      default:
        [TProtocolUtil skipType: fieldType onProtocol: inProtocol];
        break;
    }
    [inProtocol readFieldEnd];
  }
  [inProtocol readStructEnd];
}

- (void) write: (id <TProtocol>) outProtocol {
  [outProtocol writeStructBeginWithName: @"Query"];
  if (__analystId_isset) {
    [outProtocol writeFieldBeginWithName: @"analystId" type: TType_I64 fieldID: 1];
    [outProtocol writeI64: __analystId];
    [outProtocol writeFieldEnd];
  }
  if (__queryId_isset) {
    [outProtocol writeFieldBeginWithName: @"queryId" type: TType_I64 fieldID: 2];
    [outProtocol writeI64: __queryId];
    [outProtocol writeFieldEnd];
  }
  if (__queryStartTime_isset) {
    [outProtocol writeFieldBeginWithName: @"queryStartTime" type: TType_I64 fieldID: 3];
    [outProtocol writeI64: __queryStartTime];
    [outProtocol writeFieldEnd];
  }
  if (__queryEndTime_isset) {
    [outProtocol writeFieldBeginWithName: @"queryEndTime" type: TType_I64 fieldID: 4];
    [outProtocol writeI64: __queryEndTime];
    [outProtocol writeFieldEnd];
  }
  if (__epoch_isset) {
    [outProtocol writeFieldBeginWithName: @"epoch" type: TType_I64 fieldID: 5];
    [outProtocol writeI64: __epoch];
    [outProtocol writeFieldEnd];
  }
  if (__sensorType_isset) {
    [outProtocol writeFieldBeginWithName: @"sensorType" type: TType_I32 fieldID: 6];
    [outProtocol writeI32: __sensorType];
    [outProtocol writeFieldEnd];
  }
  if (__matchingType_isset) {
    [outProtocol writeFieldBeginWithName: @"matchingType" type: TType_I32 fieldID: 7];
    [outProtocol writeI32: __matchingType];
    [outProtocol writeFieldEnd];
  }
  if (__queryVector_isset) {
    if (__queryVector != nil) {
      [outProtocol writeFieldBeginWithName: @"queryVector" type: TType_STRUCT fieldID: 8];
      [__queryVector write: outProtocol];
      [outProtocol writeFieldEnd];
    }
  }
  if (__epsilon_isset) {
    [outProtocol writeFieldBeginWithName: @"epsilon" type: TType_DOUBLE fieldID: 9];
    [outProtocol writeDouble: __epsilon];
    [outProtocol writeFieldEnd];
  }
  if (__flipOne_isset) {
    if (__flipOne != nil) {
      [outProtocol writeFieldBeginWithName: @"flipOne" type: TType_STRING fieldID: 10];
      [outProtocol writeString: __flipOne];
      [outProtocol writeFieldEnd];
    }
  }
  if (__flipTwo_isset) {
    if (__flipTwo != nil) {
      [outProtocol writeFieldBeginWithName: @"flipTwo" type: TType_STRING fieldID: 11];
      [outProtocol writeString: __flipTwo];
      [outProtocol writeFieldEnd];
    }
  }
  if (__versionId_isset) {
    [outProtocol writeFieldBeginWithName: @"versionId" type: TType_I64 fieldID: 12];
    [outProtocol writeI64: __versionId];
    [outProtocol writeFieldEnd];
  }
  [outProtocol writeFieldStop];
  [outProtocol writeStructEnd];
}

- (void) validate {
  // check for required fields
}

- (NSString *) description {
  NSMutableString * ms = [NSMutableString stringWithString: @"Query("];
  [ms appendString: @"analystId:"];
  [ms appendFormat: @"%qi", __analystId];
  [ms appendString: @",queryId:"];
  [ms appendFormat: @"%qi", __queryId];
  [ms appendString: @",queryStartTime:"];
  [ms appendFormat: @"%qi", __queryStartTime];
  [ms appendString: @",queryEndTime:"];
  [ms appendFormat: @"%qi", __queryEndTime];
  [ms appendString: @",epoch:"];
  [ms appendFormat: @"%qi", __epoch];
  [ms appendString: @",sensorType:"];
  [ms appendFormat: @"%i", __sensorType];
  [ms appendString: @",matchingType:"];
  [ms appendFormat: @"%i", __matchingType];
  [ms appendString: @",queryVector:"];
  [ms appendFormat: @"%@", __queryVector];
  [ms appendString: @",epsilon:"];
  [ms appendFormat: @"%f", __epsilon];
  [ms appendString: @",flipOne:"];
  [ms appendFormat: @"\"%@\"", __flipOne];
  [ms appendString: @",flipTwo:"];
  [ms appendFormat: @"\"%@\"", __flipTwo];
  [ms appendString: @",versionId:"];
  [ms appendFormat: @"%qi", __versionId];
  [ms appendString: @")"];
  return [NSString stringWithString: ms];
}

@end


@implementation QueryConstants
+ (void) initialize {
}
@end

