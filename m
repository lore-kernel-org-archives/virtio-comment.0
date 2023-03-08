Return-Path: <virtio-comment-return-4772-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DAEC64EC4
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 11:17:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E7E112CAD4
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 11:17:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D16549866F2
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 11:17:45 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C296A9866ED; Wed,  8 Mar 2023 11:17:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B05D99866EE;
	Wed,  8 Mar 2023 11:17:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbGCTKjiiIRGRH1VcAn6EvVuc2A+/xt4TduK7hvGWIL5/0EsKV6t2AegBX5O9R2ECZgHz34PJ5tOKtu8iEGucmG8ndDSSZ2B4PdFvS8AzeBzxXiPOs7Q70dw37S4W9tWaBxTTZj3t0rVOL6dOp3EYgbUX9ClUH3Lis6hjPD4RuDWJVt7rPz96siS3PXLAuduIKWaDtqUjm8Ai5bsAL+hpGFXXx4tvWTAU9V4ZqYHaj7yv12+0NmTJWyTAvTvsLAWcSQrqxAVEPqbDjs2lG6JF7uBik1CWKiW5xVyB9Tbd2uDVOjJKT1lKaf9L7e+VHIvxPpTAGHgQMG2ADFzBk4fRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgq352exMwNHmAZI7WWhZ2chAsPwIoxX6cg7KHidUwk=;
 b=f6oFH1Jo0UI5qFSSTjt5Ux3T6dqbJyD5+/KQD4vQ2n1iwzpraJAeMVw5ho7zIsvtWkia5aqQNvB8adWXHebxEiODsdxcss2rbGT1Zq2XZKqgmLSLIcA1NQnGbdCyyNZN8YXcrJ4fcDqrFAZ7wMf6Ffl1c0V9ZLBr4De+iDjS0pMUx3W72cCr6iyl2VnQc/xfsNi5J7yEvwErZE0HKTduts7h1T9NjjnLjEu5XB0rf8A7z5BQYktMdG9cJh5kpD2X2Te9zkBMSoRX72qBnrqMX4az1h4FxVWggySrZ2+Tx8Ylu1aq0EBY9vCwsYQ5/Elc0Q1cFTCdXkf3SQkHPMctGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <e74483a4-38fa-99b5-86b8-785f0b98d029@nvidia.com>
Date: Wed, 8 Mar 2023 13:17:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, virtio-comment@lists.oasis-open.org,
 virtio-dev@lists.oasis-open.org, cohuck@redhat.com, sgarzare@redhat.com,
 nrupal.jani@intel.com, Piotr.Uminski@intel.com, hang.yuan@intel.com,
 virtio@lists.oasis-open.org, pasic@linux.ibm.com,
 Shahaf Shuler <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
References: <20230302204007.GD2554028@fedora>
 <20230302190230-mutt-send-email-mst@kernel.org>
 <20230303132840.GC2866370@fedora>
 <20230303083213-mutt-send-email-mst@kernel.org>
 <20230303202133.GA2901137@fedora>
 <20230305043419-mutt-send-email-mst@kernel.org>
 <20230306000302.GA244754@fedora>
 <7f63fa0a-7deb-5875-6c6b-bfc651681653@redhat.com>
 <20230306112030.GB35392@fedora>
 <853c78d0-f752-05e9-d79d-811e82801627@nvidia.com>
 <20230306162538.GA56760@fedora>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <20230306162538.GA56760@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::13) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|DM4PR12MB5724:EE_
