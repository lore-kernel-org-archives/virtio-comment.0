Return-Path: <virtio-comment-return-7993-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909C0C25B47
	for <virtio-comment@archiver.kernel.org>; Fri, 27 Oct 2023 03:14:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D8BCC2AC7E
	for <virtio-comment@archiver.kernel.org>; Fri, 27 Oct 2023 03:14:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 957E6986A91
	for <virtio-comment@archiver.kernel.org>; Fri, 27 Oct 2023 03:14:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6B42B983E25; Fri, 27 Oct 2023 03:14:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 53B8F986A83
	for <virtio-comment@lists.oasis-open.org>; Fri, 27 Oct 2023 03:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="418809631"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="418809631"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="1090793016"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="1090793016"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hugQoQimN+8NQd32KxwenH5BpxXFdF2YfqO3U8DqdEGEiFkxlp203hLarjzGBFDDthlV8BWoMubdcc31bvS2YrbJ0CCcDFvGXXbHVdWnmFIPZDob7/3VnjtYYyl0dzx1k5nQp293cvAttoc7ndf00PVgGHWWWwmuUK7hwqEMAMmadi9GBv5NMREvDShkMNRSkrbjmxNYNTeaIx+e+/3Z8lvYZLc0PRFV3AlEMJJnpVz2T68qH0C7W6JRgojIKKsPV610YW9l/MdNvCo9EVaq0m92p8ivO3r6T0k03eSdfeV5x9QxYyY+7lvMKY5y1BjeszAfjqH9028lH4xsPkA/rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Dl4maun/fdxagqoW1/hHZRpq6aGxE0D7QRgdsRLSuI=;
 b=CHqeRRFFizyVXsPWPykQ4zwK/ndX++OVX8Be6UgD51mPqDFpFwyq36wiBd4Z+iFKyHpbqvJCRPJ6y91jBoHVSGkG36NiMmc0XG2K5V9yJOU4ow9fxErY8Lc9SDcXv4sxuZthgv7exitnaP/k/yWOZ3g+AXZtPyk6q51kj3H0nWgRgUPxzHMi7tYezd3YIGnRz6CGFSRHkvCpKeg0MnUx4TmXKpmpQ7tj8XvreyWPWQi07C6lU7OU9X79i1jq5npzT8/TNuS3JmDpcJZnsJUa1PNR8JQ0Tz+c1G8PMqFhdwqn/cgbR9e+o+jnz9DRQ6uBeZ0wWej0PjHWLbFYjXZ3rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Message-ID: <dc59408b-4900-47d5-ba15-8ccade7666b8@intel.com>
Date: Fri, 27 Oct 2023 11:14:24 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
CC: <virtio-comment@lists.oasis-open.org>, <vivek.gautam@arm.com>,
	<seb@rivosinc.com>, <sameo@rivosinc.com>, <eric.auger@redhat.com>,
	<kevin.tian@intel.com>, "Kumar, Sanjay K" <sanjay.k.kumar@intel.com>
References: <20231006160947.2227396-3-jean-philippe@linaro.org>
 <20231006160947.2227396-8-jean-philippe@linaro.org>
 <b905a036-199c-47b7-ab51-4c31f39193a1@intel.com>
 <20231018145501.GB1229555@myrica>
