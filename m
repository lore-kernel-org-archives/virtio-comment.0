Return-Path: <virtio-comment-return-6906-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CCAC04FE0
	for <virtio-comment@archiver.kernel.org>; Thu, 27 Jul 2023 10:20:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 863151922E5
	for <virtio-comment@archiver.kernel.org>; Thu, 27 Jul 2023 10:20:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5F2EA9866CD
	for <virtio-comment@archiver.kernel.org>; Thu, 27 Jul 2023 10:20:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4B5849866C5; Thu, 27 Jul 2023 10:20:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 375BC9866C6
	for <virtio-comment@lists.oasis-open.org>; Thu, 27 Jul 2023 10:20:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1690453253.507000
X-TM-MAIL-UUID: 4ccb8cab-fa31-49e1-949d-db2ab5d34ee0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MsFHroRUjsLDpEaR90i6EN4Dp+2uMf12CHftSaY31m9n+l74QJCaY69lMMsBqUjrxwpevahunVf5CsQp7v6aTYnGjadUwmKp68IGZiFEuFeIgT3eigkZ/Tald7jtjBQlFRm+JT9saD3vd3XdnWfvw/QaRV8M6v7/JYejM198J+ovhT3Kolp4iSvvpSYmYpLI2nt2Q8In5qvzkfaxvZjqno9Unbl2JhFeUXLB7MjinhtRhc1E/iBJpGzcfmcffOELiV+qZotQYDY9VAjoa9xMn+wR93GNBZpbw5Fa5mkzQpaltu5cXWtGHe5Zt0WmLu7TQ5KNuaorJpQiWIBvH8+woQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJo+de6uBHIF8ymBYxI58qigPIIXWyE/ylIXmAePtBw=;
 b=QMDTIrK3LnJmb03oi4whFPtSCJXMVJyceyFHkOPGwzl4wQ0Q/GyHILKfUvgpWM2umJyt8tkgOMMQC765350VziO1rxRnDkHBHYBhHx9u1OES+IFgHNAelyG8WiCWeZbrDe4U9JYEZvBUiMkNBC2ctMzbNuchehEiLCzYE1kuLI+AV30BAg27nSwzUT6MaUl65TN+Xms515DwMhW0D//oWgnOkFMkuUJC9zdseC9pfTIUiN10cBV8kNw/rMkQoeTdCvMGtwOE1Daos2fIpxleOIbNDTw/pm7DZR+5F3FXWMv05VmdkMAWYN/NAzb4p4Ou1UQ9Crj4A6POz6ICq9OBvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <fb5b1603-68eb-3301-9e5c-6bb81e9bc594@opensynergy.com>
Date: Thu, 27 Jul 2023 12:20:51 +0200
From: Peter Hilber <peter.hilber@opensynergy.com>
To: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: Cornelia Huck <cohuck@redhat.com>
References: <20230630092959.392381-1-peter.hilber@opensynergy.com>
 <PH0PR12MB548182C0D5EB0C6273F30E9CDC28A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <PH0PR12MB548182C0D5EB0C6273F30E9CDC28A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::10) To BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:77::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB3267:EE_|FR3P281MB2800:EE_
