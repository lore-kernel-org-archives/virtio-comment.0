Return-Path: <virtio-comment-return-7665-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61947CD6E5A
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 11:39:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B3568159D2E
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 11:39:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8A8D7986835
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 11:39:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6F9CC986602; Wed, 11 Oct 2023 11:39:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5F58A986603
	for <virtio-comment@lists.oasis-open.org>; Wed, 11 Oct 2023 11:39:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="381884820"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="381884820"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="824124173"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="824124173"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FbMVQmj8s9PzeVkX0oGg5LIKf2GAN0mkKY02SMPfFuuOz6zagpdZ+uIcCfhk32qRxyGroJdBAlIIDSp11y1eru+E7Kw6XIldI/eV1jmA6gV5MZf6qKoPjZBaxLQ84N5dadrYSdR1SdrCBl49ld4AGOrihmV4dGgLYP1+SrlvAATSYqcYwd6m9VsnuOmGzwKiODJvUX/ePoBMZgdF/TOG+du5BXRic4cEv7D/cE4jPzp72jVB/gNZlhFwjQM/h0QW+74kWtLJCSaOZVtv5+4vi+H6ISSZiQUiBWy66LK3O6KybVfo/GgybitGUQ5VZOpg3ZK5w2BPog8NoD2kwhHBQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/xs84NJZZP/622Y4fqj5Ap8DukgVITcz8PG9fTQEZc=;
 b=kzRsR+VWzZmQNXCMywkC7ZxAIBREgDhzjmJgQwTCpVxGCQ7NhHlVQjlREFufaACnYORKTizUya8vdX/uSR6IFgnakjRdcXwOX/xqske4mBeji9k3ArCAK2Rb+S3kF1gyUEIa+w8sKz+UO6cYjYJ8mfg5v5oJQCjNZdINaR0SIQ00cuUSTzBva/NrhmlQFauuhZ4VaLbrfwjdtxq+oPE9DyHXhazMhYOy+ECV0fUxN6kLALJOKSaLc6hXU875TmQRALGBEvoPK6UiwIHJ6etp2gStY4uMAFYyvl6/8RWpJzqdTmI1FhiDz7cImqdYZMESusirWoA5qrQhenszlIcrTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Message-ID: <b8d6172e-88c5-4f4d-8738-6ec6c90fdab4@intel.com>
Date: Wed, 11 Oct 2023 19:39:02 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<virtio-comment@lists.oasis-open.org>
CC: <vivek.gautam@arm.com>, <seb@rivosinc.com>, <sameo@rivosinc.com>,
	<eric.auger@redhat.com>, <kevin.tian@intel.com>, "Kumar, Sanjay K"
	<sanjay.k.kumar@intel.com>
References: <20231006160947.2227396-3-jean-philippe@linaro.org>
 <20231006160947.2227396-4-jean-philippe@linaro.org>
