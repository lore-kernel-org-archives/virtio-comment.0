Return-Path: <virtio-comment-return-4705-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AA1C64EC4
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 15:28:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 607E767045
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 15:28:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5260F9866BA
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 15:28:14 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 41DA79866B8; Mon,  6 Mar 2023 15:28:14 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-Id: <virtio-comment.lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2ECEE9866B9;
	Mon,  6 Mar 2023 15:28:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5Z6Mz9nEUvt8+m2534CuL3u9XSZnLBNKZPSd/2aeoRHArQ9vCqfUmf63ZAxcfGqnw6xH0wG/OiLYklXKHhM+TvivFdpGTEwnEPBvI3/8wnXbENR5qwKFA5uQ6+vGQRF2FsRwvkGLgTMnCfslscl4edB+v4H4XOXgO1yzJJx86OXeA3+yOznUNkc3XyUb4wnIBcUfsiv+SupFirxJ1jnsWYw92DEfg9uUyws1kMkR/1EcB/YZfj34wCq3oss1bSD2wG07VIG7Nbg1hEiWGHeikNaMKT3MFBTDamALHECXpsDZ+N5xcfXfbk+aSCrBrNo9L5YGzn0smhunVt2aew3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEyb8l/wpHG2IQpXjWrokV2CoFjsKOWjSwRjr+A7yn8=;
 b=Eb85UJryoOl6sW34BVUVRZqH1i9g6VyHYkPzKMF4JuK8d2WMcxG4RzkcSLokQvVkDihRdf5+DJVVZSPA6xhnu8zbvJuLvzq5pov9uIdYD/jduowu5ooLT49gevn8WjQzBj/7bIErkDgeZh1sc9g77CtVRaMBjpvt8/rj8vu/e99LkUIhZ3GCE3UYb52KJg7ivVvN1l0uHfuoZBSIhiFi3HGz9fcG627TWcx8abyqmu0qt9HTiDI8R3RxRaBAN0wjh1Qw9iMXQNOjUzsyTtC9MefFRni7y2ED7Uex7HSqWTWZpUnswbd4TguKBh4m7EMmm0Hk2tzb3cKsNBl0YmLgoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <853c78d0-f752-05e9-d79d-811e82801627@nvidia.com>
Date: Mon, 6 Mar 2023 17:28:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, virtio-comment@lists.oasis-open.org,
 virtio-dev@lists.oasis-open.org, cohuck@redhat.com, sgarzare@redhat.com,
 nrupal.jani@intel.com, Piotr.Uminski@intel.com, hang.yuan@intel.com,
 virtio@lists.oasis-open.org, pasic@linux.ibm.com,
 Shahaf Shuler <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