X-MS-Office365-Filtering-Correlation-Id: 47f568ee-bbf0-4d14-0a60-08db8e8b279c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9RsqOxCiBSQbvs5eSx6zDHwIUkcpHLJTRaZRaooQb/+ULimGQ+ly9NAQ7wZ6X4UpAGvDxPM/Dg6OC+jBPb7ORxsUEYja6iiJFWqpRDAXmd9n9Csi6dUyzTm7kBu0qh8XDtKsqEwjEOQALlgt4UUyQRY50RBpZAXJrZFfaVXofuklD/Rhh3vePUI4B261OFQx4GJ6ElkeqbFte52+2XkxnClvKHMsE88NXwY1nY8+xuwkiuIs4TzkZjWRmx+GmIJoxw9xVHMBBiawaShAXtc4du91T8EqL1tCIGa0ReU/kz6D7Lqx5tQP/cUdwGw6Li/sT6gJYOLN64aP7CnmBGfoYjM47JSJVpcSux1548vYifvSYSNMXUPY/nOguyJareYUxz50zlT8ZOEDWy+/bida5aeztXr142fCQ+g0xZUIQmWxMoh9Vmn2fBrH/0WTIuDpvut6/LLjAaROaRJvJySSBgucwfdTHPVOWxGegWZswTHQGFtHqR+06E4fS518VLTA/MNv6GbF9sqY0J/+xUlB2U+jtXXn2a3ZGhZSGOuY4B9B5mvogiK0mM//qBmtzSBrc4k0cj2Hg68dalYfkTihClx+Yi40VdPYm46gP+BkJ1j1EoKzS0rwmnpjp0q5qNzwDhUyLT/jPb7AZQ+WHbgp/g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(396003)(39840400004)(376002)(136003)(346002)(366004)(451199021)(66899021)(316002)(42186006)(966005)(110136005)(38100700002)(66946007)(66556008)(66476007)(4326008)(478600001)(83380400001)(2616005)(44832011)(30864003)(31696002)(36756003)(2906002)(31686004)(86362001)(41300700001)(53546011)(186003)(8936002)(5660300002)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXZQc0c1YTNMYlFOVmRQZTZNS3RGMkxLWkFKcTQ3NXYvNjBRREhVRGExdE9V?=
 =?utf-8?B?R1hBTURsUk1VMVIwQ1crbytOMTBkUzYvYWJQNHowS2RyVEFCQUlNTFliQkpJ?=
 =?utf-8?B?U25YTmtTSC9RNlA3M3lTaFVIeWRHVEoxbk92ZURFcG1SK2VYSHJYVWwrNzJO?=
 =?utf-8?B?THo4SVQranEwTEEvQkRwTWRoTU5UcVQ3Y1U2NWQ4Z0lIeW0yVjQvdWF4alJu?=
 =?utf-8?B?N0p4NWErTlNGZGtEeG5OWlRkQXRwTnp1MEtPZHBsUVRsTDlHbE15NDZ4VWZ4?=
 =?utf-8?B?bmJoYW41OGpIWHhZZEc1c3E3NW8rVDNSaDlweVF4MkF6a09HeFUxR0NBUWdU?=
 =?utf-8?B?VmcvOW1DMjNKNkd4b2VsdmszeTVUbTl5RzV5anBpWWphRlR3ekcvNFB2RHBG?=
 =?utf-8?B?L05iT3p6cU94N3NuZWpqb3hiaG5kT09VTDJkTXgwaFNrQlFFSE1NOWtNZTRn?=
 =?utf-8?B?dGJocFl6eE9SUlhVRTdqSVZUT3o1Z0NSYm1CUXh6ekNWQ3NUalZNNGpMWmdN?=
 =?utf-8?B?N0N6WWRzTG1md0NleFVRZTVzSEhKSGZ3S2NvMkpDdytOcHlPaVpwV3NBY1lj?=
 =?utf-8?B?ZmZ2a1AybjVGbjk4ejR4WGY1TTcwQU95TE9tYitYR2lKSkdZaXBCWmlMajM1?=
 =?utf-8?B?STA0SVV3WFMwZHpjbStnNjVIbWl2RWZ0cnFjVHR0NmV5MzRoUkkvOVRSR285?=
 =?utf-8?B?RlZ3TmtkYVZLWmtIZkdrQmo4cnNrN2dRY1djMjNwNVR5Nk9mTlJ5eEN3UTFN?=
 =?utf-8?B?NC9CZS9xYlI1VlhNUVhUcU9kRnF0aUtNdVNUeWcwMS9xaE1USUlDbUxPNXk2?=
 =?utf-8?B?dEd4L01DYUdoR0JiczFHMWVycWF1TUN1eGxUQm94NXlCUmVHU2pCRTlFRXZW?=
 =?utf-8?B?Mm93THRyWU5yd2hVZ3hFVG9sZUQwblZXTmt5cUlhbWxaUlgraWtFb3NXR3la?=
 =?utf-8?B?RDZlZDhaS1VDL2ZBWFZObWFsNXZmQ05nOGoxV2o4QzdsZ0pEN2FFZVZ3eEV2?=
 =?utf-8?B?OEtDK2h4SjhMU242WUVMTVpEL29uTHgzcEhvRjJKdTh2dlRVeE85RllFSXA4?=
 =?utf-8?B?QnJ5bnltcTBaNmZCRkRIQUtOclpKYkJ3bzF2RDNJQzNOYUlORlVrcXppNXE2?=
 =?utf-8?B?Ykt5emlpaWFFV2Q0dC8vcStFbFFab2IvNHEzVTdXaGMwY3JHbkUvQXkwSUhX?=
 =?utf-8?B?RUVlSGk4MXRVcFJmSzlXL1VFa09HNy91QXFqTUpJOHpDS20rejV3eFF0NXpY?=
 =?utf-8?B?Ni9kM2VMUzNiSW9LNk5oWmxGSDlaVjJEMFVFSzVsZWtxNzR4TDZRVkNhOVlF?=
 =?utf-8?B?NDdnRWNMRnVrZzRQOEIycjNJa2FURzZsWktsWlJVOE5xeGNFQURTZUE0c3NZ?=
 =?utf-8?B?bGc3RmVyU3BnVEFpWm0yVUdHaHNuNlpHcjdydVNBWTFoa3BFaW1YMktUb1FR?=
 =?utf-8?B?Q1FyakdLUmpHSlFMZ3JrNG0vcGJPYkNuTkkzYmM4cUR4R0tCQkN3eDc4QnYx?=
 =?utf-8?B?ZGoyQW5hY0lDQm1LRVlUR3dxWFh2RlVYYldtbDV0M05td3RHcE1HdG5HWG10?=
 =?utf-8?B?cWlud3lPWVVzUERVc3JxQ2IxRlY1TGlxV0FHSUlxQkozM05WUHBJY2VaRS9M?=
 =?utf-8?B?dDRCQVB4eVhZM3ZuT240QXJkM29BMjZJa0F3RlZXZFAvMzM4b0VFdTNNdFlv?=
 =?utf-8?B?MTVTQmlEOURFMXJXOHdGbk9mSWF2bTEyNDRLWXVKdE1scWNGTWFZbXltb0JB?=
 =?utf-8?B?SlN0SjBLUHJhMFJjeTM0cWEvVk9aMHBvZngyUkNiR1lPOFdFWGc2ZTdleEZn?=
 =?utf-8?B?ZGdiYkhCZjFQU0pGYW9PYm5RVmxXMVNKUjJ0WTJYYjM2YTN5WDBROU14QmhJ?=
 =?utf-8?B?NUxmNCtRUmxRVllkekFZMmo1ejl5M0JMb3BKMERaM2c0NDNTY3dSQUVoeEZB?=
 =?utf-8?B?OFhiblRZbnFFa3U4VlEwaEM4eStpenhwcHAvZ1Z1ZWR6RWVqYWxmWlBadk9x?=
 =?utf-8?B?OVNQdC9NRE4vSVlvOU1xWmRMY2lManhoaVBPTWJPY0RRcTlVbVd3Z25lK0x3?=
 =?utf-8?B?cW9jbFJ0VFVuTmxJcTAxWlFmaVFXSjFYLy9heER4SXd3bHpUOW81YjhDWnNW?=
 =?utf-8?B?UzlYelNRVmJkVEFKek81TEdOWTI5OUp5bVJOTTlOcEZiV2orUFpuc3VTTkFP?=
 =?utf-8?Q?rU6KtWn2VOxStxY1ogTxRYjZub6SeXgei4SXY0NS/aDq?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f568ee-bbf0-4d14-0a60-08db8e8b279c
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 10:20:52.0268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: slL4MWLByklIdmBtNw8SxRKoRBo9oIwSlB/19eBuxUcMEj0SiPqYH3nrsXQ+gU/x1wZPwFf+BcbjnuUFJCw5Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR3P281MB2800
X-TM-AS-ERS: 104.47.7.177-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1011-27776.006
X-TMASE-Result: 10--25.646400-4.000000
X-TMASE-MatchedRID: CxmI61mtwh/5ETspAEX/non73EnA6dC3lR7tN56aWVW0sdSrJZyyxnN+
	oMXXTg4qHs+LxydrDnwBg4pi3MQGEWychE78+cDjJw66cQh/R5cV3uDFy4oesxAHN0sLDuYLKI8
	QDSbZHI6RAB+NQSYtpsATnk4C5Azs69iKMPiKY6iIv5GuVax7Ci9IP1fgA+UR/rXgb7V0sfi2rF
	0xZKBGACrha3Sivu57uFRwx9+8KhX8Bvg/Sl/2bsd/DBuOH9035f2pKgY/c0347z396n+RZ4k+e
	k903bmdyj7Kfv7gVp2eK9NjWO6bCe+Pn4Bx3NWrWdpm2XfIKrRIZTXFTJArQb5KsAA4smeh+EEG
	PrFIK0k0l64aptIzV2X5zpXiaXtsilJt0oyJjCSl9dIZeMWVBUTk5t0wP15pXZMxJiipxyB+rw+
	0vyDwttwPuZ9Ncjp0vvbSrHwv4Hh25gwQjaRjmqwODSO9Fuc1R2Jlse8FMPNJhy7whT27B1ER2T
	PZDZz6fxwUkusYn/VhPYd/90Z50DOmR1NAss4szxHg3Mb1A4yjiIJqRFExTWJZehP8D8gvqy/Du
	JdPidz4XQdu6FUs0783LUmCBdvddXYpcDl2V51GDXkz8A7djxdZNq3uNiINWQMS6lqffg+x6jen
	jaJCscZ03+9lPPbudYQwcXxyVGrQeuPfe8Fue20ZWzHyRJUFltO3ZXPfoUU4TC8mD5QZb93hEU9
	VISbAszHeXJep1exI8JkER1uOTbMEYD96cDISwXAJJH2UsYiz3QJZlI1HSGViSYlZCCBC4frHqL
	rd8S9BpgtUrbrRRMpzRggdE9XM7L7aq/KLvGvFTQGAKRxj5No+48giqZwnEgg3cwDHl/1qdlV1L
	mbEfAP5R/zL3aImJpK4F9wnIiaQZS2ujCtcuA==