From: Tina Zhang <tina.zhang@intel.com>
In-Reply-To: <20231018145501.GB1229555@myrica>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0112.apcprd03.prod.outlook.com
 (2603:1096:4:91::16) To MW5PR11MB5881.namprd11.prod.outlook.com
 (2603:10b6:303:19d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5881:EE_|BL1PR11MB5414:EE_
X-MS-Office365-Filtering-Correlation-Id: 371a3082-37bf-4647-b0b8-08dbd69ad6ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cmKV4lJCkwb2gQRrnj73o80gUhwW+e23RguV9bcTdQVeH0dSIO1uEnW6x3YNwrmYvdc6po2zyxMG/DyxRKg52J5cy/s2rKCyYF6fl0FkITjVJvtwRsdJSEVwW8gyPJc2SqpC6ezQg2X191xOkoSsfvgRdMugXZqCN0bUnjNBGmIajnEseijG7+wu4ZgwBhHMeV2khAL3/hjS0YfCxOfYFGgP3lZVcunWZLZqS/hWEsm1NhTEZ7oUzkUlP1u2cccKnizxqCYFuQgbu+yXYIkEQQ0prAV6lrhdDKRQbFkCp4s+gfvNpqdLXErMPuPYxZjYXZplyHpicA7LtBXeYQKCHx0TwIf+ExqUCvqnWLecV2xcHCjy81IamoAAFY11viqp7GGyko2lAF6SkS94LjTf2AdZ59Hb/mlIBeqUffQt+vi3kExqHH9PVWTY056L5M5F8hrB86W4rEVK0hKJDfnR3EbMDLKFb5zN16oMh7WL3mFbW+/ieIbesdPk+pM0DcBT/DxQRDXPjpa6CHoGeBOvgwwb7z5HF/2xGcFj5KPL0mLYCmtiVvtuV1r1Ga53Il2mXXww7AaCJsArjgsLgkdPBUiaBqWS+u8bLFsABQu9oXkbyNNaJV6i+xWftA/WUK8Q3mpr+W3mcpLbi0hnSJACALuhobO2CmEcn+G4UWgvHjSn2oF5NLt20WwbuevMBlRw
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5881.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(376002)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(38100700002)(2906002)(86362001)(31686004)(31696002)(30864003)(83380400001)(107886003)(5660300002)(2616005)(6512007)(82960400001)(41300700001)(44832011)(316002)(36756003)(66556008)(66946007)(6916009)(66476007)(53546011)(6666004)(6506007)(6486002)(26005)(8676002)(478600001)(4326008)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YktnSkF3TjlnQVExV1hrRENibkVBWC9vNTZ6RUxaS0w2ZVRSSTVkTFlBRXRF?=
 =?utf-8?B?WDE5ZUgwV0RqTXB5Z01Nckl1cFZCSG5EZHNXVG9McTdOZjN0SkhNei9CYjBJ?=
 =?utf-8?B?eTU1bnV3M1FyQy9tVnhqT1RnbTZMcldDSitOcnRvSmtNVzhhZzhFdDNWY3JN?=
 =?utf-8?B?QytlcTc1dkR4WWdlNnhaLy9YVWladHJkcTd1aFJQS09LQUJQekdQQjdaV0Z2?=
 =?utf-8?B?OFNqNHBnRWtoamRJcitXL05ndEZBYWYvZTJickF4OUh1VlNUcHR4bzNQVWg2?=
 =?utf-8?B?K0ZWczN6V3NUL1YzNm9tUWFLT2lUdTF3OU1FVSttWit3TG5kZElONTdyTGJE?=
 =?utf-8?B?WFRWVlpWdTh2cTNBTVpjNjByeG1xTFhncmZFRmZwaFZBUzIrendvNVlrNTVi?=
 =?utf-8?B?Zk1zcFRocFU0YzlIV2d3dWtjTk5lTjJ4eGswRlBlQmkvVFNwYkZ3OHUrRHg5?=
 =?utf-8?B?T2tuS01qVk5NN1J1djRzVyt0TXI4YWRqMjljMkpTcEM0c1dwT3BseGhyUStF?=
 =?utf-8?B?WWg5QmxiL3lJS1BUSHVENTNpUkJQaXdzbWNhY3dPc2pTcVM5TU9GK1Nvc1BS?=
 =?utf-8?B?TG1nbmtZSkY2T0M2b2NhdWFhenozZmxjUlJEdXhMMmhaODh5TktMbXhqV3RY?=
 =?utf-8?B?TDkveFh0NWlqV0tTT2FXcmlmZnBrdDBHRVVMY3FUMTVaeXNBQ2tVaUlESTRS?=
 =?utf-8?B?S3U4M2pxc2FJVEh2cUFKc0pMVEk1WncxVWIzcFQwd1UxRnFPVW0vM3dSQkZo?=
 =?utf-8?B?LzRWcmNPaFEwbEprVlJoZXlFVFM1N0l5QmpZMjVWR0c0N2F4OE53SVZIMTlo?=
 =?utf-8?B?Q3V6THVlaFFaUXNWT2UwOWxLbG5qY2Y0U0hVSFRWdWM3cERwWTI0OVF1bCsx?=
 =?utf-8?B?U0xIUXpKcE53eE9SMm1pS3JmZ0JmUitKdVdKbGhCWnFPeWczdFFIVzdLK2NI?=
 =?utf-8?B?eVc0WlpiMjNCZ2VBRm5pejdVSkovVytCeGtuSXVOZFVvQzRHZXFSUU1jaC9T?=
 =?utf-8?B?REsrUGdDSjFaajBBTzhabTF6WmZNNXgrSWdVRCtZT1UwRWxVSnQwbGNJa3JE?=
 =?utf-8?B?dm9kaEU1eERQV242ZXZlUHh2QW1xWEVGQThKaXNWd1dOOW03VDVVSjJGWEI3?=
 =?utf-8?B?bk5EcTkra3lpaUZlcGt4bVh2eHRKT1NOVE1IUFpjdTlScDNxclBVamJmUUtH?=
 =?utf-8?B?SUtCOW1CbEtkUnQxcGI0ZXNSU2YxcmZSc2JlVUIwM1p2a2xLeUJzVG15SS8y?=
 =?utf-8?B?d1BEK3JYd3RnYjd1RGN1Y0VQc1JUSUVhZW5EQURFZ21jZER6QmVvU2U0N084?=
 =?utf-8?B?ekU3Ly8wWXBWb3dBZ0J2QzZoM2V2WGVyZGU2MUs4U1lhb3ltVjJXZFZzdjMz?=
 =?utf-8?B?d3lsY2tYR2lZZkNvVXNFdkNBMytWSmc2RkdIaW1XbnhEdmdzbUltNmJWWVhV?=
 =?utf-8?B?aUZLRW0rZ3ZTWUhwaWJOdStuRml1VDQwd055WFJjZjZZSUJwaFc5ODNody9U?=
 =?utf-8?B?YWw0aVpSS3dTQ3V6d2NucGxLMEtCQWJtMUQ3akhWNE1PVm54L1k4Q2dVcHhR?=
 =?utf-8?B?Q25vVEZvTWFiajdJKzVFa0Q3NHl5c1I4R1hqeEk4RUFBZkdxUC9YN0pUckUy?=
 =?utf-8?B?VWFNSDBnSVYzRUxQcnhFL2FFY0Uxd1lnRXdoL3JHdnovSG91N0xNNkM1aG10?=
 =?utf-8?B?eHllZkdDWWdYbXBwYVFBZnZmSGJaUGtLK1hzQmZDVVN0MnhzM2YxM1V0S2Nj?=
 =?utf-8?B?VGRBRk8vTzlLRWNkNEYwNmdXNHdQKzNZUWh1dFdzNU1jeU1SdWZONkJxZnk3?=
 =?utf-8?B?RjRoWUtaTEhjYWNBK2V4V2dkVWl3VFd3NExaTnFxaWxpSDdaUFJna2FIOTl4?=
 =?utf-8?B?T3VtS2pjWEhrUmFSaVBYKzY1SWd0dDBBSUh6bkpRVVB1SWJ2bEZvM255UzB6?=
 =?utf-8?B?Z3J5L21KdXVpNXZuQjZkZFRaRnN3cnpwQXlkR2d5NlFQb2h3MzNGckFNMFpQ?=
 =?utf-8?B?ejc0b0JuWWtSTzFCREFIVjJ4aG5ZcnpPYVh0ZitnVTMvaFZxbUtGTUVpd0FF?=
 =?utf-8?B?L3VvUjFnUWxsaXBWR3NjUVByWEsvZjJwSFhKemdBSWQ2eUtQdzZJSGJYbEFX?=
 =?utf-8?Q?xaqe6uKHNs8id2iCFrIVg5q7a?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 371a3082-37bf-4647-b0b8-08dbd69ad6ae
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5881.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 03:14:32.0753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PoNcOHZuztK3aH5lgJkIz8BTVcJdlfjEZfnA5TauunCAL0yd5EM5wn6YkDy0wmiY224Aye5HUbPSQ+aXaQYoyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5414
X-OriginatorOrg: intel.com
Subject: [virtio-comment] Re: [PATCH v2 5/9] virtio-iommu: Add VT-d IO page table

Hi Jean,


On 10/18/23 22:55, Jean-Philippe Brucker wrote:
> Hi Tina,
> 
> Thank you for the review
> 
> On Wed, Oct 11, 2023 at 07:32:01PM +0800, Tina Zhang wrote:
>> Resend the reply and CC virtio-comment list.
>>
>> Hi,
>>
>> On 10/7/23 00:09, Jean-Philippe Brucker wrote:
>>> From: Tina Zhang <tina.zhang@intel.com>
>>>
>>> Allow a driver of a device behind virtio-iommu to detect support for
>>> VT-d IO page table.
>>>
>>> The driver detects support for VT-d IO page table format in a PROBE
>>> request and sends an ATTACH_TABLE request with a pointer to the first
>>> stage page translation table.
>>>
>>> The definition of first stage page translation table ATTACH_TABLE
>>> request references the fields defined in VT-d scalable-mode PASID table
>>> entry.
>>> * attributes defined in ATTACH_TABLE request:
>>>     FSPTPTR got from pgtbl_addr field.
>>>     SRE/EAFE/WPE defined in pgtbl_flags field.
>>>     FSPM calculated through addr_width field.
>>>     PASID got from pasid field.
>>>
>>> * attributes not defined in ATTACH_TABLE request, as their
>>>     configurations need to be decided by host:
>>>     Memory type features, PAT/EMTE/CD/PGSNP/PWSNP.
>>>     Snoop Behavior, PGSNP/PWSNP.
>>>
>>> Support for any new attributes could easily be added by adding flags to
>>> the PROBE property and fields in the ATTACH_TABLE config.
>>>
>>> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
>>> [JPB: moved to pgtable-intel.tex, rework formatting]
>>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>> ---
>>>    device-types/iommu/description.tex   |  3 +
>>>    device-types/iommu/pgtable-intel.tex | 98 ++++++++++++++++++++++++++++
>>>    introduction.tex                     |  3 +
>>>    3 files changed, 104 insertions(+)
>>>    create mode 100644 device-types/iommu/pgtable-intel.tex
>>>
>>> diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
>>> index c057cdf..a4eb492 100644
>>> --- a/device-types/iommu/description.tex
>>> +++ b/device-types/iommu/description.tex
>>> @@ -407,6 +407,7 @@ \subsubsection{ATTACH_TABLE request}\label{ref:Device Types / IOMMU Device / Dev
>>>    };
>>>    #define VIRTIO_IOMMU_ATTACH_TABLE_ARM_SMMU3       1
>>> +#define VIRTIO_IOMMU_ATTACH_TABLE_INTEL_PT        2
>>>    \end{lstlisting}
>>>    Attach an endpoint to a domain, in the same way as an ATTACH
>>> @@ -1009,6 +1010,7 @@ \subsubsection{PROBE properties}\label{sec:Device Types / IOMMU Device / Device
>>>    \begin{lstlisting}
>>>    #define VIRTIO_IOMMU_PROBE_T_RESV_MEM       1
>>>    #define VIRTIO_IOMMU_PROBE_T_HW_ARM_SMMU3   2
>>> +#define VIRTIO_IOMMU_PROBE_T_HW_INTEL_VTD   3
>>>    \end{lstlisting}
>>>    \paragraph{Property RESV_MEM}\label{sec:Device Types / IOMMU Device / Device operations / PROBE properties / RESVMEM}
>>> @@ -1160,3 +1162,4 @@ \subsubsection{Fault reporting}\label{sec:Device Types / IOMMU Device / Device o
>>>    \subsection{Acceleration}\label{sec:Device Types / IOMMU Device / Acceleration}
>>>    \input{device-types/iommu/pgtable-arm}
>>> +\input{device-types/iommu/pgtable-intel}
>>> diff --git a/device-types/iommu/pgtable-intel.tex b/device-types/iommu/pgtable-intel.tex
>>> new file mode 100644
>>> index 0000000..90a3410
>>> --- /dev/null
>>> +++ b/device-types/iommu/pgtable-intel.tex
>>> @@ -0,0 +1,98 @@
>>> +\subsubsection{Intel VT-d tables}\label{sec:Device Types / IOMMU Device / Acceleration / Intel}
>>> +
>>> +Attach first-level translation tables in the format described by
>>> +the \hyperref[intro:VT-Directed-IO]{Intel Virtualization
>>> +Technology for Directed I/O specification}.
>>> +
>>> +\paragraph{PROBE property for VT-d page tables}\label{sec:Device Types / IOMMU Device / Acceleration / Intel / PROBE}
>>> +
>>> +The PROBE property VIRTIO_IOMMU_PROBE_T_HW_INTEL_VTD provides
>>> +information about an Intel VT-d IOMMU.
>>> +
>>> +\begin{lstlisting}
>>> +struct virtio_iommu_probe_hw_intel_vtd {
>>> +  struct virtio_iommu_probe_property head;
>>> +  u8   reserved[4];
>>> +  le64 cap_reg;
>>> +  le64 ecap_reg;
>>> +};
>>> +
>>> +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_RWBF        (1 << 4)
>>> +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_SAGAW_SHIFT 8
>>> +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_SAGAW_MASK  0x1f
>>> +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_MGAW_SHIFT  16
>>> +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_MGAW_MASK   0x1f
>> The size of MGAW is 6 bits. So, it should be:
>> #define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_MGAW_MASK   0x3f
> 
> Good catch, thanks
> 
>>
>>> +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_ZLR         (1 << 22)
>>> +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_FL1GP       (1 << 56)
>>> +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_5LP         (1 << 60)
>>> +
>>> +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_SC         (1 << 7)
>>> +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_MTS        (1 << 25)
>>> +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_EAFS       (1 << 34)
>>> +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_PSS_SHIFT  35
>>> +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_PSS_MASK   0x1f
>>> +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_SMTS       (1 << 43)
>>> +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_VCS        (1 << 44)
>> I don't think we need VCS defined here any more. In the old design, VCS was
>> used as a channel for guest asking host to allocate a PASID for it. In the
>> current design, we drop this and let host mediate guest PASIDs when
>> necessary (which is agnostic to guest viommu driver). So basically, there
>> are two cases:
>> 1) For device assignment of I/O device, the PASIDs of the device are managed
>> by guest. Host doesn't need to do any mediation.
>> 2) For I/O Device sharing case, one device is used by multiple guests. So we
>> cannot let one guest directly manage the PASIDs of that device. In this
>> case, with the help of virtualization, host can trap the guest's first DMA
>> access requiring a PASID and assign a host-side PASID for it. Guest viommu
>> driver doesn't need to know the host-side PASID value.
> 
> Makes sense, I'll drop VCS
> 
>>
>>> +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_SMPWC      (1 << 48)
>>> +\end{lstlisting}
>> I think two more definitions are needed:
>> #define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_NEST    (1 << 26)
>> #define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_FSTS    (1 << 47)
>>
>> The ECAP_NEST tells if VT-d hardware supports nested translations.
>> The ECAP_FSTS tells if VT-d hardware supports PASID granular translation
>> type of first-stage.
> 
> It doesn't hurt to add them. Would the guest behave differently if NEST or
> FSTS is set or clear?  I didn't add them because I assumed NEST is a
> prerequisite for supporting guest page tables, and it requires FSTS.
Yes, they have some effects. According to VT-d driver and Spec, only 
NEST=1 means nested translation is supported by the hardware, otherwise 
nested translation is not supported. But the NEST=1 doesn't 
automatically mean FSTS=1 which reports if the hardware supports PASID 
granular translation type of first-stage table. So if FSTS=0 or NEST=0, 
guest VT-d driver/lib will refuse to allocate a VT-d IO page table for 
virtio-iommu.

If we want the virtio-iommu backend to check these bits before reporting 
the supported page-table fmt, then we don't need the virtio-iommu 
frontend to check them again. So, here are two questions:

1) If we want the virtio-iommu backend to check vendor IOMMU specific 
capabilities, does it mean we need to add all those details defined by 
vendor Spec into virtio-iommu Spec (like what we did in this version)? 
Does it make sense to virtio-iommu. My understanding is virtio Spec may 
try to avoid vendor specific things and leave them to venders 
drivers/libs. (I saw your comments below. I just want to post my concern 
here).

