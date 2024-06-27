Received: from refb01.tmes.trendmicro.eu (refb01.tmes.trendmicro.eu [18.185.115.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412891E49D
	for <virtio-comment@lists.linux.dev>; Thu, 27 Jun 2024 13:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719494224; cv=fail; b=LPhKpRq3IuCamadWJPQHk5hRaS1d1J+dIXIScw+1trLX41+Pox8EJ2GDutKe/anmoDz6+c5cjbGqXanj2IBtL/M+LDpVe7fzR1D8KmPe6DvN6GNaeTj8AkE9z+tRRKnhTcwpGaigUE4txK10PX+2GeMY+DyF6pA/XTo4jlU/Dc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719494224; c=relaxed/simple;
	bh=kQt9UNhB9sy5+e1gncCkwFY3Lol2IjoHI9oSQJgVoAw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ee9hwId2ByoZ4iTFe82gzbIHzPmci9dWwrssCWaFgU8Ww4bEsRAhEIcT3OBxZq8Z1G2dvsMfEOKXqcRQuprLTexvhYMs0fVWVjivxW+KlOIl1XJFR+c0F6oU5FXEKlV+neZeObKV5JgiWDbcK6Eg+i7BGmmeH2O4oCz/aclE1Po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=Kt+5yhui; arc=fail smtp.client-ip=18.185.115.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="Kt+5yhui"
Received: from 40.93.78.52_.trendmicro.com (unknown [172.21.9.37])
	by refb01.tmes.trendmicro.eu (Postfix) with ESMTPS id E363D10063E34
	for <virtio-comment@lists.linux.dev>; Thu, 27 Jun 2024 13:16:52 +0000 (UTC)
Received: from 40.93.78.52_.trendmicro.com (unknown [172.21.177.236])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 5739610000E2D;
	Thu, 27 Jun 2024 13:16:44 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1719494198.632000
X-TM-MAIL-UUID: f0a69f4e-68a1-4a9e-a3f7-dfb4c9952ee5
Received: from FR5P281CU006.outbound.protection.outlook.com (unknown [40.93.78.52])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 9A5C6100058F0;
	Thu, 27 Jun 2024 13:16:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPOvH0YIlDIPWxSx5iWhdNX/pirxmqjIZDLnhn1H0whiDbu90x5FdHUdWKu3ynD15txddg0fV8mW4F1/vfLJqGv5VjEwbxEjjYpN+/v6eC6aVKjkasTIZ81vr/3ZYhmkohAd68UZnk3pHe8XlryvYm6yrLZuHLhlaX1rcV9v81TREPOHQyiG8cEfFbMyc99DDDlU1XDFbDa4KZ36FbyE15edvn4VHJk+JzkP8aigFZ+NdAHmAXNHt4MviKsC0b9CpRVMdiwVR91WCquFKRGVccbTzZghOkgNZjhDBsBizIvm9EsLN5ZVhHFagrUgw1OA607fJ5hUVEYdsbAzy0QnJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKYWTgUajuoIlvQwy4jBaM+ZJbkcNidFrov64poHTlY=;
 b=fCvBQvzj/SReuLkIgSCrqkAH8Qyt9V/ciK9fjo2agwHVfBGit+prt5uk/5mNVkcAIgOzWlgn2g0GIkjiNTbLgFn4ksVF9P+3gayYEfyFPgoCLIKI/M0x0Zic6IkHLgPVkZGxYlQBSUz032E06y1eXPhVbPwxXKpSbQw8V+oUhIBxnwAMcJbIZsIEIw3/5Xr2zpHS3BvEj3fFtYa6dNdZW1zVDR/H2iJaRxRRoOJqZqlNhJ0JqpZ8HhlKEuEdvGi18SNTexcqm6SHJTp/gmSP2O/QQhFnM60zcnWSP1vvKOr489pW6zwTmG13K63cddDGodN78Gi48UUT4Zna0Sm6WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <9d76d8ae-6cfd-4693-ae41-03415923f764@opensynergy.com>
Date: Thu, 27 Jun 2024 15:16:35 +0200
Subject: Re: [PATCH v1] virtio-can: define out of rage can-id and sdu
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
 virtio-comment@lists.linux.dev
Cc: sgarzare@redhat.com, Matti Moell <Matti.Moell@opensynergy.com>
References: <Zn1IJT/awG4NZijw@fedora>
Content-Language: en-US
From: Harald Mommer <harald.mommer@opensynergy.com>
In-Reply-To: <Zn1IJT/awG4NZijw@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::7) To BEZP281MB2376.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:44::7)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB2376:EE_|FR3P281MB2015:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd30206-f5c5-432d-3ee6-08dc96ab5fe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TU1GWUdGVWxGMEN0WHFWTDF2a01BK1ZrWFpQZlVKeFFpMEJFR2tsUGJ6S29q?=
 =?utf-8?B?NTVNd0EyeHNPTEhOL3Zrb0xrMDQrQlZUNHlGUHh2ZjdvTmxVOWZSVmMzM1Y5?=
 =?utf-8?B?cmJ1MlU4TFBSbjhwTWh4VHI2VDlENW1NUTFScFpscDlLbHg2VVEvWkc1N3Y4?=
 =?utf-8?B?OXRiazRwMTh3S3VtOGMzdGVJMkRaVitYaldJdkZPd3FmTDZQT1NWdlZZU2Fs?=
 =?utf-8?B?NUdHeWRSaS92bkJja3I4eVpkQVJTQ3ZSSjN5aGl6dWsxVUVKYXVCcnU0Sm5T?=
 =?utf-8?B?d2xnRkxLYWhxaytkbGpUVHdhejREZm9QLy90a2x6MVpCejNTLzh4UU54dEVh?=
 =?utf-8?B?NTVxRmRKa0x4Q1BSbHZOMVc4SXdCelorMG03WjhnaGRFdjlhVElJMWFTUG52?=
 =?utf-8?B?MkR0bTd0cVZnaEcrUm9ycGwxRFRYR0lZMkliaDgxRTVsTUR5NTZBQldyUkhk?=
 =?utf-8?B?OFcxN0x5VzV5dWlwVGRYSU0vVFdvRlVWdXdoSllzUjhxOG9IUDNSU1lON2Ji?=
 =?utf-8?B?dTVuUnc0ZnRnRTg1amhRTUtoY0dIYkJuSVBua2Rxa0I4TFl1NWFtUnFrZGpt?=
 =?utf-8?B?aHduZ0N2cnVwMDkyaWtFRXRGd1gvTGQ2cnBlTUhCQmZyenNSbmRxQ3RjaURr?=
 =?utf-8?B?VFpUeHVkNjB3R1AvVVVwSjNiZ2RVb0dxeDB6ZXp3cDVJRVIybWNjaUwxTkJs?=
 =?utf-8?B?Q1ZsdGZzUDNpTEE4R1poTmFGRDRIdy9rNXhTMUxYMDdTU1A1Q3YzdTIyWmZa?=
 =?utf-8?B?eDkrNWcwV3pPdm0zODB3aHhQbTIxeTVkdzEyaGVvc1UxOHhhYzlsd3NTYk9m?=
 =?utf-8?B?MFI0N0RkeUN5ZUJxckhwMnAvTWlDOG5id3JkeXVyYkt5M0NNck54eFRBaWRj?=
 =?utf-8?B?T0cxbkNRVFF4SkRZWE5aOVpQS3Vvc0FCaExaU2tybnFyQUNKcHBLdTRpZWRW?=
 =?utf-8?B?WUt5emNrT3RLT3V5N0grK1o5RjZZK0hKaktVY09vTTFyZjdLd2NWbHl3aVpj?=
 =?utf-8?B?NUtEQUxRTjRKSEQycVkxNGk2VXFwRmF5b3VQZmNiNnFxQXJETDhJUzlIVVNB?=
 =?utf-8?B?a0xRcjBNUlFyTGdHRmtERnUwN1FRSDFyUVhMQktIUmoyL3dRUnRsYmdUM2Mz?=
 =?utf-8?B?enFVT0FkaW5FUnYyVUdVWHRhT0k4OVFBQmhJN1RrOWhTQ0pDeGp1U2ZyeWNa?=
 =?utf-8?B?enBFQUhmemFwNXF1amcyMFBCSXFEc0lJeStkcVpmNFVpclI0WGhZUmQxYU9q?=
 =?utf-8?B?UUsyT0ppTm50UVhZTUlXb0dhWHAwTUNNdWhIakt3M25RM0lWUXFqQVc1ZTlP?=
 =?utf-8?B?WjdKOUpkZWNkbXBIZ0Facyt0S2orZzlZVkh2ckx4UnR3dDRnM3JPYjNQNllZ?=
 =?utf-8?B?RlMyRkw0QTJub0sxWkJwM25KQXFhMnhoSVZyTDZHRzZaUUdTT2QwdkhIT0hX?=
 =?utf-8?B?WXRhZ2g1T3RZb1RubWZIckdYb0lvTktrZlEzeWtxdUkxYXl4Skk4WVljSTB5?=
 =?utf-8?B?T2IrVTM5Tk5pdUhEeWVmRkYvNWxXV04wOFlNODBmS2wzRlJMR0VQNHR0Tlgy?=
 =?utf-8?B?K2NHRmZkM3ZmVnN3eHBSV0poZTIyR3NiOWRla1JuZGxvVlhrdjZXUmVaTDVH?=
 =?utf-8?B?OSswekhkSE1kcWpWSXJleHhoYjhZMHZuM3Y4U1ZmSm12M3czUWlaZDVNTnVr?=
 =?utf-8?B?RzdaOUwzZUcvY21RMXdRNHF3c3NnMVRPRjgzRGlIQXlDVndWMmgxWnFzd3h4?=
 =?utf-8?B?TGFUTExLK2hETnJ6OTlYczVibTBDblNSOU5TR2hjUGZNUDdrV1J0djlPdllD?=
 =?utf-8?B?c2dyNGg4aVRQWVNBa1VSQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2376.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVJaNWc5REl4SzdabE5qUC84U2I0OTFoemptN0xkVGsvSGhCeGpseXVHTTN1?=
 =?utf-8?B?em9iTlhXWnVsTjBrREJSeFdrVHd6STNoSnF3bldndE5VYk9QVENWMDhhWXJh?=
 =?utf-8?B?NnY3bEFXeUtBNlh5bk5FcVIvOFZGc1A1eWZsbTcyNWw2QThwc1JYUC9EZVRt?=
 =?utf-8?B?UjIyUFd4VzFjZ2M4T2R3N1hiUTNUS3V4TS8wVTE4d0ZSb0pmT1NqL2Y1VlpW?=
 =?utf-8?B?aHA5aWRFOXpuMXhvRzIxQUlPUnRZQWVFZi9zLzh2aEQ2RktRQ3VuM1V6YUJm?=
 =?utf-8?B?U0dVTlNUWFh5eXE1SXpkelVITjE1OUozNXhrN2tRYWQ4YVliVlNhd2krZVYz?=
 =?utf-8?B?ZGx6WUUvVE9zVlBOK09yUUYrZ3pudGxYNE1KYUZ6T0ljYjVhOUxqcnMwVGti?=
 =?utf-8?B?cnByZURjZVJmS0prcWNSVm91aWV3cWh5ajVYRWlKVS9hK29oVVVqcVhtRm11?=
 =?utf-8?B?OTN0SGZySDFGNnR3dk1KdzdVMVRscXQxWFJsUFphbGhaNTN0Snc4aUorUHpo?=
 =?utf-8?B?MTlwblBrVUdaQmpEU3BDY3VkVS9PMEo1RVlmWVVDNTgwNFoxSWYwVkkxakpp?=
 =?utf-8?B?NktIWjdkZDY0N01tV0srckZjWUpRTE02MTZjM3Eray9hWGxmMHdNMTFpdVBI?=
 =?utf-8?B?VExJcDNuS3pBdHo3bjBuRzZkRWJKOVN2bGdhLzZXRmhhS01DaVNITk1SYmxY?=
 =?utf-8?B?VDhCZUUwOGJWNEdHRzhPV2NhcGo2SFh1enROU3U1ZUlwc3RTTGNKbVZQTFVN?=
 =?utf-8?B?V2dBRm04VUhXQnBMYUxBbTU3cVJ2bHhBaytRQk5kQTZ4TzR3MHN4Ui9yRC95?=
 =?utf-8?B?OW1YWE96TFVBS0F3UFZFU3A5bEFVZHJiUGZldUdYTHJHOEFrYzEwZkovL0VR?=
 =?utf-8?B?YisydkllUDRiNVZEQ2RIb2xEQlVLQy8rb0p6b3BzUmo4amE0OWZ2eCtUbmtI?=
 =?utf-8?B?M3RvUU1oRWlyRE5sT2x5MlBKZFU3WjEwQnBnUSs2N0Z1WWtibTI2ZXJwV0xq?=
 =?utf-8?B?dFhBMWU2V0p5c0Q4UkZxNENUb3NwaFNtRnlUT0Q5QnMwcXVSUlNGamZPM0tl?=
 =?utf-8?B?dk1qZUxpMUdBdk5jNDl0Z1RaNjVBb21OOTM4aU45MVBkeFI3RVJIcGlta2pn?=
 =?utf-8?B?SW1sYjl1Q3BOSmExMXZLZ0I0cUhsdS9CY1g5dFhSaUkyTFdLMGpaYVNNaXVa?=
 =?utf-8?B?ZTQxa1Y5UXJHQlRLWjJBUUJGOHFoTUJFSDNFcWdvaEVSdklLM0pVMXdpN0JC?=
 =?utf-8?B?OUhOeTg0ZXFRdjJNakRyRG1SWVIydE5zRDBpdkFhL3RHd2d2a1BiRjNwZjAr?=
 =?utf-8?B?OUptS1hNRHJkTkFKMS9oUzVMMWIxR2N3ZG5qZGhYTkx5UWwvMEtGNlVpNm8y?=
 =?utf-8?B?NE9qcmZiK0NLU1NpMmRxdDNHQzNmS2JTTUhXN0R3VHhRQmgzcDR1cEtqd2p2?=
 =?utf-8?B?ZWU5Q1prdEF6Umt6L3NPN1VTQ0FOeXErOFMycmc3Y3NJYkRsSi9rcUxuMWtW?=
 =?utf-8?B?a2ZwZzdWYm9ESUc5MXd5anVxWkc4VGs0cDF2QUZOWGRIeUpmVEtxOU5ENENC?=
 =?utf-8?B?WG1xVVQ2NUQxTDhsUHFPdk5uTFQ1L3RPcVhVYTZQb1VKZWdLQVAxdFg4cXNY?=
 =?utf-8?B?bHhIaDdqQzZEeU5RNTZ6Mm9vclBzVjhYWlZ2ZW82Qm9BWndEK0cwUjdIQVJh?=
 =?utf-8?B?RTA3WUlvQkJRYi9qbnYzeTNBYzAxQkFLakduMEQzWVcwVWZVZU5BMmdIS0oz?=
 =?utf-8?B?anNpVkxtMFRtNU5QWjVXYUgxR0JTTlQ5ZFNYcGhWUEE0YStDK1VnZzlBejZL?=
 =?utf-8?B?d01aZnFpdDFOOGowd05sZjV6TkczbjhiTUVoZGJyTjAySm1zTUQwWmRwSk9C?=
 =?utf-8?B?cjBkcEdERmtNZlNHSEZIdHRDc1FOeWNMT2xpRG5CNWU2azRrdytrS3Zoa2ZV?=
 =?utf-8?B?VGhXWC85RHR3WkVCVjhzVzBnOEJBQ2RiMGZyRS9iNXIyWmppaTlFckljcWs5?=
 =?utf-8?B?OGhQZmtHK2Q0WFdLMCsyMWtrNFlzSzNveTFwd1I5dndQSFlJYUo1QzN2Qk1V?=
 =?utf-8?B?VmtzSFBmWEw3Y2ZSclErYW9UYU5DYjl6dVZxS3ZZcTE2TmJURXdIeVVvUDRw?=
 =?utf-8?Q?Vj9OSZMh+rPfmyTMrHs6yzOba?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd30206-f5c5-432d-3ee6-08dc96ab5fe4
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2376.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 13:16:37.3204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rg4PRp59MIvnVg9Hd5oIErFQ0KHvPOfK2wO05yy/5OSgAkdj7S4cgWjB+JXYt/xZVYRnBDx2d1hpw7xoV6nhBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR3P281MB2015
X-TM-AS-ERS: 40.93.78.52-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28484.007
X-TMASE-Result: 10--18.208700-4.000000
X-TMASE-MatchedRID: 6otD/cJAac1TzAVQ78TKJRhvdi92BBAuzmG9pmg8ncKt4Zcwyi58uUm6
	zKX/LJcmnQvVnz410DxFY3YhH+K/z63XYtsOH2/QRYNhzuZZjRDKICKMKO5WPVkDEupan34PE2n
	AUajxhxee3AwfBS1Y1unitB4ILU7bJQ2Ybiz75wwhPK2mn+OsTLz9nrO3Uquu5LGd87xcOHc3tS
	NNRltS4UKVzzaKe4kbsq0Ed6rmnKeRlACbk4MJ7KSYFFz3IpxkyfjF8MS6pxVBRmUI+A4g/IXrN
	S+xKlbqsQO6Vch/CfaNfczRoWaFQ7DP95vZKN8oWWSz4drjSLhimmowi1sSA4j+QP7WhY0Zv9rS
	d36EgULA931+mNd9sNLdHHLXgng3t8dSMEPgsWu0w2Ge1N5gx83QWfbL6wKxM+wArn+oEOQ2RRI
	MOrvjaQ==