X-TMASE-XGENCLOUD: 61a4ba3b-896a-4fd4-b8ac-a45e0ed03dfc-0-0-200-0
X-TM-Deliver-Signature: 2D3D4B4064A335B32C1D200AD15E83F5
X-TM-Addin-Auth: myylhLZ9LJqCch+9Ej9smGDLfb7Lsn2EUANBQ4i0gJ/IhBXc9kTDkL1Lx59
	Q3LYPFPXOUm/xvvGAVaDMRz1llKe9a/5zjJjPygSYNzzevBoAKc0yMboe1rV9GXDZcY/igfiD6W
	BDuzoncUf3SqsO7z/HeWtpY5JbUxUw6LyhFwXpNPW0VJcQaDVR2YKeQHkC+0KlqFZdZL911YF/r
	HzB7f0wAOI8pCbxcGVOzqkB0rmmI7NrjXyskqFJTewSGtrLy7nvAZa0UWC2ihZzi2FiMHHpKQaF
	+rIUkz2Ag9BOZLw=.bBrSUdYDP71rC1YY+av26dAk9iRl5EYE23GMZn8Jgs0P74goGSXVZjrH9Z
	dIFSrEfnfBTQ+tYrpLdGw0EvoV6Fa/zrkm0zfSGF5sWPId6uFzwKQD/AhlafX5KlTxnVN9kAPUo
	z9oN8rF8SqoMMSMQO4aWrkvMK0C5XFEd3WWIwYyuSllK7i8gBvccVJ0AW/jBy6cmXE2IOn0EDx1
	8Yx2UGqpoIftvpvEpPFcDc9LNQNDbXVfl+Qd65NLKJNJv64bjCzv+B6ANg4pmGt8N/vuu+xHzz0
	vjFlAGBCMYqxx6FSHKJjSrT914vNvdG0AZI/cYx9VL0s55UAgEgXL6I2Rfw==
