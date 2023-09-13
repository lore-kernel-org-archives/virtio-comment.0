Return-Path: <virtio-comment-return-7396-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536BECA5512
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 09:05:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 84645166E0B
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 09:05:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5F960986642
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 09:05:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3FA33986632; Wed, 13 Sep 2023 09:05:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AF7E4986633
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Sep 2023 09:04:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1694595871.119000
X-TM-MAIL-UUID: b9be32e7-3d04-4adb-8532-f1e686c28028
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkaMl6hshowLSZZeodkdsNCvOc6CNK2DlOeZpA8saVk/0KIF7XN67mwZqHiB3b/lw5YjSOuG+BPM015FUmVYoxPRFWEvx8VyjqoL66o8REHeHpLAmMrqf7itfciKM0kJC/AWrztfOrcAS5pb1PpMqcJxNQh3ecfK8lflj4C9URnrI4I50Wo8Mv/LZrzSaMjD8cJtl/eYrf1TjoDCCB/bjKNLZFM4pHKaxk4oDobP4IUFKIg8vEjQ3Aj+6bmhwFvIh3AuPJXt/OlhruegOLM2CUM/iDzGqzEDKnZPiEFQ4yhpYTaS61JXY2KMhYVXVDGa2bSxc53MjnaU3c87L4runA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNltOyzgbmZ3zri9xLXWcEsuKh8/js2SUkyGb4Ch6Ec=;
 b=K39iz024kdq4WnJrfXGvhH8x3nNAYcfpODAvkjZ8YFQby5W2OEbO/UMcKxDaSAuEYeFdyirnwo8nxtog1ItrA1dumhR43TeMUWpiPj1wEenyThHaSaW77OVsr0l45f864eNXVNZXUy0RxqqHgqJdDDz7iRA5hxKFQrRT4ea7uFm+kUtxEF32zMy4BYh8M4WVXYK9uAM3GdRprZQjxI3qJYm56p1UJOjKSlNpxQO4TqM5R10a+wdtFxJaNkubShYrvi3bisrDmCm5BWE7mdhnpLgoC+i+FSeBco72ku3EJlooFwZGGL5L+NcZ+KrPTkEwo+aVs5oyB3YZKDr8BgOEZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com>
