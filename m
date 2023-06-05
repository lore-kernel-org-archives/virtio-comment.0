Return-Path: <virtio-comment-return-6123-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F12C77B73
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 02:41:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B247860083
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 02:41:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A60ED9863B3
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 02:41:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9D7DB986339; Mon,  5 Jun 2023 02:41:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8D38C98633E
	for <virtio-comment@lists.oasis-open.org>; Mon,  5 Jun 2023 02:41:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVtwDiwMuF9Ldz1iXcIrUjF0/w3dI1/LVy1JFuZ9IIG3hhX+a5r+GMIEzJZQcDqVQTbRfRIeGt2hbXCZ2jGMuU0xuiLZVxkZSeydra5BpTYrplc+QZU1WfnJekLxlti6OYp9PmHkP+fKFYRA5Lnn96Ns4/cxGZhkfKfSsVJqOcODfWBrslr5DzBbqbS996Ro8VPDFK2amXK1CDqPzgBi4tNLMGgQxu9gN6f1yxB2tZfjPv9pUmGHoUF/EfDHxR0y8xRD9jidlQNrvvy+RTLXpTNkXHrvv70KaLDMfRym4QN8yaMFuz0Cg6b0QPj1+CIh2tHTD+iLymuEULBXLy01tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYVWL0RpYzubb3bqSKA5dfw/YIjQW6bNZSPdT76iaVA=;
 b=HThOh+JORk+8dmPGMu12fewzwdVuJQinCVaMnNdAGqvZdiT+lnAVsllgxaY9kWR8oJSpoj8O4z1a5uIoUUcgW544RxRWFe2BDB2a0RnjTcYYvJCAjsNTfkol/jMq1wID4fLwjYETS2X2QpOCnrox0LFlSPvMfR/6iT7q3j4cN4GTW8kOtV69IXcLQtGe7Xban9fgAteTZyu9M0l+sHkcCphwyj7ezjkjpf3fgKesku6jFJ1eBVuYf1+yAM1VaPn3Xxdlrhmxtc+Q6jQZJauspCDZM7jDnxsxM9fkyViG3/aQq9juo4QseCkWDaRL/bD6Bp3dYqJMWZjcewRgfgnkJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <6b653208-ca45-4674-4568-9cb003e14d02@nvidia.com>
Date: Sun, 4 Jun 2023 22:41:09 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Parav Pandit <parav@nvidia.com>
To: zhenwei pi <pizhenwei@bytedance.com>, mst@redhat.com,
 stefanha@redhat.com, jasowang@redhat.com
