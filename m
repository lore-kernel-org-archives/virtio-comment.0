Received: from refb02.tmes.trendmicro.eu (refb02.tmes.trendmicro.eu [18.185.115.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3FC17BBF
	for <virtio-comment@lists.linux.dev>; Fri,  9 Aug 2024 13:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723208722; cv=fail; b=Lf1gwvNnQ1fAZiEgx93xT9G/dw5tGE6Iz/brZBhEO+KTPox43+YOzXYAwAkoboujXQmDskoxWxhk8OzaUMj1gLDOvmiJQhn8+BSGSMW7nLjLqGI1iNYvowdUVm8cSPKzfqUH/yJuZRr7J+DkY+F5jWP7s609QO8KkevV9Bfr6Zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723208722; c=relaxed/simple;
	bh=9ifo7u+1lK/Wb7uA/YxsNsHEc1JVlPcNdhKP5K0w2Iw=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qvMuxC94u7hrYCxrX0PoGb1aY7JlsNhJaj1djeYoxfV+ijN4BACclupdik2cfEwVTRJMvZy1vTbpfpszIAsAugVpYr2OaURurwUl1xsriOKM35fr5Y2c5iANAGkodEQe6IQd9R6dIDup+WrzzIM4LcQMYv5cW1CTdH9/YtLzv0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=cyDUw2/b; arc=fail smtp.client-ip=18.185.115.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="cyDUw2/b"
Received: from 40.93.78.49_.trendmicro.com (unknown [172.21.19.34])
	by refb02.tmes.trendmicro.eu (Postfix) with ESMTPS id E2A0B100671BA
	for <virtio-comment@lists.linux.dev>; Fri,  9 Aug 2024 12:50:56 +0000 (UTC)
Received: from 40.93.78.49_.trendmicro.com (unknown [172.21.186.216])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id BD92610000C54;
	Fri,  9 Aug 2024 12:50:48 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1723207848.391000
X-TM-MAIL-UUID: c2a91ffc-f9d9-4027-85de-48edcdae8ee0
Received: from FR5P281CU006.outbound.protection.outlook.com (unknown [40.93.78.49])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 5F916100003C1;
	Fri,  9 Aug 2024 12:50:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAoEi6KdNfCodg6E9nwmIq4rs9C05Rfk5whQBsO8kCMkM/XMO0i0WlWCiVx557OwVlGDaqwuixiggzfxm0yAXN2w5XJ4v1otTORmw3MFHfOJwQvUTnHZ2WLJ1h4N+oi67D5JxY96+KwieNo36vz9yHm4oB/JdM3tya2kCPwGUTbNGV32Nc+bbl3w6Ip7bk2hXRtKSK6BhJnEu2Cequgb4Ln1l1/anTrQDo6llFlnP6LO2UftNrHbnta1374XK3+LhScPCl/qXQck9y83lm6YOmTFQD5vtGs8YCKp7naCUyowMMT11tM2RTMy1vQGD+kNn8+5noPqEKQiYS7J5AuYfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBvFhqsXWKZZ9MPBIJUg+UE84g234HS337BCq5UJumc=;
 b=kjQQq6qRpkmFQW5ymVtSpPcAb1o8tTk2vTnaMYeyqPeyoegsKPsyObvdNL3jAeUhmjmTZ7NdgiJymzO1uKAa/N1VOhtLo1dEWEbcazX/+lGQRzYaz3f5DKPnxxxWEbLNCXHCwAzTpYJ40iuzUdcIoCWCX9iUEdQpA7bIYSVJo+EWxJefpvaMF4RHiZ35uux3HXGpX2zaBQL61d1Mo5dsJsvG9E7Q65LU+PJ9OQQnNTERlmY62Z0hWEKecTxkfX/y1GjUiwAJlADm/l00ArOvYnDgHwaL4oL8zDPeogRQg6OVY59lNRsyREGEoIPcG4y5e5/qyJ2yl2IVlGRDi5vNIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <43a6f5c9-22e0-43b0-810a-277bb0c7a543@opensynergy.com>
Date: Fri, 9 Aug 2024 14:50:45 +0200
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
 <85c93b42-41a2-42c4-a168-55079bbfff71@opensynergy.com>
 <04b017a0bc97700ad1e6770c2c3d458d2f25708e.camel@infradead.org>
 <16892c87-c527-4a98-9546-9ddbbfd062ca@opensynergy.com>
 <b9ee8fadb55b4124a34bb9e6736390c470661ac5.camel@infradead.org>
Content-Language: en-US
In-Reply-To: <b9ee8fadb55b4124a34bb9e6736390c470661ac5.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::19) To BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:3d::8)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB1906:EE_|FRYP281MB0142:EE_
X-MS-Office365-Filtering-Correlation-Id: 86048aa9-2e75-4042-a3a4-08dcb871e397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eS84ZTZsWlZnMnhuUnJrWjk4VG50MG93OUhsNUdqUzNSTEJpT2RNcFFwQ0Ev?=
 =?utf-8?B?ZWo3ai9rK0xzYkNpbmhCYTNMK0pvSFhZZ0VvNkd5NWxsMDN5cXNzMjU0SXRI?=
 =?utf-8?B?YmdSK01laVFLd0k4azVrZkpPU1dBNGN4L2hoMUxRYlB5V0FQcVZyRjhhMmw2?=
 =?utf-8?B?MXRNZVovOTB4NFhzWXVKaFpjWUJ6SWo4aTNTblk0RVZTM0pSV0NEUFY4S2Zp?=
 =?utf-8?B?MEprR0lHeWFNTmlNTFlvU3o0M3dlaDR3TjNSd3Jyd2IxdEdIcjBFbUdZekRi?=
 =?utf-8?B?b0s3U2t5MEFUR3Jkcm1mTWd2RVhIMVFhU003bHlROWhxakFzSnF1Vk1tcmpN?=
 =?utf-8?B?UlNRVENvQm16dzNzamZPbGh4clpMcjVBR1dLaVpkOS9BMXRDWFczRFZaM3VQ?=
 =?utf-8?B?UlptT2RKY0RYZkEvMnBzWnlHcGZZVnBqaDJGRzdMM3lsZUUxY1hTMk43ZjRO?=
 =?utf-8?B?R08vUWoySkpFeTN1NzBEMnNNSFp5Tjc1YVM0d1dZdk1tNmY4QnBqMU5PcXpj?=
 =?utf-8?B?MXNEOG5FVGs0Q2pvaFVSRFgrYlNUdHpmM3NVRHpGOUZKb3ptZWJNMURsUmdV?=
 =?utf-8?B?U0tjUDBIZlhrUXVCeXhMajZ0dzZNcEVnSTFIM0l6NUdoQ2hnRDhVNGNFU2c0?=
 =?utf-8?B?N0IrZHJia2NlS1A4TlBnZFFTN3NQTHBqdjJzdnowWVNPUnlXaVJERkpYV1I4?=
 =?utf-8?B?cWd3TGpNYTVzT1lHMDAybTBGMnpzc0pRREZ6SmdNWDJEQlY4UTI3cmNKTUxm?=
 =?utf-8?B?QXdDMU91RGFtVW1SbXBRZG1VWENUUzZiSXZSNmwyeEdZdVg0dVdQUVR6VjFH?=
 =?utf-8?B?KzVEZWR0bzRQUXBZRXhwMXhzTFdHQ3k2cG1MYjd2K0hkTytYNEJiR2Y0R1RX?=
 =?utf-8?B?ckdoaE5oV1A0ckQ2YU1McUQydlk0ZVRkS2xsTHFHQ0EySFZqOE5PcFJYYXAz?=
 =?utf-8?B?RDBQeFVwN2dMU0RidVA5anl2ZWxnYURQWGtqNUZORG5GellQLzBCOERVU0VX?=
 =?utf-8?B?RWh5dGZTc21BVW5SaHZmdmFWWHQ4bUtrNHFaNG54Wng2REphUERXOEFJalB3?=
 =?utf-8?B?eGMvY2JLL0ZxZkJNWUdjQU91b2poZVIwaEF6QUhvajIrYVJqM1VoOUFrSXBx?=
 =?utf-8?B?eVo2TWxnblEyU2JjeGZGVmxsZTlrV2l2VzJ4RlkyZUVmYzNrV2Era3A2ZkE3?=
 =?utf-8?B?STRnbDRqY3lTNm9NWTNMdk45Rk1GY3VPSy9OeThCSGVLZTFBUG9QY1Fwc2Zp?=
 =?utf-8?B?N3RlcmhpY2hBRk9MODh0YXN4Tnk0SFVmc1RlUHNDeDdhelE4a05ha1M4RERB?=
 =?utf-8?B?SUZYRkgrTTRQY1VFOTVUaEs1c0QwcjhrZ09seFVJZE1Rbkc3dWU4NW9lNVZO?=
 =?utf-8?B?VnZSLzFickRGbEh1aXR4MlVYelo1akJXNmlQWmppdUpVcncrRThXUVlRUjBm?=
 =?utf-8?B?ZXI3WDh6ZThoUWp0V3RsOGZldDc5VWFTeElBZXRSNnZKSkx1RjhvczI1TVRw?=
 =?utf-8?B?UjhFTWg5elpiZUQrWGludWY1d0hMUjVqK3lpTUNYbWJWZHdRSlhZK3luek9R?=
 =?utf-8?B?M2xNZE52dUxmeElrTFhXMXZUaXo5eEkyc3VHMThXMzh6TG1CK2tScG9JWW9t?=
 =?utf-8?B?dUV4YlRpUUgzZERSYkdGVERFTnlZMS8wcWgyVDRYKzBRbVhaL3N4TkQwOGw3?=
 =?utf-8?B?M1o1QUpFTkhrTGw4czV4MmRYT256dmNWdWhSRTJhY2RSbTV5NjZnbnU5VXJJ?=
 =?utf-8?B?MWcrMWtnQ0loWXZGZTRvR2NQb2hyb0lMU1dHYkg1WGdHSUVYeDA0YmU4Qmxr?=
 =?utf-8?B?NUJSQkUrVjc3VExEc1k3dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3NhNTFndE9RaXUzL2tDNlZwNFVDajZjN2JXS1dNYm5tUHJnV25aazhYT2Ji?=
 =?utf-8?B?VFFBYVJ4bThOajhNVXVyaVlzRWoyQWEyRWdTUzJXaVhhcmhDVm1HQ1dJTmhE?=
 =?utf-8?B?VnNNSm5jNmM1TWJQdFFiTHprYTFwMXc0c2JVL3VwOTcvc1o4c3FrRkJoZHFH?=
 =?utf-8?B?MzhPNTNoUU1lMXpodzBDZGZTcldSL3FyamJoMHZWaVloWjBZQkZuV2hCYTRl?=
 =?utf-8?B?WWJHNGRjSjg2eXJYbDE5Tm56OE0vcWx2R21zUDAwTTVVUnZwcE1TYlZjblhG?=
 =?utf-8?B?YWpUM0cxMzNTK1ZCV2kvMHFRZEFpMFJQbnFLZWhFck1tNkE1bno0ajhxajk3?=
 =?utf-8?B?eXJHQ0NNQ2ZuL0NDRklncnVRWGhTVFdSZm9hbEVyRGwvV29MWm14OCtKTE9M?=
 =?utf-8?B?Mi9GWndscjdsU3VuczZLZmIvajRrZW43cUE5aytBODBQaExYeWlSUktBb2x4?=
 =?utf-8?B?U0M5ekhOZTFaZ3lpa0ovVDlZeXQvaEc2aGt5dEV2NUFnYVhYNmV0b1ZvRTBR?=
 =?utf-8?B?YWRidHFrdzBITG9hS3ptd2srRUVaUHRKY3ViY2lkcUEwUzY0Vm5VdXNGMFRm?=
 =?utf-8?B?UnZBRTcwQWUvSFcrdDY3dGEzTXVMakNFNnlrdk1lVWJUa3VPRktCYVdlSlRJ?=
 =?utf-8?B?RUkwSTJzZGRySzZNbzZuaktEVGNmN1FSTFJQUzlQTk1FYnhoVW5jSjZxdFFZ?=
 =?utf-8?B?Zlp4cjdUbzJJT1dSdWQvL0RiZExmaitTbk9DcTJwOFhWMUpXSGJWb1llcXE2?=
 =?utf-8?B?ZmhSbnhjYkpXc3dnendlaUkrZW5EbnZYR2laaUlEU2gzeGtLQ0RWM2NXcjgr?=
 =?utf-8?B?N2svNmVTVGJ4L3p1dzRRRTdiTDB0UXlWd2d4ME1QbVRNNkE3NzlxeE5odi9o?=
 =?utf-8?B?cEZQbnAvL01qR3pxK1pUZDhtUkZiNXdzcC8wak1FODJFWjhqQXJDK1hCYlJU?=
 =?utf-8?B?YzlENHppM1h6dHo4bXpOOFkwSHNPa1NpS09xeWdYYWo0RzNtUW0wOWhOQ1U3?=
 =?utf-8?B?amlkanlWN0FKYzNqUmNYdzRSZWxSYmpzTmdrQXBTM2p5Rk4ySFRSNkMrN2dk?=
 =?utf-8?B?U3p1a2I0cjM2Q3VnS1R4Yzc2ay9ldXhxLzNtdzZmOWNDREFQREhDbTdwTWVy?=
 =?utf-8?B?czZHSHh2S3lqOEtJNXN1UjRMTDNTcDYxd2hnZnJqMnZzSTgzb3BOTmxPME91?=
 =?utf-8?B?WWpHTGJScEtsU012YzFWV3VKMFAyVE5pZUJsZWptOXZPQUVPKy9Qd3RTRmpJ?=
 =?utf-8?B?WW51VGY0bC94OEJCcHp6NFo2eUtPd0h0K2R4Q2xVMVNGbURKR25qU2ZGSHFL?=
 =?utf-8?B?a3pNOGFzUzdVQWZBaHFuNHl6ekF3aVFuMTI3cnlzbDlFN0I0ZXY1SlR5UjRO?=
 =?utf-8?B?NVY4QjZNSm1Rc2UrY0xhQzZRc21ORnk2QVFFeFQ4NFA1Q1Z2K3BrSkJFVEdt?=
 =?utf-8?B?OWJSbkxKY0c0YmRpM0hoU0xXRFYxV2xyZGJYdlAvQVFJNWhGWFRkS055bGJ4?=
 =?utf-8?B?Z3dTVlhsUldZSzRQS2t5OStRMFRRcHFya05RZURZNjMrUzZVYXNIbHRnWEVz?=
 =?utf-8?B?Q1JOMzA5ZG5na0trdW00REw3S2tvNzd2QWF3SWFKV0VicVVLRVNiVEl3NGdM?=
 =?utf-8?B?OUFjclF3SmlzU2ZxdVg5Ui9WMVhKRFhSL0pxdmc4VWtuZHpaZEpyUy9Ob2lz?=
 =?utf-8?B?bGs3S0xBVGh3b0F5cTM1K3V2ZEJNZVg1aSsrYnNJYW9MQWVhTlpjSEpuZ0FQ?=
 =?utf-8?B?ZU94SlJnblgzelpvdXlCbVlTQW81dzUreVBaSi9hZEJ5VjRuSURNNnBoSCsv?=
 =?utf-8?B?ZEdPNEJBclVubzQxNU5tUE8xMW5qamFaM3J4c2hVYUtMNml5U2hwV3dobDlT?=
 =?utf-8?B?S2FwLzNheUJobTZyU3dmdWx5cVdqL0M0RW5yMXY5M1FVdERKTElRSHJrcWd3?=
 =?utf-8?B?d3FqOHQyc0VCU1JwR0tqanlzVmVUVGJhNmJIM21iZ2wrS2FDMHZsYVdpN0N3?=
 =?utf-8?B?OWxuaWZSRXorOURIL0ZzVlZ3YWhkWXc4eXp4dXp4Zm9mWXA1cDczL3FGSnZW?=
 =?utf-8?B?cGVEWlMvOFo5UFNJWFh4V1QxbDBTQVlRSmpRY0w2b1FzdTllYzZIdVdPdHRL?=
 =?utf-8?B?blpDbCtPd2hDQURZRDJxNWNtYkF0aHZpZUQyRGljZGJyOERVSnRlcFJhMS9y?=
 =?utf-8?Q?rFmIEedkE09GhT0F66SoSeRdhwEWdA14Hqztoyw32Ybp?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86048aa9-2e75-4042-a3a4-08dcb871e397
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 12:50:47.0865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VWLQLxEs97hGYLJwbd//Om/03J4Oz0Rj/eIpupekxyA4cxyuYcTSD76MwicwgfKz+L8AELKfjPpBBqTtktzx+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRYP281MB0142
X-TM-AS-ERS: 40.93.78.49-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1028-28584.007
X-TMASE-Result: 10--21.617300-4.000000
X-TMASE-MatchedRID: fE0JoqABJp1TzAVQ78TKJRhvdi92BBAugdXztqOEBnBRSh1ECFBW69/D
	s3s42YLlAXHlxw/3w88JEVIuXRiuVmQtLC9gKBdoiu6u4shZ+fFYLgZgIgBQQ1ddiwXlwI7KnJC
	p5JfyXGFCc/i5d15CYjldeUXSKQFjHClSaXaxifTuHPAzBK2pO+X9qSoGP3NN32IUAOLDdgtF/s
	az7RsXOfeIVpNW4bow8WijolMHdx1aaGVdeSsXS+Xp5Ieya85+nsSRXdX/K/svMl4D6O45r5V46
	ChsSKJzf/OdFBhyaoUXJ2G5qNugvui1lkUvOtVfawJUqbmGPB3aPuPIIqmcJ/p4OuSy0UFxr54J
	Ix46I6SuVcUZFgzFcBAOLNGeu33dKiMPzmN80hlGcygBiuKrRK6kgjFlWfgGM/fFuVUUdhuiWLh
	miI4dPyDilljGyWFtDjSolFn3I1sD/dHyT/Xh7Q==
