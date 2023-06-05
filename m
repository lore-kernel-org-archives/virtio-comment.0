Return-Path: <virtio-comment-return-6120-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1EEC77B73
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 02:39:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D21B542901
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 02:39:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CC3B09863AC
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 02:39:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C2AB9986339; Mon,  5 Jun 2023 02:39:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B28B898633D
	for <virtio-comment@lists.oasis-open.org>; Mon,  5 Jun 2023 02:39:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLPshICLIwFo4U3qnZinm5j2/x6royYxpeGB89yJ4gIsiq/MBSriKXf4Nc6L4Xng/+eOBMXTyxUm4U7IVXq9B3ke/HrVGZkGV+fgPTBjcb5HuybZFGs4VOn05HFiLQ49JxoXbOMkF5Jn2INK7K42G1oLNoFScSV7F7v3GJ4M4ylfieOYmDOy693rtX6smtdNy7ijI/h5LTh4L1UiiYxVzb2FGrV3hJSFO3e/DDCL2FAir40ArTJuqj3FF4RXIKfXni7cWNIdcLBWQuY/ILQmZnM4D+XUmrHhPr/Z6Fjam4pgcyAegfrpDJim5T++5MfgyCYiYU7ZkEnc7I2WAmDHyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWYpdcnpVACuMPhaW3nzYwK58o9RsUz+gjzvz2eE64g=;
 b=H37QQoSI3/s46JkjKCM+xEPxOVIAOHzvjlXV7LTP/boke+v5CvsgmMI7sApGvL1YZlwCmkATKTxJGXPXH8LDq1A3/l5fuG4cNoe6PWudpkbRc6s2lPPsun3riHUgwfREsia/GS5t2GL6mD0BRtxaL/oa4Ki8zj0TP3teenfeHG8MtcNCuOSF+Qe7jG61okzMhDavPjG+jzxT/F/C3q75dFC4ePyphA7WkPTJuYvBC8gVh5tobUo0j3Gu52F1t/nPV3Zd3GquAyVS3TA5tEBbjPDNl6ll1ikNNfLN/bXHRTfMCCxQMZd9yicISof8vHNkK3hHfFHzXvgHNdBv2Nu9Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <f7b65940-d375-326c-4a8b-995fabbc66d4@nvidia.com>
Date: Sun, 4 Jun 2023 22:39:47 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Parav Pandit <parav@nvidia.com>
To: zhenwei pi <pizhenwei@bytedance.com>, mst@redhat.com,
 stefanha@redhat.com, jasowang@redhat.com