2) If the virtio-iommu backend just delivers vendor specific cap/ecap to 
virtio-iommu frontend and doesn't do any checking before exposing 
cap/ecap to guest, then virtio-iommu frontend can invoke some generic 
io-pgtable APIs (e.g., in Linux it's io_pgtable_init_fns.alloc()) to 
allocate a io_pgtable , which operation invokes vendor's alloc() 
callback and vendor driver/lib can do the checking there. Return success 
if the cap/ecap makes sense to vendor IO page-table support and allocate 
a set of page tables, otherwise return unsuccess. If this is the 
direction, then we probably don't need to add IOMMU vendor's specific 
definitions into virtio-iommu spec. Right?


> 
> More generally there are several ways we could describe these registers in
> the specification:
> 
> (1) Don't describe any fields.
> (2) Describe only fields that directly influence the configuration of
>      ATTACH_TABLE and INVALIDATE.
> (3) Describe fields related in any way to page table support.
> (4) Describe all fields.
> 
> (1) is the easiest from a spec point of view. I tried doing (2) to ease
I like (1), too. But I don't object to other options, as long as it 
makes sense to virtio-iommu.

> writing driver and device code, but without explaining in detail what the
> fields mean because I think that's best left to the hardware
Agree. We should leave details to vendors Spec.

> specification. (3) would include NEST, FSTS and possibly others. (4)
> wouldn't really be useful, we may as well do (1).
> 
> Maybe (3) is better. This way the device can use this description to
> sanitize the registers before passing them to the guest, and the values
> read by the guest still make sense. Because if we only describe (2), and
> then the device decides to only provide those bits and clear everything
> else, then it may be confusing for the driver to find NEST and FSTS clear
> in the cap registers. Should it then even attach tables?  Maybe in the
> future there will be a use-case for presenting NEST and FSTS clear to the
> guest.
I assume that you are talking about virtio-iommu working with VT-d IO 
page table on platform that has no nested translation support or the 
nested translation support is disable. Right?

So, there are three usages:
1) On the platform having VT-d hardware nested translation support and 
the functionality is being used by a guest, guest VT-d driver/lib allows 
virtio-iommu frontend to allocate VT-d IO page tables.

