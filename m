Return-Path: <virtio-comment-return-6119-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EE8C7EE2C
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 02:39:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D435E41EE3
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 02:39:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BC4AB98633F
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 02:39:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AA7B3986339; Mon,  5 Jun 2023 02:39:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 946EE98633D
	for <virtio-comment@lists.oasis-open.org>; Mon,  5 Jun 2023 02:39:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ab3uYeqM5wHP6y/Hfgvh/8Nyz2K4aU2EWnrGXZtTkzC/Bhjkfe7BX/5gsN2Kn9IQF5Z1ySSP/XxGNKC3PaUR3AadN6ia2/ztTMfZOSeBtKPsUi9AdMIz/gsF+DnueaC0uR2TqldBQ+PjbyMzm0fB9sF9Q4OHvD5msVl2X5euUgUNdjNh/lhkhk2kEA79ZYSSOriTnv3UYdqHFLmVOtlJjOKi7kQHt9IKes1caMHq52k6HVRQ/JwdxVv/xy06RHBL6o4oX2IgqrjEdCMJZ0Fq0cIcwa9uCGV0B1nCq6No9ZZmylKbui5ZmhPNW+6DTE3F9oQ/+Ki/rX+LVNjGIfIIbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yc5mBwQCCPjv7+HFQ95qf+W7egdTULKnCgojicPtEBc=;
 b=JyR3HcK6fWgZWxGAges6Ejbt0+tdfCs4NAH/Xdu8z0dDn+LFCXLLWgTMQ5zpugF6S5WcEJAUHlSPtmrcPGFbw6TTQ3rrD8oxgGf38yO20+qerwBJja5/TDVctYpvqZiACIbYwoz9iioRhUI0mepeL0jgjZrU7J+hNQBUQsn/612fxzi4qIvQy3mIj7vuwXnBiy5lyzrrNsOzE2OBYdYA4ZoKsNBXuHgj+52nFcYfcrn972699GF6nFIZmL1iG68P9VjC2Ouf+3jsLl0M2fmwTYxYaLbqpJY8/11V7yCVim+Z8e0uI/EO8tlCdXK6Y1rI0eaBhTCXI1AJoIZuz2C7sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <98f4b472-7c6e-0086-5628-6272cb48ee57@nvidia.com>
