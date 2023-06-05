Return-Path: <virtio-comment-return-6121-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7D4C7EE2C
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 02:40:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B3A3544341
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 02:40:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A20639863AD
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 02:40:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 985DE986339; Mon,  5 Jun 2023 02:40:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8790898633D
	for <virtio-comment@lists.oasis-open.org>; Mon,  5 Jun 2023 02:40:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekyA4xa99J5M94RC0tdyQqfG5cVFmmdwHz1LZ6idfdQZ9CAP0Hc1y5KrUNHtDJtRTwGRALMqbtfhBVfDS5HeEzOhsf5MQ13Vkb+wClJ2QUByXlltN5VB5cjgn1hjiL1Y5RbnPcSlkplAlEmyK1NgOC72pnRWrSnmIPc78gErkTykUWol1jb4e4xStWhXLVRXJfD9nP/M53DVgyQp7EUChrWURGdJHpCNO1b6qj7bbdKu5hU3lGtEspx/wyL/hUEDG6tlsGC7ib4rG9LQlldQR6qQREUbL9FQnETZSUGTumRZe0JN+o7EQpAV8hcjxl1hWo7Mtlun3Ro2IhiK6imulA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1OxC/NJ30BoNWG8SP9ePcAz7Gh/Bxmadeg3r0vvmKcE=;
 b=RnTUgLRcE0ji1Gh2FksTURj2wrotaOkrO1bV5utpxmEh7mZ1hpeGF5GfEhQBJFzut9tqQfWdInXZQHuLIA+D+y0Tcv+WuWmdiwv2eOY7DZsyJNY454X4ObKtHZK62v1aPJwdu/sKTU21BJSgOF4+rCNMnxzF8skOQfhvzgHa1/fRLodMke/NhOylel7YfskavnWfmlFWipwfjr/hD8B9JCL6aN727XF/LiCnGIO/M9dRHm7mDA3q8KpdYMpCAEPL6nWT1zZvBsYF8EO4koOKiIsOQGX4yEzBzUvlSxy7gL6i0N7N2YzG+LeUreALyz7SK5ZFBfDNgzSGBBPkgx8loA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <7238af9f-25e3-8490-a8dd-ee63435caba7@nvidia.com>
Date: Sun, 4 Jun 2023 22:40:06 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Parav Pandit <parav@nvidia.com>
To: zhenwei pi <pizhenwei@bytedance.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: mst@redhat.com, jasowang@redhat.com, virtio-comment@lists.oasis-open.org,
 houp@yusur.tech, helei.sig11@bytedance.com, xinhao.kong@duke.edu
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-3-pizhenwei@bytedance.com>
 <20230531140640.GD1248296@fedora>
 <1572fc8c-2c92-10df-e109-6586a9692e0a@bytedance.com>
