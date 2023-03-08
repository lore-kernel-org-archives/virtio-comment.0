Return-Path: <virtio-comment-return-4821-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BA8C678D5
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 20:59:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5AA6E2B244
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 20:59:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 412369866F9
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 20:59:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2BE28985E76; Wed,  8 Mar 2023 20:59:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 15181986312;
	Wed,  8 Mar 2023 20:59:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AfbKqMoIl8m0CDgABBq6LNEZ4nZxaDFsLtc3KwXJ0ZkUMCmXw8qyYltKTx7XCLWvoMWEyhaycZAqgmo+JwK7gdQkXf/ZQP53HM8d7TxifkqOQr/gvekmNXeSEaNoiiBvgvKTA3I6JixjSJYMUBFjH0AkvvJnJK+WIXpymN8rUYPBbP+WCoyM1iQWlzVJn22bcW4Bu0CtqCabC43oQtoOAb9mAkUgnQ1MWuLZLlIutFmEymnGDqGfrSS0qD+P1QlAEXm55mf1joNcN2vKEjahFsWNreqUUCtNmAeKI3SQO42qhS5BnnJRdC9sd81dAhFqYpIOuJGFXZZp4LUhOLZN2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gv1yO1901FtFf29CAPYjZrJzF665soLSAa7U+hDB+Fk=;
 b=ECWAXyHMgus57ANzcrh27epakAmJo2hQKE4p4E3rtVsnD8z2/uWyOUMqBHlqlhnC2lbcLDUZrqcSru7T87+k022NAj3eYOhlmULdLH0ogRvwLlg25zwWhXfIJSOuAyagDw7uxs42umg98O1UGTmwwtaux0xtAmpvnitXOXsJX5F+psszyz+hVW35zQqmvKKay9Q3VXGcreC9pB2fJ/GaYVQIusQn4IHNLW21HJc6JB5yIR5mIU8qb4jzJNfc9GHKcwVr3cqVCCSkytLwUH+IQ4iRXwIImy7MsVwl9AIyAcy9e/kN/lXZ0I+roP76S+Qk2ZT5WDb2jk6Wu8bzb0mdzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <e12ab469-4586-f0f5-b084-8f2d7c031e11@nvidia.com>
Date: Wed, 8 Mar 2023 22:58:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
 jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com,
 nrupal.jani@intel.com, Piotr.Uminski@intel.com, hang.yuan@intel.com,
 virtio@lists.oasis-open.org, Zhu Lingshan <lingshan.zhu@intel.com>,
 pasic@linux.ibm.com, Shahaf Shuler <shahafs@nvidia.com>,
 Parav Pandit <parav@nvidia.com>
References: <cover.1677761896.git.mst@redhat.com>
 <20c81b66f0b21b5bd646c24840ac3f8462c86acf.1677761896.git.mst@redhat.com>
 <20230302204007.GD2554028@fedora>
 <20230302190230-mutt-send-email-mst@kernel.org>
 <027fff1b-8ed7-abc0-2331-b188b8822bf4@nvidia.com>
 <20230306174850-mutt-send-email-mst@kernel.org>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <20230306174850-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::17) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|CH2PR12MB5003:EE_
