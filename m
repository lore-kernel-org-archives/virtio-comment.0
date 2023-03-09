Return-Path: <virtio-comment-return-4827-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41742C64EC4
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Mar 2023 00:29:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5D6E72AEF1
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Mar 2023 00:29:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4E9749866F6
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Mar 2023 00:29:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3C61F9866AC; Thu,  9 Mar 2023 00:29:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1DFCE9866B3;
	Thu,  9 Mar 2023 00:29:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6mPY+z0YWYNuMDhmy6bK2L/7fod0D938SjfgNf7oqhtRvNNOCVzH48JUbpBNsm5rWRwMMv7yAuTBkn0bZTKik5QPIZTzcfU/hOJ4I+/zsEyQq3jG2y2dfu1XqAC0O2a9Inm1XfyXiIKITDwjCEBq5MvplK8BUjE26Z5DYNkPbB7cVz9XZmxw1fmRZ8J8MU9+ZzgRmjcSEJggOwR79JwLqdwIvP2ZFeFhzBjSTeIp1q4xMvMQpBMP9Kh200cztmtxmF8xzNBR900p7IiCUd7GPSXu8GduJ7g1ZYnvkYmloGzWdpvXHwbP3J9sKkA67a0tERw/U6nAstLgz+YipLZEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fO7HGsbtLszZoCNmc57DH5zvuj6Hlzp95J3NjHm8Hs=;
 b=TOPqiw+kG/ja0LMZqA6B4J9mfk2pWA+siwWxZrj2vLBMygjopIoqChPr/OVjeORRilJtEcc8b2fKpe99D0qdAxHQdE8U2CNZJb1qCigo5qU+9Fo3wNNoVFRLJEXdeqRTd3Q6t1VsdkrXrKibqB0CJAe/7j1oFkLOxktVwC9/SeqewOr+vMrjxdiATXRpx1M9pJrqhcRs5hK/adX13+j7OSc7Blmv+hNj9fpbOUF+Fb9shxuCigqCqHBpECLDavhkZljrDQd5Ja/4AEYQU0PE28ABuWiv2p9Dus9nAwKc49qEKvbwppQconSi451E7tiKJH4fmmCSjlQm3Exz3b5wyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <2ef47f53-5978-4b6a-593d-4e94eba0b9ac@nvidia.com>
Date: Thu, 9 Mar 2023 02:29:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
From: Max Gurtovoy <mgurtovoy@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>,
 "nrupal.jani@intel.com" <nrupal.jani@intel.com>,
 "Piotr.Uminski@intel.com" <Piotr.Uminski@intel.com>,
 "hang.yuan@intel.com" <hang.yuan@intel.com>,
 "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 Shahaf Shuler <shahafs@nvidia.com>
References: <cover.1677761896.git.mst@redhat.com>
 <910b3607a5f255134d30b3e1233e564f564eafb8.1677761896.git.mst@redhat.com>
 <PH0PR12MB548116853CAC23DF9CA7345EDCB29@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230302201912.GC2554028@fedora>
 <20230302185803-mutt-send-email-mst@kernel.org>
 <20230303131703.GB2866370@fedora>
 <20230303081900-mutt-send-email-mst@kernel.org>
 <4f869944-4ccd-c51e-0f30-dc3ba15ffd52@nvidia.com>
 <20230307192752-mutt-send-email-mst@kernel.org>
 <6668fd7a-3eb3-0447-9cbf-72d308b1336a@nvidia.com>
