Received: from refb01.tmes.trendmicro.eu (refb01.tmes.trendmicro.eu [18.185.115.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0CE17555
	for <virtio-comment@lists.linux.dev>; Sat, 15 Jun 2024 09:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718443542; cv=fail; b=clWK3TDi1OMSzN2uT9kCLJ0oR4XV3X9WWqWjuYO99pWF435OOXxVej57MPfNxTqLzbOlJyo0Up37gPIQU0Qfn1zl4n7OHhSTQU4P/z1cmMngSCdebNI7xe4ms35RaTSNJc6NyJ0KXtrAfI35XAcyLG49vUJNColaLgMjK5SN64Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718443542; c=relaxed/simple;
	bh=rpg5vZXzBW7EkfOf/phk6dFCMdHKo60XiE1Qcp4cnN0=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o6qH6tDnPcqhiox5F8mE93UPtdjkuzvTMZqXSPFDMHaLOU6dvyuv9FkKDsSNWgpvDKSLVIci7vlN1oc/HCSWwe9ysxBI46lGSQ9prk2iFvWpWiDEYciXbJ3qMaWALLahwwUKxdqcGStGBUYrHzs/wefYFGQJQuMoepYKoF8k0pM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=kK705HFc; arc=fail smtp.client-ip=18.185.115.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="kK705HFc"
Received: from 104.47.11.168_.trendmicro.com (unknown [172.21.10.52])
	by refb01.tmes.trendmicro.eu (Postfix) with ESMTPS id 5BAA110030D14
	for <virtio-comment@lists.linux.dev>; Sat, 15 Jun 2024 08:31:26 +0000 (UTC)
Received: from 104.47.11.168_.trendmicro.com (unknown [172.21.162.72])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id C65CD10001756;
	Sat, 15 Jun 2024 08:31:18 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1718440269.685000
X-TM-MAIL-UUID: 534e98b1-39fa-4e3c-bff1-8bf95e65f998
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (unknown [104.47.11.168])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id A755410005BD6;
	Sat, 15 Jun 2024 08:31:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GrI3/xFOjJesYWevrw9BK8uFU+MCf4P23WLQOY76u89tQkZMhg77iYk19lbA3PN29YZ8zEMim8Fu8y+dC0Uhnc9OCL3QFOsDkyaelyMidieB17+pjRCSLVYDVlNedyf0A2n4tQ6BBTZ49fJihl/QN03fYI8uE4c+mDkLALge8+YFCl5WfhDaHdb6TQd2oS5ZMSoHrEUmZuxlqEba5JPvyw/88zdajAgd97ndOpBp5/aFWKH6ghy35G+DaNt4o898n7CnFWbCBforP1BeL+7OYU7j0L4yI1ymo+WtN7M//7vhzsi+pSdS/iHQIJ3k17k2/L8VxNCjQu+Pm6GBr/8TWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kv056p8Jg4rrrDTb2/wccJHSxPhS7S9QO82DVORZ6x0=;
 b=JCYxXsgehYsraSTQxY1XnM88iwSEh1XPKrPQ/10MB6vUfUmVKn1rexSezWfTiy2JGJ9Ll8f7XrDQUArxAUxckO7ouJO2XTIJMXUBB88rdZ3ippVlKI1uv/xxxdgNny7naIRFKcYuQn0/OtvCxmHp/mPu16VexaoIB/umm0dzQEmD9B2k74jzNqcB7rL+7hKYoz2iWbb907dAh5zOoSJZKnwifGNk1ozWox+DBRc9ltYBxVq+20CKt+WpdBPvbCR1guLbPNDPCJHDd9ROuHitvrilmyVsKtFSVTqk1zaWQDQER9yF0jhnEpGR93xguG8gNP5J51hFEr6LcNch9Um83Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <bc2febf8-6ab0-4dd3-96e7-c11c20b1f6e5@opensynergy.com>
Date: Sat, 15 Jun 2024 10:31:05 +0200
From: Alexander Gordeev <alexander.gordeev@opensynergy.com>
Subject: Re: [PATCH v2 0/1] virtio-media: Add device specification
To: Albert Esteve <aesteve@redhat.com>
Cc: virtio-comment@lists.linux.dev, Alexandre Courbot
 <acourbot@chromium.org>, changyeon@google.com, eballetb@redhat.com,
 daniel.almeida@collabora.com, ribalda@google.com, mst@redhat.com,
 gurchetansingh@google.com, Matti.Moell@opensynergy.com, cohuck@redhat.com,
 nicolas.dufresne@collabora.com, alex.bennee@linaro.org,
 Alexander Gordeev <agordeev@qti.qualcomm.com>
References: <20240607133508.1400529-1-aesteve@redhat.com>
 <CADSE00K5RjuLY1UKfPiAMXv=HWJC3hdp9yvo_t7yr9HqhAVotw@mail.gmail.com>
 <CADSE00Kcc-uVKYkNT-LHX3kQwmhQNLgKp8FRMrWz0hWg+e_c8g@mail.gmail.com>
 <21f91356-0ca2-47c9-a659-d73c768717e4@opensynergy.com>
 <CADSE00JDgn1aj8+kxY=7UXvM5Co_dAWxR93A1mQma28HFHKpDg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CADSE00JDgn1aj8+kxY=7UXvM5Co_dAWxR93A1mQma28HFHKpDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::8) To BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7::12)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEXP281MB0183:EE_|FR2P281MB2126:EE_