Content-Language: en-US
In-Reply-To: <1572fc8c-2c92-10df-e109-6586a9692e0a@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:408:10c::20) To PH0PR12MB5481.namprd12.prod.outlook.com
 (2603:10b6:510:d4::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB5481:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: eb5423b5-6603-4060-ea55-08db656e2d3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WWDi1vjDMa8OSPPIw72QV45uTee88DMLetYIq/SyJmyIUy+wTQN7x+aL8VW+PX8tN3uyi+SY9ychp8nhwXUrV3uW37tF27sRpUacLq/56lY3LTADklEhnv6XTj3xpfthPwipOcLAyZugJeK/GTIyvQCh1F75M8HAUa7gEEbbMrTbwDbUr8vlr5x+aYYogCdMaOfFGMzyzEwoKxHJXzPvOpvw7VnlHMteWyOcwLlg81AQYCV2R+w3mNRV51Wp1Sim+4IbmKioqAIP0XcCPjhPUORjjRjjA6SqeSAMJV50gWvnVNpRONtTTS7R7EOzTQJLuptUo75applbJ13nq/I9ggi/8eiUZi98eubGTsfDaWI/NWzjW9xHR9p6SsekjxVZDDnoyCgQHzbaVFEc933dyXiqBEthcDA6hEbTwrXU4WJTziE5BHykrm0sBacszjdATD/fJnnCQL/9NHVyUKUcp3tR0lo3+psheg4+p0SR4L5xcfj/p91lizxZXziaSuKI53lTvPSV57xc6U4UU0Z+A62FW/GoMC6oasGaB/R38eQTFmym8hLrNvupIdAqSk8Hh7myaT8z6qP5pygSyh88EIQduM9Yl+woFq7cca5soSkaZBipvGNDp3uvF1RYmd+3Iea2Wq+OKzGSMN/a0YqvAg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199021)(53546011)(316002)(8936002)(8676002)(6512007)(66476007)(66556008)(41300700001)(478600001)(38100700002)(4326008)(6506007)(5660300002)(66946007)(31686004)(186003)(83380400001)(110136005)(36756003)(2906002)(6486002)(2616005)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SldjOHJVeVk0dE5jd0NOVWNxSjJBRFVqSlp1ellTRWFSdURyM0w3K3pyOUV5?=
 =?utf-8?B?dFBaRkhDWXU2MWs5Um02QWxQYVl5MDFCNlF5ZXh2WElpcWxoN3hsbnZwZVlC?=
 =?utf-8?B?ekhCVWdsenZqSWptMWtsZEVmNVZqZGhqK1RhRzBBY0ZzeE5Eak5KcmcvR21m?=
 =?utf-8?B?aTY1ZTlHRHVnL29VbHNMSGRSVUo0aldtWGJicU16MEJJQk5ubmpldzJINUtE?=
 =?utf-8?B?OXQ2R2tKQ0xDbnEyMjM5dnRpaUFVbWJZY08xNmtwSGRMY1JldFpoRElJSzRq?=
 =?utf-8?B?d0lUbWo0WkdCT0E0RFZIZmlqN2FreEZBK2ppZ1lxTTdLcU5OQnlDalcwcEVH?=
 =?utf-8?B?czd4cHVJL0pwSFJiNDNFaDBMVWo3UmtkUEQvYVZRWlNJczVmYWwzY3RIeXdv?=
 =?utf-8?B?SHpJQU1oR1hPT1NiZ0lxSUp3RHFxRzdoVlluWDNNY3c5bGlRRjVBVXgxRys1?=
 =?utf-8?B?d3ZzQVVYTjdnaVJqMk1ubkYvTDVMWWF5cFBDeUljMTRzWldtTmtZWHlhRkI5?=
 =?utf-8?B?ZmkzSWZsY29yWjEyZWZvRkFGWUNiZE93My95dzJhWTUzbS9SZWR5OTBQVENh?=
 =?utf-8?B?TnRmTkoxRFR5WUMzNGpBTUpPS2xrdStJVzZEWUJCOEl1OFlhbVFVL1ZuMGZq?=
 =?utf-8?B?MmMvK3p2aEN1VUZQamNyVjVtZk01ZWFhbU9YbXYrNWUxQzkvVldmRG1HajMv?=
 =?utf-8?B?eExmSFR3djJGZkc2ODZScHIzQm1vQUdDZmdHR2JVTGJvNlF5YjkrV0YwK2FR?=
 =?utf-8?B?aWJpdHZwQnVqQ0NaZlBPQWhzdlp6Z0ZqNEh2MEZvQTl0WGxFMFk3NmFNb1Vi?=
 =?utf-8?B?bjBBV3FYT0Z0L2FQRG8vbzZkYTZxek5ON3ZVbGVSRlE3WVAvZVdIMlpDUmkv?=
 =?utf-8?B?clQ3K2NCelFER1ZBTXRXQ2YrdUZEUC9yYWhvdlFxL1lacTI3WWJmMnZxOHRM?=
 =?utf-8?B?dkpOQTZVV0FsMVcvbU1TNUV4dVd2VnQwNzdVc3VzcXgrdWhOcWNYMDMwYkh6?=
 =?utf-8?B?c2ZxRE1PRkdrQlBCNUpEQk5XVTRrWlVBMGNEQms3RHF5b2ZuWU9QNXQzb2Zt?=
 =?utf-8?B?N1lqUWJ1RXMwM1FHWEpMcHcxNTkvSHpqWS9vZ1orb3ZFa01ScEJKU21vYndp?=
 =?utf-8?B?NGhjRXJIaVRjYVZnei9jUldNNFhReis1ZnU2c05jRExiRU5DanVJNXdrdlNE?=
 =?utf-8?B?WHZZeDNkVVRMam13QkdEbHUvVTErY3lIOWJJVFBaQ3JjeThNN2I5ZmJ0U056?=
 =?utf-8?B?cGhvdkJYcWVTZFNmSFdCeTNMMHloUjJlZ0I3L1hkMk9ZZHE0Y213UThvQjZC?=
 =?utf-8?B?S0RwUHJyOCtkTy9NYmpYbnBLWFE0ckRpVkxzaEFqSFdJSDJ4bUdxWWVzVTN4?=
 =?utf-8?B?TGdaVDk4L2RsV2M1Y2NKV3JmSnc3YkduUVk1MUdsUWNlM29wbFN3TUMzVkt4?=
 =?utf-8?B?VnI0WDh2QjVYWm5YZTArMkVVbkVDelVsT0ZxeEIyaEwrNHJBWUdnaEYrb2wr?=
 =?utf-8?B?aXVrOFZQYTMvejhmM01vdVp4MHZQR2xIVlIzWkdNUk5SaHIwaTZtRHhNOVRM?=
 =?utf-8?B?VnRPbm52ODVmeCtIa0tQcU5qdGVJd1ZDUzhsRG5UcXdoR1NsNWlzNFE5VG9l?=
 =?utf-8?B?a3Y2clZPY01oQ1pkSi9aR1dKNlRrdG1paisyd2RaLys1Z0MvSTU2ampSVGtN?=
 =?utf-8?B?RWtnVDI3WWNLMEhWR0c5RloxYXJuZzhOajFsN1pCcmdhNUE4Z3A5TUFFaS9v?=
 =?utf-8?B?aVdVS3VXVEdqb2RkaDA5NHBmNjRIbk9LZ2haS3ZKV2hiNGtpd2lzRlIvT0hS?=
 =?utf-8?B?QVRNb3YxKzU5V2h3VnpTcHZZQzVtWjlMcXA4Ly9kdWlIVU1tbmxaYjBXcFJ5?=
 =?utf-8?B?U1lUeHF1U21GU0g4UUpqRkJqQm5kUHhHOGd0SCtZMTNwT1BuOHNYYk5EbEQ3?=
 =?utf-8?B?VlJOc3cxNkJkU3JvNEJmV1J6YXhKOHZoc1F2Snd2R24zbmdXNy80Z3NTUVNw?=
 =?utf-8?B?WmdlNHRHM1JzTFBmZStOU2c0RzFxUVhQalJSY2Z2QjVpaVJoeXpmSVkvYXVT?=
 =?utf-8?B?YWhja2p0QWc1SWRib2ZNanVDQzJyT0NraklDYlNYWDV6ZWZRRWxGbGVteUtS?=
 =?utf-8?B?ZVcyM0pIMFpMSnIxR3pLN1ZWQkZXdjZGdWhUQkpjaFJUcHMzSnl1Rk84WVMr?=
 =?utf-8?Q?ezQnyHUJblD0nu9scLE2fGbfa1GVj6yvVv8RmTzeGLxJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb5423b5-6603-4060-ea55-08db656e2d3b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 02:40:08.4618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OeJU9oFYG0EzNge9bVKeYljj0/7LYX2MlT2oX0I49TIt0T8gHcTVEaZfCbJzBsCbCLiS9jMkSmIn/05pOkaBXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8754
