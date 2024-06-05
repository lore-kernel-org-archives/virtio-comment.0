Received: from refb01.tmes.trendmicro.eu (refb01.tmes.trendmicro.eu [18.185.115.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEC1139D00
	for <virtio-comment@lists.linux.dev>; Wed,  5 Jun 2024 17:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610121; cv=fail; b=WqG9UExGJ83Q63hoviUv0T7GjT8GAnKrivomhQlAIScUpSSPMMnnxr8/9hU9XrueBLnKYu+WRBebDlmo1EkioZ6uTcQErXzuxy6a+UBBFBJpHNONDtWUF6vRumwn2SJY5FhWRwgFmCx21sTNHLURqDvAS9QSThk9VM2dxYW90u0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610121; c=relaxed/simple;
	bh=+09bcO65J0mCk5mniKEs99BC7OvGbnJtsMvsHiaUvRQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=asA6MQfkL2h4TzwUbcawcIec8KkiknVjmyDPewwqUTlwunR6dDSt+zBCqAwnCvGuyLa5aOTjSCfiwMfa0tHKHwVzR0wyNVEiJt+oBttvP1mJXpfjC2+42JYNH31SSeNoY/5s0RlKNhcornBN3BoP2sRvjheFRpJ53HFyyetkTI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=P8OFULKU; arc=fail smtp.client-ip=18.185.115.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="P8OFULKU"
Received: from 104.47.7.174_.trendmicro.com (unknown [172.21.9.37])
	by refb01.tmes.trendmicro.eu (Postfix) with ESMTPS id E398110180764
	for <virtio-comment@lists.linux.dev>; Wed,  5 Jun 2024 17:55:16 +0000 (UTC)
Received: from 104.47.7.174_.trendmicro.com (unknown [172.21.192.213])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 67D92100004E5;
	Wed,  5 Jun 2024 17:55:09 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1717610108.910000
X-TM-MAIL-UUID: e02f13af-1da7-4f6f-a196-974bd042c92f
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (unknown [104.47.7.174])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id DE48D1000040E;
	Wed,  5 Jun 2024 17:55:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1GncVLOknNuXMXj1zu4E6aWQPDz+gnqGsVYyeHrZnwqArpppBMhTXHOa64yETskD1ZiXmSzw1XluVBEb+hwfRT8b5Ak2dT9slsFfncGbTkml62L9bhUK616G5/6rbIfxBMpAOqocFRfCJkRXAKvGYreT50O0FpKqGF9JmzlX8QPcuyGZ/qnYhmONoZro779fYY3BzOwQwMS/Iu9ufhOX1TWBkUwMl/bJozwW3VnFTD/nMSz1y/knCiPC6yzVtj7YnjYRPWp4Dyd5BuNNEnqf8lJIoK2VEajNKgRhrFoXla41nmuxcdN0rUhfTr4uUnDj/1WG+PqkI+7nMUebeCFYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4K7jf8EfAsKI/ajTA2HR7AMvwONY69+tHvp2dgHKIw=;
 b=b71LUP60UQBDfMvWNCmal88FtlCPXL8sG1Dahd716q0+yr/EWGjaQGnGYZfgc2OmDeHoajyNA4LNW/VsE6i7Kz1k0c0nc14CbfhSXNZMLInF057dAwS656eBl5vXHGUDe5jc8PaxbAgKaBi3b5qH9XkXdOFKDGvXGfaeo0OXl7rqnz5Zag4VUcrxyj2zKsnusP6FAXL+tNG5iKaiG5Qb0KfglMGWIh1v8kXnAC4OcygQ20udRAQ/HA/I1z9QQ94erxXIO9TXJphmHWTCZasaXFS+G0NgCBRSwobLQxv2EnwbElWsu8auUJH0r9D2sDRYDe7/ZejyhCIop9tASTF9AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <2e87edd1-897f-4969-a479-3b1b59529ec1@opensynergy.com>
Date: Wed, 5 Jun 2024 19:55:05 +0200
Subject: Re: [PATCH] virtio-can: rephrase notification mechanism
To: Stefano Garzarella <sgarzare@redhat.com>,
 Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev
References: <Zkyr3eaCOctSn7BD@fedora>
 <7wfenngxylsnl73xnspd7r7icc5upuopxcr353tddxpiqlcp2o@4juhjr3m4m3v>
Content-Language: en-US
From: Harald Mommer <harald.mommer@opensynergy.com>
In-Reply-To: <7wfenngxylsnl73xnspd7r7icc5upuopxcr353tddxpiqlcp2o@4juhjr3m4m3v>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::6) To BEZP281MB2376.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:44::7)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB2376:EE_|BEZP281MB2882:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e5c2b86-bfdf-44b6-cd85-08dc8588a2cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2thRE1Fa3Azd2ZsdHZOaDE4Y3EyM0NXM1UwZ1BrOUllM2FiUjM3a2JLSWlk?=
 =?utf-8?B?UVpKc2dncU81Sk9ScGFOUkxRM3pwb2pIdGdoZnFBZEdBSU5lbWprY0EwMVg5?=
 =?utf-8?B?Z0c4K3Z4WkZqTFBYZmJVTDE5S1dKK09xa1l3bk1QQWdhaWZ5SzNzQjVZd0Nz?=
 =?utf-8?B?RFFUOWtvTjlVNmp5VVdkL09lQitFNkxPSmJseU1xRkRFRm1rc2lFTHROTHJx?=
 =?utf-8?B?UTJsM0EvcjdRMTRqYjZzL1N3WnpCaUtOT3JWUFlXeHpmbXp1d0RybmZUSHFv?=
 =?utf-8?B?dFY5K0xPZDhXYWlsQlJyaDB5bjZISFZzS3VqZjZHZXhRS3djZmppUWE4dnlW?=
 =?utf-8?B?WG8ySHFrWE5aUG5ZMTZ5VUFkUlgvbXNuYlYyVkhPREgxTzROQnJweVZlQnI0?=
 =?utf-8?B?K0VkMnllWFluZzMyQTFvUVJNMjBzNGloUUpPcmsrYVgyN2JCeE0wdEg4cmZY?=
 =?utf-8?B?cHROclVIOFVKTzVvQTk4TGo4Q2R4TGZmaWorN2VJQ1dNNkdzUnhabW84RFNk?=
 =?utf-8?B?R0hZMXAwREIxTUpwREtaZ0EybXlFUFU5bTNkR0djd1NLU2hxelN2Z2lrYm1S?=
 =?utf-8?B?RkRmbUd1ZXYzQ1ZiQklWcTJmc0hwVzNQRVNpUk1wQllweUFkY1NCWVVtZTg0?=
 =?utf-8?B?UmFqa3RCSnRoRU5JQ3NHTGdKOVlQUTZCOS9yTU55MU9mYThYTTZVdzlHbXI1?=
 =?utf-8?B?ZG5rN1QwVnpzeUlTQ01YZzVkRVIxdVg5S3poaFpIcFY4aHJBVDZ3andBSUlI?=
 =?utf-8?B?VFNPZTBTbmtkeDRwSVhZYXMxYUZLQnVmZ2w5cy9aUUl3TksxM1FWbUtTSXBx?=
 =?utf-8?B?RHVtVXNQSVRSVXpIWmh4L045c0dxQjRvczBQdmpwdnRkVWVSVFhkN2cySDda?=
 =?utf-8?B?RUFNMW1MMUp6WW91VmhxcXI3TmIyNEllekZIOE1CWUNJUGdXdWF1eFRKbW5o?=
 =?utf-8?B?cjRPcUxGSkkvNDEvcUpYQTU0b25TWENidFVkb3krRGsrdDV2YVBJOGI0R3hD?=
 =?utf-8?B?TDE4cEpiclZ0R3NQZGVXNnlBbmh1NUFVckZPWFVoRlQ1Mm02eW1CLzZ4WGFH?=
 =?utf-8?B?cjFIRWtiVzY0aFBRMTdmc2lxVFE5OSsrZk9xYU4vQ0lIQ2FaUER1MzhhNHVw?=
 =?utf-8?B?VmlscVhUNEJtVFo5SzB5MHllK0VHMFhiSHZ0d2x6K0xLOVkwaEM0bVoxanVq?=
 =?utf-8?B?QjB1UzZ5NGt6dGt5RnpxV2JCWVpuVWZMQk9CdUNqMUhlNnFDOXQrakxmTXgx?=
 =?utf-8?B?ZUcxSHVFSnpsNmE3UEpTU3RKa21NV0FGelR5VHh1aXliUGpLbE1uUmtReTYw?=
 =?utf-8?B?bjRPUkYyYm5rU0ZScHIzakJFbmEvRS9iZnZUTHl2SXdHSXBmeDJYRllGL3RQ?=
 =?utf-8?B?aW1ZVmVqNHlTYi9mR2ppWm9mSFBHQkQ2MS9HSHdqY0dTaDNEMzYxUExRZFFQ?=
 =?utf-8?B?QTJ3OWpZZ2xxODNvcno2Z1dHSk5pTXZFRm84djgrL01uQ2hnK1NBQ0NMb000?=
 =?utf-8?B?S3BrTGkwTkhld3lNZU5kWS9jaWxhSkcrZlRLZ0tKVGRxZHBESk9kaWRPMkxG?=
 =?utf-8?B?d0dVdzEyaVl6bk9SVDNLZ1VmT1kvd21EWSsrZFNSMGtROUIvQ2VGNndCUnNj?=
 =?utf-8?B?c1JyNVZ5dURiWjY2WUxRb1hpVU40WGowSHJXTU0wRTFnSlp0S01XM2ZBZzR3?=
 =?utf-8?Q?SuA3ZhYuw+jgHijsbTVM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2376.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzVvRWVxNzN2dVJkUy9UalYvVUZlTGNYRW0yOU5GQkk2WGZneGlZbzN0bUtv?=
 =?utf-8?B?cExCbWtDdVg3aC9keTJqb0YwczltQ29FQ2tjNFpsMnVSdHBRV0c5RTJQZytt?=
 =?utf-8?B?OGtrOWlnK2x0Y1hNaGtYcndONXhrN0U1Nk85QS9CVnpyZHlWUHFHdXQ3Nmp0?=
 =?utf-8?B?NkM1Mm1pc3M0bjV2YitlOVZzVHdINElMaUpMc0Y1TVZnMHhQOU45SVg2Nnd3?=
 =?utf-8?B?ejB3TE50alkxOFFyVjFyZkVuTUVvZUpZQnhhVGxmZ3Qxelg5bEZCcVpaYTFM?=
 =?utf-8?B?dEVzY00rbUxTSGp1MmFBM3EzWFYybTFGbG5RaVpYbFJ1Qm1wMlVIZFFTUm5i?=
 =?utf-8?B?dDhuNHkvSHAwbVZMUGdJRms4ZmhmUkVPQWZlcTAxSlFiRmYxMlo4OS8ycVVm?=
 =?utf-8?B?Rmhnb0JCVGZCcS9OMDBRSXpYQlFQWHRnaExIOHlaejVRQnRsc0drNVhFY1VX?=
 =?utf-8?B?Y0g5UUtEa2h2UVdmczQ0dUZJTjRlUXlvSVl6Q3lLTTBZMHJobHVLYk5FajlT?=
 =?utf-8?B?Y3hXeUxtdUVUYzR6RXVtODJISXZUTmVtREI4dDE4VDRmL3VCaC9IdVp5L2o4?=
 =?utf-8?B?RjdHT3lTcU0zZ1FpK0wxcE5mV2tSZE9pNnVYdDBFVFl3WG1Zc09vZ0V5TjFj?=
 =?utf-8?B?eEFPb2RaNytnZ0VDVUZoRGZOY20wU3hyeVREa3pITmtMZGtLRDIwam1VYzlh?=
 =?utf-8?B?NGZEMCtkMy9oN0RSWlFGdWV6OGYydVFRTmpMUC9vdm9tQjNkWUw5ZjdIcDBU?=
 =?utf-8?B?cnFtZWc4MkZ3czAxWVRCSDA0enNpaEpKWkVpM0VENjE5NWxia0NmSkhnS0p1?=
 =?utf-8?B?d1NZMG5HanRYdXZEdjVGdUtaSU1pNWhoaXVjY3JVMTNJdVNudm1YMGZnWnZo?=
 =?utf-8?B?c1pBL2dJWkxENXE4WlJVMHpEMGNuVUo5TTNsNTJONlRrb3BVb0Y5M0JoNHpz?=
 =?utf-8?B?Z0NITUcvY1kvZ21ZeFlsYnY4ZGphMEl1dTQxcFR1NVRaQzNlQi9xK25TNWFY?=
 =?utf-8?B?R1dwdzNrK3VUV3Y2QjdJeUp5a0JVR1FQUkVoN3FMakV5RTNoS3pVT2JzbWRW?=
 =?utf-8?B?b3A4NExiWTFDaTRRRmp1dlRoK1NUUUhOMllQUG14KzFhaVh3UUJ5WkxZL2F0?=
 =?utf-8?B?bE9WandRWmkwWTNwcG9WQXhrUit6VUxKTExtd0NaY2wrMHRjS29TTG5kVW5j?=
 =?utf-8?B?YytqWk81Nk5FTlpudHZGODBrZzFlTlFMamoxT2FYTGI4eTN1VVNyZmw0UTAw?=
 =?utf-8?B?a0dUM21HOE5reFZ5dlU5cURMWEh0RWVwR3dpSXdFYWJ3bFpDOENrQ1R3Y1FQ?=
 =?utf-8?B?b1BFNFIzMzVURlVpY2txU2tXVjRzc3JJaWVHK3c4Mm40c1hGc2lXaUl4SUd6?=
 =?utf-8?B?UHVKQmEwMUN6bmZOdXNhVVVPSWFxaVVBYnBjWENQcHEzai9OYy9UWm9rS2k3?=
 =?utf-8?B?bFVJSjNpYU1ZQnFrYmhWMGJhVGhzYlpCbnBMTGtmQUpRcDFHR0RTQUlKYUxq?=
 =?utf-8?B?cFNtZ1UvalpWTUdIaTlMUU4wMFVKWUtnbW9SRS9oZjU3MlNVNGFvMFcxVFo0?=
 =?utf-8?B?SWlMMHJndDNPNTRHTEMxOUFWYitjMktsZW5lN1R1ZitrNDVTYmpjb3AvZzU5?=
 =?utf-8?B?NEcyRWVIb1dkMVZvTEhWUkF5NHAyeGlBRVFkTFVmY1BpYzdSbTFlTHZJNW1T?=
 =?utf-8?B?dmpSMVNvcXc4Z24rak4ySHBtSXlsMVJZdjFYZXN3RXZkMU1UVTlKZlhCSXR6?=
 =?utf-8?B?Vkd2TmlFaVhPNGE0akhVNWRxd3ZHT0I0QnNyTlROL0hndXVwREJpUFBEbDA2?=
 =?utf-8?B?SHRoQ0J1MVgvOTFta0VOdU5XUDBtalFWNEpIZFhYaUg3cGU4VFlJTTZsbjZy?=
 =?utf-8?B?SDhEaGFDNXVRVDRiWlFvSnR1dDlveXRqUFk5Rms3K2FKU1hnNy9DUGpTQ1Rq?=
 =?utf-8?B?V1E2R0NUTk12MEd1eWE1ZHRXMDRzcGRodVlkc1NFYzZmWDdxSDVqUmRiSFFJ?=
 =?utf-8?B?ZnRuMnVlcUYrd3BuOStPR0E1ejFqM1JQMHlJS0c1OGN3SHZBbjJLSnVOYjV6?=
 =?utf-8?B?OE4rdzMvekpDazdvbWtNVWYzV1k5TnRVc1gyZWE5WjlBaDdXWnZuSG51N2Uz?=
 =?utf-8?Q?PNB1dWhsE0IWmBAFuZQDaewS/?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5c2b86-bfdf-44b6-cd85-08dc8588a2cc
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2376.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 17:55:07.4032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08jzjlHGnAPllAbMuZ3CaG7UQdFLz/pVgFoIQ6FbHZP0e8HAw0xyo+n1SNHSAf8bCLZ8PImvlZfm7BuhbFKNDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB2882
X-TM-AS-ERS: 104.47.7.174-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28434.001
X-TMASE-Result: 10--28.884900-4.000000
X-TMASE-MatchedRID: rYpa/RC+czE/RK6+mUBQN1wHkvsOWIEl8kOnQJj3cxJNbINBwEGUTUP8
	2H0znGApKcxx2RCLTWXeRopYOF7lV+dqDTBn5M5eb9B0a4XF/0+VHu03nppZVWMg4pkM36D7b0L
	oGcdVHQpRTtuqNIR7dQpybldjUrGGFXMffPHVFU1bLHSUK6sTGjUS/tM6YFpskBIzmWRMoQLWoU
	kXKDpOsh1laMCilCtJizvYf5Ge5kK9ijDan8SZAlJTtM6CHKVOgdXztqOEBnDhCm8am+SP5xFsG
	M/1+c/r7cp4GRct7bYqfZCYjv+hXnDqKO3xwlWQnRTJpY7VAKfBeXwy+J/IvnOGVNCVZlIk5SdR
	PAugB0uyDWuvu/0vCU+H5XFWjaL8ZaA4dfYcAHrJyn7HAvPOIH9haMp9IVwu6tFPuMCU+es3YHm
	XJWZ2yzKG5W9Ke+w3aD2UKQ7oadMwTXWD7b413TmoMBkrmuf/mCYM4MaoFU97wQPQv9XohSI+KG
	BvwjpRRatw4vj6F2bVzTgENjEotprjKaOVysNvVj8ed+k2TEAaJre3vpLEISaSuBfcJyImYsrkD
	mZ3Sv3nIzRzWS2P0w==
