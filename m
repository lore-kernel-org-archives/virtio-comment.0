Received: from refb01.tmes.trendmicro.eu (refb01.tmes.trendmicro.eu [18.185.115.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70561991B6
	for <virtio-comment@lists.linux.dev>; Tue, 16 Jul 2024 11:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721130952; cv=fail; b=sX+n5UyuWRVcgZ0P30tTc1xSlmSyIjayDu0wiSKuoIJtDA4vLx6tr3EQetBlQdwMCGJlFFSG+Hovyfk5QJtWiXu9b8LwK4/bXfJWPjotrQrd064Q7/xM5dycwMq7XxAPKsM/5w9qaX97z2ZCQig1bZjxAoAn5ldd3/L66S0sX1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721130952; c=relaxed/simple;
	bh=H5AXx03xYsC3RfMdx2nUMKFjNNheUccXZnYu1wXYg58=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qMvT7JN72YeDowo35dEAnSO0FN9X7u6Syhtj7gdw65RMvCFrpgBAMwX6nYKfm2an5Td90neoU1+3Hjotx8EFaOrZBHPb5hByZUeczHKjppe1Y9wuxnutHWkUnOarLbjkxswFFLPz75ih5SS432hRwRcNj0nDDjcyxR+e1vushS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=u/hhb7+5; arc=fail smtp.client-ip=18.185.115.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="u/hhb7+5"
Received: from 40.93.78.49_.trendmicro.com (unknown [172.21.19.198])
	by refb01.tmes.trendmicro.eu (Postfix) with ESMTPS id 7716A100F4BD3
	for <virtio-comment@lists.linux.dev>; Tue, 16 Jul 2024 11:55:48 +0000 (UTC)
Received: from 40.93.78.49_.trendmicro.com (unknown [172.21.177.236])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 6E11B1000122C;
	Tue, 16 Jul 2024 11:55:41 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1721130940.626000
X-TM-MAIL-UUID: 8e11792c-0c62-4dd3-b4fe-a23e29030e2a
Received: from FR5P281CU006.outbound.protection.outlook.com (unknown [40.93.78.49])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 99022100003D0;
	Tue, 16 Jul 2024 11:55:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSLmsQ+u5QnTAjU8E31lpszp9tEIu9sC28U0subxZC9UWylMQLeGfqgUgPOmxo7XbKlHKGEqVJ78tDAFkXVeMvyDvr3pnnq6O4qmLqet6ewNfBU1yFfHS6f46P/XkfkJ+idL2gUbFGZq2a/e5WiyB5wsw2uejQGcYOiUXvB7tuyGMHj0vIhlUsSNw9XLRP1t7zuCVVrfqSqsxVpG8C95rMoDozvScVKYZeYOZq/sNNv9gdLv2L3BXyj1+hE5u6xmuDLy5ikD4BHej+2oQ9zqV+ZUOjZ2eku/lEyJpbT3AX2C1SceEC20hwQAlY8yhXb+GFoUJI+Y6FFCATt/+SbIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DfeFYv9gtexhRText1c7zkOkNud4etDr6Cc3mdg+EM=;
 b=XkGF/uJySvwXwIm1XXqoLW4uhhPTCAhQKI0bEdi30gqgnyhoTPM5+R/VcNjE1l33EWVoNAGvs+r9OScNb6a1q3PE1D/w0N3NkLCZ8p6z4doJWjNx1lveT+a9UYFyYcc5ItNjxlpd7ByfqnjEwNvD7i5cQrrm8XmZpr+sMmDE1kVvjV2oNgPfMrNtK1QKgBGU9Jo4KKQXzF/+32cmdMlqrsdqX45R5cTtbZo70aopOdnCkEkBNNUvM9myh5bG4S/LhbWv3SBitmekwZ0Ra31C4UPNz3KpVSIZfkimTOaPQtz/2ChYATuIxYPI/TEcLaKu03dNsWrtNIsk0JQ0/FlL3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <85c93b42-41a2-42c4-a168-55079bbfff71@opensynergy.com>
Date: Tue, 16 Jul 2024 13:55:36 +0200
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
 <20483787-62df-4ca6-868f-71b4d4898323@opensynergy.com>
 <b1645fa81d693b899430f7210ae1cab7d28dbc1e.camel@infradead.org>
Content-Language: en-US
In-Reply-To: <b1645fa81d693b899430f7210ae1cab7d28dbc1e.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::15) To BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:3d::8)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB1906:EE_|BE1P281MB2579:EE_
X-MS-Office365-Filtering-Correlation-Id: 7194a024-2916-46a0-ea19-08dca58e34dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bDgrZXVaenBwVjIrek9yOUQwaGg3Q2tkNHl6dElBTHZZeWd0ajA2SXJ5aWha?=
 =?utf-8?B?ZHdXaHNXTFFCdEdzRGFEdUpjblU2TlpwMU5RQlUxYmh2VVJoMlFYaXV0UHZu?=
 =?utf-8?B?SjVBbnhsNHU2WFd3QUc0b3VtYkpIV3BXRHliMzF4RExVSHVXRmVYVFlQeVY5?=
 =?utf-8?B?UmljeU9aejU5NkdsdlUrN28zUHk1MlVUemlBLy9jSXdZNGovTHArZzErWm1a?=
 =?utf-8?B?OWIrT29ENllNN3BvQ0tuVnlyais4S0RmTGNzcm9pcTRTSVBKNktHczE3YlRo?=
 =?utf-8?B?QlpKaDBydzBPV1ZYZjVpc2pPbTFhdnBndmR4d0h5ekVXbDE4dFZ0a09VWXNE?=
 =?utf-8?B?bFZveER1bndFbUhqUmNGSVNGMk92WTIvS1pJWDMvMmFBcCs5TDh5d1lnc1Bl?=
 =?utf-8?B?YkYxMzBZUnFvSkY1eGZ5RUcrMUpkcGJwWjQ4UHVsVFhNbzFvZm1UWnN0RUts?=
 =?utf-8?B?MXR1eTdCbjQxc04xNXRHemZkaE1ZWnBTcnRHUXlLaFhjYmcwcWRvbS9uazdN?=
 =?utf-8?B?Ny92ajhkWmhHZ1dPNHcyWUFIL2Nid1JscFF5T3R4OHF4ekJySGdkRG1VS0lT?=
 =?utf-8?B?eG9Feld6T2hnZ1Y3OXkvRjdWblhnMGprbFl5RFpYOTNiSW5zWXhIM08xL0du?=
 =?utf-8?B?SEJxRElYUWt1ZlZBR05iWi8rOUZLVk1qTW9qNk93bjRYcktwMVlVT2RQZmtN?=
 =?utf-8?B?K1RiZE1RbWlPOXU4QTFOVC9EWUZOeFAyWllVcjJRWUh6cXpJUGdKeS9DNmpW?=
 =?utf-8?B?VHVSVVQveXBWd05HTUdURDVZREJCelNNRDhpUk9yNWgwblV0TitXaE55VzVP?=
 =?utf-8?B?bzY3Qk5kSkRyVG9QV0NUYWhOQzlNdVdkbXNueG1RbVpkdmFaZzBTbnpnVUwy?=
 =?utf-8?B?VHJBSTZ6OTZmaUo0VW1vTVEwTUxibTJWUG0rcGllMHNDZEErcTZObFhZZ1Bv?=
 =?utf-8?B?Y0g1ZWtpKy9FbHNYNW5xVkxiSUM1Nm02TmlXOXltN0IwQ0Z3S1JtY3Yya1hJ?=
 =?utf-8?B?UjJUcmRuL2pNYkVHWlpzdVN2QXpKWHVwRCt6V1ZlQjJVaXI1WTNWSjRBK0Uz?=
 =?utf-8?B?NmpJZEJqZS8zV215Y2ttREcrOERjYTdzNm91YnZZeU5IRmtualRMWWlxZStN?=
 =?utf-8?B?L2x2WFRZZlVmWFN2MUtzNmpkaFBKUGttNmdieDBSOWZodTBObFZvRWFIME5O?=
 =?utf-8?B?VU9RbGd3d3dSWTV1SW5VVU8yNWxHV0swYWNoZlQxQVMvd3FhckhmbTBSenZu?=
 =?utf-8?B?bW9lN0gya294Z043enlSZHR0ZnU0ODBqNjYxb0FnS1VsU3R1eTY0dVRwMENR?=
 =?utf-8?B?M1JHK0ZjQzh5Z0hmQXRpbFpKTFdzKy8vRWlnZmgrcFFrelp2bTljRzhxTElp?=
 =?utf-8?B?U0IvVUhuQ0NkTTc0THhCaXB2WUU4Z2MxaGlKV1lXYW5ucVNIZmN4eTdmNjZP?=
 =?utf-8?B?UHdxbGg0aEpkeldUVlplWjJ3ZWdnVWhBOHJFdzVEREJKMWM4TTY0ZU5lTnoz?=
 =?utf-8?B?aWk3QXB5NXhMRVAyZFN2akZwUEtMb0NGQkNMT0NvUDBrakZ6Z05xWGtLWFNT?=
 =?utf-8?B?dVpNMHg3ZVUvempTZCtDZ25vMm5JNUVQN1ZqaVZFVldybHFJLzVMUzdha0N4?=
 =?utf-8?B?TFlBNWxGR3k5dnRqM0t4alJlL3o1WnA5bEZNTzZ5aWVZSHcwMEhrb3NHcUtW?=
 =?utf-8?B?ZU1BTmFQZmJ5NGZCUHg5RTQ3aXIvN3VyeEJ3U1M0d0ZrVTJhdUZkUXRKNnpE?=
 =?utf-8?B?SThTTS91THo0VFVkbnpzcll5QmdadlNnT2prSDZCdnhXUW9JRm5sWmk4VTRs?=
 =?utf-8?B?WDBaM1VFd1ZvMGNFYnVTdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDNLT3BLSVNBU3NDYjJhU2pZSm1QZGVMelRDQ1AxSk1YSGFrTG9MSUllT3ky?=
 =?utf-8?B?bXlPRGhHaFA1djhsbVhXNEFTR1VLd3F3Mlh0alZvZnFGOTdqQ1VaVUpnQVN3?=
 =?utf-8?B?L2ExUDQ3WHhEWW9NaGlSUDRqVXR3VEZzN0dWbEFMQk1RTnE0SW44KzJsd3k5?=
 =?utf-8?B?SjB1RmRsekVHTm5FWjI2Q1lqUUdHUkhRWFlOVmdpYUI3UEJsRG9HSTJuMCtB?=
 =?utf-8?B?MnA2aENuR0xrRjJ1clVkWFZUVTFBRVRMV093Sm9BMmV6K0dNbGJ4TXVaYks3?=
 =?utf-8?B?WTZnZThUT252VngwdXJaYTVBTVVyWGFkNUY1NjNVV3ZKV0NHR2gyeURRaHE3?=
 =?utf-8?B?VXZsVUtaN3p5OTZnN0dFZkpSWVBSRTdJNXlFd0xEdzBpOWUvWFMxKzBnQWNu?=
 =?utf-8?B?SVpORXNibzBORnNqeDZ1c0NBcURyTEs4YWluWWYxQloyVlJIbzFGemhlMmxv?=
 =?utf-8?B?RVJnMXhZdDBiS0RKZk1RVXMycGNxZHNqanZ2a2lrOEZ2eHExVG9ibFc3UEpu?=
 =?utf-8?B?cDlHWmF5Y0NsZVV6MzlIMTkrZjF3dmMyZTBYM0xqL3Q5OVNmQncrNVpnZlhQ?=
 =?utf-8?B?M3RuMm1zR0JJdGxWb0ZlYnVxK1dqaEVubFpTY3Nvd2lrZHZQNUJQdzhNZUo5?=
 =?utf-8?B?SnRaRExtc1NYanQ5ZGhaT1VtNC9NeG1BbG9BSVJ0ZDZidlR4VW1oRHRxcUJE?=
 =?utf-8?B?SnJSWEhVcGk4alBhY1M2NXRrYi82SnFnMGoydC80Yzg4VUxlbDRzZ1pnTDVM?=
 =?utf-8?B?a0l5ME9Va1VGb1JvRGZ4Y0RJRTF3UUNFelJnS0lyZkRuWjBoNjN0WTBnQVFR?=
 =?utf-8?B?b0xUQkxDdVZmMU85UktQa1NuUHB0OVpRVEZyWjlBMlZwbVIwOStvcm1MOTFK?=
 =?utf-8?B?T2Voa0RMMTFubWpQWGs2dGQzclJzOTBydW8vaTI2bzBXbS9yZnYwdDhXWUNQ?=
 =?utf-8?B?b0hUcUc2d2NUZnR6d1llTmhLNzlMclVITFFsZlN0NU1mSldpcll5UTdYVnlk?=
 =?utf-8?B?YmY0dWc3cU10QTNiclpCN0xuS1FUMng1Sk11OVVrNC9zeGVya3NWTngzNDhI?=
 =?utf-8?B?Z0NKU1dLdUt4MGtYZzlOckM3bnBQWmgxODUzZkdVcU5NLy92cHB4VnAxcDdo?=
 =?utf-8?B?dm5QQnQvbjFENmx3ZmRMMDJNaVE0dGNCQXNTYTl0M0xUMTNsSGFXWWNCS0xz?=
 =?utf-8?B?SGk2TWhvWVFWYXpLdEhyZHRZYWZlU2I0cWJXRDlMRUJ1Rk02V3lSSm8zdkl2?=
 =?utf-8?B?OG9qNUdkSHpmZ2RjVEE4a29KbXM3U0M2OFE3YWVOam1EMGM3TXQ0MnoxWjBE?=
 =?utf-8?B?TksvY0dyUGpBQ0VncXRIdy9QSk9TM3FldG1hNVUzY0MxdDE5di9uUHFUaFAr?=
 =?utf-8?B?cWtQTm1yUENKakIzRXl6MUV3elhSdmwyYVNYQWhQcG9PVk0yd2xNZVRObW9M?=
 =?utf-8?B?eUh5bzZPUlNMdTRpcGFpK2dDd21MbFpYMU5TSFJVdTVIT3hoY0J5YUZySGhC?=
 =?utf-8?B?ZFBlcTI3ZTE5ZDFKRk9TcU96Z0taNW4vZmljQ3dDSUo1YkNPTERBWlJqd0Rs?=
 =?utf-8?B?U0tMSFU2OC9lcnBvL2RLU3lZamtqMjdwMU9IOGtmMFd6Z3NKTU5HbjRVRVY0?=
 =?utf-8?B?cWpBNmFZZVZFZDZQOStMd29Ca1g5cEVPT2poUmczdGRkWWtnU1BML3RjQXJW?=
 =?utf-8?B?RWlQZXNjN3ZIVkFGMGxxUzJMbTZidCtEcklocXFITnFNckkraGY5dHp3aXcw?=
 =?utf-8?B?ZFk3TmxERFl5MlNJSTVpanlmQk9Ic2dKdXZPdEZNSUZyejFKZ3dDSUhEWnhr?=
 =?utf-8?B?dEVSRzhYZll1VStHV1JFYzZpbWNPUmlXVWxHR21wLzREN0hYbTNuejNJd3ZV?=
 =?utf-8?B?MDZNem9qcjU4YjlBRzlxQVJMcjR6ZnZXMC9iQisxcmg3WXVzcFoxMmlybURt?=
 =?utf-8?B?MCtHcHhKZnJiU0VoMmFGaGhwaXJGNGd4a05ZV3J5ckVBWDBiblMvMGg2eUpN?=
 =?utf-8?B?NzhyK25icmJaRDF0MmJYMWdnWlRTa0FXZjNhRW0zcUMxc3NCMEJNS1hEakNt?=
 =?utf-8?B?Vno2bmQwSUZmanV0N0xJNzhJUmZwUS9rSTJtRGpmd0ZWamxBcSt1ZVRiQUNz?=
 =?utf-8?B?eG52Nm0xVW5BZ01OT3F6aUxqZ3ZFN0JOL0JoaVdMaEFCa2NaWGxqaXlOTkR0?=
 =?utf-8?Q?hcgOF3TIAkbihl/PPiSsdPTI+zXWYRbgOW8Yu4vf+HQy?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7194a024-2916-46a0-ea19-08dca58e34dc
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 11:55:37.1852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /mhGdlpyfD1WmknquHJU49fDJTKBbBvnEQO02aaX2V2uYSSrmRcEsWBRwPQc81xLoayeUTzGzvwYTeGu/aFgZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB2579
X-TM-AS-ERS: 40.93.78.49-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28532.005
X-TMASE-Result: 10--24.386800-4.000000
X-TMASE-MatchedRID: xcONGPdDH5pTzAVQ78TKJRhvdi92BBAu8PHaxqpO3pi+cYeGav3bfxPO
	q1cdIHlXop7JXmja8bwJZ/A5am9JIsTWS8/I04YMyFDZkw29GneVmuhG06IIbUpAKho/DXsgLOU
	EhN26Y+0euCL/oBEYwAujn4Yl1p2q2mBJWq/nyFkHNShWtYdI6XF3Zv0Vh/DtOEwvJg+UGW9MTt
	bvlaEox565G/BmrDZ/CEL5DYM9P7gmOmBf6oY5kawODSO9Fuc1zRtqi11BTk7lNADTSrHglcJDB
	aSR0WMT/rt/WuaS2m/FD+iTQwxdQZGUAJuTgwnsCffN9El9NwOJ8w4a/G4Uj9bojhKG7WOq6KEJ
	O7SR6XgkvJFrsDh0h5XWHqKOxvV4rQDJT+IEXRbE70Mejctgq/rDHrB5YKTLS5sGgNIQnntnbQE
	YNCHC/S5DweuiOTF5e/qacIPjWZdxg7svMtapLiJsZ0L4JGotIuJieNVvzvp+3BndfXUhXQ==
