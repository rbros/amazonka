{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.EC2.DescribeReservedInstancesOfferings
-- Copyright   : (c) 2013-2015 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- | Describes Reserved Instance offerings that are available for purchase.
-- With Reserved Instances, you purchase the right to launch instances for
-- a period of time. During that time period, you do not receive
-- insufficient capacity errors, and you pay a lower usage rate than the
-- rate charged for On-Demand instances for the actual time used.
--
-- For more information, see
-- <http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html Reserved Instance Marketplace>
-- in the /Amazon Elastic Compute Cloud User Guide/.
--
-- <http://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeReservedInstancesOfferings.html>
module Network.AWS.EC2.DescribeReservedInstancesOfferings
    (
    -- * Request
      DescribeReservedInstancesOfferings
    -- ** Request constructor
    , describeReservedInstancesOfferings
    -- ** Request lenses
    , drioMaxDuration
    , drioProductDescription
    , drioIncludeMarketplace
    , drioFilters
    , drioInstanceType
    , drioNextToken
    , drioMinDuration
    , drioAvailabilityZone
    , drioOfferingType
    , drioReservedInstancesOfferingIds
    , drioInstanceTenancy
    , drioDryRun
    , drioMaxResults
    , drioMaxInstanceCount

    -- * Response
    , DescribeReservedInstancesOfferingsResponse
    -- ** Response constructor
    , describeReservedInstancesOfferingsResponse
    -- ** Response lenses
    , driorNextToken
    , driorReservedInstancesOfferings
    ) where

import Network.AWS.EC2.Types
import Network.AWS.Pagers
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'describeReservedInstancesOfferings' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'drioMaxDuration'
--
-- * 'drioProductDescription'
--
-- * 'drioIncludeMarketplace'
--
-- * 'drioFilters'
--
-- * 'drioInstanceType'
--
-- * 'drioNextToken'
--
-- * 'drioMinDuration'
--
-- * 'drioAvailabilityZone'
--
-- * 'drioOfferingType'
--
-- * 'drioReservedInstancesOfferingIds'
--
-- * 'drioInstanceTenancy'
--
-- * 'drioDryRun'
--
-- * 'drioMaxResults'
--
-- * 'drioMaxInstanceCount'
data DescribeReservedInstancesOfferings = DescribeReservedInstancesOfferings'{_drioMaxDuration :: Maybe Integer, _drioProductDescription :: Maybe RIProductDescription, _drioIncludeMarketplace :: Maybe Bool, _drioFilters :: Maybe [Filter], _drioInstanceType :: Maybe InstanceType, _drioNextToken :: Maybe Text, _drioMinDuration :: Maybe Integer, _drioAvailabilityZone :: Maybe Text, _drioOfferingType :: Maybe OfferingTypeValues, _drioReservedInstancesOfferingIds :: Maybe [Text], _drioInstanceTenancy :: Maybe Tenancy, _drioDryRun :: Maybe Bool, _drioMaxResults :: Maybe Int, _drioMaxInstanceCount :: Maybe Int} deriving (Eq, Read, Show)

-- | 'DescribeReservedInstancesOfferings' smart constructor.
describeReservedInstancesOfferings :: DescribeReservedInstancesOfferings
describeReservedInstancesOfferings = DescribeReservedInstancesOfferings'{_drioMaxDuration = Nothing, _drioProductDescription = Nothing, _drioIncludeMarketplace = Nothing, _drioFilters = Nothing, _drioInstanceType = Nothing, _drioNextToken = Nothing, _drioMinDuration = Nothing, _drioAvailabilityZone = Nothing, _drioOfferingType = Nothing, _drioReservedInstancesOfferingIds = Nothing, _drioInstanceTenancy = Nothing, _drioDryRun = Nothing, _drioMaxResults = Nothing, _drioMaxInstanceCount = Nothing};

-- | The maximum duration (in seconds) to filter when searching for
-- offerings.
--
-- Default: 94608000 (3 years)
drioMaxDuration :: Lens' DescribeReservedInstancesOfferings (Maybe Integer)
drioMaxDuration = lens _drioMaxDuration (\ s a -> s{_drioMaxDuration = a});

-- | The Reserved Instance product platform description. Instances that
-- include @(Amazon VPC)@ in the description are for use with Amazon VPC.
drioProductDescription :: Lens' DescribeReservedInstancesOfferings (Maybe RIProductDescription)
drioProductDescription = lens _drioProductDescription (\ s a -> s{_drioProductDescription = a});

-- | Include Marketplace offerings in the response.
drioIncludeMarketplace :: Lens' DescribeReservedInstancesOfferings (Maybe Bool)
drioIncludeMarketplace = lens _drioIncludeMarketplace (\ s a -> s{_drioIncludeMarketplace = a});

-- | One or more filters.
--
-- -   @availability-zone@ - The Availability Zone where the Reserved
--     Instance can be used.
--
-- -   @duration@ - The duration of the Reserved Instance (for example, one
--     year or three years), in seconds (@31536000@ | @94608000@).
--
-- -   @fixed-price@ - The purchase price of the Reserved Instance (for
--     example, 9800.0).
--
-- -   @instance-type@ - The instance type on which the Reserved Instance
--     can be used.
--
-- -   @marketplace@ - Set to @true@ to show only Reserved Instance
--     Marketplace offerings. When this filter is not used, which is the
--     default behavior, all offerings from AWS and Reserved Instance
--     Marketplace are listed.
--
-- -   @product-description@ - The Reserved Instance product platform
--     description. Instances that include @(Amazon VPC)@ in the product
--     platform description will only be displayed to EC2-Classic account
--     holders and are for use with Amazon VPC. (@Linux\/UNIX@ |
--     @Linux\/UNIX (Amazon VPC)@ | @SUSE Linux@ |
--     @SUSE Linux (Amazon VPC)@ | @Red Hat Enterprise Linux@ |
--     @Red Hat Enterprise Linux (Amazon VPC)@ | @Windows@ |
--     @Windows (Amazon VPC)@) | @Windows with SQL Server Standard@ |
--     @Windows with SQL Server Standard (Amazon VPC)@ |
--     @Windows with SQL Server Web@ |
--     @ Windows with SQL Server Web (Amazon VPC))@
--
-- -   @reserved-instances-offering-id@ - The Reserved Instances offering
--     ID.
--
-- -   @usage-price@ - The usage price of the Reserved Instance, per hour
--     (for example, 0.84).
--
drioFilters :: Lens' DescribeReservedInstancesOfferings [Filter]
drioFilters = lens _drioFilters (\ s a -> s{_drioFilters = a}) . _Default;