References: <cover.1677761896.git.mst@redhat.com>
 <20c81b66f0b21b5bd646c24840ac3f8462c86acf.1677761896.git.mst@redhat.com>
 <20230302204007.GD2554028@fedora>
 <20230302190230-mutt-send-email-mst@kernel.org>
 <20230303132840.GC2866370@fedora>
 <20230303083213-mutt-send-email-mst@kernel.org>
 <20230303202133.GA2901137@fedora>
 <20230305043419-mutt-send-email-mst@kernel.org>
 <20230306000302.GA244754@fedora>
 <7f63fa0a-7deb-5875-6c6b-bfc651681653@redhat.com>
 <20230306112030.GB35392@fedora>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <20230306112030.GB35392@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::12) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|SA3PR12MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: 4921bbc0-095d-4544-c435-08db1e576521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xQN1bLzS3V/dpDsQSclT2G3rHdSle+VwotoxtkVoMKYhuibGrrFt6EAWoEU/KcSlKwfeKxo2NKOq8ooZap2iceEvuzkQqyF9X9xHtkCNb11WJ6P6P1VVrvrt/LPQHuR5xT/Tt9ACS/EvVHtiUSaG5j1yjgErx4oaFhd0EcLHxjZIO5Ad8Wop8Wk/NBjahuVTAydVCGSy1cBhS5NtKGYCBoDdYF9nqd7hYc2XXzwT0Vw30OPcNJTyPO7ELTFQfR8IKdb/8InISPFF3lL2lp1+KUiUXbGuclH28m6bpBnXwpxtEle2ntSdQqAcboAS1zAGP7P7864v8Pme53hcdPekt/Xdp1GuDxDDGMuP1I8kcq7ys2VGdVu/iNNitIRCzmxl5MeWw1IXknwzUieKnxdECgFWOy05lbGcLeTsKxv6maBK6tnBBmKJ8rT6DNJPFJdvGfgXrPDl3RYpZMF0poIKAhexmQBzIFDrfo8VPTkACWX6oyL2/9z+wHgZcZlVWeNak8PfQcL/I9PEFgpdawn3+/Zx4r4Uo015A2uYiJfNQS9FlIPSbOrcksQDwco96IJACs+Un6ip2foXvoj5Mjkc5N0u15V05QLJXicYLTgmZV4hwJLKefl/6/h52vyOW8dWX9i+sQ4MLCTKzBmFavAV9wYfUxsgX3EPjDw6QAg5/ieSl94+emjhqFykSse+SLyPr9x8plV+xZu52XpsyWQV8Q1X4O7sY4tYy3RcrBXfC8o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199018)(31686004)(107886003)(83380400001)(36756003)(110136005)(478600001)(54906003)(316002)(38100700002)(2616005)(5660300002)(6486002)(6666004)(6512007)(6506007)(53546011)(186003)(26005)(41300700001)(7416002)(66476007)(66946007)(8936002)(8676002)(66556008)(4326008)(31696002)(2906002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M24xSUp5cWNWQXo2YkFmMUExeE85d2pNRmpGMzhIT1luMlhlRjQrWWNwUi9h?=
 =?utf-8?B?RWcyY3VnSlpDN2NLK2VSRVV2RStLUzE2RzN3SzRZbDljM2l0KzByTHFLWXA0?=
 =?utf-8?B?U3R6S1BkN0NrcUpDODgzK1BnaXdOM1EyaDNwYXptMlh1Zm93amhtSFNMM211?=
 =?utf-8?B?bDN1Q1lvbnZsL2p2UFo4aU13Tk9qSWNXS21lL3V4Z3RtUjFPelZaL00xVnIy?=
 =?utf-8?B?aVVrMStMWXRaUE1FaDFzVmptSUVrekNoUUhLMmhYZENzcXRzMTVMSlo0RkZS?=
 =?utf-8?B?a0o1bTJWaU1oUnBJZks2RWdwY2V2VldNN3A2LzZVb1dOMXdBT2h0WG9Ea0pV?=
 =?utf-8?B?MTdMUUZMbStZMzdoL1BpbVJGaFFvc0FGNDdKUndNVmJtdk1CNVhwRUtCdSs4?=
 =?utf-8?B?MjYxMUFXb1Q0M3hENlpCbjltMFBrNzlTa2FYYUIwbHNUTUcwNmc0VGJ1WUJO?=
 =?utf-8?B?MnFvZndGWE5yRlpldkJwb1ZjUk5DTUFMcVJwRkpsaDExenpIdXpyaGtUVVd3?=
 =?utf-8?B?Szc5TUsvMlJncGFSd3psaytCenZ0SGFwekFhNGl3bDdFTlN5WFJySkNhU1BZ?=
 =?utf-8?B?UytmbVY1K3pHM1ZuVHlTdkc4WndpSG5KcTRPSGduY1R5SVZCZWdJVzVyaWdk?=
 =?utf-8?B?R0kvNkM2NmRDQWE5Y0l0NGpKQnlJeFMraTFZcm5TbVNYUUYxcWt3ZG44aUp4?=
 =?utf-8?B?WUV3dmg4TS84MjBDVEFqSGhXcWVkYU4yQTJjS0J0UXcyanczTUZZOHJHK3dz?=
 =?utf-8?B?TjR6Q1FYMnJKVEQyZ3pqQWVHRDFmQzJ5dEluMjZ3QnNnYUg2M1VRRGU2WVlh?=
 =?utf-8?B?NnRwVm5yS1N1Y252elVXdHN3MXdUbWFaUjU5R2IzYy9HY3d3R1ZNd0VqQVBn?=
 =?utf-8?B?VFc5SUExYk9Bc3BNS2RVa3crSzlzRnIvWUdWTWk3T3JhWktNL3VqUEx0U0Zm?=
 =?utf-8?B?dG12c1FIUWxUekNwa3BtVHpIWWVXRnNhNGhFekZOV3krNVBQNXNiakRpRkl4?=
 =?utf-8?B?WEd0Qy9RL3hFY1RXNG44endGWW1VS1ROVWJ3bXdRMlF3Qnk1b0xtYWRRR2VF?=
 =?utf-8?B?MUNXaU85ZFVMNi9yNkNwN2g1YmhxS3h2cDg3WXNITUNUMzU4YllXVW94S2R1?=
 =?utf-8?B?L2dJQWNIYzdsbE5ERmJuaFdsUzZPTWMyQ1F4WnVvSmFMamF3MUhlNEFzeTh3?=
 =?utf-8?B?Ym43K1Z1ZEFRbjFNNTNHZUREdW04K29tb3ZoWEQrbkpXWUkzVVNrRmwrZ1BY?=
 =?utf-8?B?a0gyVWY3NlVlb2pJQ2NySUVrVFF3UndubC9raHdXNjdrbk1sMnluS1kzeTMr?=
 =?utf-8?B?dEY3bG5vTzhNT0czMWhzY0NwcUUvbDNZcnVrYWlQY0h1a3J3RnhyVGRMaFdQ?=
 =?utf-8?B?WHMxUGEwZU5YNXFzN2RKTmN3dEpPRFprdHpYSEExOFIxRWpjSjcrRC8xQTZQ?=
 =?utf-8?B?aWFtTjd6OXlobzlOY0dTbWxNajcxbTIxRzdMbklaRys3UEhjaXRndktvY2ZS?=
 =?utf-8?B?aHBkdnZzUzJPYms5V0xMcHRMWnRGS0FPZmU5b2V5b2tDVEh5ZjB6bTFhaHlt?=
 =?utf-8?B?VkdsRitYZmllMTJheEtsK3ZNWG14cy9BdmQ1ZlR6ZGppV05MMzVYeVhUTGQz?=
 =?utf-8?B?SjF1alprWUt5NXhidjhMQnhGY2xLM0NIVmZKU2E0Wloxb0ZNTkwwSGVSTjM1?=
 =?utf-8?B?bkJKVGx2NVdmSU55UjlTeitHNHU1ZHkrWC9ZL1A4WWQrMk5hSFdyNUJ4QUFE?=
 =?utf-8?B?ZzhDUzhoMmpJeHNyTytPVTNMWGY5VTM3RjlZbUQxNm9aeWJMVGMvL0VsalVW?=
 =?utf-8?B?VXE0MXYzVTZIaUtNaTF3U2w0ZWxMLzEyWFp0N2UrVUhONy9sdkg2d281bU1j?=
 =?utf-8?B?VXhwOEpTQytVaHYxb0x0UGNUUm5NWjFiUmJ5VzIwVUZaR0VEb2dMQzVPbUJQ?=
 =?utf-8?B?S3hDRERDa3NWK1JIb3ZKdDZ0Si9TNUtmam1UK3MvQkROZjZxYWNWQTlrekdm?=
 =?utf-8?B?WUFRZk5CRkVYdkhPaExYZUR3ek8rdEFtWjJ0R096NW1aM3hsWXRybms1VXl4?=
 =?utf-8?B?RnNPRGF1Z2dTL211bm9Canhvc3E2eDhybWdMNC9UMFRQZE5IMERDZkJ1eTVO?=
 =?utf-8?B?SW84ZDB6M2VCUWllZ1crNDFTSThSVHBjT2hWSzREQ1VLT1JobXRGV1lsNVBI?=
 =?utf-8?B?ZWc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4921bbc0-095d-4544-c435-08db1e576521
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 15:28:11.3412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4nfMQ58HotsdcQqfFZfSdMUL2Ls3z0GBah55ztRaulCPjuPth4Y9eb6ZN6ExpQGvxpzDMlTtEhp5fUZ4qvcPGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8047
Subject: [virtio-comment] Re: [virtio] Re: [PATCH v10 04/10] admin: introduce virtio admin
 virtqueues



On 06/03/2023 13:20, Stefan Hajnoczi wrote:
> On Mon, Mar 06, 2023 at 04:00:50PM +0800, Jason Wang wrote:
>>
>> 在 2023/3/6 08:03, Stefan Hajnoczi 写道:
>>> On Sun, Mar 05, 2023 at 04:38:59AM -0500, Michael S. Tsirkin wrote:
>>>> On Fri, Mar 03, 2023 at 03:21:33PM -0500, Stefan Hajnoczi wrote:
>>>>> What happens if a command takes 1 second to complete, is the device
>>>>> allowed to process the next command from the virtqueue during this time,
>>>>> possibly completing it before the first command?
>>>>>
>>>>> This requires additional clarification in the spec because "they are
>>>>> processed by the device in the order in which they are queued" does not
>>>>> explain whether commands block the virtqueue (in order completion) or
>>>>> not (out of order completion).
>>>> Oh I begin to see. Hmm how does e.g. virtio scsi handle this?
>>> virtio-scsi, virtio-blk, and NVMe requests may complete out of order.
>>> Several may be processed by the device at the same time.
>>>
>>> They rely on multi-queue for abort operations:
>>>
>>> In virtio-scsi the abort requests (VIRTIO_SCSI_T_TMF_ABORT_TASK) are
>>> sent on the control virtqueue. The the request identifier namespace is
>>> shared across all virtqueues so it's possible to abort a request that
>>> was submitted to any command virtqueue.
>>>
>>> NVMe also follows the same design where abort commands are sent on the
>>> Admin Submission Queue instead of an I/O Submission Queue. It's possible
>>> to identify NVMe requests by <Submission Queue ID, Command Identifier>.
>>>
>>> virtio-blk doesn't support aborting requests.
>>>
>>> I think the logic behind this design is that if a queue gets stuck
>>> processing long-running requests, then the device should not be forced
>>> to perform lookahead in the queue to find abort commands. A separate
>>> control/admin queue is used for the abort requests.
>>
>>
>> Or device need mandate some kind of QOS here, e.g a request must be complete
>> in some time. Otherwise we don't have sufficient reliability for using it as
>> management task?
> 
> Yes, if all commands can be executed in bounded time then a guarantee is
> possible.
> 
> Here is an example where that's hard: imagine a virtio-blk device backed
> by network storage. When an admin queue command is used to delete a
> group member, any of the group member's in-flight I/O requests need to
> be aborted. If the network hangs while the group member is being
> deleted, then the device can't complete an orderly shutdown of I/O
> requests in a reasonable time.
> 
> That example shows a basic group admin command that I think Michael is
> about to propose. We can't avoid this problem by not making it a group
> admin command - it needs to be a group admin command. So I think it's
> likely that there will be admin commands that take an unbounded amount
> of time to complete. One way to achieve what you mentioned is timeouts.

I think that you're getting into device specific implementation details 
and I'm not sure it's necessary.

I don't think we need to abort admin commands. Admin commands can be 
flushed/aborted during the device reset phase.
Only IO commands should have the possibility to being aborted as you 
mentioned in NVMe and SCSI (and potentially in virtio-blk).

For your example, stopping a member is possible even it there are some 
errors in the network. You can for example destroy all the connections 
to the remote target and complete all the BIOS with some error.

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