X-TM-Addin-ProductCode: EMS
Subject: Re: [virtio-comment] [RFC PATCH v2] virtio-rtc: Add device
 specification.

On 03.07.23 00:55, Parav Pandit wrote:
>> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
>> open.org> On Behalf Of Peter Hilber
>> Sent: Friday, June 30, 2023 5:30 AM
>> Subject: [virtio-comment] [RFC PATCH v2] virtio-rtc: Add device specification.
>>
> Tiny nit: remove full stop from the subject, it usually does not have it.
>  

OK.

>> This is a partial draft for a Real-Time Clock (RTC) device. The virtio-rtc device
>> provides information about current time through one or more clocks.
>>
>> v2 is a minor update which should match the Linux kernel driver patch series to
>> be posted soon. It is planned to add a timer/alarm feature as part of a later draft
>> spec update.
>>
>> The draft uses the "Timer/Clock" device id which is already part of the
>> specification. This device id was registered a long time ago and should be
>> unused according to the author's information. The name "RTC" was determined
>> to be the best for a device which focuses on current time, but is up to
>> discussion.
>>
>> For this device, there is a prototypical Linux kernel driver for which upstreaming
>> is planned, and a proprietary device implementation.
>>
>> In the spec text, there is some redundancy between the informative and the
>> normative text. The intent is that the informative text already gives all the
>> essential information about the device.
>>
>> In the spec, clock ids are 64 bit wide to have unique ids when supporting clock
> It is unclear the namespace of uniqueness.
> Do you mean unique id across multiple virtio devices?

The idea was not to have a unique id across multiple virtio devices.
Rather, the idea was to simplify lifetime management for clocks in a
single virtio device (if such lifetimes would be introduced in the
future) by not having to worry about race conditions due to clock id
reuse. 

> If so, how is it proposed, we probably need UUID?
> 

So it would be up to the device implementation to assign unique ids for
each clock lifetime; incrementing a counter should do.

>> hot-plugging in the future.
>>
>> Any feedback is appreciated very much.
>>
> This is a good feature.
> 
> A network device has a PHC which is very similar to what is being proposed here which is super set of this proposal.
> 
> A network device will support packet timestamping as phase-1, followed by PTP synchronized UTC/TAI format in phase-2 followed by PTP timestamping offload in phase-3.
> Phase-1 is already being proposed using monotonic clock method at [1].
> 
> [1] https://lists.oasis-open.org/archives/virtio-comment/202306/msg00287.html
> 
> We would like to have a single virtio network device to expose the optional RTC without creating a full blown new virtio device.
> 
> A quick grep in the industry indicates that at least 15+ nics in industry with dual PTP clock + nic functionality.
> And we would like virtio network device also to have it.
> At minimum such solution avoids creating an additional full blown virtio device.
> 
> As proposed here, RTC device as stand alone itself has its merit and use.
> 
> So lets build the RTC device interface that can be of dual use.
> 1. as part of stand alone RTC device
> 2. as part of virtio network device
> 