Date: Sun, 4 Jun 2023 22:39:23 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Parav Pandit <parav@nvidia.com>
To: virtio-comment@lists.oasis-open.org
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-2-pizhenwei@bytedance.com>
Content-Language: en-US
In-Reply-To: <20230504081910.238585-2-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0547.namprd03.prod.outlook.com
 (2603:10b6:408:138::12) To PH0PR12MB5481.namprd12.prod.outlook.com
 (2603:10b6:510:d4::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB5481:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: c9fa5847-fc8d-40c2-7c4a-08db656e135b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gikgw/cXD2Zyl50F+6CXDVMmqBF/ZS6rick+vfAysH1kCUpjTK0SItK1W+3XWWlJMzNcX0qdwxSNeMAcZkD4DDnXuHxEw43WHwSLiSeHnBXMl8DgrBvcNyzXaRgYKtFQKZEiTVaGpC/4u6YuOcrqdcTi1I9jaPuXyCDWvxW2ioid1JgSrAQr8x9vCZkOFuyO4he0wL3FBK/zWN3OOG7/qNGkWmWwasO9ifS5AgHbpJE0UXNKJZzmytv6XYezMqW7CImjqG6zjF3xVaJlExGqxO7ziuo0PPobsf33SVa5HiBfdkaz7vjA4El0jm3R934NFWY8CP6fHmmrWx1H3yYVaMTo98C3QS/OJcQqJ4NDlJpTiYvWW1YUZBqnkKMeJkSV1zF3bM7uao49KTtpV/CufNv3BXx5OQ93WZHPE2c5Co8DbtyMuUWWmQ4KPq+RywNHj+HqmHvDZ2syVvHrVY0KBk676f/6l7p1kJwB6lCuuxo2Jih3dKVMKQLYN45fRy8hVDL+bEJp4QhQXaHw8quLtqPVNdqjqvAl6buag5RWGLs336uCir3ZqxJmOWg/uk1k3EuakXe4Pyrbg8fyoKKpxfQMqPdakE9NrlUP1Tn3HKN1PtF7Vcupd/HOrwJ+UBA0Ir7+WUUg/MUR0/ItSPSqgw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199021)(53546011)(316002)(8936002)(6916009)(8676002)(6512007)(66476007)(66556008)(41300700001)(478600001)(38100700002)(6506007)(5660300002)(66946007)(31686004)(186003)(36756003)(2906002)(6486002)(2616005)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUp1OGRDNGI2WmRxRnhWVWxnSjRLV252aEVuSE1tc2JEMkJJN1czcG9yY3d6?=
 =?utf-8?B?L0F1QWtRRm5FSm9XVlprcGhTLzdMVndWQTNDRHNnQm9GUmt3ZmVlRHVra0hq?=
 =?utf-8?B?bWYvblN6OEJNOW1yQzdPQnVNZzNqbzFzQnFOZWR2NlA5M1RMczNtclpoQU1S?=
 =?utf-8?B?ZXFBZVE2TWNKMkxua1NBUUNIaHNzMmZuRVBTclZUSUNGNk9OOW8xalZnMDBR?=
 =?utf-8?B?ZlRFWm40bitoNlRtZTFQVS9YeW5kaGpvS0VMM3RPQ0FJZ3BTNTBldWJnS3lz?=
 =?utf-8?B?T05zZHVtR0xNazlENTBRQlhKK2FNNnh1Y1pqNlhqUklSSkl1U0V6UE5Ja0RO?=
 =?utf-8?B?b0JLalhUY2UxYTRCaVJsOUVuVWs1RzNFRWVTVVF2KytZNFkxdEs4T2wyZCt2?=
 =?utf-8?B?UDBYWDBhUlJITEpnb2VzL2l4eUxkQzFhT1JyRVVnbk9Md1JJZnI5REJNOXRo?=
 =?utf-8?B?VzNaSkFlM1RNK3BLODA3TlJoN1FETS84YTgrQzAwZW0xZ3ZWRlRCL2Rydm5K?=
 =?utf-8?B?ekk5S2d6OFNqdE53OTVxUy9KK0NCclN3RkRGdTRteUtjUUNLcDdoWlFWR2Zw?=
 =?utf-8?B?QlIyek90MldQUzhBWFJSakhxVWxTbko5S0hvY3RTeUUwUjNZclBmQUtDNDJK?=
 =?utf-8?B?L0N0TE4rMjBvaVdBMmhsTjZ3OGJ4Sm9xeWJha21rakxlbGNnZnE2N1RWdjhF?=
 =?utf-8?B?UGNybnNJZ0ZQNFlFRlBua1JrQStZUVR4eDlTSFdtUlRoUUU3WFNpZXNrb3Zj?=
 =?utf-8?B?ZlYrYkcra2xGZ2RhcU5hODRHS3AzMWhid1BjUlJDV2xwU2NiU2s4RUEvdUpF?=
 =?utf-8?B?QkROSHJQTGYxTElYbmtWMHNGeWFyOWFoWUdwQWlaY0gwMnFOZ05wcE9BRXQ2?=
 =?utf-8?B?bWFPS0tDWXhVSVVxQkx5OVdZZzFNekZLdHJ4azQvT3ZpaWNIcUY3anVNcVpv?=
 =?utf-8?B?ZWZMamJqUXZnaHJYZjVLOWVJT0cvd0FvYWFEdGZDcmlWVkZPT2RSTFQwZjJv?=
 =?utf-8?B?ckJ0UlVGR0IyamxoWWZZQUhtaFBpZFVyOXE5UENuTytCeTRRWTVLNFhsM2Uy?=
 =?utf-8?B?UFljYWRDTjhZdDFQYlVVSDVkeE01djJMdi9keDhnNW9hRk1LeDkzU2d2blBz?=
 =?utf-8?B?OGdQZjZxNUpCZW1XRFVtcmhRNGhicnZWSUlVRVo0cmFRdzhmeDBmNS9ydzJy?=
 =?utf-8?B?b3plOVo5YzZJMyt2ZnB1WkVnbm41allGUVVlQmtocG9OTERRRElJRXFnWDNQ?=
 =?utf-8?B?ZlRINUkvZFN5MXV3UC9GR01EM1R6c0RSUjdndjFqWlZNdlkyOU52WkZ6dmt5?=
 =?utf-8?B?cFUrNmNhMEM4cjIweFU0VlNZZ3hlTlJkVEhYcFdOQVhrMzhhNXF5eHV0ci9k?=
 =?utf-8?B?OCsrb3dHWXhYOTNmUHl2Rk9lV3VXMkJiRmJoMHpvVVVPQmJkNDBjMjNoVG90?=
 =?utf-8?B?NHJUWVpzMzgxVmZkMURoVXRSaFg4Vmt0U2NrVDRqUHZkd1VFWGNuNGdLTkRS?=
 =?utf-8?B?ZFFzdmhiRkpjUWVSMmFTTHgwRlQwb0FuUGNpV3U4b1pESlRneHZuVldldUNz?=
 =?utf-8?B?QWlqZHRMVGZRemVJUlppOVZHWDF0bmJkZkgrbCtKb2xuNHZTUG52b3FFYVZQ?=
 =?utf-8?B?bVJKMEZLQ1M1bFFtZ1pHcVloTTFScmFiaTVaNkZ2WHl5eWdmMEJhVzladTZw?=
 =?utf-8?B?WTFVeDZSeG45UjBWam11MzN1QmtNQ2NUQWZPWW9BVlBTcWJZdlVyK1dJY3Jl?=
 =?utf-8?B?QnV1cjJHbE9LS2kxT0tlT2hSQkY5Tmp0RUlrU0Fod3lPay84bVFOSjAwbTV1?=
 =?utf-8?B?TkVGZG0wamljSnB4SG1VNzRGR3dNbzRidG5xTGkyTXZSblZjREpRSWpBZUYx?=
 =?utf-8?B?QkNrWTdrOWlueGx4RTJBenJ0dUhESTBjNGlaanZ2Qzlod1Z2dytQejQ2U1hz?=
 =?utf-8?B?S0VNRndNcXBGdlpxcFNqYXhjWnVrUU40Ukd3RkRrOWJ1ZzhxbjRWQ2NnTldw?=
 =?utf-8?B?QjBZOExuYzZpYW83RllGUG4yYXhrNll0SjRnbktaUmdNVUg1NzkyczJPS2o3?=
 =?utf-8?B?RnR3ZVJKZnVzZEV6cEkwYmE0dllEeVUvRU85UzBXalVMV0xqenFQQ0VjdVNu?=
 =?utf-8?B?dktRU0sxT2MvK2lnMWtlOWhMYStyVTR2bFE1NklRVjc4TEc1d2E1SndnaFhM?=
 =?utf-8?Q?AxkqI3qeaWvElHwY2/OgnKLuI4ekvYeoqpRiQUMw4gaM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9fa5847-fc8d-40c2-7c4a-08db656e135b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 02:39:25.0500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iu0cS0Ps4aChfK8SWO/fL2RQcCklr67ywR9avpJbHknOOxs67ckI/F+aH0PsEgkwO842ufDoVEOpvoOCW3XS6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8754
