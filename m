Received: from refb02.tmes.trendmicro.eu (refb02.tmes.trendmicro.eu [18.185.115.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D51349656
	for <virtio-comment@lists.linux.dev>; Wed,  5 Jun 2024 08:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717575228; cv=fail; b=FWlnjgQ2w7JWUfq5S045WsLLMzsUGEARMw+B317jVsmMJJIMYbSFKUm67jzYh+lsF6dIQl+MOvGGsNw6BR6JL4kRDJWembOIbUX95E4BbHfNtKLDXXo6Jz9q4Na3DnBo4unzekT9nPMO19Mxxh6TICACcUcKct8FKfJyIzkJDVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717575228; c=relaxed/simple;
	bh=JO0cld7p0iTVdGpJ64UWXNaNRfPLZ0WH9Blo4PPfzVY=;
	h=Message-ID:Date:From:Subject:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ju5i1HVrcB6EOo+Y138ixQxifvvqCKU57K8FZjyyuOZ4yWs4T3Lri+ASspdngUVI45wRwG5fQrVW2aEAWcNlkzRqFivpFTkneCYwwykXldK2bPevOaKeTQ0IGEfb9KRhUZ36TMmIyijEp6m5qQJOmkeyGE5Zz+HePet8Iey5edg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=DH4d/+Lx; arc=fail smtp.client-ip=18.185.115.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="DH4d/+Lx"
Received: from 104.47.7.170_.trendmicro.com (unknown [172.21.19.51])
	by refb02.tmes.trendmicro.eu (Postfix) with ESMTPS id 06E7E10147249
	for <virtio-comment@lists.linux.dev>; Wed,  5 Jun 2024 07:19:16 +0000 (UTC)
Received: from 104.47.7.170_.trendmicro.com (unknown [172.21.192.213])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 6503510000F3E;
	Wed,  5 Jun 2024 07:19:08 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1717571947.560000
X-TM-MAIL-UUID: 0dc7b455-d49c-4d7a-b2ee-a08be90951a7
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (unknown [104.47.7.170])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 88FCD1000D9A5;
	Wed,  5 Jun 2024 07:19:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GabVK+VXhAFYzqspMmFWlqpsYfcWRgLIHqO0BPaxxAOb/qxqQc17bNjGdO1bmJCqh8Wllk48snOOC2vRSjmLGNOeVSW/qEZn5J8cL0QPcVVbsAQiPIL8Po7rQH+l0Isp3TdoN2CeHji4Eh9ei9VE+PVjqOma46dGi1oIn5WM1wcjAkj7RdLyeC45qGPaXOeS/t8AVirPuvGAaMs1Q6vYiDt1ofVAafn2GWzmkkJGw6I2wez7jL9Z7iz90sYLGzxO2tjXdsnhUQ3LMSWRBOWCA17Hxu17kSj7vh3j2c5F5wdZcfoHmgbSRzRCfj5VFjYzepWG6vSzoNEe4s2pLmMqJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xntb53hh/N7cODUD5xskugCRrPJZZGyo0Ggr+51Nopg=;
 b=S/FT5lJs4aWqu+wCK5LCzar3lNLEsFhLEbYZpovU/rhNBXymcCtO6FmomRUH640wubNDpjfPP83sl8kpoOy2HIMRCoJn7w2SJ+AhLJQDo+1k07W1IUoilIVyt4cUObeK4tsWQqmmJBQI9me6I3sRiqFstW0Ew6Sy0NqQPdeUI+TQR8ag7uo6SAy56kHDKVCWBQSp9bl+Z4oPZojARgLCDQewUK1OnJM/03euSuBM2n/j2AFqdFxSPu105j5VJW20qYT8kbrSv0bag9TDhJYQFzlOXaIeo45OHsYo1jm5cND9R6W6abNMioAFknG0FX/e/oVmTbPKXMX2NmGWtQpH5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <a58fb8bd-9f82-42f6-96cc-c549b215eb44@opensynergy.com>
Date: Wed, 5 Jun 2024 09:19:03 +0200
From: Alexander Gordeev <alexander.gordeev@opensynergy.com>
Subject: Re: [RFC] Process to request a vote for an issue
To: Cornelia Huck <cohuck@redhat.com>,
 virtio-comment <virtio-comment@lists.linux.dev>
References: <87plt6nlq4.fsf@redhat.com>
 <b833b3f6-fad6-44a0-a67e-f1cedeeba03b@opensynergy.com>
 <87ikyumeec.fsf@redhat.com>
Content-Language: en-US
In-Reply-To: <87ikyumeec.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0043.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::28) To BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7::12)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEXP281MB0183:EE_|FR4P281MB3664:EE_
X-MS-Office365-Filtering-Correlation-Id: eab92754-c2a2-4634-3817-08dc852fc8b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2dYSHdvU09JRkZNRVByMks3bU9GVTUzZStjRWNXbS9TZHFOaFRIcWVwSjR2?=
 =?utf-8?B?RFVVSlkyNUVEdExsZG9id2F3dlR2SmVKTFBwQy9NeHhZTWpFbjNhY3dwNXJn?=
 =?utf-8?B?Y0Z4dVUzSURMRnlnNjR2RXozeHJBWVBHVTZZSmdBOWQvWXJFdFVyc3JnZXJx?=
 =?utf-8?B?T2tjemtYdXc0V09mVjRZNGlNazRneGo4cnZRQkphMzF0Rm1uUUxza1BYQXZ4?=
 =?utf-8?B?bXhzZ0U3VzY2QXFSeTlGcVVpSlRhVDRTNURyU0JLcDRabkYrVitwZzFUT25X?=
 =?utf-8?B?NmVOYnhTbE80anAyaXBTSDRDZlQrL0NDTUZMdTc3Qm4vdkhZaE1Jek9IL2k1?=
 =?utf-8?B?QU1CaE5xV3pQbFJNUWMvOWdaLzZuOTJQZnQ3V2NqTHlRMXR2b0g4OVhydmF5?=
 =?utf-8?B?Vzhqek1BVjUxUHJWVVQyZnc0d0dkTFZEcEpDUjRjWnN6aERHUzBmWmpNRzVK?=
 =?utf-8?B?Qi9GL3RUNHk1YmRSL2dwQWEzWjdXdUpVOWZGS1JjQTFmNTFiUGJxT1p6TkVG?=
 =?utf-8?B?Y0ErVVkvVnlSSzVkNEsxT0JiTHNJMml4YkV0K3F3Vnh4ajZlcFNpd0N1SW9I?=
 =?utf-8?B?dVE0U2V1ZFVRN2M4ekZhZk9pSEdQbkRCcnkyQ1drVy9SSUNEaTBtSEFzOUZu?=
 =?utf-8?B?YnFUNDZYV1ZTanQ0ZlE2Q0I2Yk9aQzVERDFSMnVqVys2bFk5K2NyNi9VR2VH?=
 =?utf-8?B?QjhSZGhNRUM3ajFhaDUxRTRMQm0xekROTnBqSUV2Q1U4eXdoUEpUSHdMbTRN?=
 =?utf-8?B?cVFNZTVVeWl6c2tDU095VDFWU3ZwNmpLZUJpME1icTBzMVBlMjdPK2c5bDNN?=
 =?utf-8?B?NDhpWDN4UGhOM3RuUTU5K2NsZUxkbTZ0QmVNN3lNVHRKZittVnU1bVg3N205?=
 =?utf-8?B?Mk5LQW5iTEhsU2l0cVpPMm8rRTNidHJ3ZVlzcURIZHYxcGcraUZPeEhPVHpG?=
 =?utf-8?B?WDJMWFVvWDY0dDFzemhpQnlBcTJlRHlNY2JqR3NKcTJVckwrbFRzODI3ekVs?=
 =?utf-8?B?MlFudE9pbTA4dzVET25EK2NyajhuNjM2SGVjYXRDYzFjMlNsNHVQYTREaFpk?=
 =?utf-8?B?dE41NXgyN29ZeFpTRUdWUzYvc2JNRzkvUlpVRlM4QkowYmhwc3BUSXI0VDFx?=
 =?utf-8?B?YWtnRzZsODFvS3NPYTZqUndsUE8rdVRLblQ3ZU1SazE5N0sxazE5Q0lNWVBR?=
 =?utf-8?B?K3hxOFRQYzdRTWI4cFlKdzBEc1EwZ3VaVGo1bDlZR3U0cTNLK1ZvT1Z1MVB2?=
 =?utf-8?B?aEVQR2tlWmdUeHVxRHNva2JVckg5UFJGNXZGdVhHMGFnZkNhamloSEFUWk05?=
 =?utf-8?B?VGxjSEdqcWV5c1NISTRTL09paXRTa1RmS3h3dkdvVXdTZllaWXBFa25kQnNv?=
 =?utf-8?B?MUpLZUt3U3VKYVl1OWtMTGorTXpLc3AxNjVWaGVReHZBMlMxenlxYUdnaGpT?=
 =?utf-8?B?ek0rcWgvM0FyYVY5UW1ua3dSeW1xbm5kS0RPckxrVmt1VnJCcHgxWlhGUmJI?=
 =?utf-8?B?d0lqeTBnZkgxR08raGV1QUoxdCtDTGFvVjErMUFjUVNsRlBIN2VYT3RtSENP?=
 =?utf-8?B?dGlpVlNaVi9FeFBWOE9MdlgvK0RPUmZFTjBpKys3c0R2aDZSTndSUG5VM0gy?=
 =?utf-8?B?VFNqV1NvRUVXN0JRWHFDMWFqZ2ZpS1ErTXlMcWtPRE5FVk5IY29PUkhISGJH?=
 =?utf-8?B?dkRUYkRGQWlGc3FCUWJDMllFeHRMTUV5ZFBYRFBRUGdLclJrdzlZSWVBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzFETTRwSm40aUNxUzl6aDlEbWlUTG5ONlZMa29qVnBiNW9jMWN6ZVpnOEhH?=
 =?utf-8?B?OXlxVHlaYmNEaTlmQXNWWFNXSldleWlvZ0I1akZXVXpDRnJqdmxpM1dXOVRI?=
 =?utf-8?B?OC9zcEFwc0xpQ0ZOWkdRNHFJTE5sQko0ajZOZ3lNU3FaNXorQXE2R3p1R2ND?=
 =?utf-8?B?VGhZS2JIRU4zUWEya0hPSTYvcHNhamtyODU0dXF5cnhPRi9iVWJCcEs4SUpM?=
 =?utf-8?B?ZjZjSkJiUElKS250QUhJcjFocUcxQ2dwMVJiL082bStRWVc3N1QvSnZhYUtv?=
 =?utf-8?B?RjRUS2orWnc3Q2JkSmNRSFJBc0FsNDVwTTA3TXBYNy8rdUdvZzk5QlpEaGNj?=
 =?utf-8?B?WFR3OWw0VVpCOWk2dEErOFdiYyt0dmRqWkk4R294cFRYZzkwRm9ZWTBTclc0?=
 =?utf-8?B?R0NzekFTZDhvTWtxY0E1Sng0QThyTXhvdFhjb0dIVlVOMmpOZXNiSTdtb05q?=
 =?utf-8?B?UkhlU3FUV0NvVkZQZzhCNVQ0U3FVeUxWb0UvWGE3MEwxTHBRNEpLQmFiTFZp?=
 =?utf-8?B?aVJnNER4ZkZJU2lkc3llRkFyUnVCekEyeGFMNzkxQjcxWktVd3F5dnFPMWRr?=
 =?utf-8?B?bVd5WFFFVmkrN0V6MGIwclhWcG90aFZZMkh4STFsTnVRaGlYOWE0M3BsTmJm?=
 =?utf-8?B?YVZ3c1hoMHI3OGNoZUlqVXBKaGZlTWZqdmREV0hqVCtuMytPOG5wYWIwZUR5?=
 =?utf-8?B?TUJZcVlmc08zMUtoYXBPVXNZZmc1YVIzYldUd3F1NkdUNFB6ZEtmVmIxQ2Rn?=
 =?utf-8?B?dURaRWhwSEFUOXpQNTIwbnpEUmt0MUVVUWVjMHV0QmRoQnJMUXd0alhHeEFL?=
 =?utf-8?B?aCt2VHdsYUViUW9kY2FCbUhJUHU0M2lqdmhXM1NJMW1QUFZVbjJUT2pEUEVC?=
 =?utf-8?B?dXVFMmdxWkU0azRGUU5CZDlWcEpodjVOSk1HZ1c3NmVURkJrbXBWUmt6SUJU?=
 =?utf-8?B?ZkJJVzdML2oxY1oxQk1WMnIxM1Z5SzF3dXorcUFoMzcvRUhaSjVMcktoZTAy?=
 =?utf-8?B?R3Q1bVFWNXNXMTFZZkhhREo5bFE4Rks2R3FBVWxoYWo5Ky93cTNYWm5WVy9V?=
 =?utf-8?B?b2hnQ2RYYzVva3g1N2J4Qm9HaFlTRUtvVVR6TGd5SEJkbGtlSi9OV0huTG5r?=
 =?utf-8?B?dUdiUW5sMEw5U0JnVWFkbEVJNEtvT21KdjVKM0hLZmNCaXV0V0lpZy8wY3pr?=
 =?utf-8?B?TEtKZUdRd256c0FvMG8rNnpBdThsQm11aVBGaThmUzdaVWUxTGNHbmpUN0Nr?=
 =?utf-8?B?M2FjQWU3NE9lVlNFd2dXL0IwSlRablhDUzlPM0dLWG1wZmppQlpyY1g4NWFi?=
 =?utf-8?B?eEw0aVdyTE5YYVJPN3U0NVJhNDJBTDBLc1AwV2hBT21DMG9TVWNRUkZiZFpy?=
 =?utf-8?B?RHJpMXNnOGZBT1djSThSazJ5ZWdxbUlGYmNhZ0xSWlhYMC83czF3Nzl1TjBW?=
 =?utf-8?B?WUxpelo2QnpKVHZCS0VaTzAvOC9lUk4vVHlYby94VDVuQXdGdzhoN05GV0h5?=
 =?utf-8?B?eHl1dUtjT2lNbFZzMDg5QW1sZDdqb1RzbFVzYXB1M0V4L08vN0FCd3RpNHZs?=
 =?utf-8?B?UVM5c1d3OUZyYU1FNEZRZHI2amVCVjYxK3h2a05VQTZHQVdEYUtGR2RiNmtG?=
 =?utf-8?B?ZXJHNFhyYlgyZ05qSlU1a1o3dFNxTWVFMDBpOERyZUJyVHNlTUE4a2RFajJi?=
 =?utf-8?B?UlZsQnl6em5pQm1melBPQzVyaDFLeGxnUjViK1ByNGw1R0liUmh0eTVKajZn?=
 =?utf-8?B?amNlV055andGcUphZTFLeUZSTWwzNlk5bjVtNUs3bm1EM0IyZXVNbE5raldl?=
 =?utf-8?B?Snp5Y3dvS01nYkUwVWlnQUhLdEE5bnF0K2NpWncyR3Z3WmNzVUdBdGEvbTNC?=
 =?utf-8?B?WUh0MTZKNG80KzNzdjZqaWRYeHAzeGZQYkN4RVRXN1RJQW1hbFd6UStFTlpB?=
 =?utf-8?B?MDZWUXdjaVZNeCtJTXlmMWF5WkFEZndaaEhZc01sSzFDS0pJZkhyVGtFUXUr?=
 =?utf-8?B?ZVdSUjVTaTdSMktxZVRpeWo3VE9odnM3QS9nYThscTJxeEJJMmE1MWo4SmY1?=
 =?utf-8?B?cjBURmkvZjc1TzVNV1lWZUszZWY1RXpvektjZ29WMXNsR2NndHRURkNwRUgz?=
 =?utf-8?Q?ieQw1Fz6/QZdOKpQCrB2gcoZj?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eab92754-c2a2-4634-3817-08dc852fc8b8