2) On the platform having no VT-d hardware nested translation support or 
having the support but not being used by a guest, guest VT-d driver/lib 
doesn't allow virtio-iommu frontend to allocate VT-d IO page tables. So 
virtio-iommu legacy map/unmap() is being used (no IO page tables in guest).

3) On the platform having no VT-d hardware nested translation support or 
having the support but not being used by a guest, virtio-iommu front-end 
may want to use some virtual IO page table. My understanding is this 
virtual IO page table is generic to vendor IOMMUs. So it should work w/o 
any help of vendor IOMMU driver/lib. Is my understanding right?


Regards,
-Tina

> 
>>> +
>>> +\todo{check that these are necessary and sufficient to support
>>> +page table assignement in scalable mode.}
>> The cap_reg & ecap_reg expose VT-d hardware capability to guest. And it's
>> expected to have virtio-iommu working with VT-d IO page table when the
>> platform hardware at least has the capability of nested-translation (i.e.,
>> hardware must have scalable mode support and first-stage translation support
>> and second-stage translation support.). So, we only pick definitions of the
>> bits from VT-d spec which are related to the first-stage page table and the
>> basic capability of nested-translation.
>>
>>> +\todo{Need to support non-PASID assignment? non-scalable?}
>> I didn't see any difference between the non-PASID assignment case and the
>> PASID assignment case, in terms of virtio-iommu support VT-d. Any ideas?
> 
> No, I don't remember what I meant by this... I think non-PASID (for
> requests-without-PASID) is already supported in this draft.
> 
>>
>> The non-scalable doesn't seem so interesting right now. Any thoughts about
>> it?
> 
> Agree, if needed it could be added later.
> 
>>
>>> +
>>> +\begin{description}
>>> +  \item[\field{cap_reg}] Capability Register.
>>> +  \item[\field{ecap_reg}] Extended Capability Register.
>>> +\end{description}
>>> +
>>> +\paragraph{ATTACH_TABLE request for VT-d page table}\label{sec:Device Types / IOMMU Device / Acceleration / Intel / ATTACH_TABLE}
>>> +
>>> +Attach a single set of page tables to an endpoint.
>>> +
>>> +\begin{lstlisting}
>>> +/* Vt-d I/O Page Table Descriptor */
>>> +struct virtio_iommu_req_attach_table_intel {
>>> +  struct virtio_iommu_req_head          head;
>>> +  le32                                  domain;
>>> +  le32                                  endpoint;
>>> +  u8                                    format;
>>> +  u8                                    reserved[7];
>>> +  le32                                  pasid;
>>> +  le64                                  pgtbl_addr;
>>> +  le64                                  pgtbl_flags;
>>> +  le32                                  addr_width;
>>> +  u8                                    reserved[80];
>>> +  struct virtio_iommu_req_tail          tail;
>>> +};
>>> +
>>> +/* Intel VT-d stage-1 page table entry attributes */
>>> +#define	VIRTIO_IOMMU_HW_INTEL_VTD_SRE             0x01
>>> +#define	VIRTIO_IOMMU_HW_INTEL_VTD_EAFE            0x02
>>> +#define	VIRTIO_IOMMU_HW_INTEL_VTD_WPE             0x40
>>> +#define	VIRTIO_IOMMU_HW_INTEL_VTD_LAST            0x80
>>> +\end{lstlisting}
>>> +
>>> +\begin{description}
>>> +  \item[\field{format}] VIRTIO_IOMMU_ATTACH_TABLE_INTEL_PT.
>>> +  \item[\field{pasid}] Process Address Space Identifier.
>>> +    \todo{don't we need to allocate these with alloc/free
>>> +    commands to the host?}
>> No, we don't need guest viommu driver to explicitly ask host's help for
>> guest PASID alloc/free now. In the current design, guest viommu driver
>> doesn't need to know the host-side PASID.
> 
> Ok, that makes the interface simpler
> 
> Thanks,
> Jean
> 
>>
>> Regards,
>> -Tina
>>
>>> +  \item[\field{pgtbl_addr}] Stage-1 page table base address.
>>> +  \item[\field{pgtbl_flags}] Stage-1 page table entry attributes:
>>> +    \begin{description}
>>> +      \item{SRE} Supervisor request,
>>> +      \item{EAFE} Extended access enable,
>>> +      \item{WPE} Write protect enable.
>>> +    \end{description}
>>> +  \item[\field{pat}] Page attribute table data to compute
>>> +    effective memory type.
>>> +  \item[\field{addr_width}] The address width of the untranslated
>>> +    addresses that are subjected to the stage-1 page table.
>>> +\end{description}
>>> +
>>> +\paragraph{INVALIDATE request for VT-d page table}\label{sec:Device Types / IOMMU Device / Acceleration / Intel / INVALIDATE}
>>> +
>>> +Supported values for field \field{scope} are
>>> +VIRTIO_IOMMU_INVAL_S_PASID and VIRTIO_IOMMU_INVAL_S_ADDRESS.
>>> +The only supported value for field \field{caches} is
>>> +VIRTIO_IOMMU_INVAL_C_TLB. Field \field{id} is not used.
>>> diff --git a/introduction.tex b/introduction.tex
>>> index 636fb1b..d0d5086 100644
>>> --- a/introduction.tex
>>> +++ b/introduction.tex
>>> @@ -104,6 +104,9 @@ \section{Normative References}\label{sec:Normative References}
>>>    	\phantomsection\label{intro:SMMUv3}\textbf{[SMMUv3]} &
>>>    	Arm System Memory Management Unit version 3
>>>    	\newline\url{https://developer.arm.com/documentation/ihi0070/latest} \\
>>> +	\phantomsection\label{intro:VT-Directed-IO}\textbf{[VT-Directed-IO]} &
>>> +	Intel Virtualization Technology for Directed I/O
>>> +	\newline\url{https://cdrdv2.intel.com/v1/dl/getContent/671081} \\
>>>    	\phantomsection\label{intro:rfc2784}\textbf{[RFC2784]} &
>>>        Generic Routing Encapsulation. This protocol is only specified for IPv4 and used as either the payload or delivery protocol.

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

