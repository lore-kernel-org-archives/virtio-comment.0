Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4CA1411C0
	for <virtio-comment@lists.linux.dev>; Thu, 13 Jun 2024 09:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718272766; cv=fail; b=lVgg1RakH+tZTFG15bQB/XyBEHFFhatM+Q4tStoGNFCLwpmz7reB6te4T+tCB6rhLjbYzSaFfHVX91LGiplE385cljv/YZVI7IysDH94XGKolPlH9aa7E7RwYjeDrC3QpdIIeKPaQetZIS9cd4DneZwO9GhcQz+cyR1iJhibiDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718272766; c=relaxed/simple;
	bh=pZYpErsVs2fqRlj3NP1Mr75+7bJPhgtZmI4Ml+Ejk0U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E7OpkKDo1RX9AKkAqeVI5g6mbVwrWlNKp1LZF3KpHWe6w8HorlfnI1yNKk1J981OvL4cd3BzVEmAyi8S4ZMTgP9GUc2kGWNSXj6Zaj0edTwlpgS70S9/G0lH0ZB2rv490ClIgFBKUZo3qPqEHl259Qhntr+J0zEFC67RXbh+moM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3+1BDjpo; arc=fail smtp.client-ip=40.107.236.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3+1BDjpo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrEwnNSl3PBS9h93B+aaiCd53nfHCtEdqbSNNsWRRc+rV/40UOWbZj5A/+00r/gmqgsSK14R7AvqBWrLqUkZzHraXFBUCMHWK5FirZZzxGcTQ+RyXa17ucunzzvULQMcMe4+FboYdHrHY5FKpJFq9qGOrVBPUQEzAE5w1j5IInz1uclYnowFiUlsb0KgE7BVaWDGndsCFFOynyEGXvrhIV1m0ioug/pDTf3RLUsjteT+mDdWBtsQo2YmAwa1dJVGr1qQILa8wF5jWlgAbNgq27vfGiaCKKadHUHstNLT1LyHlBnPwCFpW3IoVd65vFkzHJkG1hu2zZ78xGcR3+jtGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZYpErsVs2fqRlj3NP1Mr75+7bJPhgtZmI4Ml+Ejk0U=;
 b=VrfZ09Z+pzBp+bKg2jrc74TU3QlsXG4CTr0efkSMdC0MFOiQc/jLHpjL9oGXZLN/69HCosJzb8RQojYtFq8xNOYirBfcdKHbsbf9vffV3snSOwbnV7Zv13ElpoXOGkcjLNIT9sn6z4r+/4WSXkutyJ8m5P002yMqoG9lfHFqnaAyFzl7L0crvNihiNltWnA+xvd9XhO5EQOpqbZUZY79WxHIyMXyFEfvSl8AurDMJqWXY7GVUASv2j/WDyDQHcwfQL+SCGNr1AiSWpvW18f5vKufQQvk6IQR7XjhFm3zwUTocHvi2f8akerj3X+Pyfr/qSkGmmD1YO9IE1M33a+VoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZYpErsVs2fqRlj3NP1Mr75+7bJPhgtZmI4Ml+Ejk0U=;
 b=3+1BDjpoLhL+S6PvI5sCm8ZFQpjB0AjAngMN9qKGE8E3dFnOP20IxubCx3BTKatytVR9g524B1Y6NQb/vfskwJvHXbVPB4guDQVzWmLxu8AxLinHHx+d6lL2bLMXHPYxQFwiCOlQWNKYoHnOyS7lqsybTvnPcteOKA6yOkhocpk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by DM4PR12MB7597.namprd12.prod.outlook.com (2603:10b6:8:10b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Thu, 13 Jun
 2024 09:59:21 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%3]) with mapi id 15.20.7633.037; Thu, 13 Jun 2024
 09:59:21 +0000
Message-ID: <40c1d6fb-c04e-41b4-a4d3-baf36aba7d15@amd.com>
Date: Thu, 13 Jun 2024 17:59:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] virtio: introduce SUSPEND bit in device status
To: David Stevens <stevensd@chromium.org>, "Michael S. Tsirkin"
 <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
