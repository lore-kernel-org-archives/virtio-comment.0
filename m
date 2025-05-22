Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1563F221FB3
	for <virtio-comment@lists.linux.dev>; Thu, 22 May 2025 07:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747900725; cv=fail; b=XVFHvJVUB5YRAY3k1d2ufkMgk/owMBNsT8TIpH5KAOm9EYr0zK0BOuKf+qLCDXGPf287RWTESjGZNJxoO7gRKJ3F5wufvQdu4Yy87pEmqzSXnhvSKejGQ91bEaBjtRMFEB/OXH3RHD2yDEhcBXYQ7JfpIHM2eEE90AWiqQGHvgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747900725; c=relaxed/simple;
	bh=BinSkLrBnka7n1OW6iUsuJYUqSvRK2cFya3VPHcSB4I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uqCFYAm/0khDyi2rgtQa6O/J0/96hadM+8Jnsl4U7Fh246vymIOjOaeflsTmvg/cz8c978DHlX/V9exKrgw/7/LgGDHWFPJJm15rHsdMtJSRrDwfhfIKDIccEcHmRAlehaCf0KdObj06PY0jRPAiV48VbkIwhihFyCqC+kWhtww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fEKLBu7C; arc=fail smtp.client-ip=40.107.92.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fEKLBu7C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DS94uq6nUOC+nxYT9DkcipHm6VOV4s+ZOtKteyaSYLnZdx9iNHicQVAeD85Lt1uOOdWvkd7MQuiOE9zb6106nAkumUfOF4zu3rKuRw0bxn/qaHdsgJf05VVQpPBBn/otjQJnA5pWM+9k/FFYc7CTGa7pndIT1O9plIqMvBgh29sKkiFrN/AMu2NGbfGrtq6of6LExxvg4/WeMYyduhRROEGLm9GGW5X6HpYd64BHjb+lNGL/+jo6iSrEuOtOHp/BdC/d3pVYZo9CDoJ9TxjnjgapTgBx/+Fvj//8MnassTs5vZtGSMefaFbV81/f+IAMxRtBUpV8MPL7XXG+RdP0gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=As35WwOtVhjDthTKwyf8DfKCx1Bw8qBM+V5YzoguYM0=;
 b=huvk6b0AZvu6KGbSouBsZp4V0WUU3pQ9Sc9Mj0BSShm+aMwyGwr2rIiuu6sr+jX7rcjjfDPqyZc86h4HqsbEAgeS/eOJobk0bs6iCTap5KWWj03yyr6wpmI9b29uiYeUt94xKh6Lr5jVotQO+rSE2pXnHNjXDHL+r0WAiVFeTUCK1Vzr48ucCVbSy3vUouhlaC8fktuZ8h8Nlnmi/5HmlSvY/7U88JAAXMAExqgNErcu7IH0Bf+19MKT5XSUcOkLidb+wmVtg304l0eT9dp5KwAOq9HoMl1o/TfZ2q7U5QlyMxgMFKWDO2Tdo1Fexthip8gY19aua+skL/h6QxOtaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=As35WwOtVhjDthTKwyf8DfKCx1Bw8qBM+V5YzoguYM0=;
 b=fEKLBu7CPVzJwTbtWjKfhkGIDy3sddNF3snJFXuz+5q+GMz6USRhpYhNqEugolCD0Vdi3QdtEMcmaZl+k5aR229/YbYafY39uJDbHCR0tUz/NuMI/y7YEcjyeZ1jZZjHBQHYKn6fbBnxE23PCGSquSBIrQVq9zrukVf3PY/VoG8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by SJ2PR12MB9243.namprd12.prod.outlook.com (2603:10b6:a03:578::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.29; Thu, 22 May
 2025 07:58:37 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%6]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 07:58:37 +0000
