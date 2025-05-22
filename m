Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D7B261575
	for <virtio-comment@lists.linux.dev>; Thu, 22 May 2025 08:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747901414; cv=fail; b=tR6LavQ7Cx15udeWGJcvSGu2Izse+bPjofZ3b7OJhQB9LjFRskLppZ43kOLo2R2D74Bew/F2KATq7np8X6n9kVKYKmpb9FsPgUTyOaTk7Tl7HC1Fo+0AHCUHCQ5kbX44nXH7Pv9pLtjHarafHQ1CoS3wXnp4kMBDTYlgFfgKJLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747901414; c=relaxed/simple;
	bh=8GJZxRBinJVIQ2bwYU9DJgXx6DIShnMBsTc9vjoXvjA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RyHmMyLSMooHXfddD+GiN7o08MUSbJUAFtxtfRQPevKvRCt0CMQ3Xc09mplqbOpOsyElt4W4KNyYtyvqPsFBPnv7nvR/wrqpfRoFN6XdCbv96+6sQPMmvZEWWNP0VTedVqfARMIsTe2r5vqmrejoYBZkJ5iIudoMcuvyeUO5t7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NHMsL+03; arc=fail smtp.client-ip=40.107.94.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NHMsL+03"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avCkvnxPhtmpSgkx9tEUlzGAYskT22z6RVWwrJLrHpEkwljytTfGG5LJbrYfI+JZJAduRFG50hT6GAB1U3MCXRpdRtOa2v8PmFq0G7LuX6mOx6ebd2B0imxtevmJJqh9TvFf15PcXYQ+A8YvP+tI89nMHPPrBkkBoDxF2Yc8mqd+fvFzaE4AxvSiM3jb750mGFS79Es6z0ncowDRPgCA2mfWgqh95Xu8JzdpfFEUvH8oKohfaNu4GUbRRHN8mzZ9y1xQj73W76EJoIgosMhmCmJ6DsUfUMF/7+Qn4Aq2sNJT6EVwivGohQ2PN07neflAJ+T53mDSptsXH7Ky7DTmDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GJZxRBinJVIQ2bwYU9DJgXx6DIShnMBsTc9vjoXvjA=;
 b=uq05Eci+yTVKOP9xRwWHDIdBXl0kS6dnYZq03dEtI2mPnlyLmXiZwWmy5Ejkxw2jmq6cYBBqn332CaPDZiz++hQsdRE4sI5UxE80qvZ+yNIeP2v+bPdWWd3/CptitYY8bVMONSWRV6WF8pz8AUGy70cJd9597dUWwZaVQX5JBOEGy61SLcKEXKyI84sVr2LMTt6Gd5yoqGHKGawPmTqDGmIe19hCKxpTu6fKdn/fJXi3NesiXwNRf6/gpIiZyc46Bo6Bs+I5n7BpDLwijCt+I+t+qUZ4NNIJVV06qLu92424SMTHj5qeIrGZQIMuEHm/lPftSpsbuZm+GpEcZT3LUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GJZxRBinJVIQ2bwYU9DJgXx6DIShnMBsTc9vjoXvjA=;
 b=NHMsL+034OH1qHfjUx/Bfz8jFoJeTfryx13cW6rU2K+wz69qn+QMbWbnuTumvgsxG6hDBKr17FL/HLWGvJcOIIaSa+pzWITv9TdVizE010c7DkQlBYDW3ewfQx+PK46wnuVa60gu9pLbO2Gw/Ev3HPI6E6Rf3GzPidW6uJbywHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by PH7PR12MB5617.namprd12.prod.outlook.com (2603:10b6:510:133::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 22 May
 2025 08:10:09 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%6]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 08:10:09 +0000
Message-ID: <9945d6af-f345-433f-8207-8dd4666eddd2@amd.com>
Date: Thu, 22 May 2025 16:10:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] virtio: introduce SUSPEND and RESUME feature
To: Jason Wang <jasowang@redhat.com>,
 Qiang Zhang <qiang4.zhang@linux.intel.com>
Cc: mst@redhat.com, cohuck@redhat.com, virtio-comment@lists.linux.dev,
 Ray.Huang@amd.com
References: <20250521102049.68666-1-lingshan.zhu@amd.com>
 <aC68Kj5XI9bJXf5P@dev-qz>
 <CACGkMEsJBB3U--yUKPvbCBLO_cdrQ0pJrRx-P9B_haMU_8cNng@mail.gmail.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <CACGkMEsJBB3U--yUKPvbCBLO_cdrQ0pJrRx-P9B_haMU_8cNng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::11) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|PH7PR12MB5617:EE_
