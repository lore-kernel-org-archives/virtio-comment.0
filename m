Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu [18.185.115.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA2C13C8F3
	for <virtio-comment@lists.linux.dev>; Fri,  5 Jul 2024 08:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720167172; cv=fail; b=K0sNfLMe2B2cF5D4UsfgRThc0DmdXnwgrgAPbAOU3VvRgmdx2dHtcESOEarkxVw/ytyJtO+ZnATpI+aNH+8cLpm+ERBAwX22udsCZBzANiqYAdPaqvz439YXmw2A8To1ToAUUzHOKj6ycxNZ7sXnxBbsgsndYvgwEuv/5P7GyV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720167172; c=relaxed/simple;
	bh=B8txW03bKgbqxb5kG7/hsZwBypmATg/rpHAhoujwdbw=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M/LD3HvYQG5RV+aaJAXOH4e9ulfgH92owQW+qngin9URUfX/sKT961wk1w6sO1s0rOz8+Hv164FFkPwsKAUxfO1cIbEDo1fODB1FCxndned/19+WLvtqAHhxaFGy1yo5q3EF4/1TIobhfNcEbG2Zsih2Jg/0cmzWbdK3oTTetxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=JgwYlVsq; arc=fail smtp.client-ip=18.185.115.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="JgwYlVsq"
Received: from 40.93.78.51_.trendmicro.com (unknown [172.21.177.236])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 1022D100017C6;
	Fri,  5 Jul 2024 08:12:43 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1720167162.538000
X-TM-MAIL-UUID: 4f399763-28a0-416f-9184-8b66d1ba0669
Received: from FR5P281CU006.outbound.protection.outlook.com (unknown [40.93.78.51])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 836E6100003B6;
	Fri,  5 Jul 2024 08:12:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGnNV2klIg1zuva+K7ZUuhqVQmgqjCFuDHnrCZHf3TiymmHdr3wci8ddAmLH0dnovdyrTCE+8MJgWqBQGe+x4Lbk+NMYG4FY9Vstpd64gddJ/+X2IgB3F/wO0ZnWuyqiqoNWp4DUaZNMOwVOFesfxUINgjw55iGu/4Arigpeqy0kog6HcDKVxV2BBeznpUDzfpz4yFIWwjF9pWs3x5kYXacAhtKZmmwz0uO2cv9lHkFPJrPybNA9d8/2zArtlYYWKd0GOl3p4u95mWLSvims5IZ130Zphg783ZZ9UddOirNL+MN2+qWjOEaFz6Sg4JkLRD3H2C3xHaHYoep72e31rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6EkgPe4xbvtZ6trAmLeSAzw3B2AVsOgFOJ0DSevHSk=;
 b=ds7rqNAKh2AuM5g8zeWcTsM6UpAWKeyTjI0g6qKIFHh47nJY9IFl4I2Uvj7flqw2AbCLbxtCamLtg7gJI5662kV57sDUMB4Fe7+jJQZ3PneKWEfKwGIqvk1XTo0oZUbz2LsDmSK6UnRlKm+E4OCsJizGZdeLowixKxjk/4gZ3prV4QoAhrEf4p7/3e/CoFMBus2+jlTStiWCaBtnSK/j+xiFNY6ZJckmS7kEhIUBHSSMvz/NnsdDG5CxQqhtGn54A3RRNwFXYsCLuX2xTRHwFGRfMbPWrmvDDRf5PsFnPqOU7pdCB71abRVd2Is0QIZOHpYsrwWumHW8CbrgTXUqAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <668b681a-8025-49eb-a75a-7dac4fff8b56@opensynergy.com>
Date: Fri, 5 Jul 2024 10:12:39 +0200
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
Content-Language: en-US
In-Reply-To: <3935e6c2b4b73968d0c4728a3c1f429f121609e7.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0350.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::12) To BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:3d::8)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB1906:EE_|BEZP281MB2245:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ff3f04a-a06e-466d-7506-08dc9cca3d95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmNkYWtBckZSa0hxRU0rRVNnYkVndVkxZFNQWkNJNGFhTVpiQXp5bUFrRnM2?=
 =?utf-8?B?aThaYWpkajVHdWxvai96N216Qk4vNWJyR0VaQW93TkxLL0ZkNTROK2tkb3p4?=
 =?utf-8?B?NGJwU25YYXZKZVYrU3Fqb3FvK0ZiTGxKTGt1bWJmcThoU2trdFdwVmhJWVlw?=
 =?utf-8?B?Vzliam9yb045WTF4QklENG52WkoxQW0wODJxb1lIdTF1aG96TFRGbmIrdVF6?=
 =?utf-8?B?RHErNWcxSnpVY0c4U0hHRnhVRmZhYkFoa0lnT0hmNG43QXpZMG04WnBCSW9C?=
 =?utf-8?B?cTl5THIwQnhaKzhXQ2djSkRmSHdmMFVqVEJhSHIrNWFTV1d3NDJkK3drblBT?=
 =?utf-8?B?cWZrd21uTkNLRDdad3p0dWZKbXUzQUcwakdST3ZXSDY3dCt0VXZBbnVYb0g3?=
 =?utf-8?B?SmVCaUlDTDdJOGdwcjJIcUpRQUMyME5CLzh1SCtJZ0Z0YWZmWnhpSGZLWndM?=
 =?utf-8?B?aW03clFiWTI2RFhGOVhUVkVQYVJDam9nNE4reHhMRUMvdUQwVWoybnE2eE5I?=
 =?utf-8?B?bWdncGpLTGw3M05HaExKRm1GbW9EVCsrcFl3RFRLWmZWRnBzdGVUNGtZYm5l?=
 =?utf-8?B?bG1pZ1RiWXJlRnJhcVhyRFNXNDJGb1dCN2MrcjJ3ZUl1dTQ3RzAyS0oyWUN6?=
 =?utf-8?B?ejRxYnE0bTZla1JPQUJ5R1lEYjB3YVpDM1RVcll5RlF0cXE0L3ZjdWFieGpD?=
 =?utf-8?B?aFNRSUZ6V1VBZFYzZ2VsNWJSb2k2SndVTVRDcEdyaU8zTVJ4NHdPbWgxV2Jr?=
 =?utf-8?B?RGJ2Y0FSdVlTU0NYVFJwZ1dsS1d4WlpJVTdzVkhxdzU4TjNsUEFFUTg1RllG?=
 =?utf-8?B?YTF5WmVla3Zmc1hGVGpWYkZRcFBpNHBGRXg5dm91MVQ0ekFkL0l3OXZNRS9K?=
 =?utf-8?B?Wi82TWhSL3M3S2hPL2lvOGk2OVYrbWFYOE1NV0w4SmhqVmtqY0MycXFsTnkw?=
 =?utf-8?B?N2YyVnF6VHpEdGdvZ1I5dDJtRDFYLzJOb0pxWjI2WlBSeFZGQXFJeHJMZlNn?=
 =?utf-8?B?VnZDN2ZwTFA3RWFLaTRSYXVodkRxUjFMN2JTekZnR3RwV21HNVBTZHdwQjBV?=
 =?utf-8?B?UjNndVVVRDVqblpCRGNHLzBOTEtwWnZTcC9LcGlRcUVnOWdiRVUvWWxNNUM5?=
 =?utf-8?B?dGhuQXY5MG1nek0wY1NCc0twQXZnODRXOHdZSGptODZMMXlJcmx2R2RiczZN?=
 =?utf-8?B?eTZPaUFUc0V5enBSbHVxeTc3TklSYWJaaXhQVk5ISDlqTVNhMHhoSjF5YWps?=
 =?utf-8?B?Wmd6WUdadldTNGNXQ2pIU1pxWTJSWml3NGxqTnZGTmpNUlhYMDlnVExiKy8w?=
 =?utf-8?B?cGNObWdqZUthdlFxTnFvWEdGa0dIcEVYSFdKZmdFTDh3a21xcHh2MDhDak5k?=
 =?utf-8?B?YUV1RjhSWVZaWXp2bmQrdXRMS0dRUUJyUStuL1FOd0RZQkl4SHZTaERlbzZL?=
 =?utf-8?B?a2E3VklpY25wa1JaZEpOcmZIUysvQmJDOHBKdk5QaWp2eGRKSzhkcHVITzk1?=
 =?utf-8?B?VVJlLzhMdGZOMHk1TU5SOG1TS2FPTWFMc0psNUprTWliQU1BUml1dmJYb0Q3?=
 =?utf-8?B?SmlzYUNjbDJxSUxzbG9kcnVveVlEbFp5Vjk0a1lQNVhPdC95VTBHbU5VcXpo?=
 =?utf-8?B?aEgwRVdYNVZ6dWFQS1RXdzMzaVRBMEJvYjhSdlRaeGNsWTdtL3A5VFJ3YmxE?=
 =?utf-8?B?dVpOc1FNeHFvNkZkTTE0RlNCdCtpQS9lYTQxRjFmZEJtVFVIa0tJeGJ6V0d5?=
 =?utf-8?Q?lyaV42iIrMO2RQxYOM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3pDcWFoaS82QXpMN3VpNmYzTFgxMng0b2xyVHNTWjJzTnRvTmhMVzZ6Zys5?=
 =?utf-8?B?OEI3bWNsZFdZRHhlRFU0ZTBHYVM0NG9zcGh0bCtjZEtNWkV0S3ViU3U1RWNm?=
 =?utf-8?B?T2pBSTV6NVNZVThDQ0NaUUVkdk9HMU1oMkovbGRtdHphQmhnM1dWc3IxM2pM?=
 =?utf-8?B?YUVlaHNGZlprYlA5bHRpTDVnbkxRWjdHY016TVE5SWFjaVFSM1EvejZDQzdG?=
 =?utf-8?B?NDdKTGtqenNRb1BOcFNBRUZaZVRkbjI5Mi9hcVphQkE2bzY0QkRIazhqU3JN?=
 =?utf-8?B?T2l2STJBK3RiTXdtUVdkTFhpdUJpNFZZSWJDVjlDY3ZUTFhLMFE1MUdSbnZH?=
 =?utf-8?B?SEh2cmFrajE4UGR0d25tM25sakQwOG1tTk9wSkFXSWVRM01NeUpWR1FmRUsz?=
 =?utf-8?B?dHdWM3VZa1hpNUJ0cnc1cDV4M0EyUWNrL1FoM3NmQVlDWm1Ebyt5NUZnd0RR?=
 =?utf-8?B?Znpyd25DaS9pc0g5WEx1RmQ5bnZwbmxqTnBDUUYzVi8zbjhGZ0RFR0wxWUhS?=
 =?utf-8?B?YTdiZk9iUGp2b0lkbnk3clhzQ2tpUUprcDcwcm5xM0RlUWQ0c1JzTFdGSldh?=
 =?utf-8?B?NW9xYjdqZWR3WWQxR2tIanI4Y2dtc2s0cHZZWDdHazFZK3Z5QUVzVnNNSDJ6?=
 =?utf-8?B?Skt1My93VTEyZUJRT1hvQkFHK05qM1F4UEtaeCtDSW9RbkxlTHFVdzF3Kzgx?=
 =?utf-8?B?RUNzR0UzZS9QbGtUWVQ0YThLUGViZ216Q0hxQTRZNjlTT1RzVElQQmNnYldP?=
 =?utf-8?B?RXFpamNwc3E2SENqVk1zRDVndTBjcGgwTmx0c3VUN1NjWkUyNUVnaFAwb3o2?=
 =?utf-8?B?MXJDVnk3L3k0b05qNTY5Vy9Vc1JKN1l6OGR2SEdud05xemVERXltNjJhc1ND?=
 =?utf-8?B?d1JqSnZkNExscHRWcWdXR1pkMHpVR3JTNmtYMjNVdzFHak1YcGZ2eW1zeUpw?=
 =?utf-8?B?eXpha2pLUDZuSGNDRWp6UllQeU1xc0puY1VJeUJIdVhOcWlBeEp5VHhBeFRa?=
 =?utf-8?B?Y2tpcGZVRjJMRCtQNndUbjZQa0tEUnVBZ25LdUhoSzBmUUU5VjhvU29Zc2pG?=
 =?utf-8?B?dmxIYzdldW44NFFyK3JLWURaQXd1NjFuekpSS2Uwb094ZC9ydHJqU2FVeTVC?=
 =?utf-8?B?dHVudnVMSnR3am9mQUs3QVg3YW9mUzFGZDcyQ0NNcFNIVnRKbytvZlVidGk1?=
 =?utf-8?B?eHFnaS9NNWZKQjlyZThudmtoL3F5dmJQVCszMlZHVlgyR2R3a3JYOERUR1Vy?=
 =?utf-8?B?OGxheGJMK0l6OTJkcmxVaHIremVBbGg3THJVcmduRVJDSlRPM2F2TDRaaGtQ?=
 =?utf-8?B?UnUyazkzc2tycEE4eWpmOXJiRWJjYUp6M3Z0OTJ2Ti9hR1RrY0tnMzlSbTdu?=
 =?utf-8?B?Vm1Tc2ZLTHNhRHhrNThnZVBYdFpIejBCcVNuV1FGSHlDRjdJRnkrQ0ZkSEJ1?=
 =?utf-8?B?bzI1MytWbEJRY2N0M2ZCSUJNWGc1aklFVTROZUpHakRaWkFFZGlob2RpL3lh?=
 =?utf-8?B?T0FTdExabnZXKzM5T1ErUDEzQ1g5MldNcVdpbisveXFNY2hVU3dMUERpdzgx?=
 =?utf-8?B?bFQrVTlEYUNLVWlJTENWcVBJaVgxZ2dlSUZzbkpxM0hqM3B1T3FybjF6TWlX?=
 =?utf-8?B?eW95aW1Rd2czSDVNWGpicGFGT01oanNEdFc4UEIrazlPSTJzOXArcWprNW94?=
 =?utf-8?B?ekQyS2VlTkY4empmY1lPTGNHNURZY0RhOVlyNlBBMjVVMG9wTVRVK2RvUXZV?=
 =?utf-8?B?NmlmZEN4QTNpMVEwYm4xd1RmOEhNcVFsRjhwR0VwZ0JJdGVmS1YzVlRsVFRj?=
 =?utf-8?B?QlRvaFhUaDVveFZJa1JzTk9oUEk5eEpBUzdkc2pCR2U0MksxbDRWcTRIWnln?=
 =?utf-8?B?MkUzaVpkdmU0VjlzQW5xNHE1WFBCTHVyS212ZHRBNDNNR0pVZEdxalhTVmhm?=
 =?utf-8?B?MzRRV0hjSzVPT2V3OXhFWmkyMTZCZGI1REE4WWtFNE5IOEgxazI1eEJyWU82?=
 =?utf-8?B?TGU3MkhENlNzM2wzS0RYQ2NkUHJXcmF3UzNkSjh5cWlZK1Via0F0dzZzRStE?=
 =?utf-8?B?elVYTCtUaVZLQWtZdXQ2VlQ0UitWNjRZUkFFdzdLeUJucHA3TUNBeGpXalp3?=
 =?utf-8?B?dTZPVnBBVWFubXhqSXBteXYyRXdhQzNDR3hsdFR2YXlhMHUzMU5IQWMreW1w?=
 =?utf-8?Q?1gaM9Hr5LU5ySI/XjqFNjFVIzEeEWDtGMUKb5n+jclzb?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff3f04a-a06e-466d-7506-08dc9cca3d95
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 08:12:41.1546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wu5WQDP8hNOTHxXNaB4Q9b6Mrz0144+fh5Whzo2iwemrA4SUNAYhTT5eiwcfpe7GK/F67+q+21FoCDlYJvAAFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB2245
X-TM-AS-ERS: 40.93.78.51-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28510.006
X-TMASE-Result: 10--20.826300-4.000000
X-TMASE-MatchedRID: 9vvqFUF7IWlTzAVQ78TKJRhvdi92BBAuF1k2re42Ig1yifh116X/bjTJ
	kS18OlZ2aFYwKhMLAx8ezqgrEJ0EXiCt9VDjWrmr1nMR7J09d0/J6j1GY2lnYbtlXbJyXk1uXId
	FtmlL3ktIrzNBWaOp4TYKOxZaBN7q/Y5aTtdrip1bLHSUK6sTGoHV87ajhAZwjhoOdX+dGp+QvT
	u3/eDkgzMs/CnMa0MxNJ/3dRguO/GPkDVhU9U5iWyJrxBqx5NCTfhH0YJnYuyHLFEWrGCxdW01G
	RSMa1pQ2uFi25WzEmOB+iY0UB7ijf1vvg5ROPaJb9B0a4XF/08E+XCcxaVegEY6Ys7hHWU53Gfq
	y+F7BfPSkmCpRLkFZZfXFlOCsw2MiJPaA+9YMur0rrGAucNA2EIp2pwQ814LohylTf+BwIyD7Tf
	cB1et8Qat5BjZpNQkWexjyqpfBSVincty80xnBScOunEIf0eXyiJucExmxACTxeitXGaGBBHV4z
	clBV5eof7QzEon7FtXimspWKT5NV748ZsotQKQ0i9wR0nvXibQBPNYbIgLq6IysjVZlzq7mye19
	AqPTmaX3BSghcAWVYtd5xZrQ0HPZzvgC2+4XHA5qDAZK5rn/5gmDODGqBVPe8ED0L/V6IVIlqld
	glC+k9D6xLvX4M4IEA4s0Z67fd0qIw/OY3zSGZx7TrJxMWvNsLrqnOPE+ut4bd6tiMFuXX7cGd1
	9dSFd