To me it seems preferable to first try to keep the two devices
separated. AFAIU PTP clocks are also usually represented as a device
separate from network devices.

The extra effort to implement another simple virtio device (rather than
putting everything in a single device) seems to be small when compared
to the complexity of creating an extensible specification which should
work both standalone and as part of an already existing, but still
growing, device. E.g., the RTC device should also get an alarm, with an
associated eventq, in the future. Also, I wonder if the driver
implementation should then work both as a standalone Virtio driver and
as part of the net driver.

Maybe the above use case could also be addressed by a standalone RTC
device as follows: 

1) The net device exports a UUID object to which the RTC device can
refer to (so the drivers can link the net device to the RTC clock).

2) If needed, the RTC device aligns the lifetime of the clock to the net
device. Then, clock lifetimes are no longer static, and can be aligned
with the net device. Through an eventq (to be added), the RTC device
announces clock creation/destruction, which can be synchronized to the
net device state.

> Such work will enable to re-invent the wheel 2nd time in virtio net.
> 
> What I can think of is following definitions being common between two device types.
> This will be able to leverage your rtc work done as part of this patchset.
> 
> 1. _F feature bit that can be common between the rtc and net device
> 2. control vq command opcode and format be common
> 3. discovery of the readq id possibly using cvq and it must depend on _F_RESET bit.
> 

Not sure what _F_RESET refers to, is it VIRTIO_F_RING_RESET? And why?

>> --- /dev/null
>> +++ b/device-types/rtc/description.tex
>> @@ -0,0 +1,582 @@
>> +\section{RTC Device}\label{sec:Device Types / RTC Device}
>> +
>> +The RTC (Real Time Clock) device provides information about current
>> +time. The device can provide different clocks, e.g.\ for the UTC or TAI
>> +time standards, or for physical time elapsed since some past epoch.
>> +Drivers can read the clocks with simple or more accurate methods.
>> +
> The driver can read...
> 

I assume this is a proposal to rephrase, I can change it like this.

> I am not sure if I see two different methods to read (simple and accurate one).
> Is if the readq that is accurate one?
> 

The readq is the only vqueue through which the clock can be read,
through VIRTIO_RTC_M_READ (imprecise) and VIRTIO_RTC_M_READ_CROSS
(allows for precise reading).

>> +\subsection{Device ID}\label{sec:Device Types / RTC Device / Device ID}
>> +
>> +17
>> +
>> +\subsection{Virtqueues}\label{sec:Device Types / RTC Device /
>> +Virtqueues}
>> +
>> +\begin{description}
>> +\item[0] readq
>> +\item[1] controlq
>> +\end{description}
>> +
>> +The driver initiates clock readings through requests to the
>> +readq.
> The driver initiates (or enqueues) clock reading requests to the readq.
> Does above read better?
> 

If this sounds better, I could rephrase to "The driver enqueues clock
reading requests to the readq."

> \footnote{The readq is a dedicated virtqueue to facilitate
>> +reducing latency for clock readings, which may be more
>> +performance-sensitive than other requests.} The driver uses the
>> +controlq for other requests to the device.
>> +
>> +\subsection{Feature bits}\label{sec:Device Types / RTC Device / Feature
>> +bits}
>> +
>> +\begin{description}
>> +\item[VIRTIO_RTC_F_READ_CROSS (0)] Device supports cross-timestamping.
>> +\end{description}
>> +
>> +VIRTIO_RTC_F_READ_CROSS determines whether the device supports clock
>> +reading with cross-timestamping. Without this feature, the device does
>> +not support cross-timestamping. Even when this feature was negotiated,
>> +the device may still not support cross-timestamping for some clocks, or
>> +for particular requests.
>> +
> Can you please explain why even after feature negotiation, device may still not support?
> Is it because the cross timestamping is per clock feature?

Actually, the cross-timestamping support can be specific to the
combination of clock and hardware counter. This is explained in more
detail in the context of VIRTIO_RTC_M_READ_CROSS. I will mention this
here as well.

> If so, I guess no need of a feature bit as it is not serving any meaningful purpose.

The only purpose is to potentially save the device some initialization
work or resources in case the feature is not negotiated.

> Each clock information can advertise what is supports, right?
> 

The driver can use VIRTIO_RTC_M_CROSS_CAP to inquire about this (or the
driver could also just try if VIRTIO_RTC_M_READ_CROSS works).

