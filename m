Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404481779A5
	for <virtio-comment@lists.linux.dev>; Thu, 15 Aug 2024 09:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723713157; cv=fail; b=Xulx4MNGD4f2s7J3UTTELucKdu33BB9GrVxoH3nNeHt5goeMgRixLHRFZDPrPZh9ZUUicZfOsaVjtbzIxpfVUaS6y+1N9DEBPRsvdiYEFMm8o21iwGZHeRa0iS/xdWmHMFDcmR1OHZHv/yj7ahFoLEiyr1Zcwm8R4HmeXvk8gh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723713157; c=relaxed/simple;
	bh=eaAEDhOHORqUvrorMqmi+8SWNxjunIFYmDX0mlVvPF4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NaShmzQbsLXk5NHgSpmuzlrV+7o7OglBrLrtGrQUS1lbEILHrCm8Qa8r27mykqYUB3hPDfRTBJSb6wy197Vp50ZZWfQRtKrC3XpNWkEyuK4/rxi6MLnnP/D1Cs7iyz9i+yLYNC+9c84TCl4Wt0B+wlvrsqO9p4aTOzhVMUWj2bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TK18a6V2; arc=fail smtp.client-ip=40.107.237.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TK18a6V2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UY5fOrpljhDYwYm9DWMUBp03p9MoYQ9EpVgzsSqoe2XesK2CTnUiuVEVhqxtymuvDz97W2KY4DA32uPLsunUkcsEpRdPNOQg0pZNRVinSGmx7CoOHE6PNpuoZHfTWClmZpYUgUU7EQs52Gk42Q0RlWXYLxMR4YPG1z0DEfGJD0QAz4czO+szkyq0+tcWGcZ4pLwnE0D5yGDu4ewoFuoEpAfwfBA1gVhnJEWVDvNDmFX3DJJFkjA55uFSkz5fVik3Jie0QuqxBOwKbNlyY0b68sWSlbCmx5JsSB73dS6RuzWT6muTFbKd3DbkucnbRrz2ptHj7W/MGQr6eKbKGcqgIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5R45eVXWJUR3SC6RzI8Q8ArMsY2+27YGN2IZRxJdHIs=;
 b=Kg+T7OpX9WN1CTvCAPuI4Wq5uKTXswvTqcrPRcQbYc7Bq5HtTVsNS+LMmPJBMsvR2nvXBIAk9a5ZiMlb3ipLutNGmDqOH4fbIe5OjHVXO7/hOStKbXfD1dPrn+XYzEWCF50x4IidI9V2wuoPS8+7znXbkiNqzNv2OyIm1ufV57O1+6c0A0Q/ljzWlGBACDPhQmyzAQ1pUopVUvri+sEEaijNN2/FB+FTzv80T077YIfINNAndlnZ64bBNdlQre+7VD3G+uxPO40NmMzfLAAkTj5UtPTpeUpqRB3sjevxkuFpDMrBMloPn0tTa5FBLAsU9nDlYuXfyhi7TTNYGOVM1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5R45eVXWJUR3SC6RzI8Q8ArMsY2+27YGN2IZRxJdHIs=;
 b=TK18a6V2C2+qutMn5t4gmSeH37Ysw4SPqrYOEOzgh/HGW2uhe3UTmDdoGlWw3wrAdgRn47JjAIBM8us35GT8YYLQyT9qbKsA4wzMbUQq8+29vfrAsVXWzHO8iVdgV2EtaOaIaJvh3lUS7I8VQrXhRJG/sqJavVPPSHQxmod0EDs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by SJ2PR12MB9115.namprd12.prod.outlook.com (2603:10b6:a03:55c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 09:12:30 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7849.021; Thu, 15 Aug 2024
 09:12:30 +0000
Message-ID: <513de01f-92ac-4067-b005-54dfa4fe85f2@amd.com>
Date: Thu, 15 Aug 2024 17:12:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: cohuck@redhat.com, jasowang@redhat.com, virtio-comment@lists.linux.dev,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 David Stevens <stevensd@chromium.org>
References: <20240801113516.22155-1-lingshan.zhu@amd.com>
 <20240813035358-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <20240813035358-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0301.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::17) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|SJ2PR12MB9115:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dc525f3-2d56-4ef2-eea4-08dcbd0a63d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXoyNVhtUGczMGlZNURCUzEvSXVaQ0w0Z2UwMks5enpDeXNYbUswZDBGNGpQ?=
 =?utf-8?B?Mk9TcEtMMTNnK2l6ZHd0cmh0WmlyVEJYdjZzV3BwQy9lTGYycTNaRkVSNE1X?=
 =?utf-8?B?aGsrS1hBUnJ2WkJFVHlNOER0V1FUT2dHNFpZYXdINjNaMjI3M2xpODBDMHRE?=
 =?utf-8?B?U1B5WEVsbmRUTWNhRUpoNkdZempMS0JGbTZ0ajlYMlVUbFdtNnJZZEwxNFE4?=
 =?utf-8?B?YVU2Kzl5d2RvRzRFbFdEcnRzR2pLTEpVTE1SaTlNYVppc3NEYTRSNHZ3LzE0?=
 =?utf-8?B?VTVScSs1NHQ2T2pKQTNxa1UxdEx4YjRwV09LYVhsVzhndzFBdnZWZUZhZllx?=
 =?utf-8?B?aG9Ibkdabk9KcVZ1dUF4d2M5SzZZU1YraEo3ZW12WDlMbmlGV0lrYTVoNG1m?=
 =?utf-8?B?d2wvYkNGZUUxQVUzSE5QTnBxR3MwTTZkbVdyNm9sYjJQUWc0RkRQanZyVHEw?=
 =?utf-8?B?WGduWE5lbGVEYjRGa0VkcmxCQ3ppV3JwVVlkazlsR1F3VGo0NFBwV0g4Znpa?=
 =?utf-8?B?WWVzakhFM1doZXJmOEVVYkhvbkltck5ZQ3NReG9xd1NQZlVNcThsWEFpQ0oz?=
 =?utf-8?B?RmtkWUEwVTNtOC9BMXk0Ylo3UEVsUlYwcDJxTE1ydGV4dGQwRjJncFRidkhG?=
 =?utf-8?B?R0ZQaGZPaVlJZ2dVUEZHOEJmVzhJNGNXbWhvNWFHVGlwRU1KSVFnN0JXYlMy?=
 =?utf-8?B?Y3dXVTluUUFtSEU4dHB3Y08zS0I4RTlyNTJtRHluNDk0RzczZmtPcmNMWG04?=
 =?utf-8?B?dldUTjdPOHBqQ1hGZUgwaDVtTWM4ZzdzcUpWamdVUmhIVHg5T09JbjZWYk5D?=
 =?utf-8?B?YWR5bHI1TnRYbkRFelBPeU14U1VFdDdCZE9HV3VyVnkwc3Z6WE1zYjg3SXFD?=
 =?utf-8?B?VmNLSTAwWWxXZmxNWjkvSGdEclViQkZibjJuZnAvcHpUMXVsVCtZMTRZMnNj?=
 =?utf-8?B?SS9pbjRGMjArOVZ1YTRLTXIxRFpNMytHc25UaW96aTh2VFJkVmlkRFBneWNO?=
 =?utf-8?B?NEJweisyVk02b1hVQ09sRzZhRTIvbCtyU0M4dWFOTUV0UWhHSVRXSlhqOU1E?=
 =?utf-8?B?MWhYZ1Y1SW9UQmtvR3NuVFRORlpyWlE3V29ldy91K3Vnd2xjSzgwcW8zU2Ex?=
 =?utf-8?B?bHJUdkVuRXlEbDd2UXFsb08vUzJ1cGF5VVNGRG9YTXVmTWo3ZVVseUI5bUpZ?=
 =?utf-8?B?aEVpRncrT0c3Mm44T1hRTG9JSXQ5VnlrNkgzTU8rcXpxZ0REenJvdkMyUG9G?=
 =?utf-8?B?QTdlNXRBVUdHWXlWV21rWjNQc0FncXM4U3p3OTQ3TGJTd0VWRm0weTdKeW5W?=
 =?utf-8?B?NzVWRTFOQ0dhY3lmTU9QTXZSTWlicmtZbC9uZmlyR25KcWxHY2kzNGlTZUpE?=
 =?utf-8?B?WnVscEs4UE13V0M3RHU3clFUWEdzWW5Bb2hxcEZUYUhJUTJtQWxVUlVmRjFF?=
 =?utf-8?B?WXdmS1BQY1NWQzl6K2psTmg5R2NiU1AwclY5Y2FtenJORnVEZ0prSmRnamYv?=
 =?utf-8?B?WStMcUttS3dxTUxaRGJKUGw4bk53bXFLMmVVNDNLanpHV0tqTHJVMy9Ta090?=
 =?utf-8?B?YUNSR3ZyMVpOK21FSUg5azhTY1psVUs4dVhBY0htMUsrTEtndmFPVXBER1Fh?=
 =?utf-8?B?TDZzY2tBSFBzNnV2RUpLdmZaeU9ESzdzL0VMSXhRL3JZT0QydyttblRkdHZ2?=
 =?utf-8?B?UHBYNWZ5RlY2ckFibzVhcm1NNkQxVkFjK2hOVkxyalVXMVJ3ZGlwWkZGVDFE?=
 =?utf-8?B?c1hYTjB6ZnpwbXNoR2NULzErUnk2UzQ3ZFVqU2xTNWxZbklmVW85aW9GVzEz?=
 =?utf-8?B?M09lZzNZSlhSVVNSajNEQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RElJK3A0K1MzemFYUEgvdU1ESTZabVlXMW1CazFBZHNUWkZUaXZWL0JoOXdW?=
 =?utf-8?B?Z1F1U3JvN3o5S1E1KzhNOEhQQUc2dkJ3K2hSekVFeVhuTFFtT21RKzZmZitw?=
 =?utf-8?B?c3NZMWRWZ1lWQ1ZYNE1sNmNIYVBiSCs0WmJKT3NwTnpGRk9sYjdnWFdaSFR0?=
 =?utf-8?B?b0lVNjRtWW9ibjZzTGkzMzF3NE5BLzIrRVQ2b1VXb1NKS2ZCYTk2QUthUll3?=
 =?utf-8?B?M1Y4ejA2dlliVFZLRXBSYjlLbm4vSFRDSTBuR01FeWRjWGdUZ09IUE5yKzVi?=
 =?utf-8?B?TEZxckxUSzMrY3ZzcjlsNmhHMUlxYmdMdmhpbHNnOEw2MGljU2hHZXhLY0NF?=
 =?utf-8?B?VGFaMHZHTllqY3BSb2lsZDAzOUF0UnJwdXZHUDM5dUc5Z0tTbEdIUzVaclp3?=
 =?utf-8?B?cnRKK3JQZHZGK2JrYnVDdUc2V0lxdlFnTDU4RGxtK2ZvRFBlM3R2VTVsVk8r?=
 =?utf-8?B?VGw3bjJqbHlDQmFab2trQSs4U3ZPVE9BUFYra3RRZ29kWS9oME9oTFNJZjdJ?=
 =?utf-8?B?ZXVSeDlTaXlJNlFMVGpxcEhCTlVFdW4rd1UySG40ZVBMNTBocDRGVml2ZTZG?=
 =?utf-8?B?NVgrdytzTzVyQnN1bGRLdDk3YkpKYTFjemgzR0ZUSTJHMURnMFV3V0RWTFZ5?=
 =?utf-8?B?ZUhXNHlpdzMvaSs4MktQZk8xb253aTc4U3Z0MVhBSnZvUlR3SWh1LzhFMUNj?=
 =?utf-8?B?eDFTS3RLWE9XTnluMEdFSGQySEpDZXhrQXRINkZ0YmdydHRWSnR2NCtNNlpZ?=
 =?utf-8?B?Tm5UV0xEWEttQ0xSZjkzQlptWTcvY1lRMGJyeEZhZDBkUFBhQ1BNSE5hTGdB?=
 =?utf-8?B?aUxGcUZGZE9MdG52b0Z0eTZXSkI0V2NqazdTN0hZNGgyVzBUVEhqWEl3aWxO?=
 =?utf-8?B?UzMyQndCcjRGL1BpMHFtaTdKN1VndVdkWFVKcFd6eG9uMDNQOTA3MnlSS1ZY?=
 =?utf-8?B?UjJnK0Vyck1DakcrYTBESUgyKzAxRml5TStVRi9qUmpIc1VTNlpMU0xkYWl2?=
 =?utf-8?B?MWZodzZRcTZDMDgydXpRRG5NVEhOOTI3emdBUnJ1MmpyZHVqVElqZjJQNmRi?=
 =?utf-8?B?QWh1dE1DUDVKYWxUSk9vOVgwRkNKUmVNem9rSDJyMXFqZmgwOGpFUWw4UUVJ?=
 =?utf-8?B?SHY1UHZ0a2wvQlBSRmxIV1Y5VzF3KzJLVVpEaCt1d1d0cUNhMzdEeEtkK2Vn?=
 =?utf-8?B?MEtsSDVXTkdzR1cxNVBEYTlNTzRYTkNJc2NyeVROMjJ3cGFrL0QwUFd6U3ZF?=
 =?utf-8?B?bmxiTEd0TU02dmZBbjNpUUZaWnBoODBHa1I3b09iZUUvRThlZk14OWJMaVBj?=
 =?utf-8?B?TU52cktCNUZGQlByWXQ5blFJdnNDeUhPVjRiZGdtcnV6YTV4K0lGdE93ZjJ1?=
 =?utf-8?B?bksxdkt6U0pZZy8yRk0reTdWUUF4andTcVoxcTREZlIzMnpkeWJSRDhIT0xM?=
 =?utf-8?B?TU85ZDgwUXJsSVloaDkvK05QS2U3U3pUeGMwcXdkamZkK01kcFNYOE9Tdkov?=
 =?utf-8?B?dEJuRlB0RGN5VDltL2xRMEorQUpyaEdJZGNIeENKalo3QjRWaCszYzVYcTJX?=
 =?utf-8?B?N201b3VwVGM4c3RBQ1ZrNXpXRkMvU2ppUnEzajNhN0ZzT0owa09pbG4zeWlH?=
 =?utf-8?B?OGtmZ0hTZXpqdlZSY2JEMHdITGpUaEZkV3o5ZFQybXduSkx3NElUeUtnVE15?=
 =?utf-8?B?RlN1cE1pajVQdGF3QWJCZlFZaUdMUyswd0U1MW9GeDJXNDJaMEFWVFluYVIw?=
 =?utf-8?B?dUM3YTJ1R2swb1ZPamUxN3FqbisvRkMyVk12L0M5MjZqb2dJMlQ0UU1vSm1Z?=
 =?utf-8?B?cnI2dVNHRmVsUmdXTzBkSVFwV2JRWVNwcVNHOVVXblBsU0NhNDgyclNNRUs3?=
 =?utf-8?B?cC8rdmpic3A3MnlBWHZBYThYaklhNmt4QTRSYVJDbWgvT0lEOWhEWTNVbGdu?=
 =?utf-8?B?K2VLdVRNeEZzMGJPKzZTeno1MDhuQmZLQ1VPd3BER0tFWDdZV2krSEIwTWtP?=
 =?utf-8?B?b3VSOVRMSnpFNE1KSmcyYUttcEY3Ry9LSE9hV25PRkhzK3pRenB0eFJqV2s3?=
 =?utf-8?B?MTF1cWhuRytuZDZEdm8waXlJYk5KeEg3WS9ZTm9NeGwwbGJSVW04SWU3MWFW?=
 =?utf-8?Q?IA3byqYyNycVad/zbmGkj8/r0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc525f3-2d56-4ef2-eea4-08dcbd0a63d5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 09:12:30.4252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHd+iBj3lqgyAqot1Tn94ii3hdVCq4kPXHiLkBQD3eNvN9WuiyP0lvzwF53jP78iqw1xjNnJIoYoxhHRkSoJWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9115



