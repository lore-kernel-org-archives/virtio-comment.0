Return-Path: <virtio-comment-return-5668-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249EEC7618E
	for <virtio-comment@archiver.kernel.org>; Wed, 26 Apr 2023 22:31:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 57FF22AED1
	for <virtio-comment@archiver.kernel.org>; Wed, 26 Apr 2023 22:31:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4F7DA98664A
	for <virtio-comment@archiver.kernel.org>; Wed, 26 Apr 2023 22:31:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3DEF49862A9; Wed, 26 Apr 2023 22:31:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2AA52986641;
	Wed, 26 Apr 2023 22:31:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MkYM0cEtvIKzJjfysbicwC2OMCmeUAVlTDOl6VXq2hAbEgUUGOGW9p80l2O0XY1SFjIisGkhX2Unba744G+x6CcupohrqEt7cIpvsF+VOYHzaXJrekfNNcOm/6fkOccaO/P/371Fi8Fg9borW0HQAtOey08bEllse9ezvfqckkZK0X2AtYq2LvtoiLYPpecfwzPBUd6kLmi81xhs/cHzh/vW0J+hJymXVq+ykoNNES5Ggxuw1OqVzXjnQyQtUi5oB/nQynbCSZhGbUhbn5JtG2wDiSE1gBXEFPJz8S9v9WFwi0wGV7IBLTM7wsI8R7r24r7kMGdUJFLyuSfmR+P7Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6tbz+FFBEZ8VvH/B0cNt+YhqZLJuDQ5HELgBKlQS5w=;
 b=ARMhsXUFftWapJHbqS6XapTtlv/10R80qbNr5EwgeiY4Ojyi4S+obZDCHUMVmyeLvanRFkuk2PRMcb+LG+siiC1ZGLNg/iM0A8VEkAnuJXlPh0+cp8Z0RjaG4+mA/fyYTbvdqViO/jRyxq7oGn6BmhhVmo1+iKXo0PkaB0+rqqasAd8uxhJiMv0akxLczRb3AKpAKr+zIA67tPFZto/HIFzhPhFZGrAxAE4ySLUnSRO1ickzIpS8vAe6UQ2nS9l5L5v/PFYezhunRClby6OSSxYniB8pK7nzHHmYhw4Nio7YEJYJsu223ql6Cv1MiZceGWQVnW4zHtug7IIbMwWovA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <b7addd39-d913-700f-ac67-1412825d580b@nvidia.com>
Date: Thu, 27 Apr 2023 01:31:29 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "nrupal.jani@intel.com" <nrupal.jani@intel.com>,
 "Piotr.Uminski@intel.com" <Piotr.Uminski@intel.com>,
 "hang.yuan@intel.com" <hang.yuan@intel.com>
Cc: "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
 Jiri Pirko <jiri@nvidia.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 Shahaf Shuler <shahafs@nvidia.com>
