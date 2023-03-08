Return-Path: <virtio-comment-return-4804-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAEFC678D5
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 16:20:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 638AC2AED0
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 16:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by host09.ws5.connectedcommunity.org (Postfix) with QMQP
	id 578702ACE8; Wed,  8 Mar 2023 16:20:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E72899866F1;
	Wed,  8 Mar 2023 16:19:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VD33DZc8xpoigQPYS6gafyVohEBb//wBcflR9RkN1XBLYhdOtFXmRY6uuufk/02icPXjlanUv8fhjM0lEGKUKEncrOepYE1u7Afbh7IpjXMUOgcm2vpJMnPkfV+hy82mdQCuW00hJnlJavKRF+r2+UNUUaUAjST/sXTxjMO5n+szGdr9H1e+AVRsYpNn670Gwx8cEt1SUIta5h7CLFx49sCHmSEW457yiBk9RdGKkz3cb8r3flJUh2GfdHzyTsoQstLw+vOs6ojdUqTxJj8mbFgnyszt4XtqMgtsYAB77dVTPvmOAR/1tFdww2zQGtikL4z9J/4UGMLlI5xoH2h2sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfwzRFWj0g+6EWCiDLdimojfkC1PhBHSBdFlRlrJVAU=;
 b=N9WLwm0sJmvVvN6oQF8xHIH5e4kLtOW+Jd5kyx2FltpXKT7cyN1nAKJJgbuYuE8ZMkPiswsTgtmXKmy6XB5SJmfuCshSW5kKeyowlHE37xFCD94qSHWtjXq1PvpJtap7Z9FgEHVAe8/Oo3yLpbyjUGm+XzxFeEvd556JX39YiR29LiWYO9CAgqqgx9gUk0DvMIZ9fau/GrkkzEnJbZs+ZUPtv070WHKZuCsch3LKjNkYaKG8MjzStsIuakb9pERnk0kkOJzeVDUyCMkMlv/MNLF/Zi63cR1FiBwbJcHM7Trt84z00BvNJOtUj3ZpfU/e+c7x0D6Q79DezUvlmfseSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <18ddbf69-19a6-3c6b-9e42-aaae66e20bcf@nvidia.com>
Date: Wed, 8 Mar 2023 18:19:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, virtio-comment@lists.oasis-open.org,
 virtio-dev@lists.oasis-open.org, cohuck@redhat.com, sgarzare@redhat.com,
 nrupal.jani@intel.com, Piotr.Uminski@intel.com, hang.yuan@intel.com,
 virtio@lists.oasis-open.org, pasic@linux.ibm.com,
 Shahaf Shuler <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
References: <20230303132840.GC2866370@fedora>
 <20230303083213-mutt-send-email-mst@kernel.org>
 <20230303202133.GA2901137@fedora>
 <20230305043419-mutt-send-email-mst@kernel.org>
 <20230306000302.GA244754@fedora>
 <7f63fa0a-7deb-5875-6c6b-bfc651681653@redhat.com>
 <20230306112030.GB35392@fedora>
 <853c78d0-f752-05e9-d79d-811e82801627@nvidia.com>
 <20230306162538.GA56760@fedora>
 <e74483a4-38fa-99b5-86b8-785f0b98d029@nvidia.com>
 <20230308141317.GC299426@fedora>