X-MS-Office365-Filtering-Correlation-Id: 558f9e6c-d4fd-4d3f-c9e6-08dc8d1580e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|7416011|1800799021|366013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1dlUFhMZCsvVk55YTB0dmd5WFlnUWozcDN3ZlhYWXdJczg0VzRpaVpmenlq?=
 =?utf-8?B?YTNzM3NJbjlPTHRqbEdQUlo1U2NHVEJjbCtOODJqK2FCc3ZYd1JBZU85RVNt?=
 =?utf-8?B?dFk2YTVaY3RibURsQUZwZWFWK2hmY09ZcWg1enBkdnJXbnFLaExpQWVYYkFG?=
 =?utf-8?B?RlkyNktlRmk0V3N3R1FVWFNtVjgrZkEveDNNMFdyM29vK2F5K2RBRUw5eklx?=
 =?utf-8?B?QktSckdEQ2hXUTE0S0d0Zy90bG84cHA0cE1hdkRPb1hWNDJBRUo2dmU5Y2hR?=
 =?utf-8?B?V0ZpL3JzZkFIL0tnTDVvNjNjVEJQWmRZcnVYQTNUU2R0QTYvMUROU1JNcWtD?=
 =?utf-8?B?Sk1yckxDYlY4MGd6RTBtYUZnOEJ0NkFvTGVJOVFQb1BTRnk4ejlnVlowWE16?=
 =?utf-8?B?eStycFpPbGNQUkJKT2cyOU0zSHE2Z2s5TDRzUVNqK24vSk9BelRqeTJyUlBT?=
 =?utf-8?B?TnhvSTRtaHRadFRoNDc1UTZHUlZxZ2hGM1ppVm9wb2I2M2xUS2QxZ3MrZFVx?=
 =?utf-8?B?bktSV01WYWZha1hQY3hrVUdUOGpPUTVuOGFTdysxRit5dzlwV0FjNGZsWHRN?=
 =?utf-8?B?d0F4VGY5RXlwclBVaHBlUkVhNG9lL3BVNHdLNUlzMkFHS3NrVGJzaXpHU1pS?=
 =?utf-8?B?SXQ3MktBc1FmREgwM1NYS2hNbVBsaXU2VkJ1OW1SWVAvVjhreDJIME1LMUFm?=
 =?utf-8?B?emwvNFlnVTQydmM1dmJRclVPMGZ5anZPNWp5bDhwV2JoUERVaEt5Z0hya2Ur?=
 =?utf-8?B?M09RVHBnTGs1cjdJNXhEcjRUazNSU1pwSFNTNGhwbUVXR0QvdE9uMEt4RlZW?=
 =?utf-8?B?cExucitGWjMxY3cxemtGOXI4dDhSYlBOd3NRK2xqUUZidWxWQlJOQWVwY1Fq?=
 =?utf-8?B?aHM5c29aenBHYmMzMjBLMnN0bk1EcGVoN2VtdVdyNzNyS1JTeUtkVWZITzhC?=
 =?utf-8?B?U0FYTmh6SSs2ZzkyQnVzYU95aXFSN2tvOEplU1JYVUMvVTZiU2ZjVW9ERlp2?=
 =?utf-8?B?ZGU4QjBrbDFNdzdIQTM5Tm80SkxRKzZWVEVOVVdjWW5KU01nclJISVorcm5P?=
 =?utf-8?B?WUIyV3A2SlpoL2RwZlVaUjVqMU1lYVFmdjlyMTAxQXVCUk5CbWFrYXkxZ0Fx?=
 =?utf-8?B?UGRHR0RkWGVDdWVtaU1pZlZQMjhiT3R6aVpuWXM4bFdpZWZ6RTRFVXBVb09s?=
 =?utf-8?B?YnFuRC9qTU1OcFhjQ0xsK0k2K3h5S1ZuTVZoS2I1T3B0bVRyZVJkNjhGVm1i?=
 =?utf-8?B?WmNTbnZwaVErcnlDWE51REkxM3RycW5sUUpPYkhBUXViQjFtSTFlZ3JnUDYx?=
 =?utf-8?B?K2NoYTVxYnBRcHRlYlo4MXVLT1hLUUxYcTEwenNOdGowc0dSQUttMFptMTVW?=
 =?utf-8?B?TXRqY0Q0SlMvWlpUcCs4VDFlcFh1NGdLaXhxbjNCVzFKNVQzZGc3ci9UTXB0?=
 =?utf-8?B?bWg5Qmk0Y2pCKythN014ZVVWSVhQcmh2YVF6SFliOGw3OWRQd2JGU0lubVFa?=
 =?utf-8?B?bm9VWmRoYW1ud0N0c0QvY0s1RDJwQlhVQmhsU3JxTDVNK0lFQ3FGdjFHd0p6?=
 =?utf-8?B?Ny91N280OTVTWGhlZ0gwakZnNGpFWVdDUzN2aUFGZjJsTndsUytiQjA0Q3FP?=
 =?utf-8?B?aXBSSEJ6M3RsdG1BYVpwS3dPUFEzZW9QOCtWU2Y1NWl6STMzYVhEUW9RRjJQ?=
 =?utf-8?B?TzdmWmhqeVk0TEVNZjhRWjlZSHYwdDdVZ2U0MjBDVnFtUlNwMG8ySThnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(376011)(7416011)(1800799021)(366013);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3cyOE5rSmpZVUFmS3VQRzF0SHN5RktpQlEwRkM1VVEydFFnRC9kbW5rcnQw?=
 =?utf-8?B?dngxd2hQQVdJb0xvamN3Z1QzUHdhOW5PTU9pRlhKc2dnT3p1ZjZnd2V5d1py?=
 =?utf-8?B?QldSWjBMdmc1STZJbzZvK0tJZi9CRGFRR294anM4b2l0NGpja1BUcWNwLzF6?=
 =?utf-8?B?Uk1obCtQUk5ybzJHREJYS2pYRElhUStJMDBOWmJuTDBtZEdjMnBxUDZZbG4v?=
 =?utf-8?B?b0xQS0xGWFRtbThPN0JLRnROVTJFYUxwNUJqVExGOHVuVUVtZWQ4YWJISVJo?=
 =?utf-8?B?RGJMUWxnNTQyMmF2M3cyRUdkZS9VTEEraFZWV0w5b2g4QVVRUk1JRHIxSmt2?=
 =?utf-8?B?dzZHWFRacXJLM2Z4T3pxVU1KRENNZW8ydDJNNEQ4WGhyVFdYdkRIMEdxMUVG?=
 =?utf-8?B?Q3diR0ZNK1hjcXlrb1pHbkJpZ1hnYkt0YUowN2JIVXEvREp6VGxpQkhJN2Jl?=
 =?utf-8?B?ZGdqbm81YVFEUDJOTlhUWjVGZWdpUHNETTQvamVDODJaa0tFUWF6NktZa2ZJ?=
 =?utf-8?B?MXplMHVtVlFwdXFQUUtKYkt5aUdZalhIOTRFREdvWWdpMno2U0Q0QlRXcmZk?=
 =?utf-8?B?bjI4S0FJa3FaRS8xVjlBcHFoUUZZQkNKVGpxUEtyd2NvTTJOUVJDSFFvazI2?=
 =?utf-8?B?RS9YeG9IeTBYZTQ4dWtEbkswWStlY1hYRGU5eWhZc09xZFYzczRxMGtDUXE5?=
 =?utf-8?B?K09kWFRWSnhYdW9NcjRJbjlPT2VYMHNxb3liMXZEY05rSXNOU0VoeFdPL2Mx?=
 =?utf-8?B?ZTVOaTJ6YUJBVUZRTTBEZ3UzckkxUzVzMGNjVWlna2NtRVM5NXU3a2tMM1k3?=
 =?utf-8?B?YnZFZHYwc09EeHROeXdFWEdKYzA1NjZiWmkzN1oxRFZmM3NiMzNGR055cElr?=
 =?utf-8?B?cjF3Uzdtb1VuSXdjVVJkbGZGZGFVdkxiOWdrc1YySDMwd0ZZT3R4MWNVUURo?=
 =?utf-8?B?S3NoSjE1M3FjcmhDdU1EN3NnNkcyKzdsRjBSMnZwYnZFeWUwV1pXTFppa2h0?=
 =?utf-8?B?dFFWQlBwT0JBY2RwS0ZrUmw4NXdPQnpCdzM3a1VGcEJhZTBKOHUrRnVZeCtE?=
 =?utf-8?B?S2pvL2xhV1hpMkdHK3FzVVhqUEkxOTlJdGxFeUpsU2ZCZ2w5UjJQYTJhRXFj?=
 =?utf-8?B?Mkd0UkFlcTQzMGdET3RZa3VoNEhuMnNKV09PcExHdTlTbjZXcjFRUUhzQjFv?=
 =?utf-8?B?a1Fqb2o0NFdYdnVoMHc1NlFGQ2w4WFRxRUo0QWlWZkIrTnJ2RkRLVDNBSHds?=
 =?utf-8?B?MlZwaUVNWjNIeWprRjFHbHo1bHJwcFZWWGNML2F0dVNscFdJcVByanhRWnFE?=
 =?utf-8?B?Ukl3blhnSWp2QlFMeTc0ZTdtSFROM2pkeHBpUkl6blVHeXZmTmVUNUtuR01F?=
 =?utf-8?B?dG9DR21pcnFUcThDbGV6cHMvVG9sYUxpMDBwQVVWRUYzczJyY0xZT0VndFZ0?=
 =?utf-8?B?K0xPeGt0R2NyeCswOTRtNGhYMWIwRzA0T2pwVHRJWk5JVWpNeTRoNzM1bnNk?=
 =?utf-8?B?eHluL1RaQ1NEQkUwRWI2azJVa3RTbE1ubVRONEJvZ28za29vNWY0eUhLWG5z?=
 =?utf-8?B?K3p0VW1yM1d6ZzhVTkt0cFdRa1N4eWVHdzhlSEo1dEZiNlR5V3VOOVluRzNs?=
 =?utf-8?B?dG1IUU5Ba3piZVVLdmVQbU5Zc3orenM0R2VmdEd2RTRUNHlJWnpUNWRyNjBF?=
 =?utf-8?B?T3QyYW84RTRXdDZ4bXovenR2eFZGSXBGK3h6a01BMTAycWlURlJjNFJ1S3d6?=
 =?utf-8?B?Mk54LzNhbE54SHhxc2xKdmdqT2dLT1ROUGY3ZzIwMnhYZHY1N3RYcGZrLzdG?=
 =?utf-8?B?YnkvNC9XRVZxNzlNTFJxdFZqUmJFUXpRQlprS0pTWlFVOSsxU0dJendtSmpG?=
 =?utf-8?B?LzBKT09JWTlITXEvNXhORmxiZDh3MEVyRHk3RzBYVlc0cmkyUjRCbnFFMkJ2?=
 =?utf-8?B?bGVSZisweUEwdzY0dEM5THVXRkJNdUtZRWtxOFhQNEpXU0ZPbkUxQnd3dllI?=
 =?utf-8?B?MlliS1ZaMjNoRWZrM1NWY2MxWXpRamJnaktxcm1KQmZmcitDdldLZXZGeGtQ?=
 =?utf-8?B?NFNLTWNxRmhPcW8zckhsWnhJVUxVWGFJSmhXazRZbTdRanRmVURQYUxVWGpT?=
 =?utf-8?Q?kNZKNp6B676T7nzVFMK5WJEkH?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 558f9e6c-d4fd-4d3f-c9e6-08dc8d1580e0