X-MS-Office365-Filtering-Correlation-Id: d9bdc1a2-a1b7-42a4-6131-08db2017f5d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UgEub1n6LhhlBfoV31eAIsluKs+Sec+VNFXa+D5TVYYw5bwlZpJpHTp5vKLBE59GaLIKJNthoOi1yG2ijmlY5idc7H8pM6dvSqDM6c3nDWnaUoNBtzCJz5GFZxG/39ACCAEBHQ58n+coA14AfQQu3qC910msvzQ6iLRKnNYwGJ+PxCIf/IKhwXaxT07Q58+lU1GwcX9t8338XoxeNKurolyahlfGahkqI3mnD23wfU9KpEnMqzcLpt1i+S3RX5FPlEHQPrCRPJOS/S5CSTXS4CZD3vQelkjonOrss2VFEzzs8kMCaM+UcjjyBDXTiBFYcutB2VtspKn2T1AbOYqPgrkmzf+G/w6v8WjO6le2NS0e4PE/q/r+00zTcvG6ya3Ex+YFA7A0BZnz9SXn3nv7Y35Owrz0ekmELDGsnpXGbymGd+kfzmiQhmJY+Nl/UOdbP6foyJ2QK0NnS9tFPqIlfSg5ufYgz81SZeFiRqDgZcYgeYhCGJT5LUqp0xhloZoBYG30biF7YNyPBPHmwwgyzClQ1+Uw8KbEc9CDml9d0xZR3YVF8NQUx0QtCRltYzMBRlLWoIGczaDrLaImUZfp1Icfzh8P/+v3QZEguX5LSZG1AZvpI/nEZ4Jor2U2n77lr9BgBFiGCuzTbkT9p5D3J2L+VeUJzG+5SuFBVwB3SXbExkTizcdQGldrpzAEoKKdOcVz8N/zM5nOT0BJJGbV2XAldQyMxGvgyTE2C2NFbds=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199018)(31686004)(36756003)(7416002)(6916009)(8676002)(66476007)(4326008)(41300700001)(8936002)(5660300002)(2906002)(66556008)(38100700002)(31696002)(86362001)(66946007)(107886003)(26005)(6512007)(6486002)(6506007)(478600001)(316002)(6666004)(54906003)(83380400001)(2616005)(186003)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OERJQmN3YTZsbGhEbE1DRm03M2NVci9zQ3htM1dTZXhWT29OcVhsMXhuOWJU?=
 =?utf-8?B?Ty9Xa3RQdmlPNmJtMkJrOXZnczQweXpJR1FmN3Y5MGlHZ3laWDhkNDRqQlMw?=
 =?utf-8?B?VktqQ1U5RnpIVWNwaEtZbmQ5TGpJRDhTenpNd0hiMVNyMXRzTE0xR2x2TDZX?=
 =?utf-8?B?NjJvTHdBOHhTNStPend0MjhNSUZlYklYTEJYdEdEN3RTV3MwSWw2a3ZZaFlO?=
 =?utf-8?B?Yzg1ZW56S21NVW5WUHgxdlVlOENxS0p6YmhtRVM5bjd6SVBOcmNsZkpSdnJN?=
 =?utf-8?B?OTZkNllSMUQzWWJCSXNXMXdmRnBkZVJZaXlaSVREbUp6WW0vVjhwd055UGlL?=
 =?utf-8?B?T1dTSjJpTitFUi9GM1FCZjBwVjYrUnIyYWE5QVJWWjdLZU54dSswcW9mY1RM?=
 =?utf-8?B?d283bzBuT0p4MjBEd25QTHVKYjRpbW5OMU1zWDdsMC9peHNOZWpMSTdJbjUw?=
 =?utf-8?B?bE5kM2ovRDN6NlBIVXpxTFF4R0NjUUNhaTQ2SDFBMSt4RFcxeDU5THgyb2Rq?=
 =?utf-8?B?NFlxL3FUdlMxcHdGRjB4M0M5cDY5cHh5NmtUSnBvU3ZDc0JxalFLcG5JMjAz?=
 =?utf-8?B?Rk5qTWpkZW0ybFV5ZzFjbnlIUGgvNVlXc3kvMEpGeWlvN2l4MjJmZTlNVzNX?=
 =?utf-8?B?QUVYcTlNZjRNcTIrcHErYWpYNlhZV0MweEU5NWpDMU5GYjhISzBHcmZ1OHNv?=
 =?utf-8?B?TEp4VGdIZlJqS01YR1lNakdGV2lIWFI2NFNkbUFxV0tTQ0NBOFBGeDUwd2NM?=
 =?utf-8?B?SzBPNlhidVI5cGZURHlHUDk0eFZHOUplcjZNTVQrU0NXTlA1RWFTQlhzQ3h1?=
 =?utf-8?B?aURXcDk3MnFNRUwwMHdZaTFQcjNRTzNheHBMUXdlYlBYUXFEa3k1b20waVhV?=
 =?utf-8?B?K3VqdjhWTFZUekw5WXJCQWhSWkNsZWdQbzAwR1JlR3lzbnFNVXB0UmJhZXI1?=
 =?utf-8?B?N1VNV2dHK3ozZ2svaCtrNXAraHFOQ2szMTRITXV6bWI4OGpBUVlxdnc0VWc3?=
 =?utf-8?B?TjBkYzdMMjdpQW1zOW9CV25peUI5Qm84dWtMcSs2WHRybmhORzRmUVNEc3dx?=
 =?utf-8?B?YlJtRVcyRjMwcjltb2MvUEhEbGx5L0MreTFERjNrM09rcmw3bzhxMVRJOTBG?=
 =?utf-8?B?am94aXNxbkYwVFZlbVFqTFh5MjJGL3JRNXNGRTNRSGFEREl1Y1lNd1pTQzA0?=
 =?utf-8?B?Zi8rNmc1dmNXYWpIZEpIRm9lK2xBN0ozQ1pQT0NRVW41bXhSSGVTaUlOVklD?=
 =?utf-8?B?anovaUJWUGk0ZTdoUmw5cG1Sd3VJVXFCcDVVNE5NeEk4RmJQUnNRZ2lpNDBQ?=
 =?utf-8?B?blVsSlB1dGhsS2xPZkwzeUJsRVpLd1pBZERONHNLR2x6SGx4aFFYMjd1ZHA1?=
 =?utf-8?B?eVA5V1p6MkRERHN6R0xESlNCVEkyRkw3aDFMMFU5R3FIb3V0Q1VLN095S1BZ?=
 =?utf-8?B?WHJCOU1lZHFwWklzN3c0TzN5bDJXMDZZSU1oQTh6Q0syY2pyM0FIQWlIcnV3?=
 =?utf-8?B?OWVabHltaFkzUDB6RS9iTnNjY0NRUHRzYTZIN01NS0JxZVBBUE4zTWJRQmNk?=
 =?utf-8?B?c01GbHhXMUJWeU5NTGhqdVdrMUZSR3FtbVlCMnVFbmpKemdjaFBuY0JrRTYz?=
 =?utf-8?B?Qno3R29OMWIrR2s5MkRVQWY3UUhsaXUrQzlNNWlSVkJFbk1VWWJXNFB4Qkdh?=
 =?utf-8?B?aitrelNzVi9ORzhvYTZ6NVd3U20zZkR4UlE4blcvamkxd2xCVXFYMVh1dE4x?=
 =?utf-8?B?Y1dhNDh2QTkvb2o5QkwyMm1qbldES2ZKeVJDQ29ydGNtQ2pGQXVSMlJDNFhE?=
 =?utf-8?B?eElsMXlld3F3a1RySHloRlJEUDB5UG9JTWw0ZzJJbXBDN0xXbzdxSWxxQ1RM?=
 =?utf-8?B?bVFETkhyUFoybVE1N0ZobFZoS3Z6QUl5RDMyMWJXVWlqUi9GcXRscjJpdk5V?=
 =?utf-8?B?Q1R5ZEIwTm9yRm9WcG1zY1lVUjJ4Ry83VEFQdVNEOENEMnh5YytqQWFvTWRP?=
 =?utf-8?B?OWZvRGZUSHRDOGJIMk5nMCtNUlRLUjVHVzVwZ2lORkkvYXhyTFlhYnZXQVUr?=
 =?utf-8?B?NEZPeksvQzU4Y0c2Nld2d09CRkxac3FGZ2ZyR3lGNHNKVVNoQTJDK21HVkNz?=
 =?utf-8?B?Y2FuaTdIK3U1dEgvakNPMFF6YUlaWUwvUWphaEhpTm11Sm9TL0FTYlVQMjlN?=
 =?utf-8?B?WlE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9bdc1a2-a1b7-42a4-6131-08db2017f5d7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 20:59:08.6895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0M5IsVTkNcC+mVp/cZTHtozPKzuKYIQHh1eIaBhIiHW3HbuAnwd/3eUuwtZUofTOhRFdHb2XgV0i3YPGFkBmHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5003
