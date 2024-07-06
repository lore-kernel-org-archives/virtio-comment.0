Received: from refb01.tmes.trendmicro.eu (refb01.tmes.trendmicro.eu [18.185.115.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC01E36B0D
	for <virtio-comment@lists.linux.dev>; Sat,  6 Jul 2024 07:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720252354; cv=fail; b=fCfxaVCGeDNy5HFCndjoXby76PhhCpzSGGaSv011wVntyLKtgw/vGShW6lc2dWIvh1va2O1rPIj5KxHYIN7QmcMgpFrUnJr7fcV5ad4G64Bk6L/U02nFLXSKFEG5oYFX9/JIUFo52aGPoGHSteL/mK8sJQae6daUs+pAtz0uQPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720252354; c=relaxed/simple;
	bh=EPdk9qCr9gGnwOXXV0/kcacFBl97x+fKOek6urrFNSI=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CPgJrzvDS4P/S9VMuW6AQZLOK2gFU0GQKIc8BcdsgtDNh7jFyu7X3Q8TQTL1pzISPVuFcgWvYVPwvDzXCq0ZJljjOQzj2I8NtBGKlEgbzik2ldEbl6XCp0+U4CSQfy3tWgHlI184LQGjsvd6lM8SpF3m9hZffetpzCZSF55PHt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=R3+qqnYq; arc=fail smtp.client-ip=18.185.115.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="R3+qqnYq"
Received: from 40.93.78.49_.trendmicro.com (unknown [172.21.10.134])
	by refb01.tmes.trendmicro.eu (Postfix) with ESMTPS id 8C6AD100556D0
	for <virtio-comment@lists.linux.dev>; Sat,  6 Jul 2024 07:52:30 +0000 (UTC)
Received: from 40.93.78.49_.trendmicro.com (unknown [172.21.177.236])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 792071000049D;
	Sat,  6 Jul 2024 07:52:23 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1720252343.189000
X-TM-MAIL-UUID: 0cbe4c86-10ac-4339-82c1-16e0a1eb814d
Received: from FR4P281CU032.outbound.protection.outlook.com (unknown [40.93.78.49])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 2E5991000030B;
	Sat,  6 Jul 2024 07:52:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=doAuaU1hFM1M3PiLwdaoj/oO8jg3MzPC0/YEaFHjryJ0xaOodWlwgm8sMuPmml4ooz2vJ15gmDZYyd3EDLWQ5H1dK7DVzMwe9zH3/+92rgTsWUA97XTNYzrldNX6PkKkWryCqGuwEfjvxf0TvnACvrdoyr1ynLYkQhzAK87kyw3cDdkHBk+Gwa8V77p0iOJI4h7AXia5sQeKHWEOY7WVm9TpM1j5cvYOiKywz7okbapuLGvJcQ/55R+jRzWPLdH4hqjHsHxUKiVkOkGmr9beEQhDc6ehvF2JzG3wkswZi3pSNBkcOmtp7VEvGWf42DJlMO8TA9IQlHF1cGJmNkXf7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfoNLz0xNHJCg+Rf97ECTXuNu9NCsMSNnZ8EfwGbDos=;
 b=SvjNAcOW8RVJQMWn4Ifr33RtMbeB/2b+Jy7xYuDxjeVNP+sGWBM7pMtXJzQddYlz7SF1OVcR1OBbpbYvakCgNqnFMd32pPMnyMwkSaJGKI+4VFVi2dW9GqBBYkSjtxu9TisxhVSV4QOHsHz28v1R/En4KvXZY7CH/ikyN/dRhLsbO47g3l3k/up45YUF49Ed31X2vgYwDC3nfiDGPOsGkb8iVVa4hJP8eRBuO5tuxeBHESIHMfvOHaWVrTjdO2BLToff5+1Uwjp8k0WfOxxBEw2KaTxiZGwEcoWTx/pBdcDw9AKL3C/Z2PxQYJ9BLo2sElFaOvB05Mr9/kKmvmTv/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <20483787-62df-4ca6-868f-71b4d4898323@opensynergy.com>
Date: Sat, 6 Jul 2024 09:52:20 +0200
From: Peter Hilber <peter.hilber@opensynergy.com>
Subject: Re: [RFC PATCH v4 5/5] virtio-rtc: Indicate leap seconds and clock
 performance
To: David Woodhouse <dwmw2@infradead.org>, virtio-comment@lists.linux.dev
Cc: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
 Jason Wang <jasowang@redhat.com>, "Ridoux, Julien" <ridouxj@amazon.com>,
 "Luu, Ryan" <rluu@amazon.com>, "Chashper, David" <chashper@amazon.com>
References: <20240522170003.52565-1-peter.hilber@opensynergy.com>
 <20240522170003.52565-6-peter.hilber@opensynergy.com>
 <3935e6c2b4b73968d0c4728a3c1f429f121609e7.camel@infradead.org>
 <668b681a-8025-49eb-a75a-7dac4fff8b56@opensynergy.com>
 <41c09f2bd37bd476ce9e1582cfca1d2ba16a1a59.camel@infradead.org>
Content-Language: en-US
In-Reply-To: <41c09f2bd37bd476ce9e1582cfca1d2ba16a1a59.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::14) To FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:34::8)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR3P281MB1917:EE_|FR3P281MB2031:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e68c641-cd77-44be-0bc2-08dc9d909196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnJJeldueG00WWtFN0g3NEg2eFlCR0FzeWgycmxEVnhmdVo1VkdsTHlhT3dB?=
 =?utf-8?B?blgxRVZwR2tYLzVWNnUwVVRmeUJTTDlPY3FnQS9EZkx1ZHFjV1ZGWTZkenNP?=
 =?utf-8?B?UUQ2bkl3aTVZeVlMVS9jYjlwSjFzWVhPdHRDYmZIQXRNS0p2NW94N2ZXclhn?=
 =?utf-8?B?YkU5ejB6QnJTdHBiOElNNjhJOHBoUDRDajNVSkJ3ZnF2L0cvU2ozMnErOHZ0?=
 =?utf-8?B?T2hmTUdLS0JWMjJLaXJpdG43ZURocHNTZkhTMzhZWEJkYUVhWjNBMjVVbDlW?=
 =?utf-8?B?K0dHZExaQU5scHVkMXNVSGduUnFOb0d6eHNsVGgvcEtKbVVGaWN1S0FDeUFK?=
 =?utf-8?B?OFBHYmpTMmo5SFhSdk9nSFU3Vk0zTTY3aE5nRUZlaEpEWXYwZlMwdEEzRk5h?=
 =?utf-8?B?Rml3eTJEWTczSGRrakxPNkdDQkVSNE1vQnppUVRNcWpEMms4bUd3ZWtmK0M4?=
 =?utf-8?B?Mk5XaXdRUzJDMkkzZXJwTExxSDBOM1I3RzRVbFNtWUJwSXp1Ylp5UzE0UlpS?=
 =?utf-8?B?cTBuZUZsdHFYb1hQcHA3MjV1ajNRTzVRV2JpZlVScXZFNDc3N1VzYnFORDUx?=
 =?utf-8?B?UklmVkVTbmNrV3I1NjdvOWZrNlJJdXE1VzBsdlArRFA4UVpLbmNEVGVSVkox?=
 =?utf-8?B?ek1jWTFRaVhRYUFlaDVxK3FOdnlMMGc2MnBWM2t5TGFRcDE0Wk53Z2hOUkVK?=
 =?utf-8?B?SmVQem9Ha2ttWkZ2L2pKMmQrbmN5K2VJWFdOM2R0NTBtVlBGREpTc0pJazFj?=
 =?utf-8?B?MlpCTlFNbmdpTmV6SHYrdjJ5OEFaVzlwVVRZNG9RVXFNS0RZTFBVVHBDS0kz?=
 =?utf-8?B?WHpOM3BVMzRnYnJGU0lPcys2WFZ2MmV3UDhSZW8wb2xDTytJc1BGRzJwaXE4?=
 =?utf-8?B?anpNZjN6YTc4SVNIRU5mL0VIZUJTUHl6Q0pKUGRyWDl0MGg4TzdjN0FZS2hM?=
 =?utf-8?B?dGFpM3J3bmgrQ3lKaHBYMDdaYU13dmNpcS8yOUZLT09uWCsxZ3BzNk5DUkla?=
 =?utf-8?B?cmxHR2pGU1RSdGZsdlJVeVI0UndyK3dMa2NPOXI0ZnZORDB0RnpldmxCeVZ3?=
 =?utf-8?B?SWYrSmJRbkV6ZVpQMHJTSjYxKzJMVlhETHFzYXBHOHUyRXQzQ21yTTBiY1Vz?=
 =?utf-8?B?UGQ4Y1ZSblhpczRtNUJPMEp2dWpYTUhiUVNxbkpHU0NTZENHSjVUakRqN3Ba?=
 =?utf-8?B?UlBsK0luakZCYnphSjhCaVZtbDJFU1U3NUh0M1NEdUQ5ZFJnUWVBbWRvcjR2?=
 =?utf-8?B?ZWlQTlFhZWhaQ2JWVkJ0ZG9CK0lubDF3WFVvb1VRalZhNmQ0UFhmUlJFem1G?=
 =?utf-8?B?NlRtRVRyN01NbVFsbFMyTW1zcDgyRzhlckhlVGZ2ZlFEUEN4TUtkRUsyOWNy?=
 =?utf-8?B?eWtQVnVZYkV1b01LRDBaTUVHazhoUUZnSm1aaG5MVnpscTBCWDE4ODF3M3gw?=
 =?utf-8?B?Zm5wNnc4cGxDU3VaVHhMSzBVdXBKTmNIM1F4bFZRNlRIVDJKcGFJOHRsN1cz?=
 =?utf-8?B?Y2lZQVlYK09NVVN2SUt5eHRLMnBhTDh4dHlsclY1dXpZZktXdE9SeGZwZHd0?=
 =?utf-8?B?dzU1elZxT0pqdkJvazNWbkluVm8rTFEya2hGbFNnR01EaXhDakR6dm1Za3FI?=
 =?utf-8?B?SUpoeHJxQVBqQ09ITnFWc0R5eWo2d0ZIeENZYTd6azVxVEFqaTRyZnluUHFl?=
 =?utf-8?B?K3pDUjV2bkdVT00vbWJaamtFc3lld1d6SDdJK2tERzM3U2R6bEFBZDJ5bXVP?=
 =?utf-8?B?T0tRMkFJSlQrRndnSDAxM3NybnhhWHRBTUV6cEFLL2FtbDJxaDd2YThxOFlE?=
 =?utf-8?B?YjhBTUVPNy8rcDFkbzZBUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2M4bDMxWlpMNkY4T3p6bVpWNTVqQVVxam5lV05YV045TllLTGJRY3QwMUhK?=
 =?utf-8?B?UGloSFJsaXJPK0VzOTU0Z2ovZllwMzBjcExGckVaOG9PaTVxdDRBY3FjQW5N?=
 =?utf-8?B?dkxYZlkzeTV3QkJ1VEc0TFFHS2JsY1lIYXA3U0w2RlNaZWZ2NkpLaE1CaDlK?=
 =?utf-8?B?UkN1R1BESHpkSnlKNk05eVJxUkY4QlZ1TlUxeVNqWjJuczFnMDQycnhkMTFr?=
 =?utf-8?B?OWMzdW1QMzRHQm9JdHpsZDQ3TVRHbi9MKzd1WnVHT3FLM2FMMlBRTzcxZDM5?=
 =?utf-8?B?R0huUERXaTcrSmV3aGVwbW1uaHVZNW8wT3VJZWZSK01oS2tIM2FNNmtIaDFN?=
 =?utf-8?B?MEMvYUg3SWhxOVJzRVplMS9uWkt4QUYrUHpNTHpnaFVaZ2tQdFBkbnIyUUdz?=
 =?utf-8?B?bWJjTUQ4WlR0c3lWT0hXME1TK1kxekQrOU1VSWp5b2pFMVF6WFdaNkhLOFV1?=
 =?utf-8?B?cVJxQURNVlNkeUYrbTlMWUl0eWhQK00xNGFCSUZNM25SYm9JSHo5MmdrODR5?=
 =?utf-8?B?Z05XK1JUNTlCelIrQUtSY1JhaGhLTnJMRTBFdVoyWEJpZWRKdnR5eFA3WDc0?=
 =?utf-8?B?WGpVUm9QWXgzRXdKNVJRclJBZEdaL3UvVFA0bkFNSENFWkUzdmpqdWkrSkEx?=
 =?utf-8?B?WXc0S05jaUErdytnTTc4VFExZlQxQTRjZWRzQkFBWFUrRE5Razd5OThtZmRL?=
 =?utf-8?B?VUV0QzZ0WFdkYitIWEpjQ2lVZEFKOTN1TEhZZXVpV3E5RmpzMDBjaW53dG9a?=
 =?utf-8?B?R3F5OHRZN0o2Yzd0enBOODJlU3pHbGhnSGlQdGYwbkZMT25IL1BLd2o5bU9n?=
 =?utf-8?B?K0pwbjNBYnROTWY1VDNycDl6NTdNVlJMUXcyQ2FZc012T05yR01RbWZRVSsx?=
 =?utf-8?B?U3FUaDhSMVpueWdkOFpPTWM4dXFGS1NlSVVNcUMrazFMQzFhUS9RdE0yV2Mr?=
 =?utf-8?B?L0doS05zaGVCU3YrSjNGdG1LckVRb0kyWG56aEsvQnNveVVJb2xxWDNtS096?=
 =?utf-8?B?WlVQQVRFcms4UFJjcm9iYzczTFNtT2JGd2JCWndHbnZ0V29rK0lUaGFLY2pN?=
 =?utf-8?B?RWUzNUp2QW1iTy9DQXc1Q3JrR0p2TGxTeG5iQyt1TTVndThRblRKTzlzZzNL?=
 =?utf-8?B?ZEZiOXluQ0d0ZlNzR1BJelRRQ2YwWlh4eEZWK09SOEtRUU9ucEJaWjBrRG5K?=
 =?utf-8?B?VTE5eFQvT05EaTVHaWV5c0lJTXNmb3YrSkZBajdSV1lkQWRQTldpaW11c3A3?=
 =?utf-8?B?QngyQjEzTkdoR3daN2VzSzRodTRjalA3cVRIZUs4T3p5Um1KZFBIZU1IMXNz?=
 =?utf-8?B?N3R4Tisxci9rclN2UkxISTA4aitGSHZucnpwWS9ZLzhaTkxoVUkrYThiRFp6?=
 =?utf-8?B?OUhEV2U4alJuOWFzbDUyYStvWFpGZjJQOC9lSnVwODNaTXJoakZ5blI3RVd3?=
 =?utf-8?B?NUo0MXRJaXVPaXp1TTRoUEdkbVY4Y0xhSFJQaE1HTzJsVEFxMHRYcUpHSllw?=
 =?utf-8?B?M2xQNU9mR0UwaEhGUWliUFVqZjM0eWlIRlF5aC94UEY0Tk9hLzdlZDl0U2Yy?=
 =?utf-8?B?Zk1MbFVBZi8rRHdaY1dNK0dpdFhEcGN2LzhNYThmMi9sV1pWT2UvQ0pjV2ll?=
 =?utf-8?B?dlVFTjJxNDZwR0RHQkRtM0Z6dXRJeHFpN3dhTjJxS3p5S0lRUWtMUEtkSW96?=
 =?utf-8?B?cnFnUC9wSmRvZ2dibkE1UFVPQWtqWk5HVGd0V0F6UFV2U0dPM3QrK2JoNEdh?=
 =?utf-8?B?c0dKb2xId1ErYTlLN3dtckVzdHB2cE9YUnc5K1RiWFVjNGhSVmQ0VTIxQ3gv?=
 =?utf-8?B?WElURHIxdTBpOEpXUHdVd3VGNkNoejJHZGNqM054ak5kd1c2aXZmb0h2ZzNa?=
 =?utf-8?B?bjI5czUweTJweloyOFJUdE1xUWxFKzdReTBvcmIwQXd1czNCdFV6SnprN2xK?=
 =?utf-8?B?T0kxZDZTd0p6UEZvMHdZUFB3dVlpM1hiSzQrWmRrWWxoSHBBY1kva09IVzFZ?=
 =?utf-8?B?MHlXYlZLU3hRYkNUZitIWDR6M09KRG9kS3k5blMxZGtTOUZwRHc1TURxc3VE?=
 =?utf-8?B?MW1wYXJqNkQwNzducXE5UVNhU2QyK0NHVHpUOW1zc0ZTNExnZUxienM4MUVJ?=
 =?utf-8?B?WGNQTnhVZlhHTmFxNTV4Z2ZEbzl2Q2lpSzZNMDZhZmhmWW5xY1pFeVpRY1Vl?=
 =?utf-8?Q?kVCJ5Hq9wEl9h1GSY6oOghPPcr1++RXDWDwCxSjBIc3f?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e68c641-cd77-44be-0bc2-08dc9d909196