Subject: Re: [virtio-comment] [PATCH v2 01/11] transport-fabrics: introduce
 Virtio Over Fabrics overview



On 5/4/2023 4:19 AM, zhenwei pi wrote:
> In the past years, virtio supports lots of device specifications by
> PCI/MMIO/CCW. These devices work fine in the virtualization environment.
> 
> Introduce Virtio Over Fabrics transport to support "network defined
> peripheral devices". With this transport, Many Virtio based devices
> transparently work over fabrics. Note that the balloon device may not
> make sense. Shared memory regions won't work.
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>   content.tex           |  1 +
>   transport-fabrics.tex | 31 +++++++++++++++++++++++++++++++
>   2 files changed, 32 insertions(+)
>   create mode 100644 transport-fabrics.tex
> 
> diff --git a/content.tex b/content.tex
> index cff548a..f899c3a 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -582,6 +582,7 @@ \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>   \input{transport-pci.tex}
>   \input{transport-mmio.tex}
>   \input{transport-ccw.tex}
> +\input{transport-fabrics.tex}
>   
>   \chapter{Device Types}\label{sec:Device Types}
>   
> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
> new file mode 100644
> index 0000000..0dc031b
> --- /dev/null
> +++ b/transport-fabrics.tex
> @@ -0,0 +1,31 @@
> +\section{Virtio Over Fabrics}\label{sec:Virtio Transport Options / Virtio Over Fabrics}
> +
> +This section defines specification to Virtio that enables operation over other
"other" is contextual given the current spec definition.
And once this change is merged its not any "other" transport.

We can probably write it without referring to the PCI transport.

> +interconnects. A central goal of Virtio Over Fabrics is to maintain consistency
> +with the PCI device, so Virtio based devices transparently work over PCI or
> +fabrics.
> +

> +Virtio Over Fabrics uses reliable connection to transmit data, the reliable
> +connection betweens two rules:
> +
between
> +\begin{itemize}
> +\item An initiator functions as an Virtio Over Fabrics client. An initiator
> +typically serves the same purpose to a machine as a Virtio device, issues
> +commands to remote side.
> +\item A target functions as an Virtio Over Fabrics server. An target typically
> +handles commands from the initiator side and responses completions.
> +\end{itemize}
> +
> +Virtio Over Fabrics has the following differences from the PCI based
> +specification:
> +
> +\begin{itemize}
> +\item Instead of memory sharing mechanism of virtqueue, there is a one-to-one
> +mapping between virtqueue and the reliable connection which executes the vring
> +data transmission.
There is no concept of vring in virtio specification beyond 0.9.5 citations.
I guess to say "reliable connection that transports virtio command, 
status and associated data".

> +\item An additional control connection is required to execute control commands
> +which is similar to read/write register on a PCI device.
> +\item Virtio Over Fabrics does not define an interrupt mechanism that allows an
> +initiator to generate a host interrupt. It is the responsibility of the host
> +fabric interface to generate host interrupts.
> +\end{itemize}
In context of fabrics "host" to be replaced with "client" or "initiator".

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