X-TMASE-XGENCLOUD: 3c881a7d-b67f-43f3-b315-3186fbe7d24a-0-0-200-0
X-TM-Deliver-Signature: 8509F7FA57BF578FEA6BB0107C2303A4
X-TM-Addin-Auth: 0TrXXhcB1C7v1aPS0MC6HVcSReOoEJJi6W6Iks+3gWKXaQRKtCV0eu9VCch
	EVQjxEQ4l4TqsgvQqCZ0R+6sjT5Sq/UdkE/uFVgyl9Br7J6mmR0Bd5i6dy+0B62QOiRRO0zX1oM
	1CvrTFS46Jacn+wobZxz9iaPqQo/BbMX9HvvIKHBk0X6g9AmogdBUVf/M/GZGeNVn6MqwMxHehL
	HlkQJ7Yr/4IaZQWbRRefejHm/2Eoh3M3JfGrnlF6uGaPAvcYpxCmQapoGAesBlh0hTEcxJDy3Sa
	9wlNEyH10iUMccg=.BeotjT1ExS3icPWMVSmk1BTxX/5SEX1YEqfFcHRBNm0Z2ArcioGmAJa3SQ
	By4zFPtkJAZGkBcMcGjstUEGyas3I179dSGj2xyWdi2cytbqwpFiFU5FyBZj6zwVQzLuHZcXpDZ
	FSuJpRkXfK0yJy6VFNGLBspu8po7SW4h1HKiqXqUjQIzBQjM58M8Gjc3VFEoh8kuDF4o494xbOW
	7bzjMTUfgH4iT3aUX4gEo5KGqWmrkBTwtHqhCGnOD8NGYfjUE8+ASGhD0VbSFCAkzojvD4iSUo5
	skcBjg4rTWBqJBkbEtjIz8CgW5TA0jdCbum8RKs0C6hkCf6zMFESLO4gytQ==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1720167162;
	bh=B8txW03bKgbqxb5kG7/hsZwBypmATg/rpHAhoujwdbw=; l=9095;
	h=Date:From:To;
	b=JgwYlVsqKR7Cntdb2TRY1GbHTXNISPTsWJZ80GqFBOZu4B4vgNSV+8zvkPr7maZXx
	 HOE3ImvX+lKuYLJEakIcL+Iy2WKRWYK07U+TW3wv2+InX9Npm1LOcck3xNqhrPGwi6
	 DR5NliTWln34KjNpOgnpRzWrtkv8x1y5SOlGhGolJ7o8AwqyhkDygGsdal3ArDmlTb
	 FNOJKetguBBqnINJiVWf0/i+/GZztmudCmPaziFeyLmWsDufeM5NbNyVve5nKXY6gb
	 fk75SSadGwSNo8b/RhHhBjUY7qdGAoX6BEcH2jXRopUY50vq7qIVGgqx/SJqbro/wk
	 2A7C+rAN6t1UQ==