X-TMASE-XGENCLOUD: 2139481b-bf2e-4d5c-826d-1c2e3734009f-0-0-200-0
X-TM-Deliver-Signature: 7283B91D5BD7548CDEA3A044EEEAB4A0
X-TM-Addin-Auth: pnNHzfyXMdmQOEwCbOgkXHB5Cb9SPfsD1FNXhxpL3SLQdTK9YMUQDoLHOt0
	RxsMfA+P8rPGMQEs/5USSEtWv5KLkvTu3bb7qQNMGhtqLT2HsKB7Gmfv3HI3VOeMBUaxZRGgyhs
	fu29Ymw7wxrOe6+EhwZXTS4SPlxx1spXMaOMS4rcvk8lz9thByS6eiQmG/stsLa38QwmR5VAWCI
	UwPtiw1xmzSvU71GnBEQnpOM/s/rEfYKSlC/TiPKmE2xzavlhyF7cT6E5PBUAYh7gC6n8+tiGMg
	PGgI4TYsqZYLns0=.3pRScvfdg+RapPYC6PnHPovvCEV4UoeVfTrLf4I80N3sH0IDqQALiUDlIp
	V8dIYb1L3rzSdIsbVMGt2FQ/H62d4jW1vjifk0t6wx3/3Z3KZjhpA9WuHE+Ry11Jmd3HgtW1cf/
	eJIT2Fvw1PqjkEE33fSn4MkDSdJeC9tMGJXVv6DeE8aT5RHzDK23mvcCUS4CDYvPeoziY/nKMFd
	GeoetVxchyUSLw3nsmlF9dZhhZh9wEZPVlGppcObyBFG0IjjU/KBUo1EhBmlV2ArF4KYM01BmX4
	4tIhTSQyhAKM7M51FR/7gQ6VWwTtaMpKynjVFIwqF5/iq+Hsxyx+n1ybmDw==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1719494204;
	bh=kQt9UNhB9sy5+e1gncCkwFY3Lol2IjoHI9oSQJgVoAw=; l=2225;
	h=Date:To:From;
	b=Kt+5yhui+AYk/vEDb75DNxLZ1sfK63Wqr1miT2Q1CXksRFthFOwVRqDtUCZ3QEfpt
	 N3GA2qa5ORDSgMJl8VvRH/kakJmkgq5s8nXjDSNhh00zay/iSlbl87Tfwu/bYfSU8B
	 X7DyQlneIc0bktED0RPfV9Cgx4FliTnG/kmiCG6wgxEf5BsYl2Nf0zS2TeLqZlYX0K
	 q43CkyKfC4hrp1StQC9TH3aSC+RFIXqT0J1uU+jsOSjHV8tnVeTBvBdS8JfLQYnDgZ
	 quzh/ZP0wLDNFKA73bwosTFzvduH2RnrtM+Qln0TgqWN9cty/Kkd1FUk0c0vbnvVA4
	 UJVMKX2eHIzXQ==


