#include "KochavaTracker.h"

char* AutonomousStringCopy (const char* string)
{
	if (string == NULL)
	return NULL;
	
	char* res = (char*)malloc(strlen(string) + 1);
	strcpy(res, string);
	return res;
}

@interface NativeWrapper: NSObject <KochavaTrackerDelegate>

@end

@implementation NativeWrapper

// Decodes the attribution dictionary from the callback delegate or getter and returns a string.
+ (NSString *)decodeAttributionDictionary:(NSDictionary *)attributionDictionary {
    // Ensure it is json.
    if (attributionDictionary == nil || ![NSJSONSerialization isValidJSONObject:attributionDictionary])
    {
        return @"";
    }

    // Attempt to decode it into NSData.
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:attributionDictionary options:0 error:&error];
    if(!jsonData) {
        return @"";
    }

    // Convert the NSData into an NSString.
    NSString *attributionString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    if(attributionString == nil) {
        return @"";
    }

    // If it was valid return the string.
    return attributionString;
}

- (void)tracker:(nonnull KochavaTracker *)tracker didRetrieveAttributionDictionary:(nonnull NSDictionary *)attributionDictionary
{
    NSString * attributionString = [NativeWrapper decodeAttributionDictionary:attributionDictionary];
    // send this message back to the host app, which must always have a game object and listener method with these names
    const char* a = "KochavaTracker";
    const char* b = "KochavaAttributionListener";
    UnitySendMessage(a, b, AutonomousStringCopy([attributionString UTF8String]));
}

// Clears the running instance of the KochavaTracker so it is no longer rnning.
+ (void)invalidateKochava
{
    [KochavaTracker.shared performSelector:@selector(invalidate)];
}

// Removes all saved state for the KochavaTracer. Should call invalidate first.
+ (void)removeKochavaUserDefaults
{
    // Remove the NSUserDefaults keys.
    NSArray *keyArray = NSUserDefaults.standardUserDefaults.dictionaryRepresentation.allKeys;
    for (id key in keyArray)
    {
        NSRange kochavaPrefixRange = [key rangeOfString:@"com.kochava"];
        if ( kochavaPrefixRange.location != NSNotFound )
        {
            [NSUserDefaults.standardUserDefaults removeObjectForKey:key];
        }
    }

    // Remove the deviceId backup file.
    NSURL *documentDirectoryURL = [NSFileManager.defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask][0];
    NSURL *kochavaDirectoryURL = [documentDirectoryURL URLByAppendingPathComponent:@"com.kochava.KochavaTracker" isDirectory:true];
    NSURL *backupURL = [kochavaDirectoryURL URLByAppendingPathComponent:@"deviceIdString"];
    
    NSError *error = nil;
    [NSFileManager.defaultManager removeItemAtURL:backupURL error:&error];
}

@end

// create the object for the class
NativeWrapper *nativeWrapper;

// convert a c# stringified dictionary to an NSDictionary
NSMutableDictionary * ConvertToNSDictionary(const char *stringifiedDictionary) {
    if(stringifiedDictionary == NULL)
    {
        return nil;
    }
	
	NSString *str = [NSString stringWithUTF8String:stringifiedDictionary];
    NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *jsonSerializationError;
    id responseObject = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingAllowFragments error: &jsonSerializationError];

    // reponse dictionary
    if ([responseObject isKindOfClass:[NSDictionary class]])
   	{
       	return [responseObject mutableCopy];
   	}
    
    return nil;
}

