Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012057.outbound.protection.outlook.com [52.101.66.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22237367B98
	for <virtio-comment@lists.linux.dev>; Thu, 27 Aug 2026 13:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787837075; cv=fail; b=rGl34oltpqwoXVd8lxIR4Cmdi6zmquKVtmR/jw9JjGL1iI58HFiZVCTETMmVtoEh5ovyRs6XGELtbLxNREL6nOVq5+SYoQuTnqXisjKQNjOlRfNjexeYYesEmkpyUY8PELcTYNRdlo18xMWezBtZ3O04A/N3qWU8DVAh7WlKbUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787837075; c=relaxed/simple;
	bh=ZkTaIhcqlGOzlBSUDahrTiiKRh/E6tAJFWns86u3Iyw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JoDDEgNQdDsDJ+u6GLxjch6d5He5n/E1+GtWXeIh9uAnfPqHENfEZ+Cr+U8mcwNSEPWia7uAUo9/f+dt0kiBAQWACY/JaSG3eUmuVVXa82U/0wgb89Vngn4A56oib+Mzw0p4JF1KsjSLvf/Kswl8I5fjl4hi1jPVpp4WvjFB+HE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=PZDmr2Zm; arc=fail smtp.client-ip=52.101.66.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="PZDmr2Zm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+zfFznIVkD1lJ4jZ7mkoeboVYngCRmA4I0ZYe2LthD05A+LH2lsJMm5l0npfrqDN571G+0ccZLoADZLvHO1m9WYZEJ+pFW9MFXsH7uDGEoZGmGunZBRMNM9CkjPPkLfj2HyWmEJHoT668VurzCHumc9XBSZK4bHUJP64EF7ijUm1jKhXagFLPXufm4uAs8Cb2SWuI6qYWy4uaYwx5ReOxqHM8yYoBjQbMwcDiJ+E4qiFDXZJuMPdA4+EMxSAUJVleII78ZBETHQYT63+47yIw+z6q4lL+pgF1wnN0tj4yzC33Mrzc5N9Mt1V4P7fN2QONkUjbvWIernpsTrmJlknw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8YaoeqDBT/aMZZ0PlZIr4zRefJrP8bZQdVLCepi7cM=;
 b=ZRy+3vSV1l9RCgkwmY4+H7iQBO6/sXfCCYTzV6mX4EMVfXutOBaFlTDOcd8G41A5ld6O4O+ZHAVbbgeuIiY8NNbpHHkV/Q79v4aRTNKir7V/jx6pqqi8s8FrlvJbm8X1FWFxszKTFwzUZO4MuEBxEIGBQ8QsWcKUMPI/YrvQESH2L93voi5daMnOcU+I2ebDHfuQyHGL4RRdaY+EfbZ4kLi35rDuCuw+GhMateWsZyaFQfbFId+dVxuzfSmHzg6Q/BiRN+9GAcR1ztQUZpZkf01d8AHQ22BT0YK35DjoU1Q/xhGEisMtFpdADfvEU0Iyc0u9tVwgG3xkh+LvWtOQnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8YaoeqDBT/aMZZ0PlZIr4zRefJrP8bZQdVLCepi7cM=;
 b=PZDmr2ZmuuOl3HzIs7m/y1K2tDFvSRs0+07VToYc+suz6HuwCeHs7GS7h1p0vT+5BKq7RdeldjQmfDpkrz7LWaqHXvuCLXwEKtCSENrWgjuNl9dEQLp+GvrDsezPOOUfBcGc13QdvIIHC940kzAsw30U9Gg2uUE8c7hKaQL4XKu7webwIDel5kzk0tvUS6O+EBJ3TmviDW5AjJibjDFHI7sWMY+H6r9HJKbC9CZYZVb41Lhpoxhn7gsP6/V13kqmvqUZbMngYQmmdeiN0r/a+bXT8lY735UWysvFAzMuLFt96gMjgJFtwiWOzkeuru9PQ7ZLVNGIZKmBBXJB/phTpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by PR3PR10MB4063.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 13:24:19 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::be9f:e8ca:ee9:83e1]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::be9f:e8ca:ee9:83e1%2]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 13:24:19 +0000
