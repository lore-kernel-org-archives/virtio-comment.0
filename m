Return-Path: <virtio-comment-return-5052-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB38C76195
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Mar 2023 22:48:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 143747C243
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Mar 2023 22:48:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F08BE98634B
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Mar 2023 22:48:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DE73698631B; Mon, 27 Mar 2023 22:48:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CC7BC98633B;
	Mon, 27 Mar 2023 22:48:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWOsMKGQtHlMbu2hfJkZNaLihS6gY1vbRPJuGoBhjelWtJ9ZIGOKPHDmkjRsAfP4ufzUwi1jkFbzxXiC0yeMytfkSOWBUqjknMPubWiX4d1kD1bvAVDD4MtONeQc/YwxjHTsPllCgeHeCQRG8E0KCqHX++BXJut1px295XCjwmOBTzTnOdipwykGtngGIRw+W9niQTbPndrSQz+r3DUVbtaFGxaD2BbHItgwV0YEL6sPaQP0uUTeTAtzTx0yJ0Z9W4xVikI4EBjKvsAcLoMYJztlAUjpCqqiA0z8RPEXdhGvdO6E5sF5KJALg6QtSz1roVd6Gu9DfdMKXjnxHqHGKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ioYFSZlVej/syCM80lGocOhwDbG20U0sCW5TUKDCyTg=;
 b=CkJo5G5XSAYLZ106A6aBXY41mBPROs9nvowOCgcLyF3QAiKXfLTWn7vRLhVQ4MbQ8iqldsUmQX2fFSJrxNDOHd9COogV7uCCIMpWxquJWVz7Vr6yZ7nPmbZmF0tiQCUmoaVcgFi2HxVCVFdwcR9rvsStIv0r6HYxsOIHwmiGOqF4Bky6dTZlAh7769CfWl7pPWwNPTD0vEsRvKM0BjeqhlwkRQSuSFVyehDWZwZSOdkqUQjfyR3Pipx8AVSALpFNRblEVeBc/p2zvx0L6N813ONFjrkZzVc2/SiFjsUJ5G1rQ6ctNODFdt8yNO+32LrfYkwglsKE7Kyerpe38JK56g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <68fc71b0-2026-fd99-22f3-d0313e597373@nvidia.com>
Date: Tue, 28 Mar 2023 01:48:32 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Parav Pandit <parav@nvidia.com>, mst@redhat.com,
 virtio-dev@lists.oasis-open.org, pasic@linux.ibm.com, cohuck@redhat.com
Cc: virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
 Jiri Pirko <jiri@nvidia.com>
References: <20230322215243.249524-1-parav@nvidia.com>
 <20230322215243.249524-3-parav@nvidia.com>