In-Reply-To: <6668fd7a-3eb3-0447-9cbf-72d308b1336a@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::9) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|MW4PR12MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: ccaf0095-7725-4d3e-c2a7-08db20355f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UaSDARlM9KxZ4YTKPYa+GMYQVPw5UWbFMJ26WFIb3gbcKJcCNBf2uCaUorZJyUMBWlQJ1cvtrc68NyoPRLBdMJdmdkrigAoM9+rReOL4OIA75dBn+b8v5NrJIWQfUDVr30/EaugwbSGCOrKmAsFexxQQe8RSO/9ONAEQGufZVms/ujsgtvEoBaPhSfa8FoUChpCuw5UpkmCRo32OfY1KYEvO0zAGC6PDeFTdfMV/UZLDJ4sCVhhQVRR3B86RMSBPDoF6bFjYf5QXH6TaWbMgTjCYw6csq5z0AKtvWDDSSLJ50e1mJ4z+oa32ITYmJ6n83DoIZHpPlIuPLnyu9N85FoSN1u4TFzsmObEaeU9gPMSQXVgBLHPaJQRNHtbBR/GvNa0yxp1oAmWjBNX7YTlZB4DeGQDW/jmYUGQliDQrcobBa+daJiGhQqfTCTqPttlc90T2JQffwoyWaDPGFJ2DRe/tHZ3g9p1UmC9j4IcU4Q682wa9xDfWX0BMlUnpIB9SKNPpqZtr8UOPOyDDmOQSJ8iA5OCS1FDD0JGrVrtyIo6mids3AbgCHy7fU5CUmn4K1ja1M4XVtobb9wteYw6x10ES2Ar0i9Td6R0WA6Ltr5sodZP41zXu6L3zxcuq0SF7GptlSoHojrx1Ogx4xTqoiRCwmAQ0wCwSaIL4ZINViH6qW3OIVtByhvy0jHq89oskp+A2a2dKL5Qg9o+Bq6K0L81tAurDrZtCS1TB2dDjaSvum/R30Dmzg0/YVAZQm99+dWf/GP9i5Z+ZS3buO4Y+Dtc9VyYi9PzHdZd6F1kvIcCyeuT5BFL3hhXNGlw4cZ44F1QxKje1jYoL1eUpTwZxnQ7OGgTthFz+cSv4KbkIiLM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199018)(66899018)(26005)(6486002)(38100700002)(6666004)(107886003)(36756003)(86362001)(478600001)(6512007)(31696002)(54906003)(316002)(31686004)(186003)(41300700001)(6506007)(83380400001)(2616005)(53546011)(7416002)(5660300002)(8936002)(966005)(6916009)(66946007)(2906002)(66476007)(4326008)(8676002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1VQSElFNWNCeGF3OXBsNCtDSUQ0NUl0SU1hU2lHUzBvSDNjNy9qRmpyVEx4?=
 =?utf-8?B?L0IwSGRhVGlYdVl0eUkzT3FtK0VFTDgrdUNjdmVOYythUm1ZdlNmZTJxTHlP?=
 =?utf-8?B?ZWdzQVIxeE1xL0ZUdW9xZE9QVE5WbDA3Wi9ZUGt6WXRFcFlDZmF0Kzg0cVM4?=
 =?utf-8?B?bEY1YnE0UUVjQ3lpcDZieUtBdkxjajBkSG84R2pPaTJCcFNPckxSUUtKbU9p?=
 =?utf-8?B?TWhYYVFNRDArdXhLNXpRUU53MjJaTWNRK3ZnZ0JuWUpCby81UUdzSzJMcmVX?=
 =?utf-8?B?M3FSZmhBMVRSNjFlaVhuaWJJbmZtbFdKWHRJZ3dkTHd3Z3ZqaGYvTkIzenJI?=
 =?utf-8?B?bjdPYUN2eFp6YUhXeUg2Wk5rbzNiM1B5U3JhZXRLbzEzRXRLcEdqdTJUb3Np?=
 =?utf-8?B?aVFUbS9oNi9SZGtwOEI1STNiNkhDcmkwMC84NU1qQmljWUpubDhXWllHdy93?=
 =?utf-8?B?Qi83MWZlMTUxbTI0S210ZlhYNU03VVM3R2ZKQi92YXc1c0JOeENGQkZvKytC?=
 =?utf-8?B?RW40WTNHM3I0Vngydkx5aHJsZHgrUXN2SzZ6M2FlNDJkeGdFZmE2WFBURnFN?=
 =?utf-8?B?TGt5L01YMExHOUhlbUNOS09FQkZHM2lxYUgzZ3RhUDlGNlNacGZySkZRN2xZ?=
 =?utf-8?B?Q2NlRldBQmU3ZGZVYVRHVFFWYW1MWnljWklLeDREa2czdUdnNUVzdEtRM1po?=
 =?utf-8?B?R2I5V3FFUElhZUtOckJ6ZzEzMXBiQ20zMjBMNHBnTGdGQnRlRW9tNk1UR1Z6?=
 =?utf-8?B?b2p0Y3ZDMm5MNjY5QllsNDBZWlp4VGNJVW1vNHowRzVaQUZhK3RCdUFyTHJ1?=
 =?utf-8?B?RTZGSWp6OEgyOENpU2R5Q3FxZDBmb0xhdzZJU1F3RXR1cUdGaC8reld1T3pD?=
 =?utf-8?B?TUVRKzZyNGEwS0pvaG5tR3dvRzFyZURDMnZIN3J5MExpUXhQN1lHZW5ETFc5?=
 =?utf-8?B?ZlV1NXFxMUQwMFg1TllQYVFjcnI4SCtrY2VNN0ZSeFpSY1ZyNUVSYXBoalE3?=
 =?utf-8?B?VVF2SCtQVlhGbFhJNDdUY3B5UmNqYS93VmZvNCs0VWtPaER4OTZvM1VBSUs5?=
 =?utf-8?B?Y0pJQ3JIT3ZtMGlBQWJZTlk3RGQ3ZlAvcnBrZm5ZMk5paTZJMGVnQzc5TXAv?=
 =?utf-8?B?QUFZT1pCdldKQy9Ga0ticzZLRlRCZW9YSFlxZzBHTGNoQXJJOWZFMjc3NnVH?=
 =?utf-8?B?akhBQXUxc2YvUzIxZE9vUHNQSDhidHhPMkRLN1RvSXBVMlFyU1BUeGtmV1JD?=
 =?utf-8?B?bXFUTkRoK2xCbmJ6QW13Um1ia3d2UElia0Nhd2FSeUJCQzkrN3FUOVZEeWJ3?=
 =?utf-8?B?YjJLa080S0tMb21PNlRucFR5K3BQT0NyQWlmSk1TUnRMVG1yMXlxcUFxR2lK?=
 =?utf-8?B?dGJDVEc5WjlEL0pNUmllc3RFTkR6dWlWQ2JJQ0ZVbjJyS3NwVEV5WVFoZDNi?=
 =?utf-8?B?NVhpV21wZjI3b3Z6eDZIRDJPelJGcHVIbU9YMC9yODNkUGJTRkFWa3NSOC9W?=
 =?utf-8?B?ejBrcFJSVm8wcDF3a2ROd3Y3L2NXUWMrMVM1K01NSG5Eb2d6VE5COWVKVVZl?=
 =?utf-8?B?U0FGVkJIYUE1ZWFjMlNLdkg5M2E1ZmNPY2VmTW1pSEova3NNNFhrL05lYjVk?=
 =?utf-8?B?Q1R6WHh3ckpZV0ZXS2VpQU94LzNxNGRqNDhUUmNMU2Z1d2F1OXpGSlFvSWUr?=
 =?utf-8?B?N3JWYmZwcjZmbHRsR1BuaEpFbUNrM2ZITGc2Q2ZvQWVTdlc4eEM2K09ydTZy?=
 =?utf-8?B?SklocWNOd1Btb3BXZzZuK3RSbEtLTlRXMVJVT0QySTBnT2JVbXNGb0syWDFz?=
 =?utf-8?B?cWRsUkNEc2tkS21rdWxwL1pkV1RZTWRYc1pBR1QwQlAwS3Mya2REN2FpNG1B?=
 =?utf-8?B?WW0vNjM2YnI2YzdZTHZmUkJlYjNPMmpDWDFoSVl6UVBZUW0zdndNUDhXcmdU?=
 =?utf-8?B?WXRWdVVhTFJNL0JvU0VYdGtYWHBxVDN4Z2I5TitzUEhnUkdrckUza09aWVE4?=
 =?utf-8?B?TGRQdFdDcGk2OWxVZ1VFdUZPSHVlSXdQa1lzT1A5NFZ1WDJnL1hjOTYzbGpR?=
 =?utf-8?B?cTRzRUViMHBET29MRVM4UzJPWWhOVTVXVmdjcHRyNVBEWkRsbVJZdkJNdHhT?=
 =?utf-8?B?UUpialR2YnNSVjRnUzlIWGxaQ1BJSFB1Tyt1b1B1Y1ZyVkxCOWF4cCtNRlB1?=
 =?utf-8?B?Vmc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccaf0095-7725-4d3e-c2a7-08db20355f05
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 00:29:40.5125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hVj3ZRhZKbRMBPDYZ6Rm5vy4Gzl5ObjLocL7uMLFgm7ECaiwUBasfffgOPo93st4yxsp52zXcbF/EfBjTvL8Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7360
Subject: Re: [virtio-comment] Re: [PATCH v10 03/10] admin: introduce group
 administration commands



On 08/03/2023 12:55, Max Gurtovoy wrote:
> 
> 
> On 08/03/2023 2:34, Michael S. Tsirkin wrote:
>> On Mon, Mar 06, 2023 at 01:04:42PM +0200, Max Gurtovoy wrote:
>>>
>>>
>>> On 03/03/2023 15:19, Michael S. Tsirkin wrote:
>>>> On Fri, Mar 03, 2023 at 08:17:03AM -0500, Stefan Hajnoczi wrote:
>>>>> On Thu, Mar 02, 2023 at 07:01:56PM -0500, Michael S. Tsirkin wrote:
>>>>>> On Thu, Mar 02, 2023 at 03:19:12PM -0500, Stefan Hajnoczi wrote:
>>>>>>> On Thu, Mar 02, 2023 at 06:40:29PM +0000, Parav Pandit wrote:
>>>>>>>>
>>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>>>>> Sent: Thursday, March 2, 2023 8:05 AM
>>>>>>>>
>>>>>>>>> +When \field{status} is VIRTIO_ADMIN_STATUS_OK, 
>>>>>>>>> \field{status_qialifier}
>>>>>>>>> +is reserved and set to zero by the device.
>>>>>>>>> +
>>>>>>>> s/status_qialifier/status_qualifier
>>>>>>>> Missed from v10 of Feb.
>>>>>>>>
>>>>>>>>> +When \field{status} is VIRTIO_ADMIN_STATUS_EINVAL, the 
>>>>>>>>> following table
>>>>>>>>> +describes possible \field{status_qialifier} values:
>>>>>>>> s/status_qialifier/status_qualifier
>>>>>>>>
>>>>>>>> Can you please add other useful error codes in addition to the 
>>>>>>>> EINVAL?
>>>>>>>> Few that we are needed EAGAIN, ENOMEM, EBUSY, ENODEV.
>>>>>>>
>>>>>>> Please define a unique constant for each error condition that can 
>>>>>>> occur
>>>>>>> instead of sharing catch-all errno constants between multiple error
>>>>>>> conditions. If a driver wants to squash them together into an errno,
>>>>>>> that's fine, but I think doing this at the hardware interface 
>>>>>>> level is
>>>>>>> just propagating the mistakes of errnos.
>>>>>>>
>>>>>>> Only status_qualifier is needed and the vague status field can be
>>>>>>> dropped. It's not clear to me why adding EAGAIN, ENOMEM, EBUSY, and
>>>>>>> ENODEV is useful. They have no meaning to the driver, only the
>>>>>>> status_qualifier really indicates what is going on.
>>>>>>
>>>>>> At a high level at the moment we have only two cases:
>>>>>> - ok
>>>>>> - invalid input supplied by driver
>>>>>>
>>>>>> maybe we will have more reasons for a failure - remains to
>>>>>> be seen.
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> I'm sure you guys have discussed this previously, but please provide
>>>>>>> rationale in the spec because it looks weird to someone with 
>>>>>>> fresh eyes.
>>>>>>>
>>>>>>> Stefan
>>>>>>
>>>>>> Really most drivers just want to propagate errno to userspace.
>>>>>> All the detailed reporting is for sure well intentional but
>>>>>> in the end it is at best printed into log - end to end
>>>>>> people just end up with a switch statement
>>>>>> converting these to errno codes.
>>>>>> So we are passing them from device and this way there will be
>>>>>> some uniformity.
>>>>>
>>>>> Please clarify the rationale in the spec. I don't agree with it, as
>>>>> explained in my earlier email, but as long as its documented, 
>>>>> people can
>>>>> try to follow it.
>>>>>
>>>>> Stefan
>>>>
>>>> It's 2:2 for now, you are with Parav, me and Cornelia like it :)
>>>> Or I will try to document it better.
>>> I don't understand this status_qualifier as well and it wasn't 
>>> included in
>>> my original patch set.
>>
>> Sounds like you feel I should drop your S.O.B - is this the complaint?
>> I wanted to give attribution since I started with that but sure, no
>> problem.

please use "Co-developed-by:" for this patch in case you stick to the 
status_qualifier field that I don't agree with.
According to your comment that it was 2:2 between MST/Cornelia and 
Parav/Stefan, now it's 2:3 with Parav/Stefan/Max (if that can help 
deciding on this topic in a fair game way).

