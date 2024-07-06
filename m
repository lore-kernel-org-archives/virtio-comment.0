Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu [18.185.115.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236311CD00
	for <virtio-comment@lists.linux.dev>; Sat,  6 Jul 2024 07:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720252191; cv=fail; b=n8TxZqU1Mu/okxkkhPTKUiuKAHg7iGsO3kbtyljT7rJs4FDHyTT+/n3LsPDXDhmPI2RewMfeKdNJ4JvzIKDc5EAZiCrZcGha5Nm56rPmqPWVp+upmSYx45FrDZOm2WVz+v8MANBQZx4KpzWeKiQE4QhKsJIsjqIzP67vLp+EHK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720252191; c=relaxed/simple;
	bh=HYkD/iOYK3wXTncKxvTS5HBFB2HBCe7cdZ4yNFpqKfc=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ddc+ovUXS4FpbgwcWHkNfpRQOQQBwMJjvmIGFK7uxarQZ8dunSmDMNH4smYjmdTeCu+L7jYjktT+QWv/Zl9XSUgRJndK+1aOsMvXtulg7sAerx+T0Iv2l2FvoM2iA5cGJnmIl9ZChrgB0ejpyfC9DaeFI8yEo8q71Q0Q4dI6hD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=Xbs0P3lO; arc=fail smtp.client-ip=18.185.115.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="Xbs0P3lO"
Received: from 40.93.78.49_.trendmicro.com (unknown [172.21.161.124])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 687B310001751;
	Sat,  6 Jul 2024 07:49:46 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1720252186.074000
X-TM-MAIL-UUID: 890cf790-ad6e-4599-868f-bc96a2a0f453
Received: from FR4P281CU032.outbound.protection.outlook.com (unknown [40.93.78.49])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 122631000030C;
	Sat,  6 Jul 2024 07:49:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jp40edXYiJoa7M8G5QdjYO5IdRYG3EldyU6vFRArdBAlvt1Ua/FUBV+0MckgQwqToWsNDT3bpxklf8kK3zRXyu9rql00fPahsNYJgMvmNbGnVEMtajfEPvF35GnFc8zTilQOVgEqo0uFRF7lgmy5/h2teZuersdVbKpFPY0wNnWCN5V0eKrBoO+yuH/Szk9umasRQZlVv04x8a7xDRAJUD4AQ1w3jesc9gs5nzJMLW2mzKV28OCxvNHPsfkM74vI/5PrlGAPitZkZylBUu/0C5YaPud3huKNDnlZcSRhdY17/wZQz/EZ6qD5zXZo7CDMXb9rIlVeg9u3DFYF7u9N9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdX/SkCNCM7cM2rGwnRhj/Cwr5DtXKe+I30Lwkt3AXU=;
 b=YJYW3D3g6Vx1HwGfrXDOGDi0m1J+xKqf9gNB/V/he53RphvoHq/WETj6j/vbMLOcMTKo+rPppSSGT+0sQejY+b4GV6oKqmJSrk4Lxne0p1ubYI873FG9kdENIH3MDDyCfytEkTsf/VODISil1hDXKoDmA25eZ9gjtfSGxgBDYtsOm9FyyvsJp0YftloLEzfnywnXw74KYY2Fo0G7pX/i4uGjbQkPifkRXOctcFRjIPztlPndGEie4ZvzGaL345YIukknw9LWKAIUU1lXT3OGxhhzjHzslQ034e6H7qTpzFqgAK8Z9fi5NLhR+KY+RXV0B9jXZ6u+EgzS2L49f2YkoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <1100a7ea-0d4f-46f5-a004-7fb6e6942934@opensynergy.com>
Date: Sat, 6 Jul 2024 09:49:42 +0200
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
 <6709c49db692750b6c1576d3fa198ef47708124c.camel@infradead.org>
Content-Language: en-US
In-Reply-To: <6709c49db692750b6c1576d3fa198ef47708124c.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::7) To FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:34::8)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR3P281MB1917:EE_|FR3P281MB2031:EE_
X-MS-Office365-Filtering-Correlation-Id: 50db208b-0eea-4d1a-1c74-08dc9d903349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUltUG51L1kvcVN4WmJXMlIvRm95K2dWbi9iNndkaXhkNlhqTnFHcWw0dDkw?=
 =?utf-8?B?R3c5YTVaNGl1QjRxb3M1bVkyUTA4WEg5N1U5cEhpc0VTL2RIcmprNnplM01D?=
 =?utf-8?B?Ni8yWEt1eFk4OHJWUGRPR0s0RjVIdTg4ckdsc0F2Z1NkS2xJMURWcm5HTlhY?=
 =?utf-8?B?V3VaUGFaWjZXYWJMT0hpckFiWEF3OUwreFBBNHpydFdIanpXSlBqSkl0Y0ZZ?=
 =?utf-8?B?dkxFNytKRnQxdTM4TGRCeGkvaktXbHFlTGJXZFpKS2sya1dmWXpIbCsxUlp2?=
 =?utf-8?B?WlAwVG92R1Fsc1dXQ0ZwV3hrL3J4VDRxUXpxSHJ5RjNJVE5zdDhTcU0wTEFX?=
 =?utf-8?B?S3pDMFVkdGx2MWxjRUVET2Jnb2RZWlUxaVIzUjFCeXRPT3hwR1ZnRHFvemRY?=
 =?utf-8?B?OVdHU05hcVVsMHZCYVRURFlvelBrL0VkOTZIRTJkdGhjRzEvUnV6SmFVLy80?=
 =?utf-8?B?ZXBOVThMZ3hsTmpPbXFvbmRYeVZVeWRBZUdzc1pFbndFdVNyaFBpNnBGek1S?=
 =?utf-8?B?eDhESy9vRDZUZThjRUhOUUNmTEZhdnVYZ0xjMHNIVDhyU2tSZ0ZTTzVid2JC?=
 =?utf-8?B?M2ppU1FDL1BmU3RSc2YyeDQ5azZjeHBsY3lPTHZnSXl2UmFhSzF2U0FDSVAr?=
 =?utf-8?B?ZXdzd01Od0MzVmk1QUhrdy9KZTN1dWNkM2hFNkUvUWFpZ0hmeTZOVnBDT2Zq?=
 =?utf-8?B?d29xaHBxbFhjVW5RT09aQXNyU2tvcFJuY0ltZitFSDZTZGJ4S0kzUFplcVpH?=
 =?utf-8?B?ZjhhcmpWNzZ2cEVHbm0yKzg0VXluWnEzL0hwcVNaeWdpWEx1WGlSQXlrNFhp?=
 =?utf-8?B?TWlzZ29veEF1bko3VmFiUmlTb016Q002NDIvTWtwTEFzeHNsREYrZWdNYmox?=
 =?utf-8?B?QUZoWS9MNDR4bTN1eDVlVjRjbTZlei9iMnhvL3RQYTcrVUpJM0FUTkNEbHJj?=
 =?utf-8?B?MGxmdmVHNXlEZERRd1FQbmJ5RCtWTjBKMC9vcHJMK2J5b1hxT1l1U0hwMGhj?=
 =?utf-8?B?allsWkw4QlN0M2piS25Nekt2UUJiQVVXNnRpaWVpTVpNS21lTGlHWllKbTd0?=
 =?utf-8?B?Q1VjR1N6RkZQSWpDWWxMNkRzQ09yUVIwRW1KdlJZclEybktUekNtNTJkMkha?=
 =?utf-8?B?TXZrWXY4VFlCRnhFZ3hDUDBvaG1tUEp6c1ZWQlpIS1hmMGJlcW1SazBOekJz?=
 =?utf-8?B?RkZya1FZdm9ROWxzeWVLTEN2MFpoUnBxTDkrT05sWS9YLytOOVFWZHpXeExP?=
 =?utf-8?B?YnJxT3NNRHkrczVFMnhuZ0lwUVFGbUhFczNnMExxTkY2VGtXZWJ1ODlJNk9k?=
 =?utf-8?B?VjRyQ21xN0dhRjBXUzhrS0dPN3RSQ0c2d3BLYTUrMGlGYzVIUHMwQjBERmZI?=
 =?utf-8?B?WWh2R3Y2M2Z6eXBQdnN2MkpEOHU4clRBcnhRdDFMZDV5NEtTd204UUZaTTFq?=
 =?utf-8?B?Z0pTNW1OZ1N2NGFvTVQ2ZEtXSEI2aWRUYmxWTVoyTk9FYmVQeW5TM1Bub3dJ?=
 =?utf-8?B?alZ3UzlkdnY1dXI1bGpxUHU3NVBVT3lsRGhuN3V4Uy81czhFTjRYRy9pNk1o?=
 =?utf-8?B?YXMvdk11dHRoS2ZSSHRFTmxVdUQyZmoxbHd1b0QrbG9GeFppMjYvV1d2ZEhv?=
 =?utf-8?B?eTZJa0JzcnF0bFRGOEt6aGw0SDhRbnY4Z0prblpFL2RyRUFNbDRiZlBOc1A3?=
 =?utf-8?B?endvdHlUQ1MxazNRWTFMSTdGQUdnTEhFaDJtbVFKNU9nRUVnZjlMUFl6V2NN?=
 =?utf-8?B?bFVKSGtWb2QzVVFXSldGZmNTVlA4WGY2MVB0aDNGR0xGaExybmRKYnpXanJs?=
 =?utf-8?B?RWdOVVQ1QjZiRSt3VU1hZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkJYMVlFU0xReUlZL3BuOW04Nm9Bd1dJZjFMVmdFTjlUQ2FURHlLVmIrMTh4?=
 =?utf-8?B?L2dYenJ3L1VmR1phdFE4ZE1HdjJJc1JTRUxxdTltdlROTmQrUjlpQ3JKcjV2?=
 =?utf-8?B?ZWFXMHJkM2hRa3dzTlc5bmJycUdpQWJYWEo5VUhYYUIrQkY4ZXVzOCtyZDh0?=
 =?utf-8?B?REF6aXV1QzBWREpTc2tnb3diR25CeFlscEV0blUrYnEwYXBpOVk0cUIrNGhE?=
 =?utf-8?B?dFl1KzNveEM3Q05VTEIyb2l3ZGFScjNMcjJXdVc2aGFHMmYyZ3RpYXoxT3Ux?=
 =?utf-8?B?Vlg5c0duanNOTUxPSmVhNTloaWR3TzZlWjNuR0dDaE1tNFgyT21ESkM4cExF?=
 =?utf-8?B?MmwrbDhnRHU3bk1IVHZtREZpYlNobkZPKzdVTkJGc3F6VXdUUTVNV0hQcFVt?=
 =?utf-8?B?WDNDL2Jua0pyQTl5ZWw5b1c0eXQ0ZWExUXNpRS9XMittdHU3dk5Oa1FRQ1JQ?=
 =?utf-8?B?amYyMEszenR3RnZkbkVFa3FxL05FSnVuRDQwb1E4NkJkNktLRHhJSG00Nm5y?=
 =?utf-8?B?QkhqUzkzRnBNK0ZaNmE2Qm9LSlZlSDIrbG0wd1NNOStDejJHU2xrWkVFS0Rp?=
 =?utf-8?B?c1BxT1RsZEp5dTFSQ1YyTVc0R2d2b2ZXTzIyclhlRTl3MHI4NUlUMldUeTRv?=
 =?utf-8?B?ZTB5TXF1YkR3cmtFaXIrR0h0dWtWdjdmNnpLU0M4NHQxUVNRckIxRzI5TTVo?=
 =?utf-8?B?TW55dVpTWnZIaU9pRUFSRlJXMTJsY25BeDVjT2MvV0E1RUdJQ1l5L0U5WGRq?=
 =?utf-8?B?Qnh5bytvNDlFL2NQVGd0YzdTWEtPMjIyNFkyclV2U3MveFhNS0pjeFZ2eFNU?=
 =?utf-8?B?TlAvOXdQU3A5Vms4UE90SnhlUTBGaGdZVE80aFM3NkdrOHQ2UVI3NTZVVFZ3?=
 =?utf-8?B?dEJDVkVHd1FoN01MbEJJaHJ3aERQclVFSkV5cGE3RE92cFh4YytqclVBLzRS?=
 =?utf-8?B?RlhCa3ZVeFkzUlBQRkFBUTl1ZkFxOWg3OXNnT2tmRzlMWEtpRi9JYkVaT3VB?=
 =?utf-8?B?Sy9jNzI5OTdEUDVhblNubE1IeTFXamRCUmN5Y3BFVzhEb1RORjRUQngwclI3?=
 =?utf-8?B?K1M4WHlzbEZHeG91ek1pTVpxOTZoYWhGbjJLN3hRZVF2SlpaTVRmb0tyeU5q?=
 =?utf-8?B?aWdKcmdWRXplSHdOSXVGTVdWLzk0b0wxUGY4MUk0ZjdPaVVLdDBPQWR2U3Zh?=
 =?utf-8?B?ZDVFeTV3MTRONlZkSDRQYjVEZis5UmsrSmprejBPQ2JrU3BySTZQUGNBa0di?=
 =?utf-8?B?eXlraytjclJ6WlRrbkYvbnJqdHg4UHIzUnZSZ0lNQnpFWDVzcVBsd214SFF3?=
 =?utf-8?B?dnpManEyU0laVko1MGZTM1h1bHdBemp1Q2dBZmVKV2hsUkNUWkhnUlpUT3N5?=
 =?utf-8?B?b0RLL3Vwa2x5UVJwaE9yYlVKTkVHY05oNTBmM3Zsbk4xY044QjBMcVZrVHpw?=
 =?utf-8?B?NXlFcTJ3cTFaUDhuM3BIT3g5VkRVcVMxcnIwMndNeDUvNklLZElwcS9SRDJB?=
 =?utf-8?B?dVpHYXdPUGJxd1VXdWRoK1dYeGtKNFFPdTQyZDAzVjFOdmtjdk80cUJyMVFZ?=
 =?utf-8?B?aVgxQTFYRGxwd1pVbnBna2VUUWxHK1haR0x2bk9BUVE0RXZwUVh0S2k2QXpy?=
 =?utf-8?B?aDQ1dWJIMXJLSEtFL1lqV0hTWHJhZ0tWM2tXd0V2RHE5OVhldTNKakhQei8v?=
 =?utf-8?B?dW5kQTk3TGVkS1RVK0pzS3J4Rm44VXB0WUFhU0RkUDZhelNkTWRIL3Z3VUkv?=
 =?utf-8?B?WjVBL1pnY1pQMkd6Nm0rTVdFRy9FdGZlelhnUzBhQ3VkV2x3aUdmZ0xCMmlt?=
 =?utf-8?B?NDBWR1RrbWZ5NnVTMHQrYjVMaXp5bzZ2TGNtc0VCd21XMzJ1REI4azRzbmdI?=
 =?utf-8?B?N3hqWDBMZ0piQ3V5Q2RWOW5sQ3RPT0p3KzRuTmlSKzJIcWZjRjlVZ0FsckRX?=
 =?utf-8?B?ZFF1OFNXK0xCTHIraXBSTjlzY0YxN051VTh4L1pSaHA3cXc5M0FqM201dG4y?=
 =?utf-8?B?WmkwMk00ald1U1JJNkxwaTFnc1hNMjByMVdPdXBiMWZwSEtaR2tmM2tlVG4z?=
 =?utf-8?B?cVBkby8wem9nZnZTTEF6MkJLQXFDM25aRWs2ZjdaeUF2RDhTNloyaDg0NVhM?=
 =?utf-8?B?ajIzTG9hTWFNczdtM2xBd00zMURPNGxKL01DZDFUOGI0Q0RlcWtPMGNFRGdq?=
 =?utf-8?Q?KgQG/HkQldw1GBLtXMNV1rCtFU8pTzQ5LoO4mkytexsO?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50db208b-0eea-4d1a-1c74-08dc9d903349