Subject: Re: [virtio-comment] [PATCH v2 02/11] transport-fabrics: introduce
 Virtio Qualified Name



On 6/1/2023 9:50 PM, zhenwei pi wrote:
> 
> 
> On 5/31/23 22:06, Stefan Hajnoczi wrote:
>> On Thu, May 04, 2023 at 04:19:01PM +0800, zhenwei pi wrote:
>>> Add VQN section. The VQN is a little different from iSCSI/NVMe-oF on
>>> style limitation. Because iSCSI/NVMe-of is storage specific protocol,
>>> the full string IQN(for iSCSI/iSER) and NQN(for NVMe-oF) represents
>>> a "storage access address". However, Virtio Over Fabrics works as
>>> transport layer rather than device layer, a URL style string is better
>>> to Virtio Over Fabrics. For example:
>>> virtio-of://blk-resource/nvme-pool/849a39ad-8d7b-4a7a-adb6-e7407ace532c
>>> virtio-of://blk-resource/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1
>>> ...
>>> virtio-of://crypto-resource/25307f22-e5a8-4ea2-b7ca-79f5c3bebc3c
>>
>> I'm not sure what blk-resource and nvme-pool are in these URLs?
>>
>> Should the patch mention the virtio-of:// URI scheme?
>>
> 
> Sorry, I missed the address and port. They should be:
> virtio-rdma://192.168.1.100:8549/blk-resource/nvme-pool/849a39ad-8d7b-4a7a-adb6-e7407ace532c
> virtio-tcp://192.168.1.110/blk-resource/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1

Since it is device specific resource, may be blk-dev or blk-device reads 
better, as behind this device there are multiple resources.

> ...
> 
> This is human readable string. when the software(or hardware) handles 
> this, this should be translated into:
> transport: RDMA
> address: 192.168.1.100
> port: 8549 (default port 8549(CRC-16/ARC of "Virtio"))
> target VQN: blk-resource/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1
> 
> This section only defines the "VQN" schema, not the resource string schema.
> 
> For a process, I think the following two are both fine:
> ./foo --full-url 
> virtio-rdma://192.168.1.100:8549/blk-resource/nvme-pool/849a39ad-8d7b-4a7a-adb6-e7407ace532c
> ./foo --transport rdma --address 192.168.1.100 --port 8549 --tvqn
> blk-resource/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1
> 
> [snip]
> 
>>
>> Is the maximum name 255 UTF-8 bytes plus a NUL character? Please state
>> this in the spec. For example:
>>
>>    \item The string is NUL terminated.
s/NUL/NULL ?

>>    \item The maximum name is 256 bytes in length, including the NUL 
>> character.
>>
> OK, fix this in the next version.
> 
>>> +\item There is no strict style limitation.
>>
>> I think it's necessary to define representations for specific fabrics
>> (e.g. TCP/IP) so that VQNs can be exchanged between different VIRTIO
>> implementations (VMMs, DPUs, command-line utilities, etc). Otherwise two
>> different implementations may represent the same address differently.
>>
>> Stefan
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