On 27.06.24 13:08, Matias Ezequiel Vara Larsen wrote:
> Explain when a message is out of range.
>
> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> ---
> v0 -> v1
>      * Use length of the field wording to indicate out of range
>      * Add when sdu length is out of range
> ---
>   device-types/can/description.tex | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/device-types/can/description.tex b/device-types/can/description.tex
> index 2511d9c..fa56abd 100644
> --- a/device-types/can/description.tex
> +++ b/device-types/can/description.tex
> @@ -191,6 +191,14 @@ \subsubsection{Controller Mode}\label{sec:Device Types / CAN Device / Device Ope
>   invalid state with VIRTIO_CAN_RESULT_NOT_OK in \field{result} and MUST
>   NOT schedule the message for transmission.
>   
> +Note that the \field{can_id} field of a CAN frame is out of range when its
> +length is more than 11 bits for standard frames or more than 29 bits for
> +extended frames. The length of the \field{sdu} field is out of range when it
> +uses more than 8 bytes for standard frames. If the VIRTIO_CAN_F_CAN_FD feature
> +has been negotiated, the lenght of the \field{sdu} field is out of range when
> +it uses more than 8 bytes and is not in the set [ 12, 16, 20, 24, 32, 48, 64 ]
> +bytes.
> +
>   If the parameters are valid the message is scheduled for transmission.
>   
>   If feature VIRTIO_CAN_F_CAN_LATE_TX_ACK has been negotiated the
>
> base-commit: 37c6a406678a5ee891fdf5671298cb4fcfa517f2

"If the VIRTIO_CAN_F_CAN_FD feature has been negotiated, ..."

Would mean that sending a CAN classic frame having an sdu length > 8 
over a virtio CAN device capable to send also CAN FD frames would be 
allowed. This is not the case. The condition is the type of the actual 
CAN frame to be sent.

Decisive for CAN classic / CAN FD is the presence or absence of 
VIRTIO_CAN_FLAGS_FD in the flags.

Having an automatism to change a CAN classic frame to a CAN FD frame or 
the other way around under some conditions is not in the spec.

For example: "If the VIRTIO_CAN_FLAGS_FD bit is set in the 
\field{flags}, ..."

Or "If the frame is a CAN FD frame, ..."