Date: Wed, 13 Sep 2023 11:04:27 +0200
From: Peter Hilber <peter.hilber@opensynergy.com>
To: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: Cornelia Huck <cohuck@redhat.com>
References: <20230630092959.392381-1-peter.hilber@opensynergy.com>
 <PH0PR12MB548182C0D5EB0C6273F30E9CDC28A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb5b1603-68eb-3301-9e5c-6bb81e9bc594@opensynergy.com>
 <PH0PR12MB5481CA116DBB424005B0B5D1DC05A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <766e94a2-2592-d3ca-2ddf-164022df05da@opensynergy.com>
 <PH0PR12MB5481F7AD21A871DE5660A948DC1EA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <PH0PR12MB5481F7AD21A871DE5660A948DC1EA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7a::9) To BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:77::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB3267:EE_|BE1P281MB3060:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea0e778-80c5-4e56-1e60-08dbb4386f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UyAY7mZsSRjk+kV9Hmvf4Yi8kDrihuGLY4keX4Clf9oHC6gUfXw35LpFGgLGcmJFVShxxv1EzowxsBR0kvQT42ko72/Hs7gNMOv1iJADUKFOVLQtFzuSljDm8qsa5TrYxJZX0TnVKUBAyP5HDF9U4dI7ExncWegyOqk8WbkkyIVf2jTSb1MY1UIHaRYUbGvTgmOIyaQFRNtsTS2Z8DivUIyyFFYmJwhcwQ9Z+77UGg8gZCF/ltB9fiChOWzzwIbm6M0DT1Fs5wEpurv/I6/LfnZMZ33NEFj04H82CPjeGmEgUYy7JLUmP0Qt7IvvD8CeCsl/F3N8vAYniX6cCbXqek+YzPbtuKOPmmC3B5O2KFxy4qGtrUvrG74Z9tJgcXiffgbcdI9m0mcxgjJr760BGFuqzZ7PPr6EYSPfEggrAOUHVvsqPZ6hPC0c2uP0LlKTpOiwGBwJ/RMReMknO66u46GD7tm65jvYttli0OfTPpdW81oTiQHE3gSWR0KOJb8IfUV1ZzGygI1UGKWdHLeOBYz2sCzSsRlSOYupUDYp4i5j6TPvF7G1ArksSUdZ3cUcv1sO/7LTs/T9TjqvzjD/Mse34sR6ivmh3ukWGbhAw3Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(376002)(39840400004)(396003)(1800799009)(186009)(451199024)(2616005)(53546011)(36756003)(31696002)(86362001)(38100700002)(31686004)(83380400001)(30864003)(478600001)(41300700001)(316002)(42186006)(66556008)(66476007)(66946007)(44832011)(5660300002)(110136005)(4326008)(8936002)(8676002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVRia2tGb1dKU2hEQ0ZYdXVBdU85cHZtTCtabmhBMSsrcmJ0Um1obDUrS3RW?=
 =?utf-8?B?SUZHYUp2ekhwaUFlQkZZK09ma0hUSjk0R2NBZW4yR3VEVUNZOWRIdy9LN1FY?=
 =?utf-8?B?YlViVml6WG13bUVrY1N4czNVQytNbXplRmd3QVUwQTBndjFCTDFjVmE1S2x0?=
 =?utf-8?B?NEsxMG5WMXRjMXVkakdseW9QbFp6R0N2bTBBbmdqNkJTV0tYRUQrK1BHRGti?=
 =?utf-8?B?SDE0aEhHVXFVaWs5L3VsbXUwOXAyVWw3TFQ3TUR6eTNHQWFyTExFUXA5M280?=
 =?utf-8?B?bW93VjRZTnEwbnFHY2hhU1JHVzRYMjFmdWVkdS9ZOU1QaVlpQlY3VEhPRHhF?=
 =?utf-8?B?VU9pYllocEUvUDY2TjRjRUI2UjlsUkh3VUNWdExsV1pET01QWjNrUDY5U2tC?=
 =?utf-8?B?RmNIb2ZwMEdaV1p6WnY4TWRzNEF0a3J5R0Q3RGpQeXY1SnlTalRobmpOOEpi?=
 =?utf-8?B?VXpLcWZFZ3Nsbkc0Lzd3MisrakRPby95ejBLVk4zT1cvTFdoN0xGVE1BMmdp?=
 =?utf-8?B?ZGh3cWZUem5VVmp4cXJQV084b1RidTNPZjlkbWU2R0ZldFBzVWdoSmZkcFVZ?=
 =?utf-8?B?MzRZT0ZDN3R3Y09kdDNHWUFrSVNHS0RyL1N3WFRhT3d4eVJpYkU3a25YOE5r?=
 =?utf-8?B?RkFBZlJ4bDA2SDNPNDNVUkp4WER4cWFSbTZrT1ZWb1IrczFyMjIybUZpSHgv?=
 =?utf-8?B?N0JSc3hHYjByQWFCeXhlc2NSZUVyeWVEU2FYVUdiNkVXdVZhVDFsRzl4ZEcy?=
 =?utf-8?B?OHg5NUpoQU94K3FCR0FYZ1JXQzNkWXFIclZHSjgvMGl6R283Qkp1YmM0L2Fa?=
 =?utf-8?B?Q1pwckMxOFI1Y0VxUVRocUR2SDNqSWJFWnRVTGt4RGhXM3RMaWJHQWZpWjFr?=
 =?utf-8?B?bGxVYXd5KzYvN3BZclFtSG5rdmtCN3lrd1BkY21Ta0F1QUdhZm5iL3kwdVhl?=
 =?utf-8?B?bmdMcm9wNjlxOGRtNHBkcTBCK0hhdVVCZ003K2FHQjdyTVZjZ3Q1MFFib0Rp?=
 =?utf-8?B?bXV4VGtIZ2lSS0wzYmF2OXh6REFRYmJESW9PVEp1Vng0OUc3RVg0L1JRUGxx?=
 =?utf-8?B?eTZseUxSeExIN2lQVmZ1SWM3b3Myd24wYW9pVTFybFVvSWNhbVhpdU1KTGNi?=
 =?utf-8?B?SGFRWmhHT1A1elgvcW1aRitSRzUvWE11N01DdXJrZnFzVlI4T2U4V0EzVEor?=
 =?utf-8?B?OXF3ZXJPOERpc2JDV2dpamNwK2o3a3dIZnJpeHdnN0lJVXRYN2JUSXJLK2No?=
 =?utf-8?B?Z1RFSU4vWlNzYXlvZXNGeis2QXVQOUQ0RkJZQ3pOMG5weDNFRWdmbTJ6cVBB?=
 =?utf-8?B?NVhaaFlNb0hRZkJXSERYakJ0ZkprWC9OdDgrVmJTVmZleHVwdWpDeSswZXE5?=
 =?utf-8?B?NGxEWWM1SFM2bmpFRUhMNFZtKy84SGd3dDJTSDE3NUxjV3pmeVIwT05ram5B?=
 =?utf-8?B?MllQRGxBQUJLV2RzR3VHREhDQnNnMjgzdFhuZE5lL3RlMWlwUlFzMEFaTHA4?=
 =?utf-8?B?RC8ybE5LaWVSbzFReTlTNG0yRHdBclZSd2RJWWswcEpSamgzb0M5cFdhaGxq?=
 =?utf-8?B?Y2FrQ0ZBTE5YMEZwSUFwMkVrbDV6ZWJlRisxeHJmQWZvYkt0YklkRzhWTkph?=
 =?utf-8?B?NmFNQkFBYjFIbm1EV1RIU1Y0SzM3UmFvNk5lQ0tZMTBlZnp3anIrNFlIM3Ji?=
 =?utf-8?B?Y2pDNVp1bHA2WlB5bEd0OWlmV0d1b2NsbXR1NHZ2aWtMQzJ3SEcyWnFYZEVC?=
 =?utf-8?B?eSt4aXVLblJPeklWV25yVkJYUG1uR1diK0MyZURnUUc3cTlqOVc2UXZOa1pC?=
 =?utf-8?B?VU9DU0VpaUxDRnNPb3ZQcVpkbGpONmE5WFlPRTJoWmxiYVVxditvbUp1UElq?=
 =?utf-8?B?KzVzalBSS0swZUlVRGw4WDh3NzlCazZsWjFNNk10eDlYaTNYV0tKWGI1MTZS?=
 =?utf-8?B?L0pnTVVjYU16THFEbG1QWHpRSy9XRmRzYWplbCsvZkpwWVhYQXNuVmFYZ2pZ?=
 =?utf-8?B?eUtveEs5cEQ5OE9ROURMaDVTU2llUm81MFhyRFYra1pTdzRFYm5EM3UxMDRr?=
 =?utf-8?B?Y0tlWUJwQTlEUERSeTQ1TnV0dWVJTHYvTjhvVXdXVFEySjU0MmUzVCttcis2?=
 =?utf-8?B?TmpOUnhjVUZJbTh5UWQzRG1sb2NlRExVZjdQUlkxWXZ6Q0RrWVNMWlpsOTVo?=
 =?utf-8?Q?QtY0lFjGVIVlQeJ2xzttX5irDw3lTEChHH3idTcav9Vm?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea0e778-80c5-4e56-1e60-08dbb4386f9b
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 09:04:28.8779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLoISb7G0qZkFTsBIJNMD1VQJqwUmN8l3VfegtN9JqI/omjuJUIlUzxxQjk8tvfdix4oEX9BovYdmiugTfgafw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB3060
X-TM-AS-ERS: 104.47.7.173-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1011-27872.006
X-TMASE-Result: 10--21.754600-4.000000
X-TMASE-MatchedRID: hFbMlnd2lLPEeENaa6f3ipQ/7SF2k7HSDDgMha/WNJVtT5dsVizXEpdi
	gZi17dHq0mRztaNrv8h8CLVSat09ma++zjUCEPH0+2gzuAk01wHIUNmTDb0ad+4HeUqhyIYySs0
	8zA94N2f00UqsgheBfPVwzoEMuZdlIXx9E6z+WLdQkyrhEnYS4KF4nhfuztKag64h5IjaBTc2Jd
	Iqmm5YSVQtutjmknp43+obMdwrXFCzep/ecFvORsncp1vjFReH11qnBW8yYK8KxicnNfBGiqYjY
	Lx7OObOVwl7NZX+kmzksg5ocZI9uDSRi6FvJw94vcAEkcUt07oQ9JMcGBx+/oHV87ajhAZwmZAB
	5aX+72cBowZfTqYlidwPuZ9Ncjp0nigFHBmJ9kGFcBbxUMqWsWwEEr52PwDFS8IZdaAUvZ5qBT2
	EEA4cz+vAOCR+ibKnHKU+2YT0lkw2U+LJPyEBMC4HweDY16f5Czp4ZDpFqX1ouZOI0j98VmZdjh
	uhA287knbKdxz+tOb4a4F473/qeCLAKFjru5Xf8gS7UhJygG0KonRFsndtvUTrh3TFw9fF6tkHo
	hQPHjN/+0I3vZY3Bq1wF57HsrHtdUwCx23rS1B5+vu+V0hRvJ+aiRrvTzt85MSr0VKKG46iHKVN
	/4HAjOgaa/mB7sI81XZNbe7rS8GmhEM1efJaL7gfbGc+DhkX0pUa1RtpyoMaqKx5Lx7gZ3OLzPY
	W+Cj6u/WDwUiItFeGE9D9JFhto/pxx7TUp2Lw/cRTkguDislxev1HSNY2wH6u8VnsVatcZXiJFc
	TIEwNL3jTXnnmO6TXpi1tyxBpBZcJ3CHmQj47cgXNBUtxo90I9AEPfED/do4NJa7SjFsoNof8VS
	2Ruh07zklyhPTD9YIyQM4JfnWklTScbe2l74JsI6K9TYesLSRUA+vRNdLw=
X-TMASE-XGENCLOUD: bcd3d7ad-bdc4-4824-89bd-f5ff25077f88-0-0-200-0
X-TM-Deliver-Signature: 486C77DBA65348F84ED36AFD8BE2A917
X-TM-Addin-Auth: 6Phwps+vCY5XK5MMECrGUkAEiOBhTp9XqJuAf+5pTLasm0pyx7wwV3liETj
	0CptbmC7CC1ZdG9qSUqLo3wVkehx7YCjLt0UkEeYUc/9JzEN/VWTniJRiqbh3ec4QkAYwD6LYQ8
	ke5HjqPEcixm1liH8prRKKdIlRfNuAcVrlolfciqpiCSS1gaWqi+Qrb8gr45RwGwOBLncnNfQPi
	nuHItiLmSn1+zTxJGaH+OlGf1YrZVXEdETB/Rrwm2BRQBHcV9umWCsvfncVOocCdodS0r4vJlbW
	juEDUGHxMKZ/PY8=.JQ7i7qKH3PZ4rT0/Y6oq7ypsG/pc5jctY3IagvdYm59FXSYp99XQFgEp1s
	kPe8a92DMmKlA05KmNYD4xWnwA8YDxwtILL43jT+xuJ/yL5WMZP3rEB6gE4L4RBEqA1vFr1nOzR
	HN33ABFlsaGfSfYt7E3aXb+kZHSKOME5j1wrEbfILk78j/g0fGIS4CWDhMdjRcms5fGawq+bYi0
	yfgne1aSF5+jj6pkfZznjygMiMns+ksF4qcYZmcJFG3BsrpLX2c+bXt1SQriJGluVvjFyiAu97m
	hR7JSLv3+fhDzWtQ6HWYtbFLHc1+PzbcyGjGKE2zcATu5SLu8Fakx1Rhvfg==
X-TM-Addin-ProductCode: EMS
Subject: Re: [virtio-comment] [RFC PATCH v2] virtio-rtc: Add device
 specification.

On Mon, Aug 21, 2023 7:42, Parav Pandit <parav@nvidia.com> wrote:
>> From: Peter Hilber <peter.hilber@opensynergy.com>
>> Sent: Friday, August 4, 2023 9:38 PM
>>
>> On 31.07.23 05:15, Parav Pandit wrote:
>> >
>> >> From: Peter Hilber <peter.hilber@opensynergy.com>
>> >> Sent: Thursday, July 27, 2023 3:51 PM
>> >
>> >
>> >>>> In the spec, clock ids are 64 bit wide to have unique ids when
>> >>>> supporting clock
>> >>> It is unclear the namespace of uniqueness.
>> >>> Do you mean unique id across multiple virtio devices?
>> >>
>> >> The idea was not to have a unique id across multiple virtio devices.
>> >> Rather, the idea was to simplify lifetime management for clocks in a
>> >> single virtio device (if such lifetimes would be introduced in the
>> >> future) by not having to worry about race conditions due to clock id reuse.
>> >>
>> > If the id not unique, 16-bit is likely more than enough.
>> > There should not be any race condition with respect to clock id as its per
>> device.
>> >
>>
>> I think 64 bit is better since the cost is negligible, and e.g. the device then does
>> not have to care how it issues ids while the driver is suspended.
>
> Can you please explain how 64-bit better when the number of clocks per device is not so much?
> Even with 256 or 64K clocks device wont care how the ids are issued.

64 bit width should address the potential future case where two clocks get
hot-plugged and hot-unplugged at a high rate. If the device hands out a new
id each time a clock is re-plugged, and if the driver suspends and resumes
during this, an 8 bit id could result in the driver interpreting ids
wrongly.

>> > Both the modes are in use, hence we want to support #1 and #2 both without
>> duplicating the interfaces.
>> >
>>
>> What I wanted to refer to in my reply are the Linux kernel /dev/ptp* interfaces,
>> which are separate from the network device interfaces.
>>
> Sure. It can be.
> When the netdevice has the RTC features supports it will create /dev/ptp* and /sys/class/net/netdev devices.
>
> All the plumbing that is done is for dual use.
> So command etc definitions is for dual use as I explained before.
> Those can be used for virtio-net device when it has in-built rtc.
>
> When there is only rtc device with its own device-type, same functionality and commands are there.
> Driver will create only /dev/ptp* device.
>
> From SW point of view it is just matter of layering..
> Already done by more than 13+ industry devices..

I think there was a misunderstanding. I was trying to say: When it is
better to show distinct devices to userspace, would it not also be better
to show distinct devices at the Virtio level?

>> >> The extra effort to implement another simple virtio device (rather
>> >> than putting everything in a single device) seems to be small when
>> >> compared to the complexity of creating an extensible specification
>> >> which should work both standalone and as part of an already existing, but
>> still growing, device.
>> > It may sound as small effort with only a focused view on RTC only device.
>> > But both types are needed.
>> > From actual implementation point of view and use case wise, yet another PCI
>> device at scale of virtual machines is not desired, especially when it has tight
>> usage completing on network device.
>> >
>> >
>>
>> If the issue is PCI transport related resource consumption, the PCI transport
>> could be extended to support multi-function devices, in a way which is agnostic
>> to the device types involved.
>>
> All things needed by rtc is already present on net device. So there is no point of improving PCI transport etc.
> PCI transport resource improvement goes just beyond PCI transport improvement. Such as APIC, IOMMU, device registers and more.
> This is equally an overkill.

I understand it would be more effort. But to me it looks better as a
generic solution, which avoids imposing restrictions on the RTC device.

> And defining and duplicating exact same commands in net is equally sub-optimal, specially when we know its need for last several months.
>
> This is the right junction to reuse functionality on two device types without duplication.

In my opinion it would still be preferable to have one RTC device, and have
the RTC device cooperate with the net device where needed.

>> >> E.g., the
>> >> RTC device should also get an alarm, with an associated eventq, in the
>> future.
>> > Sure, it is ok. it will be optional when it is RTC device.
>> >
>> >> Also, I wonder if the driver implementation should then work both as
>> >> a standalone Virtio driver and as part of the net driver.
>> >>
>> > Driver layer will be fine. Linux stack evolved over last 3 years to support
>> multi-functionality device.
>> > A RTC/PTP driver will be a stand alone entity that works on underlying layered
>> way to issue read cmd, config etc.
>> >
>>
>> As per my above reply, I think it would be better to tackle the problem at the
>> PCI transport level, then there would be no impact on individual device drivers.
>>
> There is no impact by better definition usable on two devices.

My main concerns about sharing the spec with the net device are:

- the RTC device would act as a guinea pig, since no other devices share
  device-specific requirements so far

- a more complex spec impacting two devices

- strong coupling between net and RTC driver implementation (or code
  duplication)

- using custom interfaces (between net and RTC driver), rather than generic
  interfaces

- RTC could not use device configuration

- unrecognized issues, or future generic changes to the Virtio standard,
  may inhibit future development of the RTC device or the net device

- unclear responsibility and timeline for net device related spec and
  proof-of-concept

>> >> Maybe the above use case could also be addressed by a standalone RTC
>> >> device as follows:
>> >>
>> >> 1) The net device exports a UUID object to which the RTC device can
>> >> refer to (so the drivers can link the net device to the RTC clock).
>> >>
>> >> 2) If needed, the RTC device aligns the lifetime of the clock to the net device.
>> >> Then, clock lifetimes are no longer static, and can be aligned with
>> >> the net device. Through an eventq (to be added), the RTC device
>> >> announces clock creation/destruction, which can be synchronized to the net
>> device state.
>> >>
>> > All of the infrastructure, cross device synchronization, its device side
>> management will come with equal complexity.
>> > And we will end up with sub-optimal way to using multiple PCI devices.
>> >
>>
>> As per my above reply, I think it would be better to tackle the problem at the
>> PCI transport level...
>>
>> > Net already has cvq required by RTC. So cvq commands can be common.
>> > Readq is additional, we need to define common between the two and way to
>> discover it.
>> >
>>
>>  I would still try to avoid mixing net and RTC details. RTC
>> should keep a dedicated cvq.
> Can you please explain why a dedicate cvq is needed on net device?