X-TMASE-XGENCLOUD: b62e7fcf-3c7a-40b1-9556-fce3c685eee5-0-0-200-0
X-TM-Deliver-Signature: 9F203F6F24412BCADBB92D67F4EED8FC
X-TM-Addin-Auth: CfkpSqKa/V7FkWE/tJyKLJdg3CWVKP2FnWxQg01x+zfi+Y4dy0ltDplBD6Q
	OPsgelg0njNKAMdtnCa0SwEtZBEMsi3OR0eMYPa5TZg3OJdZtDe8FvBYwz+T2rSLoxTXu0RZxnN
	32PG6REojyIReDzA1C21x7xnbkx2HjAEJJzqxiR/bc0taCRGHLq6ZnIlxLvM5TerfJCk091PhLo
	WUqQyByDUtJe6Iu5gEJOVe+uBe6bUGzgwtbNzdOZ80+kLDrUThnond/uEP1ciA64Dq8N58Nk4BD
	CXUtbJlm8lFi8E0=.mj4M9TmPbh457yNwolYKCPfYMp9pYNcZV+wGBeMr2sO23nczPmEVp28Bj3
	OVysd8OVbBXtd74YkNHypSeWsgvGfHYTZKtWVXpJhtCaEiyVT0fz3nHOVMDGkrKqR33MOlvTX4k
	5qdR0G4VlHTb0fwAiJw2D6bl+JEFAMoo1ydk6Ya40oub19vPGI+rrPI7x0Asv9xcFkhEFH+nDaj
	591p4+do1S1nZG53Zd0g0TqN10eR08JsWC94Tk9WUqDeds6jUIRt57IG8EP3TtUFEQv5Cop8Etv
	YZ8S+V4yNL9HkJtZpQOGpRyhGE/s5aXRhxATcTRK9OmZ/Rd/rKNoUFOZjrg==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1721130941;
	bh=H5AXx03xYsC3RfMdx2nUMKFjNNheUccXZnYu1wXYg58=; l=2578;
	h=Date:From:To;
	b=u/hhb7+5/sL2NB02Kk3/6rC9e/wCbZyjzDiHbpVoGhQpSDWB3Fo+S5Z6795YpRD6L
	 DysuqraXgjecL8Mq+lKswi+VaFPgPxk1ggeK/wrcMia5h3k/Xk8GZphzuUPmg2aNLV
	 BoY/KupcZpCiGJmCVcf/oZ3PLXs2qi3rU6sRePCwm1DsLz156YHLnmEpaHb4k1xL+7
	 HXHyRd95l0om6/yI90pz+oTEz5XlS6VCM310RK6EOUAtwhTB/gI0h5xBAYO6YFKwKd
	 xn2zHu2m7m/qB1FEibUR9KTUsTcuKhYBazWo81uLf4BgUeGNc6Tn3Lf4YxmPKMNsY3
	 aI6lLlG0H9d1g==