X-MS-Exchange-CrossTenant-AuthSource: BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2024 08:31:07.6905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yzk3HzcxAN7+BV+TsrrvxXF6cqxeQeM980lonvXQTNpJki+v5Q+hK1MYzQVRC9Sv0risU39JTEtCv11ZvZs6rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB2126
X-TM-AS-ERS: 104.47.11.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28454.006
X-TMASE-Result: 10--24.376500-4.000000
X-TMASE-MatchedRID: 0FbuSxFHrmnEeENaa6f3ipQ/7SF2k7HSDDgMha/WNJVtT5dsVizXEmQ6
	8uvIXW1et1APveIASG3vYJak0RJUxw5SUMZwjKbG74+fgHHc1auB7KF1cYE+v2txVUHuXeM7kFW
	5vh2vIHea1mkZKpmCWc1d2kIvnhPgj1KclCv3JuCiRRlLvgq6cQJCLBvbqknu59KGlOljPvuYdS
	+Ejz6sYl71pXn4zWPzNMoo72Ta+qEjqYdaW8/3vjAXtaS/K6C0Sr+cp4/vPz2WzpGKWacixM8NE
	ee6WY0A7odPl3EMwghr4I4pTWvHspPUWs48YIZH0fEwGdG8tx4Wd/c/Vdyl4GOKEs8foflONaaQ
	sf15i58JZ8bKkznFds5lZ3LpJTH3mYGJ1ru1xbK4fmCMI0rbAfsIJ9FNjq1IxgiPAz8l1ftHR2l
	d6S/pSaumPuzPINuKMusAEehbNyJdybk6PefGSlei7Fq6pZqWWGSYKNZi9aVS1vM/0iAx5bptNW
	5V/NKLkggu20h7flZ3eSbZTF71YtCREZHEziyGxc32rOGXVhx1BsIDKQbH5GTbCITnGjLQqWgfI
	MWloSx0iUHy4XG7U2g0ROP4MC0lB+2jIf8+iYDXA8B5c4JukVjUP7Z6OXb0GfP6Q7XnYofxpEMw
	YGtScqWEmd1yZLej7E74A5K07wqKqzSn7sOPwgLNzeEfuThQRzJIy5pYK7DOKm7oAxeFFTLg2Km
	Wy/v60yGbENWCzIiLHOqU1wzB0Aujn4Yl1p2qMz6FU0Vf4JDs+7E98/tcIOKyfRqSYeXhKPSY36
	LAMVmFYSwFno7LSdaAH0Wc+ImIynqv1hVDlo9BaexKSVX9rjmoMBkrmuf/mCYM4MaoFU97wQPQv
	9XohSI+KGBvwjpRRatw4vj6F2bVzTgENjEotiKEieE3T4vHpa3EDSoNNvSJkcezle6Ws3hjRNft
	OUC/O/mB2+12nNVaOxpgjiWHdQKmARN5PTKc