X-TMASE-XGENCLOUD: 9fb32b70-98da-467e-8bb4-2a43df8915f5-0-0-200-0
X-TM-Deliver-Signature: FC788053118850C8E5941BC460415F25
X-TM-Addin-Auth: eoBnBSkFskuo4mF/PyVLbymY8wonrdL8QnhxUD6QhaiQ9hgQVVdMDp7uryd
	JI4IjQqZsjAV2foZjniJ569MYWbX0sZrNdSdC/93r73GA6Y88rgTxkGL45ep0tUCys+1t0lyRMZ
	LsEufJIlbP81f6bp00L3cf6JzeZMgQqranXdHUNmzshQ7YzPwbaxyYKjsdFfNtUqQgEH20DFOmb
	5v7iKXF+JnTyc225J+KrDcLnPxNDY8NbCtKzR7pQfGgeioWBzdSS3fAgyLQLdBGOtPHLNy0Scdc
	WMMa6wZu2v+BQqg=.Xxm45PYEg2+Y08YPHjbK+2wUKzZ4gWaHx1Ex+cd47uH55iByXqzZwJ58FT
	5oWBzUAeCk5xIcswMFRxb5UXp/IE5hJSosYSX+9iLlYj6JrIUXFtn8smc7ZpJR3gf+0qSO3h6g3
	uavr05wBEZO+KqP3Ywyb3QZph7uAmbZbD3VP0LLMzb6ngiaG1WXQIenVHax2VWwI9tZ6DFyaVJm
	tbIgz8227ATJT2l1i4gkUwTe7kLwdaTT84vEx//BodrIpmaVm8rdZjDlA1uX8E4vug8AVVAhFlC
	XdIo2I4qvsU7sQWtJ/DpAl0LQ3VlOsHP2Pr9/3Q11TjSWWBneUXNNHffrSg==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1717610109;
	bh=+09bcO65J0mCk5mniKEs99BC7OvGbnJtsMvsHiaUvRQ=; l=3161;
	h=Date:To:From;
	b=P8OFULKUiApzTkCYcCceUGM0pOt+r4YqfvQQBSxiT9DATevOeBTZfmkE2f74RFTFZ
	 kCE+sKffhCbXrpk2tGuvZ4oNcPj3PP84JzTk1aiSTuyx85hCPP0yHY9Vnnq+YJ0LqP
	 AFFx+7yO/5+HpYT8y/iSyVb7uxLSjqOhPewLvJYUO9GtvU5vSzsIIj+Qqmthc/ShP8
	 fpoq1Rm8sYHahqYBVOUClPDcCHYNKGK0I3gXmW0ZLIuQd3oJ9uGuJMoIoFgZ2BpyF7
	 nlsMFPY4UHxF3QN2PEwPOmboVgCntJq8XeBEKgkw8aLeoA/C+1W7gUUHlP4oIlWgIq
	 1LivMvvLwN/yA==

