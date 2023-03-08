Return-Path: <virtio-comment-return-4816-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E452C678D5
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 17:30:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D823B2AED5
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 17:30:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CDF049866F3
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 17:30:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BE3CE9866F0; Wed,  8 Mar 2023 17:30:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AB5A69866F1;
	Wed,  8 Mar 2023 17:30:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q2aSmgaIOdDB+8OF94y5iZ1cPgDx5MBYhc5eTJ37nidEGvvfWUBS3jFdq5937xbUaA5z1HNWMzcQ3hnhOa83EUg2UmiMNKEjp08MmnbBuc3X6RJxV21Cp8pjWH5D50DKhT5E2aDEpfsRGaJMt56tK/w+RWRqxtfq0EKGQZv7GiiQIGI32NxA/0t9pVVlGFNiyMY8gsEgpeMMMopqYDD8zkBIn6bnD1A1Xs8THOGHW4B2yf4UzqWlAw4TvZSD7076k0KYw3MYAS46XFxBxx4b8YZcshe8cKn3E2anoR4RQFzkww3q/DabmPiXdUKzgbVF22I06gm+Wh5TBs+yQBC4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1Qs3Qpk4egGAbTxkxRwGUNbozNH1wajipWQqoNx14A=;
 b=CHikXCcaXCdRZCV5DPUPcMzg7lYVEzuv6LCI1l7CaxzCRYW5cRL7P959truWBf6+Rzk4PouwXIGcR6UqYcljUXpwvBrg5bSBY2W27R7sAmI3NsCp6nwCGTjwyvCcBXIj/MzjVG02y5AVeka0F0mgellmWgSuauIKy7KaG0gkxiP7lm2rAjXn3fckFuy50YCKRM0qBjPSKpAxapmKfQm+xodYYxoY/cKhZwHQ7SeShvadFKkUJtMFMDp3Fmz9193v8/pTuSnnvMqonIzKZsBN38pEnSclhKjU6gLKihkU8ZFtCfQcHklffCqmDpnPeG694Ov7XR0XChBDrkCfC3xxtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <18d51bc0-d759-1a05-cb7c-3d46c4ed2f1a@nvidia.com>
Date: Wed, 8 Mar 2023 19:29:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Jiri Pirko <jiri@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
 jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com,
 stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com,
 hang.yuan@intel.com, virtio@lists.oasis-open.org,
 Zhu Lingshan <lingshan.zhu@intel.com>, pasic@linux.ibm.com,
 Shahaf Shuler <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
References: <cover.1677761896.git.mst@redhat.com>
 <20c81b66f0b21b5bd646c24840ac3f8462c86acf.1677761896.git.mst@redhat.com>
 <ZAXfegxCfvfLwiJT@nanopsycho> <20230306133816-mutt-send-email-mst@kernel.org>
 <ZAbpiRVdo8BciELX@nanopsycho> <20230307111458-mutt-send-email-mst@kernel.org>
 <ZAhdzCd6qwWydesz@nanopsycho> <20230308064505-mutt-send-email-mst@kernel.org>
 <ZAh61E/wQ/hSY/OI@nanopsycho>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <ZAh61E/wQ/hSY/OI@nanopsycho>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::14) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|IA1PR12MB6185:EE_