X-MS-Exchange-CrossTenant-AuthSource: FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2024 07:49:44.5105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gSMQOTLxe79DesBP0W4sm1XfU5Fjt9w0KVTNeTG249LZfgz94XYrDErnsQ3wCdc25Tp8UqTM+oY38vT/AhzRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR3P281MB2031
X-TM-AS-ERS: 40.93.78.49-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28512.006
X-TMASE-Result: 10--18.635300-4.000000
X-TMASE-MatchedRID: oHOSwQSJZWhTzAVQ78TKJRhvdi92BBAuZ1bRaBl9Rq97dapstUT49xth
	E1jlBbx1oGmd6vxLX+RjAIBdY+qiQmqJJI5R6OiAXuXnuSLRLfw3RfriMbLZ1t0ZColqhj7/g42
	36eeMysQbr0uru2RIEmAtuUl9iJPDJR2IjGwE8FeDtrKaVShBjo9Fkvaqp8xt2ubnxCjreJ+rJj
	SbTE7N47K8gxjG3OQ3k4PD2ddIu+QDcBI2JS3GLfSusYC5w0DYOxqBq+vj4omxyj/WjSNt0+/Gu
	3EgFWnwS0Rwgj0pIs2aewO4M8FPU21wxb5KDmTJkh0LRDkkMBwPTLaWh3LIJP3OHhDjHDxxxt5u
	dGj+d82JL2xa61pjdQY3AEbvotO+6LWWRS861V9rAlSpuYY8Hdo+48giqZwn+ng65LLRQXGvngk
	jHjojpAP5R/zL3aImGTZsf6fQyicnef17+TmbzlYU7Lxeiw6GWa6vTkKxwrJiyuQOZndK/bpcTK
	sMs1ZR+gsSeW2jNCcew2qcqcVYijIaKjuYdgU7QjUAbSCjYr9zFOYZ7JQcs2gGZNLBHGNe