>>
>>> I vote for "status" that describe generic status codes and
>>> "command_specific_error" that should be inspected by the driver only if
>>> "status" is set to "VIRTIO_ADMIN_STATUS_COMMAND_SPECIFIC_ERR".
>>> We discussed this so many times before (and already agreed IIRC) and 
>>> adding
>>> this new qualifiers mechanism sounds not right to me and not 
>>> intuitive for
>>> device and driver developers.
>>>
>>> I suggest:
>>>
>>> 1. VIRTIO_ADMIN_STATUS_Q_INVALID_OPCODE
>>> 2. VIRTIO_ADMIN_STATUS_Q_INVALID_FIELD
>>> 3. VIRTIO_ADMIN_STATUS_Q_INVALID_GROUP
>>> 4. VIRTIO_ADMIN_STATUS_Q_INVALID_MEMBER
>>> 5. VIRTIO_ADMIN_STATUS_COMMAND_SPECIFIC_ERR (for more info read the
>>> command_specific_error field).
>>
>> I don't think it's a good idea, we'll have to agree to disagree.
> 
> Ok.
> can you explain why isn't this a good idea please ?
> remember that this is very common logic in many specifications and many 
> HW device implementation.
>>
>>
>> The point is simple. We can have a detailed virtio specific error.
>> Nice for debugging most drivers won't know what to do with it.
>> This is the status_qualifier.
>> Very detailed but
>> generally drivers will just have a giant switch statement translating
>> it to a simple error code for userspace.
> 
> how giant is this switch statement ?
> NVMe handles fine with this logic. Maybe you can take a look on that to 
> get some more ideas of implementing this kind of things.
> 
> Why do we need to add some qualifiers logic into our devices ?
> 
>> So to save everyone work, we also added "status"
>> a generic kind of error class that is easy to pass to userspace
>> with a small switch statement.
> 
> if you want something that is easy just pass OK = 0 and not_OK = 1 or != 0.
> Not need for qualifiers.
> In you case the qualifiers is just an extension for the status.
> 
>>
>> COMMAND_SPECIFIC_ERR is just way too much detail - commands generally
>> just should not fail it's a quality of implementation issue.
> 
> it's the way many specifications work.
> And this is the correct way for future extensions IMO.
> Each new command may have it's own namespace of errors extensions.
> 
> why we defer such essential decisions for the future ?
> We already introduces 2-3 admin features in the past (MSIX, feature bits 
> config, num_queues config, etc..) - maybe we can learn from it ?
> 
> 
>>
>>
>>
>>>
>>>
>>>>
>>
> 
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
> 
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
> 
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: 
> https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
> 

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