Message-ID: <8d6f3dd1-4b50-4f72-bfa1-8aa7a00948b7@amd.com>
Date: Thu, 22 May 2025 15:58:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] virtio: introduce SUSPEND and RESUME feature
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: cohuck@redhat.com, jasowang@redhat.com, virtio-comment@lists.linux.dev,
 Ray.Huang@amd.com
References: <20250521102049.68666-1-lingshan.zhu@amd.com>
 <20250521062613-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <20250521062613-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0194.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::22) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|SJ2PR12MB9243:EE_
X-MS-Office365-Filtering-Correlation-Id: 14efc3c0-bfd5-4f16-d11a-08dd990674eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y291eHZGZnJoQytYNXBmZ2dLaDRyLzRlQk9OQS84blVBZ1dONThoZWtyM283?=
 =?utf-8?B?Q0NzU0VmUjBJc25MMVBILzk3eFV6eFlSa29XS0ozdExVWDRaeUQ4T3h1cmwr?=
 =?utf-8?B?cklra2FvME00WktJUEFEU0ZvTWRocXpuM0JYMVBSSEkwUXZWaCtXWFVpTWVi?=
 =?utf-8?B?ditYMjNtbkdmL0s3N2V2R1NhRjdoM1h0TjFRSjgwSlloSG5ITmZsNGZNRzVy?=
 =?utf-8?B?d0t6K3BPNmxGV3IxNEx5N0xDcW54RzJxY0ZpRXhJdyt0SW96UDBMaHlXNXJy?=
 =?utf-8?B?akFKQXF2SDEwMFVYWVd3YUkvdlVzWkh0anFBdCtFTlgreStqakpXN3llVHlB?=
 =?utf-8?B?NzZTTFVWSERPWllYbVZVdjVtcWhiQWxrMFRUSUVtblNCT0hVL0JSZ1U4clpP?=
 =?utf-8?B?TmlJdE0yN1BZRjBrSTNsV2dHNm4zVjI1azVhRldUOER5Y0d0ajVvL1dpdHYx?=
 =?utf-8?B?ekZHNFl2eWgzKzM3NXRwVEsrTUNVWFcvdTJsQWRIRkxieFE3WDFBejJ6cC8w?=
 =?utf-8?B?WDFUQmhDZ0trWkJicUNuTGpUYmdxa2FvRmlpRlpuMkllbzhKbjIxZW4vYWp1?=
 =?utf-8?B?YXM0bEU2ZHA0WHh4VHg1V2JrQWRIa0NiTmVYbmlJTUVxSXBBOW1vZnhvNmxI?=
 =?utf-8?B?dHprYzBVNlZKMCs4ek14RVUxS29jZjlxVmwva3o2UGc5UDdiZUpTTGlWR3lX?=
 =?utf-8?B?aGFtUlNZYUVNZm9KVjFEWXFCMkZSeFNzVmR1RHVhMXRpY1BWOEIwVGc4VjI0?=
 =?utf-8?B?V0g3RGxhVnJNR1Q0eTBBTkx5V2padUVGQWt3cWM0U2E4SDBVUkVGR095QVF4?=
 =?utf-8?B?VGhDeDhtUVZmSEUrL3NRdHF5TittSXBhRVFWdjI2dURIYjRPOVdpU3ZYMktO?=
 =?utf-8?B?dlVhdGk2MW1sTTNweTlXTlNJWTJuSFlrZGV5U3RtelZKVW9UZTIrcXFmeTUz?=
 =?utf-8?B?ZGlUVmJTWUxlY1lGYVlLVVV0eWVwbko5RFNZV3JLYzRHYUR3L1JhbWNZNW5B?=
 =?utf-8?B?RUcrRjhNbkFGYlo0N1Rya1IvN1VlMkxUUTVVS0cyNTVQL0NoT25nRld5anZO?=
 =?utf-8?B?WjZMZUF0dmZJcGNhdVZpeEw3d21iNWRmbitUWER6MmE5emdWT3VJVjBGSnVa?=
 =?utf-8?B?alNQbFpwWEFBZ2xxSE5UbkZqWm8zTGZJVEFYL0Z5VXp5N1lHenYvcWZSUUNP?=
 =?utf-8?B?WUJUeEZkV0tJK2p4RjZpckh4R0tMMzdTdDM2OVFzYU1PWm9EYmM1TUpjRjdl?=
 =?utf-8?B?SENaRDZZSExZWmpTbTR6a3hoTTVINlJHSThCWms2NzRVVUhkZjBOR2VFK3VZ?=
 =?utf-8?B?Q3Fqa01MQVU1Ym9FeGZOMEZmcW1kdzNUdzdZSm50RTdQUnJxTTQvZDFCRTVp?=
 =?utf-8?B?bGJyV2VpZE51NExySGtrSlNQQXZsdzlPWEhGWVhhRVEzdVdaZDU5L0ZQMjNC?=
 =?utf-8?B?RGJNMEw0ZGpGTmQySEVpK0dvc01ibWo2Y3ExK2IrN255L0w1ZWhpeDNOaFRi?=
 =?utf-8?B?UzEyQ0dtbWtOMGVpYmovNGJzQUdHWmRDRTFBaHd3U0svd2xVWm4xblN0aGtr?=
 =?utf-8?B?dWZ4ZUZqanJTSmRYOWdTeUp4YzQ3Tk96VTgxZW96bXVHZERhNjdrVzdsYzhZ?=
 =?utf-8?B?WlhFNDhNaFA4bXZCUlpJdlJUVDNYcnRLSnVETVljb240eDhrdzFIS0tlNkV5?=
 =?utf-8?B?T1l4cXErOTFvbGNReXFHelQ1Tk4rKzJ6eXBKNjFma2JVb1hkVlVsSUgvd0do?=
 =?utf-8?B?ZTdQaTRQbkpzalUvVEdRc0JuVk13Z0JXNmw3ckxJTWlxcEV1UGZ2bEorYllH?=
 =?utf-8?B?WEJVS1FWT1pyU1prT0ZNakFaVHpwTC9CbnkxamVOS0lDMmZuZTUvOHdtenZj?=
 =?utf-8?B?YUF3NVRPTTBocmZ0Tk16aDg0VEVsZlh6TXhjdjZTMDBEV0tKUktKOWZkUzky?=
 =?utf-8?Q?EMnFPf0/Q1I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VW5xM0tNTFZuYW9IbEQ1ek1nVElqa0Q2TGlnTTNZaUlDekpVRitON0tXTC9V?=
 =?utf-8?B?VXJ5UVlmQUg2eFNQUmZOT2FFVTBPZXhHRG9WcnVKUlFpelZWcTU5VTJJNGhM?=
 =?utf-8?B?YXlHaXIyN3R3a2lHSHZ0MHhlYlBmRVFOSHRLTC9LOE8vdXVzb1ZYcllTaC9Y?=
 =?utf-8?B?N3JrV0NicmgyRVNIN3VPSWsrUzJ5VFd3bzcwN3ltMUZTVkdzTEZoSWIrQytq?=
 =?utf-8?B?WHJBZE95emxWZGY3MDdNSE9jVlZKbzEzQld5YnlMSW5sTHlzQkJSNGQrQStT?=
 =?utf-8?B?clRFT1ZQcHVsQkQzamR5V21hekIyM2kweXRxREJ3bW0yM0R2UFQwdXBnQ3Fw?=
 =?utf-8?B?SktwRTRUVE9jQUt2cUJHblFSK2Y5ZnlzMlI0ZFpxWldycEZYOFlJZERXTnVw?=
 =?utf-8?B?WHdLVE9qVjFRUGUrNDdXMjRZb0Z4K3ZlS1J3UE1sdEZxa1d0Y2xpOUZMdm5K?=
 =?utf-8?B?MFpHcXRzMFJlM3BseXVRMm1nQzVHc3pyalpJT3pZK1hWeFJYTUs2cndzdzlr?=
 =?utf-8?B?YzFDVkNGR3ZwWnc4Q29SaUp0bWJMaVZXaUJwaEYwSS9oK3BKeUJJcTlEc3Ey?=
 =?utf-8?B?QjJyNWYvZE1ZWE85bmR4cnhvdzR5ZEl6eG9QM2RiQ3FmYkQrSVFUNVVia2R4?=
 =?utf-8?B?N3JyYysvbXJFQXovUC9HVUV5SFRlQTlyMWd4UlppTHIvTDdSN3ltR0xLclhJ?=
 =?utf-8?B?TEkwUUpVTFVkSFlMam9JeVhsQi9XV2xFSGtoNTRSOW5MS25NRklCd1REUkxS?=
 =?utf-8?B?blNPN0UrN2VEU1c3ZlB1cXAveVlpZFpoTUIvVHR0bmRwdnEyazdzOXdHelhY?=
 =?utf-8?B?VHFBeXdBQkxwNDREUnNZclFUZjJVTVh6SzNDcmFpZ0dzalB6R0lqRHdsSEtR?=
 =?utf-8?B?TjNTMkU4YXBmUkhtVG5GbFJuRkpjZGNwOTZGYlo3aWZLL1VTQ2Q0cjF1dWUw?=
 =?utf-8?B?TkI4UlhlV1NxQjFtMHhTa3JlRk9yN0M4UDhyd25NOU9QMitrNERFeXIrV2dF?=
 =?utf-8?B?djRSaXZ2MHVMWkN6OHkzeDFCTU42SUdEeG1DNGtWZDNkNVpNblZkdXJFUkJJ?=
 =?utf-8?B?cnNRU0xDRVlPQW5DVFg0akNQM0FhVk9FeDRrTjkrTkxXdFdTZlNQeSs5Rllj?=
 =?utf-8?B?NW56cElvMStLTXAvREg3L3dPbGlqd0hmcFZkT1NlcDA4SFhEaVRUZVJlKzFX?=
 =?utf-8?B?NUxydEE1YXlzcHJGZXU2YWo2dk04QkxGbDF4eVJQVEZyelQ3cG1GVjdIb2Zs?=
 =?utf-8?B?NklUbEhvWmFocUY0YzBwelNRMHBta04wOW1lQ005MmFGYjBRVkxmNWlDeTQ3?=
 =?utf-8?B?UEQyNHZ1UWxmNUhPd2lmMGFualQ3YWRSb0lmNE5waHc3dWFZZ284WExQRkFY?=
 =?utf-8?B?a0FwN010V1UvaGs2UEhYN09SWUxzTXVhckNIYjhXVkhDZmpPZzk5YlArRzVL?=
 =?utf-8?B?eU12TXBvNi9rWGhlb0E4Z2pYTHpJbHJFeHVJQk5ucmVqR2NIQ0Y2a05yN3B2?=
 =?utf-8?B?L3hFSzJnN0hGOGVjT0pIeHNwdHB2bGNzLy9ZZG1mN3VKSmJrd3ducjloekVp?=
 =?utf-8?B?cmZrUXRNYWdLMUthSTA3Z3E2VWNSVkhrd3BtblJqa29uekpyUzg1YlE1MjdX?=
 =?utf-8?B?czNlS0VjQUpSc2dldEQxc0NYSzIyVHpqM0JIME9WMHBrcFRhY3JQOXY4VDc3?=
 =?utf-8?B?UitocTdIUW1pWXVlbG1hc3pUUkhkWWk4NUJvK3QySkV1cEpTT3R2RlpmV0Ex?=
 =?utf-8?B?c3k2L0xNQ1VzZzdpenZTMXFFSDdKQ0dNckhhSmpxRm1DOWllblVGVlEyd2tV?=
 =?utf-8?B?ZGZTeTA4RngzWStRWGNhOUtBZjlFRG9EaXVPemJ0THZmcnpzZDZiUStQWXpZ?=
 =?utf-8?B?RzBTc0xoajFHWHQybTNoL2xFUjcza1h2QldvcFhKZm1NSGYyeEFscWhHS1l5?=
 =?utf-8?B?cThZek5rWXgzeDFsTzdXaktZZ0hjSW5YNmR2aTZYOHNpZnFVSk55SHluUGFF?=
 =?utf-8?B?dnZ4a0RsTlhuamxiRDZjNVZmTC9Dc1JEeGJQQUtuNTJZL0pYUnpNNGJtYmlT?=
 =?utf-8?B?eUFwdGNNU2Vla1BoSlhabSs5Q1dTei9vTi9QL1hKb2l6RmppOGIwcHk3MTRX?=
 =?utf-8?Q?dQ5k+4p0jpqGGSZlFbPg5pHjb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14efc3c0-bfd5-4f16-d11a-08dd990674eb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 07:58:37.0827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tljmWQHyk6D8Q4tC0jOx4117bHYQ+BFkb5La1h7cPDSdsFg73CsUi7ticp6d21d4i5VnwScmNc86+qfWJd98Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9243

