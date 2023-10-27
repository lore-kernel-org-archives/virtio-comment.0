Return-Path: <virtio-comment-return-7989-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BEFC25B48
	for <virtio-comment@archiver.kernel.org>; Fri, 27 Oct 2023 01:38:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3BD062AC6D
	for <virtio-comment@archiver.kernel.org>; Fri, 27 Oct 2023 01:38:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1358F986A8B
	for <virtio-comment@archiver.kernel.org>; Fri, 27 Oct 2023 01:38:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EF419986A7F; Fri, 27 Oct 2023 01:38:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DB01C986A81
	for <virtio-comment@lists.oasis-open.org>; Fri, 27 Oct 2023 01:38:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="6316185"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="6316185"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="825182981"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="825182981"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qqqh/T7N7jHQCOGS7WOPT+Ladgwd4Ar1me2/9Df3VF0zQ570P1WuqUzMlcZ8e29p8czNBINkE56yrI4qqVVtFezmhN0AXz3W0bPNzzQtFTCWqDcoMYX64uwn29PRROHoF8xWSl9bsqiJbzD5COjNBfOnmFScEfOUnmedIFv2aY8Su5nFYzNX+ZPoQoDrJZ0IgY3NJRmu0j9sAN9Yb18pDNUrObm/42djMA/irNFl25op3RcsN4GtWZgQ7G5Ro7D+s7V/hZe2qx5r+L+LZw5tgC17fooikxYFnsAjumh+obYkfGaZkjPO+jwFqfDVeZwknduJpMYIpsymyKlRdQlYbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcbevQEyzcGFQRNRp9JIxwi2RFdCh3CPrcVUS4hiMIc=;
 b=Bw+zIID8QHYqMmsnlOd2x0b/9FJzq22garthhZ9JNFbZLFhMClflYQgA5NDs5dxNFa72Fz0R463cXK6LuKIhMWUybnHnNRpyzti6WRvlEokzA3QtrBR/ZwVcTD+1C7F/mgAAO7aNNAfiSe9cpl8sKf99LwfHyyq/7U5A09w1u/C5DTEHoJGAMB9pBvwOSspYzhttsHrgvBeGCouBlI4evMWH2XvElRrahVGoCH+WLyRO7ivX6yRQC9pTn5dB7IjDnBa8F/SXHpTYM2jQK3a7c0nQqh1Az851DzS7pWPOuo/8ktS4K42pzKNQnOxFe5ADemfDRtvBNKtyfu3m+XQQxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Message-ID: <fa3263e9-6b4f-4fc7-b9e9-17f366c77ca5@intel.com>
Date: Fri, 27 Oct 2023 09:38:20 +0800
User-Agent: Mozilla Thunderbird
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
CC: <virtio-comment@lists.oasis-open.org>, <vivek.gautam@arm.com>,
	<seb@rivosinc.com>, <sameo@rivosinc.com>, <eric.auger@redhat.com>,
	<kevin.tian@intel.com>, "Kumar, Sanjay K" <sanjay.k.kumar@intel.com>
References: <20231006160947.2227396-3-jean-philippe@linaro.org>
 <20231006160947.2227396-4-jean-philippe@linaro.org>
 <b8d6172e-88c5-4f4d-8738-6ec6c90fdab4@intel.com>
 <20231018144108.GA1229555@myrica>