X-MS-Office365-Filtering-Correlation-Id: f5a9ed0b-b2d0-44cc-e1f3-08dd99081197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1poWHdqckE0WVpXcXVwTHAyNjJUZjlYQTAwdTZPYU4zNUlla1VJMGRtYmVp?=
 =?utf-8?B?NEloNDZhU2N1dEpuREFMcFIzQ0R4dzhFeStkM0J6L1RiaVhKOWY0R2RVQ1hu?=
 =?utf-8?B?NG5QMy9ONVlhVnlMZDdzUlZ3Um04Qkg4cVJBbmFKNDJkU0NFUEZ4YkRyakRJ?=
 =?utf-8?B?c3JSbnFzSVp2VXJzLzJMekxVUWJybWUzbzJaeWRjczdkcHUzTGNtbWFQMzZL?=
 =?utf-8?B?b25xbWlqNHBMbWtFS0lhYlpJd1NhNmVUdEQ0eUxJZUlCa1Z4TDVTOTFGa1Bu?=
 =?utf-8?B?MjA1WlRWb3NQbENXRW8vVzJ4aU4zZndabGhNd0JJcVRBNzRMVnVyT290WWow?=
 =?utf-8?B?Q0lnZWZhNFdOUzI2UmRZRHBiMlNaTVd1aG11OFJTeXNabm16NzVOV2N3c2Nx?=
 =?utf-8?B?UDY1MHY4UzVSeWFtV0IzbnVJSmtrNnZ0bE5ZWlVUT2NQV01PNWdZVVg3dDFD?=
 =?utf-8?B?T0lFMUZCVjdVYXo3aUxuYUJGck1xSS9SVWJPUGExaThReHhPZDdORXQ4aVVL?=
 =?utf-8?B?cXZLRHhlOXRsRC9GQytCaWs4SGw3QThHZnRCTC9EbmpyUG9qRTdLV0czaVZJ?=
 =?utf-8?B?cCtldUxrbnJzSlF6bk80djVJZ1VFd2ZFVkZYeERBTVpaWDRjQWJvWWs4TXha?=
 =?utf-8?B?OWw2Ky9Va25DdkgxUFVIaEI3MlNRdGRoaTBHRFMzVnJYWWkvQ1BaZkdzUU12?=
 =?utf-8?B?bGxQREpBck9XbDFKb3owbkw0ZXlXTXNqNnRoYmVvYm1hTFdpL2tjRmJaV2Z5?=
 =?utf-8?B?Z3FNUElFNjRtWkM1UTdUY2NHdnJIaEJUY1BtUy95Qk1XSVRWanh3SWNSVHdV?=
 =?utf-8?B?Z0lxbzc1ZEhPdUdIMzJPeDRRejlETE10NXFScFdFMEdhV0djeVMyUDdIbjVw?=
 =?utf-8?B?UVREcDRVUHhCOEhNSkMwVWcweHh6MVJtWFgrMEJtM2Fvby9nVmtsMStHWDJZ?=
 =?utf-8?B?SGJzZkQ2SSszaXl5V1BndThNMitlNi85VUx0dTlEc0I1cXJhRjhYUU85QWNr?=
 =?utf-8?B?MWUxcDVXQXVBQWpZM2dhZW4rSWlSdGJ6RDYvM2F5ZERRZG40TjBxZU13elFo?=
 =?utf-8?B?RUFCbkIwenFrU1dGNUlsSXBBVGdKcWQ3TEp1dTg1T3EyS3o2aGhUZFJmeTBS?=
 =?utf-8?B?TCsybGtTUysrMHdub2xXZGM1UTNRS2ZueWdiOGFtSjhIdHZLZnlVVEpnRklk?=
 =?utf-8?B?YURKZk9yZWh4VnBwK3BzTStERGNLMHEvTzAyTVJvWmh2dDRYYWQ2eGJjR3FY?=
 =?utf-8?B?cUZpWkVXbEZtNmREeUhaVk50Z1dNWGx3cXg5MnBzZzRwejdFV1luWkNLVlV1?=
 =?utf-8?B?Qk1WdWhyczlhS2lIdTk4SGx4SVVIYmgzdmJIeTZvS0FnMm9JVUQrQW03V2lh?=
 =?utf-8?B?QnlKZUx0SDdXd25nZkhVbFpUWlZzS245aUp0RzRTcUJ4cDFiWjk5WE10NFB1?=
 =?utf-8?B?ZDFCcWZMeGZOVUI0M3dOS0t1cC81MWdiNzZFTWltUGhpcjJpMXZsdDNqYzNF?=
 =?utf-8?B?dVBDdTN1RXE0TlZTSC9LT0R4MnoxNmJBeTV2RUF1VzNIOXRRZnljSldvMXNT?=
 =?utf-8?B?RVRDeVVVMFN6VnhpWmJoT3Z0NzJBSDJ4UVFDSnozTnowTWJ5OFBlMjdSQlNp?=
 =?utf-8?B?WjRmb3VKNXBBTFlzUVZOS1JZV2Zjaks3N0psK2dieE1DSkxXaEo2eGlDMzRN?=
 =?utf-8?B?bmNQYkdHQmR2TWRrZWxvOGozU2VGMnlod0xzeUJuTkVWUStuMVliRWlPbnAw?=
 =?utf-8?B?ekgwOWk1Znpud3RGaStwOENVZ0xSSUV5SDhyUlRqVjBYVWVkSnA5SXh1ZzE1?=
 =?utf-8?B?eHJGMzZZUTE3WXgveTFtNVlEallIdkRVTGRSSTVXMkxKcm85VzRLY2ZIRFh0?=
 =?utf-8?B?Ujh4emVmWkxNdW9NMTh4N3BGREpyakZnR3NqaWpWbXZLWUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0NNSVFZZ2tjN1Eva2pwOGljOTVtbktzNFNhRmhWbnRFZ0FTVlpTN0RVM293?=
 =?utf-8?B?UXVCZm5pcGhyYmkrcGFrUTlINTIvZXdHc1JHTHVOS1ZVYW9FR3cyUmFZNnR6?=
 =?utf-8?B?SUJieFFqWTJyVDU1QmxJWlhYdjl5clBTdEVWbDcxb2wvRWkyc3RKMDI3Vlhq?=
 =?utf-8?B?Q0Zvd3BSTFMwMGk3UGF1eml4bGZLS1p6enhzczZNWDk3aGdsT3pJSnJXRFVB?=
 =?utf-8?B?aFc0S3BBcXpnTzdJemppOW51TGRhLzdNU0xLVU1rS3M4b24xSG1QSHhoeUc4?=
 =?utf-8?B?NEhPelQ2RmNGWDl0TlJwd3Jkbzl1T1VJSTUxK0FwWllzNUhGeVRwL1pFUkJt?=
 =?utf-8?B?K1YvK3NtRStMQ0ZxMHVKUnJDR3A0cnpFcjQ4ZnY2a1ZHY0EzSHdTSFpKNk1y?=
 =?utf-8?B?TjdXNGYxa1pDRytaR3JycElQcEFDbWljMWRUWHV0TnF6OTV5clpWcEpmUW5H?=
 =?utf-8?B?TG5mMTYranJ1bW9IQlJhMjRLWFZVTTg3ZTNQbzJ4MmU4ejhqYUd3VEovWFRT?=
 =?utf-8?B?a3VqSjcvMmRaUlcydW5Ld1g5ellNT0hMZ2s2OVkrLzlxQ1BXbUxHT1haM05k?=
 =?utf-8?B?TG5UbFJ1amVKek5vMTloK2RLWldyK1NGREJvYzNRQW91V3lRM1FIbjk0SUFX?=
 =?utf-8?B?TVA3VTYxL1liZSs1dnNBUGwyYnVTYldwekJiNU9wajB6ZjhwTis1RndyeU5p?=
 =?utf-8?B?NUhPRzVMQ25kdnRwcVVMSlI1NmR1TE90c2k5d2QxSVFteE1vanJqWlFTL2lR?=
 =?utf-8?B?SFdqcTZmSUtYVjJ2OHJhZnFEWlB6TUppY2VmVjdTZWZNWEFFYk9IZnZpNTI2?=
 =?utf-8?B?WDJDeThmWG5ZOE1TTHlxcTRLYUNkcHMzd1BYSVVEYkFCQkpQQnJHWG9INkd6?=
 =?utf-8?B?Q3BHMm9YbzBCRUdqOElCWkdmcVlwZHFlR0prdGY0b083ZWU5M0R0SldaRFR4?=
 =?utf-8?B?RUtPSjRQUEtDYXVoT0RjSU5ETDJmQ0FCL1I3dk5jdUhwR25Dd2l2eW1xNmRm?=
 =?utf-8?B?bXE5L0czaFBOdVBkY0xZQitJU0Vqc3BkSGV3aFBrYUorTHpBL0VOSXdnU0ox?=
 =?utf-8?B?dmF2R1EvSmRjMFhTMngrUUU5bitJZjYrSjI4dkFLL3VHckkreTN1WW1WMDRC?=
 =?utf-8?B?N3BtdGZNa3p2NnZEajBuQlAvMVZ2NTU0aTJkK3Z6V2lrT05Fc0FyWDRiYTR1?=
 =?utf-8?B?K2lodHZjaWsyT1FvaVkvVVc1d2JIcUN3R29nUmc5TGlQTWUvYTZIMStCR2Fx?=
 =?utf-8?B?S0pUR25WNTNkWVJrdUNKOVFET1NnM3VJY3F4SHpkZ3puR2p5MWF3M0RuL2Uv?=
 =?utf-8?B?Y1liZ0VlZXlEWTRWTXVuaFpCeXNPTkx0dVNKZkZDTEJzTi94UzNBVXlFdXR6?=
 =?utf-8?B?MVZUNk9wZGpZYVdQajFnZ005eWdGTXlsZmFaV1ZHaERlQk5GRHlZRy9UVE52?=
 =?utf-8?B?T1Y0ckpCN2diUEVBYXB2WlF6cmY0QzlGWjdrVGk0NDdvS1NnOGs4dnpHZE1E?=
 =?utf-8?B?TVUyRVQ2UFczc2ZFdDByMXZURXEyUnFMb0VWNG4ydXFYK1k0UENDc3IzdHRL?=
 =?utf-8?B?OStnYVYwMmVqMk5YdWJjVWREcHpBVjJka0YrVDlvNm1UakxBM0JNRzRhUGgy?=
 =?utf-8?B?ek5USEU5bWtCMHJ4NUI3OUorbTRQVDU3T3ExTXYxNGNiU0w2UWxaZTNZeGxU?=
 =?utf-8?B?RHEyYWxGZ1Q1WFQ3N1d6bmdjYmg3bmtwMmhwQUM4ZTdua28yakJYaERCeUxM?=
 =?utf-8?B?Y0FIcndJTHJRZUNiZzd3UEtmOExQNHIvdEFSVWFlNEN1TVNkaENkTWxFYmsx?=
 =?utf-8?B?UmhWSE1aODc2dVdidTRLeEJua090L1FLQ0VlVDNPZ0w0MTV1SndGaGVsS0U4?=
 =?utf-8?B?a3AyVGM2QlZ6WkZCajY0WEhMN0RSRGJiWDR6em13bjJOR3VxeXJpQUhLNmM1?=
 =?utf-8?B?dmRCNk05RnFUZDJRN0dsZ1JDcWJQOGUyUUV2dFR6bTM1Z3pqR2Zld0Mzak1M?=
 =?utf-8?B?YVlvT0hjYWZ5UjJlTXlRSFFrbHkxNnk5MEhKVWgzRVpUZG1lSlgrY1I4Q1hn?=
 =?utf-8?B?Q3R3N0xVMEFOQXBBY3JyZGQyMituMS9DZXZkdld2L3dTMzh1MzVlME5QZGNV?=
 =?utf-8?Q?PLlaUL6Jd6cA0zq4FY3/zPFsB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a9ed0b-b2d0-44cc-e1f3-08dd99081197
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 08:10:09.3333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRWybVuVxyFwNmrBTBVRmZRkZ1JH5Uoclk7mLIyhfwMx/GRefW7FtmZjMDDJI3eOenTsFP3HC3sqp3SZp8gdAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5617

