Return-Path: <virtio-comment-return-5675-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC11C77B61
	for <virtio-comment@archiver.kernel.org>; Thu, 27 Apr 2023 18:50:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 87ECC3E30F
	for <virtio-comment@archiver.kernel.org>; Thu, 27 Apr 2023 18:50:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6C9CF98666D
	for <virtio-comment@archiver.kernel.org>; Thu, 27 Apr 2023 18:50:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5492398666A; Thu, 27 Apr 2023 18:50:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 40CE198666B;
	Thu, 27 Apr 2023 18:50:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6m0UI0Wm4EVAYOi427bRX5UV0e/oOhETmbNDWNqbfb7WYJCVdE8kDGD0NBMC1LFEWpqVPeB5Y7TEWRaN3Ec44DFT3XgoV0iNoRRCB+ApqydNoJ8WfBCw6R2N0TGM37uUQFdADSvnHhNySWcmmuO4AhmSpOnh1X+g0FsI956ROeu2SgZY1T04x9/NOTZq3kmOAXvizCSQHmMoZVaWoYzPmy7LIJq//3EHDgOeAw2prFajV0ztnmVNNuZmvt6i61S4vv5gAYwfvWq96DnnRZNaKIA6HBzJHDPH36B5Pp9UYw4UkcR31mjtIpctaPzTz12M3aJNYJmEDCEWJGOTv3nIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfl+eBGe2ndar1srlGNDgrpM7SWS8Dlt9WJgRFwelQw=;
 b=oK5X1+nIv67DWr5GkLa9/Y6a6bEzEvwZcsYpFWLRJHhx2FbT13DQKUmRMIPEDyJ6zpwyv12t6il7rJ93m1bKajrsT2ae8H9i2A037LG/9B5lXZzJsmzkO2as1G2QM4Wn/5lw49SHXqBjokpYBPJxjp+a75t/BVzClbf5EFq7m6nFwHCx8SXXQDCsESD8ZpOwFH/UebPsh06BBy2eCGKzxPqxxXyL1OFG+QJAia2+2O8YxMQ3TyxamymosA4WDHPVibGMzlQhaMm7WTVKB1tBUo+17C1fYTKtkjEhMWrBiVycPAQIHRkCbzhcSRV3cy8hcoy9hfxel3qOFTKoiRnNRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <20807e30-9681-bc41-800c-84d6e17047a7@nvidia.com>
Date: Thu, 27 Apr 2023 21:50:39 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "nrupal.jani@intel.com" <nrupal.jani@intel.com>,
 "Piotr.Uminski@intel.com" <Piotr.Uminski@intel.com>,
 "hang.yuan@intel.com" <hang.yuan@intel.com>,
 "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
 Jiri Pirko <jiri@nvidia.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 Shahaf Shuler <shahafs@nvidia.com>
References: <cover.1682354275.git.mst@redhat.com>
 <8a3435860747eeaa038ece4ff896c1cdd441c185.1682354275.git.mst@redhat.com>
 <5858e2e6-0b50-c155-85e9-eea6dfb533e1@nvidia.com>
 <a4b1596c-2132-714a-7557-fa5249a55945@nvidia.com>
 <5cb79b37-a066-283c-eee7-afd26146d988@nvidia.com>
 <PH0PR12MB5481B60350D145531A43E567DC659@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b7addd39-d913-700f-ac67-1412825d580b@nvidia.com>
 <20230427135654-mutt-send-email-mst@kernel.org>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <20230427135654-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::6) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|BL1PR12MB5174:EE_