Message-ID: <6140152c-7e99-444d-a408-ec90a589a47b@siemens.com>
Date: Thu, 27 Aug 2026 15:24:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] content: Reserve ID 52 for Snapdragon device
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Peter Hilber <peter.hilber@oss.qualcomm.com>,
 virtio-comment@lists.linux.dev, Trilok Soni <trilok.soni@oss.qualcomm.com>
References: <20260826115504.1955-1-peter.hilber@oss.qualcomm.com>
 <1982f2c0-9dad-43b2-94ce-31d03d6a36e5@siemens.com>
 <20260826184427.GA329888@fedora>
From: Jan Kiszka <jan.kiszka@siemens.com>
Content-Language: en-US
Autocrypt: addr=jan.kiszka@siemens.com; keydata=
 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
In-Reply-To: <20260826184427.GA329888@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0247.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::10) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|PR3PR10MB4063:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f053c1-07d2-4c76-9b3f-08df043e8002
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|4143699003|6133799003|10067099003|11063799006|56012099006|55112099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	g3uNDib1nFgTke4y3v0ZB8fIRFe9CIG7BrFettWhzpHQBwa6/+zWZVlGJ6F+LAgfBPv6x/rT3XHuGg0y673IKxUoP+tAdDnVK2ZiCpbYn7hQHnEsT3Trvna7cuk46VcGBT2jlKw7aO5IdVK8tuwSO+oaAhxWwSbo5SbCBVzej2z95xHkaj0cUH0W33EF2tZscV2NVdRLsMLPi36ZbtD4eModXwdK7OrP6WEihsEwmVPkdDNj24RPEv1IHwKcdGSn5Z5jK4JjT2JOKFHmsAjNbjQgghXY0fDbDJCqo94aIiNIJs8lSczqQXMwJPcXYnMROXo74gQwhu3E8lNMT/7U9OVeBstgdvwsdkvt8HdeWOZ7agsJEacyq2/+wIcrjfxMfUcrN3WqkQwSrsaYj4J07uOJyF0N+XkFhGHTB2tewKUsbJZGA//tGFRog9xxgFkD6hSBFaO/XbNfFtCytIygLSIFY0SrIkz4EMCOfueF/Srg4IevaeehXtlj9pJrGNrflQlFirukdFnwGWwnFDRn9/Q7UY3ZYtsME2lyFNsV8mMViqtQD2ayUv8lxDQvXJtev9AojnRHAEUuvsvGeNLh8VxVnVyQvYxnar9XKgTKkHFvJ8oLmeGUWgwvHvpK+LNJmIHvHrAiu2biFJDRy+sYF8mRYYBEe/6/jKQW/ksYojc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(4143699003)(6133799003)(10067099003)(11063799006)(56012099006)(55112099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NC9wUzYyRHM2NjBNWXJlTWFlOW9LcXhYY0toWGxSWUdvWEt4MlByZkxmbGFs?=
 =?utf-8?B?T0hxbTNNT1FlTjU1RzR4N0pvRjEreEJUTFMvQ3lERU94dUlTUWxaMXovRTFp?=
 =?utf-8?B?SDZLMDA0TjVMbXB1NHdxVGtSeWtYWW5lZG0rUlVlT3BIN1dpQWNqYVZSWEI1?=
 =?utf-8?B?NUR1NUQ3S09IQnBoWFB3UDBYRzRGbGc1MVRXVnV1VWp3cC9BdVBLcFNiZm52?=
 =?utf-8?B?a2dZTmF4Z3dyNmZHWG1HYlBCVTRCWTRoN3MrRzVoZmJQSDBnaUlCUjFVeVR0?=
 =?utf-8?B?aitsa1FKS2ppV1F0T2VQWU5aRzBzU1k1RXhBYk1ma1V3aGF0a1RPdUJNQ21n?=
 =?utf-8?B?QU0ySE15N0RPSXpveDMyTjZlazA3cGNGdEk1ZVZibi9Cblo1OEFMWXpRblpz?=
 =?utf-8?B?dXY4RW5QWWVRQXZPQ1FPQ3JrWkpoSGFMY016YS9pc0cwMWQ4UmFpbTJnNVY0?=
 =?utf-8?B?ZXlyU3pkcDhCM3dnRFNsVmQ0TTdvd2djNzE3R01pN2ZwTmFQL21SdGpqcVJW?=
 =?utf-8?B?aXhoSmcwbTBkVFJoaU51MWxnS0FYMisvSDZpdzJ1aEtvMXNpUDBvS0FYNEw3?=
 =?utf-8?B?TkJjZjBoclBJcDNEUU9ta2VGWWhJdVFhbkJyUk1KMTQvUjI1REQvUjl4ZndZ?=
 =?utf-8?B?b2VCTDdUL0JzWHpJNGtwOGtLU1NESlVXNGxKZWVzdEhyaTl1MjB2aDduRGor?=
 =?utf-8?B?NWZNUnI4RWhFUUlQUUFaSlIwVFFYcUV6cEhKdVBzNnkwa05wcUxWTlFYVnc4?=
 =?utf-8?B?cG91azR0ajc0NWdTRmhmRm5GUDNJd2Y4U0JvMWxLVnl5RVI3VThCZFY1eUh0?=
 =?utf-8?B?OUFDMCtiOEtmN01IRVhjMWUyZUZOUkZld0VPWEs2cDcyVHJoM3dVbzlscnp0?=
 =?utf-8?B?T2pyR1BwdVY1Y3dDdzNaTThxSVVadm5CSkdKMUNtMWlwUndpcWk5SHAzN3pj?=
 =?utf-8?B?Nk8vc2NVR01yQjRJYWpETkVBcUw5VHl1cTB1WmVsWWptQ3RkTjJjLzVEYlF1?=
 =?utf-8?B?ZWxRWkZQdmVIcitUbzNHd2hDM1BBY0hRREptbEN0bEdkWFlGOVhGWFIybnha?=
 =?utf-8?B?SDFTY3k2a29PNFhPbDE1WHRWakEvZGQvZnhFU1NHRm5XSHhxaFZndTBJSXlM?=
 =?utf-8?B?OVhpZDRFdCt6bklpaHlYSFNBQmx5Y3FHZC9iZnA1MVJDMzJWRytmWDZjdVRR?=
 =?utf-8?B?eEl2LzhZUi9GOGNPaU1jVnVyVFNBTEdoTFBubzMzOFdTalRUZXZXbmdrc1pn?=
 =?utf-8?B?YmhsOHVVQWVnU3paNFZqZWNPWEkrL1poc2JtZlZsWHlDaU5yMU4vTmJHOGhZ?=
 =?utf-8?B?ci8vby9oWnBsZTFwQzA4dDVHcURuVmxGdFg4Y0lkenZlY1hzM3VEVmI5ZXJH?=
 =?utf-8?B?VGpmU1QyUXA3NzVUdFpIUTVVeHNMTXQ4R2RCOEdHV1lUNm0wZDU3Ty9zSnZI?=
 =?utf-8?B?Y2FvRkdTdGNWSUh4cDNNaVBEeWhPdWxCTW1mVVNtZ25NZnJza1VuOVhEb1px?=
 =?utf-8?B?S1NuUlR6cDllbElXdFJCdDZ3cVJtQWFLQUh4UmthUmQzYmpMZlZQUHNUOXM4?=
 =?utf-8?B?OVUvcFZ0UjlYUktKbmJ1eisrV2tqQ0pGamZ1Ym9SMW5uY2podS9kRWs5bmZQ?=
 =?utf-8?B?NXdUNDlMZkZMWi9CcklueEVhamMwbFIrMkdoT0ZuNTdibklsL0JiT3R6RGJG?=
 =?utf-8?B?TjdlLzV3dkFmVHZLNG81TE44VGJHejJCa3MxbHhZYlRTZlc3bGNoa2VvejRX?=
 =?utf-8?B?c3laSXpEQjQwL1VPZ0RVc2RNc0NCbWZZQS9RUytvNVU1WlNnN3l4bkpSVlJ1?=
 =?utf-8?B?ZDRRdGMwNnlyR1FERHhKQnZVamdJYVdkZnM3WkloMTdnTGs4MDJuYW9aUnd2?=
 =?utf-8?B?TUE2ZkJaWGxtdjRERS9IWFlRdGdVakV3eTVQdW1MYktUMWhoK3h0RFdMUElZ?=
 =?utf-8?B?MjNaR0QzQXVGQ21iSCtteXE3alNFMGpZek9Cbml4T25aMGkvZ0Nzb2xLTDhB?=
 =?utf-8?B?YXlhWVV6bzJSSEpmNTZ0MXNHbjRCaHBTNmhab3FSN2pzajNKYmJLNXVydC80?=
 =?utf-8?B?MTRyaEpiRitXSE02NzNlUERPcVVkOVFEK1I0L25YWUdMK3lkVXBRVHI1WGtV?=
 =?utf-8?B?amREZFc3eDQrS2ViaHA4QVdtTitBTzd1R05UUFdRdk9zZlZ6NzhMRWRJVjlH?=
 =?utf-8?B?cys1WTd2Rm43RnJRVnZRVTFULy9EaUw5SGV2Y0VuRjlCSEhtRnVsZk9zUU5L?=
 =?utf-8?B?Z2FxdUJSeVZYOTRaRE9NK3Arb0ViYVVQaEVSc2JzMHJsYVc1TGg2TFRia00r?=
 =?utf-8?B?TUFKRldBbjFWWUdCTUJ5Qmg3eVY5L0RVMzNQMmRlNitpSVBTdHVzQT09?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f053c1-07d2-4c76-9b3f-08df043e8002
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 13:24:19.3153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: th3fZptCIsHHVoBIuhXTnfl9qZ25dl3GW5WmDwV7/h8DCgWm5L1P/R/JOhGTi9xWxuxhmRHjcvOScKd25bSmBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4063