X-MS-Exchange-CrossTenant-AuthSource: BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 07:19:06.0119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJfqY691FcdBsohv0X8BTedsp0anG475QFu1A9A93TMlZbf0mg3mZl2Kk9/WsrYZQFKGOim/+3glLFrAnoCdRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR4P281MB3664
X-TM-AS-ERS: 104.47.7.170-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28432.006
X-TMASE-Result: 10--30.980200-4.000000
X-TMASE-MatchedRID: cxtZ8fwm3r9TzAVQ78TKJRhvdi92BBAunsSRXdX/K/t4Ke7EBZv1ozZb
	pOprJqv23Qw0gH5lrHLyt66ldRflrZLAFIcgZWso+mtDRLyNCFoSlFBwyvSaLvJgeLgc7Ld87v7
	BMdRZyXMvqL7iEiu1aDYiXJDHdUv1260XlhNBFbgsRn4AJoblTTCgTL4opfSyu1ZYcpwtZCqLsI
	84HOJoY0XnaOzs4kHj1G9SFzHsLmmFfSMJIbyR/iw5LYnP0VIDiWuvX6uqb1or5FUtBPH7Hu1xQ
	wyw61RvSpBpP3vjmzmlA8a908Iah9/SHCgUCHXvDH4m2ujwCtsKEmq2HWwB6iwDA62lcE2tZAaV
	HzwWV+FhS9a8uSV+8QzQrEPaLWj0m4h/LUfnHjWO7ZeVwTH0dF6UsWSgw8xYdCVFmOb+7beuB14
	ADbID6ibMnHYLFAZFfuSbj3JX2h5xHKHpX0oMclssdJQrqxMa48GqN2zdnsnSr28TIGpyb9pJtW
	xFslpleQXffQyvTzqqidLUiUZwVn3ehwM//IdIqolsh7l9ctCjg0lrtKMWyg2h/xVLZG6HTvOSX
	KE9MP1A0TBAV57h5S9h6tejU7UDBJetwkYd1rZxg7svMtapLgP90fJP9eHt