On 8/13/2024 4:01 PM, Michael S. Tsirkin wrote:
> On Thu, Aug 01, 2024 at 07:35:16PM +0800, Zhu Lingshan wrote:
>> +\drivernormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
>> +
>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
> Actually, it has no effect before DRIVER_OK, no? I would forbid that
> then.
There can be two cases:
1) debugging the device before DRIVER_OK
2) VM migration right after boot, and before DRIVER_OK. So it needs to migrate the device before DRIVER_OK
>
>> +Once the driver sets SUSPEND to \field{device status} of the device:
>> +\begin{itemize}
>> +\item The driver MUST re-read \field{device status} to verify whether the SUSPEND bit is set.
>
> This is still vague, I commented on this several times.
> I think what you mean is that until it reads status with
> SUSPEND as 1, it does not consider SUSPEND set.
>
>
> But, what happens if driver clears SUSPEND before it reads it as set?
> It would seem that should cancel suspend (which is a useful thing to
> support)? But this creates a problem as it breaks read/modify/write that
> some hypervisors assumed to be safe. I guess we need an extra
> SUSPEND_IN_PROGRESS bit then? A little too much for status, at this
> stage - maybe we need an extra register for this.
if the driver reads SUSPEND bit == 0, with the knowledge of its own operations,
it knows the device is either in a) normal operation 2). suspending in progress