Content-Language: en-US
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <20230322215243.249524-3-parav@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::15) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|SA1PR12MB8117:EE_
X-MS-Office365-Filtering-Correlation-Id: 1643f0e7-5256-466a-15ea-08db2f15683f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EtgF5dkJ745GpcxjkwSkUDXiuuafH2vZUqKuPLyUVql5q/229XkEqsHH9M7t6163aKbYbkKEZJaCNc/HpvdtAd0PqdjJ/odMzQHsmXsl8Y5F5QcDpgKmcw5NZg6iZJl5n/XPnODfqDEl1AtvlJeEgTJOg0naB4fg7rvW5lIm1fzu64hppINdAja5ajTkLTSQPRT2N8Ej0clpXSvqtRnp2tloGQBvvzop1pc7ZTHH1bWGiED4E60pnwkDvL9YTRmc0iLRMTmPk+PQ7XDGuV3g8XZKJsc1xFbtV2t+gSRPt5GVeODP8xvlaPjKBWHrs4gOSes/iUJzpfwFYrrFwiA0xrIE5bZp1QViToml+HI0572OGHdA6C95JNHS6v+Snx12v7jCqjDTffWyNlPKfBbsIuHmQrKBbfxgqnuW4WfCnBtwY6hCupiMXcGfwPrj3V8E3M9nxYLgrcAQ8XAw/0lTB0kai+1n7QEqXD8g38f/CyD/uyvxdekOenhY1nZAeOBl15RQ4MTrQkwAoBPwkh2cDE+L5HOI5IzwseQcpVP2sZgpzwB/6J/FvTPKfbjLATETYYixk3+05PIJtN16V4LgGWP0p6rr1whJeJM5d5hGN5+LUrILK1kB8W5UibwmkYMmBqMbGpnwpm3nN7tW1xWg2c6EsUNgjfpYlKYWXvRp4Wi3sRxKeNlkrQ2vGRi6SCjyQDdYAjZogeAwCdL2u0kgF3CKSpZ7XgwzADjr2xuh/vc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199021)(8676002)(36756003)(966005)(6486002)(83380400001)(316002)(41300700001)(38100700002)(31686004)(66946007)(5660300002)(107886003)(2906002)(6506007)(6666004)(2616005)(6512007)(53546011)(4326008)(31696002)(66556008)(86362001)(8936002)(66476007)(186003)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VU44SExFY3ZKVDZVbUZ1ck52bjUwbnNsMUNGbU1lMndETW5kUFNhQUd1T0NW?=
 =?utf-8?B?YncxeUVUU0RoWUFQcGExTmIrRkxsM0dQNi9kNVFRSTZtU1ZNVWZVeEhWc21r?=
 =?utf-8?B?aEQ1UWVkallrRVEvK2U5VW80R3AxbFVSUmY3Vm9CNFRSNHNFalBFUmFsK1dL?=
 =?utf-8?B?SmJqNVJQamZ2b0NLRTJXVGd6V3g5Qk1EYVE3cDZKQTUrQUJrTzE1WERYWlcx?=
 =?utf-8?B?S3FNNkRmSmZNZ2Rxdnh2c1BQVVJDeGJac1pjTzVtTzNvZG83T2ZaVlprTTZL?=
 =?utf-8?B?T3VLVTBIcytYc1l1WWdkRkpManE2L05wTTVIbmtMc3MwR2F6NHZFQVd6WUNS?=
 =?utf-8?B?TkxMV1JlQkM5WnkxNXNRaFhtS1kwbTErcEJwVUNjTFVWNkQ4SThGdDhlNCtU?=
 =?utf-8?B?MWFBYllVTW5naUZVL1FqZTRUSnJQRUV0Y0x4NytrK1dER3M2VlUvcS9STmFY?=
 =?utf-8?B?N2RrUVQzVUxHNnA0SWNQdkhYOXhHazdkN1BURGhDV29JMEozMUhnRUtNYk9M?=
 =?utf-8?B?U1VEeC9kdmZMQXlLQ1huN0lwNmxveEMzMWJ1Qnl1WmttajBvVkN0YXFFSFk5?=
 =?utf-8?B?TzViNzJ6RGxlckV5RjhBOUZrR0JOMjdYU0dmbTJkSUJmRkJLbmJlekk5RDM5?=
 =?utf-8?B?NjJZckdoMnBKb3hHQ1NRY2xtd0p4NkFNY1VGc2hDaW9DeUYxcExWWjF6b0Fn?=
 =?utf-8?B?L0EvZGxsNFZVWXc1STZGQzNBNkhjblhVOThRVzF0V3hEYmhNbk5jN2l0MmlD?=
 =?utf-8?B?VU1jZWQ1MEZDdU8vZjY5SkFGN3Z2K0RCckJyMEtTa2hMTDhGNkF3VmlXU1h3?=
 =?utf-8?B?bnBUOFRwWklpeldlRk9DWmMvVWZ2ZktmaExncWF4eFN6ZWkrZjlDa0l1UlZX?=
 =?utf-8?B?MXY0SVU1a3NJSEswUW8vWVBsK3U1RU56R0U1aXllWWFyTnhNRUZXcmF4N0tq?=
 =?utf-8?B?Nkxvb3FXRWF5K2IwWWN1S1IyRWtoaCt5dk5peUg5aDdXK01tMjdYM2ZGUlRN?=
 =?utf-8?B?Y21HMWZUUGcxbkxidjE0MXBHV3lzVU4rZDVBMkR1Y1lTVlNjcllGZGh5THI1?=
 =?utf-8?B?UmZpcGNoSktqbXZ0R0psSzMvKzBXOVhCT0JOLzhyY1ZpWkwraEUzeVEzMGJ6?=
 =?utf-8?B?K0tQYk81emU0WU16RlBLZXhUSlMyWmRNK2FUWHUyNHM1RndEd1VLc2tsQXFR?=
 =?utf-8?B?c2hQcURtazZVU2JOdzdXU1JrL0tFZWhWZEtLMUlKWkpvVDlhSSs4UGtOaTNm?=
 =?utf-8?B?S2cxbDhCMVdSVXEzVXZZY04zOTZ3b3JLdzk0N0cyUks2R0Q4bFlKQjJpNklN?=
 =?utf-8?B?NXNlSFlKOHpGd01GWlVIVHM0MkZ5aml4L3BCZG1LbUtyejdHSEhMTGVuZGh6?=
 =?utf-8?B?dW9HcWFpY0lDb1JuZGZva295ZmJ6Q1V5cG1XU2w3QUdrMUFsSnhFcCtHcFJm?=
 =?utf-8?B?blhlSHltcjlwTDRVZVhFSEZjRS8zM3VhOGEza3R2WkpHUTBZWWY4eDVnZnd6?=
 =?utf-8?B?bUcxRklQY3VtVTVlL2xYOU5XbE9WNXhYTXBxVGMyUnI5SE13Qm1sMXVVSCtR?=
 =?utf-8?B?eHlXekJsWmdOSGJoUWh3MEtSRnF6OGxLNVJYT0VaUWZDMG5PUXF1ZXhBYUNW?=
 =?utf-8?B?SVN6MmVtazJMSThSbUFFU1NHZXBPUEJKZGY5UHJqTDdzYlppVVNDNStucVc3?=
 =?utf-8?B?ZmlGRW9wUzFJSDhnak9mR1o1bGZsNWhxYXZxYlVXU0ZVOHJLdjF6UVBqUzZ3?=
 =?utf-8?B?b1FLcDBRNjJnVjkxOVduVUFtaDZlOEkzbkV5WTVZcjFZWmV0a3NLaHhPMmxx?=
 =?utf-8?B?MHV1VUlXTGo1SitIajdMdzNIYVVqYnJnbWRJQ2svMVhmSy9pTENvdE14OG9M?=
 =?utf-8?B?K0pXVE05TVJaa0ZKNWEzMlN2RjQwTFE0eWFFbEhwVWx5Uk5nNXZnbDhBQWlV?=
 =?utf-8?B?TGY4SldFR2trczZ0b3JZU2xTTXJIelA4Ynp4YVRrdEZoL251WE5DK1JFU2hh?=
 =?utf-8?B?QnI5SHpIWndDWTVOL3FDYTlNbjY3UEFKUXYyRFlkQWJhbGU1ZkZzeWc1Qk9o?=
 =?utf-8?B?aXZPaHJSQmh5UjdncnJjWnhTa3g0NmNEalV5YWRzeXZwNytSR2ZOeFk5WW93?=
 =?utf-8?B?TlA1Q01pQ3FZSmF6TTM2aHBiNHlxZkRsWTN0WWFFNC9IMTB2SHh1UWpSWXlk?=
 =?utf-8?Q?2HSBT5e1YcPLa7ECBqmkUF7fIDyrZMfinQjKpCONJgrd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1643f0e7-5256-466a-15ea-08db2f15683f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 22:48:39.5612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ki8ljEN7gyIXTouc3PveOX+O8Ae6+N1m9Ep5uSPVUujYfCtx+Sw0flcricu18eZSTvpGDKpAt/bfXE3mo47A+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8117