X-TMASE-XGENCLOUD: 8e9068ba-9f03-44b1-a2a9-c2bd7d828cfc-0-0-200-0
X-TM-Deliver-Signature: A411CF0E46CB9440A702C1ADC749FE08
X-TM-Addin-Auth: 7nIAfPKhdZl151KhDVYPnQZD/Kzul2cdk4IZIP4tleKmNjk+eHrmkZL8l9v
	B5wVLXI4bu8piD+p+aVDWFhoiIx0EL5H+ha02drzvWuNy4D7sOAzJI94klTdkvlLy7F/ia4qAZF
	hgiA+7T1975iZyjX9njr/nukFGDFz5Duga1KaJdFThn2rBvshaOaQn5D8nqpGX5qStwexdx7YKB
	KDFjr7khvrzuSHw1fOBpeVsVunB7g/KKJVZHIZxqgk12CuznjgHHGsO5SmqEsx8xRaa/g4jVcC+
	2ZVttRwSU/fvXzs=.D50X9OCSVi+K80rBoGYEiGTQOkNjH87tZcvOlMuh6Pj95hiFG8HiyhRBaJ
	X8pEQAX8FzuypPmZ2uhPsVZm6q1GxEuenezIRyNfLMdpofOCzTRyW6avN6wuHZkQhmwKNjUbruc
	2Y888AcAn3FETW39hKAAnbJE549ywDwZ3PeaFfclgyC1htXDV/S78721sikbNnKVGvbB8RFqQZs
	nFwtXNV2PdJrO1+c84XCuOiRN6mu/KMWxHPCk/oB0ZPfGILIZAIYw8D72pqokP3ZrjY5WZqz03S
	+Kz57CdG6Tm8eIRQyucwXvQVQBCI7iYATgOBE7fORmdtAy17+MEz8exH5kw==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1718440278;
	bh=rpg5vZXzBW7EkfOf/phk6dFCMdHKo60XiE1Qcp4cnN0=; l=18363;
	h=Date:From:To;
	b=kK705HFcI925JosYCMSY8M5NEMjwW8lLlZgDR5fAJ9XiQslzwhlG0VdB239WvGnub
	 NEXiXCWUrnJAxzi5mb68MXp+jw08WI8Yo6g0NrfvGcRqUAiPQUhcZ6+ccVUP1JLDim
	 vfL7cphaWqchTfO+76DEBdnwIrCWpf0w9uQHOC1t/+0uHMoRBU0TJjPoa8pfOaPI0K
	 hoUa1hoAKpevn8QpUzqdL3rkc6A5E0cuCCbx4UnyKIGurPCZ/fdrtlIPUVkRZLh47h
	 wgigNQTfL7D1rUqLknOat8w3DVIsEy5w+RyCIxbaUS4L22KlXbmIMACpDWR+eIy55B
	 K1e1rXBzjPWlQ==