X-TMASE-XGENCLOUD: 122aee55-e7e0-414e-81fe-435ac71af411-0-0-200-0
X-TM-Deliver-Signature: FA48F9B29ACD908E93C04BAAD5682401
X-TM-Addin-Auth: goQCJQwDOvM0kwLwXsAa1dXkkcb4Wy5hdimuSJjnmgpb0YYY6MAyb4u0Z0A
	pg2v12Fh38PgOimRCcPzd6pNGMp9sC5JhC7npuwQSDg+oM7m2xjBlf1NHY9UeSNgyXOgoAs/fCf
	bnRhkRw/a3a4w8FSH75DljrOM1YXhOY6Z7QLPAr3VTGpqJYA5XFJZvnLWZFhuYN+uv7BJA3vRK0
	RNj24UFusYJhaSFZi6lzrQbYpduCU6/1BDxNa4A9M9JXoapK9s3apWbSCC3diiz13eXiMoV9VAd
	WrdJpib1+pHDVcA=.gDMJShhzq7VF0IKl5ZbPBHzwBPfwh1j0ysj019fIUS0GGrWBWafexpBfK9
	nKr1kMCO9RTkc2lYL+8rGYtOgvKoN+FhM/Ecaeis/y/cDba4xt12737BVwgADsswpK+uuU3ueW7
	svdxy/BbSb6H45KRckgg8E4BF7NErIiEO50xq3xEP3+wZLzEIv7hWTiIh3A+nRcPPAN86C3HX2V
	dKsm70RG2NdcXBnUvr+DWwk8ERkuDq0sTkKEW1fPq6ZaRGb4mUWHNNlANyGdyiPsupi4V+GqpCB
	2ZVtqKOMhVtUzulB6snqaaJso/aEA0A0b4hO2P1lvgXiVIzOR9ndFrFwPag==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1723207848;
	bh=9ifo7u+1lK/Wb7uA/YxsNsHEc1JVlPcNdhKP5K0w2Iw=; l=3198;
	h=Date:From:To;
	b=cyDUw2/bvRtzit4THuSGshGXUCK/2Y/EKuZQ7cFfApsvtsBEVXhZRuqR/DRKFZscf
	 n2MlGWkwsX6hXv6JFNT4jlEd+3QkBEVUvTvoyQ+OCx5rorPjkzNpUu28f+oEYX0f0C
	 ocOX/hJqb+yBiX5FlO91VvK4Od21uDLwvBvht8ydOhk4uWGViZUq61Bt9Xf3FdJ0Zr
	 xayE7ykeXwkraR576NAbmwu50AzKjoX4VMU78D0n+WvJgpC44HLaxX2emgDTJe63vT
	 RlkXT0kdgP7bPvlNYrgk2Qz2m6SHj4XZBc/OaCUTbnR6vgDEEc4zxIR7hARUktcSMP
	 Eg/JSXxE1bxlg==