X-MS-Office365-Filtering-Correlation-Id: a6d95be4-853c-462b-aa5a-08db4750505e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z2WmvCfcArHqUaUdyfUOPuYRONZYnq0jBcjLLoo9+JkO3lKEFPSSfg8B8BggBkz6VgndmQ8vffxzu0NFMhtGFpO53VgTtk3FiCRSK7DOCmZZjn68jlSMXKM+1V7Z9ROAb5Qn4jxyalLBUGkMI5QxCm9Wd0xdTvk5h2KYWpmLpgem+OCtCcD/IHu80uYa3wCLi8leDVbTlftK06L/+O3qKcpFznpv+pZoCr/wXEVMEaP50Y5N7EBNkdM46lWdlKEUbtHWCgRSJE+PtHLchpcOqhSRZ0/qCWqCphsDN722imBKoXiEpo9xqlJbMsjxzMolDk68RZxnUdm2TiHo/m5vFj+25IDsCHpAxJKUl/FKOpdBBeSoIybQITJBf220LkKLGPQo9k+Ju2ykTOuPJ+KOVD7VwoT8uJ2SyD46AdjWe5+fiS/MNGe1MPF3K/+VJbi/C30eKXNS0skzAb+bBQRsWYJLzsDjEO3oxyEMEdNYk0e2iRmkaQ2UkgGaebGSl/+PokI58FzAftL7JqeF0Z+QXiRk7mhjvxpc9HFOo/BqsG9UhXKAf/cJ8QPvcVgswvsRsRGr1Iypwt7FQ+hBBsIP/upeX+RcnnLj67An3msspon5eT4DTgSLFs37OhlC/HWTtU/oFSAVDBy9ldPAI4wvkQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(451199021)(53546011)(186003)(6506007)(6512007)(26005)(2616005)(31686004)(83380400001)(6916009)(66946007)(66476007)(66556008)(5660300002)(7416002)(41300700001)(38100700002)(316002)(2906002)(4326008)(31696002)(54906003)(86362001)(478600001)(8676002)(8936002)(107886003)(6486002)(6666004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZURzT3lsb1h3V1dqZVdIc1JGd3IwZlFlQWNISVFEZGxaVnRTaUVCaFZJM3E5?=
 =?utf-8?B?cFFFRHp5emgxeGVRTmd0bGFJMWtzRG1aSmhnVEVZb2FkdFJZVHFXMXR0Ymxj?=
 =?utf-8?B?NDVsYTE3ZTR4ck9QZnd4blo1Q0xmQXJYSmxWVnNHT1pDQVFFU3J0Nyt6WitF?=
 =?utf-8?B?Slg4ZkJ5a0MyMWVjTXdNQjNuWElZU1dBUTRvakxNY1B6dmRmRkZONkpzb0cw?=
 =?utf-8?B?K05pdUhmSmRRWFZLUEpCM0x0aksrUFFpdnVSYk5pZWpNQTJBclZsY01malFw?=
 =?utf-8?B?YlJUQ0NpS3MzeWcxTE5PaTBnRCs2bzQrRVYzdnNkYmU4OU1vNlVqWjdUTHlp?=
 =?utf-8?B?T1RJRFQvTVZwUDk3WlIyMzBCUkwrajM2aUVuZGlUeUlFcGdRKzl1cmpuQ2l5?=
 =?utf-8?B?bkZhVU1CWWMvYndjNi96bUVlOE91T0haU3RJL2dhSk5Pd3VIckJtR2RCMGpv?=
 =?utf-8?B?bXFnaU9XbjhNcE5PdCt6cGFKZjR2VW1nUnYrcVVOL1F1TXVzTFFnUjJvNmdX?=
 =?utf-8?B?cS94bUw1aFROQ3Q1bCtkaEZVYjVFRnVZYXU1ZWRLTklqakNEbkRaNGw4V092?=
 =?utf-8?B?OG5Yb1dENXRxcWNtbjlqcmE5NWVLdkhDYjF1anVaakhtY3IxK2pmQTNJQVUz?=
 =?utf-8?B?a1NrL0hGMjhITC8rNE04bVdwR3BzRW5HTGEwZ2VHYlZjWmpzUFR6VzgxYUUw?=
 =?utf-8?B?YjVucHI0OG81ZEltOHVNN0dPbmU3c3pPTWxOK21uMEZSUmNvYW1neDlBU0Nw?=
 =?utf-8?B?UGQ2Z3Bra1FCUEFRbVhka1NPc3RyQ1pObDdlYXhSSjc1TzllSUFTY3BBSFA0?=
 =?utf-8?B?bG5hOUFpTTVpTHRVRnRDV2xXZUViVk9UTk1rSGxNRTB0T3pINDMxMHJPaURW?=
 =?utf-8?B?Ylp2ZnJZUWpSeHNYeTlKNHNlT1A3L2FKM003NmViRGpxVTA0RVpyQ2hrSkx6?=
 =?utf-8?B?Y3JVMVMrVnFMRy84RWFiMURxbERUVFJMdzJIY1ZpMjdGSTdlN1crUTFsRWt6?=
 =?utf-8?B?KzBIc0JqNGJ3Q0xnWDZ2REZqWXMzL2p6VlByRURieTZRTDIwaFZyaHp1SndD?=
 =?utf-8?B?N3FBZ0t0NVQzMnduRU1wM1o2elRQUzVJVmdHemdpSDloQzdjdkpqaWxPNXUr?=
 =?utf-8?B?RkhYeXA3M3dxNGo3ZXlPNjAzQWJVM3pXa2R5bDEvVUZNbWtjaUhhVlJJQzcw?=
 =?utf-8?B?aElwaURrRlcyZ1BkZ1NtejZDT05FZHBNWWV0SUVZV0grbFN4akM4WVlGUXBU?=
 =?utf-8?B?blJjdWdyT2lMTzBDVk1CdGdSZnBnZFV3dXpKYmI2VDBqaWc5TG91cysxNFhK?=
 =?utf-8?B?RDFaSG0zTXVNenAzdlRmTmpueTQ0QldyaHY3Y2V1MDdrdUJjaVR0T2ErM2RV?=
 =?utf-8?B?OGdiNno0QlJUcVoyeThtY0FiVmtzUWVWeXVzTHFCa0c0WUQwbVpsM3d0ZXJX?=
 =?utf-8?B?aDRjMkV2UFpFcHp0QWZNUXdlUW85YkZ4My81NGdxdWF5M2dtdWdVWk1KSjVH?=
 =?utf-8?B?NVBYQXloTU5NRjZLNEpZVExjU1BLV2VXanc2SDl3VndiaitTc2dneExWNm5S?=
 =?utf-8?B?ZVlxbWFqNk9oL2JBcUxONlZuUVU5dHQ1T3FEclQ4bFBOcDB2a1IzUEJHaHE2?=
 =?utf-8?B?MDRUdzlzK2xWMmRsNjVxMjRZOFAvQURJRkVHV1p3MG4xWE5DTE94dCtRZ3hp?=
 =?utf-8?B?UkJFSHJwZzcyUTJaM0dObmFybEpWUlNwY0xJUGhpcGZpNG5PL2FlODQ4czFo?=
 =?utf-8?B?Q0txbG82ckRNZkMyZEsxc25YMEIyUnVWZk1wVFZQdWpOYkJWUFFEdE50dzlo?=
 =?utf-8?B?ZW9rdUx2c3ZlempmS3J4Vlh3bXNORzhjV0gzbGprcklKQjZjZWdJR2tHWHlF?=
 =?utf-8?B?dHFrYWVaaU85UjBLTmZPcVpkdXVIbFhKQ1gyWFpIYTBmV0tyLzZyQmMrUWRY?=
 =?utf-8?B?TEY0UU1Uelhqc2ljQnFJSUpyRFNLTHh4TzZQUW1BWlp4bHloVmhuaXRjdWhB?=
 =?utf-8?B?aVU3cDZVZTNIRlJKMnNIQzEwdTVKdlNkNnBvMkFqVVJENEF0c0tXTUdzeVVq?=
 =?utf-8?B?aEptWGgvcStZQkNaK0NiajJreTBOaXlGQ2Rua2N3VjBBTzZjVG94NmlFK1RR?=
 =?utf-8?B?RVZPbDNMQWJpeGs3cVlaQUk1dlBnTEdEM0lweUpmRVBJYWdKQlBRYkZRRW5M?=
 =?utf-8?B?QlE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d95be4-853c-462b-aa5a-08db4750505e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 18:50:47.7401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+o3WUKgZ+WnhqdQKDQhVAfwIDDKTrCB6cyemh12KTG8MzrozysoEzoJrrPnTP5hCaqimdRJn0G37X/8z2Yppw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5174
Subject: [virtio-comment] Re: [PATCH v12 05/10] pci: add admin vq registers to virtio over pci



On 27/04/2023 20:57, Michael S. Tsirkin wrote:
> On Thu, Apr 27, 2023 at 01:31:29AM +0300, Max Gurtovoy wrote:
>>
>>
>> On 27/04/2023 1:11, Parav Pandit wrote:
>>>
>>>> From: Max Gurtovoy <mgurtovoy@nvidia.com>
>>>> Sent: Wednesday, April 26, 2023 5:12 PM
>>>>
>>>> On 25/04/2023 1:14, Parav Pandit wrote:
>>>>>
>>>>>
>>>>> On 4/24/2023 6:06 PM, Max Gurtovoy wrote:
>>>>>
>>>>>>> +If VIRTIO_F_ADMIN_VQ has been negotiated, and if the driver
>>>>>>> +configures any administration virtqueues, the driver MUST configure
>>>>>>> +the administration virtqueues using the index in the range
>>>>>>> +\field{admin_queue_index} to \field{admin_queue_index} +
>>>>>>> +\field{admin_queue_num} - 1 inclusive.
>>>>>>> +The driver MAY configure less administration virtqueues than
>>>>>>> +supported by the device.
>>>>>>
>>>>>> we need to say something about other virtq's indexes.
>>>>>> For example, if aq index = 0 then for the vblk device the request
>>>>>> queues would start from index = 1.
>>>>>>
>>>>>> can we address this ?
>>>>>
>>>>> It may slightly complicate the device implementation when device
>>>>> dynamically changes the VQ indices based on the negotiation of the
>>>>> feature bit.
>>>>> Also the drivers with and without need a different VQ index handling.
>>>>>
>>>>> I am thinking that aq index should not overlap with the vq index in
>>>>> range exposed by num_queues field.
>>>>>
>>>>> This also aligns to the exclusion of aq count from num_queues field.
>>>>
>>>> The namespace of the aq and other vq index is the same.
>>>> And the configuration is done using the same queue_select and other registers.
>>>> Thus, we need to address the above comment otherwise all the device
>>>> virtqueues chapters are wrong.
>>>
>>> Michael has added below line in this patch in num_queues description so it covers the exclusion part.
>>>
>>> +        This excludes administration virtqueues if any are supported.
>>>
>>
>> This is not related to what I was talking about.
>>
>> For example if vnet device:
>>
>> 0 receiveq1
>> 1 transmitq1
>> ...
>> 2(N-1) receiveqN
>> 2(N-1)+1 transmitqN
>> 2N controlq
>> N=1 if neither VIRTIO_NET_F_MQ nor VIRTIO_NET_F_RSS are negotiated,
>> otherwise N is set by max_-
>> virtqueue_pairs.
>> controlq only exists if VIRTIO_NET_F_CTRL_VQ set
>>
>> and in vfs device:
>>
>> 0 hiprio
>> 1...n request queues
>>
>> So if one device will expose adminq that will be with index 0 the above is
>> wrong description.
>>
>> Agree that this should be addressed ?
> 
> It's addressed by patch 9:
> 
> 
> +If VIRTIO_F_ADMIN_VQ has been negotiated, the value
> +\field{admin_queue_index} MUST be equal to, or bigger than
> +\field{num_queues}; also, \field{admin_queue_num} MUST be
> +smaller than, or equal to 0x10000 - \field{admin_queue_index},
> +to ensure that indices of valid admin queues fit into
> +a 16 bit range beyond all other virtqueues.
> 
> 
> Thus adminq can not have index 0.
> 

Thanks.
Maybe we can mentioned it in this patch as well (in the configuration 
layout section) but this is up to you.

Looks good,
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