Hi Albert,

On 11.06.24 14:24, Albert Esteve wrote:
> Hi Alexander,
> 
> On Tue, Jun 11, 2024 at 12:10 PM Alexander Gordeev 
> <alexander.gordeev@opensynergy.com 
> <mailto:alexander.gordeev@opensynergy.com>> wrote:
> 
>     Hi Albert, Alexandre,
> 
>     On 10.06.24 11:24, Albert Esteve wrote:
>      > Just saw Alex Courbot's point-per-point response in the previous
>     thread.
>      > I'll link it here, as I'd prefer to move the discussion:
>      >
>     https://lore.kernel.org/all/CAPBb6MW36YaZFaWgksePQ=fMC7QffJD6ZpHN-iSzhLYp9Ho0sg@mail.gmail.com/ <https://lore.kernel.org/all/CAPBb6MW36YaZFaWgksePQ=fMC7QffJD6ZpHN-iSzhLYp9Ho0sg@mail.gmail.com/>
>      >
>      > Again, sorry for the confusion.
> 
>     I think I'll quote Alexandre's email and respond to him below to
>     have it
>     in the new place.
> 
>     Replying to Alexandre:
> 
>     On 08.06.24 03:50, Alexandre Courbot wrote:
>      > On Fri, Jun 7, 2024 at 10:29 PM Alexander Gordeev
>      > <alexander.gordeev@opensynergy.com
>     <mailto:alexander.gordeev@opensynergy.com>> wrote:
>      >>
>      >> Hi Albert,
>      >>
>      >> On 07.06.24 10:00, Albert Esteve wrote:
>      >>> Hi,
>      >>>
>      >>> This a formal attempt of including virtio-media
>      >>> device specification.
> 
>     The thing is we already had a long email discussion. Unfortunately it
>     didn't help to reach a consensus. You asked Cornelia to organize a
>     meeting. So she did, there were a bunch of virtio and V4L2 experts
>     invited by her. We both had an opportunity to bring our own experts to
>     the discussion and to present our points of view. I presented the same
>     arguments listed below in this email.
> 
>     I clearly remember, that all the experts told you, that you're going in
>     a wrong direction, if your goal is standardization. I don't know what
>     can I add on top of this. I think it is time to take the opinions of
>     the
>     experts and these arguments seriously, and stop pushing.
> 
>     Has anything changed since June 2023? I don't think so. I promised to
>     continue the virtio-video development, I provided two drafts. I think,
>     the last one addresses all previous comments and I'm myself satisfied
>     with it. I'm also working on the driver update, I've published some
>     intermediate results. You promised to make a downstream specification
>     and implement it, you did it. Great, everything went according to the
>     made decisions so far.
> 
>     You know, virtio-video is not a toy project too. AFAIK you can
>     literally
>     go and buy a mass market car with virtio-video on board since 2021. So
>     our device and the driver are in production for years. Yes, the driver
>     is based on draft v3/v4, there are problems, it needs updating. It is a
>     work in progress right now. I hope to bring updates within a few months.
> 
> 
> It is me who wanted to push for standardization. And I already gave
> the reasoning. It is not my intention to torpedo virtio-video efforts.
> I wish they did not split. But I now hope they can co-exist
> in the VIRTIO standard, each covering specific usecases, and yeah,
> with some overlapping.