extern "C" {
	
    // migrate the previously persisted data from unity v1
    void NativeMigrate()
    {
        // MIGRATE LEGACY UNITY SDK'S NSUSERDEFAULTS
        // oldDeviceIdStringKey, oldWatchlistPropertiesKey, oldKochavaQueueStorageKey, and oldAttributionDictionaryStringKey
        NSString * const oldDeviceIdStringKey = @"kochava_device_id";
        
        NSString * const oldWatchlistPropertiesKey = @"watchlistProperties";
        
        NSString * const oldKochavaQueueStorageKey = @"kochava_queue_storage";
        
        NSString * const oldAttributionDictionaryStringKey = @"attribution";
        
        // oldDeviceIdString
        NSString *oldDeviceIdString = [NSUserDefaults.standardUserDefaults objectForKey:oldDeviceIdStringKey];
        
        // Discussion:  We only proceed if we find an oldDeviceIdString.  If we don't, we assume that this is either a new install or else already migrated.
        if (oldDeviceIdString != nil)
        {
            // watchlistPropertiesObject
            NSObject *watchlistPropertiesObject = [NSUserDefaults.standardUserDefaults objectForKey:oldWatchlistPropertiesKey];
            
            // oldKochavaQueueStorageObject
            NSObject *oldKochavaQueueStorageObject = [NSUserDefaults.standardUserDefaults objectForKey:oldKochavaQueueStorageKey];
            
            // oldKochavaQueueStorageString
            NSString *oldKochavaQueueStorageString = nil;
            
            if ([oldKochavaQueueStorageObject isKindOfClass:NSString.class])
            {
                oldKochavaQueueStorageString = (NSString *)oldKochavaQueueStorageObject;
            }
            
            // watchlistPropertiesExistsBool
            BOOL watchlistPropertiesExistsBool = (watchlistPropertiesObject != nil);
            
            // oldKochavaQueueStorageContainsInitialBool
            BOOL oldKochavaQueueStorageContainsInitialBool = NO;
            
            if ((oldKochavaQueueStorageString != nil) && (oldKochavaQueueStorageString.length > 0))
            {
                NSRange range = [oldKochavaQueueStorageString rangeOfString:@"initial" options:NSCaseInsensitiveSearch];
                
                if (range.location != NSNotFound)
                {
                    oldKochavaQueueStorageContainsInitialBool = YES;
                }
            }
            
            // oldAttributionObject
            NSObject *oldAttributionObject = [NSUserDefaults.standardUserDefaults objectForKey:oldAttributionDictionaryStringKey];
            
            // oldAttributionString
            NSString *oldAttributionString = nil;
            
            if ([oldAttributionObject isKindOfClass:NSString.class])
            {
                oldAttributionString = (NSString *)oldAttributionObject;
            }
            
            // oldAttributionDictionary
            NSDictionary *oldAttributionDictionary = nil;
            
            if ([oldAttributionObject isKindOfClass:NSDictionary.class])
            {
                oldAttributionDictionary = (NSDictionary *)oldAttributionObject;
            }
            
            // oldAttributionStringData
            NSData *oldAttributionStringData = nil;
            
            if ((oldAttributionDictionary == nil) && (oldAttributionString != nil))
            {
                oldAttributionStringData = [oldAttributionString dataUsingEncoding:NSUTF8StringEncoding];
            }
            
            // attributionJSONObject and oldAttributionStringDataError
            id oldAttributionJSONObject = nil;
            
            NSError *oldAttributionStringDataError = nil;
            
            if (oldAttributionStringData != nil)
            {
                oldAttributionJSONObject = [NSJSONSerialization JSONObjectWithData:oldAttributionStringData options:NSJSONReadingMutableContainers error:&oldAttributionStringDataError];
            }
            
            // oldAttributionJSONDictionary
            NSDictionary *oldAttributionJSONDictionary = nil;
            
            if ([oldAttributionJSONObject isKindOfClass:NSDictionary.class])
            {
                oldAttributionJSONDictionary = (NSDictionary *)oldAttributionJSONObject;
            }
            
            // newAttributionDictionary
            NSDictionary *newAttributionDictionary = nil;
            
            if (oldAttributionDictionary != nil)
            {
                newAttributionDictionary = oldAttributionDictionary;
            }
            else if (oldAttributionJSONDictionary != nil)
            {
                newAttributionDictionary = oldAttributionJSONDictionary;
            }
            else if (oldAttributionString != nil)
            {
                newAttributionDictionary = @{ @"attribution": oldAttributionString };
            }
            
            // installNetTransactionFirstCompletedBool
            BOOL installNetTransactionFirstCompletedBool = (watchlistPropertiesExistsBool && !oldKochavaQueueStorageContainsInitialBool);
            
            // deviceIdStringAdapterDictionary
            NSDictionary *deviceIdStringAdapterDictionary = nil;
            
            if (oldDeviceIdString != nil)
            {
                NSMutableDictionary *deviceIdStringAdapterValueDictionary = NSMutableDictionary.dictionary;
                deviceIdStringAdapterValueDictionary[@"rawObject"] = oldDeviceIdString;
                deviceIdStringAdapterValueDictionary[@"valueSourceNameString"] = @"Tracker.deviceIdStringAdapter";
                deviceIdStringAdapterValueDictionary[@"serverObject"] = oldDeviceIdString;
                deviceIdStringAdapterValueDictionary[@"startDate"] = NSDate.date; // Normally a iso8601DateString now, but NSDate is also supported.
                
                deviceIdStringAdapterDictionary = @{ @"value" :  deviceIdStringAdapterValueDictionary };
            }
            
            // installSentBoolAdapterValueDictionary
            NSMutableDictionary *installSentBoolAdapterValueDictionary = NSMutableDictionary.dictionary;
            installSentBoolAdapterValueDictionary[@"rawObject"] = @(installNetTransactionFirstCompletedBool);
            installSentBoolAdapterValueDictionary[@"valueSourceNameString"] = @"Tracker.installSentBoolAdapter";
            installSentBoolAdapterValueDictionary[@"serverObject"] = @(installNetTransactionFirstCompletedBool);
            installSentBoolAdapterValueDictionary[@"startDate"] = NSDate.date; // Normally a iso860DateString now, but NSDate is also supported.
            
            // installSentBoolAdapterDictionary
            NSDictionary *installSentBoolAdapterDictionary = @{ @"value" : installSentBoolAdapterValueDictionary  };
            
            // attributionDictionaryAdapterDictionary
            NSDictionary *attributionDictionaryAdapterDictionary = nil;
            
            if (newAttributionDictionary != nil)
            {
                NSMutableDictionary *attributionDictionaryAdapterValueDictionary = NSMutableDictionary.dictionary;
                attributionDictionaryAdapterValueDictionary[@"rawObject"] = newAttributionDictionary;
                attributionDictionaryAdapterValueDictionary[@"valueSourceNameString"] = @"Tracker.attributionDictionaryAdapter";
                attributionDictionaryAdapterValueDictionary[@"serverObject"] = newAttributionDictionary;
                attributionDictionaryAdapterValueDictionary[@"startDate"] = NSDate.date; // Normally a iso8601DateString now, but NSDate is also supported.
                
                attributionDictionaryAdapterDictionary = @{ @"value" : attributionDictionaryAdapterValueDictionary  };
            }
            
            // NSUserDefaults.standardUserDefaults
            // ... set the new keys
            if (attributionDictionaryAdapterDictionary != nil)
            {
                [NSUserDefaults.standardUserDefaults setObject:attributionDictionaryAdapterDictionary forKey:@"com.kochava.KochavaTracker.Tracker.attributionDictionaryAdapter"];
            }
            
            [NSUserDefaults.standardUserDefaults setObject:installSentBoolAdapterDictionary forKey:@"com.kochava.KochavaTracker.Tracker.installSentBoolAdapter"];
            
            if (deviceIdStringAdapterDictionary != nil)
            {
                [NSUserDefaults.standardUserDefaults setObject:deviceIdStringAdapterDictionary forKey:@"com.kochava.KochavaTracker.Tracker.deviceIdStringAdapter"];
            }
            
            // ... remove the old keys
            [NSUserDefaults.standardUserDefaults removeObjectForKey:oldAttributionDictionaryStringKey];
            
            [NSUserDefaults.standardUserDefaults removeObjectForKey:oldKochavaQueueStorageKey];
            
            [NSUserDefaults.standardUserDefaults removeObjectForKey:oldWatchlistPropertiesKey];
            
            [NSUserDefaults.standardUserDefaults removeObjectForKey:oldDeviceIdStringKey];
        }
    }
	
	// initializer
	void iOSNativeStart(const char *inputParameters)
	{
		// migrate settings from the previous v1 unity sdk if applicable
		NativeMigrate();
		
		nativeWrapper = [[NativeWrapper alloc] init];

		NSMutableDictionary *dictionary = NSMutableDictionary.dictionary;
		dictionary = ConvertToNSDictionary(inputParameters);
        if(dictionary == nil)
        {
            NSLog(@"KochavaWrapper.configure Invalid Input");
            return;
        }

        // Check for the existence of the hidden unconfigure key.
        if ([dictionary objectForKey:@"INTERNAL_UNCONFIGURE"]) {
            NSLog(@"KochavaWrapper.configure UnConfigure.");
            [NativeWrapper invalidateKochava];
            return;
        }
        
        // Check for the existence of the hidden reset key.
        if ([dictionary objectForKey:@"INTERNAL_RESET"]) {
            NSLog(@"KochavaWrapper.configure Reset.");
            [NativeWrapper removeKochavaUserDefaults];
            return;
        }

		[KochavaTracker.shared configureWithParametersDictionary:dictionary delegate:nativeWrapper];

        //Check if intelligent consent management is on and apply as necessary.
        BOOL intelligentManagementBool = [[dictionary objectForKey:@"consentIntelligentManagement"] boolValue];
        if(intelligentManagementBool) {
            KochavaTracker.shared.consent.didUpdateBlock = ^(KVAConsent * _Nonnull consent)
            {
                const char* a = "KochavaTracker";
                const char* b = "KochavaConsentStatusChangeListener";
                UnitySendMessage(a, b, AutonomousStringCopy([@"{}" UTF8String]));
            };
        }
	}

}

