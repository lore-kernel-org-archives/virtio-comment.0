Received: from refb01.tmes.trendmicro.eu (refb01.tmes.trendmicro.eu [18.185.115.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2D914EC7F
	for <virtio-comment@lists.linux.dev>; Fri, 28 Jun 2024 11:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719574374; cv=fail; b=aFTH85O3PC2CeSDpMiFqHFdd4KySsKFAEk2fgEs+xliRizErX66jlJcmPgU6P46jlF1gGLWGr5SvBzzxDIn0HyoS/uG53F0K5riqqqn6xMgW9hmlaeaU9tFqUhnIEF2f2sC4oFu20VOFEu2vRzwoE3/U9M1w8lLn30zZ8C3BqT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719574374; c=relaxed/simple;
	bh=SMRhudeWHgjlPFAeUAZElDasgSiJ5n3/FkXPAMhVxMY=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z2DWs0h4j62neLecjXs4jQNWueCguo+i/eD0Vz7SLwbReMzS9sbqJg1EvaL7J+2fl/3+IfleYl82Jn1h+L4Om2ewl9tXM3DPmDPTfKzXhrWBYy2pSpXW1BaZDBGBA92F7Htf6i9Ohvu9/cDy9MroR+4AHPajYizujmudrXXLR6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=cdnK6vZa; arc=fail smtp.client-ip=18.185.115.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="cdnK6vZa"
Received: from 40.93.78.4_.trendmicro.com (unknown [172.21.19.160])
	by refb01.tmes.trendmicro.eu (Postfix) with ESMTPS id BF70C1006823C
	for <virtio-comment@lists.linux.dev>; Fri, 28 Jun 2024 11:32:49 +0000 (UTC)
Received: from 40.93.78.4_.trendmicro.com (unknown [172.21.180.199])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 4B63A1000135F;
	Fri, 28 Jun 2024 11:32:42 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1719574361.911000
X-TM-MAIL-UUID: 00144e94-c416-48f0-ab48-6aaf065c2083
Received: from FR6P281CU001.outbound.protection.outlook.com (unknown [40.93.78.4])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id DE8DC10004C12;
	Fri, 28 Jun 2024 11:32:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RtxE/DRvHZR3C23D9I/7uDgc4eTaohwHAlsvAfTS8AEmuwyQ6sVO71ve1F5Doz4OXCJRn6rl3bpVUlP5s7tVpS+UlKGMFujalbeQ7eoVckYqorwpHJXNEn5P4+nKK7z6U0Hrrf3qFGPHEBeICLazZZGD0DV4iNoJmcHIJpQ9pue8wDKDFG8boBaR6BVRoNpCXZxd0ThNgZlHKkzRqVz7M+XrNSS5SB4Gmlx0w5/5MBkpMjXSc4NdX6FBBV5z8qWIX6RYxMOmhSLyhvbyozlBWvVYGkP9pU/glh7/iVeWxg3ODafiO+vKzswkXuSC4aOkv10pztQ1hwyyW4ItzZnKYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQPLQaJTgxmOiiu32suSIafQz/Wrx8Gv8+i4E/FnT5A=;
 b=aAid1HPyWQsVMLDn2Dv3OFlQutu8tItFAAieoLsKOc52VecyPMalDIWFPVLnKhwlCr9l3Rq6IOWotd2kEFQ6aGMhNQ1ok5Xl3UMB28Qm0I+n82Ul/cirLS41c68YktgWDvIJchGyA6xLUiHSCW7m3rPwR2IYeJmoAi3FYx9ZAlMcTmeTudOLExcOY1KK9XslfB/uIaUeL8M7ZoA102Kgfb03xwfJ38L9D+wqdMHxo79ZP9zA22fRwyV9M7Qd1+sIWjkMO8FUKVgHvgVpS8Q4RyPZOzpXkvO1tpdHQbp2ZwB6ESEN7sVAMpL2J1LkFekDTNlGZiluhQMq2jhSgnHl6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <83890182-8aba-4ddd-a462-834543f48f93@opensynergy.com>
Date: Fri, 28 Jun 2024 13:32:39 +0200
From: Peter Hilber <peter.hilber@opensynergy.com>
Subject: Re: [RFC PATCH v4 5/5] virtio-rtc: Indicate leap seconds and clock
 performance
To: David Woodhouse <dwmw2@infradead.org>, virtio-comment@lists.linux.dev
Cc: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
 Jason Wang <jasowang@redhat.com>, "Ridoux, Julien" <ridouxj@amazon.com>,
 rluu@amazon.com
References: <20240522170003.52565-1-peter.hilber@opensynergy.com>
 <20240522170003.52565-6-peter.hilber@opensynergy.com>
 <d9d0ea80934b024c7c3d8a1204eabcf40279a620.camel@infradead.org>
 <8595d22e-aa0e-488a-81bd-9191a678e4cd@opensynergy.com>
 <b46bc9dad7dc83fb8d824fa4903c791b2e91178a.camel@infradead.org>
Content-Language: en-US
In-Reply-To: <b46bc9dad7dc83fb8d824fa4903c791b2e91178a.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::6) To BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:3d::8)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB1906:EE_|FR3P281MB1802:EE_
X-MS-Office365-Filtering-Correlation-Id: 82cdc5f3-da23-484d-5de1-08dc976604c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnNiK0RCWkl5Tlc4Z0kxT1BGZHVndktmWVk2Ums5MUFtUUJ3VVRTUXBtb2tE?=
 =?utf-8?B?RTJET0dSdmdXSVVheDlTTG1GZ2hPVFM2amtQR0JzY0ErR0s4dEdTYnJUSlEr?=
 =?utf-8?B?SjJVK1pCWkZpWlNGMG5nM290elgrY1RUejVpUzRjeEl0eld0WVUzS29BblFm?=
 =?utf-8?B?OUR0cUVyV1AzVnhQU3VuUWNIWWZnSENvbVhIRGZmS05qdkI0T1dPay9veTE2?=
 =?utf-8?B?WGZnQWlUQ3RDdkMwSFcvZkFvQTlXTFR0Z3ZGTHQwcTdLZEpTWlN0M0tIbGU1?=
 =?utf-8?B?N1BqVitHRGUvSG40Nnp3aUFLSjkycTB2amdGb3ppL1VBN0VxYjUvWWhadU5Z?=
 =?utf-8?B?QmhvY0RXUEk3VWptYUJCOUdwL2hhVGpBR3VOYWs1R1J0K2h6SGpqQUxFVUE0?=
 =?utf-8?B?UGlldTJ2WWxJMmlNT0oraFBJcWRXOG9CRkhMZ1Jzam9aYW8vWjR6Tk9rbVdV?=
 =?utf-8?B?TGdFQWhjSTVkTXJ0b2xxWklOUmNWNE1zRCtVbmRVck5PaUVKVVd1YU9nekxa?=
 =?utf-8?B?UEdCd1lxYVRBUmhKaDBOSlF0UWpQeVZDK0hkZGljaWR1blJES1NSSWdWQW5I?=
 =?utf-8?B?WHZ5QTFIL2tmWktqSXlHcmswTUVUUFBPRmJFcDRzYkRSM1lseEYwQXJJUmR1?=
 =?utf-8?B?NWtoUjd4aVo2VklhTFlwN0tuY0djNXFZeHdkWVRmSytLNHU4bGlDblE4Zm55?=
 =?utf-8?B?K2ZWOGEvdm82UHQ4UFJ1QWZDK0VFZ1BvQ29URU1udkpWWWkzamQyR0Y4aks4?=
 =?utf-8?B?M1VOTGtPVVV5aURHZ2N5ZEwrVnlTYUtXWVVzQk1ybEg5R2Y5WTNvb1gzODBB?=
 =?utf-8?B?eTVNTC9vNEprNVVuTXh5ZkdFUFdWT3hkSDRRYytnZ29udzhUNHhGZitvZ2tD?=
 =?utf-8?B?TmRvYnI3eThySHlaT1VGNXZsNEtPbVY0VFcwZ1RUR0orUVF5TlJtRHRzZzI3?=
 =?utf-8?B?Z09tcFZYdHRkZVd2RXh0cjJPNGp0UTlrNURCRDBseFRzSTVxaUk4cHl1Q2dJ?=
 =?utf-8?B?cmpjcXB3UDhLTkxkOWhvQklaMGdvUE53Vnc5a1pDQk16WnVibkNUZVBMTHBo?=
 =?utf-8?B?VFc4OHA4ZDJLZ3RFdlk0V0dnNlB0WHNEeTA4R05YRXJ2UXhGTjBmSzRmZGxr?=
 =?utf-8?B?OEJLazVUcXhLcENQdFlGTmdhN2tjc0tUSzZjUDFDUU10bm1LRGxnN2V2cWxZ?=
 =?utf-8?B?RFBrVW9TYXlkMmQrbW53STVqTXBCZEpYVDJzYkoxUVExbURmV0d2aUZLamNZ?=
 =?utf-8?B?TG1yY1J0SzZvTzY0ZlpiRm41cWxMNDVpbXVEWHdGMm10bHJHYWJTZmoyMVBr?=
 =?utf-8?B?OTVGWDVRSkpFNG1jQ2E0VisxeXpITWhabFZMdHloQUYwTHhlRS9nM2JxY2Ra?=
 =?utf-8?B?MUgrWjY2MjlCanlBZCtJcFpia1hFYnYyMDN1UDFncEtUVGhjV2R5d2VZUktR?=
 =?utf-8?B?eTdMZTJCalA2NFFLZFEwVzVrU0c2YmFhYXMrZVoza2VJU05MVFhHUmJjU2FU?=
 =?utf-8?B?SVdkOXYzd0d5ekV4dmxWSmNSY1FBQWpFc1NJcGlYSVFyeEg1MjB4VytpSlVy?=
 =?utf-8?B?cytnTU9pSG04UWIwRVVucitvcUtYMkJydjN2czFRZ1llWGxmRVloUDVIdEJJ?=
 =?utf-8?B?K2c0bFI0YTJObWlxbXFuVEFLcEY1SHcxUHNFaldMdjBoQkpnQjlEODd1WWlO?=
 =?utf-8?B?cEdYZXlLOC9pbTZDa2JYT3FGWkkxb0diNHhPNWsvMlkvcFEzbWI1SE1UMW1m?=
 =?utf-8?B?Q0tYWmpjckh5Z0JXU1M0UVVvb3kwR3oyR1BNc0drYWRLNW1FcGRkb29GWGps?=
 =?utf-8?B?S09QNGl2OW11RVFDMUUrdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjhIMFAydVEySkNVUFBpVXV3SEJjKzlSNzNPenl5Z1llOHMwMStqN3BrVXpl?=
 =?utf-8?B?VWtnRmdBbmFvVldIUENXSmpGdkptUmFldU5FR2RlejRPaU1aNHBNQ0p6Y1dI?=
 =?utf-8?B?eWh1bXF1TkNueHlTZ2djWDd2Ujc3aHNsS1RpMVRCMVI4aG9wT0FGTVhGZ3ls?=
 =?utf-8?B?WW1QTm16ODdoYm41UzVRc2EzZHoyOUVqaElFcTVsQnRzck5zOUwrU3lrdzBR?=
 =?utf-8?B?V0VKVFM2YTc1T24rS0tLc1U2OUtkVGFmRHhTbXltNENMK3I1RUkwVFpuOUxx?=
 =?utf-8?B?aUx3RWZsMU5KU2dyNDZOdmNCRFUvcUlIT0RVWUFhMVQwWCtjRUphQlpZVGwy?=
 =?utf-8?B?ZWw4Uis4TFdaUmpPcENLZWxlbGd0K0RaT2c4bzNjSHFyTHlWVWljSWlIaEc3?=
 =?utf-8?B?eERTWmlrbU9TSGlzZ203RVozMmUwMm0yQUIvRXpDVGdISXlhVGtwclRwaXJS?=
 =?utf-8?B?UXdseU9MTmRjMkd3K25tckpkQkp5ZndiNE9CcndjMTNFTUZ6dHdrRi9YTUgx?=
 =?utf-8?B?RkhhU2pPT2w1QklxNW9sOUZsR0N1NG00cGRoQTZkNThWZDRpZTdsVmZmSk5w?=
 =?utf-8?B?ZXB3OXppV1JpeXBPVERTOFZIbkU0N1ZtdU4ySTFTK0xEQi9qRVY4Sk8xbENS?=
 =?utf-8?B?SjRqYkt6emRHKzl3WGp5V0VBSGtzNEVoNzl6SXNRdE90OXUyQkZLbkk3SE4x?=
 =?utf-8?B?dUo5VFlzQy9jRnpmSGRJeXpjS1hvV0VRY3U2RDVCeFYrMHh4clp5eFl3M2xZ?=
 =?utf-8?B?c25vbGw1KzNyYTQ1MTZoazh0WkduaVgxY3BiKzVJVG13M0liVHFueStxWTVq?=
 =?utf-8?B?WFVKK2Z0UERXR0dpaVJFZWhObkdMVkdabHIvTGM2QzlzbWpDUXVTd0UvemNS?=
 =?utf-8?B?U1Bma1N0ZENnRngxMlNpNkF6Zk11OXl0c2xqdG1VeFlUdjZxbEd4YWY3c0tH?=
 =?utf-8?B?N0JyQStCYmh5azN2TmhtczNhamphcnkyaDArN3BKR2M3eGgycE1QUmcvdTQ3?=
 =?utf-8?B?cTFvMm5tRndDSHd5bUhDVGVEWnQxT0U5UkNIZWcyUmpYUTZ1WUtKcUxzQXVJ?=
 =?utf-8?B?TUJoZ1BweTlNRVFocjBZSTFaRTB3N3NlWEhtN3o4SGIrYnhJQmVKQ0hpWXNM?=
 =?utf-8?B?NFpmb1NaYThUSms0WnpBVjMvd0tERXVuOFBScGNINHhRcmhGbEhUWmhEQVRI?=
 =?utf-8?B?eHU1UXRPUlpCZ3Z4VDJvQTZEbVhSYlExODlCVkZVdVVYMFdBRjB0RlU0UGp6?=
 =?utf-8?B?L21EbTg2T0tzQlFDSmQ4VXRuakVUVlE1MGRlZlhtOWtud3IzekU3cWx0NzRj?=
 =?utf-8?B?RUxUN2YvcUp6cEdsL2RJWEVESlo4TE04Z3BmZlBWN0JuclZxNzJieU1kVXcx?=
 =?utf-8?B?VjNzRFgvYVdvazBDUldMOGxsYWc1T3ZpaS9seUlnZ0NuckFjVFp0WFNoTWlj?=
 =?utf-8?B?dGp0VnZUN0tqVlEvUEdnRTJLWC9tS3hreFBsSlBTUXBueDg5MkRYd2lwZDFi?=
 =?utf-8?B?akU3VXRnYVBWdlNwYVY1M2R5VlVvREYydDg0bWxmZStkZ3d1RUpnN1g1bk5B?=
 =?utf-8?B?ejd4V21DU1hlRFNuanlrajZxRVVKNXhnRnJibGJ4aTd2L1A2YkszclJhTXJI?=
 =?utf-8?B?cUZ3WWF6ZEVPKzJJcVhzZlRmY3R4ckNlTFZhazZIT3drSFcwVGw3VnVhNCtV?=
 =?utf-8?B?NFhFa3lSZ3NhTFhkak1ONEt5aVBpVHd5ZnpDS2M2VEVvTTdic1dwK0JuZ3RV?=
 =?utf-8?B?dzkxSHVUZWtzckVtQzhPVFF4Ukh5Sk9YRFRLVU5PUWh0UHNXUGNtQTlBcFlE?=
 =?utf-8?B?c0hjckNiS21VMVcreCs1TWU5dE83L1lFdHYzV09GRlZsd2dlWHVWTTFNNFJV?=
 =?utf-8?B?RU1rZ0Era2sxTjVhZzJYT2twMFpDanNQWUpMN1RXc2UrUURkNXphNHM5T28w?=
 =?utf-8?B?clFSOXZzOEpLZncreWt0YkxVT3cwNVVmRk14VzFrRVF1MWV5eU1VUXptUFY2?=
 =?utf-8?B?WTFaVDlkQXdFK2RyQU40NmF3bFBreExQSlRmOGxybG1ESVh5NHNVMVNaOHg1?=
 =?utf-8?B?dEp0MUlENFhiZDFmczVwMHhnYnJRamFJTTI4QVlLU01FMjRCL3hjb1h4L2tr?=
 =?utf-8?B?UHJDWW9iYkNzcVZSQjZ2UWd5dUQwVEZsUzkvWG9NZWhlaHF0T1hsSWNlcHFi?=
 =?utf-8?Q?3oKNh18g5hli0REBuYNZdJagJusLLyjDZ+U1f8GWJLBa?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82cdc5f3-da23-484d-5de1-08dc976604c5
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 11:32:40.3680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J13WbFuSbcCmuhj18LhbGAYbWI4YMUCCy61tNkLUezov3ngl0nTeRl30b1x3BZhS3gdOXcZUbzYIwrEzU3Zy6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR3P281MB1802
X-TM-AS-ERS: 40.93.78.4-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28488.001
X-TMASE-Result: 10--6.679900-4.000000
X-TMASE-MatchedRID: +f/wAVSGjuhTzAVQ78TKJRhvdi92BBAuWT8+W30J8KJgpjHweef2EgKV
	oReep0DlxpEXX7uGYWE/m6r//1rXUKl850GT0zU4zxHg3Mb1A4xGP5W935P5z05UjjPgTYi+iHh
	ODD/HIXzlval+srNK4idkncrVG3HzunIQaSWPj7IL6av7YvHcfKgclxRwe1qqy8I3PgPb1X04K+
	zW6KZTeCnMcdkQi01lMrx7VHtHEUZlqEyE47wP6GyJrxBqx5NCfq7xWexVq1zW6I4Shu1jquihC
	Tu0kel4JLyRa7A4dIeV1h6ijsb1eK0AyU/iBF0WxO9DHo3LYKv6wx6weWCky0ubBoDSEJ57Z20B
	GDQhwv2oO2aOVDgUaaJYuGaIjh0/fiAqrjYtFiTa6cUNR6iBmkmRVyi2jxWD7dn9p5x0CJjn4Ef
	7LbJvtH7cGd19dSFd