On 26.08.26 20:44, Stefan Hajnoczi wrote:
> On Wed, Aug 26, 2026 at 05:31:54PM +0200, Jan Kiszka wrote:
>> On 26.08.26 13:55, Peter Hilber wrote:
>>> Reserve a device ID for the Snapdragon device.  A Virtio Snapdragon
>>> device exposes functionality across Snapdragon SoC subsystems through a
>>> common Virtio-based protocol.
>>>
>>
>> Virtio is supposed to provide generic hardware models, not so much a
>> channel to expose concrete, physical chip IP over it. This looks very
>> weird to me.
> 
> Device IDs assignments don't have to result in standardized devices. See
> "5 Device Types" in VIRTIO 1.4 where there is a table of currently
> reserved Device IDs.
> 
> While I'm in favor of defining generic device interfaces with many
> possible implementations like virtio-net, virtio-blk, etc, I think a
> SoC-specific control device is unlikely to fit into that category and
> it's acceptable to allocate the Device ID with the understanding that
> there will never be standardization of the device.

Would still list this ID by that vendor branding in the spec.

For me the question is if reservations for devices that will never be
acceptable should be in scope for virtio. IIRC, the currently available
ID range for virtio over PCI is 63, of which 50 (including invalid 0)
are officially reserved already. If we see an inflation of such
vendor-specific reservations, we might be force to hunt for another PCI
device ID range earlier.

Jan

-- 
Siemens AG, Foundational Technologies
Linux Expert Center