I think the concern about redundant queues could be addressed by merging
the RTC readq and controlq. At the moment separating these queues would not
yield performance benefits, so I think I will just merge the readq and
controlq RTC queues in the next spec iteration.

As to why keeping the net and RTC queues separated: With a dedicated queue,
the RTC driver message processing could remain decoupled from the net
driver. Also, the net cvq format does not align well with the RTC messages.
RTC messages have detailed status codes, while net only has VIRTIO_NET_OK
and VIRTIO_NET_ERR.

>> Then the RTC driver could use generic Virtio
>> functionality to send/receive rather than using an interface which is specific to
>> the net driver cvq.
>>
> Please explain why?
> We have dedicated vqs work ongoing for flow filters due to high rate of requests requirement handled by hw.
>
> So would like to understand if we can extend similar dedicated cvq. Given most of the queries done via cvq for rts are not time sensitive.
> Hence net cvq seems enough.

This should have been addressed by merging the RTC readq and controlq, as
per my above reply.

>> >> Actually, the cross-timestamping support can be specific to the
>> >> combination of clock and hardware counter. This is explained in more
>> >> detail in the context of VIRTIO_RTC_M_READ_CROSS. I will mention this
>> here as well.
>> >>
>> > Hardware counter is a misleading term here. It is really platform (system)
>> specific identifier.
>> >
>>
>> Maybe with the currently defined hardware counters there is a one-to-one
>> correspondence to platforms, but that need not be the case. E.g. it might be
>> more convenient for a device on an Intel x86 platform to read the Always
>> Running Timer (ART) rather than the TSC derived from the ART, and then the
>> ART could become another HW counter in the spec for x86.
>>
> Maybe I am wrong, but it looks like this is platform feature where driver can device to read ART or ARM timer without any device knowledge?

