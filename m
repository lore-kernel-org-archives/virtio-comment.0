Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673E03236
	for <virtio-comment@lists.linux.dev>; Fri, 19 Jul 2024 08:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721379167; cv=fail; b=pnxaCC5yUYGpXBgfJTGGwNS5wPq0tM9zNLbB0L/lJIK7yHTQv5AL0yxjYwlyUZAC11hF+fMPnmF0UaUwfrgaW9Iiv5/UMaltbQzAH9gzuDWhtA5/5+PDy2VcO+RxwvdNFfDJ6VbYpHDASPAy/VceVgLaFBKScEzqZdugqDZSUr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721379167; c=relaxed/simple;
	bh=yOwsQyZKc7pGYt9jAniAYKpZaL+t0ucmAfD+CaPdalc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fThu9otfcZUhaJ7aEWwd8B5SJsD+8Mb2gfJeKTHG8uiCFOc3S+EPBUdIfsGCVwWivZrCniuvv2FFy6XFQ56MjDy6yk17iCOCkIVRSPnOS489pMUuDBWeNWK6ntkJasTFGPGfHLUGzv000nrwOuMqzOjdqf4pBT3aQVEVRN+21e8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZEjApGmL; arc=fail smtp.client-ip=40.107.223.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZEjApGmL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zM8Acf1no5Vt8ZHWc2JkfzNS2JQUZTuSRt+C6LoLKzU72k4QajQ9sRpKkgcaG9CH+yV7c2M1zVogu+xCKhL7U7N+E+VOxEbX7V9IYKUvVPZNW5JRi9AeytwFr1Zrpco9kSG/Uinbdt8b70mb1C90DRAGTEak6AHCRCXVqhRbK9OgzhZ/27jPJgVFgVcJxro2Acokw9xJvBzUys+fE2QPIzRQfcMJliiotDw5U/YYTXKkvti+JZK715JL04OzvrwP2p8sXqvk/nw/rLMFBB4YsiZT1oh2MLBuebebTMpIdLAzipC12yGATJAmmm6T/z5lUj5vvW4P8Xc5V6zc5ftFzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOwsQyZKc7pGYt9jAniAYKpZaL+t0ucmAfD+CaPdalc=;
 b=rNGaVtCH6HVB3iHADsQ4Vq8tAef0ub2Ayglq79pDyNWmptEeeEI4Sceh/wEXtT8M/nq8ICdhEnh/PwKXs6BY/7WzFpquYdpBc0v5HjLC0l4MNi2istGz656LKop3M2mfnKhMOeuXE+dVwenp56jY4D8q+T0FWwp32lEdS5fk/MDIvObo4KfIAogDx6WFzgytwSc1jKOaXeu+zVzqPmMraUvIFbyy2VlEUO6F1/2rQ6cwN24zuad/rJVF7wKfhtLO4ZCqpqeP4wOmAd3+UOYN8nVBjbDS1PPRP/UB6au+VqYKFelry7ZXEk9GaZpMMSdDw2CnQExfddPvm8HqLx0ceA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOwsQyZKc7pGYt9jAniAYKpZaL+t0ucmAfD+CaPdalc=;
 b=ZEjApGmLFcWm7nbOL3IBz4DYySsInE7Y5XlXEYRcSUmKWn6GGIhC9EO/s7MAjseYfONip3U6C523exDpoK+5vkynmWLVjqqessHCnTKu8JdBYtiUEZkGjmYxCxZYtWThptD9dAHjt/BKWYbUFOhTGbp2RENcyGKGeWFRRotpjs4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by DS0PR12MB8199.namprd12.prod.outlook.com (2603:10b6:8:de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Fri, 19 Jul
 2024 08:52:39 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7784.016; Fri, 19 Jul 2024
 08:52:38 +0000
Message-ID: <3f46c686-31ba-4b80-aa31-0efc395fa35e@amd.com>
Date: Fri, 19 Jul 2024 16:52:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Request voting rights
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev
References: <1f4e0199-ba54-44b1-a060-91acb002bb62@amd.com>
 <aa5e581b-a8a5-4196-b274-79887242734b@amd.com>
 <45f9408e-5e7d-4e20-b20b-2fecd986986f@amd.com> <87ikx1ahx7.fsf@redhat.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <87ikx1ahx7.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:404:e2::16) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|DS0PR12MB8199:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac34249-4474-4f09-509d-08dca7d0247b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmdwK2xTOEtyWE9BWGErbDVpNkVBSVdTL2RHL2kvczlENlFESTh3akRSZk1X?=
 =?utf-8?B?SjI1V1pPdHFITnp2ZHAwMFRLdll6bjFITEUwSG43cnhPMWRnczdkVHRLemtt?=
 =?utf-8?B?WjdoTHhEMkdTTjdZaXZGVzJqZmdyd2NXRjJTVzdVTzIwZlJOTVhhMk1UZU1n?=
 =?utf-8?B?ZFl6eE1PMCtmaW91Wk9vRjd0VVBPOEhoQ1RXOXc5ZldybWJxL25pV2Viakx5?=
 =?utf-8?B?dnphMytRendIdzIxNFZUUWJGa2k2MHN5L0EvQVZLcTI0ejQrZVJJcW1MbFRu?=
 =?utf-8?B?aU5MblZwcEJ4VitFWG1OWGNiS0lpanN0bGdtYVdPSXBOV2ZiZlBZM1FoNC9T?=
 =?utf-8?B?LzJFMDVGZVF4MlFxaU1CNXFBTjB1ZDhIVzlkT0EydDdSR3ZzZGVRME82ZWlj?=
 =?utf-8?B?Wk91WHRVT09TaTVTSEVwRFNvNmg3U1RXY1Zvc3hVSlNBc2VxaHpZQ21YVTR3?=
 =?utf-8?B?YU0wdU43TmJKYTliYUhJUEVrYnFpSUpnNmNmUElnemhQelUycytDSzBxNnlG?=
 =?utf-8?B?UUpQN3lTcmIyOEdheUNjcWtyUmZzemVoRFdKVGw2UHNHeDV3TEpuNStLVDVv?=
 =?utf-8?B?b016S2IwdUdqcVprSldQb0pOalRDcFNMWHYrcWVKYkxVQ0NCZ2cwaG5RT0NW?=
 =?utf-8?B?QU1ZVlN2RTFtYjZkTkJSbXJpV2M2K1FUNmZ4NTB6ZERNM3FVMlZHenpSZDdo?=
 =?utf-8?B?ZDVxbWRER2Vwd01hQk9oWnh1YXl0WEM3Z1UxWDdQd3NYWXZsVlVBNFZYZXVM?=
 =?utf-8?B?SXhaanFpSm00N1RGQTd4T2N5NGs3bUU2ZlhBemRsUzl4QmsxYmx2RjNNemNW?=
 =?utf-8?B?UzZGQjlYaVpkS25hYVQzTmhSa2dHazhNa2R5U0NsNFNzWTVHZ0pUaG5vbUNh?=
 =?utf-8?B?VHV6MExNdStkUE4vSHNrYTJTanJtVVFmeVRRUUdkR2NTOXdRODV3VnBjM3A5?=
 =?utf-8?B?VDRXRGNLZ3BDV2NQemF5Qlc3SmZZSFhDdXdvb3gwQXY2TGpBQmtDY0NFSU9G?=
 =?utf-8?B?TkFVU0MxOWFyTWJNNEpIeWoyaXFqeThEMmxqN01yTUY0NkhHVjh0clZsRXlE?=
 =?utf-8?B?L2x6YnpQS29Xa3BCY3c3VHd4cHhoL01PMHB0RkZHTWNJblhpalhFM3JXLytD?=
 =?utf-8?B?VXZoY0hxU2VhQm9WVnB0ZC9TZE9tWVhsbHVPVjRtL2NmNkxvOEFPa1VSd1ZB?=
 =?utf-8?B?U2xGL3AyUUl3cUVwak41bFhNay9ENFFFSEJqbXVaRXdvNFFtUy95a2xzUEhu?=
 =?utf-8?B?RVppdHRLazJVbmYvUnVOUDNqK3czVU5EQ0RzcUNlMUNxQlhkMVVlZ0R6UWty?=
 =?utf-8?B?SFh5WUhacHhyNldZbkpJMWM0RnMxdFFqckZZN2k3eWFITkFSNHExTVEwTktx?=
 =?utf-8?B?UW8zV0pra281VEN3Z09wUGM2dnJ6TGRiVlFxMUdmcFBQNTRZQ09UdTRJUGcr?=
 =?utf-8?B?T1M1TnpxUjcrTDl6eXBIU1FISC95TWw0VkpCZklSL3RZMmZoWWpDUmNpREVy?=
 =?utf-8?B?S0JoQlpXUEJIU3JVR3c4SUxyYnFLdzR1YmptWmRZWXVqelRWVHpwWmpyQlh3?=
 =?utf-8?B?MTg2UVFxVU9iZS9uMzBEZUZkTjZSMER1bUJnQTJSc1ltMVpzb2lkekpheTZr?=
 =?utf-8?B?YjhJVFY3Q1dnd2ZKYW94OXBRSXRjbVJXNzVOTVFFNHgySEhvb25ad24vYmNu?=
 =?utf-8?B?ZXREQVFHc01lUEdNY0FGWEJXaWtNMjRQTVpqUjVZY1lucFk3STdTWVNBTi9S?=
 =?utf-8?B?bkFJa2o5cWwva09YeXFtcmgxNEZyTkllSURuV0dEMVBJUGZTazh0Qndzb2V0?=
 =?utf-8?B?a0RsenFNUGFISFF3Zmh1UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDZvUE9nb2RFZ3NBUXlFemFHNU1TRndKbS9vTW51V0hwVW9XaGVTQTk1bEpu?=
 =?utf-8?B?WDNOM1lFTS96Uk1XV3RWMzhqamVzcU9nTnUzN0gyTm1yTEFvZVFtL2FIaU83?=
 =?utf-8?B?anY3OHc0cEI5RjBJUUdtMHVyUHlOaGFtYThHWWt1ZmhTZ2E2bzZCejVRNXFD?=
 =?utf-8?B?QW81Nzc4bHE5ekIxb2l4dVByT0NiaWQwdndpRlZnc3lsYnBQSEtFMFpIbWh5?=
 =?utf-8?B?ZGU3QzcxNnFOUFlIcnBDWENLNEFhakNzak54WWdWbWlxMUMxZEhFZG5JZnhX?=
 =?utf-8?B?VHpNRGgwbElxWG5jL2N5TEVQZzBCMVhSNHZRYjRySWtuU3RURmkxMk54TStS?=
 =?utf-8?B?RFJVZVFnNVRwVi9CUmFQckhmNzgwVk1UUk9OTnBPTjM4dGlSdnZ6VXpkbmc1?=
 =?utf-8?B?YWR5Q0oycXNBM1NJb0tMeGxkWmFBcTdtTGxtMjRTSi8rdkNOZHc4dDBqOEdl?=
 =?utf-8?B?T2RhMWM5LyttY2RmRlAxTnZ2Y1R6eUwyMEU1SFN0WVlKUVkvWTJ2MHVPbzVM?=
 =?utf-8?B?SFJVcytaMEZqM25JUzZpZU1jODg2WGYyc3JiSHFFYS81Ri9GdlpZbHh4RTQ1?=
 =?utf-8?B?WnlUMHNmdkVnMTB0bjdWdmRsQjZsYWZ4N2RXR0w5ZktIS1VhcDljTVVNUmVH?=
 =?utf-8?B?WmRBV1RMcCtQelpkSFcreE83bmgvSytraExKakdPcEdUbTdWZVZscUNYTzdR?=
 =?utf-8?B?WUVvOTloN1I0bFhzZ0o3VENRS0JhOWNLTVE5RGRTNDhVQ0JHS3BidnliZU85?=
 =?utf-8?B?NmxYOUtoT09YM0dFeUpiVDZhRzkvUXJrTS9OYlJFZEtmK01PdjhZZk95T0t1?=
 =?utf-8?B?U21VckNRamtSbEwxSDg0b2NZN3dHT0I4aklpazBBU3BuczFOUDNxV1ZwdUVx?=
 =?utf-8?B?NHY0SkkxQTAycWpHQVZGTDJnZjkvMXRrSjliempFOUZFSFd5TkhHSzM3ckJk?=
 =?utf-8?B?OGVpcVhLZkp2Vk0vQnVZMXNjNGJuYmRUR0MwMnJaU09LbStRNXFDTzFhbW1L?=
 =?utf-8?B?ajVwdnRjbDQ5amdIdFFqRDJMT1l6aTdwRHNNS1lWVnlENWNiTGc4Vk9rcTZV?=
 =?utf-8?B?NjBaTWRoNVQzZHZjenh5ajBsYTF3VmFVTjdiV05NQXVlN0ZicStLUGRXaWdq?=
 =?utf-8?B?SjdKR1BxakF1SXAzR21NKzMzSGIzLysyaWUyRWhDU3AxOHlqd2RQUGJwR21y?=
 =?utf-8?B?M0JHZnJoUk1XaE90cVNyMy80MUpIK0ZIQWtGaWsyWkJoRWlJTThzVjUxc0lI?=
 =?utf-8?B?RWN5YzlFSmc3R1RiTDhqeWpJZERWMFFyOGJ6aWtVSkFqWFFQS3pHUjVGcEF3?=
 =?utf-8?B?YUY3ekpITk9seHdpWWN2UUlEWHNIMnRkeXBrSjdvTVlCNVBLcnhWUnYvWkU4?=
 =?utf-8?B?ekFlTWFjajZpMVFqVytoVnZlUzNWclZUbmgzVkpyTUxUVjBYRjhYZ2VGNVVt?=
 =?utf-8?B?aDRhenRkeHNLUFljd0RQK0phNDZLQWdOSEpQbFFZSEhmSTUraHVKcDIrV2ht?=
 =?utf-8?B?MTJvajRRU1hqQnBkNVFIVTZxbkkvUm5DUkt1Q2JYUVExM0NEbXpneVdQaVpE?=
 =?utf-8?B?bGwxVEtyVkJRSUwwTWpZbW90T3RCeDUzRW4xaHBUWC9rbVJ2WDh2VFdQSFBp?=
 =?utf-8?B?UUdqSjgwTSthaHhtd0ttQmxkYy9LT25MZ0FuZHNpeHNSOTJiYzUySldqQlZB?=
 =?utf-8?B?YXB6c2crczYrcHJzb0pqT2tGSE9ET3Nhbm9mV2svdjhtMWRpWnZ2WVZUK2lo?=
 =?utf-8?B?UWo2b2NlQzFqWjBWOVNwQXNzanVqdHlqRkc3eDY5bUM2VWNkbUJwOWFaTDZq?=
 =?utf-8?B?MjJFWmIwRkI0WWVyZjNBVmE4NmJiMVlNNEpHNzRrQ0VvQnZkSFpTdzhTNHRN?=
 =?utf-8?B?V0h5bUpCM0d0ak5oQ1B1ZXJhQmo4NHZTZU1OcEJQRVlwdjJCNWsxYkg5MUcw?=
 =?utf-8?B?U3FLRUNwSy8rUDJIS0pDUDlMSXpHaUc3aDlQR1d3RzdBWjNmQnFRM2R0RTZr?=
 =?utf-8?B?OFVEelRWeUFpSnFmeWJUWVppSWpHY2RDbnk0UUkxVHl6MVQ4Z0lGK285cjM2?=
 =?utf-8?B?ZHlrWm5DaVU3K1gwM1V2WmpvNm5ZSDQrOU9oL1lVc0VoWkg3Q0xSbHh1ei9k?=
 =?utf-8?Q?/8uxJGYTIG+6aoUGuWyYhh5b7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac34249-4474-4f09-509d-08dca7d0247b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 08:52:38.9133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t8Ra0yXp370e5iII9seTpHqub3175CyQmEf7Zi47IGzj0yLa+8d81Ld9fcBalzQEs/Oe5WmrqdxFE6XdkPNCLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8199

On 7/19/2024 4:45 PM, Cornelia Huck wrote:
> On Fri, Jul 19 2024, Zhu Lingshan <lingshan.zhu@amd.com> wrote:
>
>> Gentle Ping Chairs.
>>
>> On 6/28/2024 5:28 PM, Zhu Lingshan wrote:
>>> Hello Chairs
>>>
>>> Gentle Ping
>>>
>>> On 6/7/2024 9:48 AM, Zhu Lingshan wrote:
>>>> Hello Chairs
>>>>
>>>> This is Lingshan who re-joined virtio TC last month.
>>>> Prior to AMD, I was a voting member on behalf of Intel (lingshan.zhu@intel.com) for two years.
>>>> I humbly request to be a voting member, please kindly help grant voting rights for me.
>>>>
>>>> Thanks
>>>> Zhu Lingshan
>>>>
> Looking at the roster, you should have voting rights.
Great! Thanks Cornelia!!!
>

