Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu [18.185.115.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9552511711
	for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 15:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716478275; cv=fail; b=oaGXazEheecqJph/uVPrNpbfUocNBat4GAgdxSxg8omDygEWbQhQXr2GEz87B+vWwO1zGCJ/sxpfEunJhbbtepf4/TMAGzofQQJwDWr3mYBUfyvb9LSkZPD6eVx50hMz5UKAoaP8dY90IJHWfXvbT+457NJdGbiK9jHT9WKBHFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716478275; c=relaxed/simple;
	bh=4pHSieBhh5wXEE7MtZSmSzQPqJzPrgIdgFrDjtJRC1Q=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pdlVm5h5IPcUE4RK/J/YbJuEujM9O9pod6jhGJhjfS4mz+o8c8KhtzjPrzySi2MgNRANWJ++GoxX19M5j/1KSywncPr9Ina61Nx2MLNtbReLnmG3ny7kvrcqTCM+ypkGvnPu+B2/Ane6bPrw57QvLJc8cODnabxzyCkqnmhEv4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=xRavYfTL; arc=fail smtp.client-ip=18.185.115.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="xRavYfTL"
Received: from 104.47.7.168_.trendmicro.com (unknown [172.21.199.142])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id E684E1000177E;
	Thu, 23 May 2024 15:31:10 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1716478270.284000
X-TM-MAIL-UUID: 0fcef19c-21c0-4477-bef9-5e7f6c889eaa
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (unknown [104.47.7.168])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 45A4710002B86;
	Thu, 23 May 2024 15:31:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQ9SKT4489N3BrfbkmVPUfZ6jD5yBGNG/klN9IOSptaLPwfgh96DBWXvY9EQJiVxF2CdbWbrN06cwAAXoVTV+mJGJKCyiCyEwscr2+BgQa05llKcPNTVuH4pxynPqkV3Goa70u5bw9A59QDsP880u8X0WFr/qZxOt7xkxN17SNnuAZX9kkZX1CpgftCc8IL0akMYE2F0gdAlTvkdQVgmif54YuxppSrOi4BY6RRHChuZfvaEQHnOcPlccU2MIQzdHNSrMM7VdyJgKqw8rjUBhLL7+1hYArZWGhamSFPr5jrj+dWlr0LzfgUs3W78d6SEZbbQBXbyjPGCGS6sUea/rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hASuEU5DlqoOvWRxz3/zxrd+Mzw+9tLjUm0+GHwACI=;
 b=RuR435Goy54btp/LtL096DHd/HrHdwqKq+Vj9xWXRc7KZcoGlY2DF92n1wpMC0Cl2bt0NHvv0XAlaA+6+hbPNDA1M3ziyF/SJTaoanwwat8nrV2FGZsenHPU4MfR3cwUxQIQETa0vqsN2ZgZB0OsfJbEd7deY0B7F3D3O7ivpRa3SL8xvt/WZQocZjdQ7vNV/8thS61XkxXeAzsr3HAx9wcYtOnQ5aS7DLeokVWS3+h1knLf3ZgyacZurWRqA4XKyopz4EyYZA+9gD7cbHdWKBPsDSg+bD/W12V50zE9y3Wk37uRKtmzIJC4vzOXf64l4LJsvQWlRiD7EXmY1kmQtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <46843279-58cb-4ac0-a50b-998ecfcc2c30@opensynergy.com>
Date: Thu, 23 May 2024 17:26:38 +0200
From: Peter Hilber <peter.hilber@opensynergy.com>
Subject: Re: [RFC PATCH v4 0/5] virtio-rtc: Add device specification
To: David Woodhouse <dwmw2@infradead.org>, virtio-comment@lists.linux.dev
Cc: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
 Jason Wang <jasowang@redhat.com>, "Ridoux, Julien" <ridouxj@amazon.com>
References: <20240522170003.52565-1-peter.hilber@opensynergy.com>
 <b4b198baa16b492a1273131e80d3f80a08835b79.camel@infradead.org>
Content-Language: en-US
Autocrypt: addr=peter.hilber@opensynergy.com; keydata=
 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
In-Reply-To: <b4b198baa16b492a1273131e80d3f80a08835b79.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:67::10) To BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:77::8)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB3267:EE_|FR5P281MB4325:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fb3f423-0b76-4158-ec86-08dc7b3d5e84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVNBOUYySUgrczFKUUdjV2dDU0JTcUZLY3FZUHg3ZHlrL3ZsbXZwZS80eGo1?=
 =?utf-8?B?WUF0NEFWTU1kRkdmNU5yS0pzUWdrLzBYK0dJdzluMnovelpmYXFWS09lVG5K?=
 =?utf-8?B?NEdxWnpLQldzY0hueGhpRi9nSWVMV3NIT0h4R2VwcmQrREU0UXlOVjdlb1Bh?=
 =?utf-8?B?b3BEbXdnMEEwRk1UTVdoTWloZWZ4dlBaeWVIL1I1UUh3MzRZMDF1UE10T3dT?=
 =?utf-8?B?MnNPYVdCekhFbXhWL0JQdkF0NW0xSFVjeDFsL3U1clJyU0xpN0lZbUZVQzE2?=
 =?utf-8?B?Y3h4anpna3lXZmREWUxPTGxFUG93eHZIelpvS3E5TDJQQ1NmNmJuYWpGQzcv?=
 =?utf-8?B?QUZKT1AwSVBRTmNLSklsWTIxNHNXMUVkcnkzYlpuZTJyTVZhYTM3RlZvMGdT?=
 =?utf-8?B?UGV0MzlEcmo3U05Ra3prNGE1TU15SEhvc25VRkh5dy94NlhTek5qaVNOYm0z?=
 =?utf-8?B?U0ZiajBZOVFsblBPbUNPMHkwb0ZrR1B2MkJlcGxia0lXYjg2MGZWQ1VOYnN6?=
 =?utf-8?B?M0daRWtUSU5GTFljY01vNE1lWmttTFB5WXIxeUVXK0hDS1Q5bmRZQWxzeGJY?=
 =?utf-8?B?Y010YkVHUWswODZMZFUxUFVobTV2Z2N0TlFsM2d4NVJNZWM1N1N2VUcrcEcw?=
 =?utf-8?B?ZmRjeE5OYWZsc1o3SDE3WHArVXZlUkNIejM2TWxSdmo2Q0hZUFk2bVUvNWdy?=
 =?utf-8?B?OUhtMDdDcG0vYjNQNW9zS1I0eHR3ZTFYand5R2RQKzBPSk02ZlVueWNTMDNh?=
 =?utf-8?B?Y25uMk1kQWFaUHE4RUVyN2FHZ3hpUEJ2UTRuT1NkMXZsRXdYdUs5cDBoRC9X?=
 =?utf-8?B?RURCVXU5QUNDSHlnZGVOV1VyaG40cUljOGVSa0c1aWhaN1VLMVhVcEpheVVD?=
 =?utf-8?B?VGFvUmJrY3gvZTNiOWZoRVFLWm9Tc0NEWDlleXE5UkVRL0g1VEtjL3JXaEJW?=
 =?utf-8?B?aG1iWk1wdUd0YTg1REhMVVRxTlJhNVZ1aG4vQ2p0NVkxWFZ5TGVFcXdtVVln?=
 =?utf-8?B?VUNwU001Q3NBYldZRlRNd0htaVJ4MkltS3cyYlpPL2dOc0VrYUN3bEp6QWpU?=
 =?utf-8?B?YVkvRjNBRTJ4WDVpZmpZY1g5VGZsNGhmYVZZV1VpazNVTlZzNXYvTW12dFZq?=
 =?utf-8?B?VkhFeFdscDA5Zlp0S3dySktwSi92YkZiNHFjUXpXTnQ1TVIxdUZTSmJsRjdt?=
 =?utf-8?B?SXg3QzFoVmxGMkRZZmcyZnAzcHU2V0gwOGhpNTd2Z3ZVUitYTTNTWWEvdFkv?=
 =?utf-8?B?dVN4QTZRQkhsc0s5eTBTVm1sZDg1bHhnQ1l0T2J1ZmFYZU93M3ZESGtsazlG?=
 =?utf-8?B?bXl0WnFHMWs2OGNUcUJTdnoySW12bEttUjkxR2xpS1k2UlhjVnJmNHE0SlhE?=
 =?utf-8?B?TDdRNkFleWwzYkloM0phekpnbWQrVHRvQk1mNWtqOEZmRisyaVhmS3dEVmk5?=
 =?utf-8?B?c1loaUdQaDNTK3l3Z0s0VW8wTU1DaXlLOFVIcmZZcUJqOGdhcjl5QXBIWGZq?=
 =?utf-8?B?YVZ4cTUrOHBQSWIyQy9aSldoTmZWVVIvUkFJMlFlZzkyc2JWQ2NPSkVXaWY0?=
 =?utf-8?B?R0ZEbWEzTGg4QkFXUExuZ1BrZmJMN0xvdTMway9nSnFBTTNXN1dPWmhjY3Bs?=
 =?utf-8?B?Qy9KWW0rUkxLVStVT3hSUkRuZDRFeDFrT09uNmdHQ0ZMblhraGZOSkxINUxi?=
 =?utf-8?B?ZDQrbS95SjVQd3pTaExKK0dXbEV5WmhLd2t2TnR1eDU3Zjc1UjFObmx3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ei8wUFNENlRJZk1rNUpBNXFRaWx4eDQyWjZqTWEyQjd5SXRTSEdQbGRNVkps?=
 =?utf-8?B?MWtNTGJ6SVpBQTR6M2Y4d2FFZXlha0MzWFRTMzNNb3hDakpPUTh2U2VvZmp0?=
 =?utf-8?B?cWxPTkI5cVJUc2dXSUhCMGhwbDQ5V1lRWmhTcVE2MmJRZlhmSTlTbmhobjNZ?=
 =?utf-8?B?MjVDcWFFRnF0M0VPTm1JZHdscElmb0FlN1RBVjcyYklGdzkyYXZBQ0VybExR?=
 =?utf-8?B?RGFWSWFOVG4vajhvRzVPUkI5cS9BVG1GRVI0Vzd0YThlbzNuNzNnOXR4YTZI?=
 =?utf-8?B?d0cvT2swOHRBUy8rMHE5eWpqekdVK0RXWXR2eXNQeHRiZVJVbDI4d1YzWm5F?=
 =?utf-8?B?ZTFsRTNraHlGc3NHSy94VlNCUXdDb2hScmd2eVUzTDhmWTYyZjAwWEkzbjJX?=
 =?utf-8?B?OFEzMFFBbnZ3cmlSeGJ1OEF1aEpsY3NGQmlEUkpCQldteitNbG50TWJyd09k?=
 =?utf-8?B?aStMbm1yVlVVbHk1YjFQNG5yb1UyUjVxZldtK1YwK3hQcFVIVkFDWjZvbU5C?=
 =?utf-8?B?QVlRQVhEcEl1WkNEVkZ3a0hlZG1hMmtSUVhES0NqV0V0YldEemxUbDZKaTY2?=
 =?utf-8?B?SGIwTWNNaHFhb05SZHl1MU9OZFJRTDZWSkdldy9GT2pBY3JWQ0loaEZmRDdK?=
 =?utf-8?B?VEtXWTNWYmxoeGJpYXJLQmt1MmNNb0VVWG1DMU1tbzhMbno4Kzk0ckNzUGZL?=
 =?utf-8?B?YkNmSFRXd284OFVoeDM1REpnM1Y1NGtCb0V6UE1CdnhzdFpueFhISXprVVdB?=
 =?utf-8?B?ZkR2aUgxSG5CbStpRFJjWkx3WTNiK25JTmgvdU9GajNROXUzeHovdGdrRGFp?=
 =?utf-8?B?anIrd2FzRmJqdGppd0p4U05jTnRYdDhnY1BZM0R0NUVSOXV1ajJWekxvekdE?=
 =?utf-8?B?dGNabU1uOUUvbTBQcUJsOTZweVlKU01qU3Jmb1c1MjE3VkFxMWhDYW5rb2J2?=
 =?utf-8?B?VkEvSFJNb1JlcjVWdnNITVZqZFJvaUI2NXlZYUUwY2hMT0JFL2RUV3M3TkVT?=
 =?utf-8?B?ajF5SUVZbWo3UzVnaUdYNDFyc2VvQThWdHlOWklFOHVmaFNLMnNRMDdsV0dt?=
 =?utf-8?B?TUhEN3RDZVAyQVp4NmdRdi9QdXovZHA0NmkzVUttMWVpQnBuUlVxbUx4eURs?=
 =?utf-8?B?ZFpDZzd5bDhTWGF6NkdXS1YrbER2YmFBL25yV09YNmhNd1JzaEN0UVFXZFVI?=
 =?utf-8?B?RENvRWNjRkpPbFZGYlBQRDJITHRNdHl0SkFyQS9BR2VDcklGTlg1eEFsVVFQ?=
 =?utf-8?B?M09uTHV5Q0NveHFOS2h3MHhIQU5PZkNzS0MyMytJVHpkSXhORWlFd21tNkV3?=
 =?utf-8?B?cXdLa0ZsWHhRU1VVanNjd2UzNWNGdWd2VmJybmEwaGJwM3hqQkFna3BIcjV3?=
 =?utf-8?B?SyttWE9vaTdoMUlqaStTVFZ0WFdvdE5ldmxCenpNUXRURFJTU0hrUUduakZ2?=
 =?utf-8?B?am1HK0Y5aTRmRytEdDZvY2hjRTkyMFJ3VlhRczhFMmZCTEtRQnoxcWdsMExC?=
 =?utf-8?B?ajVWdHpJcEEzeWtHbnV3cDJ2TzdTQjRVWEdBNXZrdTVlZDcySUVRUXAydXBY?=
 =?utf-8?B?NmdTQTB2TWtHbmNndDZ1YTRqcHVGUHRCdzRKZ2JEckU4cHBuNzI1d2hOUlFl?=
 =?utf-8?B?cnNIa25NYUhqVjIyK0JIcGgzeXhTWGZPeTd6alpMTW1rWTI5STh3ZFBNNG9S?=
 =?utf-8?B?V3FCclpFRnoyYloyQ3J6TUFSNjloYUJhTmMrVDllRUhWTTFGNDQzSEI2TlNR?=
 =?utf-8?B?YjlLT0dLSlJySHdDdWdwS1djaVVjMmVmLzRXbkZZakRXQjFhc3hueVNCV2hI?=
 =?utf-8?B?REtkeHExY2x6ZlVkWU5MVDk3eGVpZ1IzdVkzcXJ4M3k0N3dWSnRWNHpqV1ls?=
 =?utf-8?B?NldaV1Q2SG9ZMHBxaFFWVWVDelh1YXYrYTZHWVdGRkU0Q1lLSmlxNVNxQ1p6?=
 =?utf-8?B?a2ZscEhzckZZKzcrNnp1R2lRVVVWSVoxK2drYTM1UlEzQ3FlNHNlTjdWSDFU?=
 =?utf-8?B?cUV2aWZqM01LczVhbTRJLzVpa0dDTWNXb2lzeDFVcVpEYzVYbGV1SURuL2Ja?=
 =?utf-8?B?SGpOMi9UeWE0amJ5a2xEbXFZcTVYZThQdnRweDI1bzUrRVptRnRGUm1MVDBz?=
 =?utf-8?Q?rJVSulXb+DhUdkEwgg/+VIlnm?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb3f423-0b76-4158-ec86-08dc7b3d5e84
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 15:31:09.0002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +vnZ4xL1jxgi1o/PvjVRl2Ve0JAk79ochhHZzK3Nf2g3ItQMDyWRbzqCOFnUKuA7G7CdXbfpNzaobhqZc+2MKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR5P281MB4325
X-TM-AS-ERS: 104.47.7.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28406.000
X-TMASE-Result: 10--1.134300-4.000000
X-TMASE-MatchedRID: O/y65JfDwwv5ETspAEX/non73EnA6dC3lR7tN56aWVWOymJujT8rWFPW
	JnavNRHKwUr7375NmjS0cJDxMXg4qdZSVIh2F3SJO9AbTF0WkMKgn19QHAlOzCGQvSAIyHoOa0/
	Ql+gcIbW6miiB19Ur4l3jHUhSUqcUaIn7kYcazIMk+VN5SeE/CnM1+1Vqzfv2+SDH3HyigbT8XL
	wN2+AeMDsAVzN+Ov/sHtYCaVij9GluQa7/gBieyOIkL3lnUO/NCipbyes2UX/8XrvZln8dWw==