Hello,

exactly this is my problem here also. For me this change looks like 
saying exactly the same thing just in different (not better) words.

Thinking still about the replacement "from the driver" => "by the 
driver". Was the original "from the driver" correct? My native language 
is German and of course it can be that I made a grammar mistake applying 
German grammar to an English text. Absolutely unclear to me.

But if it's not that I have as a non-native speaker of English in the 
moment no idea where the improvement is.

Regards
Harald

On 05.06.24 10:46, Stefano Garzarella wrote:
> On Tue, May 21, 2024 at 04:12:45PM GMT, Matias Ezequiel Vara Larsen 
> wrote:
>> Rephrase the notification mechanism.
>
> I'd suggest to explain here what are we clarifying with the rephrase.
> Sorry, I'm not a CAN expert, so I don't understand the difference 
> between the two versions.
>
> Stefano
>
>>
>> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
>> ---
>> * This patch applies on top of virtio-1.4, which has not been released
>>  yet.
>> ---
>> device-types/can/description.tex | 13 ++++++-------
>> 1 file changed, 6 insertions(+), 7 deletions(-)
>>
>> diff --git a/device-types/can/description.tex 
>> b/device-types/can/description.tex
>> index 2511d9c..2931aa9 100644
>> --- a/device-types/can/description.tex
>> +++ b/device-types/can/description.tex
>> @@ -128,13 +128,12 @@ \subsubsection{Controller 
>> Mode}\label{sec:Device Types / CAN Device / Device Ope
>> \end{lstlisting}
>>
>> If the transition succeeded the \field{result} is VIRTIO_CAN_RESULT_OK
>> -otherwise it is VIRTIO_CAN_RESULT_NOT_OK. If a status update is
>> -necessary, the device updates the configuration \field{status} before
>> -marking the request used. As the configuration \field{status} change is
>> -caused by a request from the driver the device is allowed to omit the
>> -configuration change notification here. The device marks the request
>> -used when the CAN controller has finalized the transition to the
>> -requested controller mode.
>> +otherwise it is VIRTIO_CAN_RESULT_NOT_OK. If a status update is 
>> necessary, the
>> +device updates the configuration \field{status} before marking the 
>> request
>> +used. The device may omit the configuration change notification as the
>> +configuration \field{status} change is requested by the driver. The 
>> device
>> +marks the request used when the CAN controller has finalized the 
>> transition to
>> +the requested controller mode.
>>
>> On transition to the STOPPED state the device cancels all CAN messages
>> already pending for transmission and marks them as used with
>>
>> base-commit: 37c6a406678a5ee891fdf5671298cb4fcfa517f2
>> -- 
>> 2.42.0
>>
>>
>
-- 
Dipl.-Ing. Harald Mommer
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

Phone:  +49 (30) 60 98 540-0 <== Zentrale
Fax:    +49 (30) 60 98 540-99
E-Mail: harald.mommer@opensynergy.com

www.opensynergy.com

Handelsregister: Amtsgericht Charlottenburg, HRB 108616B
Geschäftsführer/Managing Director: Regis Adjamah