X-MS-Office365-Filtering-Correlation-Id: dd612904-484a-4679-68bc-08db1ffac417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hf3zdEAHpC7Er1heuXacA1W9nbWB75Zkm2yrIaiO2VS7Xpiszdl0A7CFl5cSjb3+yzpPMQpr/zk+6VN2OgpJAAqist6tRmKhW2Sd93ONDsE2hRAmfvJLZI/rf6yBzdIoRz/T9Ja2a4zWjB+HckDaY84TWudMu+6KcfqebtTc2G4S1xIBqXnFTAyevk8fgDghYmYOcMS7YRMV1GCu93gua3H3Nv+cYKuNq90z/j82zKdv2Ha89NvDvNgBPKAMmmAFyUpRyaHkEcsynN42COk2+y9GcSX6VpM2Yucz4ttKZJdLCqn4N1NaQncJyKQU6CJSHz8jQPz6dcpP7s2H5emNILduyd7WkEbM9yYQWy2rMBZ0+X3gFvN0Xs3QbnHUCnujW4+egZ5G+PZTfwLTv4lhZQFSVu2+WRlQX7XZEQJ2dgs8Lw901rh1eHJ/7fb75mJHbnQrsII/GJo0EbKo6uWWlIszgSe2Hn8bSGIwc5Bj5GTG/GO+Ss6QFZVnOxTcTbkHrc92Vknnt998UCtgCTI20d5C6OXMP/umyrGl7hvVIDoVEMwbnkPG+Qdm9PQjQ7Bf18BnFaAvvAnot0i1Az/V3LY++88LBXXQ5pCNT7oJFH5mbia4LLNfZ267kYG9moagX0qSPRNC1MZJOqoiytBhoBijSOW2UiyV0CwGE2X59UiEYI6xAfm+NVaNI7Svz0hM+WpaarGCc7gWL/ePj+095Q9fEmCFXhcSF96RFaJ4JcezznDKZC6bkGRzPf/5DdPd+BRMjLKtlx6tIi+gLVzFkqxN2QPSD9BJ8AQiEyl21zkJbs7gAnF3sLXJYFvcN8tr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199018)(8676002)(186003)(66476007)(66946007)(5660300002)(7416002)(66556008)(4326008)(54906003)(478600001)(6486002)(86362001)(31696002)(316002)(110136005)(6506007)(6512007)(8936002)(26005)(53546011)(41300700001)(38100700002)(966005)(6666004)(2906002)(107886003)(36756003)(2616005)(83380400001)(31686004)(66899018)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjhYVXV0aHprM2E5NWtCcGZ0K2F0Z1FXZ0J6enpZTGJlWHZlc2xxWXRhM3Zz?=
 =?utf-8?B?MGF3ZkFZbSs5QjhIZzBMWUVQbHdzSEY4OW51aXZHcU9iUXRVbVRLMjhMR0hu?=
 =?utf-8?B?NlZxV2NyT3ljTDd3dm5acDBDc0hKaTgrcEgyQnljOGZBbzQxdG5DWHJsV3hp?=
 =?utf-8?B?TUY1MUtWSThoMERMM3E4Y1lGSktNaDRJY2NodmZXWlRhK3BZSGtmL0pTRE5W?=
 =?utf-8?B?VFlzRk9mSGRMMmhMZVJTaGl2bk5YQS9xMUZ6cGcrMVFsOFE0bW9neWdETmQy?=
 =?utf-8?B?OFVtVmRuZzNLUXczMU1yMituNDlkUjIxSU8zd0gwOTBtY0NETkE0QTNBcHEz?=
 =?utf-8?B?RmM0R09pQ01tWkdGVzFRK08xM1pzaEJmMWRtNUpDTU5VN2tQVnZqVGJ4VGxj?=
 =?utf-8?B?TS9UYXZlNnhLSnovNjk0WENMK1VOWlZRL3lFU0d2UHZNajVROVN0YnJwTjVX?=
 =?utf-8?B?Rk9iN3Y0YnNWeGJmRU9zdXp2OFZWRmVIOTdyUFhWcjgrWExKTUVFR3hYdnNn?=
 =?utf-8?B?R1p5bVBvUWxkR2x2Q2JacWVyamdBMHdkaFZDRWhyN0ExbCs3R0I5L3VQc0pI?=
 =?utf-8?B?NWtHaDd0RmFyY0Nqc01GVVZjKzg0VmNxTzYrZGhtZEdjOFhBWG16cW05V3Nm?=
 =?utf-8?B?dFg4MnBhTG5wNGFlbG9FMktBeTRPSmdQclZLMUlCYUNxWDBFNjQ4bUt6NEJn?=
 =?utf-8?B?Z3ZRQWJDYi82bHlpcXlzd2JqYWVwVHlQMXUzd1BkdnYrcUg3S21LTEM2TjVi?=
 =?utf-8?B?Ui9xWTBCd0ZpQ0x0emZRemVNdUt1ZlNLUkxhUlRGZUxrK3ZYb09xSFNQeHR3?=
 =?utf-8?B?T0k2Z3F1NjNWUE5CNXB1K1BWWDNwV2ZnNm5scUtLd01XK2h4OFN6NkIxMjlj?=
 =?utf-8?B?RFJBbDBiYVlXaUxDbTg1NCtmaUlOV1dnM2piekQrNXNTOGFnU0xxVHJRU3Yr?=
 =?utf-8?B?MGdPLzdYNUtNT1ZsRlgrWWsreVRxaUtaQ3JlQktTQzNwci9oQ3o1VXpGYmx1?=
 =?utf-8?B?d0RXNnRHMnV0Q3VXaTNtRU50Y0tWK1RHcmNXWmlJZ3BBdkxtTTBuV3F5L3h6?=
 =?utf-8?B?Rk5tVy9WMW91VzZhdlBDSEJTS21aVUo0OWpJcU5VQzIyeGZQRDhWOXZIa3JN?=
 =?utf-8?B?Z3I2TVRDbWZyd1JiVGlqRC9XanBQVkUxRkE2dkZ2a3p1NGRrYXF2NHRJVlhB?=
 =?utf-8?B?S2o1RUZiZ3RNenBGeHZvVUVPSE5zZ2o0d3VPUFZpaXVQb2Jja3VpVFB3b1R2?=
 =?utf-8?B?Y0YyWDdEVmVtS0s2TXpvL2lHME9WVFlvdHNEYTRZTlFMdWdSL2phSDl0U3Fl?=
 =?utf-8?B?LzZPanpoV1N0MFk3M2R2N1RMbHJON0l1MjI5L3N1ZHZXNDc2c3NJdlhZQjZS?=
 =?utf-8?B?aEtqZTMwNXN1dkEzQjRBS25TM2RjYTE1bTNibUJ6MVg3Um1rMmhFY1I5a2Vh?=
 =?utf-8?B?OVgzcStqbTh5cFVNOUduVjlhdkpEOVNRYWM1QlZlcGV5UW9aS1p2RVljMWQr?=
 =?utf-8?B?Y0srUWZ2eDBWWVlCaWNBSXJtbWo0MlZ5YkovcVZVamViTWdwbzAyS2cxVVRX?=
 =?utf-8?B?TTluRXJZYTJjdVkrSVZGZkZEclpzNDZ1SXIwY3BTNTFLRVBsK05FTGozRFUv?=
 =?utf-8?B?VU95WVJkUm5zLzVSdTErWFF2cE51QmFPdnRwYnd0Y2Y4dGZHeVU0R04rUmxL?=
 =?utf-8?B?WTZLM045ODZCdVlMUitsVXBxdEZFM0lKdzgrY1JIeDh4cWtKNmNVaUJycXZH?=
 =?utf-8?B?d1paZWUyOFJhbXIrUmpOd0k3RFJvVjgyNEJVTU4wTWtWc1dPRjFnQ0ZLTlBW?=
 =?utf-8?B?dmZ3eDBsTHl5SjJLcVJYTGFXYlBIZ2NZS3hCd0swUTB4Q3lOQTZIdmJpWUl5?=
 =?utf-8?B?UmMvajBLU09Nb0ZjZytZUXhzTVI0TWQ3b2RwcXpMSENXK3VBOC9OWDJzKzd2?=
 =?utf-8?B?UjJ4ck5FL2JjVllJS09Wek5KajRaNElEN2YwSk83aDB3aEd3ZXVmQWs5NzVH?=
 =?utf-8?B?QjhRUXJwNjVaS2tKbmM0dzVYVHdwNUs1NFpiejc0WWpHRytDU1VJMHc5NmtE?=
 =?utf-8?B?ay9WRlZlSFJHZ0FzemdCSU9USXhTc0owMEdtTmFHMGNOT2wrWGcwVWx0QjFX?=
 =?utf-8?B?U0xMVjdDTkZLQm53MWFWUEs5alAxZXk5NDlhSHQ3dHFKSXNjNGRwWXNlK3R0?=
 =?utf-8?B?cnc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd612904-484a-4679-68bc-08db1ffac417
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 17:30:13.1132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WVA34waarR2tFh6TbEZnWwhgBbl0xJK8kkfnpoCIu6SH78blLztEWxzmE2R3pLZVy3LUczeMHY0S1TpQJyqZvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6185
Subject: Re: [virtio-comment] Re: [virtio] [PATCH v10 04/10] admin: introduce
 virtio admin virtqueues