On 03.07.24 12:18, David Woodhouse wrote:
> On Wed, 2024-05-22 at 19:00 +0200, Peter Hilber wrote:
> 
>> +This section describes reusable data structures.
> 
> I would like to reuse them! Or at least the VIRTIO_RTC_LEAP_xxx values.
> 
> 
>> +
>> +\paragraph{UTC Specific Data}\label{sec:Device Types / RTC Device / Device Operation / Data Structures / UTC Specific Data}
>> +
>> +For clocks of type VIRTIO_RTC_CLOCK_UTC, the device reports information
>> +about impending and ongoing UTC leap seconds, and about the current UTC
>> +offset from TAI, through \field{struct virtio_rtc_data_utc}. This
>> +information applies to the clock reading to which the struct is
>> +associated to.
>> +
>> +\begin{lstlisting}
>> +struct virtio_rtc_data_utc {
>> +       le64 tai_offset;
>> +#define VIRTIO_RTC_LEAP_NONE 0
>> +#define VIRTIO_RTC_LEAP_PRE_POS 1
>> +#define VIRTIO_RTC_LEAP_PRE_NEG 2
>> +#define VIRTIO_RTC_LEAP_POS 3
>> +#define VIRTIO_RTC_LEAP_NEG 4
>> +       u8 leap;
>> +#define VIRTIO_RTC_FLAG_SMEAR (1 << 0)
>> +#define VIRTIO_RTC_FLAG_TAI_OFFSET (1 << 1)
>> +       u8 flags;
>> +       u8 reserved[6];
>> +};
>> +\end{lstlisting}
>> +
>> +\subparagraph{Leap Second Indication}
>> +
>> +For subtype VIRTIO_RTC_SUBTYPE_STRICT, the \field{struct
>> +virtio_rtc_data_utc.leap} field indicates whether a positive or negative
>> +leap second will be introduced at the end of the month resp.\ whether a
>> +leap second is currently in progress.
>> +
>> +For a leap smearing clock, the \field{leap} field indicates whether a
>> +leap smear will start around the next turn of the month resp.\ whether
>> +the leap second is currently being smeared into the clock.
>> +
>> +VIRTIO_RTC_LEAP_NONE indicates that the clock is currently not
>> +performing leap second related processing, and also not pre-announcing
>> +an impending leap second.
>> +
>> +VIRTIO_RTC_LEAP_PRE_POS resp.\ VIRTIO_RTC_LEAP_PRE_NEG pre-announce a
>> +positive resp.\ negative leap second. Pre-announcing starts at the
>> +earliest at the 17th day of the month including the leap second.
> 
> Where does 17th come from? Is there an existing precedent for that?
> 