Cc: virtio-comment@lists.oasis-open.org, houp@yusur.tech,
 helei.sig11@bytedance.com, xinhao.kong@duke.edu
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-2-pizhenwei@bytedance.com>
Content-Language: en-US
In-Reply-To: <20230504081910.238585-2-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0544.namprd03.prod.outlook.com
 (2603:10b6:408:138::9) To PH0PR12MB5481.namprd12.prod.outlook.com
 (2603:10b6:510:d4::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB5481:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: bc50d50f-6c98-4eb1-095d-08db656e220d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bW8hd/SjdlhrAfAK+WVetqSlA4ARE9CPwln41m4G+5NIJlsKN0dZR8GpHJeGmbSIEUnSe2jD3UQaNtOmUswt3+ObH9wZ1vMdU5T4QltjsSbrbBUtKeOXMM9B2GepTzlvEzKonss5VN+A/n9QN9j/+x4jdREo71PJo2jLD+qQMrVU4IJue3/F+P1eDok44AZtBSIEaGtQAuApk5gwrf8GnuSRz6/fpbCHyq+mluT2mEhZe7rEkqiM3lUNqDUu15sBd9uliB3jm9cztYAo+l/ZTTQlq6FXZFdufi1tLSOU4c8wA/54idkPMzgBVKRvIDW1I/S62+c7/bbm7fZ00VhjvKDa8D63Sm/EYa1IVNjHF1dRCALJKEV+xTzwLHnmc5JLQ53cG3aHKkUC0YjMCVP37Ejd3M3sq10U0Yz340HRXm9CZGEJgdAz0oZq/UIIromMI9b/PJjiPcFbYyFoiqEXmRHAJ7a+xCVN+dwDKwlDWHW0v8slnrPg+mMY3BvwI3IiYv2lgQWbmJs4cD3xe1Asi+Pv8lIBXfyPINwqHvbza3llk1VUC2Jv4h1umTQbaImmjkCHla1amC76O6ncvdxHCYd9tbsbYsexDsX4AD5dyHDYNnjWIvkSeow9DhyB4oPgvh+n+3K5cYM+O7NvII97XQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199021)(53546011)(316002)(8936002)(8676002)(6512007)(66476007)(66556008)(41300700001)(478600001)(38100700002)(4326008)(6506007)(5660300002)(66946007)(31686004)(186003)(83380400001)(36756003)(2906002)(6486002)(2616005)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWpHdjdaaC9QTWwzYWpzTWxmSWM0NnU5NkhiMDJZWEtLMkdpbGFyTEdzY3R6?=
 =?utf-8?B?djlGZjdsbXBROFZqdHVaZzQyWlZlQ2F3clU2VDNGREYwSW1Xbk5WODZDMGF0?=
 =?utf-8?B?WWpSbGNNZTQ0ZTdRdU9JQTVCY0FhZmRPbFhmenA1V1RQV1g4SmR6TERXVDNm?=
 =?utf-8?B?OHJZc0dXZmVJQXY3Wjh3Zk5rdlJMUlJuWmRPMXVDTVc3YWtlN1pOVFgzUTJH?=
 =?utf-8?B?eUpsbDB1QnpVYk9kMHdXUTg3ZTlHMzJUcktmZ0NGY0tMTnhUVFNWS0w2c0Vy?=
 =?utf-8?B?YUVBM0xIUW5nNHFjRXRoS2pSL3d2WnA0RnRWTW1RcXFTWEFqUS9HcGJFRDRp?=
 =?utf-8?B?ZTlIamFlRVFyRXdEakZITk55b2J2WmVUOTJBcko4SllxUVBNTFRsQk10a094?=
 =?utf-8?B?SmNyMlNYbTZ4eWEyMGRzNUtadXZ5dGp3emVlUWExZGJaZ2p3ZVpVUzI0cTFT?=
 =?utf-8?B?c1lqRDJibExpN3hCZ3h0UnZZamppYUVrZDdUYnJlcC9tYWlPMnVFZld2RFBC?=
 =?utf-8?B?c0p5WjkxVUlMcXpJc3RTNFJwMTFyakRITk4waXVGL1BLSFFsUGI0N0V5MENa?=
 =?utf-8?B?U3pydktIbzl0Sm1taWIwbHAvQWRiUjFyZ3BpbGNlZzAvT1ZiTHk0NzN5bTJY?=
 =?utf-8?B?SFFwOGN2T0NkY1hFNDU4OXFOVUdqV1k2WXJoS3dZUU82bXJ4bzBGbzVTZTVU?=
 =?utf-8?B?Tk5QY0ZLMHZWNUI5NVZ2Y3dkaE5qNHhyRGhZeTBZQ1F3LzN5NEI3ZWh5Q0p4?=
 =?utf-8?B?cFJHRmRJUDNNNmZwTXduVzJvUytxMFltYVAvdXh5Q2loOGQrcG1oUXpteGlq?=
 =?utf-8?B?dURSNnZzbENaNk56Vk8rTDd5amNqQzZVNklYaWw1RDVLSVlpTDBvUW82K1Na?=
 =?utf-8?B?dW01SGFHU3Q2V1BYMC83Wkw0TDRVdmxqVEJpYnE3ZE5DaWFyd3ZBcVhnU2FL?=
 =?utf-8?B?Nk02a1NHQnJyUkxSQk83dDl3dmFmWVhpTFFVNi9SRXY4OHJIMzFGSitMOThr?=
 =?utf-8?B?akFaMklVcUxSYXBEcjA3UlkxakZZci9PWnZERmxMcDNwQ205TU9sNEZQSW5L?=
 =?utf-8?B?NWswWDlqY0JjY2NSSkl0cHdjdzJyK3VlS04vYUdaZXZsQ1JmVzJNNmI2QkxF?=
 =?utf-8?B?dzNIVklIZjdqSnpvWFJJQXBRTW01dlk0OUZoamVTdXJaNVNmY1BQVWtTc25G?=
 =?utf-8?B?N2IyZmV4NXVtQWFsc3FTS3BSUWpyTDdncEVjMEpnYXpCOXNPdkZnK0toQm1r?=
 =?utf-8?B?b0lScUtGWHhnQmJ6d0hJWGh6RENBVzFRNHJjYmRRcG9zc2pPZ1NmQytrdGtO?=
 =?utf-8?B?TnNrOGo2YktpOEpyUkVITi9zY2JlNTg0ZFgxUXZ0WUdsK3lPQkhLelpkemZk?=
 =?utf-8?B?TVVHSnRZM3RFcnZwNDI0dkdNa1ZUbHBoOWZmMUlXYXNCNEVWSEpRMTZ3c2FU?=
 =?utf-8?B?a29HdWJrS1N2eEN0NG9PTjRuRHZrWnpFRE9zNnY5bHR5dFFYNXkxSExBK2dD?=
 =?utf-8?B?NVpDaVJnOVlCTjlNWjNvSWUzTDAxakJBTWhKMmp5SWptZnJ1b1lyYllnaGQ4?=
 =?utf-8?B?dEdMWnFQWVp2NGNrV0hpVmI2RDZYVnlERlRaTzU2K3JrQ29sOFNNNThHams1?=
 =?utf-8?B?Nkhub3V6R0VkcG5JS2w4eGlCZy95UXprcTR6VlI2bjZobk02TnJFT3ZKUXNi?=
 =?utf-8?B?azZmaUQ1M2VmbGYvOFVxZ292SEdXTlQxQTR4U1lqeU40R3dJR1M1L21IVlBk?=
 =?utf-8?B?bEhvQzBlYVBrNDFFdzR6OW1HNk1Bc2dDdmhWcGd5Q1Nha1dCOGcxcTJhdnJr?=
 =?utf-8?B?ZkVVSTVtOUc1OHNoNHBRMVNDRnp3akp6dGZRV0dMTkYwN2I5aTdKdWlNdlZM?=
 =?utf-8?B?WXYrNEdRM1ZzZHF2cXdKd2VjYWdjbDN5ck9YU2k0NTRhdUY4UHczcERpczNF?=
 =?utf-8?B?QmR4Y2JXdG5Vdjc0TWRJbHZXSllKVWs0WGp6dWlZWHJSRStuY2NEdEJpb2Rl?=
 =?utf-8?B?Tmt3cllmczFLbEFTQzNGU1p3Y3RYUzdoeXNGQVpWb0U1Zi9QRVBuK2JrSm1T?=
 =?utf-8?B?NGNuS1M3eXZxZmE1RGFOSjM0NUVVZUxwS09KTGRFTERuQ2R1czBvb3F1bE5t?=
 =?utf-8?B?VmhQRmozc2NQdWFhRzh3SzhPeXdTZzhOdFVYQWFHNU4zRllVUWIrMEVhT25Y?=
 =?utf-8?Q?N6qmoCavOjp8H1/CpjUtSEx0uEUZPmE0xsnH2nO1egB6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc50d50f-6c98-4eb1-095d-08db656e220d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 02:39:49.6672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D3DTtPvC0ynaJ9U186sATsvDgVZyENkt7IJ5qF0Re9EDOW67Vjdw5ApkumNl3JEoIxSlMDc4qVhu+TwFJ8xVpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8754