X-TMASE-XGENCLOUD: fe945c6e-7ae2-4423-b132-e9a6d44e06af-0-0-200-0
X-TM-Deliver-Signature: 9E39381842D3A5FCC924D40EF3AB3AEE
X-TM-Addin-Auth: FVxRIGzfd+W8CHvYzmkWUzOuRM+kV8cyLKq2WJ5KEtB4PaD765CNMtAtwcC
	YUUQMcsNF0TqdzBd861Lj3c8WdRPjUXP5SldqF7VDpqYh2rlctqqQ29ypbFgJnL5xzN6mCXlQu4
	Lsfi+hhC30La1qJxVzSbw58bxI/w/tWRPl8Weikat6mlJK+AM/QouMMgjNpcIWTMQNYnQKVeXCk
	8JUo3saxIRWcAL1F6oR3+Y/pXUBKEiMPIjDw72nF80vQkzj/6Ak2PenroJAhCTO5Xz1Cn9ODbKS
	tJRA9+B/7fnrHnQ=.WLpKnKYJPE7jlOIDyaxi1FV77kPG6Zayh9rxrvaPgs75RV7LIEYv7Yoe0T
	sqT/yOiUTlnQC5RhhM1Ox57e+/ivvFu4zC/JVRhBmG51M2LUNrPblbV5KzysCOGs0j0fAqf/aE1
	YGPRY6mZgFnMeIEbozIxHzjzyN69L7hH/cfCixYKWhfhwRHgxYiks7r6EnrWG0IDvviqFZ/P14Z
	dkTmZ4YEuteJyTypkEeWn6J/9WvTk9aV93Kz8GrorgsTLeJKH4Fz+b0ijwjKtO5xfBrss0mTJuv
	zVVaMZDe+AZCojbvFj5P8xOCd1RZdIDnOFWCU5mxsihXyi7anY+f/CiGCHA==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1720252186;
	bh=HYkD/iOYK3wXTncKxvTS5HBFB2HBCe7cdZ4yNFpqKfc=; l=3966;
	h=Date:From:To;
	b=Xbs0P3lO3CCS9LlVdTKGo37V3SAjrUI9PswfEbC9r4566FclxKlsIVo5uuIkiJ8D/
	 8U9JBcyK5pjkY5n96FAaoNrY2lpWqqqkYVJzzUhjZxdf7DDbgmz0t8Awh8gF8ujTth
	 qKiG0IlzNH6glMtNdlM3QU3QIeWZg0tRGcPvRODCkgnmiowIpScutsGxRYnUIxL5gI
	 +Eb5fiIMx0CqJXBR/qs8qqWFxjh+CcGroEcFalqL4i/W9vj63o6LO/o2oTYMu3GxnN
	 tuK3C//AGo0CMe+OySGe2ty4uCc3wGkjG1SUKyGQd85POLv8R2fRp6zhSZHpx32kK1
	 H6xWO0pDCNfoQ==