X-MS-Office365-Filtering-Correlation-Id: a0dcc2a3-2b94-4523-4c5b-08db1fc6bbe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vpUbclQGtFXtGTwEu+MqRzBHWr7Np4LojM6jKOvfqsyPw0fq+rPoo25f10kJ/V6kreaB+q7YaIckVec2+6MfFgFAyvX+g3R31LqWWX+nWXzHUmJ+wzHYUE1o7LW6wFYi7pdZG4xkqSYm8806ETefb13RgBOdA0Jjkk2t3nFf4FVQ0ihojqzu8q4Anb1Vx4WGzTKmCq3L2M28CbifJtiavrXjppS/ehmIgID3K61FafllzmqaoXFqRdoUlM7/xV6klTXpdu9eNyUPyF73NTbqUYkFP7EiGtNsijbS/C2OU4OkYCRGNXkL0fHGdA1q5ZLrdWoo6wQR74Y3Yh2YL0ImMCt3T1xfcrcDoBFjBXHi7VJjBp8aRTDQtfS/+pJoAP6tXf7Nr+VNJfY4ynIcLc0ujtA49sVC5oKMAtskUILzsaxeNZTLBFzv3nClNjAtdR/slMTPO6KyXa7LvaB0WtG1fisTsuUFMF0+2CZxAmTWwoSqNYEvhyWncWJdP61j+UW8ocOI5l482GbQJiKRtrUxYfkYaLfs+rfM11rpQBzjEkgIFKTZnq8JWyfJHNXokiEcyKLddc8m8S/2kK/ypi+7RoW6gPlJhiva6NfdP+jW3czRPX2xEvFQEoCMedUqOdqMNctP/Qja4kWIWSQzcl7NdwEM3COs59fpUBOwGchyR58i9R460CVMUNwW7DORRPhS2K5zJog5frjTgQhN+YiWI2B/f5J560pP4DQMj9Qqkvs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199018)(107886003)(36756003)(83380400001)(6506007)(53546011)(41300700001)(186003)(6512007)(5660300002)(6666004)(2616005)(6486002)(8936002)(66946007)(31696002)(66556008)(4326008)(7416002)(8676002)(86362001)(6916009)(2906002)(66476007)(38100700002)(316002)(478600001)(54906003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2w5b2ViY0Jsczd0KzhPUVRKQTN4SWxDc3RPV2JlWDBCQ29YMnBlMXJ4QU5G?=
 =?utf-8?B?VGV5ZGQwRU5aQ0ZBRTNxVHJObURIMkNKeCtMVGg0cSt5bTUxU1U2L2pLUi9T?=
 =?utf-8?B?Q2hwWEJqNWNGR0tBK2w0aXJrbWhWeTBRdm85MjVibUhRSjlKWFpWamE3WWdk?=
 =?utf-8?B?QjVUVDhxdW5RQzgvZDFoZEV4RUtXbDNkV3lqdzIzTFczTUZHYmVvc0VhOW1Z?=
 =?utf-8?B?cFNzS2dSMU9tQW9jOU9taDMwQ3JBTXZDcmdjR0c1bGRuTTNqSlM2elVLU1A1?=
 =?utf-8?B?bk45Z0I1T0lkSkh0c3Ntc1drM2NXRzlOcDJqRFdLcTZwZWpJOUFlWm45RFZ1?=
 =?utf-8?B?RW00OWY5VTh4TjkvTU1pZ1Rqb2F6dzFRVzZmTHZNMVAwUERTMW9oWEtMNUtt?=
 =?utf-8?B?dDU5UGR5SUZVTUk5MFhnUWJvaVkxNDE4Z0orU3hvaHR4QmlQa2ord3g4ZFhn?=
 =?utf-8?B?RCt4b1lLTFVCcTNqTEdjemtzWTJKL0t1U0UzSWVFd3dxZDFpRjN4MnY4dzVU?=
 =?utf-8?B?STZZb0NrL3pvYUoyYzZXRHMrVnFyWjQ5VXRpcHBzWkcvbmM3M0lacTJ6VUtE?=
 =?utf-8?B?UDdYSGxveGdJTEI4bDFDRm1XeUNCWDBjY0paRjI5cE5MT2V2b0Jnd0Y5RWhz?=
 =?utf-8?B?MWo2b1hYVFZ6S251ZUtxM2JjK25IaG54cG5nc2JTb2dlQkhYVVFEUzUreFRw?=
 =?utf-8?B?em1hQUQ2NEM3U1VxMkdESVoreVlERWNFMWYxN04zOC9xUEVxN1NJMkhCVEdn?=
 =?utf-8?B?eEN0TEM1UlZETmU2QzJ4SmViZDNlRFdKanNOMDQ3ak5aQkVqalZtQ1UvbVRp?=
 =?utf-8?B?eXhkSTZiTE1NSkc2dWpQKzJVaDRYNnhNd2tCVHJ1RFpFQUJVRFoxUmV3WUhk?=
 =?utf-8?B?d2pxR1FseS9JTEhxd2NPTnlOK3ZITWVDcitCMkZTVVN1dmJHam1rSlRQUUVi?=
 =?utf-8?B?ZlhzQ2pJYVNrM09RYVNFZVBzVDUrV29YUXNjeDAvQVBwbU1URjBrcGFGNGox?=
 =?utf-8?B?by9ma2w5QVdzSFgwWWw5M1RXTExsZ256dDdYTUtYWW1PNXNaaXFWN1JlOHpX?=
 =?utf-8?B?SFRwYzhNa0sycUVyeVNGdmFvS1pJV0Fqd0YvaVRxY0YzY2lkbmY4ZTlGdG1O?=
 =?utf-8?B?akVyamVnUUU3eGdBeUFjY1VkbkZpclkwNVY5Y0pWZEc4TldDMnY2VTV0M3B2?=
 =?utf-8?B?LzZXVkpiVjJGbkpWUkVYRUhyKzZNemx1Q04rdGM3VkxVS0F3YXFoMFYwWVJp?=
 =?utf-8?B?SFJBSlFjVmxaQVBKUzVJK2h3aHBkSUgwU3VxTWNlKzJMOTlhc2RJc0pqVHZN?=
 =?utf-8?B?TndraGlnTC9vT2FTMHh2TTZEdEdZNDkwUnVMeE10RWg2VUZXeFlOaTdGY1Vp?=
 =?utf-8?B?b2NFaVFNd2pJWEQwTjlwV0lDaEFra2FEQno3RlBDNHpOc1ZBYXRoUG5TOHcy?=
 =?utf-8?B?TEllTmNHVm5uY0kxdEs0TzZoQ1VqUjEzL2UwTmVSNFBqakdHOXlFMFAzeXJi?=
 =?utf-8?B?RXVnLzMxTzhIMUFlVlN2eXlRWFUxUmFUcFF3MmFsSUZEZVQ5MVNqdHZlNHRs?=
 =?utf-8?B?d2QxOWtYanFPSndUZ1ovanArQ3pjV1RjMlR6K0gwTTkwZDJpN3BDTDlxd0pl?=
 =?utf-8?B?aGErUmxrZ1E0bndMaEF6dDkxKzlkTitPVElsK1dFaFR4Qm5LL25xNEdKSkhj?=
 =?utf-8?B?Y2VBdSthSGZyR1RxZFdGcmtMcTIxRE1oSmxUNmp1eW9zOExHeVRPNjlwQVVp?=
 =?utf-8?B?eFExWnRGK3BnSjl3RktzQXVYNU4rQStGQmhJaWF6SUo5bkVNUlB1cGU2VzZQ?=
 =?utf-8?B?MDYzT1RwUFVjeldSNERNUmw1UFpyWkU0LzFCN2FLWWsrSncxeklwMFhVL2Vy?=
 =?utf-8?B?OGVrcmNuTDBodkNPWUlXV2swajVoZFJ6ejNpWVNjTW5OZ1dPUFNGZnRVcFM4?=
 =?utf-8?B?SVBoalIrMW5NcGtDS0R2TFFtK1VlU3ZheXoyUnRhaW4wUFNBM2ZDeVpadWZm?=
 =?utf-8?B?ZE1KVE1pK3hhc0FzV3Y2cUViaFFiamx5QzZOa05wWVRMK1NFcFV1RWpQU1J2?=
 =?utf-8?B?NXArYzFaVDRDMkxoNXBRNkp1NVNBclJ0aW5WMGV2SExZUVNvQ2pzTUFyWXZz?=
 =?utf-8?B?STZQU2xqdjcrbmY1bmFGZmFGZlFPN0ZWZGllVExMSWhva3hVNEwzby9HRUZ2?=
 =?utf-8?B?V0hQamdxdlJKNU56VnFLbUt1MUExbEhFcjdDN3RRVmdSTjlsZUlQcWVTQTNO?=
 =?utf-8?B?dCtrazZVZWxDL2xzK3pIeGt4RDZ3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0dcc2a3-2b94-4523-4c5b-08db1fc6bbe9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 11:17:42.2171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VI+YlM0gSmihVoS9IhfK5tb4ayF+R4TCC7AMvPSwJczW8YpIfReetuQCmtIEtXXF7xfL7/nUR/noBdnPyQkmsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5724
Subject: [virtio-comment] Re: [virtio] Re: [PATCH v10 04/10] admin: introduce virtio admin
 virtqueues



On 06/03/2023 18:25, Stefan Hajnoczi wrote:
> On Mon, Mar 06, 2023 at 05:28:03PM +0200, Max Gurtovoy wrote:
>>
>>
>> On 06/03/2023 13:20, Stefan Hajnoczi wrote:
>>> On Mon, Mar 06, 2023 at 04:00:50PM +0800, Jason Wang wrote:
>>>>
>>>> 在 2023/3/6 08:03, Stefan Hajnoczi 写道:
>>>>> On Sun, Mar 05, 2023 at 04:38:59AM -0500, Michael S. Tsirkin wrote:
>>>>>> On Fri, Mar 03, 2023 at 03:21:33PM -0500, Stefan Hajnoczi wrote:
>>>>>>> What happens if a command takes 1 second to complete, is the device
>>>>>>> allowed to process the next command from the virtqueue during this time,
>>>>>>> possibly completing it before the first command?
>>>>>>>
>>>>>>> This requires additional clarification in the spec because "they are
>>>>>>> processed by the device in the order in which they are queued" does not
>>>>>>> explain whether commands block the virtqueue (in order completion) or
>>>>>>> not (out of order completion).
>>>>>> Oh I begin to see. Hmm how does e.g. virtio scsi handle this?
>>>>> virtio-scsi, virtio-blk, and NVMe requests may complete out of order.
>>>>> Several may be processed by the device at the same time.
>>>>>
>>>>> They rely on multi-queue for abort operations:
>>>>>
>>>>> In virtio-scsi the abort requests (VIRTIO_SCSI_T_TMF_ABORT_TASK) are
>>>>> sent on the control virtqueue. The the request identifier namespace is
>>>>> shared across all virtqueues so it's possible to abort a request that
>>>>> was submitted to any command virtqueue.
>>>>>
>>>>> NVMe also follows the same design where abort commands are sent on the
>>>>> Admin Submission Queue instead of an I/O Submission Queue. It's possible
>>>>> to identify NVMe requests by <Submission Queue ID, Command Identifier>.
>>>>>
>>>>> virtio-blk doesn't support aborting requests.
>>>>>
>>>>> I think the logic behind this design is that if a queue gets stuck
>>>>> processing long-running requests, then the device should not be forced
>>>>> to perform lookahead in the queue to find abort commands. A separate
>>>>> control/admin queue is used for the abort requests.
>>>>
>>>>
>>>> Or device need mandate some kind of QOS here, e.g a request must be complete
>>>> in some time. Otherwise we don't have sufficient reliability for using it as
>>>> management task?
>>>
>>> Yes, if all commands can be executed in bounded time then a guarantee is
>>> possible.
>>>
>>> Here is an example where that's hard: imagine a virtio-blk device backed
>>> by network storage. When an admin queue command is used to delete a
>>> group member, any of the group member's in-flight I/O requests need to
>>> be aborted. If the network hangs while the group member is being
>>> deleted, then the device can't complete an orderly shutdown of I/O
>>> requests in a reasonable time.
>>>
>>> That example shows a basic group admin command that I think Michael is
>>> about to propose. We can't avoid this problem by not making it a group
>>> admin command - it needs to be a group admin command. So I think it's
>>> likely that there will be admin commands that take an unbounded amount
>>> of time to complete. One way to achieve what you mentioned is timeouts.
>>
>> I think that you're getting into device specific implementation details and
>> I'm not sure it's necessary.
>>
>> I don't think we need to abort admin commands. Admin commands can be
>> flushed/aborted during the device reset phase.
>> Only IO commands should have the possibility to being aborted as you
>> mentioned in NVMe and SCSI (and potentially in virtio-blk).
> 
> It's a general design issue that should be clarified now rather than
> being left unspecified.
> 
> I'm not saying that it must be possible to abort admin commands. There
> are other options, like requiring the device itself to fail a command
> after a timeout.

do you have an example of timeout today for control vq ?

> 
> Or we could say that admin commands must complete within bounded time,
> but I'm not sure that is implementable for some device types like
> virtio-blk, virtio-scsi, and virtiofs.

No we can't.
Some commands, for example FW upgrade can take 10 minutes and it's 
perfectly fine. Other commands like setting feature bit will take 1 
millisec.
Each device implements commands in a different internal logic so we 
can't expect to complete after X time.

Device can go to so FATAL state in case a command is stuck and causing 
internal errors in it.

> 
>> For your example, stopping a member is possible even it there are some
>> errors in the network. You can for example destroy all the connections to
>> the remote target and complete all the BIOS with some error.
> 
> Forgetting about in-flight requests doesn't necessarily make them go
> away. It creates a race between forgotten requests and reconnection. In
> the worst case a forgotten write request takes effect after
> reconnection, causing data corruption.

For making it work without data corruption we need a cooperation of the 
target side for sure. But this is fine since the target in that case is 
part of the "virtio-blk backend".
One solution is that the target can decide it will flush all the 
requests to the storage device before accepting new connections.

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