>> +\devicenormative{\subsubsection}{Feature bits}{Device Types / RTC
>> +Device / Feature bits}
>> +
>> +The device SHOULD offer VIRTIO_RTC_F_READ_CROSS if the device can
>> +support cross-timestamping for any of its clocks.
>> +
>> +\subsection{Device configuration layout}\label{sec:Device Types / RTC
>> +Device / Device configuration layout}
>> +
>> +There is no configuration data for the device.
>> +
>> +\subsection{Device Initialization}\label{sec:Device Types / RTC Device
>> +/ Device Initialization}
>> +
>> +The device determines the set of clocks. The device can provide zero or
>> +more clocks.
>> +
>> +\subsection{Device Operation}\label{sec:Device Types / RTC Device /
>> +Device Operation}
>> +
>> +For the readq and the controlq, the driver sends a message with a
>> +request, and receives the response in the device-writable part of the
>> +message. readq and controlq messages use common request and response
>> +headers.
>> +
> Below structure definition is _req and response.
> So lets just call it request and request_type as its simple to explain using single thing.
> Please drop the wording around message.
> 

OK.

>> +\begin{lstlisting}
>> +/* common request header */
>> +struct virtio_rtc_req_head {
>> +	__le16 msg_type;
>> +	__u8 reserved[2];
>> +};
>> +
>> +/* common response header */
>> +struct virtio_rtc_resp_head {
>> +	__u8 status;
>> +	__u8 reserved[3];
>> +};
>> +\end{lstlisting}
>> +
>> +The \field{msg_type} field identifies the message type.
>> +
>> +The \field{status} field indicates whether the device successfully
>> +executed the request. The device sets the \field{status} field to one
>> +of the following values:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_RTC_S_OK 0
>> +#define VIRTIO_RTC_S_UNSUPP 1
>> +#define VIRTIO_RTC_S_NODEV 2
>> +#define VIRTIO_RTC_S_INVAL 3
>> +#define VIRTIO_RTC_S_DEVERR 4
>> +\end{lstlisting}
>> +
> Recently for the AQ we picked Linux UAPI specific error codes such as EAGAIN, EINVAL etc.
> You might want to have similar code reused for EINVAL, NOTSUPPORT, NODEV to be reused here.
> No strong opinion though.

I think I will change as suggested.

> 
> [..]
> When the device and driver normative lines are long like this, it is best to put in separate patch, so that its easy to read (review) through the whole description and conformance as separate.
> 

I will separate non-normative and normative parts in the next iteration.

>> +\item[VIRTIO_RTC_M_CFG] discovers the number of clocks.
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_RTC_M_CFG 0x1000 /* message type */
>> +
> Like above, lets just call it RTC_REQ_CFG as below is a request structure.
> 

OK.

>> +struct virtio_rtc_req_cfg {
>> +	struct virtio_rtc_req_head head;
>> +	/* no request params */
>> +	__u8 reserved[4];
>> +};
>> +
>> +struct virtio_rtc_resp_cfg {
>> +	struct virtio_rtc_resp_head head;
>> +	__le16 num_clocks;
>> +	__u8 reserved[10];
>> +};
>> +\end{lstlisting}
>> +
>> +Field \field{num_clocks} contains the number of clocks. A device
>> +provides zero or more clocks. Valid clock ids are those smaller than
>> +\field{num_clocks}.
>> +
>> +\item[VIRTIO_RTC_M_CLOCK_CAP] discovers the capabilities of the clock
>> +identified by the \field{clock_id} field.
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_RTC_M_CLOCK_CAP 0x1001 /* message type */
>> +
>> +struct virtio_rtc_req_clock_cap {
>> +	struct virtio_rtc_req_head head;
>> +	__u8 reserved[4];
>> +	__le64 clock_id;
>> +};
> Please drop "__" from the field data type definition.
> 

I will fix this.