Subject: Re: [virtio-comment] [PATCH v4 2/8] transport-pci: Refer to the vq by
 its number



On 22/03/2023 23:52, Parav Pandit wrote:
> Currently specification uses virtqueue index and
> number interchangeably to refer to the virtqueue.
> 
> Instead refer to it by its number.
> 
> This patch is on top of [1].
> 
> [1] https://lists.oasis-open.org/archives/virtio-dev/202302/msg00527.html
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/163
> Reviewed-by: Jiri Pirko <jiri@nvidia.com>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
> changelog:
> v2->v3:
> - addressed comments from Michael
> - changed vqn to virtqueue number in the Note
> - refer to vqn field instead of virtqueue number
> ---
>   content.tex       |  2 +-
>   transport-pci.tex | 14 ++++++++------
>   2 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/content.tex b/content.tex
> index 1ab7794..0f634ac 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -321,7 +321,7 @@ \section{Virtqueues}\label{sec:Basic Facilities of a Virtio Device / Virtqueues}
>   VIRTIO_F_IN_ORDER feature. If negotiated, this knowledge
>   might allow optimizations or simplify driver and/or device code.
>   
> -Each virtqueue is identified as vq number or also referred
> +Each virtqueue is identified by a vq number or also referred
>   to as a virtqueue number; vq number range is from 0 to 65535.
>   