Not sure what is meant by "driver can device".

What do you mean by "platform feature"? As I argued in my previous reply,
the ART could be used instead of the TSC, and then would need to be
distinguished from the TSC. Also, there is no guarantee that all platforms
will always have the same single relevant counter. E.g. on Arm there is the
physical counter view and the virtual counter view (though distinguishing
those might not be so important). So device knowledge is required for
reliable operation.

To me there is also no advantage in narrowing down the hardware counter
terminology to "platform", when it might in principle be other counters,
maybe from peripheral devices.

> Can you please explain, if the device does not have the knowledge of platform/system timer, can it still achieve the cross timestamping at driver level?

In a simple scenario, if everything is working out, the driver might just
guess the right hardware counter. But it should make sense to be able to
detect error conditions, and to be able to choose among multiple hardware
counters should the device support those.

Rationale: For cross-timestamping, the device sends the driver a hardware
counter reading. The driver needs to know how to interpret the hardware
counter reading. If the driver assumes an incompatible hardware counter
(e.g. TSC instead of ART, or HPET instead of TSC), the cross-timestamp
interpretation would be nonsense.

Of course, in general indicating the type of hardware counter might not be
sufficient, e.g. when a heterogeneous multicore platform might not have all
counters synchronized. In general, the device would need to have some extra
implementation-specific knowledge about which hardware counter view the
driver has.