Content-Language: en-US
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <20230308141317.GC299426@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::20) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|MN0PR12MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e1711fb-cb5f-4bb9-02d8-08db1ff0f103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pCvuPhUUgVIny0C4CO0/XmNIu8bZ1Rha/rgfAm/gQDfaEa7Y9zfrpPuWhVU5+upSNbYaQSU3fGqxJ67/Ts77M0iiyyuQMNLxbncTJeapJLSD1dTo+UB0jdjg78kHdJC1OOjSdA8WKRiZrTEsFbI5nWmUvOgMHpk7V2GmzJgtP/SHPi40KSJUZ6WnaSdA7Zk/kfoffSOhw8zMYoKjU1ItfhwmwXKjC84zArQViYZWzYfF8pR0UdtVFgzxB/FPZfdpQgXCVgnmp4Dz0KQ+PKOKjgkFQfM3sAwEuzCxS+9mX+6xX+QOs+DZ5Ptc1Jm3tqIPPHC21XyleQSY9KDK/f6WBvoltzoL7mD9QJhqN9tNl/Z0j7DB4Vj7VWKRPAmzil9vd5yE0aMmXPMLoxH/AUZQbY/8c9DZkX4hnouV/SENvHh3jF+YaiE36OzrFssu/LHXTVR9PxMdNOQq+dI8wUjicDAOZRBgrs7KO0gsZ2n3bNCuWvt2qqAoVNaaLHhppRyfGeUfikhQ3ECbH+VXHq0DI2H+0GuUiafb/Oszf2u2JytKPgpKTGcKvR8opWzrTmtU0li/FkI62auwWtNxMNBnQY3OWZNuOchp1hnQDeVRhpN5TaY1ApjFHZsYhtZ7C+9Tw/ZfY2fdSdzUnMzVc/GzMvxNnwJiKfExOpaBp6hhVPwfGY25+ZrV2+3CPrJyKOjIABDhLJ8rzRAF1WSZkf9J3NJrpy6pZdoimhVMyg2n92Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(451199018)(107886003)(6666004)(7416002)(5660300002)(478600001)(86362001)(6512007)(31696002)(26005)(186003)(6486002)(2906002)(36756003)(6506007)(2616005)(53546011)(83380400001)(66946007)(66476007)(66556008)(6916009)(4326008)(38100700002)(8676002)(31686004)(8936002)(316002)(41300700001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nms3MWtIRGxLSkxneS82Vkl5L3l5NktaL0JhZzBrNDR0TElFNmRRQXJjcWlk?=
 =?utf-8?B?NVZndkgwQkd6Z0x5Q3ZrWFdhTk1pelNHcXJKdFJvczZ4dEQxSitIRS9DS3k2?=
 =?utf-8?B?cEs4d1dycFVSUFo4Qk1tUVU3Wm1Gd1RkNFB5Yk5zWllpSUlHejR5ZGJmcmN6?=
 =?utf-8?B?ak51VjhwL3NRUzRHc3ZzdlZuZVZkdHc4d0dRVWlmUjlXQ2NuYVIraFQyeGdu?=
 =?utf-8?B?UmY0dmtSdmh2NVdUMmw2bExPS0RiQ0IvNFU0b3owZS92OEsyckQ0Nld1ZnA2?=
 =?utf-8?B?OGtWUmRudFVPOFo3ZHhjd09NL084YXRFNk0vQkEzTk9ucklDK0ZLTXgvQVU1?=
 =?utf-8?B?Q1RXb05LdGdaY1FoTFFGRjJOKyt2OUQxWHlkWVJXekdHYUZKUW4wZXhBdzNZ?=
 =?utf-8?B?K3NybnNEbE5ybituZlVLZVNJRWZyc2dtdkM2WmlJMUh5di9MOWRsWExlWHdB?=
 =?utf-8?B?bkxObHJHOW9yeDBwbzdQNGJIdHB6THJhTjVnS0o3QnozZHlJb01ueE40Yjgr?=
 =?utf-8?B?Z2t2d1hWTTNrNHFDSURrOHVnNVVScXJPbGVZRWdXcVEyNzh3OXJWQ0NQdlBn?=
 =?utf-8?B?STZZMERwTXVrUzIwYkhvdUNHN3dZVnFkUEpXdjlMVk5zWkMybkhiNmU1M3pR?=
 =?utf-8?B?cGlqckhWRktuOU9yclM5WnB6MC9zL0wxcnZaTVRCK29Za2J3b1hGUThzSXI3?=
 =?utf-8?B?Z20rTzFaWUtNVU9iQXkrSWZ2REdRazZBOCsxRk9BVkc2bGYxeW9tNTZUQmdx?=
 =?utf-8?B?ZzhETGtlS28xYllpRitOMHhjRkUzK3p4dXRBYkdUaVh2T1BUcFRHNGVIbzNw?=
 =?utf-8?B?cjIyVmQyc21JSENydFIrSTlVOXk1bGxSa3BRZkxuU2FWdjN1bk5xcDdJUlBz?=
 =?utf-8?B?UVc4cFNGeWZlUGhad0IwaGphUTVodXcxTEt6NG5kM2FXVWtHaDhZTzJDdVZH?=
 =?utf-8?B?UFRTSU5STFAvaTlpSVVSdENXeFR1ZnZlam5LWDBnMkg5MlY4M0swRllVRmxz?=
 =?utf-8?B?Zm8vWTVPeEkzOEx1SkZHVDROaEtWWi9nMXRvamlOM0FRNk1IK0crOWdvaWRY?=
 =?utf-8?B?WGNXMDNrM3g2NkpsU0t3VHJDcWNTSGNQV2d3alBha3d6Qmx4R2dKblBXcVhV?=
 =?utf-8?B?UVZzTm9QdStJVGE0S0o0bG5COUZYUy8vSkh0TEhTMFV2VjRkRVhSa2pueFU5?=
 =?utf-8?B?Ty9OK2thd2JTOVJzSktzT2dzQlZyWXRnZS9tWWZhc3pEcjR3M3o3c0ZEOHU0?=
 =?utf-8?B?d1RzUjNXZ2gyaS9tUmZISXpTcmw5ZzBqRUNOSll4UUpPT05vS2EwakNyTnpB?=
 =?utf-8?B?UDBsQTJkYndFd01MM3VlbWZYdUxYc1lLdnF0L2F3Zkd6aHl6bGZ4QXB1TEFZ?=
 =?utf-8?B?aGY1SEdLWWd3NjJFbytFUmdiQW1qdS9qcmNmYWlKNkwxY2MvSWgwSmt6SHRC?=
 =?utf-8?B?bU1lUjVyc3VWZVNZVjhDOWpPTjNNdFI0L0tyR0FVa2I1QmZCQWU2TXV3S2F5?=
 =?utf-8?B?NVhDNk1UQU9xb2puSVc5TVRtazZwVVh5WDNGWXpPUFBLaXpyd3FnNk5yd1Bs?=
 =?utf-8?B?QkhYM0ZNcUdkaytsSkhBRHlRRmVqVW9TUHNkVWNZK0R3R3A2MG9PdmZoVW1h?=
 =?utf-8?B?TnRPSUlydDlSb0Z0dUxDbjJDNE4xc2JhZ0dKVDFKN3lEcGU3NTg1M3NMMVlt?=
 =?utf-8?B?UXE2RTFDdUErQ0x3M0tCNVVFMnRqRjJrYk1ZWnFlc0ZMVHd1akRzS3NCM1ZK?=
 =?utf-8?B?bkIxOE9CTGNuUlpiVDY2aTNBMFNNeWFzOHRJN3FWeVVJM3pWVXRGdlUybElZ?=
 =?utf-8?B?SVNJYm5Ocm5UVXhnSXlTeTRMWFpZcXNzS2pjMEM5Um0zNTR2Tnd1Tnl6dHJX?=
 =?utf-8?B?NjFIdys1VzhXQXY5Q2FidzFnQ1E4RjVsV2EveEM2RVVtNkc2YWhUUFN1aHdB?=
 =?utf-8?B?aFZKbHlsZm9HcUM0UHdvbUZ5bXZocHRneC80Rzc4dlUwUWpFOHhuc3I5eE5k?=
 =?utf-8?B?Z0kzaGFRTFk4N09vREtRSEpUcFdPYmk1RXIxMDJNQzBaemFMZWdkeFZyUlc2?=
 =?utf-8?B?T3RQTm9YM3orRmREdFRjaGcyNmxUK3psdDREV3MrcHdZdFloUU9qSmZsVVhv?=
 =?utf-8?B?alpxZXFoMStvMzI0NElxcVR1d1dNSzh4b0lmd3llQnc3R0JuY1VVeGNnMU5N?=
 =?utf-8?B?WXc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1711fb-cb5f-4bb9-02d8-08db1ff0f103
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 16:19:50.2123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YRuaODhxzCgXkfcb/TuqdIDYNgqa6GWQyYF95XlbY87zNXJSCMuNvBq1xCtIF68juJaoMrICDfX3fInhy3njA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6149
Subject: Re: [virtio-comment] Re: [virtio] Re: [PATCH v10 04/10] admin:
 introduce virtio admin virtqueues



On 08/03/2023 16:13, Stefan Hajnoczi wrote:
> On Wed, Mar 08, 2023 at 01:17:33PM +0200, Max Gurtovoy wrote:
>>
>>
>> On 06/03/2023 18:25, Stefan Hajnoczi wrote:
>>> On Mon, Mar 06, 2023 at 05:28:03PM +0200, Max Gurtovoy wrote:
>>>>
>>>>
>>>> On 06/03/2023 13:20, Stefan Hajnoczi wrote:
>>>>> On Mon, Mar 06, 2023 at 04:00:50PM +0800, Jason Wang wrote:
>>>>>>
>>>>>> 在 2023/3/6 08:03, Stefan Hajnoczi 写道:
>>>>>>> On Sun, Mar 05, 2023 at 04:38:59AM -0500, Michael S. Tsirkin wrote:
>>>>>>>> On Fri, Mar 03, 2023 at 03:21:33PM -0500, Stefan Hajnoczi wrote:
>>>>>>>>> What happens if a command takes 1 second to complete, is the device
>>>>>>>>> allowed to process the next command from the virtqueue during this time,
>>>>>>>>> possibly completing it before the first command?
>>>>>>>>>
>>>>>>>>> This requires additional clarification in the spec because "they are
>>>>>>>>> processed by the device in the order in which they are queued" does not
>>>>>>>>> explain whether commands block the virtqueue (in order completion) or
>>>>>>>>> not (out of order completion).
>>>>>>>> Oh I begin to see. Hmm how does e.g. virtio scsi handle this?
>>>>>>> virtio-scsi, virtio-blk, and NVMe requests may complete out of order.
>>>>>>> Several may be processed by the device at the same time.
>>>>>>>
>>>>>>> They rely on multi-queue for abort operations:
>>>>>>>
>>>>>>> In virtio-scsi the abort requests (VIRTIO_SCSI_T_TMF_ABORT_TASK) are
>>>>>>> sent on the control virtqueue. The the request identifier namespace is
>>>>>>> shared across all virtqueues so it's possible to abort a request that
>>>>>>> was submitted to any command virtqueue.
>>>>>>>
>>>>>>> NVMe also follows the same design where abort commands are sent on the
>>>>>>> Admin Submission Queue instead of an I/O Submission Queue. It's possible
>>>>>>> to identify NVMe requests by <Submission Queue ID, Command Identifier>.
>>>>>>>
>>>>>>> virtio-blk doesn't support aborting requests.
>>>>>>>
>>>>>>> I think the logic behind this design is that if a queue gets stuck
>>>>>>> processing long-running requests, then the device should not be forced
>>>>>>> to perform lookahead in the queue to find abort commands. A separate
>>>>>>> control/admin queue is used for the abort requests.
>>>>>>
>>>>>>
>>>>>> Or device need mandate some kind of QOS here, e.g a request must be complete
>>>>>> in some time. Otherwise we don't have sufficient reliability for using it as
>>>>>> management task?
>>>>>
>>>>> Yes, if all commands can be executed in bounded time then a guarantee is
>>>>> possible.
>>>>>
>>>>> Here is an example where that's hard: imagine a virtio-blk device backed
>>>>> by network storage. When an admin queue command is used to delete a
>>>>> group member, any of the group member's in-flight I/O requests need to
>>>>> be aborted. If the network hangs while the group member is being
>>>>> deleted, then the device can't complete an orderly shutdown of I/O
>>>>> requests in a reasonable time.
>>>>>
>>>>> That example shows a basic group admin command that I think Michael is
>>>>> about to propose. We can't avoid this problem by not making it a group
>>>>> admin command - it needs to be a group admin command. So I think it's
>>>>> likely that there will be admin commands that take an unbounded amount
>>>>> of time to complete. One way to achieve what you mentioned is timeouts.
>>>>
>>>> I think that you're getting into device specific implementation details and
>>>> I'm not sure it's necessary.
>>>>
>>>> I don't think we need to abort admin commands. Admin commands can be
>>>> flushed/aborted during the device reset phase.
>>>> Only IO commands should have the possibility to being aborted as you
>>>> mentioned in NVMe and SCSI (and potentially in virtio-blk).
>>>
>>> It's a general design issue that should be clarified now rather than
>>> being left unspecified.
>>>
>>> I'm not saying that it must be possible to abort admin commands. There
>>> are other options, like requiring the device itself to fail a command
>>> after a timeout.
>>
>> do you have an example of timeout today for control vq ?
> 
> Do you mean the virtio-net control virtqueue? I don't think it has any
> commands with an unbounded execution time.

Correct. So why introducing it now ?

> 
>>>
>>> Or we could say that admin commands must complete within bounded time,
>>> but I'm not sure that is implementable for some device types like
>>> virtio-blk, virtio-scsi, and virtiofs.
>>
>> No we can't.
>> Some commands, for example FW upgrade can take 10 minutes and it's perfectly
>> fine. Other commands like setting feature bit will take 1 millisec.
>> Each device implements commands in a different internal logic so we can't
>> expect to complete after X time.
> 
> When I say bounded time, I mean that it finishes in a finite amount of
> time. I'm not saying there is a specific time X that all device
> implementations must satisfy. Unbounded means it might never finish.

There might be a chance that any command for any virtio device type will 
never finish. Nothing new here in the adminq.

what one can do is to set a timeout for himself and if this timeout 
expire - check the device status. If it needs_reset - do a reset. if 
status is ok, then wait some more time.
After X retries, unmap buffers or reset the adminq.

> 
>> Device can go to so FATAL state in case a command is stuck and causing
>> internal errors in it.
>>
>>>
>>>> For your example, stopping a member is possible even it there are some
>>>> errors in the network. You can for example destroy all the connections to
>>>> the remote target and complete all the BIOS with some error.
>>>
>>> Forgetting about in-flight requests doesn't necessarily make them go
>>> away. It creates a race between forgotten requests and reconnection. In
>>> the worst case a forgotten write request takes effect after
>>> reconnection, causing data corruption.
>>
>> For making it work without data corruption we need a cooperation of the
>> target side for sure. But this is fine since the target in that case is part
>> of the "virtio-blk backend".
>> One solution is that the target can decide it will flush all the requests to
>> the storage device before accepting new connections.
> 
> This solution shifts the unbounded time from disconnection to
> connection. The Group Member Delete command will complete quickly but a
> subsequent Group Member Create command for the same underlying storage
> device would need to wait until the requests are done.
> 
> Therefore I think the admin queue must be designed under the assumption
> that some commands take a very long time.

For sure an admin command may take long time. FW upgrade can take 10 
minutes for example.
But each device is free to implement internal logic as he choose.

Same for live migration, when we stop/quiesce a device we must make sure 
it doesn't master any DMA operations. Thus, in some implementations we 
need to wait for all inflights to end fast. In others, we can invalidate 
the access to host/guest memory and wait for completions until the 
freeze state.

Bottom line, this is device implementation specific consideration.

> 
> Stefan

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