Cancelling a SUSPEND right after setting SUSPEND is actually a RESUME.
The ideal case is the driver waits until SUSPEND == 1, then clear it.

But there are various drivers, not all drivers follow our expectation,
so there can be a corner case that how the driver know whether
the device is resumed after clearing the SUSPEND bit or not finish suspending.

I think adding a new resister can surely fix this issue, however as you
said, add a new status bit is overkill and where to place this new register
is a new question.

So, to make things easier, how about suspend & resume the device sequentially:

If the driver has suspended the device by setting the SUSPEND bit to 1, it MUST NOT
clear the SUSPEND bit before the device presenting the SUSPEND bit set as 1.
>
>
>> +\item The driver MUST NOT make any more buffers available to the device.
>> +\item The driver MUST NOT access any virtqueues or send notifications for any virtqueues.
>> +\item The driver MUST NOT access Device Configuration Space.
>> +\end{itemize}
>> +
>> +\devicenormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
>> +
>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
>> +
>> +The device MUST ignore all access to its Configuration Space while
>> +suspended, except for \field{device status} if it is part of the Configuration Space.
>> +
>> +A device MUST NOT send any notifications for any virtqeuues,
>> +access any virtqueues, or modify any fields in
>> +its Configuration Space while suspended.
>> +
>> +If changes occur in the Configuration Space while the SUSPEND bit is set,
>> +the device MUST NOT send any configuration change notifications.
>> +Instead, the device MUST send the notification after the SUSPEND bit has been cleared.
>> +
>> +When the driver sets SUSPEND, the device MUST either suspend itself or set DEVICE_NEEDS_RESET if failed to suspend.
>> +
>> +If SUSPEND is set in \field{device status}, when the driver clears SUSPEND,
>> +the device MUST either resume normal operation or set DEVICE_NEEDS_RESET.
>> +
>> +When the driver sets SUSPEND,
>> +the device SHOULD perform the following actions before presenting that the SUSPEND bit is set to 1 in the \field{device status}:
> what does "before presenting" mean? does it return SUSPEND as 0
> after driver wrote 1 there and before it completed these
> actions?
Yes, it should return 0 if the suspending  operation is still in progress,
It should not change SUSPEND bit value before finish.
Do you suggest we add:
The device MUST present SUSPEND bit set to 1 in \field{device status} once it has been suspended

It says: presenting that the SUSPEND bit is set to 1.
Not a native speaker, but this looks clear to me.
>
>> +
>> +\begin{itemize}
>> +\item Stop processing more buffers of any virtqueues
>> +\item Wait until all buffers that are being processed have been used.
>> +\item Send used buffer notifications to the driver.
>> +\end{itemize}
>> +
>>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>>  
>>  Virtio can use various different buses, thus the standard is split
>> @@ -872,6 +923,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
>>  	handling features reserved for future use.
>>  
>> +  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that the driver can
>> +   trigger suspending the device via the SUSPEND flag
>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
>> +
>>  \end{description}
>>  
>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
>> -- 
>> 2.45.2

