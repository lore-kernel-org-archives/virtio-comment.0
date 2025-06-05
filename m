Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2063.outbound.protection.outlook.com [40.107.95.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B912C1FC8
	for <virtio-comment@lists.linux.dev>; Thu,  5 Jun 2025 06:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749103921; cv=fail; b=RPSeeNoZDgTXv/8M7A31l7X9yED1ORJ4esAa4nWbasKAyL8H+ALLBmEo3JY+L4avAwsLBAidGi/fJxWNtLVeVwNXkM/kSi8f0FscTO8VoiU2LO3VQ3b6QbyL0NrZycQVx6L9Q2q0OsN47kyiGzijXT5sc14wG6QFFX/j2GChLY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749103921; c=relaxed/simple;
	bh=K1/vpgghnh8dJI2NGtUg1yDva7c9QlAmIqPg75yi+3A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dYKJ8UmCZudeVGQSQQf7c9qOABjd45PgegyXDwlJLl601P9VPQkps5gnC4tD+xaJyHYcRlWEYq8oDq71XPaKqXAjfghOsyltT4h+KVM/TH9L6xDCGWRHcVKshX3InoqQUrVCeCKyIHlsH8GQ1BNF1k/irI2TEfbVppMHiK3LDic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QgwlIpsU; arc=fail smtp.client-ip=40.107.95.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QgwlIpsU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8t7neF7HPniz0yWNn2aSClYcXyxszACPwAcRjl2AsyKvEz4yybbSNCCh6piMaRR9+tVFxTrVBq5oT9BjhIl2if9BY6LS+rXo/0BfcTfX4TzSDs8g/aK/4QyOKycSbRbjb3J/TFoQMFrCg1M/tg4SMOt5wqrCQ/FwY8hD9jhkmdZBQEuw7kajED1uw23r5vzeYmJDtnO7w9S/LSFKQmOe6IR0jEPzRFJKQJ0X9BPs2fJ82EYHESm4k1C+vIymqGrSuCgx61wxL5Iq2QgicCBit0ETg0kYjn8d8+YR2KsNI98gHVTn/t12mNDNfmt8HzLL1YcuYJ6xzUbZMrE9L6tug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CCjlX50GrhHv5cQlPFgjfuflU836OBAOJHyPzjxZnM=;
 b=sclvNrXBS2YvfwI3XYcDYGlAzxaHM7nebyygHHKr0o0qcV46MsfBOyoDAT47zwkuzGBSR9w4Cc/bpuqVLVSCtvPke/V8f+Sp/cOjgpHoQnn8+yh1jt97bYAQCIf8x0Et17AdHlaaWcm49IRAp6oNEX6IIKAIhw+or7XAc3VwyBTzJeCihO4Z86VWiV8+BSukBLkGPmwFGbTIgH82NSyk6mP/TDdppDcJnEyOMUcanKMzFNVZtO+U45tHZCb4AwtnqkdzJ3qfdd/KhWnygZDbPt79lcJuwtmyWYWE2iAH7JZM8N16W+nBDkNtewfVkFIYc3icbmVEoUruR4xwMQAz9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CCjlX50GrhHv5cQlPFgjfuflU836OBAOJHyPzjxZnM=;
 b=QgwlIpsUOyfcj3z7XwVmuW4fim+5VLRKFoTGI8GjOVK3zexsR6yaii9nPNHnqUqYsqMtY1bVlpy2DDYjCUp2/qfy8UrdOSmOnNeoHlwsnNQKLhvsCrylkBifytx57rnl2kacmrWq/nWDVRmBcN4QaHrjDncFjpVhUoWblEG0BUs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by MN2PR12MB4079.namprd12.prod.outlook.com (2603:10b6:208:1d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 06:11:56 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%6]) with mapi id 15.20.8792.035; Thu, 5 Jun 2025
 06:11:56 +0000
