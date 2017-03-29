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


@interface PrivateAnswer : NSObject <TBase, NSCoding> {
  int64_t __analystId;
  int64_t __queryId;
  NSData * __privateAnswerBits;
  int32_t __bitlen;
  int64_t __joinId;
  int64_t __versionId;

  BOOL __analystId_isset;
  BOOL __queryId_isset;
  BOOL __privateAnswerBits_isset;
  BOOL __bitlen_isset;
  BOOL __joinId_isset;
  BOOL __versionId_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, getter=analystId, setter=setAnalystId:) int64_t analystId;
@property (nonatomic, getter=queryId, setter=setQueryId:) int64_t queryId;
@property (nonatomic, retain, getter=privateAnswerBits, setter=setPrivateAnswerBits:) NSData * privateAnswerBits;
@property (nonatomic, getter=bitlen, setter=setBitlen:) int32_t bitlen;
@property (nonatomic, getter=joinId, setter=setJoinId:) int64_t joinId;
@property (nonatomic, getter=versionId, setter=setVersionId:) int64_t versionId;
#endif

- (id) init;
- (id) initWithAnalystId: (int64_t) analystId queryId: (int64_t) queryId privateAnswerBits: (NSData *) privateAnswerBits bitlen: (int32_t) bitlen joinId: (int64_t) joinId versionId: (int64_t) versionId;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

- (void) validate;

#if !__has_feature(objc_arc)
- (int64_t) analystId;
- (void) setAnalystId: (int64_t) analystId;
#endif
- (BOOL) analystIdIsSet;

#if !__has_feature(objc_arc)
- (int64_t) queryId;
- (void) setQueryId: (int64_t) queryId;
#endif
- (BOOL) queryIdIsSet;

#if !__has_feature(objc_arc)
- (NSData *) privateAnswerBits;
- (void) setPrivateAnswerBits: (NSData *) privateAnswerBits;
#endif
- (BOOL) privateAnswerBitsIsSet;

#if !__has_feature(objc_arc)
- (int32_t) bitlen;
- (void) setBitlen: (int32_t) bitlen;
#endif
- (BOOL) bitlenIsSet;

#if !__has_feature(objc_arc)
- (int64_t) joinId;
- (void) setJoinId: (int64_t) joinId;
#endif
- (BOOL) joinIdIsSet;

#if !__has_feature(objc_arc)
- (int64_t) versionId;
- (void) setVersionId: (int64_t) versionId;
#endif
- (BOOL) versionIdIsSet;

@end

@interface PrivateAnswerConstants : NSObject {
}
@end