X-TMASE-XGENCLOUD: 5ec25131-3f56-4a95-83f2-0843ed250644-0-0-200-0
X-TM-Deliver-Signature: 39E11275C4FDD8C721E6B63419E5ED83
X-TM-Addin-Auth: /Lw3nvE8JFwxgSdiiUKIs1wk9NvJ+EOsv1Jq6BaFLJ5ichtJFZ8837bNqx+
	LtZk+YAJ6RnLInZ0W4FzmaGnN01g9YymR+qYAkE5HdrWOCoruhPZf+RhFPWwlo3G5ToHTzUFZuk
	FJ4MBScl1v9vPZMU1P8ruL/CcHzYBzHFFO2Mm518vED+CwEl2XvsU+C8d/dIFPrDm5bmUbW8kmW
	Niii/uN6PdeeSxX/ICaT8BwVyHulf3gI7zQGttwCytACvFwJEXZXvqk+ilsdB1y6eCJlVS1yQPH
	001/rfoo7XxtqrM=.md/NwvEUqnpFIj2GJyXUTKYN+HHkcMXltP386T2E5AJXCYffd3zOZjyTEu
	2LAhArsRQ83qtUXLi19osTXKBEV7zUUf4qL7Mfux08UYf0oZHEey5XRHRsDkVTBaddV1MGO0UnY
	Sj4yG0rCY/2fvIsNFdBsTNeMNJzC+3eYenX4AUiUQ4M5GlYZs4y5lqrua/lHXaeModLDnbeVNaV
	4NlXrZFiHEaPujq+0ddKN+NqXhzm6ewQtaXdgcuFjudwwFsueOqjy/TvlmBHsVLDjPcCa08bs2o
	So7/XrSOidE0vFURp7jq6O7i0CNDs7qTYT6X9e2Bs7KKntVb6rmAdX27zAA==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1717571948;
	bh=JO0cld7p0iTVdGpJ64UWXNaNRfPLZ0WH9Blo4PPfzVY=; l=2674;
	h=Date:From:To;
	b=DH4d/+LxO3T4rBt5l9tSBM9oUvaumXkLBM5qWxasmoZjpQZzfmUfh7nVv86crWx4d
	 Mx8SE9GXyR/r5SORMlHbFz8ebffLSYPsTqV2qYrQgiYyItlGch2VoSVIQbdD66c0lV
	 A9aajnRQHusk81vJIPaviy9v1RXQ5KJD6auzNr8dGcy5vCFXpKStD1Pk0YFJBWBimv
	 TtQT4Dws+FbNB2X4KHTCBsQ2+PVOK2/P0mr+J2HIUY4Ob60nmHfZWE4vHBWlnlUu8N
	 ZekD0tYRbLFNcGCPHb5cOfDMyc7Zf6raA3EB8Fcd+gQMu0BKPs35RTmk0FKANJu+Ka
	 mjpm0FdK6Z+qA==