X-MS-Exchange-CrossTenant-AuthSource: FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2024 07:52:22.4271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CIwEeLWOyfiZdnFlDvh8k+8rLdRMD3wN+mopsKx4/UwGTMcVehUCK6QfGJSjvi3QzCSXvnJi2dJcUsOjFtNoXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR3P281MB2031
X-TM-AS-ERS: 40.93.78.49-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28512.006
X-TMASE-Result: 10--32.985500-4.000000
X-TMASE-MatchedRID: IDdx3MBO6EBTzAVQ78TKJRhvdi92BBAu5h1jci/tY/kFzeCzX2K7vAKT
	N3/6Xk6mGl/Xv47U6MG4dxPfElTo2Tqr0QiTlbge7aTtuvsotuRPV5HtvDPOzTsPgtRE5V0zn78
	+rslXsycFutJcfoiLtZp+YgcpCCbwjjRFDyZYlr6FhGp9GNPDrUTrh3TFw9fFN9jDWB7YUpMdSM
	XMlmvkWTFOfZeoZGROuNxtZp8F6ty612HZbKcuiu4c8DMErak7o4iCakRRMU3RDig+1bLp5DRGJ
	noK3ysi/l808DNCnvXpsZy5Bgeci0e3cQTZN3joejgaeZ7gdTVBf5EtzC/DmMaGZ3GOeK8WCL18
	9WcN2ntc6E7sEogd5W+vQ8QWEfFxKzB72nyjovoCDXiJio6yGVqQh6kHlC6H1uBDkRXFeXOF1Xg
	M1szx6yfJv4X51qSgMh182QIE6IsdjBmukzVYjPSusYC5w0DYUCpvN72sC4SRh+vkbgAK456Z8g
	IevGzMgRINfg8CnQqEfSuOppk90q1rk2jAtgH7RYNhzuZZjRBhrBIkTvAZyN5NcFSapywToBYN2
	NUCifDtYt6UrGBkrVBHkQ87uZoWUPfhQnWn5bANLyMY4lOKmrQ1PqGWHFxyOeTy6GA9TSTRVaCK
	vzOY2+Sazff4fhF1SO5SKxwRGEFcOnqpgy+bqxEuOqgkm3/1+sMesHlgpMtLmwaA0hCee2dtARg
	0IcL9LkPB66I5MXl7+ppwg+NZl3GDuy8y1qkuA/3R8k/14e0=