References: <3319f7da-5c1f-48ff-916d-03791edf1783@amd.com>
 <PH0PR12MB548190E2CCAED2E01410F79ADCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2657c74f-1caa-4e5e-b767-b16e059247ae@amd.com>
 <PH0PR12MB548198E64803B0A7D9389E9FDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2f9636c7-06ca-49ec-ac86-f8a2f1f97b4f@amd.com>
 <PH0PR12MB54813032E8F5B0DA32BA1B23DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e25f93cd-baa3-4a54-bf9c-1fc27fa95c41@amd.com>
 <PH0PR12MB54818F69437BBA6D533ABAF6DCC02@PH0PR12MB5481.namprd12.prod.outlook.com>
 <395ddde1-f8e9-4b6e-bf90-2f9c42406366@amd.com>
 <DM8PR12MB54804F81E1673C09213A4302DCC02@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20240612081135-mutt-send-email-mst@kernel.org>
 <CAD=HUj5oeJa3Przmsd+MYDO0AAEhs-4sDvFQoiMhVTjnveNONw@mail.gmail.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <CAD=HUj5oeJa3Przmsd+MYDO0AAEhs-4sDvFQoiMhVTjnveNONw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::15) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|DM4PR12MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 19fd7a77-04a5-490d-0508-08dc8b8f7f3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFdRSkVYVmorMWJHeGJjM3Z0Q3hGZExVMzlvUnhXazcyOFNSL2NjYVBKWjl6?=
 =?utf-8?B?WG1GenpUTXNwUXhiYWgwR2pWNjFnM095eVJIZmNGUURpKzhFemdOT01NdkhY?=
 =?utf-8?B?bjlPd0FTTjJGSmp3U2NDRGxxUkRRUzNvRUdxMzRQL0JmVFovVEV3QTVWNy9n?=
 =?utf-8?B?RjRKR3QvMXdEVlh2b0tuT3draFNZb3hqa0JRd1kva3Z6VXFuYjRva3ZtSWJM?=
 =?utf-8?B?SDJibm95NXhJN2h0T1dFWUVFSnp6clVMSDNFMC82OVpJcWNUd2E3TUxrc3Q3?=
 =?utf-8?B?Q2tSdHVLTG9udDNOb2RUaFJHTzQ4MFRNNGVVUTJqdXVXL2VjSkpKRW1INVZa?=
 =?utf-8?B?djRFQUlQdDNiTXkzQ3JseDhqakVIV3FkNGlWQjVlWmVKRy8yL1czRHNFTjZv?=
 =?utf-8?B?WHJKVTZPdE9KdHV2YTdVSm84dU1aVU5NTTc1YkF0V1ZwcTRKK3BxeiszdU9r?=
 =?utf-8?B?MHFBYllrV1QrWnJZZGVLeStiNUE1MG5XRDRlQWtmcmpMZjJ4VHlyVm5FcnB6?=
 =?utf-8?B?bjJVRkF6RHdNQzVaV0MzU0M4bjAyenJDdDV2dW44V1ZIM1ROeENMY0JRc2Y4?=
 =?utf-8?B?YmYzcXlhaGJneUVSbjRZVVUySy9KLzZ4cks3djU1UEJpQWJUdE9ydDRWbkVP?=
 =?utf-8?B?UmZuK1VyM2lucUkycGdDQklxbnNDc2RmTEgyVGpaZ2hNR3JFM2M4WGt4QVF3?=
 =?utf-8?B?STlzdVc3MzIwUXBwTWd3TkZMWkxDN0RJRU5iNDVoQWlYWGYraUZmMG9Mamor?=
 =?utf-8?B?c1hXaWhBVXR5TDJkeGE1cG5GZVM3WjFReEZMVkdZUmpLY1lUOElsWDdUbTRX?=
 =?utf-8?B?WWxQbVFjQzNIZG9ZNkhSK1paeUxDUXg2N1dDT1B3S0lobGlnT2F5Z3dyYTFI?=
 =?utf-8?B?TkNUMjdPZXIwb1VOSi8yOUttUmZOZ1l1b1VWTVVWcTRzUkxmNWJHRUpIYWg1?=
 =?utf-8?B?NVRFUC9Gd2RTYXFEMkZNYmJaTnBqSHNwOEdtZXNQTUNZUS9CU2p5Z0xoV1No?=
 =?utf-8?B?ZGNiNVE4dDhMVHlIL1ZFSjRQdEM3cVVXTUQ3YjlYL0tsenlzMFpjK3JJR01j?=
 =?utf-8?B?eUZMejVSVmlqdlduSCtwdWIxZHNFczdZcGhkdW9ZRHhrWXRhOXd3OGZldWY1?=
 =?utf-8?B?Zk42OEVXTExKaGlXVjY3bElrSHlkbE9JSDVVeUhZYmRiVzYwU3V3SWVtWTIv?=
 =?utf-8?B?L29KeE5icG9aVnkyNWFWemxZT0Z0cnovdVh0VkJ2dWhkYWMxRTNTN25hcWxr?=
 =?utf-8?B?OVZtT2xBeElhSDI4d243b05hR3lFbTllWTBtSCtPV0l6UE9PbjJxOHNuSWdX?=
 =?utf-8?B?V0xmVDRjSGVkSGgxdTVJMGx5Vk4yaU5TK2RXWnBZS3pwTFhBdU0yQTZhbWlK?=
 =?utf-8?B?MnREUUswQTliWm9ITkFybDZMUXRVekxldXF5RzhjRnAyZnpKakV5UGRrL2dO?=
 =?utf-8?B?bVkwOWtjZmF4STZjWk5ZbGhPYXN0QUxVY3NxQW5Vb0prci9QVytuM01YN2lo?=
 =?utf-8?B?ejFpZi9WQW1aSzRtNG45enpBWXUzbHdIei8zR1pwU3l5QytYM2FiWVBsY1ZT?=
 =?utf-8?B?QjdvSHA0ckZFQU9GT3k2ZDd4V3g4dWllNEtxUTRXa3MzVzNxaC9KL09jeHpv?=
 =?utf-8?B?VU9ZY3RiUGRxT05qWnJQVHovSklYNU5oc1FHSnJQby9MOW95QWoyazYzOFcv?=
 =?utf-8?B?SzFNNUtKNno5RlNKMHBwYlZvS3BWT3BvanFTRzV5enRPMEJQRHVFbHlDeENm?=
 =?utf-8?Q?3dmaX0jqWTKqMefxx+cM4Tc7mDGuCZRzYQ9mhDD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230034)(376008)(1800799018)(366010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2JSeTJ0T2k1SUNhbHFYTjRLcm8wdTdtMG9iUXpvK3F0dUtQbmM1b0QrOVJ6?=
 =?utf-8?B?SmN3NC9sSzNNVWoxVDRJcEJtL3FMUlZiRmozUE90a3FTRUdVUGFPNS9mWmU1?=
 =?utf-8?B?V3p2WENKOTU0REZVa1pDRWd5Q1ZQSkN4enF1ZFJWZEcwa1laU0VCSXJkK1RM?=
 =?utf-8?B?dERuWG9ENk81S2xhc0U0UnF0ek1lbUszb3Y1cW92NXN4QkNFTkZGSVYrcW0r?=
 =?utf-8?B?U1BXU3dLT2Mwd2dLcWFVRXUwaTNqbmVuRVJSRTExWHBNZWlxQTBEY0I1WEdG?=
 =?utf-8?B?NDg4cFIyb0dVUHhJRmY0KzEra25aOHpLK3phM082K2ZpMlVjaC9PZXM5QWE3?=
 =?utf-8?B?WHl4YUtTa2Rkc2xXU3lmOW5aNFpJME5NK0NBK1B2M21VanlEQTdWZkN6OUpw?=
 =?utf-8?B?UEdXZHdjNWhzN3M4cjlyQTE0UkR2OGNXWEhoelpiUnhLNFZNRlZCaUdLdkNz?=
 =?utf-8?B?TFRXUTBWOWhHNjJadVNaZ29Tb0tIS2ZVSkpyemxrai9aN01NOHVLcFZnc2pH?=
 =?utf-8?B?SWVOUTJMSjFrS2djSkdTd09DbTRDYWZybk51NnZ6RVNhTlBFQ2VoZlc3c0oy?=
 =?utf-8?B?dTZ5TG5HSVFZMGRYOU5jMUg5cldoVVlpaDh4YmlRd1RXZ1pFRlNOb2paeFNI?=
 =?utf-8?B?KytQZk1qUEJUL1BtTHY5MFZIazNvNVdCUk5yS29ET0RSWThQMmliakM4Sm1q?=
 =?utf-8?B?QnNwZWVQRUl2WDNFS0JadE9LNTIrZTVRQjllTXB3T0FqVHpwV0ZIZlJEa0cz?=
 =?utf-8?B?T05tczBST0dwUit1TmwrRFUwa05PRGlYaEsrYzdzNkV2WFZQK1NzUkdDMnRM?=
 =?utf-8?B?NDVEYjI5dmVRNnJoMW51TXJMYXE1Zm1ldDA1L2ROcWd4RnJ1ZDUrYVM2N2M5?=
 =?utf-8?B?ejVBZFV0N3I3UUtrRm5XTVFsV2NNQ1E4Y2oraE04TWdidnhJb0FJdURMTmdZ?=
 =?utf-8?B?dEhhWkZzcGo2dERDQUVSV1lZdi82WHV6bThLRlV6V0x6RkRtekpldW9wZVA0?=
 =?utf-8?B?RmhEWUFub3JjcCt6NEhPVVBmZ2piUmJ4NEl5OXF3b1BXQVQzcW9tNE1GNldB?=
 =?utf-8?B?WkdLMTNHWmpaV3hDaWsvWVBvdkFYZUk5OW05Q2VtVDViRVF3WmVWY2t3dE15?=
 =?utf-8?B?QzhCV2EvWmF1SnpzWnB3UWg2M043MnY3U3orY1lkRUlBTG1xYjBXcTViVWNa?=
 =?utf-8?B?aXhCbXJuM3JESDd4T1RsUE4yb1VEbTVJZVFicHFmN1I0Qlc1dHcxUFJRaGVw?=
 =?utf-8?B?MW1HblhhK2s2U2E3M3V2b2hvVWt2OGpHbWZ6UlptdHRYRDc2UmpUTkR1amta?=
 =?utf-8?B?Y3FKWnZxSjRpZ0sxR0MwYkRIWVQyWCtUUXJyU1BOczlQdjBEWWEyb0lPL1d1?=
 =?utf-8?B?RXdBaWljRER3YUxaZ2JXUGVienJxVjg2a0l1Yml0Q2NQVzRKNDdyazhUVVoy?=
 =?utf-8?B?bTQvem90b0pXU1BTNzRKNGo0UDhrUk1JdzkrbW1lVjdWalBWUFZPNzgyWG9p?=
 =?utf-8?B?RE9IK045a3A5OVNrUUtpZzREQWpvUW9XQWRTZ3NtVWt0cElyNVB3N2VGT285?=
 =?utf-8?B?akNkZng2ZjU2Q0h4SXJyeU1EUDhzTyt5c3F4aDlKb1duTk56eUlwQ29TZDdV?=
 =?utf-8?B?SVhYak14c1hGRFpiaVdYVzB4MUpNeTZwK1BYWHQ5U29Mc2JVUlVtYzhzRDZy?=
 =?utf-8?B?VEhhL3B2cmU0bzVCZkVEamJKamhjU0M1MUhpdmlBSEdZSmVXZ0o5S3hNSlhU?=
 =?utf-8?B?QTBrdnFseVBQM3BYT2JSMnZRWmhNc0RGVlNtckF1RlQwUnh2TnB3cDFodUQw?=
 =?utf-8?B?Z3R0VCtBazg3UTZ0amxLblRzWk9RUVR6b05iaEZXN3dPeU11U2J0NTZ4ZnNz?=
 =?utf-8?B?ellWY3F2djlEVGdqRzdCeTdsQlVFWFp3d0JMMnd5MS9JUXhOV29BNDRyQzNG?=
 =?utf-8?B?bkN0cEcwNGU4U1ZCUURYSW9jSnMzUThnMnR1SXJuU2xKWFZmWkZTMUFhWW1I?=
 =?utf-8?B?VDlsTjl0YmRKTWt2czdjNDh2eXd0bVNQei9tZmpsQzVhNFpOOVp5US84VCt0?=
 =?utf-8?B?ZitYSTFQNzFiYklnUXkwNlVwdkE2SitnOEkxSzZ0Q3V0YkR1MmZqb2JNVWIz?=
 =?utf-8?Q?WgIq3NBVZGp71RRXWol9I9GcJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19fd7a77-04a5-490d-0508-08dc8b8f7f3c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 09:59:21.3524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBC5ElV+R8olVDZ0p1LTddv4+gCC+Idu48Sv7awXa8Yca059/83l/lXDeWicMi2dQyjMRsZPxnwRTWcEAv4F4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7597



On 6/13/2024 1:58 PM, David Stevens wrote:
> On Wed, Jun 12, 2024 at 9:20 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>> On Wed, Jun 12, 2024 at 11:26:39AM +0000, Parav Pandit wrote:
>>> No locks are needed. Hypervisor is accessing the admin vq on the PF.
>> I'm not even going to try and get through a jumble of this thread
>> heavily corrupted by outlook and whatnot, but from the glimpses I got
>> this discussion looks like just two people talking past each other.
>> Lingshan, Parav's not the only one bothered by how the device seemingly
>> has to block a transaction until it completes suspend. Parav, I feel how
>> to address this is up to the author to resolve really, leave it at that.
> IIUC, Prava's concern here is that with the current proposal, the
> device's state can't be determined unambiguously by reading the device
> status field. If the SUSPEND bit is 0, it's ambiguous as to whether
> the device is running normally or if it's in the process of
> suspending, and there is a corresponding issue for suspended vs
> resuming. The device and driver can know based on their internal
> information what state the device is in. However, some hypothetical
> admin tool in guest userspace wouldn't be able to tell simply by
> reading the values in the PCI BAR.
>
> Assuming that's actually a problem that we want to solve, then I think
> the most straightforward way to address this would be to use another
> bit in the status field as a SUSPEND_TRANSITION bit, with something
> like:
>
> "After the driver writes or clears the SUSPEND bit, the device MUST
> present the SUSPEND_TRANSITION bit until it completes the requested
> suspend or resume transition. If the device is unable to successfully
> complete the transition, it MUST present DEVICE_NEEDS_RESET."
>
> Doing that would give distinct values for each of the
> running/suspending/suspended/resuming states. That said, although the
> device status field doesn't have a defined width, both the PCI and
> channel transports assume that it's a single byte, so we'd be using
> the last remaining bits those transports have available.
Current spec does not handle status transitions well, not only for SUSPEND and resuming.
other status transitions may also take longer time than expect depends on how
the device is implemented, it can be sluggish if implemented by SW during high traffic,
even when handling FEATURES_OK or present NEEDS_RESET.

This patch wants to copy the mechanism of handling FEATURES_OK, but if we want to
resolve the problem of device status transition, I agree to add a new status bit: TRANSITION.

The device should present TRANSITION until it complete the requested status transition.
Combining the knowledge of the device, the driver can tell the exact device status.

Any thoughts?

Thanks
Zhu Lingshan
>
> -David