It doesn't come from anywhere. I set it to the second half of the month to
disambiguate pre-announcing, in case a particular smearing algorithm would
only start smearing on the day after the leap second (at the start of the
month).

>> +For VIRTIO_RTC_SUBTYPE_STRICT, VIRTIO_RTC_LEAP_POS indicates that a
>> +positive leap second is in progress.
> 
> The term "in progress" confused me for a while, as a leap second is an
> instantaneous jump. Do I understand this correctly... a UTC clock might
> progress as follows (100ms intervals):

VIRTIO_RTC_LEAP_POS is intended to describe the state described by TIME_OOP
in adjtimex(2): "Insertion of a leap second is in progress."

(VIRTIO_RTC_LEAP_NEG would only make sense in the case of smearing. But
maybe smearing should get its own values instead of special semantics in
conjunction with VIRTIO_RTC_FLAG_SMEAR. There is already some confusion.

I did not use insertion/deletion names here because this would be
inconsistent with the TIME_INS/TIME_DEL names, which are actually
pre-announcing a leap second.)

Maybe a "second in progress" is not good English, but my understanding is
that a positive leap second is not a leap (and a positive leap second has
an associated timespan). AFAIU the backwards leap is a mere technological
kludge and actual definitions talk about a 61st second [1]:

>  A positive leap second will be introduced at the end of December 2016.
>  The sequence of dates of the UTC second markers will be:		
> 		
>                           2016 December 31, 23h 59m 59s
>                           2016 December 31, 23h 59m 60s
>                           2017 January   1,  0h  0m  0s