References: <cover.1682354275.git.mst@redhat.com>
 <8a3435860747eeaa038ece4ff896c1cdd441c185.1682354275.git.mst@redhat.com>
 <5858e2e6-0b50-c155-85e9-eea6dfb533e1@nvidia.com>
 <a4b1596c-2132-714a-7557-fa5249a55945@nvidia.com>
 <5cb79b37-a066-283c-eee7-afd26146d988@nvidia.com>
 <PH0PR12MB5481B60350D145531A43E567DC659@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <PH0PR12MB5481B60350D145531A43E567DC659@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::7) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|SA1PR12MB8641:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ac1fc64-5d7f-4390-5258-08db46a5ffcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OrKxl5EaLHmkm/0/BBN62HYOWS87cvk9JXG8YRKGm9UY7mQEH1XGiml6wn2MiDGfFzg+HJct+qfWB5cZJ2PbNSCtF9MDZZLjwoF4SrTkVnNM17HIQPZluogU92uf1dfULW6Lrm61MN61pBFrqE+hkeFcEX/MqnqFb/vpUnxFLadTefxT9p1LHve4Ydca7oaAzHJ13WBII0p7JNRAaz9BXFxQ1XQXRLoF47Mr4xjYG/7eOH4RA6JSOaGWIGC5R3Foruq9KJSk1aaDX9U0crA3TDKRCoKbmBHyPSLNFYrWEEVuh9RaoFzF/OIroooOq1flvSCn4l9ruDA13oYBEPII/jkvs+HZyCHhXeRTt2IwtZOztOBf46WrXuv80k3pZacZVTebsl9vAoSWi7BFKuNCUdNlhRkXQejWWMB5T32B69mstpv0obAgD0HEbEiXI9Sbn8QBf2E2mZly5ov6y63CMLLmS3NJlIp/RuA1JSTdlIjo3u51RwMPpzickqyD9u16iFhQaTBnJpjxf+B0cAZmp1pNDg7QVVe87nB3Cu2K9vaT4iyO5wewk3t5moZZgybZaQV9/JDdObs6wtrLJZl6UhgCZvU+rajSBdaIiJO5ag43fzZOysvEoPZ7CHB6vTcS2HGvC55FiZvr5cpk8V2De36OwE9csnKqSg1Wf3CD5j0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(451199021)(86362001)(31696002)(36756003)(2906002)(31686004)(6486002)(6666004)(186003)(53546011)(2616005)(83380400001)(107886003)(6506007)(6512007)(26005)(4326008)(66556008)(66476007)(478600001)(66946007)(316002)(921005)(38100700002)(5660300002)(110136005)(54906003)(41300700001)(7416002)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWM2dXQzcm5DaWNvZzM2YmwwRHFvOUl0QUpEYWQwU0xidEhYUGthd3d4ZGtK?=
 =?utf-8?B?MGxVTk0vTW4zc1lldFMvRmdUVTZhN2JIMVVtTnJvMHI3amJ1Z2dEUlpPOUp5?=
 =?utf-8?B?QUNlWDVqdUluYWxzdE1oVnorYzlqa2NXOFFSZTFNQzZLWmdFTHFYQkIyZlJ5?=
 =?utf-8?B?d0xHNTdRTDh2OWpkUFlCZHExeGF4NytJYUR4REJmaE4wUE11dE5UdUN6ZzlH?=
 =?utf-8?B?T1phaUpGOG5rMUJJUlRGVDZXNFZWQ0RMWHNsVEZpM3FYU3VKM0d4OUxBOFMy?=
 =?utf-8?B?U3ArNUQzNlBFNXpkem9aaXUvVGVrWjlDcE9hTXhqbTJ2YUxpWW5kZzVxU094?=
 =?utf-8?B?UUYzV0pGYTF0RUxWdklvOGl2L0U4NjhVNU9Ydm1nNERRTzlNbGJUN0c4YUdU?=
 =?utf-8?B?QTJHZ3VyTXRMdFpWbzMxZ3RYeXdDVFYzcnoyVW9PV2FibUNzQmxDWGdUYmln?=
 =?utf-8?B?MHRsYkNGVHNZcER3dHU5OUZNc3cwYmdlMmgvYUFwd1pGcmEyS0lIQmpNeldx?=
 =?utf-8?B?eDlpUHl2enFlNTk0bGd0UVNvVlNwWGg3ZU1qRDdpaDJQV0hPdHRJZmNaamZV?=
 =?utf-8?B?eENGeC9oZVBiYnlLSW9VQjU5SW5FQ1ZHUGI3Mmd3L1l5M0xVNy9rYmFNdDQ5?=
 =?utf-8?B?czNPcXlqMnBIMWJzQUhQdXk3YTBOV0tCemJnbjNLdEd5aHo5WmVjL0d4M2lq?=
 =?utf-8?B?WW53T3hjRjhmeDNZWFlCSjhlV05YTkJyTWo4VXlvQ2NjcjBySDRVNGpjdXRq?=
 =?utf-8?B?VnYzRXBLbzJLZm1HYUpWRWhhU2Y5akZCRzh5cUFmN2RTYmc5WmNscGJsQ3c4?=
 =?utf-8?B?Q2k5bmtmdTBVQzRzc3orWmwzd1J6Qm1Scm9mTVl3NmpidjE4eWdqcXVFZE9a?=
 =?utf-8?B?RGM1eE1WSmdubTc5Qjh3Q3VUSUpIb21QRjdFQzVyalJNSWNLRzJwT1BYRjY2?=
 =?utf-8?B?cnBaTkl2Y1dFYlgxa1MvNWhZNGc0NzhzYlAxem9QOHpPWlR1VVp4dzFEVDU4?=
 =?utf-8?B?R1FXQjdscWZOMXZmOUROdzF5RUJmbVQzVS93dWRoQzRFSk02VFlkTU0xT25R?=
 =?utf-8?B?bEppVkdscklhc2NsbFlwdi9oYmhyRnF5TTk0Vy9ySE5KWTZjdllQdG9hOTFQ?=
 =?utf-8?B?L2sxeG80a2R1azF3dXErZWFwOG9kN3VVN0h1WENBcld5SkM2YlV6N1MzcFBu?=
 =?utf-8?B?MlFlSThaTDJOY3FUb2UxdnFsUVJMU045NWZkVDN3a3ZnSlgwSWJKeUQ5Ryty?=
 =?utf-8?B?M0pwSndFSy8ycjVBcFBuSjRYU3ZWTTJhVWoyNHhQTktxVWQ3cUJxWk1mYVQ0?=
 =?utf-8?B?N0cxT2JBcWxTTjRFUTVyaEU3TWJiRHZkdWNXTGJXclphNE90QnRtTzdXb3Vl?=
 =?utf-8?B?UlYxVEpzZlE1Uk1tK0tPZFRGdDllYTlKc09ReGFxbmRLd2pHNmVybUMzN0V2?=
 =?utf-8?B?aUlCSEVPSm9ZVEN4eitDaEo3SHptVi9OTndjOXBYUmswZzNjTW1BR3JkcHJI?=
 =?utf-8?B?bUd2bklwU3RQRXNEMkhOUVBSUHp6eEFGbXJSc3A1R0ZZclFZSTFiU3lGdjk4?=
 =?utf-8?B?aXpYU0J1eHRkcjhSYmN4Y0xjcWRXQklXS0ZRRTZoSDErZlZsT3BERlM4REhX?=
 =?utf-8?B?VlZKaVFSd3BwWU1qWDIvSlhFN2d6UFphWnBXUmpzU1BRMWEyc0ROd3FORE9k?=
 =?utf-8?B?aVBtdlpOSmhMbnpOQWxCRjE2ODJkbS9uY0NVdjNCZGNISFVXWDZ4T3d6TjNY?=
 =?utf-8?B?Szh3cm5lSWUvQ3BUZVBsYytRTCtka2Z1bWNVL0lyc0l4dk13ajRYUXZWK0hJ?=
 =?utf-8?B?d0ViVjZTNnRUb09RMk1uS25idDhtNjkzWmhsSzFJUEIreUlSS3QrTFZ5Qm5i?=
 =?utf-8?B?Q0xUN0IvUUxsWG5nWXpBdktuVVBQTlphSnpXYVpBb3hnaDlSYnBnbTVTcFM5?=
 =?utf-8?B?aXN4SS9NR0VvbHVOcW5mbEV0eklHdWJLU29JM25jUU5BQjdhZE1xS2JGOE1s?=
 =?utf-8?B?V3JySitaMHV2anRmUlRjYzZvY255b0ZLdUlrMXg1YTVvVngvK3dVME5NbUhv?=
 =?utf-8?B?SjBxTjdFNDRtTFh4STlNUnQyOUpvVFpVS2NtbHRMN0YvaFBnSVN4bWdjS3kw?=
 =?utf-8?Q?z/AGNNm8+8hNooZjOr/VYTg4O?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac1fc64-5d7f-4390-5258-08db46a5ffcc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 22:31:38.0575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UsMaKLvwj383UdH6L3oI1mmq8HxMU344WNWr+KlByXZbbsMkQxAlmEBkpy8MEdAVhQ59IV6bvI7K5oQXxiWa6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8641