On 08/03/2023 14:08, Jiri Pirko wrote:
> Wed, Mar 08, 2023 at 12:50:48PM CET, mst@redhat.com wrote:
>> On Wed, Mar 08, 2023 at 11:05:00AM +0100, Jiri Pirko wrote:
>>> Tue, Mar 07, 2023 at 05:30:18PM CET, mst@redhat.com wrote:
>>>> On Tue, Mar 07, 2023 at 08:36:41AM +0100, Jiri Pirko wrote:
>>>>> Hmm, if not for now, the future exension would not be so simple, I fear.
>>>>
>>>> Without knowing what it is I can't say.
>>>
>>> Yep, so basically you say, for other things if they appear,
>>> let's introduce another queue type? If yes, sounds fair to me.
>>
>> Yes. For example I find it likely that live migration/failover support
>> will require a queue where driver pre-adds buffers and then device
>> supplies information as state changes.
> 
> I see. So there would be a queue called for example "child state virtqueue"
> or something like that for the sole purpose of getting the state of VF?
> Hmm, wouldn't it make more sense to have this done as a part of "group
> administrarion queue"? I mean, there is already notion of addresing
> child/VF here. So from my perspective, it is just another "group
> administration" command.

For sure VF Live Migration, MSIX config of VF, VF feature bits config 
and others should be admin commands on admin vq.
I don't see any reason introducing another type of admin-like vq.
Also we don't need to have multiple admin vqs. This AQ is not aimed for 
performance.