X-TMASE-XGENCLOUD: 71edbf97-8430-4f47-9f18-1df27cf7403c-0-0-200-0
X-TM-Deliver-Signature: A85F44F46B15B5CCE37945CD2FE329AB
X-TM-Addin-Auth: vG0K8OxsWHnxJrh9fsXexapWT6wKQF93uWP1JCOgYrlgn1amk8YUPB5YLqT
	m+UxBTAJIbPpBMy8i81xSBwqRAbXAtaV5hHxK01ehjErpt7wA2RiXGuFbjGGPx2wNrmDLyjxQaf
	P5BWqoajrWK0Hi5jbQtwH/6rnTWb2fpfMTPUhmX/TZ3HQGrfSOFQfUUwKTUqTdkzcegk3f+7Fey
	XqSArZFMJhz7SNPZqCnMxm4EPqj9wSIBCJuVOn4riuu9vKEnKb0OHW5Dh9Y05vU1CgepDihjld8
	HIsw8uzbOYY2Znw=.OsXJKe1twEDJxJsqfPscXJfPSS8cj4F+uZ3H7lIWhwhI99FwScLvGKXbRX
	5AvvtGc6ebWiaiZMstDfmGv1SXRDcDxoKf/oTIuGLikySJgOz8UPn8pA+cDU/eLmzQVQzlMx45i
	ebNsfXsOyspZgAwPjtNFkW5MFQnmYAnelipm2z6H5mWSYhb/tBsVLy+Dv6YVykymzEWFRN3BZ+k
	e6+QvXFtfEjMKm0QmSf2fNTcQbqWRyxGNnpeEiavjhVlRsCXu4zl4WbeNMm3HGcfeWDi7jM7b8G
	NExhaxYY1tfGlEqkoMbSSQ/KfkXEeqlRsgAwvNC3zh17AKKs/xo1jFrUlYQ==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1720252343;
	bh=EPdk9qCr9gGnwOXXV0/kcacFBl97x+fKOek6urrFNSI=; l=5772;
	h=Date:From:To;
	b=R3+qqnYqM2XXhP1oEUuJ8unsqfKBqrQa0MKiqjTgYnDip4u/88AumZnlVA/aL9WU0
	 35mgq49MpdGWE4SNBA09LFz2SUZYdTvwQdviR5XiJVua3g0DtYu5hyWtnbHsP+lnFK
	 CQEgkntAeFdxGBVIq61CGZwjqdes2QuDOksD3SY2N/eFLh5HaXlENMIeKCjZj/an8s
	 5bylilxPWgBOXx9CleGE+JBdlnNdjECnDSIdxhD16Jvj0WI3UL37Tf/Cut3iFws3ja
	 l6RizZRXsl89Zl58Y7FNr6cvMrmlEWpX+NdT/CDyRFzw+dc2/Khj2alwWF8Eshvr2r
	 4exAJiIc7rJ7A==