Thanks for the clarification. Personally, I'm not against merging the 
device specs even if there is some overlap. There are clearly use cases 
for both right now. It is embarrassing that we spent so much time 
discussing them as if it had to be one or the other, and even made a 
decision, only to go back to the beginning again.

OK, let's imagine they are both going to be in the spec:

1. I assume the presence of virtio-media must in no way exclude the 
development of virtio-camera, right?
2. It would be great if we could agree on guidelines for users to 
reasonably select one of the overlapping specs.
3. Both specs should be merged together as part of a single common patch 
set to make things fair.
I think this list is more or less fine, but please let me think more 
about other possible points. IMHO first this should be outlined as a 
detailed plan and then the plan should be voted upon, assuming there are 
no objections now. If this works, it would be really really exciting. 
What do you think?

> Let's keep the discussion technical, to try to improve the specs :)

I'm not sure it is possible without people equally actively reviewing 
virtio-video. :) I'm definitely in favor of the technical discussion 
too, of course.

>      >>> Virtio-media came from a discussion on virtio-dev
>      >>> mailing list, which lead to presenting virtio-v4l2[1]
>      >>> specification as an alternative to virtio-video.
>      >>>
>      >>> Later, virtio-v4l2 was renamed to virtio-media[2]
>      >>> and published through:
>      >>>
>      >>> https://github.com/chromeos/virtio-media
>     <https://github.com/chromeos/virtio-media>
>      >>>
>      >>> The repository above includes a virtio-media driver able
>      >>> to pass v4l2-compliance when proxying the vivid/vicodec
>      >>> virtual devices or an actual UVC camera using the
>      >>> V4L2 vhost device (available in the repository).
>      >>> Steps to reproduce are also detailed[3].
>      >>>
>      >>> There is some overlap with virtio-video in regards
>      >>> to which devices it can handle. However,
>      >>> as virtio-media will likely be the virtualization
>      >>> solution for ChromeOS (already landed into the chromeos
>      >>> organization) and possibly other Google projects for
>      >>> media devices, it would be desirable to include the
>      >>> specification in the next virtio release despite
>      >>> the aforementioned overlap.
>      >>>
>      >>> The device ID in this document differs from
>      >>> the ID in the virtio-media project repository.
>      >>> And it will probably need some discussion on which
>      >>> would be the correct definitive ID.
>      >>>
>      >>> Full PDF:
>     https://drive.google.com/file/d/1pNCFP06VoV8Zuyx0aDVQ7HAT4xp-pZ0a/view?usp=sharing <https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2fdrive.google.com%2ffile%2fd%2f1pNCFP06VoV8Zuyx0aDVQ7HAT4xp%2dpZ0a%2fview%3fusp%3dsharing&umid=27cf87f3-325b-433c-ad31-9a67a735f346&auth=53c7c7de28b92dfd96e93d9dd61a23e634d2fbec-323bfac486c2d18aa0491476b4ae06765f5da7e5>
>      >>> PDF with the media section only:
>     https://drive.google.com/file/d/1sn3NUUeCm46zVyJKHkpytTIgGw1fUt5T/view?usp=sharing <https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2fdrive.google.com%2ffile%2fd%2f1sn3NUUeCm46zVyJKHkpytTIgGw1fUt5T%2fview%3fusp%3dsharing&umid=27cf87f3-325b-433c-ad31-9a67a735f346&auth=53c7c7de28b92dfd96e93d9dd61a23e634d2fbec-0e87247aa6bb7ae56721dccc96b49eff785f0151>
>      >>>
>      >>> [1]
>     https://mail.google.com/mail/u/0?ui=2&ik=73ebd65ebd&attid=0.1&permmsgid=msg-f:1767388565327924962&th=1887068940754ee2&view=att&disp=inline&realattid=f_libalimc0 <https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2fmail.google.com%2fmail%2fu%2f0%3fui%3d2%26ik%3d73ebd65ebd%26attid%3d0.1%26permmsgid%3dmsg%2df%3a1767388565327924962%26th%3d1887068940754ee2%26view%3datt%26disp%3dinline%26realattid%3df%5flibalimc0&umid=27cf87f3-325b-433c-ad31-9a67a735f346&auth=53c7c7de28b92dfd96e93d9dd61a23e634d2fbec-eb99848afb29b5bb784fc4feea4af75f88b34acd>
>      >>> [2]
>     https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg12665.html <https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2fwww.mail%2darchive.com%2fvirtio%2ddev%40lists.oasis%2dopen.org%2fmsg12665.html&umid=27cf87f3-325b-433c-ad31-9a67a735f346&auth=53c7c7de28b92dfd96e93d9dd61a23e634d2fbec-0ae7cf33c4a9b38d4121fcdc95b8df11495ccc2e>
>      >>> [3]
>     https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md
>     <https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md>
>      >>>
>      >>> Albert Esteve (1):
>      >>>     virtio-media: Add virtio media device specification
>      >>>
>      >>>    conformance.tex                           |  13 +-
>      >>>    content.tex                               |   1 +
>      >>>    device-types/media/description.tex        | 578
>     ++++++++++++++++++++++ >>>   
>     device-types/media/device-conformance.tex |  11 +
>      >>>    device-types/media/driver-conformance.tex |   9 +
>      >>>    5 files changed, 608 insertions(+), 4 deletions(-)
>      >>>    create mode 100644 device-types/media/description.tex
>      >>>    create mode 100644 device-types/media/device-conformance.tex
>      >>>    create mode 100644 device-types/media/driver-conformance.tex
>      >>
>      >> I'd like to add some general considerations:
>      >>
>      >> 1. virtio-media device capability discovery is very chatty
>      >>
>      >> V4L2 requires potentially hundreds of system calls to get the
>     full view
>      >> of the device capabilities. This is inherited by virtio-media.
>      >> AFAIU V4L2 developers agree there is room for enhancement here,
>     see [1],
>      >> [2]. Also I've been told VIDIOC_G_EXT_CTRLS/VIDIOC_S_EXT_CTRLS were
>      >> added for similar reasons.
>      >>
>      >>   From the point of view of virtualization developers like my
>     colleagues
>      >> and me hundreds of hypervisor "exits" are excessive and costly.
>     It can
>      >> noticeably increase boot times, which is something we fight
>     against in
>      >> automotive. AFAIU other virtio developers agree with this, see [3].
>      >
>      > There is a simple way to mitigate this: allow an arbitrary number of
>      > commands to be submitted by the driver with each command buffer. The
>      > host processes the commands sequentially and stops at the first
>     error,
>      > if any.
>      >
>      > That way, when enumerating formats, the guest can place a bunch of
>      > VIDIOC_ENUM_FMT ioctls covering an arbitrary range 0..n in its
>     command
>      > buffer, and get all these formats in one vmexit instead of n. In the
>      > case of a video decoder supporting 5 input formats, all the formats
>      > are enumerated in 5 exits.
> 
>     I don't understand how could you end up with a fixed amount of vmexits.
>     When I try to count with the batching as you wrote, the results depend
>     very much on the amounts of supported coded and raw formats. I can
>     easily have 50+ vmexits on our hardware.
>     And of course it only gets worse with the encoder, because you have a
>     lot of controls to query.
> 
>      > Having this option could also enable other optimizations, like the
>      > guest being able to queue all its CAPTURE buffers in a single vmexit,
>      > although I doubt this would result in a noticeable performance boost.
> 
>     Queuing of many independent buffers is already supported by virtqueues.
>     You can simply queue a bunch of commands, but trigger an interrupt only
>     once.
>     The problem with the device capabilities is that in many cases you have
>     to get the results of the previous command (batch) before you can
>     submit
>     a new one.
> 
>      > But at the very least this should address concerns about noisy
>      > enumeration. I haven't noticed any slowness due to format enumeration
>      > with the current scheme, but the option is trivial to enable.
> 
>     Well, I discussed the hack you mentioned and other ways to squeeze V4L2
>     in virtio with some very experienced people in my team. Everybody says
>     this is simply not the way how it is done in virtio. I think we both
>     heard the same thing in the meeting a year ago.
> 
>      >> In contrast virtio-video has been doing this in one command from day
>      >> one. Yes, the data was incomplete. That's why in draft v9 I
>     added TLV as
>      >> a way to store all possible capabilities. I hope the linux-media
>     folks
>      >> could take a look on it. Maybe this is something, that can be
>     adopted in
>      >> V4L2?
>      >>
>      >> 2. virtio-media has a hard dependency on V4L2
>      >>
>      >> There are certainly some "patches" on top of V4L2 in
>     virtio-media, like
>      >> the representation of the extended controls (which actually looks
>      >> similar to the representation of the controls in virtio-video) or
>      >> VIRTIO_MEDIA_EVT_DQBUF. But how far can this go? Is it OK to add
>     your
>      >> own ioctl ids in virtio-media?
>      >
>      > virtio-media doesn't add any ioctl ID and the extended controls use
>      > the same structure as their V4L2 counterparts.
> 
>     Have you considered adding an ioctl ID to get all the device
>     capabilities as a single blob?
> 
>      >> AFAIK the linux-media maintainers have been overloaded for
>     years, see
>      >> [4]. Would they be happy to deal with the additional
>     requirements? Would
>      >> virtio community like to have a dependency here?
>      >
>      > The burden of having a couple new events in virtio-media seems
>     lighter
>      > to me on the V4L2 maintainers than the one of having a whole new
>     video
>      > protocol to maintain.
> 
>     You've always wrote that virtio-video is the same thing as V4L2, but
>     now
>     it is a whole new video protocol all of a sudden.
>     In fact virtio-video allows to use the controls from V4L2, for example.
>     Also the general flow is aligned IMHO.
> 
>     I meant the potential new requirements for the V4L2 UAPI. I think it is
>     a much more sensitive topic compared to only one of the many
>     drivers. It
>     is true, that the burden is going to increase in any way. But I
>     wouldn't
>     try to speculate on this, I'm not a V4L2 maintainer.
> 
>      >> 2.1. an example: format modifiers
>      >>
>      >> There is a patchset aiming at unifying V4L2 pixel formats and
>     extending
>      >> them with DRM format modifiers. It is now at version 7 submitted in
>      >> 2023, see [5]. The first version was submitted in 2019, see [6]. Not
>      >> merged yet AFAIK.
>      >>
>      >> In virtio-video I just added them in draft v9.
>      >>
>      >> I'm absolutely not trying to criticize here. I just try to highlight
>      >> that there is a lot of legacy and the process is painful. Right
>     now we
>      >> have an opportunity to design a new API according to the current
>     state
>      >> of the art of the stateful codecs.
>      >>
>      >> 3. uncertainty with cameras
>      >>
>      >> AFAIK there is still no agreement about how cameras should be
>      >> virtualized, see [3], [7], [8], [9]. virtio-media provides
>     support for
>      >> cameras in a specific way, which might not be desirable.
>      >
>      > There is definitely an agreement on how cameras should work on V4L2 ;
>      > and thanks to that you can operate a camera using virtio-media,
>      > *today*.
>      >
>      > I'm sure the virtio-camera specification, driver, and host devices
>      > will be very impressive once they are released ; it's just that I
>      > would enjoy a solution, however imperfect, within my life span.
> 
>     Well, you have the solution now. Nobody stops you from using it.
> 
>      >> 4. (minor) is it possible/hard to implement the device in
>     hardware/on a
>      >> micro controller?
>      >>
>      >> This is something I thought about recently, there might be a
>     use-case
>      >> for it in the future. One of the concerns is that dynamic memory
>      >> allocations are IMHO inevitable in virtio-media or virtio-video
>     up to
>      >> draft v8. I think multiple virtqueues in virtio-video draft v9 would
>      >> help here. Not sure yet...
>      >
>      > V4L2's MMAP buffer type has that covered.
>      >
>      >>
>      >> There are also other minor concerns, that are probably tolerable.
>      >>
>      >> [1]
>     https://lore.kernel.org/linux-media/20230922100303.GF19112@pendragon.ideasonboard.com/ <https://lore.kernel.org/linux-media/20230922100303.GF19112@pendragon.ideasonboard.com/>
>      >> [2] Page 6 in
>     https://hverkuil.home.xs4all.nl/mediasummit2023-pdfs/Hsia-Jun%20Li%20-%20V4L2%20M2M%20EXT%20API%20enhancement.pdf <https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2fhverkuil.home.xs4all.nl%2fmediasummit2023%2dpdfs%2fHsia%2dJun%2520Li%2520%2d%2520V4L2%2520M2M%2520EXT%2520API%2520enhancement.pdf&umid=27cf87f3-325b-433c-ad31-9a67a735f346&auth=53c7c7de28b92dfd96e93d9dd61a23e634d2fbec-226bace75039ec8e39915f0f47af3bbfefe2c492>
>      >> [3]
>     https://old.linaro.org/blog/the-challenges-of-abstracting-virtio/
>     <https://old.linaro.org/blog/the-challenges-of-abstracting-virtio/>
>      >> [4]
>     https://lore.kernel.org/linux-media/4b6b1355-9baa-ff1e-e1c0-89dfdc83ad04@xs4all.nl/ <https://lore.kernel.org/linux-media/4b6b1355-9baa-ff1e-e1c0-89dfdc83ad04@xs4all.nl/>
>      >> [5]
>     https://lore.kernel.org/linux-media/20230206043308.28365-2-ayaka@soulik.info/ <https://lore.kernel.org/linux-media/20230206043308.28365-2-ayaka@soulik.info/>
>      >> [6]
>     https://lore.kernel.org/linux-media/20190319145243.25047-1-boris.brezillon@collabora.com/ <https://lore.kernel.org/linux-media/20190319145243.25047-1-boris.brezillon@collabora.com/>
>      >> [7]
>     https://lore.kernel.org/virtio-dev/87354dtp30.fsf@linaro.org/
>     <https://lore.kernel.org/virtio-dev/87354dtp30.fsf@linaro.org/>
>      >> [8]
>     https://lore.kernel.org/linux-media/00f53c06-e66d-aa46-ca4f-c3baab6cf455@xs4all.nl/ <https://lore.kernel.org/linux-media/00f53c06-e66d-aa46-ca4f-c3baab6cf455@xs4all.nl/>
>      >> [9]
>     https://lore.kernel.org/virtio-dev/CAAFQd5BrhDZtFX3vdhBVSLXthe8CykYsZzVQ9ddZxVNvNS3ArA@mail.gmail.com/ <https://lore.kernel.org/virtio-dev/CAAFQd5BrhDZtFX3vdhBVSLXthe8CykYsZzVQ9ddZxVNvNS3ArA@mail.gmail.com/>
>      >>
> 
> 
>     -- 
>     Alexander Gordeev
>     Senior Software Engineer
> 

-- 
Alexander Gordeev
Senior Software Engineer