Subject: [virtio-comment] Re: [PATCH v12 05/10] pci: add admin vq registers to virtio over pci



On 27/04/2023 1:11, Parav Pandit wrote:
> 
>> From: Max Gurtovoy <mgurtovoy@nvidia.com>
>> Sent: Wednesday, April 26, 2023 5:12 PM
>>
>> On 25/04/2023 1:14, Parav Pandit wrote:
>>>
>>>
>>> On 4/24/2023 6:06 PM, Max Gurtovoy wrote:
>>>
>>>>> +If VIRTIO_F_ADMIN_VQ has been negotiated, and if the driver
>>>>> +configures any administration virtqueues, the driver MUST configure
>>>>> +the administration virtqueues using the index in the range
>>>>> +\field{admin_queue_index} to \field{admin_queue_index} +
>>>>> +\field{admin_queue_num} - 1 inclusive.
>>>>> +The driver MAY configure less administration virtqueues than
>>>>> +supported by the device.
>>>>
>>>> we need to say something about other virtq's indexes.
>>>> For example, if aq index = 0 then for the vblk device the request
>>>> queues would start from index = 1.
>>>>
>>>> can we address this ?
>>>
>>> It may slightly complicate the device implementation when device
>>> dynamically changes the VQ indices based on the negotiation of the
>>> feature bit.
>>> Also the drivers with and without need a different VQ index handling.
>>>
>>> I am thinking that aq index should not overlap with the vq index in
>>> range exposed by num_queues field.
>>>
>>> This also aligns to the exclusion of aq count from num_queues field.
>>
>> The namespace of the aq and other vq index is the same.
>> And the configuration is done using the same queue_select and other registers.
>> Thus, we need to address the above comment otherwise all the device
>> virtqueues chapters are wrong.
> 
> Michael has added below line in this patch in num_queues description so it covers the exclusion part.
> 
> +        This excludes administration virtqueues if any are supported.
> 

This is not related to what I was talking about.

For example if vnet device:

0 receiveq1
1 transmitq1
...
2(N-1) receiveqN
2(N-1)+1 transmitqN
2N controlq
N=1 if neither VIRTIO_NET_F_MQ nor VIRTIO_NET_F_RSS are negotiated, 
otherwise N is set by max_-
virtqueue_pairs.
controlq only exists if VIRTIO_NET_F_CTRL_VQ set

and in vfs device:

0 hiprio
1...n request queues

So if one device will expose adminq that will be with index 0 the above 
is wrong description.

Agree that this should be addressed ?

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