On 05.07.24 18:17, David Woodhouse wrote:
> On Fri, 2024-07-05 at 10:12 +0200, Peter Hilber wrote:
>> On 03.07.24 12:18, David Woodhouse wrote:
>>> On Wed, 2024-05-22 at 19:00 +0200, Peter Hilber wrote:
>>>> +VIRTIO_RTC_LEAP_PRE_POS resp.\ VIRTIO_RTC_LEAP_PRE_NEG pre-announce a
>>>> +positive resp.\ negative leap second. Pre-announcing starts at the
>>>> +earliest at the 17th day of the month including the leap second.
>>>
>>> Where does 17th come from? Is there an existing precedent for that?
>>>
>>
>> It doesn't come from anywhere. I set it to the second half of the month to
>> disambiguate pre-announcing, in case a particular smearing algorithm would
>> only start smearing on the day after the leap second (at the start of the
>> month).
> 
> The day *after* the leap second shouldn't be considered "pre-
> announcement", should it? Wouldn't that be another case for the
> VIRTIO_RTC_LEAP_POST_{POS,NEG} that I requested? It is notification of
> a leap second which occurred in the recent past, for which smearing
> activity may still be ongoing.

The SHM would always indicate true UTC time so the `leap` state there would
be LEAP_PRE / LEAP / LEAP_POST according to the leap second.