From: Tina Zhang <tina.zhang@intel.com>
In-Reply-To: <20231006160947.2227396-4-jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To MW5PR11MB5881.namprd11.prod.outlook.com
 (2603:10b6:303:19d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5881:EE_|SA3PR11MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: a534e785-be95-49e7-b661-08dbca4eb565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vi+mju8Ro5Uol1gnv5q3bllJcTzil+FgcY4Jiog/IVWjTi5wXMED2ViG2x5ZwzmKJ4x4dXdNjCDl4DHj3tL7uSKB3DgxZErauY99ObEHZOYJ8RgPIcgkukAVZsg+ijuu/qewO5qwjpSli2SyzpFR2Pn1kogGe2z1Ke6GvtUEDEZqD8MZIiLsawIofjsj8JB6HTv6rbs81x5bL0NcbalffRPXT4ZOld+u5SizHeJ7BE4zOjaIdSMcb2shaMIXtljbvqSukic9H3AZOtl5ZQJNMTPnWB4Urupv610qdwsPTanQ17rduiNdeVsfb3PN+LF380BiZrFvrJkg7roKRVYZ/SaBr//Bcrd00TkDZ57MLEuZBPrif7FPp0qy8PQ4n6eVptcZzR8A+K2SmLSzLqWMen/4HU3a/+7Tlt4ENmiXb0NoOIvJZ95APLzAiknCxXZCDBgyAC53vATE2SqhFqFHcsW9HKJn3A5Bc0u8XHXUbWdrwKjdQFxxPq30nOAxIb0KjznZEF2GwpgJLEScXlNdCEuOWbA/T/RJ6u69vEV3Vyy8Xex4Z7AjhL+sms7DKhddUBDPp7KB6QTYvb9EtdeHvbyWVBr3V5VVuDlqc4OhkO2b98NKUz1ekVYwZly8eWBrphflgKlbZmgMewag4vqZ/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5881.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(376002)(39860400002)(136003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(31686004)(66899024)(6506007)(2616005)(107886003)(53546011)(6666004)(6512007)(36756003)(86362001)(31696002)(82960400001)(38100700002)(316002)(30864003)(2906002)(44832011)(41300700001)(478600001)(6486002)(66946007)(83380400001)(26005)(8936002)(66556008)(4326008)(5660300002)(66476007)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enZQVURjdWFrVjNGb0RXeVJJbUg1L2tIOEdvcjE0c1FmWFBLdy9oaTlGMkl6?=
 =?utf-8?B?WGZNOWdzV21KUFh0cnJ2Y2NZYWM0M09qSWdibmtGd0N6ZVZiZWtjZTMySlVI?=
 =?utf-8?B?QmZuK1BqWVMxRm5wK1owTEx1czMvbktlcGJ0NE1hMHB3UDhHNmpJbXpiQy9p?=
 =?utf-8?B?RWIzRGNSMk1nYkJHaVpiaVorME8zakd3cXplY0N3OFJPc3JQV0haT0lQdktx?=
 =?utf-8?B?Tml4aHAzV2E2ZXJHWlB3aGx5UkFkcERlWkdRWE5UVm56OTZ6SXZMTTF2NDhX?=
 =?utf-8?B?LzlpOWlweklqR0MwM0xTU2lhM3RFY2dWYzNzbTBzTm5oT3F4TG5yY29wM1BY?=
 =?utf-8?B?R3Fsa01nellVWXJOZzR2QlorcmpTMlBQakhRRTYyRDYrMlAvaS8zYjlhdnZy?=
 =?utf-8?B?SXluZnN3cUQrSkkvSUN1empZbVZpWGF2b3JHcEVabmh6bFNBdDFvKzhuOUZG?=
 =?utf-8?B?WG9FVFVSVmZYTzRyTm1hdGV3TXBsQzBRQ1ppVEgyZVM2UW9FaThLclk4ZEg5?=
 =?utf-8?B?U0tMWkxLMjZHWWNHTFJPdGovdTV1L1dVTml5dUh4dlhTNGhzK2JyL2J0NlVR?=
 =?utf-8?B?YkZiN1Y3ZUZCRkZEVTRpTkFjMTV6NWlKQ0NCQzh5WVE4SHYxU2FjaUZIcFI5?=
 =?utf-8?B?OFpGZjFXU2NwVkwxeVhETWJsMWhzM2N4cDJtbnRqOWNFTVE1cHhsQzh2RDlW?=
 =?utf-8?B?TDNscGVINGRaV04vVXljYVBIdDM3ZDZyZDBSNjZ1bFpyUjFoc1czN2xURC9j?=
 =?utf-8?B?dkx0QS91MTNGL1FsWkYrdDVoUWNaWDZWUlJlZ2lHVE9TczRlWnJjVmsvWkhX?=
 =?utf-8?B?NDZEaUlQZ1dsUStoQW1DKytoTCsrdHdrMmhDYTRQNjhrdGswSURlQnlBRFBq?=
 =?utf-8?B?SWN6ZXBUbGwvbzlyKzlMU1pVNy9XTDlBR293ZkE3ZDRtMnI4TkJOZGdVVWtH?=
 =?utf-8?B?RlIvOVF0YjBIdnBDWDdTVEptU2thTFJkejRibFpKdUNubTVhSWVPbDVGNGJM?=
 =?utf-8?B?dmlXdWQ5dFlkMHo0a2h0Ull1UG4vS2ZTVzZEdnpwTzgwWXVlRTVkRVpvMkdI?=
 =?utf-8?B?bktGZml4UDB2YWRUQURVcGxmRVZuUFB0TkFjZXJid0FMSUxQckhKaW53WFAz?=
 =?utf-8?B?Q0hFTEhOQlRHNm0rVDYvUDlOUHlCMlpmSTk4Snd1ci9ZY2k5SEIzQmpVdDMv?=
 =?utf-8?B?RXBQY0tScG1VUVJNdzNmSWM3czlDa2hQY3JTTWFiNUJzR256cURUUXlEd1R3?=
 =?utf-8?B?eW1Ia3ZtQ3Z1KzlTTGtMcWtEWXJrWUlrQ0FGV2JBN1dGQWM3TEdSemlqQ2lH?=
 =?utf-8?B?U3pjNkJ5NGx5QUg5WXFEZ1dVYjdZcnUxQnJsbVJscHdraDJzbmsyTXNkZWh2?=
 =?utf-8?B?MDhoMGI1NE96azg0N0VhM3NRQThpQm5pR2wrZG1DVmlnNGdLSHlBMGk0cDNk?=
 =?utf-8?B?Z1JmRzV4cEw0NmlmMmFTTnRJVCtTbzNYbVIwSDl3V3BOcG9jOVRDNHZVYlF4?=
 =?utf-8?B?MUtZU25pUnN4b05YRDdHcDRjVFdXUW1JaS9kWTA0dHM4OC9BMmptVHpZNTl5?=
 =?utf-8?B?MnRjQkFaVll5YWZ3NWQyTnFPeTRFNzhPempTRkFjaDNlbVhrRWFFTTcrYlZ6?=
 =?utf-8?B?RG5MS1hlekx5L0F6bmMwT0RTajVTdEFqYWVjVnRMT1RLNmZNS1lUVnhhZ0ND?=
 =?utf-8?B?Uk5ic1Z4SWVPc0EwTU9HMk5GMDlFaEgrclFRNHJOQnQzWFdlN1oxQk5lT1hz?=
 =?utf-8?B?MGJkTzl3UWVIUEh2dkVpa0tIMzJGck4rS3NFcXdFdzBWMWhtdEgwTCtsZ0h5?=
 =?utf-8?B?VVhqSUV0VlVMdWx4L082K0lmME12bDNsdXIvZXQrMzJXbG1BSXBrQTBCemlB?=
 =?utf-8?B?WUt1K0lVTnJlTGJodUY5SklnNllEMFgzT25LbEpDUmdNc3pwUGVRTFVJR09L?=
 =?utf-8?B?ZnZpWmR3S3FlM0x5L002ajNkblI0dFRmcFhLU01DTkowQVhTVnNEcWNhQ0JN?=
 =?utf-8?B?QjBTZHFDZEc4S2FORm44Mks5dm40a05UaWo2Z09RNjM1NDFaVGVFNklqaFdT?=
 =?utf-8?B?TERCb0tUNlp0cnpUd0VudVhTM1ZnT1UvYlRjSnVPa0ROM0xhblBkMlI4YWR4?=
 =?utf-8?Q?YKAg6qmtgu3qCwPKJVJ8Gei9S?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a534e785-be95-49e7-b661-08dbca4eb565
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5881.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 11:39:20.3701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hM4HkTj1eqc37Bw5GgnNzoBDa/Xb45GwRon7/m78j6L+fuTyP+0oCL4Tbj72rrKSIb5KdSt+Foud9lV6sDOCqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7653
X-OriginatorOrg: intel.com
Subject: [virtio-comment] Re: [PATCH v2 1/9] virtio-iommu: Add ATTACH_TABLE request

Resend the reply and CC virtio-comment list.

Hi,

On 10/7/23 00:09, Jean-Philippe Brucker wrote:
> Add a way to attach page tables to a domain. Only introduces the feature
> bit and the ATTACH_TABLE request. We'll also need new PROBE properties
> and INVALIDATE requests.
> 
> It could also be ATTACH followed by "SET_TABLE", or "ALLOC_WITH_TABLE"
> followed by ATTACH, but this leads to fewer domain states. With
> ATTACH_TABLE a domain can be free, attached-with-map or
> attached-with-pgtable.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>   device-types/iommu/description.tex | 113 +++++++++++++++++++++++++----
>   1 file changed, 100 insertions(+), 13 deletions(-)
> 
> diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
> index d9d484c..f81d96d 100644
> --- a/device-types/iommu/description.tex
> +++ b/device-types/iommu/description.tex
> @@ -54,9 +54,7 @@ \subsection{Feature bits}\label{sec:Device Types / IOMMU Device / Feature bits}
>     The number of domains supported is described in \field{domain_range}.
>   
>   \item[VIRTIO_IOMMU_F_MAP_UNMAP (2)]
> -  Map and unmap requests are available.\footnote{Future extensions may add
> -  different modes of operations. At the moment, only
> -  VIRTIO_IOMMU_F_MAP_UNMAP is supported.}
> +  Map and unmap requests are available.
>   
>   \item[VIRTIO_IOMMU_F_BYPASS (3)]
>     Endpoints that are not attached to a domain are in bypass mode.
> @@ -74,6 +72,8 @@ \subsection{Feature bits}\label{sec:Device Types / IOMMU Device / Feature bits}
>     whether endpoints that are attached to a domain are in bypass
>     mode.
>   
> +\item[VIRTIO_IOMMU_F_ATTACH_TABLE (7)]
> +  The ATTACH_TABLE and INVALIDATE requests are available.
>   \end{description}
>   
>   \drivernormative{\subsubsection}{Feature bits}{Device Types / IOMMU Device / Feature bits}
> @@ -84,7 +84,8 @@ \subsection{Feature bits}\label{sec:Device Types / IOMMU Device / Feature bits}
>   
>   \devicenormative{\subsubsection}{Feature bits}{Device Types / IOMMU Device / Feature bits}
>   
> -The device SHOULD offer feature bit VIRTIO_IOMMU_F_MAP_UNMAP.
> +The device MUST offer at least one of the
> +VIRTIO_IOMMU_F_MAP_UNMAP or VIRTIO_IOMMU_F_ATTACH_TABLE features.
>   
>   The VIRTIO_IOMMU_F_BYPASS_CONFIG feature supersedes
>   VIRTIO_IOMMU_F_BYPASS. New devices SHOULD NOT offer
> @@ -142,10 +143,6 @@ \subsection{Device initialization}\label{sec:Device Types / IOMMU Device / Devic
>   
>   When the device is reset, endpoints are not attached to any domain.
>   
> -Future devices might support more modes of operation besides MAP/UNMAP.
> -Drivers verify that devices set VIRTIO_IOMMU_F_MAP_UNMAP and fail
> -gracefully if they don't.
> -
>   \drivernormative{\subsubsection}{Device Initialization}{Device Types / IOMMU Device / Device Initialization}
>   
>   The driver MUST NOT negotiate VIRTIO_IOMMU_F_MAP_UNMAP if it is incapable
> @@ -177,11 +174,12 @@ \subsection{Device operations}\label{sec:Device Types / IOMMU Device / Device op
>   Type may be one of:
>   
>   \begin{lstlisting}
> -#define VIRTIO_IOMMU_T_ATTACH     1
> -#define VIRTIO_IOMMU_T_DETACH     2
> -#define VIRTIO_IOMMU_T_MAP        3
> -#define VIRTIO_IOMMU_T_UNMAP      4
> -#define VIRTIO_IOMMU_T_PROBE      5
> +#define VIRTIO_IOMMU_T_ATTACH         1
> +#define VIRTIO_IOMMU_T_DETACH         2
> +#define VIRTIO_IOMMU_T_MAP            3
> +#define VIRTIO_IOMMU_T_UNMAP          4
> +#define VIRTIO_IOMMU_T_PROBE          5
> +#define VIRTIO_IOMMU_T_ATTACH_TABLE   6
>   \end{lstlisting}
>   
>   A few general-purpose status codes are defined here.
> @@ -395,6 +393,89 @@ \subsubsection{ATTACH request}\label{sec:Device Types / IOMMU Device / Device op
>   attached to the domain, the device SHOULD reject the request and
>   set \field{status} to VIRTIO_IOMMU_S_UNSUPP.
>   
> +\subsubsection{ATTACH_TABLE request}\label{ref:Device Types / IOMMU Device / Device operations / ATTACH_TABLE request}
> +
> +\begin{lstlisting}
> +struct virtio_iommu_req_attach_table {
> +	struct virtio_iommu_req_head head;
> +	le32 domain;
> +	le32 endpoint;
> +	u8   format;
> +	u8   descriptor[111];
> +	struct virtio_iommu_req_tail tail;
> +};
> +\end{lstlisting}
> +
> +Attach an endpoint to a domain, in the same way as an ATTACH
> +request. In addition, provide the address of a table describing
> +the mappings. Instead of using MAP and UNMAP requests, the driver
> +creates and removes mappings by writing into the tables. When a
> +mapping that may have been cached in a TLB is removed, the driver
> +sends an INVALIDATE request.
> +
> +The driver discovers with a PROBE request the table formats
> +supported by the device for each endpoint. The driver chooses a
> +format it recognises, and sends the ATTACH_TABLE request.
> +
> +Apart from \field{domain}, \field{endpoint} and \field{format},
> +each table format uses different parameters in field
> +\field{descriptor}. Table formats and their associated parameters
> +are described in section \ref{sec:Device Types / IOMMU Device /
> +Acceleration}.
> +
> +Some formats support \emph{page tables}, where the ATTACH_TABLE
> +request contains the address of a \emph{page directory}, the root
> +of a page table tree which describe mappings of a single address
> +space. Other formats support \emph{PASID tables}, which contain
> +multiple page directory addresses, indexed by a 20-bit identifier
> +called PASID (Process Address Space ID), providing multiple
> +address spaces per endpoint. Field \field{domain} corresponds to
> +one PASID table: a second ATTACH_TABLE request with the same
> +\field{domain} and a different \field{endpoint} has the PASID
> +table address. The device is not required to support attaching
> +multiple endpoints to the same domain.
> +
> +For some formats, the PASID table is managed by the device rather
> +than driver. The ATTACH_TABLE request contains a \field{pasid}
This is what VT-d hardware expects when working with viommu (no matter 
it's virtual VT-d iommu or virtual-iommu) with VT-d IO page table 
support. If a device is directly assigned to a guest, the guest viommu 
driver fully manages the PASIDs of that device. If a device is providing 
I/O device sharing service for multiple guests, the PASIDs value are 
assigned by host. But, in either case, the PASID table is filled by host 
VT-d driver, not guest viommu driver. So, from viommu front-end's point 
of view, the PASID table of that device is managed by viommu device 
(i.e., viommu back-end).

> +field and a page directory. Similarly to when the driver manages
> +the PASID table, \field{domain} corresponds to one PASID table.
> +The driver uses the same \field{domain} for each ATTACH_TABLE
> +request with PASID. Issuing a DETACH request without PASID
 >
Here are some thoughts about domain id interception with VT-d IO page 
format:

Virtual VT-d driver uses the same domain id for first-stage translation 
is because it's required by the VT-d specification, though guest domain 
id never gets to hardware (i.e., host doesn't populate PASID table with 
guest domain id value).

According to VT-d specification (section 6.2.3.1):
"Scalable-mode PASID table entries programmed for first-
stage translation or pass-through (PGTT equal to 001b or 100b) must be 
programmed with a DID value that is different from those used in any 
PASID table entries that are programmed for second-stage or nested 
translation (PGTT equal to 010b or 011b). This is required since 
hardware implementations tag various caches with domain-id as described 
in Section 6.2.1. Scalable-mode PASID-table entries with PGTT value of 
001b or 100b are recommended to use the same domain-id value for best 
hardware efficiency."

When VT-d IO page table comes to virtual-iommu, the definition of domain 
id doesn't need to be exactly the same with the one defined in VT-d 
specification as the viommu providing the service is virtual-iommu, not 
virtual VT-d and only VT-d IO page table is being used (domain id is 
defined in PASID table which isn't being used).

So, it seems more reasonable to define the domain id as an identifier 
for an unique domain for each address space for virtual-iommu back-end 
interception. Any ideas?

Regards,
-Tina

> +detaches all address spaces that were attached with PASID for the
> +given \field{domain}.
> +
> +An endpoint that supports issuing DMA with PASID can also issue
> +DMA without PASID. The configuration method of the address space
> +without PASID depends on the table format, but typically consists
> +in reserving the first entry of the PASID table for DMA without
> +PASID. In this case, for a format where the device manages PASID
> +tables, ATTACH_TABLE requests with \field{pasid} 0 attaches a
> +page directory for DMA without PASID, and DETACH request with
> +\field{pasid} 0 detaches it. A DETACH request without
> +VIRTIO_IOMMU_DETACH_F_PASID, on the other hand, detaches all page
> +directories for the given \field{domain}.
> +
> +\drivernormative{\paragraph}{ATTACH_TABLE request}{Device Types / IOMMU Device / Device operations / ATTACH_TABLE request}
> +
> +The driver SHOULD NOT send ATTACH_TABLE requests if the
> +VIRTIO_IOMMU_F_ATTACH_TABLE feature was not negotiated.
> +
> +The driver SHOULD NOT send ATTACH_TABLE requests with a
> +\field{domain} currently attached without table. It SHOULD NOT
> +send ATTACH requests with a \field{domain} currently attached
> +with table.
> +
> +\devicenormative{\paragraph}{ATTACH_TABLE request}{Device Types / IOMMU Device / Device operations / ATTACH_TABLE request}
> +
> +If the endpoint identified by \field{endpoint} is already
> +attached to another domain, then the device SHOULD first detach
> +it from that domain and attach it to the one identified by
> +\field{domain}. In that case the device SHOULD behave as if the
> +driver issued a DETACH request with this \field{endpoint},
> +followed by the ATTACH_TABLE request. If the device cannot do so,
> +it MUST reject the request and set \field{status} to
> +VIRTIO_IOMMU_S_UNSUPP.
> +
>   \subsubsection{DETACH request}
>   
>   \begin{lstlisting}
> @@ -512,6 +593,9 @@ \subsubsection{MAP request}\label{sec:Device Types / IOMMU Device / Device opera
>   If the VIRTIO_IOMMU_F_MMIO feature isn't negotiated, the driver MUST NOT
>   use the VIRTIO_IOMMU_MAP_F_MMIO flag.
>   
> +\field{domain} SHOULD NOT have been created with an ATTACH_TABLE
> +request.
> +
>   \devicenormative{\paragraph}{MAP request}{Device Types / IOMMU Device / Device operations / MAP request}
>   
>   If \field{virt_start}, \field{phys_start} or (\field{virt_end} + 1) is
> @@ -609,6 +693,9 @@ \subsubsection{UNMAP request}\label{sec:Device Types / IOMMU Device / Device ope
>   
>   The driver SHOULD NOT send UNMAP requests on a bypass domain.
>   
> +\field{domain} SHOULD NOT have been created with an ATTACH_TABLE
> +request.
> +
>   \devicenormative{\paragraph}{UNMAP request}{Device Types / IOMMU Device / Device operations / UNMAP request}
>   
>   If the \field{reserved} field of an UNMAP request is not zero, the device

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