Subject: Re: [virtio-comment] Re: [PATCH v10 04/10] admin: introduce virtio
 admin virtqueues



On 07/03/2023 0:49, Michael S. Tsirkin wrote:
> On Mon, Mar 06, 2023 at 05:14:09PM +0200, Max Gurtovoy wrote:
>>>> This would allow pipelining
>>>> dependent commands but prevent long-running commands because the
>>>> virtqueue is blocked while executing a command.
>>>
>>> we have multiple vqs for that.
>>
>> why do we need multiple admin vqs ?
> 
> You are literally replying to a discussion with a use-case.
> 

I don't follow.

You are snipping my reply that explaining how to simplify the spec.
I don't think that any device will need more than single admin queue.

NVMe specification has a single admin queue, so why do we need to invent 
the wheel ?
And it has so many admin commands that may take time such as FW upgrade, 
format a block device, also we have vendor specific LM specification and 
we never thought in a direction of having multiple admin queues.
MQ was invented for increasing performance and not for preventing long 
running commands. Most of these commands are queued one by one in a sync 
manner.
For example:
- quiesce a device
- freeze a device
- save state
- load state
- configure msix
- configure feature bits

Virtio has a single cvq as well.

I'm asking if you can re-think please.
We have a non-spec prototypes for LM so please use our experience in 
this area.




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