> 
>  1483228798.8 LEAP_PRE_POS
>  1483228798.9 LEAP_PRE_POS
>  1483228799.0 LEAP_POS
>  1483228799.1 LEAP_POS
>  1483228799.2 LEAP_POS
>  1483228799.3 LEAP_POS
>  1483228799.4 LEAP_POS
>  1483228799.5 LEAP_POS
>  1483228799.6 LEAP_POS
>  1483228799.7 LEAP_POS
>  1483228799.8 LEAP_POS
>  1483228799.9 LEAP_POS
>  1483228799.0             ← jumps back by 1s
>  1483228799.1
> 
> So if the second 1483228799 repeats itself due to a positive leap
> second, your VIRTIO_RTC_LEAP_POS "in progress" flag is set during the
> 1st occurrence of that second, and not the 2nd occurrence?

No. LEAP_POS would start only on the jump back by 1 s.

> 
> 
>> +For a leap smearing clock, VIRTIO_RTC_LEAP_PRE_POS resp.\
>> +VIRTIO_RTC_LEAP_PRE_NEG indicate that the clock is currently slowed down
>> +resp.\ sped up in order to smear the leap second into the clock.
> 
> Hm, is this consistent with your earlier statement that PRE_POS/PRE_NEG
> can be set from the 17th day of the month? Because it isn't true that
> the clock "is currently slowed down" for all of that time, right?
> 