X-TMASE-XGENCLOUD: 9feaf024-6470-43e5-b49c-348857e18b13-0-0-200-0
X-TM-Deliver-Signature: B8D2607F6939B84E2DF9CB1707A9A22F
X-TM-Addin-Auth: nhZe2ZI7IvztOGlK3vdP+3JiYsi+JGjv5J4VmHQRQ7GXbS+GgU40aHj0eBt
	93AC74j/13qpr6saPlq00OtaHbbR4ku8lM/Vo7pjm5G9Ld04MRhp37absA080fmDwziDsnlHQDB
	Ih0+NVakTCUgnqW0jy0niyLkqoHPylSyLGjBYvfIRpU6iZfCrZI91cOnTsgrb04TipfYKM2Z1R5
	FUOiR+++RNMtRu/6NZHIANOACaSA+0tFkNgj3R1bmz6Bo4K61xZ4KV6NngHk2Y56ywLSD9yilK1
	CmRBBLQBlOIfL4o=.0loZqrYN2Mprzvbt+hwYDmAzdNLHs/mtzOTF3lP80Tam4n2H5iDCzcWR0A
	93R9WLHujzBdTzbpuACJ0v0NUU+0lzwFFY4sAn8LmGn9jMbJLmkP4SXFQZQvNlhbcNxKst0rpvF
	ME7BcH+9MpeGJLyxd26hjD3IHqF1QU27JB4fFsVgqqydINHCr0Qn00RaxbdgUVkdTSbaaRGhdeq
	9Dk+hsB8SCcHiKRDchKf5GBNQHABx9WfaA8cPMyYLsPNzbeWTCFf0bpdQsMo6xUne9qbjphBMVr
	Gopo3DTDg2GxzWuads6njWeAE7PRcAvGOGzwoQmJvImyk5/+VQsYmuEe6wg==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1719574362;
	bh=SMRhudeWHgjlPFAeUAZElDasgSiJ5n3/FkXPAMhVxMY=; l=1916;
	h=Date:From:To;
	b=cdnK6vZaGXd2UBk/i9fFvtoN9R9yt3+o1HZRI54lDF43xbypiBBVwmDctMeNuGb/7
	 mzXe/TwjWt/vO6t3g6HKqZP7z+h2f+VNS0ZoCuuYdPvlceNIFcC0UDu5Re55/HL9zK
	 WWmuaLJkZzdhdcvMAqBh/Y6gwerLlYMUoJuun8Qi3NCl+5WnmvxVOfMJdjBito9G8n
	 4xV8PTupi8v7zjV7i3INLBk8GdL+m6mDIxtHC/NrBw9Nal3mEeKVdJ5gD9MqkUHWVd
	 6jDfxvExsoCGWRzdwKjRfhj2B+O5wg2Eyjj5wNg0/kz72giLz/ZqcAURPB6nLUgVkB
	 xa98y4ET0q3FQ==