Would you want to indicate the occurrence of the actual leap second also
when doing the smearing for the VIRTIO_RTC_REQ_READ_CROSS message? I
thought to just indicate the time when smearing is being done.

>>
>> With the correction as per my above response, `leap` can already indicate
>> this together with VIRTIO_RTC_FLAG_SMEAR. But as I discussed above, it
>> might be better to use dedicated `leap` values for smearing.
> 
> Makes sense. At this point I think as long as we have the POST
> indications I can align the shared structure with your method of
> indicating leap seconds.
> 
> The pre-announcement of a leap second at the end of the month is hard
> to consume within the PTP driver. At the end of the *day* is easy
> enough as it's just a case of dividing by 86400. Months are a lot
> harder, and involve knowledge of leap years and other complexity.
> 
> But if the complexity all falls in userspace, and we only expose that
> "leap at end of month" pre-announcement to userspace and expect
> userspace to work out *which* second that is and tell the kernel,
> perhaps that's OK? I'm still a bit lost about how this will all work as
> a leap second passes.
> 
> (The lazy part of me says that it's increasingly less likely that we'll
> even *see* any more leap second before they're supposed to be abolished
> within the next decade, so should we even bother? But that's probably
> not a great approach).
> 
>>>
>>> (I guess maybe a non-integer value of the tai_offset field might be
>>> used to infer that, but I have concerns about that too, because surely
>>> that can't be atomically read *with* a given clock pairing, and will be
>>> constantly changing during the smearing period?)
>>
>> With a message-based clock read, the device should be able to calculate the
>> offset. 
> 
> That's true. Makes me think that perhaps we should insist on only true
> UTC being advertised as the "primary" clock, with that delta-to-smeared
> value being exposed too, so that a consumer who wants that can add it.
> 
> It harmonises the message-based with the shared-memory approaches while
> still allowing smeared time, which seems attractive? 
> 

