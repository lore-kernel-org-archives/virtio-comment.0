Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011043.outbound.protection.outlook.com [52.101.65.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E811C5D5E
	for <virtio-comment@lists.linux.dev>; Wed, 26 Aug 2026 15:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787758325; cv=fail; b=Z0CdeGPtqx4q0Gfi64SoDHAraXHin/W7y8Vl72q6f8PZXLBFbzRx80vs2P6Nz2ZWnfEaAZacyzYIRmYEEm5bDh4CRiTnAPLkzDlXLv8ZrRDT55ElfYwJAYp/cuCOjvkNUaQ/bEHemkmX/q1hPeZ/1AxytOkJ+OUmocptzuHDKvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787758325; c=relaxed/simple;
	bh=a8edgOWATZCPyl/gj/dwbdFR8hh4pvbxVwPLuHJCWiA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O3OlQiTlW+eb9O2rivMdjmGtnjzXUk8vPkpaaSXLrr6D9ZERd+DZpnYmZC/EA56OWOE/6m9582fhc1pPE0+Iq09q9vk5SxHCM4R3YgtLBcMs89wECz/mZqygickWFxlFFEQrYuC5iiCsvhYZCapK1AzummbiwUbGfVSyUubl+CA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=jBN/6vlg; arc=fail smtp.client-ip=52.101.65.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="jBN/6vlg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbeLj40L+NNQA0X51DNwIioog4GjDg8eJr4djBxR4yrlV/vURog1NVE5bTIr291DoTSXI/qIbIAQ1rPAlvKcRX5Y8T7kGwJNincGfpPHRTq7ZcmfUNSHEtJqglN8BiRmqs7CNTUjZsetQKnecfl4ILCZC/mH6WvGf3bO97I7QhoctSGUaCFGLHlH0fQ6b74Db2B/1tdv3OyTJ/wRGpY/KOgOSE+wI7Scx1nMcfhNZct/HZaJ41GAaRQCERwtmbM5+wFsBGMx69OXKrD5gNyRwgDltj9ZrQ+Lzw/p79ycPNWMaQYeK1nUzMkl0whgl3z9NZjwFbeH9c8QVEFy1t5CpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/L/u1KetNsG1zqft9nPZV5BNZ8vKAgdBxzDMbE+/3+4=;
 b=waFwxr3rCRlZ1GbMnac7Rka3iAxQRg+8hZWjxGM47M9Mumr1+9KfBMUdHxOBPY60lih0xj8WnIjQQmC8OLPJ9EYBiPu/iAxynMswlxyswLW6jQki1jqrh3O3Qwg9dQV/NnkqDJUf+xr2DxdEnKfy+411Vu260woI4/MlRb2zoxv/6wxk+hkCVUXyNNpIewZOO4wNSzRlh1pzpA5B619c1FW7BaE1i0WJexINZMzNuQPQYKmyjeOswyjZreZrgoA+t5j9UZMTDY4Xxr+eIwsOdC1U4OzELuObveP364Qikbfci1oYYT/InZ2bcZdWGw4EhawKaODrvrBfMiXAmpcAIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/L/u1KetNsG1zqft9nPZV5BNZ8vKAgdBxzDMbE+/3+4=;
 b=jBN/6vlg5W+XxQr5NXXBdK6mWwI4W1W+O3YaElk2zghx3Ayu0VPTyLgJy3MOywrAGAW9AWceSlr4A7V/wp6NBy9lHiDEcjeSWz0VC5myiYYHijFTv5SzEdgWsVvBtLOj3Nc2NvSJCKYSXsKXgbHCcy7FoAM997nt10oWwSVO7qJTB+75PXPy1hH1ntSzhkn66W/xqSrLnOxITCal9pGyLCPxhDzdEBEYhYHbPejweEz2TZvbc2t0aFDQZpXm45favBSSfAsdMR4AslpLB1ktH+m8F3H33QajI4xocpICk1J8OPum0cxWOqc1NrV59sK/HWluV8AsEFLpUDCz8G+R7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by DU4PR10MB8557.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:56b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 15:31:56 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::be9f:e8ca:ee9:83e1]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::be9f:e8ca:ee9:83e1%2]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 15:31:56 +0000
Message-ID: <1982f2c0-9dad-43b2-94ce-31d03d6a36e5@siemens.com>
Date: Wed, 26 Aug 2026 17:31:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] content: Reserve ID 52 for Snapdragon device
To: Peter Hilber <peter.hilber@oss.qualcomm.com>,
 virtio-comment@lists.linux.dev
Cc: Trilok Soni <trilok.soni@oss.qualcomm.com>
References: <20260826115504.1955-1-peter.hilber@oss.qualcomm.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Content-Language: en-US
Autocrypt: addr=jan.kiszka@siemens.com; keydata=
 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
