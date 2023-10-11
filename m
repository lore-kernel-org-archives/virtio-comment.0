Return-Path: <virtio-comment-return-7664-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83662CD6E5A
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 11:32:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BE1881318CC
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 11:32:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A6E52986828
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 11:32:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8F79E986602; Wed, 11 Oct 2023 11:32:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 808EC986603
	for <virtio-comment@lists.oasis-open.org>; Wed, 11 Oct 2023 11:32:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="384488049"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="384488049"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="703698534"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="703698534"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4VfGLkhyXR96b8yQF4fuRC4mm5Ys8iZEIi5eu+yyTRkJT2Y2cpNgHv1k7M9b0ZKAzCHRa+JvYSeIHKIdZiIn3GehFeuCXgTxRVyF5XEydIYnhUQ31SrYqeoetcOHOkDLuBvY4GANc9PjeEncUp6QPub/kiVf+FPa60zg+q4KA0ef3mVT9vpLak+BTsxLOECXXFB15VGfFST60LpKXHM5EAFlo8n/wpc8+gITvhI9ME1xl3ULoUWVjhs+ITqPlXGIhlKXgyDzkJqI3hiWtlvef9Z2nHP/Ma3RMnnRwSh8+nCJ+9XVj4H6CvK0ozmArBkT1YN+6QMN1Bo7nKrejXkkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6o7KilVRQ85GzOErbST4uKLL5JTHLGZ42o77YNyAqcA=;
 b=Icxtq+r4pQM2lFKJJY2kA8xUU3bcdJohIGSrJfuTI0O5qM6K/wy9ard8HGTd5q2V2+9v+Kj3TzRe6does8QQ1PH+b5fV5XH676cNGDjTo03+djXb/Gg+wcps9DR+gEeOoSgsIO1ViOsNppkHnYH/Me6eMFSF9ymfhrukLJyi4khPu7sHMsz7bNAC8meZPkzbYCBr7mcflW3Wlu+YlqmGTJ/RfWmd4sz7KvyfOMjiM3m/iuX3sybvaPI3xDJcwnTBTji14jB2rv7vKPLsy8b55sZXM8J16NM50JGbS+dHDmLYtCuXg2wh20ytYAcuXCCQ5/gRJxhaf+/fJl3Qm8gRvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Message-ID: <b905a036-199c-47b7-ab51-4c31f39193a1@intel.com>
Date: Wed, 11 Oct 2023 19:32:01 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<virtio-comment@lists.oasis-open.org>
CC: <vivek.gautam@arm.com>, <seb@rivosinc.com>, <sameo@rivosinc.com>,
	<eric.auger@redhat.com>, <kevin.tian@intel.com>, "Kumar, Sanjay K"
	<sanjay.k.kumar@intel.com>
References: <20231006160947.2227396-3-jean-philippe@linaro.org>
 <20231006160947.2227396-8-jean-philippe@linaro.org>