On 5/21/2025 6:30 PM, Michael S. Tsirkin wrote:
> On Wed, May 21, 2025 at 06:20:49PM +0800, Zhu Lingshan wrote:
>> This commit allows the driver to suspend the
>> device through a new device status bit SUSPEND
>> and resume the device running by re-setting
>> DRIVER_OK bit in device status.
>>
>> This commit re-orders the device status bits.
>>
>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> this looks good. yet something to improve.
>
>> ---
>>  content.tex | 72 ++++++++++++++++++++++++++++++++++++++++++++++-------
>>  1 file changed, 63 insertions(+), 9 deletions(-)
>>
>> diff --git a/content.tex b/content.tex
>> index d3fc6a4..38b4529 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -36,19 +36,22 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>>      this bit.  For example, under Linux, drivers can be loadable modules.
>>    \end{note}
>>  
>> -\item[FAILED (128)] Indicates that something went wrong in the guest,
>> -  and it has given up on the device. This could be an internal
>> -  error, or the driver didn't like the device for some reason, or
>> -  even a fatal error during device operation.
>> +\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
>> +  drive the device.
>> +
>> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
>> +  device has been suspended by the driver.
>>  
>>  \item[FEATURES_OK (8)] Indicates that the driver has acknowledged all the
>>    features it understands, and feature negotiation is complete.
>>  
>> -\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
>> -  drive the device.
>> -
>>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>>    an error from which it can't recover.
>> +
>> +\item[FAILED (128)] Indicates that something went wrong in the guest,
>> +  and it has given up on the device. This could be an internal
>> +  error, or the driver didn't like the device for some reason, or
>> +  even a fatal error during device operation.
>>  \end{description}
>>  
>>  The \field{device status} field starts out as 0, and is reinitialized to 0 by
>> @@ -99,10 +102,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
>>  \begin{description}
>>  \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>>  
>> -\item[24 to 41] Feature bits reserved for extensions to the queue and
>> +\item[24 to 43] Feature bits reserved for extensions to the queue and
>>    feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
>>  
>> -\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
>> +\item[44 to 49, and 128 and above] Feature bits reserved for future extensions.
>>  \end{description}
>>  
>>  \begin{note}
>> @@ -629,6 +632,52 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
>>  
>>  Thus a driver MUST ensure a virtqueue isn't live (by device reset) before removing exposed buffers.
>>  
>> +\section{Device Suspend}\label{sec:General Initialization And Device Operation / Device Suspend}
>> +
>> +If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the device by setting the SUSPEND bit in \field{device status} to 1, and the device SHOULD set the DRIVER_OK bit to 0 once it has been suspended.
>> +
>> +If the device has been suspended, the driver can resume the device running by setting the DRIVER_OK bit in \field{device status} to 1, and the device should set the SUSPEND bit to 0 once it resumes running.
>> +
>> +\drivernormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
>> +
>> +The driver SHOULD NOT set SUSPEND bit if DRIVER_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
>> +
>> +Once the driver sets SUSPEND bit in \field{device status} to 1:
>> +\begin{itemize}
>> +\item The driver MUST verify whether the device has been suspended by re-reading \field{device status}, examining whether the SUSPEND bit is set to 1 and the DRIVER_OK bit is set to 0.
> should driver poll for DEVICE_NEEDS_RESET here? if yes say so.