In-Reply-To: <20260826115504.1955-1-peter.hilber@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::12) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|DU4PR10MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: 669ac3bd-9323-4640-fbfa-08df038729a0
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|55112099003|11063799006|56012099006|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	GLzoZp943fw1j7yHlZ1/hpXszkV6mXVpV1o7DPhd7xFkVx794r4EXJVHiN8uCO5MAzQYL9BQDtnhmtsi7QhXIpXJvdQIQ7Nr3K7gUdbLyG2OQQJhFR/BUlgd9lyiV5ot1kWdUkNDwtMoM3swedcx5qK7j05ESGe+POhZRFHj/fQfzirBAb0JX+AaQmqd6Sbs8B7ueUpX0dmRQaNxN7jbiJbI7XR+HWYRmFaoN0cpYSDD7gDw3BAdjtTyd+xWt37q5f57l0N9aPi/YHB+Nn+wp8tcDOfAq9Kju8+Bbh6d/V4L4atf2PAY/hNLKnoRsw3L7QgDR08Z17IFhK9AMenwOqN3DJAFlzWq4CYKOlQcC50oVXYPD1zMX2JB6VQCEA8ehlHHUW8+LIjtgPM4Q1Pctoaz5cDuSXW+11sEzR6vOd1xYYQo+pQL8A7ibuKuA4mhS/bwxjP2cOMl4JDaIHerGKxlWL60E6EZvUkMfkVLtjmL9KB3A9gOXcG73RfXIOOdTJk046fTxv59FlBoAJFD6HEUiO2bVHPUDzRZBlwBktQUph+Pm48zOZq0rGE9ai9e6duLvmXwY49CSUPLfZFRcjwjTSNBLzuqHe62avNheEpJwjfC/wekmOCj5ng58cDVxIaz6I5fTqF6hMRIQjZ7PKoPqc5DUbQ1ACtKnz8Fndo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(55112099003)(11063799006)(56012099006)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFRFdmFtM0FpNXRmeFpXY3NqQzhkTTNNR3BZSlBNRXQ2Vi9uMFBaN1Z4Ylhw?=
 =?utf-8?B?d2xEUHZUdnQ5MjlKcG5DMzF2NDNueUVoTDVjOUR0RUJtdVNUT2V3S250SnVN?=
 =?utf-8?B?anVVQWJ6UGcrbzB1WHJJdTdIY2RleTVzemk4ZXRZU0tuOGlyNVp4elV0V0gy?=
 =?utf-8?B?VUJhS2dHdXZkT3VHRGpxV0NVcFVORWMyanFCQTIzRTVjdy93Z3pDZFdyRGM4?=
 =?utf-8?B?a1hqeSs2eEVKRXYxVGpHRUZCTHB3OXNlc1QybnhkcmQrbHZ6VHR1bmkya0Mr?=
 =?utf-8?B?c2tkOVdqdnBpMkkzc25aRkU5bm5VN2ZUWmpPdmIycWhqTW9RSGdOZ2lNaW1u?=
 =?utf-8?B?cDlvK3RLcWVKWHNSL3FVM3Y4MTVqTzRuYStjbTJHNWExRjhYZW5DMTBFeG5j?=
 =?utf-8?B?NitidUY1eUxXZUZwcjR0Z0MxVStyZ3VLem5SL0lKUk5MaDRQaTAyR2Z2clF3?=
 =?utf-8?B?bmdmQy9pelI4WERPNTlhclpvTUZWSmFOZmU1eDNmdS8zVVZsNGx0WGladHMz?=
 =?utf-8?B?SjEvMUdaWTEyVkpsYnVsVVpsTWlhK3BSMnE3RVFqaldrSlZUWUNnUmV4RjNN?=
 =?utf-8?B?YWpyYXBPRDJNTm5ISjhrY2huOTYxRTVxdk5PbDNrcFhQcnNIejBIOG5kTWpx?=
 =?utf-8?B?Z2cyTlFHd0sySlU4bmxVVGtLR29SS2FGMStIaFg1UUd4Q2IzU1JhYmZlRVpa?=
 =?utf-8?B?KzJJZW9aRGlFc25IaTE2YXBTdDFKcFRmb1l3ZVJQdTk5TldkQVM4aFFmakVv?=
 =?utf-8?B?ZEtHcGduTEFsQnZUQksxR1FrQVZ0SWU3STY5VVNobTlzZE9hL3Rhaysvekc3?=
 =?utf-8?B?d24zK25aLzVBSTV0V0ZVUTYvZ1NMTVlFZTBESjl5TFhzMWV4ajErOGFmVkx6?=
 =?utf-8?B?QXoycTRMRGROYWRmNk9vTHNOWXMra3FtMk1lL3ZlSEZveE9QOVdhQ0FnNVVE?=
 =?utf-8?B?T3FtWmNMRUg2S0kreGIyQVNJOEVrMlBSMzNqRmN3WGdFMXNkTWNUZnFReFd2?=
 =?utf-8?B?dGtxb3dld1huVW9PNkR2WUoxNjIvS0ZObmpnbjhLUTUwNGR1YVFXdXFkUVBO?=
 =?utf-8?B?ZEZWY0s5cm5hdGNHM2FJTWdQbVZ2cDNxK2k1NDlXdkdpVy9BZDdQMk5IVGtr?=
 =?utf-8?B?bzZjMUMwNm5NbmtkK1g0MWU2dUJ6UEVRcHlXNkcvWmU2OEorYW81TDlSSjh4?=
 =?utf-8?B?eEx4ZC9kcVJHaFJWMFo5TFNTSkdtZmw3N0s4RlBSTGYzS3VrdjE0RXYwRHRY?=
 =?utf-8?B?M01HdVllUm90UzRyaW8yWCsvOXc4ZCswQ3lTcHZqWmpvbTlCdjJBYWRtRk00?=
 =?utf-8?B?WHBGQk1KYlE2bkJoa1lJZWh3V002anM4aTJaTDdjbTR3Z0o3M0VveVZpZjg4?=
 =?utf-8?B?WjNpTWc4YmpFcnJ2RkhjZ0dDNUZSV2dvSnFjQndkR1QzQnF6N0VkbWUzSVRw?=
 =?utf-8?B?VGxPbm5xNWNzT2s3N3dYRE9MQllOUzRzUUdvUHVDdi84L21jQ28vVitvenNC?=
 =?utf-8?B?SHRsNTRQSi9HK3NvR3lLU2UvN3ZrN3lFZmNKWjE2Vk1oelp3S2hndTdIdTY0?=
 =?utf-8?B?UVJSR3hYaXFhRmxEVFFFWnhCUmFUM0JGdkVKRy9NZDgyOEtsSVVGL0xFK3Rw?=
 =?utf-8?B?djFTU0tBV3BhenFzQUFpVktZK3VGdkttYUdFSHo4VHdvOUJjQXVKZmNoZjFD?=
 =?utf-8?B?T1hTRGhlL0pjUGk2VWhuN2ppNzV6S1hvNFk2dmJkWUR6WEhhM2VSQUl6aGdK?=
 =?utf-8?B?b3I3UjVkdk9LeFF4QlErSmJlTjNmemhBM3o3S2RUR1hBd2JZakU5aWZ4Wjcw?=
 =?utf-8?B?bkxmb0VxU1U3STNvdFVrYzBFSHlONzR3M2xzcWN3akRuSk9KOVREV09HdnJk?=
 =?utf-8?B?eG1lLy91Um1WUGQ1SlhURVlDWW5BcHRpRUdYUmRmY2RMS1ZGYllJQkxnYnhS?=
 =?utf-8?B?dzJubkI0ekQwa042cUkzWkxTVlI2MmZLQ2lSeFdodkovTzQzbk14elJlNmVs?=
 =?utf-8?B?RTlwK1JFcUdsOWE5WC9FL0ZicHJ3WXRneGhiQ2dPZ3hhWEFtNm5DWW13a1U1?=
 =?utf-8?B?SHFaZlNhUkdQNitOSms1Q1J4d21mUlNWMzJRc1A2NHFpeVZzL3RZUHBwZm5u?=
 =?utf-8?B?MzQwSkRhK3k3TG55bjBxWWJoWndaTksrN1M5NDZNMjNrc1F6L1lYdEt0UGNB?=
 =?utf-8?B?dVIzSVNsaFd3VmdVTG1xeFRPa0V1TW5JM3BoWXhuQ3E2VURCdDFlTlZuMXpy?=
 =?utf-8?B?dzArWnY4RUFjVUJOeEFJbkxFQm8rU3FNMndMT1g2SUwzL01GTEsvWjBBMzJp?=
 =?utf-8?B?Z2J1NFd5S2dkb2E3dUVFTHNOcjh2Vy85Q0MzdlhqLzJIbnk2cW55QT09?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 669ac3bd-9323-4640-fbfa-08df038729a0
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 15:31:56.5288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TUD4BC6BOUky777UyjXYwalblf6r6UJ/ct2IIxwxaU5Of4XDXWfLHZFSdTNNoogGaYwhXQd8YsKE/RYJAHUrfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8557

On 26.08.26 13:55, Peter Hilber wrote:
> Reserve a device ID for the Snapdragon device.  A Virtio Snapdragon
> device exposes functionality across Snapdragon SoC subsystems through a
> common Virtio-based protocol.
> 

Virtio is supposed to provide generic hardware models, not so much a
channel to expose concrete, physical chip IP over it. This looks very
weird to me.

Also, isn't Snapdragon a protected brand by Qualcomm? Would it even
legally be fine use it in the spec?

> Device ID 51 is already reserved for the Virtio HAB device:
> 
> https://lore.kernel.org/virtio-comment/20260702140939.3535968-1-zeloren@qti.qualcomm.com/
> 

I think I even voted for this, but likely without checking back what
this may become. I was expecting (hoping?) for a generic, portable inter
VM channel using shared memory. I hope HAB can be that as well - besides
enabling some very Qualcomm-specific and unportable pass-through of
accelerators or so.

Does a "Snapdragon device" have any relation to / dependency on HAB, or
is this just the ID collision why it is mentioned here?

Jan

-- 
Siemens AG, Foundational Technologies
Linux Expert Center