On 27.06.24 16:12, David Woodhouse wrote:
> On Thu, 2024-06-27 at 15:49 +0200, Peter Hilber wrote:
>> The idea with subtypes is to be forward-compatible with other, yet unnamed,
>> leap second smearing variants, so that the driver can still recognize them as
>> UTC-like, even if it doesn't know the particular subtype.
>>
>> But if only linear smearing (and perhaps cosine smearing) would be supported
>> (apart from "unspecified" leap second handling), and the start and end times of
>> smearing would be indicated explicitly, then there would be no need to
>> distinguish subtypes any further.
>>
>> Then, the smearing subtypes could become designated types.
> 
> I don't think we should encourage this concept of "UTC-like". If the
> clock is subject to smearing, then that is *not* UTC, at least as far
> as a precision clock is concerned.
> 
> And if it's subject to smearing that isn't *explicitly* defined, that's
> even worse. It's up to a second away from UTC, with a deliberately
> introduced 'error' which is unpredictable by the guest.
> 
> Perhaps the guest could treat such an undefined smearing as a monotonic
> clock, but nobody who cares about precision should treat it as UTC,
> surely? Or even "UTC-like".
> 
> We should expose only fully-defined smearing algorithms, and if they
> are fully defined then they can happily be a top-level *type* rather
> than a subtype, yes? Let's not have anyone accidentally consuming them
> and thinking they're UTC. 
> 
> 

So my above line of thought would result in three types (not subtypes):

1) UTC

2) UTC-like with leap seconds smeared (with info about smearing:
   linear/cosine(?), start, end)

3) UTC-like, with leap second handling not specified

I understand 3) is not suitable for your use cases, but you could identify,
and refuse to use, 3) (that would also have been possible with subtypes,
though).