Message-ID: <aa31e9b0-2bc1-4634-a47a-daa92c389f79@amd.com>
Date: Thu, 5 Jun 2025 14:11:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] virtio: introduce SUSPEND and RESUME feature
To: mst@redhat.com, cohuck@redhat.com, jasowang@redhat.com
Cc: virtio-comment@lists.linux.dev, Ray.Huang@amd.com
References: <20250529082355.86884-1-lingshan.zhu@amd.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <20250529082355.86884-1-lingshan.zhu@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0337.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::15) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|MN2PR12MB4079:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce60a68-9dd7-42be-cd4d-08dda3f7dfcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ty9CSXhNeUpBSHlWdTBPT1RzZG1tR09LK1VtTWY5UmtmcFg0Z3AxeXNHRS9N?=
 =?utf-8?B?cVJLQlltK2tzRThxWFpidHA2Y2V3cTh6TVNIdWd0RzluUSt3SWVsN3JWK05k?=
 =?utf-8?B?OGFpb0l5MThKTUF0ODc5ZERBL3BVUExjRThCandWZDR4REducmVHbkhxVThp?=
 =?utf-8?B?Rlh2NERNYzZnS0F3dlVrUUhKMWFwUWRxQ1g0L01ycmpUME03MHp5WFc3RE9u?=
 =?utf-8?B?cGxGbEE5NXRRcE9HaXZnUkdOb3ROTEtncEk2SnBrUUErTzA0SWpmNDVMMi9m?=
 =?utf-8?B?NzgvSlQrRGszcW1HSTdvczNHTkZSSEtGU3doaGVMdC9aZzlSMVVhdzhyOVdn?=
 =?utf-8?B?blQ1Z21Ha0RnU1pZUGhZVm5hMmRmc2dTWHpOMWxTVUpCNHFBV0VDbVVuSitT?=
 =?utf-8?B?UnZlKzZ3N090Qk1tRlpWZXl2ZGpjRTBwNkxUaXJNSENOUjhseUtxZjdTV0pu?=
 =?utf-8?B?UXBoYkh4eGJzejlFb2w4cklodVZBbllpVTFyQmpPOVhEenFWQkhpaUc0NmhW?=
 =?utf-8?B?SkxOTXQxZTZ1dUp5aDRtdWhCSndsZVVLd2hnS2RqZ2xOcDRzT1JUUVZYNGlo?=
 =?utf-8?B?UE9ZbWpoRkxGRiszR1M5Sk0wYTZxdjlQd0hZK0JvZWo2dG1KdlhGckp3akJS?=
 =?utf-8?B?dGRwaFF4Wk5vQUFsYWdVTWQyZ1lkT2svTHk0TkRrM1lpcW9peTk3aFVCN3Bx?=
 =?utf-8?B?dVZwSFl0WEkweDBWWG5OWHAzZVR5aCsyWTBnc2l1LzVqNWtCZjRNZUtpcmo4?=
 =?utf-8?B?WHdUQktpYzgvOGVSZHp1cXJVYnM2N2taYlRZTmt0WDBYZXcvODBQdFRLOU9N?=
 =?utf-8?B?amU1clZSZmswRXIvdGMvZ2NpdVJKekYrSzREdGNjK0dobi8vZktOV0lxWndC?=
 =?utf-8?B?aklSWi8zd3NqR0M2c3VhM1ZZb0JGZWx0RnVzVzJXRTR0YTkwSG1DS1ZDZUkr?=
 =?utf-8?B?YTFCWjB5U2NLSmljMGErZy8rR29WUThKaVVlK3ZXQWxGMnROd01XK1dmTUZ3?=
 =?utf-8?B?dFNnbCtaem52TU5Ka25ZSU9qRkNzRUp6M2haS3pZQzg4bXR6ZUZoa3RhNlB2?=
 =?utf-8?B?RVlvOVl6UlVmc0dGV1pvdlJUaWdySUszaTNRSU96Y1NOSzFqUFVVWG1XbkVz?=
 =?utf-8?B?SE5zTng4OGFFUjZJMWNyNlF6RTd2WFZqQnpUUDJ5VTIrVVlJR01BS1JUc2Rx?=
 =?utf-8?B?cDVNeDR4VFYrKzhJQzlrQ1ZGZGNRLzdoQ243cFZiUDVaYVJEMG9nRTJpcHJB?=
 =?utf-8?B?VG5CejYwUUFOSVgzSkNacGN0MmVjeUxiSDBIL1FaNlc4R2NpUENrdWEzT2N4?=
 =?utf-8?B?Nlp0b0Zkakp1TTdLbEMzZ2FiNk9sK0w4VkcwdnhtdHRjZmc1dXNWMXJiMDNv?=
 =?utf-8?B?R2F0d3hnRUFQakg0bERMSVFtWUJ2dkdWRXFxaVRCU0NXelc0YzVXOEdPOTNM?=
 =?utf-8?B?d3d2RURQcFZSYy93N1E2RlA1MEllYmMrVTF3VVZJWnUzZWZieThpK3NIYkdR?=
 =?utf-8?B?eC9DVWx4MUdubEJZSjI0WFk1NG5QaVpJVFlkRFJiMjNpeWtmNFgrSWpMSDB2?=
 =?utf-8?B?cTZzTERWODRjMXhiekRWeTlOYTVoSzllaXJ0QjhkZis1S3JOOU5QSHFLSDZj?=
 =?utf-8?B?UXdDVFhZNUlROHkwejQra01PUkRaTXZ1SmFWQTVWSlF5ZmFYRnlGbnI0ODMz?=
 =?utf-8?B?TnNGY2ZKOWE0ekVuVkxHcTJBOEpTbkprWUhTaGMxMk5Yb2x5MlVWOWxlMmR1?=
 =?utf-8?B?MkpPeFZyd05yS0loNDYrNGIwdm5aSkd3Uml3ampzUXU1YVFhZzZEZXpEcmo2?=
 =?utf-8?B?M2FYYVUvVnFEbHB5Ty9YdWQxR09LVTRCRWs1WDdOUk1kSVBWZENKVFcweTJi?=
 =?utf-8?B?dXB5V2dOVU9xbytsS1VRZ3B1dUg2NFVCOFh0cnk3YWlmSkVDdXBraStQZmpt?=
 =?utf-8?Q?Yh1N8ZhYBrY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1ppa2w0ZXdKUmJCOUk3TFYwdEo2WlVZZ3h3WjN5eEpaR0N3SkZYemwrTk1k?=
 =?utf-8?B?OWYvZFExVjNtcUdkUkg1dzJmSm42VGtFemxuV0FveFpwSUY3WFRmYUVkd0xr?=
 =?utf-8?B?M2lRT1lpc00vdWltYkdjVnQ1djNDU0YvZkd1SS9zWWo4QUlHV1Z2RlNrTklD?=
 =?utf-8?B?RXdZZlNqVm9FOWhVYnR0MHRMRTFjbmwrZHpZRzBqZWVGajBJU0R6S0I4bGpV?=
 =?utf-8?B?MzRvdy92YmRCcDJsY0JXUHV4aWR4elJEajlnS2toRUNMMWY1RzdyZWNKYzhs?=
 =?utf-8?B?QXJudmlKRnk3eDZ0ZGJGSndLVmxiNWRZTk5KNU1JMTR3ZklRVitvdjIzbFBj?=
 =?utf-8?B?RTlJaTRYdFh6QjF2QVMvMGsyVDFkT0tpMDl5YnpvbnhqczRBWDZEZWdGSlMz?=
 =?utf-8?B?RGEweFViS0hxcXp2QXVCQVQ3MDUvZDZvVW1Vc3JuZ0wxVUVWc3NDNnNNSmc3?=
 =?utf-8?B?bHpJT01DNGZvSGs5SlNPRmRRQ2tzNGhwRkNnQ0VIWGhGb2hSS25ycFF3eFQx?=
 =?utf-8?B?UWpabFdPNVlpUlNKc3pCY2I3Tk1Pd3NPN24yaUF4SVhwOWFobE1WRGluc0lN?=
 =?utf-8?B?ZGpuQWJKZGplb2wyUUxyaEkyWVovRE9DbzY2eXJiWW9UNGcycmNVQTBFdFNO?=
 =?utf-8?B?Ti9FeTJtMzd2Y2ZJUWZobU8veS93c2RuRjZDM2wrQVBXUi83dkxhNmxjVUky?=
 =?utf-8?B?SWU5ZnZlTUEyMjVnMDRzN2dwVGtjN1docEFHTWZ5ZEQ3U2NqTG9LNnVrQ0g0?=
 =?utf-8?B?ZnZyQVl6SDVmcVRMeExsZ1JjblhSMmpJdjZhWWVCZFdKbE5OTTVibmJ0Vm8r?=
 =?utf-8?B?eWFNNzdCaEh0M1U1UlRUYlkrbHVzRlg4MFMwRXBvOVVKcVJQSXF2TDhkU1hq?=
 =?utf-8?B?WUNNaXJSN202MCtHRGZITkVhRGFFSlB1S09uSDBydDAwYzZ6K2diUXczWjUw?=
 =?utf-8?B?SkVvVlNCMHNnd3VqR3JkQ2x4RWM1UXVObnM0TW91dlBOUjdPZW8va3RVM1Rs?=
 =?utf-8?B?Y0hCU2FpRlU5UU5SK0ZEejdnY3ZERHJZUVBhMmkzZEE1ZGQvYzJ6eUVVT0x2?=
 =?utf-8?B?dm9palFnellwa25ZTTNlWm1SY05MUjdhSnJuVm1OOWVEU1BKMnhaYXlqZ1RQ?=
 =?utf-8?B?UWJKeDA4TTVNSE9BMlFnZEtONDdPVjFQcjlWZm5uMFNHYmk1WjNtRHZFMHgz?=
 =?utf-8?B?N3FTbCtFbzFCSmQ0NG1DbE53UTEvOHViTWJnVHYxek1MeUVJRHhOUFNQcmNU?=
 =?utf-8?B?Wmh4WFp5R0p3VVh3TkxjUkpOTTJueVJqRDJHS0Q5dzhBR3c5OFBIV0IxM0h6?=
 =?utf-8?B?UmlkRGxUQjYwbGpMdnRxbWtHRHg4b3p4bUUyNHpsTENab2U5SHF1Q1kwTjJV?=
 =?utf-8?B?VjhHM3lIcHBEdHVQRlBjdXR4Q0pvK1JHRjhmeGJzMmgxdDN5UjNTWE9Nb0pU?=
 =?utf-8?B?K2dLSE10U1o0dlhCNEkzSzVEeXJWMDgwaWQyVXRHU2RqT1NtdVRjNkRxYmNy?=
 =?utf-8?B?NmREZUw3VVNuZjUzeE50T3NRNVVORGVRQkoycFpROGxzK2xvMkxRVXd2U1FD?=
 =?utf-8?B?WUxaMFVkVmNtaVlLdG5vVDJvQnFHbDk4NGlTQzY1Smlqay9SZ2RBZ1EvNnUw?=
 =?utf-8?B?MUk2OGJaaE8xNDJ3YlI3ZTdoSUFqN2pUaHZXSjc4T1pSKy9HcXp6Q29WTjBY?=
 =?utf-8?B?OXFBTU5zcnovdGg3a052M21tRXFXU3VWOGlQRkRHVFBka2hISXhIUGNFOFdT?=
 =?utf-8?B?T2JrSStjdTI3Zm5tVllWOElEeUVRcXJpYkFkbXgyMjRIcUVOLzdKYlg2SHN6?=
 =?utf-8?B?eFBWR2ZJR3NXV2lOSXR3eXdubFU3Z1dicHg4Z05FdGNhUEV2ZEZISUlPa2JZ?=
 =?utf-8?B?TUdTdUt6NjI1akFJN1phNzkrWHRGSUFoeDl2RTkzQmpSY2svSDZIR250dVpU?=
 =?utf-8?B?L2lwQklDQkVVL0tXdzlBSEVQQ0NzWDI5c2phemsvVWpmR1BjSnVKNndmci9o?=
 =?utf-8?B?MWs0QXlwZnNPOTNWRmlpQkRuYWF3Rnl1VHFvdVJXcVR2b2RwV2JIUXN6ZUxN?=
 =?utf-8?B?aGpBamxFcmVDMkMrK2hVR25kSnIreStEbzlpSFdMUmhXblVzV2Y1Y2NYUk8y?=
 =?utf-8?Q?GbATJlXmf0165JnBBGvDt/iHh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce60a68-9dd7-42be-cd4d-08dda3f7dfcd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 06:11:56.5846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZ6Rk3G8fm5MWt2gQ4yk/X/ydOVv0E2uAiqJIGm0odGh7w24wVhrXc1c61i24H+KdYP499YQ83FIX2TmuSn+gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4079