On 05.07.24 11:03, David Woodhouse wrote:
> On Fri, 2024-07-05 at 10:12 +0200, Peter Hilber wrote:
>>
>>>   A positive leap second will be introduced at the end of December 2016.
>>>   The sequence of dates of the UTC second markers will be:              
>>>                 
>>>                            2016 December 31, 23h 59m 59s
>>>                            2016 December 31, 23h 59m 60s
>>>                            2017 January   1,  0h  0m  0s
>>
>>
>>
>>>
>>>   1483228798.8 LEAP_PRE_POS
>>>   1483228798.9 LEAP_PRE_POS
>>>   1483228799.0 LEAP_POS
>>>   1483228799.1 LEAP_POS
>>>   1483228799.2 LEAP_POS
>>>   1483228799.3 LEAP_POS
>>>   1483228799.4 LEAP_POS
>>>   1483228799.5 LEAP_POS
>>>   1483228799.6 LEAP_POS
>>>   1483228799.7 LEAP_POS
>>>   1483228799.8 LEAP_POS
>>>   1483228799.9 LEAP_POS
>>>   1483228799.0             ← jumps back by 1s
>>>   1483228799.1
>>>
>>> So if the second 1483228799 repeats itself due to a positive leap
>>> second, your VIRTIO_RTC_LEAP_POS "in progress" flag is set during the
>>> 1st occurrence of that second, and not the 2nd occurrence?
>>
>> No. LEAP_POS would start only on the jump back by 1 s.
> 
> Gotcha, so it would be set for the duration of the 23:59:60 second, not
> the 23:59:59 second as I showed above?