I think the driver can rely on a config interrupt, the spec says:
The device SHOULD set DEVICE_NEEDS_RESET when it enters an error state that a reset is needed.
If DRIVER_OK is set, after it sets DEVICE_NEEDS_RESET, the device MUST send a device configuration change notification to the driver. 

>
>
>> +\item The driver MUST NOT make any more buffers available to the device.
>> +\item The driver MUST NOT send notifications for any virtqueues.
>> +\item The driver MUST NOT make any changes to Device Configuration Space except for \field{device status} if it is part of the Configuration Space.
>> +\end{itemize}
>> +
>> +\devicenormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
>> +
>> +The device MUST ignore any operations on the SUSPEND bit from the driver if the device has not been completely initialized by the procedures in \ref{sec:General Initialization And Device Operation / Device Initialization}
>> +
>> +The device MUST ignore any write access to its Configuration Space while
>> +suspended, except for \field{device status} if it is part of the Configuration Space.
> I am inclined to relax it to SHOULD, even just so the drivers do not get
> lazy and do not violate their side of the bargain.

sure!

>
>> +
>> +A device MUST NOT send any notifications for any virtqueues,
>> +access any virtqueues, or modify any fields in
>> +its Configuration Space while suspended.
>> +
>> +If changes occur in the Configuration Space during suspended period,
>> +the device MUST NOT send any configuration change notifications.
>> +Instead, the device MUST send the notification when it resumes running.
>> +
>> +When the driver sets SUSPEND, the device MUST either suspend itself or sets DEVICE_NEEDS_RESET if failed to suspend.
> or set
>
>
> pls make it clear: what to set and when.