Content-Language: en-US
From: Tina Zhang <tina.zhang@intel.com>
In-Reply-To: <20231018144108.GA1229555@myrica>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To MW5PR11MB5881.namprd11.prod.outlook.com
 (2603:10b6:303:19d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5881:EE_|LV3PR11MB8674:EE_
X-MS-Office365-Filtering-Correlation-Id: 82e89609-2561-4495-d22a-08dbd68d6b9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nILEQZRN6Pot71Lp/uwdfkq/S1JiQp3+rk5w6+hMZ2hf4A3fKz47CtFGJhl6cDAZwijM3IaTCaP+OwEBLU/aD6YjAF37rwDDyDtLYrojje5dUGvt6/pTcXy2pzpkn/9LqIUNyeEkSkKB7vViVZWPynGmpNeVIdvja8FJ8WRKr9scl3P7RuHGnC5W3ub3tYpxxEWQr3/ocuT50/+zeP8RrdjMj9jqM919JcYeAQWicO2exdXE+wzRSBeollSb2IgVjxZRoTn1vPJ06UnWCg8uVR/5TuFWPR/t/4NO72XJI8q+wYaO55aEvLjQ8iFiBLdpsNZk/ud2twE82cm9DR4pCuAi56uMMMJRs3uKmNGhs91MUmLhwJ5mXuOPy4hPVScWVoT0h2KED/DIUtabea/bPckMXiYwhB1DmUSLIb3DuqvmcVJufTa4rQiSF1nhOVK90SusFwresQhjL77H3fgEKLx6wXVU3Oni5Fw7YbOwQnDIkgAC19JDkdZSvAi39Q88CvA5ko3JjSYpjMx8oV9dj9VO44EkQvCEbLxpCdRZ+seDY/rSgumG47dPG/r7J/MrW/5npPBTjJT61Tw499fq5pA9hx6fJOwHRhkShc7OhvClQtkdnqhHsy1Cwhk0G+wdzyu5HMoHb7Bn9Q/hcIY8rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5881.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(366004)(376002)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(31686004)(26005)(83380400001)(38100700002)(2616005)(82960400001)(107886003)(6512007)(6506007)(6666004)(53546011)(6486002)(478600001)(8936002)(4326008)(8676002)(66476007)(66556008)(316002)(66946007)(6916009)(44832011)(31696002)(5660300002)(41300700001)(2906002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFY4U2NOaEQvNDd0R2VGQ3BGMWdmanI4aVYxMVRwYzUwQ0ZRbFlpdkhiUGJs?=
 =?utf-8?B?bXAwenZVUE1oVk9EcXNrb1E1WUV1QU0yb3U0TWdvc2NweG9PaXdsdC9RMzVQ?=
 =?utf-8?B?ZHNPUnRyYmEzZnU1SmNrMHBJSURJd2NmdUhnWTh0Vm1vb1RNK2NwNEJZQnpI?=
 =?utf-8?B?SGJsU0RRa1ltZXVhT2hvdlAyRnVYbDRPSS9KOS8xbS9SM2FqbkR3cmhxK1Nx?=
 =?utf-8?B?cENxSmV4UHI5aTVqM3VZZ000eDBwSlVseERuajcwSktKRm1EZEphSnBpMUlN?=
 =?utf-8?B?Vkd1UUxoRjVpQ3dmMEI4ZGw1b0xyemdaYUVkN29BeFJrQ0Z0N1lRK1Bnd3Mz?=
 =?utf-8?B?ZVdxTXAvRTg0NmxWSnJrQ0d1VHk2dk5JUkNSRWhVc21BU2k5K3RMOHlXMlJ3?=
 =?utf-8?B?dzhqNFVVN1NRdzhHWDVXdGlZT0E1TkJ1bzRRei9GaEI1bm43ZmZZWXFrd2lN?=
 =?utf-8?B?bThHN3ZjSktuWE5jWVBmQk5OMDVsbi9WRUJ6SzZsS3dnVGhLbDVhSEx2dnBE?=
 =?utf-8?B?ZEVpaFV6YVY2WjRlYm9WRVpBRjRIK21ic1RlNndGeDJVRW0xR01pUU1qK01t?=
 =?utf-8?B?WXFTdnM3b2F5S3JOU3l2aUREdzFiVEZ1UnFuMmtlSnNEVS9KSjF3eWdQd254?=
 =?utf-8?B?VGdSNnpzc0FST21ZQ3NVRXlacU1iYWZyQTUwOGErL1hjSXhubEhrQkRsdUxq?=
 =?utf-8?B?SGNuSjVXZVpNbFF6ZzNsb0JLc0ZmYmdoZ3dqVUNCVkptRk5pbk9USXJWdHJi?=
 =?utf-8?B?WVVwOCtDbTR5ZmwvRUYvdnRKb2FVRmRhekQ1ZEh5alNVRDBSYU5aeWJQMmF5?=
 =?utf-8?B?NFJnZGs0S01qK0lBZko1Ujg2NUJOU1V3NlpxalZSRUpQZzBSWTR1YTFhY3k5?=
 =?utf-8?B?WFBKc2dWODdlaXVHRG0yNXlwczNYWm82ZlpDMTdQenYxaGYvSUtKK0NCMlcv?=
 =?utf-8?B?YVZsajZqNWZFYTU4UlkzeVBMR3NEbGk1K2xKWUZUSjhWSVNmSndpWjRTanhZ?=
 =?utf-8?B?SGp6SEZKYUUydk9Db0VsSEdxQUZNcGhWZ3h0Sm9mMkowQ2hRNS8yUHg4WlR3?=
 =?utf-8?B?Tk9DWFZHZ2RoVlY5U2x0YWpodVkxaUZnM2dXM1B2djExT1Jxd25ZSVh4L2N1?=
 =?utf-8?B?Q2NrbHV3bmZtN245V3NUNUg4WExwSlBEemJ1VmVIVWdNdlVieTMyWGxQRFVn?=
 =?utf-8?B?L09XSW85SDJ1RmQ0SzRYR0RRcE1rNld3YUdJTzRhWjBXSWRBcjBmYWNLZkVw?=
 =?utf-8?B?L2VRRnNTdDhySGNuNFlqS29PWVl4cDJuSnlSNERTUXpvc2FnTXloNDBwVVVF?=
 =?utf-8?B?NUc1Uy9jTjdXenFKR1Q5WEhDS1lGbitwZU9wcmlFRDVMbHJ6dlpDSHV3dHZ5?=
 =?utf-8?B?ZkNvS1l3SVR4eGs0S0NJcXlYNnJqUHcvNXJZY0pmOFJyZWlRWTUrTnpXZ25r?=
 =?utf-8?B?K2ZOSHhyWGhuRHdGb0FEQVJPL1RVdjUra1VjRVhKbXJNWmdvWFJvQytObDZz?=
 =?utf-8?B?WEJ1WVZqSVBVeUEwTmZGa2U4VHF4OFp6MnZsM01KcDZtQjNkODBmRHhJMXdp?=
 =?utf-8?B?dEdaODlkaHE0bUVpaGFFS1VNM0NkWmplSWRVZ3VSQlR5eWNkR3VtL3RyRTlw?=
 =?utf-8?B?L1RGbGlPQWZmS1gybHNJNXhsVllGYUNiL250ZEN3b1RrQllFMmFzNC9YY2Qr?=
 =?utf-8?B?SmV2SlRsQXN1WEJ3Q1IxQ09DL2NoY3g0YU9DSW9xZFNLUUk3QnIzL2o4cjVC?=
 =?utf-8?B?cU1yWEZVVkN6S09SSnRoM0RSZGlWbVdHRWs4VG8xb0ZKNkk3OGtSQVdWd1VS?=
 =?utf-8?B?aDBWUDl4dDc0QXVKV1l3R0tZV3ZOVUk3ZHQ1Qkx0U1IyWHZ2SjRIaHBxV3BF?=
 =?utf-8?B?OEt3SUJvVzEzdjZwMWNRNzlWMGtjemdvb1pMWTduYjFLRVhwdFdmUm9NZ3ZH?=
 =?utf-8?B?cDd0WDA0MlZ2dlpSeW1zNUQrUXdaRkdLSmt5VjdnVm90dnZJQ0Y1QjRLU1lo?=
 =?utf-8?B?dmZzdjFacGI4UURpR0xNY29iWm9YTnJxWE50bDlXbWRJMTdQZk9JV0RLY3JS?=
 =?utf-8?B?Y2d4K2x5Mk9vUUdCT0dScXlmeXYzQjlQR2ZrOVFadlNNVSsxVUE4bzBqOGpR?=
 =?utf-8?Q?P6UwAQzd5JB748qV1FVkYe0JI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e89609-2561-4495-d22a-08dbd68d6b9f
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5881.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 01:38:28.9886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +NDJLla+vaYo8kExEbEqlDY8HUiToFZd7MDOIJtc6ru+wKaqUBvi+AB7u1OiDwJyHI/QXe9Drk/Kvfig9eNF3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8674
X-OriginatorOrg: intel.com
Subject: [virtio-comment] Re: [PATCH v2 1/9] virtio-iommu: Add ATTACH_TABLE request

Hi Jean,

Sorry for the late response. I was trying to build up a POC of 
virtio-iommu support vt-d page table based on your branch 
"virtio-iommu/pgtables", according to this proposal. I may still need 
several days. I'll publish the POC (e.g., send the virtio-iommu 
front-end change to Linux public mailing lists and make the QEMU change 
in a public repo as the implementation has some dependencies which are 
WIP in QEMU and Linux kernel communities.). Do you think it makes sense 
in terms of helping this proposal review?

On 10/18/23 22:41, Jean-Philippe Brucker wrote:
> Hi Tina,
> 
> On Wed, Oct 11, 2023 at 07:39:02PM +0800, Tina Zhang wrote:
>>> +For some formats, the PASID table is managed by the device rather
>>> +than driver. The ATTACH_TABLE request contains a \field{pasid}
>> This is what VT-d hardware expects when working with viommu (no matter it's
>> virtual VT-d iommu or virtual-iommu) with VT-d IO page table support. If a
>> device is directly assigned to a guest, the guest viommu driver fully
>> manages the PASIDs of that device. If a device is providing I/O device
>> sharing service for multiple guests, the PASIDs value are assigned by host.
>> But, in either case, the PASID table is filled by host VT-d driver, not
>> guest viommu driver. So, from viommu front-end's point of view, the PASID
>> table of that device is managed by viommu device (i.e., viommu back-end).
> 
> Ok, so there are two cases of device assignment:
> 
> * whole devices (eg PCIe VF) assigned to one guest. In that case,
>    PASIDs used by the guest (vPASID) could be identical to PASIDs assigned
>    by the host (hPASID)
> 
> * device is shared between multiple guests, sub-devices are assigned to
>    guests. In that case vPASID is different from hPASID.
> 
>>> +field and a page directory. Similarly to when the driver manages
>>> +the PASID table, \field{domain} corresponds to one PASID table.
>>> +The driver uses the same \field{domain} for each ATTACH_TABLE
>>> +request with PASID. Issuing a DETACH request without PASID
>>>
>> Here are some thoughts about domain id interception with VT-d IO page
>> format:
>>
>> Virtual VT-d driver uses the same domain id for first-stage translation is
>> because it's required by the VT-d specification, though guest domain id
>> never gets to hardware (i.e., host doesn't populate PASID table with guest
>> domain id value).
> 
> (To make things clearer I'll use "DID" for the HW VT-d identifier and
> "domain" for the virtio-iommu one)
> 
> Do you know if the host is more likely to assign a unique DID for each VM,
> for each virtual device, or some other scheme?  There was a discussion
> recently about the Linux host, but I don't know where it landed. I'm
> trying to understand what hosts and guests could implement, so that
> virtio-iommu can be supported without too much modification to host and
> guest.
> 
> We should design virtio-iommu such that it's possible to share an address
> space between multiple devices. For example the guest could use a single
> PASID space, assign a unique PASID to each process address space, and if
> the host assigns the same DID to devices in a VM, then DMA from devices
> bound to the same guest address space will share TLB entries.
> 
> TLB entries are tagged with DID+PASID. So in theory, in order to share TLB
> entries between multiple virtual devices, a guest that uses virtual VT-d
> would write the same vDID into each virtual device's virtual PASID table,
> into entries indexed by the same vPASID. That would allow the host to
> understand that they are the same address space, and assign the same hDID
> to entries in the HW PASID table indexed by the same hPASID, and they
> would share TLB entries.
> 
>           Dev1 PASID table                     vDev1 PASID table
>              +-----------+                     +-----------+
>              :           :                     :           :
>   hPASID=12->+-----------+                     +-----------+<-vPASID=1
>              |   hDID=24 |-+-> First stage <-+-|    vDID=8 |
>              +-----------+ |   page table    | +-----------+
>              :           : |                 | :           :
>                            |                 |
>                            |                 |
>           Dev2 PASID table |                 | vDev2 PASID table
>              +-----------+ |                 | +-----------+
>              :           : |                 | :           :
>   hPASID=12->+-----------+ |                 | +-----------+<-vPASID=1
>              |   hDID=24 |-+                 +-|    vDID=8 |
>              +-----------+                     +-----------+
>              :           :                     :           :
> 
> Conversely, a guest can use different vPASIDs to isolate address spaces,
> but it could also rely on using different vDIDs, right?  It could program
> the virtual VT-d PASID tables for two devices with overlapping vPASID
> spaces, and different vDIDs for isolation. Which implies that the host
> can't assign a unique DID for each VM, it needs to be able to use a unique
> DID for each virtual devices.
> 
> That's also needed for requests-without-PASID: the guest most likely wants
> to isolate no-PASID address spaces of different devices, which requires
> separate DIDs.
You're right. Host assigns a unique DID for each virtual device. 
Previously, I had some misunderstanding about this. Thanks for the 
elaboration.


> 
>> According to VT-d specification (section 6.2.3.1):
>> "Scalable-mode PASID table entries programmed for first-
>> stage translation or pass-through (PGTT equal to 001b or 100b) must be
>> programmed with a DID value that is different from those used in any PASID
>> table entries that are programmed for second-stage or nested translation
>> (PGTT equal to 010b or 011b). This is required since hardware
>> implementations tag various caches with domain-id as described in Section
>> 6.2.1. Scalable-mode PASID-table entries with PGTT value of 001b or 100b are
>> recommended to use the same domain-id value for best hardware efficiency."
>>
>> When VT-d IO page table comes to virtual-iommu, the definition of domain id
>> doesn't need to be exactly the same with the one defined in VT-d
>> specification as the viommu providing the service is virtual-iommu, not
>> virtual VT-d and only VT-d IO page table is being used (domain id is defined
>> in PASID table which isn't being used).
> 
> Yes, even if they have the same name they don't have to mean the same
> thing, we can pick for virtio-iommu the usage that's most convenient.
> 
> However, hosts have to support IOMMU emulations such as virtual VT-d as
> well, so in order to reuse those host interfaces for virtio-iommu, the
> safest is to specify it close to the hardware design.
> 
> Staying close to the hardware also allows supporting hardware acceleration
> later, like AMD's invalidation and fault queues that can be assigned
> directly to a guest.
> 
>> So, it seems more reasonable to define the domain id as an identifier for an
>> unique domain for each address space for virtual-iommu back-end
>> interception. Any ideas?
> 
> Do you mean that domain would represent an address space uniquely within a
> guest?
> 
> One concern I have is about reducing the number of address spaces.
> DID+PASID allows for 2^36 unique address spaces, but domain alone only
> allows for 2^32. Both are more than enough for current use-cases, but it
> would be better not to impose such limitations.
> 
> To be compatible with DID+PASID support of hosts, maybe we should use
> domain+PASID to identify an address space?  domain wouldn't represent a
> PASID table as in this current draft, but it would be an arbitrary ID like
> DID, that the guest can use as it wants. That would keep the design close
> to virtual VT-d, which would be good for compatibility. If the host
I like this idea. It makes sense to VT-d. I adopt this idea in my POC code.

Thanks,
-Tina

> expects a (vDID, vPASID) pair in attach and invalidate calls, then
> supporting virtio-iommu would be easier with a similar interface.
> 
> If domain uniquely represents a guest address space, then the INVALIDATE
> request wouldn't take a PASID field. For a host that is implemented to
> support vDID+vPASID, it would then be difficult to translate
> virtio-iommu's domain into hDID+hPASID in order to invalidate TLBs.
> 
> Thanks,
> Jean
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