Subject: Re: [virtio-comment] [PATCH v2 01/11] transport-fabrics: introduce
 Virtio Over Fabrics overview



On 5/4/2023 4:19 AM, zhenwei pi wrote:
> In the past years, virtio supports lots of device specifications by

> PCI/MMIO/CCW. These devices work fine in the virtualization environment.
> 
> Introduce Virtio Over Fabrics transport to support "network defined
s/network defined/network attached

> peripheral devices". With this transport, Many Virtio based devices
> transparently work over fabrics. 
I am not sure transparently.
Probably just better to say works over fabrics.

> Note that the balloon device may not
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
> +interconnects. A central goal of Virtio Over Fabrics is to maintain consistency
We have 3 different terminology.
network based
fabrics
and here interconnects

best to drop and stick to fabrics.

> +with the PCI device, so Virtio based devices transparently work over PCI or
> +fabrics.
> +
> +Virtio Over Fabrics uses reliable connection to transmit data, the reliable
> +connection betweens two rules:
> +
s/betweens/between

"betweens two rules" is not reading right.

Virtio over fabrics uses underlying reliable transport to exchange data 
(as it is received also reliably).

because it may be multiple connections.


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
vring is not a well defined spec term today. It is mostly refers to 
legacy part of the spec.
So need to reword this.

> +\item An additional control connection is required to execute control commands
> +which is similar to read/write register on a PCI device.
> +\item Virtio Over Fabrics does not define an interrupt mechanism that allows an
> +initiator to generate a host interrupt. It is the responsibility of the host
> +fabric interface to generate host interrupts.
Please change to notifications as we try to keep the layer as much as 
possible between interrupt and notifications.

> +\end{itemize}

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