extern "C" {

	void iOSNativeSendEvent(const char *eventName, const char *eventInfo)
	{
		NSString *evName = nil;
        if(eventName != NULL)
        {
            evName = [NSString stringWithUTF8String:eventName];
        }
		NSString *evInfo = nil;
        if(eventInfo != NULL) 
        {
            evInfo = [NSString stringWithUTF8String:eventInfo];
        }

		[KochavaTracker.shared sendEventWithNameString:evName infoString:evInfo];
	}

	void iOSNativeSendKochavaEvent(const char *eventName, const char *kochavaEventStringifiedDictionary)
	{
		// get the name
		NSString *evName = nil;
        if(eventName != NULL)
        {
            evName = [NSString stringWithUTF8String:eventName];
        }

		// convert the dictionary
		NSMutableDictionary *stdParamsDictionary = NSMutableDictionary.dictionary;
		stdParamsDictionary = ConvertToNSDictionary(kochavaEventStringifiedDictionary);

		// decide which enum to use based on eventName
		KochavaEventTypeEnum eventTypeEnum = KochavaEventTypeEnumUndefined;

		if([evName isEqualToString:@"Achievement"]) eventTypeEnum = KochavaEventTypeEnumAchievement;
		else if([evName isEqualToString:@"Add to Cart"]) eventTypeEnum = KochavaEventTypeEnumAddToCart;
		else if([evName isEqualToString:@"Add to Wish List"]) eventTypeEnum = KochavaEventTypeEnumAddToWishList;
		else if([evName isEqualToString:@"Checkout Start"]) eventTypeEnum = KochavaEventTypeEnumCheckoutStart;
		else if([evName isEqualToString:@"Level Complete"]) eventTypeEnum = KochavaEventTypeEnumLevelComplete;
		else if([evName isEqualToString:@"Purchase"]) eventTypeEnum = KochavaEventTypeEnumPurchase;
		else if([evName isEqualToString:@"Rating"]) eventTypeEnum = KochavaEventTypeEnumRating;
		else if([evName isEqualToString:@"Registration Complete"]) eventTypeEnum = KochavaEventTypeEnumRegistrationComplete;
		else if([evName isEqualToString:@"Search"]) eventTypeEnum = KochavaEventTypeEnumSearch;
		else if([evName isEqualToString:@"Tutorial Complete"]) eventTypeEnum = KochavaEventTypeEnumTutorialComplete;
		else if([evName isEqualToString:@"View"]) eventTypeEnum = KochavaEventTypeEnumView;
		else if([evName isEqualToString:@"Ad View"]) eventTypeEnum = KochavaEventTypeEnumAdView;
        else if([evName isEqualToString:@"Push Received"]) eventTypeEnum = KochavaEventTypeEnumPushReceived;
        else if([evName isEqualToString:@"Push Opened"]) eventTypeEnum = KochavaEventTypeEnumPushOpened;
        else if([evName isEqualToString:@"Consent Granted"]) eventTypeEnum = KochavaEventTypeEnumConsentGranted;
        else if([evName isEqualToString:@"_Deeplink"]) eventTypeEnum = KochavaEventTypeEnumDeepLink;
        else if([evName isEqualToString:@"Ad Click"]) eventTypeEnum = KochavaEventTypeEnumAdClick;
        else if([evName isEqualToString:@"Start Trial"]) eventTypeEnum = KochavaEventTypeEnumStartTrial;
        else if([evName isEqualToString:@"Subscribe"]) eventTypeEnum = KochavaEventTypeEnumSubscribe;
		else eventTypeEnum = KochavaEventTypeEnumCustom;

		// create a native KochavaEvent and populate it with each possible std. param which exists in the provided dictionary
		KochavaEvent* event = [KochavaEvent eventWithEventTypeEnum:eventTypeEnum];
		if(event == nil)
        {
            //Can this really happen?
            return;
        }
        if(stdParamsDictionary != nil)
		{
			NSMutableDictionary *infoDictionary = nil;

			for (NSString *key in stdParamsDictionary) {
				id value = stdParamsDictionary[key];			

                //Custom event name support. If we fall through from the eventTypeEnum to custom this defines the event name.
                if([key isEqualToString:@"customEventName"]) event.customEventNameString = (NSString *)value;
                //Add any other standard parameters.
				else if([key isEqualToString:@"checkout_as_guest"]) event.checkoutAsGuestString = (NSString *)value;
				else if([key isEqualToString:@"content_id"]) event.contentIdString = (NSString *)value;
				else if([key isEqualToString:@"content_type"]) event.contentTypeString = (NSString *)value;
				else if([key isEqualToString:@"currency"]) event.currencyString = (NSString *)value;			
				else if([key isEqualToString:@"date"]) event.dateString = (NSString *)value;
				else if([key isEqualToString:@"description"]) event.descriptionString = (NSString *)value;
				else if([key isEqualToString:@"destination"]) event.destinationString = (NSString *)value;
				else if([key isEqualToString:@"duration"]) event.durationTimeIntervalNumber = (NSNumber *)value;
				else if([key isEqualToString:@"end_date"]) event.endDateString = (NSString *)value;
				else if([key isEqualToString:@"item_added_from"]) event.itemAddedFromString = (NSString *)value;
				else if([key isEqualToString:@"level"]) event.levelString = (NSString *)value;				
				else if([key isEqualToString:@"max_rating_value"]) event.maxRatingValueDoubleNumber = (NSNumber *)value;
				else if([key isEqualToString:@"name"]) event.nameString = (NSString *)value;
				else if([key isEqualToString:@"order_id"]) event.orderIdString = (NSString *)value;
				else if([key isEqualToString:@"origin"]) event.originString = (NSString *)value;
				else if([key isEqualToString:@"price"]) event.priceDoubleNumber = (NSNumber *)value;
				else if([key isEqualToString:@"quantity"]) event.quantityDoubleNumber = (NSNumber *)value;
				else if([key isEqualToString:@"rating_value"]) event.ratingValueDoubleNumber = (NSNumber *)value;
				else if([key isEqualToString:@"receipt_id"]) event.receiptIdString = (NSString *)value;
				else if([key isEqualToString:@"appStoreReceiptBase64EncodedString"]) event.appStoreReceiptBase64EncodedString = (NSString *)value;
				else if([key isEqualToString:@"referral_from"]) event.referralFromString = (NSString *)value;
				else if([key isEqualToString:@"registration_method"]) event.registrationMethodString = (NSString *)value;
				else if([key isEqualToString:@"results"]) event.resultsString = (NSString *)value;
				else if([key isEqualToString:@"score"]) event.scoreString = (NSString *)value;
				else if([key isEqualToString:@"search_term"]) event.searchTermString = (NSString *)value;
				else if([key isEqualToString:@"spatial_x"]) event.spatialXDoubleNumber = (NSNumber *)value;
				else if([key isEqualToString:@"spatial_y"]) event.spatialYDoubleNumber = (NSNumber *)value;
				else if([key isEqualToString:@"spatial_z"]) event.spatialZDoubleNumber = (NSNumber *)value;
				else if([key isEqualToString:@"start_date"]) event.startDateString = (NSString *)value;
				else if([key isEqualToString:@"success"]) event.successString = (NSString *)value;
				else if([key isEqualToString:@"user_id"]) event.userIdString = (NSString *)value;
				else if([key isEqualToString:@"user_name"]) event.userNameString = (NSString *)value;
				else if([key isEqualToString:@"validated"]) event.validatedString = (NSString *)value;
                else if([key isEqualToString:@"background"]) event.backgroundBoolNumber = (NSNumber *)value;
                else if([key isEqualToString:@"action"]) event.actionString = (NSString *)value;
                else if([key isEqualToString:@"completed"]) event.completedBoolNumber = (NSNumber *)value;
                else if([key isEqualToString:@"payload"]) event.payloadDictionary = (NSDictionary *)value;
                else if([key isEqualToString:@"uri"]) event.uriString = (NSString *)value;
                else if([key isEqualToString:@"source"]) event.sourceString = (NSString *)value;
				else if([key isEqualToString:@"ad_network_name"]) event.adNetworkNameString = (NSString *)value;
                else if([key isEqualToString:@"ad_mediation_name"]) event.adMediationNameString = (NSString *)value;
                else if([key isEqualToString:@"device_type"]) event.adDeviceTypeString = (NSString *)value;
                else if([key isEqualToString:@"placement"]) event.adPlacementString = (NSString *)value;
                else if([key isEqualToString:@"ad_type"]) event.adTypeString = (NSString *)value;
                else if([key isEqualToString:@"ad_campaign_id"]) event.adCampaignIdString = (NSString *)value;
                else if([key isEqualToString:@"ad_campaign_name"]) event.adCampaignNameString = (NSString *)value;
                else if([key isEqualToString:@"ad_size"]) event.adSizeString = (NSString *)value;
                else if([key isEqualToString:@"ad_group_name"]) event.adGroupNameString = (NSString *)value;
                else if([key isEqualToString:@"ad_group_id"]) event.adGroupIdString = (NSString *)value;
				else {					
					// this is a custom param, add it to the custom dictionary
					if (infoDictionary == nil)
                    {
                        infoDictionary = NSMutableDictionary.dictionary;
                    }       
                    [infoDictionary setObject:value forKey:key];
				}
			}

            // if we set custom values add the custom dictionary here
            if (infoDictionary != nil) 
            {
                event.infoDictionary = infoDictionary;
            }
        }

        // now send it
        [KochavaTracker.shared sendEvent: event];
	}

	void iOSNativeSendEventWithReceipt(const char *eventName, const char *eventInfo, const char *eventReceipt)
	{
		NSString *evName = nil;
        if(eventName != NULL)
        {
            evName = [NSString stringWithUTF8String:eventName];
        }
		NSString *evInfo = nil;
        if(eventInfo != NULL)
        {
            evInfo = [NSString stringWithUTF8String:eventInfo];
        }
		NSString *evReceipt = nil;
        if(eventReceipt != NULL)
        {
            evReceipt = [NSString stringWithUTF8String:eventReceipt];
        }

		[KochavaTracker.shared sendEventWithNameString:evName infoString:evInfo appStoreReceiptBase64EncodedString:evReceipt];
	}

	void iOSNativeSendDeepLink(const char *openURL, const char *sourceApplicationString)
	{
        NSString *strOpenUrl = nil;
        if(openURL != NULL)
        {
            strOpenUrl = [NSString stringWithUTF8String:openURL];
        }

		NSURL *urlOpenUrl = nil;
        if(strOpenUrl != nil)
        {
            urlOpenUrl = [NSURL URLWithString:[strOpenUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        }

		NSString *strSourceApplicationString = nil;
        if(sourceApplicationString != NULL)
        {
            strSourceApplicationString = [NSString stringWithUTF8String:sourceApplicationString];
        }

		[KochavaTracker.shared sendDeepLinkWithOpenURL:urlOpenUrl sourceApplicationString:strSourceApplicationString];
	}

	void iOSNativeSendIdentityLink(const char *identityLinkDictionary)
	{    
		NSMutableDictionary *sendIdLinkDictionary = ConvertToNSDictionary(identityLinkDictionary);
		[KochavaTracker.shared sendIdentityLinkWithDictionary:sendIdLinkDictionary];
	}

	char* iOSNativeGetDeviceId()
	{
		NSString *kochavaTrackerDeviceIdString = KochavaTracker.shared.deviceIdString;
        if(kochavaTrackerDeviceIdString == nil)
        {
            kochavaTrackerDeviceIdString = @"";
        }
		return AutonomousStringCopy([kochavaTrackerDeviceIdString UTF8String]);
	}

	char* iOSNativeGetAttributionString()
	{
		NSDictionary *attributionDictionary = KochavaTracker.shared.attributionDictionary;
        NSString * attributionString = [NativeWrapper decodeAttributionDictionary:attributionDictionary];
        return AutonomousStringCopy([attributionString UTF8String]);
	}

	void iOSNativeSetAppLimitAdTrackingBool(bool value) {		
		[KochavaTracker.shared setAppLimitAdTrackingBool:value];		
	}

    void iOSNativeSetSleepBool(bool value) {		
		[KochavaTracker.shared setSleepBool:value];		
	}

    bool iOSNativeGetSleepBool() {		
		return [KochavaTracker.shared sleepBool];		
	}

	char* iOSNativeGetVersion()
	{
		NSString *kochavaTrackerVersionString = KochavaTracker.shared.sdkVersionString;
        if(kochavaTrackerVersionString == nil)
        {
            kochavaTrackerVersionString = @"";
        }
		return AutonomousStringCopy([kochavaTrackerVersionString UTF8String]);		
	}

    void iOSNativeAddPushToken(char* bytes, unsigned long length)
	{
        NSData *deviceToken = nil;
        if(bytes != NULL)
        {
            deviceToken = [NSData dataWithBytesNoCopy:bytes length:length freeWhenDone:NO];
        }
		[KochavaTracker.shared addRemoteNotificationsDeviceToken:deviceToken];
	}

    void iOSNativeRemovePushToken(char* bytes, unsigned long length)
	{
		NSData *deviceToken = nil;
        if(bytes != NULL)
        {
            deviceToken = [NSData dataWithBytesNoCopy:bytes length:length freeWhenDone:NO];
        }
		[KochavaTracker.shared removeRemoteNotificationsDeviceToken:deviceToken];
	}

    char* iOSNativeGetConsentDescription()
    { 
        NSString *descriptionString = KochavaTracker.shared.consent.descriptionString;
        if(descriptionString == nil)
        {
            descriptionString = @"";
        }
        return AutonomousStringCopy([descriptionString UTF8String]);
    }

    long iOSNativeGetConsentResponseTime()
    {
        NSDate *didRespondDate = KochavaTracker.shared.consent.responseDate;
        if(didRespondDate == nil)
        {
            return 0;
        }
        return [[NSNumber numberWithDouble:[didRespondDate timeIntervalSince1970]] longValue];
    }

    bool iOSNativeGetConsentRequired()
    {
        return KochavaTracker.shared.consent.requiredBool;
    }

    void iOSNativeSetConsentRequired(bool value) {		
		KochavaTracker.shared.consent.requiredBool = value;
	}

    bool iOSNativeGetConsentGranted()
    { 
        return KochavaTracker.shared.consent.isGrantedBool;
    }

    char* iOSNativeGetConsentPartnersJson()
    {
        NSString *consentPartnersString = nil; 
        NSObject *consentPartnersAsForContextObject = [(NSObject<KVAAsForContextObjectProtocol> *)KochavaTracker.shared.consent.partnerArray kva_asForContextObjectWithContext:KVAContext.sdkWrapper];
        if (consentPartnersAsForContextObject != nil)
        {
            NSError *error = nil;
            NSData *consentPartnersJSONData = [NSJSONSerialization dataWithJSONObject:consentPartnersAsForContextObject options:0 error:&error];
            
            if (consentPartnersJSONData != nil)
            {
                consentPartnersString = [[NSString alloc] initWithData:consentPartnersJSONData encoding:NSUTF8StringEncoding];
            }
        }

        if(consentPartnersString == nil)
        {
            consentPartnersString = @"[]";
        }
        return AutonomousStringCopy([consentPartnersString UTF8String]);
    }

    void iOSNativeSetConsentGranted(bool isGranted)
    {
        NSNumber *consentGranted = [NSNumber numberWithBool:isGranted];
        if(consentGranted != nil)
        {
            [KochavaTracker.shared.consent didPromptWithDidGrantBoolNumber:consentGranted];
        }
    }

    bool iOSNativeGetConsentShouldPrompt()
    {
        return KochavaTracker.shared.consent.shouldPromptBool;
    }

    void iOSNativeSetConsentPrompted()
    {
        [KochavaTracker.shared.consent willPrompt];
    }

    bool iOSNativeGetConsentRequirementsKnown()
    {
        return KochavaTracker.shared.consent.requiredBoolNumber != nil;
    }

}