On 31.05.24 13:03, Cornelia Huck wrote:
> On Fri, May 31 2024, Alexander Gordeev <alexander.gordeev@opensynergy.com> wrote:
> 
>> Hi Cornelia,
>>
>> On 28.05.24 14:51, Cornelia Huck wrote:
>>> [first of all: there are still issues with our usage of the platform...]
>>>
>>> [Also, first discussing this on virtio-comment, as this is (a) where
>>> people who want to submit changes usually are subscribed, and (b) an
>>> actually working list, unlike the list for the TC...]
>>>
>>> The current process to include an update in the spec is something like
>>> the following:
>>> - open a github issue
>>> - post a patch on the list, link it from the issue
>>>     - iterate through some review cycles
>>> - ask for a vote, so that the Chairs will open a ballot
>>>
>>> The last step currently mostly happens in the thread for the latest
>>> revision; such an email is easily missed if you're not actively
>>> following the discussion. IMHO it isn't a very reasonable expectation
>>> for the chairs to follow each and every discussion in detail; at some
>>> point, it is much more reasonable to expect trusted reviewers and SMEs
>>> to reach a consensus.
>>>
>>> Therefore, I propose that
>>> - request for votes be posted in a new, separate thread, referring to
>>>     the version proposed for inclusion and ideally containing a note on
>>>     who deems this proposal ready for inclusion,
>>> - and those requests be clearly marked in the subject, for example with
>>>     a "[Request for vote]" prefix that can be easily filtered for.
>>>
>>> Thoughts, comments?
>>
>> Could you please specify who an SME is? Does this stand for the Society
>> of Manufacturing Engineers (sme.org)?
>> I tried to search the virtio-comment and virtio-dev archives, but
>> couldn't find anything relevant:
>> https://lore.kernel.org/virtio-comment/?q=SME
>> https://lore.kernel.org/virtio-dev/?q=SME
>> Also not in the spec repository.
> 
> SME == Subject Matter Expert
> 
> I was simply trying to describe the reality: we have people familiar
> with virtio and the spec, and we have people familiar with with
> technologies, and in the ideal case, we'd have both agree on a change
> (can obviously be one person, if they're familiar with both :)
> 
> /me thinks she should never have brought that up and thought that was a
> very common TLA :(

Thanks for the explanation. :) I understand the intention now. It is 
still not completely clear to me who would qualify as an SME, but I 
think we can try it this way.

-- 
Alexander Gordeev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin
www.opensynergy.com