Advertising UTC as the primary clock would mean that the simple
VIRTIO_RTC_REQ_READ message could not tell smeared time any more (or at
least not so simply). I would prefer to retain the possibility to have
simple implementations.

>> For SHM, the vmclock approach appears more suitable.
> 
> We do have atomicity of reads with the vmclock approach, by virtue of
> the seq_count field. That's needed to ensure that a given TSC read is
> *within* the time period where the absence of disruption is guaranteed.
> 
> What's hard is that the rate of change of TAI/UTC offset would have to
> be indicated *separately*. And it might not be linear.
> 
>>>
>>>
>>>> +In field \field{flags}, VIRTIO_RTC_FLAG_SMEAR indicates whether a leap
>>>> +second would be, or is being, smeared into the clock, rather than being
>>>> +inserted according to the UTC standard.
>>>
>>> "would be"... didn't we already indicate that with the clock type and
>>> subtype? Perhaps we use this for "is being" and it resolves my above
>>> concern?
>>
>> As discussed above, whether smearing is being done would be signaled by the
>> `leap` member.
>>
>> In the case of VIRTIO_RTC_CLOCK_MAYBE_SMEARED, VIRTIO_RTC_FLAG_SMEAR would
>> still add extra information to distinguish smearing from not smearing (but
>> as discussed above, the `leap` values might be extended to distinguish
>> not smearing and smearing).
> 
> I'm not entirely clear on what the 'MAYBE' is for. It seems like a "I
> found a clock lying on the floor and I'm advertising it to you but I
> have no real idea if you can trust it when leap seconds happen; I don't
> know if it smears or not. Maybe just don't trust it at all for a day or
> so around a leap second, eh?"
> 
> If the producer doesn't *know* if it's smearing, how would it set the
> SMEAR flag? And if the producer *does* know that it'll smear, why say
> MAYBE?

That is the point: The producer may smear but not know that, by getting the
time from an external entity, and therefore not set the SMEAR flag. For the
driver which only cares about tight synchronization to the producer this
might be acceptable.

> 
> The more I think about it, the more I hate that MAYBE case. I think
> anyone advertising a precision clock probably ought to *know* how it's
> going to behave!
> 
> 

[...]