>> +
>> +struct virtio_rtc_resp_clock_cap {
>> +	struct virtio_rtc_resp_head head;
>> +	__le16 type;
>> +	__u8 reserved[10];
>> +};
>> +\end{lstlisting}
>> +
>> +The \field{type} field identifies the clock type. A device provides
>> +zero or more clocks for a clock type. The following clock types are
>> +defined:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_RTC_CLOCK_UTC 0
>> +#define VIRTIO_RTC_CLOCK_TAI 1
>> +#define VIRTIO_RTC_CLOCK_MONO 2
>> +\end{lstlisting}
>> +
>> +VIRTIO_RTC_CLOCK_UTC uses the UTC (Coordinated Universal Time) time
>> +standard. The device uses the time epoch of January 1, 1970, 00:00 UTC.
>> +This is the same epoch as \emph{Unix time}.
>> +
>> +VIRTIO_RTC_CLOCK_TAI uses the TAI (International Atomic Time) time
>> +standard. The device uses the time epoch of January 1, 1970, 00:00 TAI.
>> +
>> +VIRTIO_RTC_CLOCK_MONO uses monotonic physical time (SI seconds
>> +subdivisions) since some unspecified epoch. The VIRTIO_RTC_CLOCK_MONO
>> +epoch is before or during device reset.
>> +
>> +Additional clock types may be standardized in the future.
>> +Implementation-specific clock type definitions are not recommended and
>> +use a clock type id greater than or equal to 0xF000.
>> +
>> +\item[VIRTIO_RTC_M_CROSS_CAP] discovers whether the device supports
>> +cross-timestamping for a particular pair of clock and hardware counter.
>> +If the VIRTIO_RTC_F_READ_CROSS feature has been negotiated, the driver
>> +can send the VIRTIO_RTC_M_CROSS_CAP message.
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_RTC_M_CROSS_CAP 0x1002 /* message type */
>> +
>> +struct virtio_rtc_req_cross_cap {
>> +	struct virtio_rtc_req_head head;
>> +	__le16 hw_counter;
>> +	__u8 reserved[2];
>> +	__le64 clock_id;
>> +};
>> +
>> +#define VIRTIO_RTC_FLAG_CROSS_CAP 0
>> +
>> +struct virtio_rtc_resp_cross_cap {
>> +	struct virtio_rtc_resp_head head;
>> +	__u8 flags;
>> +	__u8 reserved[11];
>> +};
>> +\end{lstlisting}
>> +
>> +The \field{clock_id} field identifies the clock, and the
>> +\field{hw_counter} field identifies the hardware counter, for which
>> +cross-timestamp support is probed. The device sets bit
>> +\field{VIRTIO_RTC_FLAG_CROSS_CAP} in the \field{flags} field if the
>> +clock supports cross-timestamping for the particular clock and hardware
>> +counter, and clears the bit otherwise.
>> +
>> +\end{description}
>> +
>> +\devicenormative{\paragraph}{controlq Operation}{Device Types / RTC
>> +Device / Device Operation / controlq Operation}
>> +
>> +For a fixed controlq message request value V, the device SHOULD either,
>> +for every request with value V, always execute successfully, or, for
>> +every request with value V, always set a fixed \field{status} other
>> +than VIRTIO_RTC_S_OK.
>> +
>> +For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST use the UTC
>> +time standard (Coordinated Universal Time).
>> +
>> +For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST use the
>> +time epoch of January 1, 1970, 00:00 UTC.
>> +
>> +For any clock of type VIRTIO_RTC_CLOCK_TAI, the device MUST use the TAI
>> +time standard (International Atomic Time).
>> +
>> +For any clock of type VIRTIO_RTC_CLOCK_TAI, the device MUST use the
>> +time epoch of January 1, 1970, 00:00 TAI.
>> +
>> +For any clock of type VIRTIO_RTC_CLOCK_MONO, the device MUST use SI
>> +seconds subdivisions.
>> +
>> +For any clock of type VIRTIO_RTC_CLOCK_MONO, the device MUST use an
>> +epoch at a time instant before or during device reset.
>> +
>> +For message VIRTIO_RTC_M_CLOCK_CAP, the device MUST set \field{type} to
>> +one of the clock types defined in this specification, or to a value
>> +greater than or equal to 0xF000.
>> +
>> +For a VIRTIO_RTC_M_CROSS_CAP message M, the device MUST set the
>> +VIRTIO_RTC_FLAG_CROSS_CAP bit in the \field{flags} field if the device
>> +would respond to a VIRTIO_RTC_M_READ_CROSS message with the same
>> +\field{hw_counter} and \field{clock_id} values as in M with status
>> +VIRTIO_RTC_S_OK, and clear the bit otherwise.
>> +
>> +\drivernormative{\paragraph}{controlq Operation}{Device Types / RTC
>> +Device / Device Operation / controlq Operation}
>> +
>> +The driver MUST put the request into the device-readable part of the
>> +controlq message.
>> +
>> +The driver MUST allocate enough space for the response in the
>> +device-writable part of the controlq message.
>> +
>> +The driver MUST negotiate VIRTIO_RTC_F_READ_CROSS before sending a
>> +VIRTIO_RTC_M_CROSS_CAP message.
>> +
>> +For VIRTIO_RTC_M_CROSS_CAP, the driver MUST set \field{hw_counter} to
>> +one of the hardware counter identifiers defined in this specification,
>> +or to a value greater than or equal to 0xF000.
>> +
>> +\subsubsection{readq Operation}\label{sec:Device Types / RTC Device /
>> +Device Operation / readq Operation}
>> +
>> +The driver requests clock readings through readq messages. The device
>> +obtains device-side clock readings and forwards these clock readings to
>> +the driver. The driver may enhance and interpret the clock readings
>> +through methods which are beyond the scope of this specification.
>> +
>> +Once DRIVER_OK has been set, the device should continuously support
> 
> The word "continuously" is likely not needed.
> As long as readq is created, driver can read it.
> 