X-TMASE-XGENCLOUD: 5c267331-ba8e-4da1-9b8a-2af519d12055-0-0-200-0
X-TM-Deliver-Signature: F86C7CDF83EF098E8416B034CEC01BA4
X-TM-Addin-Auth: /HlUybvQYcb27XkbTxOj0Gwt4pP922HHWbdD+2tqmoqRQK9LxCgHijsqWlj
	2/sL8ZZ8rlOA6n3F/tWLPSRWuSCtvUBZRpBe3n/Uq7nupG+v5v3piscf5FRcUHhmo46aujcFoET
	H8DbvaYvoA5uLtSPcejmsWkokK24H5oD3KUjhZzWnKy/s3/HLBocBbwy+bipS+43OR58lGNgfW9
	NZKjA2YkX7GY6uiX1F1fvHY09OsvVdXZvahA/GFqKaBF6pk+QqaUhn918Kn0ybK37L1P3zmDzCY
	thIY98KG1gUgB0Y=.cysY/59NWuVpOMAoyI70apGA6moVFX4dM5Xbr5VacRw1cTPD9nIaxuiwQK
	KEPkNRqLZ3D5N40Xr8yKdlStrDjJEwBBfDZewyE4D9QS21UTHFssvTRdIXIOi2yWTJ7ZFcYoKmA
	Zv3U360XG8UFH1sNiFmPy/tyzSVT5Fc1z7tDYMAMxyhVkezJDX8nPfb4e+CCZRzr2fh2KbGleG6
	bc0qmYDo8hBawv+34H2KT+usUQE9hwwcs3X1C6nQ4PWavfF0utICu+GZwsn9rGjZrHCYqCRVFFq
	fdkU0Zclo990UEs3kuAfVTxv9Mks8nax5BH6dAQ56zx+VUO1ThDNFwSrB+A==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1716478270;
	bh=4pHSieBhh5wXEE7MtZSmSzQPqJzPrgIdgFrDjtJRC1Q=; l=563;
	h=Date:From:To;
	b=xRavYfTL0T+5kwq/EKsQC5FzJsT8wI+z0PCiq/qnLGCGCmD6SANz8eRVcvJqctDbx
	 C1/9v8HPbkVrBXTTx324nowqHafqSWCrr5n4B0w3kp/2wV4dZNcFXaNIE/Ida0hafu
	 NAsYz3ilRl7XU+mTPEoU8sHUPxOr72OfCn/7BkstJxIdqOSPj559PFzfoap+TVrAcY
	 y9KAmRBuGNS/fLU+T2eprWJOskGcimW8xHfuP26oF3OYe+HV2W8Ggye2lt1P22oaz8
	 x2ZsPEwqqqfVn/9sqzx0jmvQGVly4QM95d/kwan5Zj+sfkLmR2oGbD8Kwyz8ORW80b
	 3eO+33NH0YX6A==

On 22.05.24 20:37, David Woodhouse wrote:
> On Wed, 2024-05-22 at 18:59 +0200, Peter Hilber wrote:
>>
>> - Drop distinction of Arm Generic Timer virtual and physical counter.
> 
> Hm, why so? If you're giving out paired readings of the counter and
> wallclock time, surely it matters *which* counter? 
> 
> If a guest has access to both, how can it know which is being used? 

I think it should then use the virtual counter. But maybe there are some
corner cases where this will not happen, so I could revert this.

Thanks for the comment,

Peter