-- | The instance type on which the Reserved Instance can be used. For more
-- information, see
-- <http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html Instance Types>
-- in the /Amazon Elastic Compute Cloud User Guide/.
drioInstanceType :: Lens' DescribeReservedInstancesOfferings (Maybe InstanceType)
drioInstanceType = lens _drioInstanceType (\ s a -> s{_drioInstanceType = a});

-- | The token to retrieve the next page of results.
drioNextToken :: Lens' DescribeReservedInstancesOfferings (Maybe Text)
drioNextToken = lens _drioNextToken (\ s a -> s{_drioNextToken = a});

-- | The minimum duration (in seconds) to filter when searching for
-- offerings.
--
-- Default: 2592000 (1 month)
drioMinDuration :: Lens' DescribeReservedInstancesOfferings (Maybe Integer)
drioMinDuration = lens _drioMinDuration (\ s a -> s{_drioMinDuration = a});

-- | The Availability Zone in which the Reserved Instance can be used.
drioAvailabilityZone :: Lens' DescribeReservedInstancesOfferings (Maybe Text)
drioAvailabilityZone = lens _drioAvailabilityZone (\ s a -> s{_drioAvailabilityZone = a});

-- | The Reserved Instance offering type. If you are using tools that predate
-- the 2011-11-01 API version, you only have access to the
-- @Medium Utilization@ Reserved Instance offering type.
drioOfferingType :: Lens' DescribeReservedInstancesOfferings (Maybe OfferingTypeValues)
drioOfferingType = lens _drioOfferingType (\ s a -> s{_drioOfferingType = a});

-- | One or more Reserved Instances offering IDs.
drioReservedInstancesOfferingIds :: Lens' DescribeReservedInstancesOfferings [Text]
drioReservedInstancesOfferingIds = lens _drioReservedInstancesOfferingIds (\ s a -> s{_drioReservedInstancesOfferingIds = a}) . _Default;

-- | The tenancy of the Reserved Instance offering. A Reserved Instance with
-- @dedicated@ tenancy runs on single-tenant hardware and can only be
-- launched within a VPC.
--
-- Default: @default@
drioInstanceTenancy :: Lens' DescribeReservedInstancesOfferings (Maybe Tenancy)
drioInstanceTenancy = lens _drioInstanceTenancy (\ s a -> s{_drioInstanceTenancy = a});