On 5/22/2025 2:59 PM, Jason Wang wrote:
> On Thu, May 22, 2025 at 1:56 PM Qiang Zhang
> <qiang4.zhang@linux.intel.com> wrote:
>> On Wed, May 21, 2025 at 06:20:49PM +0800, Zhu Lingshan wrote:
>>
>> Hi Lingshan,
>>
>> Thanks for your great work! I think we need more WRT suspend feature.
>>
>> Virtio device auto resume and guest wakeup features are not included
>> in this patch. Since they are very related, can we add them this time?
> Consider we've spent a huge effort to converge the design in
> suspending. I'd like those to be added on top.
yes, really huge effort, so let's try to merge this patch as a minimal changeset first
>
>
>> For example, virtio input device may need to expose auto resume and
>> guest wakeup capabilities present on USB mouse, keyboard etc.
>>
>>
>>> This commit allows the driver to suspend the
>>> device through a new device status bit SUSPEND
>>> and resume the device running by re-setting
>>> DRIVER_OK bit in device status.
>>>
>>> This commit re-orders the device status bits.
>> A rough idea:
>> A wakeup capability feature bit and a enable/disable control bit are
>> required. If wakeup is supported and enabled, device can automatically
>> wake up itself from suspended state to running state and raise a
>> configuration change interrupt.
>> Hypervisor can implement guest system wakeup basing on device's wakeup
>> capability.
> I'd expect this depends/requires transport support.
I agree

Thanks
Zhu Lingshan
>
> Thanks
>
>> Thanks
>> Qiang
>>