> 
> We would have to prealloc buffers and use it for this purpose as
> well. I mean, the cmd payload for other group commands
> could be put in this buffers as well, making all group command
> infrastructure consistent.
> 
> Something like:
> 
> opcode X
> group_member_id 1
> cmd_payload-> buffer A
> 
> opcode Y
> group_member_id 1
> cmd_payload-> buffer B
> 
> Basically this would replace command_specific_data/command_specific_result
> 
> 
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>> Passing commands to devices themselves is already covered in spec
>>>>>> reasonably well though not in a generic way.
>>>>>
>>>>> You mean using the control queue, correct?
>>>>
>>>> Depends on the device type. network devices have a control queue, yes.
>>>>
>>>>> >From one of the patch description of this patchset I understand that you
>>>>> cannot use control queue for this because control queue is
>>>>> device-specific, yet group control is device-agnostic.
>>>>>
>>>>> My undestanding therefore was, that the admin queue you are introducing
>>>>> serves as a generic carrier for device-agnostic commands, in parallel
>>>>> for having control queue serving as a generic carrier of device-specific
>>>>> commands. If this is not the case, I think it would be nice to describe
>>>>> the exact monivation and scope of admin queue.
>>>>
>>>> Nope unfortunately.  This queue is just a carrier for admin commands.
>>>> admin commands are commands that talk to one device about other
>>>> devices. There's clearly no mechanism in the spec to do that,
>>>> so we plug this hole.
>>>
>>> Okay, in that case "admin" sounds a bit misleading as for me it
>>> implicates that this is for "administration" of the device. Yet is is
>>> for the administration of other devices (slaves).
>>>
>>> Perhaps there could be different term used to clarify?
>>> Group leader virtqueue?
>>> Group owner virtqueue?
>>> Group master virtqueue?
>>
>> I used group administration virtqueue in a couple of places,
>> just inconsistently. Good enough?
> 
> Yep, sounds good. Thanks!
> 
> 
>>
>>
>>>>
>>>>
>>>>
>>>>>
>>>>>>
>>>>>> What we lack is passing commands about one device to another device.
>>>>>> E.g. control VFs through PFs.
>>>>>
>>>>> Could you provide examples of such commands please?
>>>>
>>>> For example a common feature is to program a vlan and have device
>>>> put a given VF inside this vlan.
>>>
>>> I don't follow entirely. The way how the VF is connected to network
>>> should be ouf of the scope of this interface. The eswitch manager should
>>> take care. What you say sounds awfully like the "ip vf" legacy
>>> interface, which should not be considered here I believe.
>>>
>>> If PF would be the eswitch manager, there are other means to do network
>>> programming, using eswitch port representors. But I don't think this is
>>> the can of worms we want to open now. I don't think we have a usecase
>>> for it currently. Am I wrong Parav?
>>>
>>>
>>>
>>>>
>>>> In a virtualization scenario host controls this vlan programming giving
>>>> the network a measure of protection from VFs.  If a VF is passed through
>>>> to a VM, IOMMU limits VFs to only access guest memory so host has to do
>>>> this programming through a PF.
>>>
>>> Understood. This really looks like "ip vf" legacy. I strongly believe
>>> it should not be supported.
>>>
>>> Any other commands you have in mind?
>>>
>>>
>>>>
>>>>
>>>>
>>>>>
>>>>>> This is what groups do.
>>>>>> But if we see more uses we can always add them.
>>>>>>
>>>>>>
>>>>>> I'd rather avoid being too generic though.
>>>>>
>>>>> In that case, why not to avoid using generic terms and stay
>>>>> "group-centric"? What I mean is:
>>>>> "Administration Virtqueues" -> "Group Administration Virtqueues"
>>>>> "struct virtio_admin_cmd" -> "struct virtio_group_admin_cmd"
>>>>>
>>>>> Etc. Helps to avoid confusion.
>>>>
>>>> Sure, I tried to do that but missed some opportunities.
>>>> Will address.
>>>
>>> Cool.
>>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>>
>>>>>>>> +than one administration virtqueue.
>>>>>
>>>>>
>>>>> [...]
>>>>>
>>>>
>>>>
>>>> This publicly archived list offers a means to provide input to the
>>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>>
>>>> In order to verify user consent to the Feedback License terms and
>>>> to minimize spam in the list archive, subscription is required
>>>> before posting.
>>>>
>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>>> List help: virtio-comment-help@lists.oasis-open.org
>>>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>>>> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>>>> Committee: https://www.oasis-open.org/committees/virtio/
>>>> Join OASIS: https://www.oasis-open.org/join/
>>>>
>>

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