On 11.07.24 12:18, David Woodhouse wrote:
> Thanks for the continuing feedback, Peter. Since it's only changes to
> comments, I won't post a whole new version; I've pushed the following
> changes to the git tree.
> 
> I believe I understood correctly that you're amenable to adding the
> VIRTIO_RTC_POST_ values? And I think the other part of the discussion
> about exposing ongoing smearing via this field does not affect its
> usage in SHM? 

I will add the VIRTIO_RTC_POST_ values. But I think for the leap second
smearing case I would also add more values, like

#define VIRTIO_RTC_LEAP_NONE            0x00
#define VIRTIO_RTC_LEAP_PRE_POS         0x01
#define VIRTIO_RTC_LEAP_PRE_NEG         0x02
#define VIRTIO_RTC_LEAP_POS             0x03
#define VIRTIO_RTC_LEAP_POST_POS        0x04
#define VIRTIO_RTC_LEAP_POST_NEG        0x05
#define VIRTIO_RTC_LEAP_SMEAR_PRE_POS   0x06
#define VIRTIO_RTC_LEAP_SMEAR_PRE_NEG   0x07
#define VIRTIO_RTC_LEAP_SMEAR_POS       0x08
#define VIRTIO_RTC_LEAP_SMEAR_NEG       0x09
#define VIRTIO_RTC_LEAP_SMEAR_POST_POS  0x0A
#define VIRTIO_RTC_LEAP_SMEAR_POST_NEG  0x0B

So maybe the VIRTIO_RTC_LEAP_NEG definition could be removed from vmclock.
The other changes would not be relevant to vmclock.

> 
> With this, I think we're at a point where I can seriously propose this
> be adopted into your virtio-rtc specification? Do you have that in a
> public git tree that I can work from to provide an actual patch?
> 

I am sorry, but I think I will not be able to publish a specification
update until I go on vacation. I will be back in the week of August 5th.

> We need it to be explicitly little-endian, of course, but I consider
> that an implementation detail. Likewise the signedness of the
> tai_offset field, which *can* be expressed (albeit creatively) within
> the constraints of the existing virtio definitions.
> 
> It's versioned anyway, so as long as it looks *reasonable* I'd like to
> go ahead and submit the ACPI version of it to QEMU and the kernel (and
> obviously also ship it in the hypervisor that pays my bills), in the
> expectation that *if* it did need further revision before the final
> publication of the virtio-rtc specification, that should be feasible.
> But the *intent* is that it doesn't need to change, of course.
> 
> Are you happy with that in concept?

Some of the bit widths and defines do not match at the moment. I think it
might be worth to align those (from vmclock-abi.h):

- counter_id vs u16
- VMCLOCK_COUNTER_INVALID
- time_type vs u16