Yes.

> 
> I added these to the structure and started trying to *use* them in the
> Linux PTP driver, and got a little confused. How is this supposed to
> work?

To use this information the UAPI needs to be extended (I suggest with a new
PTP_SYS_ ioctl).

> 
> I don't see how Linux PTP devices (/dev/ptpX) even inform userspace of
> which time scale they're using. Is it TAI? Is it UTC? If it's UTC, how
> are we supposed to cope with the TAI/UTC offset *changing*, as it does
> at the moment we're discussing? All I can find is explicit
> configuration of a hard-coded offset. I now realise I've been testing
> it with 'phc2sys  -s /dev/ptp0 -O0 -m' in the guest... -O0.

AFAIU this indeed needs to be configured manually if the PTP Hardware Clock
is the only interface.

> 
> So a PTP_SYS_OFFSET_EXTENDED2 ioctl returns 3-tuples of { system pre,
> reference, system post } timestamps. If those are just UTC without any
> leap indicator, the 'post' timestamp could appear to be *before* the
> pre timestamp. 

If the clock synchronization daemon knows through other means about the
leap second, it will probably choose to ignore such a timestamp. Otherwise,
using non-precise timestamps appears to be problematic.

> 
> Or if the leap second doesn't happen *during* a reading like that, and
> I'm getting paired readings of the TSC and reference clock every ten
> seconds, one reading is suddenly going to tell me that my TSC is going
> 10% faster!

AFAIU there are two ways to address this:

1) Extend the UAPI to convey the leap second information through the PHC.

2) The guest has another source of leap second information, such as
   up-to-date tzdata files, or NTP.

In both cases, a clock synchronization daemon should pick up this
information and initiate the leap second step. 2) should already work,
supporting 1) in clock synchronization daemons should *hopefully* be
manageable.

> 
> Is the onus on the consumer to spot the whole-second discrepancy and
> *infer* that a leap second occurred, and/or to have known it through
> other methods? Is the lack of explicitly support for this in Linux PTP
> intentional? Or am I missing something?
> 
> 

AFAIU for Linux kernel PTP Hardware Clocks there is indeed no generic way
to indicate leap seconds, yet. The ptp4l program can get leap second
pre-announcements through the PTP messages and AFAIU phc2sys can get the
leap second indication from ptp4l (which does not help our use cases).