This is an embarrassing mistake, I should have written "VIRTIO_RTC_LEAP_POS
resp. VIRTIO_RTC_LEAP_NEG".

> I think we might want a separate flag to indicate that smearing *is*
> currently in progress, and that the time reported is not UTC.

With the correction as per my above response, `leap` can already indicate
this together with VIRTIO_RTC_FLAG_SMEAR. But as I discussed above, it
might be better to use dedicated `leap` values for smearing.

> 
> (I guess maybe a non-integer value of the tai_offset field might be
> used to infer that, but I have concerns about that too, because surely
> that can't be atomically read *with* a given clock pairing, and will be
> constantly changing during the smearing period?)

With a message-based clock read, the device should be able to calculate the
offset. For SHM, the vmclock approach appears more suitable.

> 
> 
>> +In field \field{flags}, VIRTIO_RTC_FLAG_SMEAR indicates whether a leap
>> +second would be, or is being, smeared into the clock, rather than being
>> +inserted according to the UTC standard.
> 
> "would be"... didn't we already indicate that with the clock type and
> subtype? Perhaps we use this for "is being" and it resolves my above
> concern?

As discussed above, whether smearing is being done would be signaled by the
`leap` member.

In the case of VIRTIO_RTC_CLOCK_MAYBE_SMEARED, VIRTIO_RTC_FLAG_SMEAR would
still add extra information to distinguish smearing from not smearing (but
as discussed above, the `leap` values might be extended to distinguish
not smearing and smearing).