On 19.07.24 10:40, David Woodhouse wrote:
> On Fri, 2024-07-19 at 10:18 +0200, Peter Hilber wrote:
>> On 17.07.24 10:32, David Woodhouse wrote:
>>> On Tue, 2024-07-16 at 13:55 +0200, Peter Hilber wrote:
>>>> On 11.07.24 12:18, David Woodhouse wrote:

[...]

>>>>> We need it to be explicitly little-endian, of course, but I consider
>>>>> that an implementation detail. Likewise the signedness of the
>>>>> tai_offset field, which *can* be expressed (albeit creatively) within
>>>>> the constraints of the existing virtio definitions.
>>>>>
>>>>> It's versioned anyway, so as long as it looks *reasonable* I'd like to
>>>>> go ahead and submit the ACPI version of it to QEMU and the kernel (and
>>>>> obviously also ship it in the hypervisor that pays my bills), in the
>>>>> expectation that *if* it did need further revision before the final
>>>>> publication of the virtio-rtc specification, that should be feasible.
>>>>> But the *intent* is that it doesn't need to change, of course.
>>>>>
>>>>> Are you happy with that in concept?
>>>>
>>>> Some of the bit widths and defines do not match at the moment. I think it
>>>> might be worth to align those (from vmclock-abi.h):
>>>>
>>>> - counter_id vs u16
>>>> - VMCLOCK_COUNTER_INVALID
>>>> - time_type vs u16
>>>
>>> Deployment timelines aside (I may or may not have used the current
>>> proposed version in an internal-only release for widespread full-stack
>>> testing...), I suppose I have no fundamental aversion to expanding
>>> those to 16-bit. Although we have about *three* possible values for
>>> each of them right now. I can't see how we'll ever get past about a
>>> dozen counters, and with smearing in a separate subtype I can't see how
>>> we get any more values of time_type either. A single byte really ought
>>> to suffice, surely? Can we stick with u8?
>>
>> OK.
>>
>>>
>>> But we do have a couple of bytes of pad[] so if you feel strongly, we
>>> could use the two bytes after version for one of them, and the two
>>> bytes of pad[] for the other.
>>>
>>> I quite liked keeping those as constant fields above the seq_count
>>> though.
>>>
>>> I'd like to have VMCLOCK_COUNTER_INVALID added please; I meant to point
>>> that out explicitly. We need a way to indicate that there is *no* valid
>>> time being exposed through this structure and that it is *only* for
>>> indicating disruption (which is the most critical thing for now). And
>>> even if there's a separate flag for that, putting an explicit counter
>>> ID into the field would still seem wrong.
>>>



>>> I'll be happiest if any changes we make do remain compatible, for
>>> "disruption only" mode, with an implementation which gives 0xFF and
>>> 0x00 in the current counter_id and time_type bytes. Maybe we make that
>>> counter_id and use 0x00FF as VMCLOCK_COUNTER_INVALID?
>>>
>>>
>>
>> OK.
>>
> 
> Did you just say OK to two different alternatives? Can we take the
> first; just stick with u8 for both fields as we'll never need any more?

I intended to say OK to the first alternative, and to define the counter
value 0xFF as VMCLOCK_COUNTER_INVALID resp. VIRTIO_RTC_COUNTER_INVALID.