-- | Checks whether you have the required permissions for the action, without
-- actually making the request, and provides an error response. If you have
-- the required permissions, the error response is @DryRunOperation@.
-- Otherwise, it is @UnauthorizedOperation@.
drioDryRun :: Lens' DescribeReservedInstancesOfferings (Maybe Bool)
drioDryRun = lens _drioDryRun (\ s a -> s{_drioDryRun = a});

-- | The maximum number of results to return for the request in a single
-- page. The remaining results of the initial request can be seen by
-- sending another request with the returned @NextToken@ value. The maximum
-- is 100.
--
-- Default: 100
drioMaxResults :: Lens' DescribeReservedInstancesOfferings (Maybe Int)
drioMaxResults = lens _drioMaxResults (\ s a -> s{_drioMaxResults = a});

-- | The maximum number of instances to filter when searching for offerings.
--
-- Default: 20
drioMaxInstanceCount :: Lens' DescribeReservedInstancesOfferings (Maybe Int)
drioMaxInstanceCount = lens _drioMaxInstanceCount (\ s a -> s{_drioMaxInstanceCount = a});

instance AWSPager DescribeReservedInstancesOfferings
         where
        page rq rs
          | stop (rs ^. driorNextToken) = Nothing
          | stop (rs ^. driorReservedInstancesOfferings) =
            Nothing
          | otherwise =
            Just $ rq & drioNextToken .~ rs ^. driorNextToken

instance AWSRequest
         DescribeReservedInstancesOfferings where
        type Sv DescribeReservedInstancesOfferings = EC2
        type Rs DescribeReservedInstancesOfferings =
             DescribeReservedInstancesOfferingsResponse
        request = post
        response
          = receiveXML
              (\ s h x ->
                 DescribeReservedInstancesOfferingsResponse' <$>
                   (x .@? "nextToken") <*>
                     (may (parseXMLList "item") x))

instance ToHeaders DescribeReservedInstancesOfferings
         where
        toHeaders = const mempty

instance ToPath DescribeReservedInstancesOfferings
         where
        toPath = const "/"

instance ToQuery DescribeReservedInstancesOfferings
         where
        toQuery DescribeReservedInstancesOfferings'{..}
          = mconcat
              ["Action" =:
                 ("DescribeReservedInstancesOfferings" :: ByteString),
               "Version" =: ("2015-04-15" :: ByteString),
               "MaxDuration" =: _drioMaxDuration,
               "ProductDescription" =: _drioProductDescription,
               "IncludeMarketplace" =: _drioIncludeMarketplace,
               toQuery (toQueryList "Filter" <$> _drioFilters),
               "InstanceType" =: _drioInstanceType,
               "NextToken" =: _drioNextToken,
               "MinDuration" =: _drioMinDuration,
               "AvailabilityZone" =: _drioAvailabilityZone,
               "OfferingType" =: _drioOfferingType,
               toQuery
                 (toQueryList "ReservedInstancesOfferingId" <$>
                    _drioReservedInstancesOfferingIds),
               "InstanceTenancy" =: _drioInstanceTenancy,
               "DryRun" =: _drioDryRun,
               "MaxResults" =: _drioMaxResults,
               "MaxInstanceCount" =: _drioMaxInstanceCount]

-- | /See:/ 'describeReservedInstancesOfferingsResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'driorNextToken'
--
-- * 'driorReservedInstancesOfferings'
data DescribeReservedInstancesOfferingsResponse = DescribeReservedInstancesOfferingsResponse'{_driorNextToken :: Maybe Text, _driorReservedInstancesOfferings :: Maybe [ReservedInstancesOffering]} deriving (Eq, Read, Show)

-- | 'DescribeReservedInstancesOfferingsResponse' smart constructor.
describeReservedInstancesOfferingsResponse :: DescribeReservedInstancesOfferingsResponse
describeReservedInstancesOfferingsResponse = DescribeReservedInstancesOfferingsResponse'{_driorNextToken = Nothing, _driorReservedInstancesOfferings = Nothing};

-- | The token to use to retrieve the next page of results. This value is
-- @null@ when there are no more results to return.
driorNextToken :: Lens' DescribeReservedInstancesOfferingsResponse (Maybe Text)
driorNextToken = lens _driorNextToken (\ s a -> s{_driorNextToken = a});

-- | A list of Reserved Instances offerings.
driorReservedInstancesOfferings :: Lens' DescribeReservedInstancesOfferingsResponse [ReservedInstancesOffering]
driorReservedInstancesOfferings = lens _driorReservedInstancesOfferings (\ s a -> s{_driorReservedInstancesOfferings = a}) . _Default;