Cc: virtio-comment@lists.oasis-open.org, houp@yusur.tech,
 helei.sig11@bytedance.com, xinhao.kong@duke.edu
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-6-pizhenwei@bytedance.com>
Content-Language: en-US
In-Reply-To: <20230504081910.238585-6-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:408:141::23) To PH0PR12MB5481.namprd12.prod.outlook.com
 (2603:10b6:510:d4::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB5481:EE_|CY5PR12MB6648:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd0be08-d5fc-4bff-d5fd-08db656e5248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4ffdwt+ayePlLeyLk/2JnNHWmFpczb3ni1fMe8i3U1uu/AHdz7AUgHKdJjQZv2sHsnJ7R71qJULBemH8jcPXNm0uvulyCDxQgZ/b126AhSMLv00LpyZW4WQJdTvxps2EgGnq7H9MkciM0d+7BHF+NReq0sL+YB9Lr39TOp/AgS2AOgqdLSK/7JQy3ifUnX87GzTjyRdBiuS58xfaGVPLQH/C7p7tUim04NIVmfCKhsdjX+b2FCfDKsS747UBQrveNvKqT7UqrpRyQ1eim/tJ8iSBlbxscZg6C80FtKgpgnzF9DMsRrcc+IBiTmB9m/Cul/gG7ruovGEqS8FHUuESCxEu/zF486Y2czofITVzI03vM/yQrXJeozavK7YkLrGh+tF4YH/bBCvKp0B1MlKpisqirQhUe9SwIOWfBn/idLadZnIxFbzPZAFNiOy4xLXJuRfev8IQ26XynSGZyDd02XXgSTPRi/trYXsuVuPWQ/x7k2+eZXcV1BbtXLYg3CAPayy7SGdJx6Xi8dLtH+u13AjCmt7uuTsW379EVhApIe/enCsTpJL36Q9lDH0JAMpD+hTHcWcdxmyXdCCjV86Ec4akWfCGNVRHwvcc2pqT3MkU+AZp43Tk5/IlXLVEf7DPJYBMcUyDGboaGbmdseHD6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199021)(478600001)(8936002)(8676002)(4326008)(66556008)(316002)(38100700002)(66476007)(66946007)(41300700001)(2616005)(186003)(83380400001)(6486002)(53546011)(6512007)(6506007)(31696002)(86362001)(5660300002)(2906002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVN5Vy9heDl1MVNKaFo5NlNSaHFwOTJ3aEpRRHNXcVZQRGNuNWp4alhVdzBy?=
 =?utf-8?B?TWtlU0Q3enY2M2lyQWo2YkhWbE83d1pMM0M1a0FiZmlwTWtnUzNIRi9mSVhP?=
 =?utf-8?B?QlZxUXNwQWNJVjBlenoyQUNGblNuTGtZU2R4dlN3OUptQVdLaTFIajFKcExo?=
 =?utf-8?B?dTBNL0FEdTV1RnZJcFc2cCtVNHU3aEdQbGFlcW1LMDdEcVR1bEwxUjByMGhX?=
 =?utf-8?B?N285WXorWkdzaU5sU2dqL3oyOWc1Sjc0bFBRbkVyZXFyenkrUmtFTmJobjhl?=
 =?utf-8?B?aURrWDQvUkl6Wkx4NnRaS2Rsa0c4RjdnYjhkeVBpd3ltOW5wK1hhcEZkQ2or?=
 =?utf-8?B?R04xdkRzelB4NWxPOEhrZDVNMXpuUmF3elVnZHd5STNmM2xTT0xaelJUSmFa?=
 =?utf-8?B?VU5ZclJEK0FMMmdpa0FuT3JHSDM0WG1GWTRLdzM3enlUSGlHa1RZM0pNRFZN?=
 =?utf-8?B?T0Z5RTZ2N0V1bVB6aEdhMkNXYUpCVGtLS01pdnN4T3RyZ3B0dHJXNk1seTdV?=
 =?utf-8?B?NFFXRW9hdmNRTnRJR2RWUWVRTU1XMDBJdDFRR1RoWnlmWXpYWm81TmcxMEx2?=
 =?utf-8?B?L0FXVFFibENOTEt6OGhsZ1FlUFhqeGVKRlBORjFUa1lqajYzb21aL1hiSVFj?=
 =?utf-8?B?emNGUzhTZUswSGFuQkQ1K0R4YjczaTFIa2I1eS9qa2o1WUE1QUt6eFQ1cWE2?=
 =?utf-8?B?U3JOeGZuTWk5UjFnYjNnTzFJclA4MHo5NUMrK0NNNHhQM3Q2bDYxRUZMZ2Qx?=
 =?utf-8?B?cDVpVWJUSDNJMXBjTVFINUZLTTRQVjFqYkM3Yk1KR2xiUUNocytVY2ZPb0t3?=
 =?utf-8?B?b0JDTFJoblRRR3lqNFNpSHkyRnhXb1VPNXFNYllBbUpkd0NKOFNEOUdzVndY?=
 =?utf-8?B?L3VWWU81ZzhNSVM4S3NaYm1pSTFWSGtpMkYrbXZnR09DQ1JmanorbnRhVjJV?=
 =?utf-8?B?ZlpEcmFWOUEvREI4cmJ1MnRSZXpWNDRuNTZPMnBINmxHellkSngzRDZPbEpw?=
 =?utf-8?B?SlNjVTN5enlxbERxV0hkZVM2YVB4a1A1M0psekY3VEpWc3pXMHNTd1ZvdlF2?=
 =?utf-8?B?aFdTM0tCZUNuZUQrMEI3RHZ3YnhVR1ZGZ2xISVhQYkgrWnBCSmhtT3ZGK29X?=
 =?utf-8?B?QUJMYlZFZWp5cWpFdCtadk13eFNNbzhyVzlsZGgyQS9nWldFV0k2RDJWUVpp?=
 =?utf-8?B?YTBrZ3RIVlQ4K29HeEUxS0hyb2tQSk1tRzFHQVhMc0NqT1dGNHpTNlhKMWFj?=
 =?utf-8?B?Y01QMHl4cFk2WTI5SWVmV3E2NkhoV1F3MmVmWktSUFY2SC9QQTUzMmVVQm1t?=
 =?utf-8?B?RlhLd3kxTDE4VTd6bVJ4VWl3OEJxblhqcGFmTSsvckZuVDIvRVRZamNLQ3Fx?=
 =?utf-8?B?cE9tRDdFUFdsc1NjbEVGNnBrWUt1RmJVd0JFSmVWZVgzYUxvRXdxRU1QR0th?=
 =?utf-8?B?OW5FQ3BTRXBvU0ttSjFzUWU2UksyQ1ZzR1BKdTg3M2dTYzhuMnVlRHIxcnA0?=
 =?utf-8?B?WUZERDFVVE5Mb0ovOTlua2EzY2FOVHpYQ0FpUkRrU1lXV0ZUd3lIdGlqNUJm?=
 =?utf-8?B?dWlJOEJPVW55dWh4WVAyVXZhajhXQ1U3bld5QzN6cGEvT2RZcFREeFB3TzIz?=
 =?utf-8?B?aU41UCtUbHVVckEzd2hmUVlDWUt1cy9uelJyMmJuNEdwN0dHcDNmYlNja1BW?=
 =?utf-8?B?OU05R3hpWkVJSUNDMFVsdEdTYnJiS214bElxaUN0cnV1aWg3N012aEFVeVh1?=
 =?utf-8?B?L0ZqbVRENHErTHFwTUd1cnFEcit0U0hKSS9EYkJSYkpVV0RZcncwakIyMUJX?=
 =?utf-8?B?d0twWUhLQ20wZWhOaTdaM0dwak84TjRGT3Q1UUFUbzlFbzBGYzR0bG12Q1BL?=
 =?utf-8?B?LzRRUDJzSjhrZ3NBVkpBSTFZSThhTUZWZDdmaFduemRSbEFjaktGVEVWZ1dG?=
 =?utf-8?B?ZlRZYStlTWp6OFhuektjWVlRVVN6dnQxTXBncVZXNEl0TTJZQnlHOUQ1YkJG?=
 =?utf-8?B?cWlzTXFIc04yZnhSd1ZhRGJ4TUtUVHIzc0hERFR6SkhiT0VVYXgwWnFjcGNm?=
 =?utf-8?B?b1ZERVdWbDZKMVJCWmxXR3F0eXhnNzA0ejMvb3B4amMwcmZYTkRQVTJBeEVz?=
 =?utf-8?B?Q0NrK3QyS2RrUHVURDlpK1F3M1dRRHF1clhYMzB0akpSckRPOFpiajlUU2R3?=
 =?utf-8?Q?UEYyY/P48ABEg2c6dU/apAm1tsbXeG5wXXsYWsXGN2c4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd0be08-d5fc-4bff-d5fd-08db656e5248
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 02:41:10.5900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dw4/+IibXrHba0Tv34LSm6THGtuiSlk+rBWwmzDSukjY9DkchY4iNkQxwdYP7IzzWaLCZGFvhmfeWHPgDMA9KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6648
Subject: [virtio-comment] Re: [PATCH v2 05/11] transport-fabrics: introduce Keyed Transmission



On 5/4/2023 4:19 AM, zhenwei pi wrote:
> Keyed transmission is used for message oriented communication(Ex RDMA),
> also add virtio-blk read/write 8K example.
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---

> +An example of a virtio-blk write 8K request(message size: sizeof(Command) +
> +4 * sizeof(Descriptor)):
> +\begin{lstlisting}
> + COMMAND            +------+
> +                    |opcode|  ->  virtio_of_op_vring
> +                    +------+
> +                    |cmd id|  ->  10
> +                    +------+
> +                    |length|  ->  0
> +                    +------+
> +                    |ndesc |  ->  4
> +                    +------+
> +                    |rsvd  |
> +                    +------+
> +
> + DESC0              +------+
> +                    |addr  |  -> 0xffff012345670000
> +                    +------+
> +                    |length|  -> 16 (virtio blk write command)
> +                    +------+
> +                    |id    |  -> 0
> +                    +------+

for RDMA this id is not useful. It can be omitted.
still parsing the rest.

if we talk blk as an example, above command descriptor can be of 32 bytes,
such as
struct virtio_of_cmd {
	u8 opcode;
	u8 rsvd;
	le16 cmd_id;
	u8 inline_desc_cnt;
	u8 rsvd[3];
	/* some padding/metadata for long desc list if any */
};

struct virtio_of_rdma_desc {
	le64 addr;
	le32 length;
	le32 rdma_key;
};

struct virtio_rdma_op {
	struct virtio_of_cmd cmd;
	struct virtio_of_rdma_desc desc[1 or 3]; /* count can be negotiated */
};

With this a send and receive queue on initiator and target can exchange, 
cmd descriptor for read/writes.

RDMA allows mapping memory and also chaining it with next send.
This way, memory from 1B to 4GB can be represented using single rdma key 
for data DMA (read or write).

Completion is similarly 8B with status + cmd_id of constant size can be 
received in an RQ.

This is 1 RTT from initiator to target for cmd and response for whole 
4GB data transfer.
Depending on the data size, memory pressure, sharing, outstanding 
commands, etc target can read/write data from initiator memory using 
RDMA read/write addresses.

With this target can also implement poll or event.

RDMA writes do not guarantee data placement visibility in same order on 
the responder side as what is send on the requester side.

I ran out of time. Will review more later in the week.

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