I will drop "continuously".

>> +reading every clock, even when a clock may yet have to be aligned to
>> +reference time sources.
>> +
>> +In general,
>> +
>> +\begin{itemize}
>> +\item clocks may jump backwards or forward, and \item the clock
>> +frequency may change. Clocks may be \emph{slewed},
>> +	i.e.\ clocks may run at a frequency other than their current
>> +	best frequency estimate.
>> +\end{itemize}
>> +
>> +E.g., a clock of type VIRTIO_RTC_CLOCK_UTC can insert UTC leap seconds.
>> +
>> +As long as a clock does not jump backwards, the driver clock readings
>> +increase monotonically:
>> +
>> +\begin{itemize}
>> +\item As long as a clock does not jump backwards in-between device-side
>> +	clock readings, the driver-side readings for that clock increase
>> +	monotonically as well, in the order in which the driver
>> +	marks readq messages as available.
>> +
>> +\item The device marks readq messages for the same clock as used in
>> +	the order in which the messages were marked as available.
>> +\end{itemize}
>> +
>> +For a clock of type VIRTIO_RTC_CLOCK_MONO, the device always returns
>> +monotonically increasing clock readings.
>> +
>> +The unit of all \field{clock_reading} fields is 1 nanosecond for all
>> +clock types which are part of the device specification so
>> +far.\footnote{For time epochs in year 1970 or later, this means that
>> +time until at least year 2553 can be represented in the \field{__le64
>> +clock_reading} fields.}
>> +
>> +\begin{description}
>> +
>> +\item[VIRTIO_RTC_M_READ] reads the clock identified by the
>> +\field{clock_id} field. The device supports this message for every
>> +clock.
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_RTC_M_READ 0x0001 /* message type */
>> +
>> +struct virtio_rtc_req_read {
>> +	struct virtio_rtc_req_head head;
>> +	__u8 reserved[4];
> 
> I think the req_head structure to be 64-bit aligned, so that here individual requests does not have to align it.
> 

I will pad virtio_rtc_req_head and virtio_rtc_resp_head to 64 bit.

>> +	__le64 clock_id;
>> +};
>> +
>> +struct virtio_rtc_resp_read {
>> +	struct virtio_rtc_resp_head head;
>> +	__u8 reserved[4];
>> +	__le64 clock_reading;
>> +};
>> +\end{lstlisting}
>> +
>> +\field{clock_reading} is a device-side clock reading obtained after the
>> +message was marked as available.
>> +
> If this clock device is a PCI device, on an empty system, a PCI device has to do at least couple of DMA.
> 1. read the descriptor (250 to 300nsec)
> 2. Read the request (250 to 300nsec)
> 3. Write the response (50 nsec+)
> 4. raise interrupt.
> 
> How is this time delta accounted in clock reading?
> Is driver expected to record system time and subtract it on receiving response?
> Or?

As a disclaimer, I am no expert for clock reading, so any additional
insights are appreciated very much.

I think how the driver accounts for the time delta should remain outside
of the scope of the specification. In the current spec the
interpretation of clock reading is behavior internal to the driver.
Also, AFAIU interpretation of clock readings is a scientific and
technical topic of its own, which has been extensively discussed in the
past decades. The choice of a clock reading algorithm implies trade-offs
between precision, implementation complexity, and resource usage/clock
reading speed (when re-reading the clock).

The Linux kernel has ioctl PTP_SYS_OFFSET_EXTENDED, which will read the
system time immediately before and after each PTP clock reading, leaving
it up to userspace how to interpret the clock reading. This ioctl can
also be used with the RFC Linux kernel driver implementing this spec
[2], which exposes a virtual PTP clock. So in this case, it would hardly
help to stipulate Virtio driver behavior, when the actual clock reading
interpretation happens in userspace daemons using
PTP_SYS_OFFSET_EXTENDED, such as chrony.

I see the above discussed VIRTIO_RTC_M_READ method mainly as a fallback
in cases where the VIRTIO_RTC_M_READ_CROSS method would not be
available. The VIRTIO_RTC_M_READ_CROSS method is more or less
independent of the time delta (which can be in the 100 ms range, as
discussed in the driver patch series cover letter [2]).

The above question is addressed in the introductory paragraph for "readq
Operation" as follows:

> The driver may enhance and interpret the clock readings through
> methods which are beyond the scope of this specification.

I think I will add part of the above justification to the commit
message.

> 
> Ran out of time.
> Will continue after I get above base line alignment.
> 
> Thanks.

Thanks a lot for the review comments. Looking forward to continue the
discussion.

Peter

[2] https://lore.kernel.org/lkml/20230630171052.985577-1-peter.hilber@opensynergy.com/T/#me7df2d4db4fe1119d821dc9c4054b9404c15b02d

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