OK, v2 will say: If the driver sets the SUSPEND bit in \field{device status} to 1, the device MUST either suspend itself or set the DEVICE_NEEDS_RESET bit in \field{device status} to 1 when it fails to suspend.

>
>
>> +
>> +If the device has been suspended and the driver resumes the device running by setting DRIVER_OK to 1, the device MUST either resume normal operation or sets DEVICE_NEEDS_RESET if it fails to resume.
>> +
> pls make it clear: what to set and when.

v2 will say: If the device has been suspended and the driver resumes the device running by setting the DRIVER_OK bit in \field{device status} to 1, the device MUST either resume normal operation or set the DEVICE_NEEDS_RESET bit in \field{device status} to 1 when it fails to resume. Thanks Zhu Lingshan

>
>> +When the driver sets the SUSPEND bit to 1,
>> +the device SHOULD perform the following actions before presenting the SUSPEND bit as 1 and DRIVER_OK bit as 0 in the \field{device status}:
>> +
>> +\begin{itemize}
>> +\item Stop consuming more buffers of any virtqueues.
>> +\item Wait until all buffers that are being processed have been used.
>> +\item Send used buffer notifications to the driver.
>> +\end{itemize}
>> +
>>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>>  
>>  Virtio can use various different buses, thus the standard is split
>> @@ -872,6 +921,11 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
>>  	handling features reserved for future use.
>>  
>> +  \item[VIRTIO_F_SUSPEND(43)] This feature indicates that the driver can
>> +   suspend the device by set the SUSPEND bit to 1.
>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
>> +
>> +
>>  \end{description}
>>  
>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
>> -- 
>> 2.49.0