> 
> I think I'd also like to have a 'LEAP_POST_POS' and 'LEAP_POST_NEG'
> flag which are set for a period of time *after* the occurrence of a
> leap second. That's helpful for a client to be able to produce a
> smeared clock when the device is exposing true UTC.
> 

Ack.

>> +A clock of subtype VIRTIO_RTC_SUBTYPE_LEAP_UNSPECIFIED can set
>> +\field{leap} to VIRTIO_RTC_LEAP_NONE regardless of the clock's actual
>> +leap second state. For clocks of subtype
>> +VIRTIO_RTC_SUBTYPE_LEAP_UNSPECIFIED, the VIRTIO_RTC_FLAG_SMEAR flag is
>> +only guaranteed to be correct while \field{leap} is not
>> +VIRTIO_RTC_LEAP_NONE.
>> +
>> +\subparagraph{TAI Offset}
>> +
>> +The \field{struct virtio_rtc_data_utc.tai_offset} field indicates the
>> +offset of the clock from the TAI standard, in the form
>> +$\mbox{tai_offset} = \mbox{TAI} - \mbox{UTC}$. The offset unit is ns.
>> +The offset is an integer multiple of a billion ns, i.e.\ corresponds to
>> +whole seconds, except while the clock is being smeared.
> 
> There isn't any fundamental reason why this value can't be signed, is
> there?
> 

No, it is only that all current Virtio types are unsigned. Introducing a
signed value might require extending the generic specification.

>> +If flag VIRTIO_RTC_FLAG_SMEAR is set, and field \field{leap} equals
>> +VIRTIO_RTC_LEAP_POS, or VIRTIO_RTC_LEAP_NEG, the offset from TAI does
>> +not correspond to whole seconds.\footnote{This keeps the impact of the
>> +       leap second insertion on the UTC offset from TAI unambiguous for
>> +       every sample of \field{struct virtio_rtc_data_utc}.}

I think the above stipulation should be removed, it causes unnecessary
limitations.

> 
> See question above about the atomicity of this w.r.t any given clock
> reading. Do we have to return this whole struct virtio_rtc_data_utc as
> part of every clock reading?
> 

The idea was to return struct virtio_rtc_data_utc with every
VIRTIO_RTC_REQ_READ_CROSS message response (for UTC or smearing clocks), or
to clear VIRTIO_RTC_FLAG_TAI_OFFSET. Supporting that message is not
mandatory.

The simple VIRTIO_RTC_REQ_READ message response does not include this
information.

> I wonder if we'd do better to keep the UTC←→TAI offset as an integer,
> and also expose a fractional offset of a given clock reading from UTC,
> if that's the intent?
> 

OK.

[1] https://datacenter.iers.org/data/16/bulletinc-052.txt