From: Tina Zhang <tina.zhang@intel.com>
In-Reply-To: <20231006160947.2227396-8-jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KL1PR01CA0081.apcprd01.prod.exchangelabs.com
 (2603:1096:820:2::21) To MW5PR11MB5881.namprd11.prod.outlook.com
 (2603:10b6:303:19d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5881:EE_|PH7PR11MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: d7b7ce1d-b37e-43b8-3c65-08dbca4db450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1V3kaOwR6oDRbmsko+2t/ACGqTcGMP/Ruy45eKW1xInhUDVhmeSzjw/1Ma5QiTJLGf9oq1PZiT9GJHvwXR1JFbbX6eYEEaU2rrIMH8K4+KNEkgw1+RJQ8JmCNBEgeoDqrtdVgDIbGIx6db1syk8d1rXCzaQOdA36iCiaAJRuNJNMxE7u7Tr1OQob0SxnS7mWvsnAqGV2F2xKui+nTtMZD3GIxsCP5NsmK11kryORvEoHKLD1TdbC+teshZaXi2oxxojk1ip4JY5FiaR5sNBHvDChLLW9/+2w+KW3V2Fl7AOJ0gAn5k3ryVIuqz8vW2vpyoRb3+3mqn3vD7u9Exz1gCIL54UriMnP5GP4G0aWgOP6a8OpoJ31paelHZZuyL/LZkSXeGK0sITkYJQsHd3q2qQ+qNyaXQMTLdR6DgNt46i1kY2k1x+zq6cYYwIOqgsPprfbnsDlCDf7GhQviWviyrR6lZ2ZmEw+QFa21cGlXDK6yLy5uHDUACf9HiI9sJ4m1Q+zQSJawHLLAVvu4Lx/lBOseFQ0UUcULPyHOnxitUuNTXAKXBOrmyEZjx3ffBAjyUQL0+/Vrh0UT2iLT+hC7rtV7krjy2O5aJps2S1dhfInKQ9gaarvZrCP4DmLopz7o4s67CKGHpkufiINTcBITvQ6k5TOM5+3gMKe5QiDLBNHADaaYET1vnrHOtExhqKK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5881.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(366004)(136003)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(107886003)(83380400001)(2616005)(53546011)(6666004)(478600001)(6512007)(6486002)(31696002)(86362001)(6506007)(31686004)(66946007)(316002)(66476007)(66556008)(26005)(5660300002)(38100700002)(44832011)(41300700001)(8936002)(8676002)(4326008)(2906002)(82960400001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2tWb0JtSVl1SG9IQnBnN29CRzcrY2NGMTdRWEZGU3Rza1lPUUZqOUhyYWdo?=
 =?utf-8?B?TnVrbnFWbUo3Y2hqUmRFdGtpb29aZHF6Z0dGQTJkRlphMFp1a3UvQ0FMY1do?=
 =?utf-8?B?OVM0c0o5VllDaHEzMG52bTYxZmhqdk55b2dUcEliaHB4aXhYTklRSlhNODdZ?=
 =?utf-8?B?aXpIa1AxZGNwRys0cDJUMHg0RUJRVGxCNERnb2FzcVB5T2VlMnlYcmVWQTRN?=
 =?utf-8?B?OStYZjBETlhGd2kveFlNQWJKUUx0STczRzJQcW4vbHlselcwK3VYdVpkRFdp?=
 =?utf-8?B?T3gwTFNVQWgwM3pDcndMdHEyellKUGljU0c0SnAvSCtiUkZaS1NvSWc5SXJk?=
 =?utf-8?B?cTQ3aUkxYkRMYUR4L1VkOXJEdHVENkRZN0FLVVVhdEZ0OVJUOWYwekpGcHVh?=
 =?utf-8?B?K2k0cVlidXdhdGFsM3hXd05BZlF2b1RxVU9MWDlyc2VGcTYwZGhGSG5CQm0y?=
 =?utf-8?B?aTkrdXBpZjdQWUlXb1p0aUpFbGZvRFB2Y3VLZ3lSRGtabHo1Mk9WQkNtNUt6?=
 =?utf-8?B?QjZ0TXFKNEVsMUI4cUJreCt5UENaNEdUZnRIc1BGZkM0V2NuRG9ZNU1KamRp?=
 =?utf-8?B?emRpN0VhVGU0QkJEWUNuRmpseFUrSHhUdDdrNDZIUjhnNjhzYklDd3Q3ZXF2?=
 =?utf-8?B?RHcrUUJFWTFBWUN2cGRaQURBY3JDQk5YL3JSenloKzZBMGlWN09pTU40U3I5?=
 =?utf-8?B?RUtaYjlrcDNZaGNLVCt5MlFlMjh6NDZnaTBWaGFQYW55NXA1a2dySUFlTVk1?=
 =?utf-8?B?Z25GWUlpeU91UkF3WjhodDl3QW16dDZ1UHhxajhRNC9iNDJDbm9Zcm1ja2FU?=
 =?utf-8?B?SFN0TjhkRldtMGptbXpFcmFTMWFJd25HcXRaVE1lTURUWUFQWUJpR0hESmJu?=
 =?utf-8?B?eEQyVGdPdWxoTjlOYi80QUlIWi9VNjlYQkx1YkpKMEI2bVJFb1NUVWxnUHNM?=
 =?utf-8?B?Ly9HVHhzUUdONHo5TFRmWU1La1ZiWU1YbFBSRUcvUXVlMjg0UTFBc2FJQkZE?=
 =?utf-8?B?RFRXcVljajNMQTY3V2IyTktwNm5KTkVqWk5paElCcm9Rb0d6YWIzVjhhUktv?=
 =?utf-8?B?L3hTSjZnNC8xNHRmczg5V3hJRHdLbUdUOVBFL2g0R3RBM3VWOXcydEVnalRF?=
 =?utf-8?B?dUw4S3NYSHA0SkJWT1AvQzdUTVZHWkQvK0pjZHVuYUR5VmZLLzh3ektNYkJw?=
 =?utf-8?B?WVZLZERQMTY2NWtZR0FZMUxuc1FNRXMrUWtldTQ4KzFEampyT0NLYTdqYUpF?=
 =?utf-8?B?dnlMUUdLcUhYVFRRcElGdmZPTXNlUlpMMHFYT2VReHBpeGEvSzhKNVFmUVBO?=
 =?utf-8?B?WkowaFl3cWg4VmZUYnhtbmpES1ViVEpFeHBKY1dweXpXZmNJeFd5TXVyYkY3?=
 =?utf-8?B?KytEUS9TVDU3c2I0TDhpWGZFbWtxM3gvcWpiVHFLc1hxcnNXby9JaGxkTXZN?=
 =?utf-8?B?K3RXbWYzTndlQXBKVDdkTmlGSkZadjh1RzNGODRtOVFzaGFpOGlxcDhwL2wz?=
 =?utf-8?B?MGtPcE1kLzFvSUQrbG5mM3pxLytnanRqZkQzVkNGVDRNbGdabGFZcXlKdTkr?=
 =?utf-8?B?SUU2T0ZCWk9YNmFSaGhHTkw1Y3BUUFdiQ2xnbFNzK3BCQTFQM20rVFZFbmJw?=
 =?utf-8?B?TG81T05VU2dnbFBXMlV0cUpuSXRKNElqQXlSaUdaR1lzSmppbXJVOHBVbVJw?=
 =?utf-8?B?NmZFTmhYK1dzNlNXQ0MzZTZGNnFVcld1WTFoMlFCL0RUN282YWhYWXBnSkMz?=
 =?utf-8?B?Q0FNWlZ2VWhpRHIzbFJpQ1NIb2Q1WEtldDlJVG5GS3RZUU5CZExVaS9VSFp1?=
 =?utf-8?B?MENUZHJaTkRZanhGT0NkMG5vYmpwdmFCZ1BEMHUwTW1SYzBHWW0wUnhJeHE1?=
 =?utf-8?B?TjF1UWkzV0tpOGZnWlRzSXc3N3A1UVJXaVVPamxhekJzOTZvMGtMdkxDS0xF?=
 =?utf-8?B?WTBFbGJqb09nUGJHZHY0aFRDWVlQejk4MTloZ244N296Szd0ZW5FTytIaE9R?=
 =?utf-8?B?Q3I2Z1BYSkxuYnUwb1ZLaE9RdE02NllydXUzVGdQV1lqa1BnVVgwcXg2cUZQ?=
 =?utf-8?B?Yzd0S0MyWE1BUEhEZnlhSlpWNzA5Y0tPREErU055QVB6UTh2L1hSSFJxbHd4?=
 =?utf-8?Q?cWBCXtXkEd8bUNlLNYmIDknBl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b7ce1d-b37e-43b8-3c65-08dbca4db450
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5881.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 11:32:09.2362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5foZ9I10elAIngQM5z9hc0r07ypXlRnrhXIOWxIy1svp6AilyTTM7qEI5wRC6WgqvP0zshMc/CDICcOHKvJKzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6859
X-OriginatorOrg: intel.com
Subject: [virtio-comment] Re: [PATCH v2 5/9] virtio-iommu: Add VT-d IO page table

Resend the reply and CC virtio-comment list.

Hi,

On 10/7/23 00:09, Jean-Philippe Brucker wrote:
> From: Tina Zhang <tina.zhang@intel.com>
> 
> Allow a driver of a device behind virtio-iommu to detect support for
> VT-d IO page table.
> 
> The driver detects support for VT-d IO page table format in a PROBE
> request and sends an ATTACH_TABLE request with a pointer to the first
> stage page translation table.
> 
> The definition of first stage page translation table ATTACH_TABLE
> request references the fields defined in VT-d scalable-mode PASID table
> entry.
> * attributes defined in ATTACH_TABLE request:
>    FSPTPTR got from pgtbl_addr field.
>    SRE/EAFE/WPE defined in pgtbl_flags field.
>    FSPM calculated through addr_width field.
>    PASID got from pasid field.
> 
> * attributes not defined in ATTACH_TABLE request, as their
>    configurations need to be decided by host:
>    Memory type features, PAT/EMTE/CD/PGSNP/PWSNP.
>    Snoop Behavior, PGSNP/PWSNP.
> 
> Support for any new attributes could easily be added by adding flags to
> the PROBE property and fields in the ATTACH_TABLE config.
> 
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> [JPB: moved to pgtable-intel.tex, rework formatting]
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>   device-types/iommu/description.tex   |  3 +
>   device-types/iommu/pgtable-intel.tex | 98 ++++++++++++++++++++++++++++
>   introduction.tex                     |  3 +
>   3 files changed, 104 insertions(+)
>   create mode 100644 device-types/iommu/pgtable-intel.tex
> 
> diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
> index c057cdf..a4eb492 100644
> --- a/device-types/iommu/description.tex
> +++ b/device-types/iommu/description.tex
> @@ -407,6 +407,7 @@ \subsubsection{ATTACH_TABLE request}\label{ref:Device Types / IOMMU Device / Dev
>   };
>   
>   #define VIRTIO_IOMMU_ATTACH_TABLE_ARM_SMMU3       1
> +#define VIRTIO_IOMMU_ATTACH_TABLE_INTEL_PT        2
>   \end{lstlisting}
>   
>   Attach an endpoint to a domain, in the same way as an ATTACH
> @@ -1009,6 +1010,7 @@ \subsubsection{PROBE properties}\label{sec:Device Types / IOMMU Device / Device
>   \begin{lstlisting}
>   #define VIRTIO_IOMMU_PROBE_T_RESV_MEM       1
>   #define VIRTIO_IOMMU_PROBE_T_HW_ARM_SMMU3   2
> +#define VIRTIO_IOMMU_PROBE_T_HW_INTEL_VTD   3
>   \end{lstlisting}
>   
>   \paragraph{Property RESV_MEM}\label{sec:Device Types / IOMMU Device / Device operations / PROBE properties / RESVMEM}
> @@ -1160,3 +1162,4 @@ \subsubsection{Fault reporting}\label{sec:Device Types / IOMMU Device / Device o
>   \subsection{Acceleration}\label{sec:Device Types / IOMMU Device / Acceleration}
>   
>   \input{device-types/iommu/pgtable-arm}
> +\input{device-types/iommu/pgtable-intel}
> diff --git a/device-types/iommu/pgtable-intel.tex b/device-types/iommu/pgtable-intel.tex
> new file mode 100644
> index 0000000..90a3410
> --- /dev/null
> +++ b/device-types/iommu/pgtable-intel.tex
> @@ -0,0 +1,98 @@
> +\subsubsection{Intel VT-d tables}\label{sec:Device Types / IOMMU Device / Acceleration / Intel}
> +
> +Attach first-level translation tables in the format described by
> +the \hyperref[intro:VT-Directed-IO]{Intel Virtualization
> +Technology for Directed I/O specification}.
> +
> +\paragraph{PROBE property for VT-d page tables}\label{sec:Device Types / IOMMU Device / Acceleration / Intel / PROBE}
> +
> +The PROBE property VIRTIO_IOMMU_PROBE_T_HW_INTEL_VTD provides
> +information about an Intel VT-d IOMMU.
> +
> +\begin{lstlisting}
> +struct virtio_iommu_probe_hw_intel_vtd {
> +  struct virtio_iommu_probe_property head;
> +  u8   reserved[4];
> +  le64 cap_reg;
> +  le64 ecap_reg;
> +};
> +
> +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_RWBF        (1 << 4)
> +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_SAGAW_SHIFT 8
> +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_SAGAW_MASK  0x1f
> +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_MGAW_SHIFT  16
> +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_MGAW_MASK   0x1f
The size of MGAW is 6 bits. So, it should be:
#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_MGAW_MASK   0x3f

> +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_ZLR         (1 << 22)
> +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_FL1GP       (1 << 56)
> +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_5LP         (1 << 60)
> +
> +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_SC         (1 << 7)
> +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_MTS        (1 << 25)
> +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_EAFS       (1 << 34)
> +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_PSS_SHIFT  35
> +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_PSS_MASK   0x1f
> +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_SMTS       (1 << 43)
> +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_VCS        (1 << 44)
I don't think we need VCS defined here any more. In the old design, VCS 
was used as a channel for guest asking host to allocate a PASID for it. 
In the current design, we drop this and let host mediate guest PASIDs 
when necessary (which is agnostic to guest viommu driver). So basically, 
there are two cases:
1) For device assignment of I/O device, the PASIDs of the device are 
managed by guest. Host doesn't need to do any mediation.
2) For I/O Device sharing case, one device is used by multiple guests. 
So we cannot let one guest directly manage the PASIDs of that device. In 
this case, with the help of virtualization, host can trap the guest's 
first DMA access requiring a PASID and assign a host-side PASID for it. 
Guest viommu driver doesn't need to know the host-side PASID value.

> +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_SMPWC      (1 << 48)
> +\end{lstlisting}
I think two more definitions are needed:
#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_NEST    (1 << 26)
#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_FSTS    (1 << 47)

The ECAP_NEST tells if VT-d hardware supports nested translations.
The ECAP_FSTS tells if VT-d hardware supports PASID granular translation 
type of first-stage.
> +
> +\todo{check that these are necessary and sufficient to support
> +page table assignement in scalable mode.}
The cap_reg & ecap_reg expose VT-d hardware capability to guest. And 
it's expected to have virtio-iommu working with VT-d IO page table when 
the platform hardware at least has the capability of nested-translation 
(i.e., hardware must have scalable mode support and first-stage 
translation support and second-stage translation support.). So, we only 
pick definitions of the bits from VT-d spec which are related to the 
first-stage page table and the basic capability of nested-translation.

> +\todo{Need to support non-PASID assignment? non-scalable?}
I didn't see any difference between the non-PASID assignment case and 
the PASID assignment case, in terms of virtio-iommu support VT-d. Any ideas?

The non-scalable doesn't seem so interesting right now. Any thoughts 
about it?

> +
> +\begin{description}
> +  \item[\field{cap_reg}] Capability Register.
> +  \item[\field{ecap_reg}] Extended Capability Register.
> +\end{description}
> +
> +\paragraph{ATTACH_TABLE request for VT-d page table}\label{sec:Device Types / IOMMU Device / Acceleration / Intel / ATTACH_TABLE}
> +
> +Attach a single set of page tables to an endpoint.
> +
> +\begin{lstlisting}
> +/* Vt-d I/O Page Table Descriptor */
> +struct virtio_iommu_req_attach_table_intel {
> +  struct virtio_iommu_req_head          head;
> +  le32                                  domain;
> +  le32                                  endpoint;
> +  u8                                    format;
> +  u8                                    reserved[7];
> +  le32                                  pasid;
> +  le64                                  pgtbl_addr;
> +  le64                                  pgtbl_flags;
> +  le32                                  addr_width;
> +  u8                                    reserved[80];
> +  struct virtio_iommu_req_tail          tail;
> +};
> +
> +/* Intel VT-d stage-1 page table entry attributes */
> +#define	VIRTIO_IOMMU_HW_INTEL_VTD_SRE             0x01
> +#define	VIRTIO_IOMMU_HW_INTEL_VTD_EAFE            0x02
> +#define	VIRTIO_IOMMU_HW_INTEL_VTD_WPE             0x40
> +#define	VIRTIO_IOMMU_HW_INTEL_VTD_LAST            0x80
> +\end{lstlisting}
> +
> +\begin{description}
> +  \item[\field{format}] VIRTIO_IOMMU_ATTACH_TABLE_INTEL_PT.
> +  \item[\field{pasid}] Process Address Space Identifier.
> +    \todo{don't we need to allocate these with alloc/free
> +    commands to the host?}
No, we don't need guest viommu driver to explicitly ask host's help for 
guest PASID alloc/free now. In the current design, guest viommu driver 
doesn't need to know the host-side PASID.

Regards,
-Tina

> +  \item[\field{pgtbl_addr}] Stage-1 page table base address.
> +  \item[\field{pgtbl_flags}] Stage-1 page table entry attributes:
> +    \begin{description}
> +      \item{SRE} Supervisor request,
> +      \item{EAFE} Extended access enable,
> +      \item{WPE} Write protect enable.
> +    \end{description}
> +  \item[\field{pat}] Page attribute table data to compute
> +    effective memory type.
> +  \item[\field{addr_width}] The address width of the untranslated
> +    addresses that are subjected to the stage-1 page table.
> +\end{description}
> +
> +\paragraph{INVALIDATE request for VT-d page table}\label{sec:Device Types / IOMMU Device / Acceleration / Intel / INVALIDATE}
> +
> +Supported values for field \field{scope} are
> +VIRTIO_IOMMU_INVAL_S_PASID and VIRTIO_IOMMU_INVAL_S_ADDRESS.
> +The only supported value for field \field{caches} is
> +VIRTIO_IOMMU_INVAL_C_TLB. Field \field{id} is not used.
> diff --git a/introduction.tex b/introduction.tex
> index 636fb1b..d0d5086 100644
> --- a/introduction.tex
> +++ b/introduction.tex
> @@ -104,6 +104,9 @@ \section{Normative References}\label{sec:Normative References}
>   	\phantomsection\label{intro:SMMUv3}\textbf{[SMMUv3]} &
>   	Arm System Memory Management Unit version 3
>   	\newline\url{https://developer.arm.com/documentation/ihi0070/latest} \\
> +	\phantomsection\label{intro:VT-Directed-IO}\textbf{[VT-Directed-IO]} &
> +	Intel Virtualization Technology for Directed I/O
> +	\newline\url{https://cdrdv2.intel.com/v1/dl/getContent/671081} \\
>   
>   	\phantomsection\label{intro:rfc2784}\textbf{[RFC2784]} &
>       Generic Routing Encapsulation. This protocol is only specified for IPv4 and used as either the payload or delivery protocol.

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