Hello Michael

No comments since last week, so shall we start the voting process?

Thanks
Zhu Lingshan

On 5/29/2025 4:23 PM, Zhu Lingshan wrote:

> This commit allows the driver to suspend the
> device through a new device status bit SUSPEND
> and resume the device running by re-setting
> DRIVER_OK bit in device status.
>
> This commit re-orders the device status bits.
>
> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  content.tex | 74 ++++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 65 insertions(+), 9 deletions(-)
>
> diff --git a/content.tex b/content.tex
> index d3fc6a4..caef5d0 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -36,19 +36,22 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>      this bit.  For example, under Linux, drivers can be loadable modules.
>    \end{note}
>  
> -\item[FAILED (128)] Indicates that something went wrong in the guest,
> -  and it has given up on the device. This could be an internal
> -  error, or the driver didn't like the device for some reason, or
> -  even a fatal error during device operation.
> +\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
> +  drive the device.
> +
> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
> +  device has been suspended by the driver.
>  
>  \item[FEATURES_OK (8)] Indicates that the driver has acknowledged all the
>    features it understands, and feature negotiation is complete.
>  
> -\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
> -  drive the device.
> -
>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>    an error from which it can't recover.
> +
> +\item[FAILED (128)] Indicates that something went wrong in the guest,
> +  and it has given up on the device. This could be an internal
> +  error, or the driver didn't like the device for some reason, or
> +  even a fatal error during device operation.
>  \end{description}
>  
>  The \field{device status} field starts out as 0, and is reinitialized to 0 by
> @@ -99,10 +102,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
>  \begin{description}
>  \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>  
> -\item[24 to 41] Feature bits reserved for extensions to the queue and
> +\item[24 to 43] Feature bits reserved for extensions to the queue and
>    feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
>  
> -\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
> +\item[44 to 49, and 128 and above] Feature bits reserved for future extensions.
>  \end{description}
>  
>  \begin{note}
> @@ -629,6 +632,54 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
>  
>  Thus a driver MUST ensure a virtqueue isn't live (by device reset) before removing exposed buffers.
>  
> +\section{Device Suspend}\label{sec:General Initialization And Device Operation / Device Suspend}
> +
> +If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the device by setting the SUSPEND bit in \field{device status} to 1, and the device SHOULD set the DRIVER_OK bit to 0 once it has been suspended.
> +
> +If the device has been suspended, the driver can resume the device running by setting the DRIVER_OK bit in \field{device status} to 1, and the device should set the SUSPEND bit to 0 once it resumes running.
> +
> +\drivernormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
> +
> +The driver SHOULD NOT set SUSPEND bit if DRIVER_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
> +
> +Once the driver sets SUSPEND bit in \field{device status} to 1:
> +\begin{itemize}
> +\item The driver MUST verify whether the device has been suspended by re-reading \field{device status}, examining whether the SUSPEND bit is set to 1 and the DRIVER_OK bit is set to 0.
> +\item The driver MUST NOT make any more buffers available to the device.
> +\item The driver MUST NOT send notifications for any virtqueues.
> +\item The driver MUST NOT make any changes to Device Configuration Space except for \field{device status} if it is part of the Configuration Space.
> +\end{itemize}
> +
> +\devicenormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
> +
> +The device MUST ignore any operations on the SUSPEND bit from the driver if the device has not been completely initialized by the procedures in \ref{sec:General Initialization And Device Operation / Device Initialization}
> +
> +The device SHOULD ignore any write access to its Configuration Space while
> +suspended, except for \field{device status} if it is part of the Configuration Space.
> +
> +A device MUST NOT send any notifications for any virtqueues,
> +access any virtqueues, or modify any fields in
> +its Configuration Space while suspended.
> +
> +If changes occur in the Configuration Space during suspended period,
> +the device MUST NOT send any configuration change notifications.
> +Instead, the device MUST send the notification when it resumes running.
> +
> +If the driver sets the SUSPEND bit in \field{device status} to 1,
> +the device MUST either suspend itself or set the DEVICE_NEEDS_RESET bit in \field{device status} to 1 when it fails to suspend.
> +
> +If the device has been suspended and the driver resumes the device running by setting the DRIVER_OK bit in \field{device status} to 1,
> +the device MUST either resume normal operation or set the DEVICE_NEEDS_RESET bit in \field{device status} to 1 when it fails to resume.
> +
> +When the driver sets the SUSPEND bit to 1,
> +the device SHOULD perform the following actions before presenting the SUSPEND bit as 1 and DRIVER_OK bit as 0 in the \field{device status}:
> +
> +\begin{itemize}
> +\item Stop consuming more buffers of any virtqueues.
> +\item Wait until all buffers that are being processed have been used.
> +\item Send used buffer notifications to the driver.
> +\end{itemize}
> +
>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>  
>  Virtio can use various different buses, thus the standard is split
> @@ -872,6 +923,11 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
>  	handling features reserved for future use.
>  
> +  \item[VIRTIO_F_SUSPEND(43)] This feature indicates that the driver can
> +   suspend the device by set the SUSPEND bit to 1.
> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
> +
> +
>  \end{description}
>  
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}