>> As discussed above, additional counters may be used in the future.
>>
> Do you mean additional system counter?

This was meant to refer to the ART, which would need to be distinguished
from the TSC.

>> >>> If so, I guess no need of a feature bit as it is not serving any
>> >>> meaningful
>> >> purpose.
>> >>
>> >> The only purpose is to potentially save the device some
>> >> initialization work or resources in case the feature is not negotiated.
>> >>
>> > Ok. In that case we should move it to per clock enablement instead of feature
>> bit.
>> >
>>
>> As per my above replies, I think it should be kept clock and hardware counter
>> specific. The feature bit could be removed if it seems not helpful.
>>
> Ok. lets remove it.

OK.

> I apologize for my slow response. I was not well when you replied.
> After that lost track of your email in stacks of email until you sent the newer version.

No worries. I was also on leave and I am unfortunately also slow to
respond.

> Lets bring rtc functionality in the two devices. We are almost there, just need to refine the definitions.

I would still prefer to keep the RTC spec separated from the net spec. But
in my understanding the issues which were raised about sharing the RTC spec
with the net spec have been addressed (when taking this reply into account,
too).

I would prefer to first try to upstream the RTC spec without altering the
net spec, while trying to avoid conflicts with the net spec. Maybe most of
the RTC spec could then, as a second step, also be applied to the net
device. The responsibility for this second step and the related proof of
concept work would need to be clarified. To me it still seems better to not
share the spec and address resource problems at the transport level.

Let me go into some detail regarding the above. My main concerns about
sharing the RTC spec with the net device are (as per an above reply):

- the RTC device would act as a guinea pig, since no other devices share
  device-specific requirements so far

- a more complex spec impacting two devices

- strong coupling between net and RTC driver implementation (or code
  duplication)

- using custom interfaces (between net and RTC driver), rather than generic
  interfaces

- RTC could not use device configuration

- unrecognized issues, or future generic changes to the Virtio standard,
  may inhibit future development of the RTC device or the net device

- unclear responsibility and timeline for net device related spec and
  proof-of-concept

To me the main argument in favor of appending the RTC device to the net
device seems to be resource consumption related, so might better be
addressed in a generic way at the PCI transport level.

That said, by also changing the spec to merge the RTC readq and controlq,
in my understanding all the issues which were raised about compatibility
with the net spec have been addressed for now.

Last, thank you very much for your valuable remarks! I hope the resulting
spec will be able to address diverse use cases, including interoperability
with the net device.

Best regards,

Peter

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