Please squash this to patch 1/8 were you introduced this line.



>   Each virtqueue can consist of up to 3 parts:
> diff --git a/transport-pci.tex b/transport-pci.tex
> index b07a822..044c085 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -390,13 +390,15 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>   
>   \item[\field{queue_notify_data}]
>           This field exists only if VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated.
> -        The driver will use this value to put it in the 'virtqueue number' field
> -        in the available buffer notification structure.
> +        The driver will use this value to put it in the field
> +        \field{vqn} in the available buffer notification
> +        structure.

why do you add new lines here and bellow ?

>           See section \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Available Buffer Notifications}.
>           \begin{note}
>           This field provides the device with flexibility to determine how virtqueues
>           will be referred to in available buffer notifications.
> -        In a trivial case the device can set \field{queue_notify_data}=vqn. Some devices
> +        In a trivial case the device can set
> +        \field{queue_notify_data}=vq number. Some devices
>           may benefit from providing another value, for example an internal virtqueue
>           identifier, or an internal offset related to the virtqueue number.
>           \end{note}
> @@ -1005,7 +1007,7 @@ \subsubsection{Device Initialization}\label{sec:Virtio Transport Options / Virti
>   The driver typically does this as follows, for each virtqueue a device has:
>   
>   \begin{enumerate}
> -\item Write the virtqueue index (first queue is 0) to \field{queue_select}.
> +\item Write the virtqueue number (first queue is 0) to \field{queue_select}.
>   
>   \item Read the virtqueue size from \field{queue_size}. This controls how big the virtqueue is
>     (see \ref{sec:Basic Facilities of a Virtio Device / Virtqueues}~\nameref{sec:Basic Facilities of a Virtio Device / Virtqueues}). If this field is 0, the virtqueue does not exist.
> @@ -1035,7 +1037,7 @@ \subsubsection{Available Buffer Notifications}\label{sec:Virtio Transport Option
>   
>   When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
>   the driver sends an available buffer notification to the device by writing
> -the 16-bit virtqueue index
> +the 16-bit virtqueue number
>   of this virtqueue to the Queue Notify address.
>   
>   When VIRTIO_F_NOTIFICATION_DATA has been negotiated,
> @@ -1053,7 +1055,7 @@ \subsubsection{Available Buffer Notifications}\label{sec:Virtio Transport Option
>   If VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated:
>   \begin{itemize}
>   \item If VIRTIO_F_NOTIFICATION_DATA has not been negotiated, the driver MUST use the
> -\field{queue_notify_data} value instead of the virtqueue index.
> +\field{queue_notify_data} value instead of the virtqueue number.
>   \item If VIRTIO_F_NOTIFICATION_DATA has been negotiated, the driver MUST set the
>   \field{vqn} field to the \field{queue_notify_data} value.
>   \end{itemize}

In general, after fixing the above minor comments - looks good.

Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>


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

