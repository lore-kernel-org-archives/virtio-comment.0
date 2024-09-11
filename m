Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F367714287
	for <virtio-comment@lists.linux.dev>; Wed, 11 Sep 2024 03:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726026771; cv=fail; b=cHehosoURdPN9h6tzlG/XOGBID2sacbE0QCXqSr1BhhS4AFr+YUJW6rwCpEcnvNkyulit6su69uU9BfuPZKmpDIQXQgmJZLco2xsW3ZCrX1GmywXKMX6FLQdAb1LajyAprk8B94HlI8BEI7UFyloudrPCpuBYs2/F6zKAKBpPLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726026771; c=relaxed/simple;
	bh=9v9k/TTvdZ1lTC+ju1u8Hz0sLvUJXTjKLLDO37eutj8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LieXi1fGn5SO386qhLepAxWTkbYpCwPWxbjxqo1ixcj0P70Z0iBYXl7Gl74uFu59HXxiTBolxIakDG3YQltrhAEOGMc7rNaa4cJr0yrPUT91Aw+nMQ7Mjkw6sONjdOL7PwZ3LWjeKd83uV39waGesJHPqeYnzO6blWH5u5hard4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MWUbrDEy; arc=fail smtp.client-ip=40.107.93.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MWUbrDEy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hx9q4/KuSikhrSZEGo3HPIZrIrPQ3kRfRFXPBiZcJh4rYga5+vV0aItnG4Wffq0imJdshJ+Gt6siqHxIy/lfYYvTyUeZeqYRReV06ywPmiLN23HVSXFsXuiDPrTMN/Q/jLV4S9Tj6i0/zEu1GVoxYNsxFXLJ7oYpaOWR34BDX8FRwZc2Shau9HdSmGC/Dc6hHMrWNv7ygOINI5bf+JzlMOyzLiBy2NHogCArnsCmjXGouQ0sqjpOA4uzssfZPgmFPUcHU3eZ21a8W+0HyYrVuHZ1arpg0PD9k2WvzqbLS9yXnQrupESWa9ht9C9m7YNtWptb6Htba30Wi82sfI7wKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4Erx9KqiblyM2GCXik7sSD0q0U78buWc7RzbltwnjE=;
 b=UCT2+frfsxvakB/jhU6HaWybSza1x680m4w+Lk1oNV2MASBd2JbqURMJvwwLoc7hl7/tIIlAuXySjZ+KP83MqTV/5m8N5Cf6D/Qs7nUlud5W7jzYnTcOccNxmD3RC9uqRCpHuJUWJwhy3hWOl9Y4Rt7nbeK6gh5dDYGoi+CQD6MP895QgFMdo/QeGSWT1M2rja+FW9C9Bd4ODEhg7ftRglTBZ5Lg/HaIW/xAsPPkPembhrj8A3NV/NdmoO5BpBiOcsx3iwgd50H4tdAsOT8zc1z7VScAdsTJ4V9908iNLighdu8xs+OH+Fr4ZmNKMWLR62eJY/lyrPFJt4c7pADoPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4Erx9KqiblyM2GCXik7sSD0q0U78buWc7RzbltwnjE=;
 b=MWUbrDEytZ1mhPn/TWX5bkncSccUCJMcF8Mn8Rg1uKmw7lD6mQGEeYer+DdlDL5bkKweTYmITp89a5qE4RB03+zSnibFUQc3ho/GUNCtdvMDOrpx10mB5GIFA40ovl+HdW8Buh3Qeurdq3EODF6SkjnkoJ8+rtXnHlc0E+RDPgs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by IA0PR12MB8423.namprd12.prod.outlook.com (2603:10b6:208:3dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Wed, 11 Sep
 2024 03:52:41 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 03:52:40 +0000
Message-ID: <3d8bc48f-081b-429c-99a4-95bd08babd98@amd.com>
Date: Wed, 11 Sep 2024 11:52:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 David Stevens <stevensd@chromium.org>
References: <20240903054018-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87134BF3D3326ED35358D6A1DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240903063424-mutt-send-email-mst@kernel.org>
 <20240903063625-mutt-send-email-mst@kernel.org>
 <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com>
 <20240903235727-mutt-send-email-mst@kernel.org>
 <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
 <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com>
 <20240905024935-mutt-send-email-mst@kernel.org>
 <47b21a27-d34f-4836-9af4-b009001536ef@amd.com>
 <20240905031759-mutt-send-email-mst@kernel.org>
 <CACGkMEtTGHr0+=7X3tTfmXQnfZkbCXv=DqXiBGe54+5JSmETWQ@mail.gmail.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <CACGkMEtTGHr0+=7X3tTfmXQnfZkbCXv=DqXiBGe54+5JSmETWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG3P274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::22)
 To SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|IA0PR12MB8423:EE_
X-MS-Office365-Filtering-Correlation-Id: b7353ea3-19c4-4532-6a0a-08dcd2152e9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WDRWNnBtSVJ6WkZIclU5cW9SNkhGZ3VMRXNFL0RBS242Njgrdm9mdHBiN3Q0?=
 =?utf-8?B?UkJXVVMySURLY2VIbmg5NHdBZkhkd2xDdXpla3JLWE01Z1ZXWW5ydzJzZ3Fr?=
 =?utf-8?B?UEtIbFR5ZE52UXQ0d1NySzJtc2xuNG9JS3JSVXFzdWhodm5vZDVGWlFGNHJB?=
 =?utf-8?B?WDc5M2FGSW9zaFI1ekp1aXVlQ0F1UW5NL1NSYkFKcWZCQmJIQzJEbFlseU5C?=
 =?utf-8?B?MUgvcVU4UGNXN0F3UWJsbHV2cmIyZUJVUHJoZDhoTk5od2lUT2N3OUFmNWY4?=
 =?utf-8?B?ZHZ2bENBN1FhUmx6UXNYWktjbTR2ZTdmVWx4TiswT1BmamN6TTcwc3NSZmVJ?=
 =?utf-8?B?SEQyOS9Eak5VcHJtZFdjd0VZUElmbzNIemNYbk9PQWRKdTUzUitvRWkvdHAy?=
 =?utf-8?B?ZDY5NythSEtrMFJUTHlLUmpDaWpYUzVtdFJGOGZZNnQ3NzYwcytwL09PYUYy?=
 =?utf-8?B?R0xNVHM3cUVLRXJaaTIycFV1OHlvaVR3enJUN2IvQUFxWHRYOXlZYVQ3OFZ4?=
 =?utf-8?B?eXNmcmFGN1FQaFdPakNtVlkvZVVJZ0ZtWVprTC9xWmE3c0NvMVdzQk5yY1pW?=
 =?utf-8?B?eTJJdVl1bXNrSDFaaE4zOTdBc2RQM2M4eU1TTFdOa1lGM1BZRmd0OWwwT0V3?=
 =?utf-8?B?djgxTUVUUnJFRDVBdG9Lb3UwOGt1SHlsd2VJRDdHWWVQdldLMFpFWEFpZTkv?=
 =?utf-8?B?aHlRNmlybi9qK3JCZXRQYVJ5WjBTcjZsOHpCdUlsMzl6alhCK3lPMThCSUxW?=
 =?utf-8?B?Z0JwQVo2akNxMmRPTHU5cWpLSCt5d2wyUHN1bjQxRVRzV2FMVUh0SHgraENL?=
 =?utf-8?B?ekJ2em5DTU9EYXVna0Z6ZFg5M2ZoTVNwYTZ6QzNpcnNUbUlZeGhiY29nSFFP?=
 =?utf-8?B?NVYzUFJGZ1ZBamZ1bi9Mb3RUVVlHRm8yMkkrY2JncW83aUcvQWx4MUpwNDdr?=
 =?utf-8?B?RGQ3ZEE3MDNncGl4YlJseXRiQ1ZCb082cWV1dU9JUTdSN05SZDJkUitneTZR?=
 =?utf-8?B?bUxuQzVhRGY5T0h6Z3FRY014OHZKN01tR29RQWg4OURSNVRlSnNiQ0FKcnZj?=
 =?utf-8?B?aXFsa3pGY0dFOFBXYjNTdmhjMVEwTkx5OUpGTmNXSzlsMFYvLys1M0FGSWlH?=
 =?utf-8?B?RmRRQWoxUFVQZTlnbThqdjVoU1VmWkpRNW1SbEVkeUNaK3NlREhSUThiOEtw?=
 =?utf-8?B?dWZvRWM3M0UxZWFqcGd1Q1pZcUl2TE9WK3RWRjR5b2FLcUp4YmhTRXJ6MHN1?=
 =?utf-8?B?MDV2QUhqN2lJRDRIVFM0ekpCRGRkT2UyZEZLdi9JM3I1SjN2cTR1L3JzbitY?=
 =?utf-8?B?aVQyTTYzcFNkdFhJNUtaUHRZWi84NTVMYzlpNEI3cGRPclJ1TGJJSk81dlgv?=
 =?utf-8?B?U0g3a1BLY256WnRKR20yMUtQbDUyV1VwMW42U3RuK29BWjJ0TGdnU3BoZ1lM?=
 =?utf-8?B?NGdsVHhJR3JCTklCbllTUHlXODhWbXVlWmtaNktnWVh6RTRZZDhxcm0rRXJE?=
 =?utf-8?B?M1RweExNZTF4YnBaSnkrUE9iV0VzUGlsbTl2WGRqOGFZWDkrNStoTDFBK3Nz?=
 =?utf-8?B?NzUzVnkwUThJcmlwOVZxNHVTS0xodlV6cG54UDJTL2lOTmE1dlFUY3RZZ1A1?=
 =?utf-8?B?d0pJYkozZFIxU2w5ejNubjdORWRVdHR1QzRhTkxHODZPek1wQ2JaUzZLdjdC?=
 =?utf-8?B?UGN3TXZtNkNURzJkSkNKTk5QTDhyZDZEMjBJV3RwckduNCsrUGpaK1V5anpK?=
 =?utf-8?B?QU5GcVJhQTZheHlPcmNBMVVZQk9rSEYwWUo1dEUyRDVYRktzcTZTWm5EczRO?=
 =?utf-8?B?L2pNOFNQOFpKSVBON3Qydz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c25qNzVFcnNCczlKZy9jeEN3K2J6M2NvMml6RXU2ZG1VTGxBa2h4cVJOTlFI?=
 =?utf-8?B?SXBFSXpaNytmLzcyck5sNUZWZmV3WVlTOHE1VVBNM21zbXBPdTVZR2Jha3M5?=
 =?utf-8?B?aXd2LzR1Zy8wKzBUR1N2a1pqT29na1pzZXJlTk04VURMYzRxTUN6SmVTSjdz?=
 =?utf-8?B?MmRwR0dLMEptQ0ZmQzMvUDlaaDdUVEc0cHpuWnkyL0J2MHlYMHVPczZMOUNj?=
 =?utf-8?B?ajhUVExqVmQreGRrQk5XS28zdGVJNWxiaEpmVDgyekNVaUtVdnplV3U3V2lo?=
 =?utf-8?B?U04vMnFvejB1NW5nM2ZpSTFHL0VYNjJuS2dLc0lhSFpMRjBIUmhHZy8xSFJv?=
 =?utf-8?B?TU1Hc1ZzT2NTL3haTU91aUVIQWExUDZ2azNZRXNxWDRYcFhUS3pRK21zMU85?=
 =?utf-8?B?ME5xbC8zeEdtZDQrclR2a3NpK1haNlR4azZlSGVSNmsyaUYrWXNxMzdnaGJI?=
 =?utf-8?B?WElReWpsOCtPd00wTmNUYXZBN0JwTnI1QmovZ045RVVUend3ODNpcVNqMEx0?=
 =?utf-8?B?Tnk4c1hDeVQrM2tmTVB2dCs3TU5HeGF0enB6OVRnSjBtT0FCQ1BPdGFlSUI5?=
 =?utf-8?B?cWNGNjI5YXVMVEFBNU1TRGsyMnNlNmF5Z2RGWWJWU3NVbGZraUVRTjB2L0FS?=
 =?utf-8?B?YVA5QjJQYUR1c0hQaVp4SmdGY0lzWDlMSm16VWpPY1FWeGswMGJuMmdnN052?=
 =?utf-8?B?Uk1vNTdyak92aDk0L2pES1F5bGNvaTRXbEhOUHFiVU5VUTJhR0E2MER1MTRN?=
 =?utf-8?B?QkI5cFFVRnp2RU54K0FxTm5jd1BqT3F0K1Z1YUZNSmFMM21UaDF6ZW5oNFFH?=
 =?utf-8?B?UXZXeXZtN2tHQjBMakVMcHhrcENVUDVnZ1ZwZGxFNnNRcW1FVFJHN0Z2a2U4?=
 =?utf-8?B?TzNmVUVObkJWTXJpOVpSdC91Ujk0NHh5WXEzT25pazc5ZXluMGg0SFplRm40?=
 =?utf-8?B?OHg4d04vaUtZaUpzK2lBME52bHJ1Q1VUUlFPVHczL3hsZTRFR3g5a0YzVm5l?=
 =?utf-8?B?bDdNMThIaG81REZNZHFNMkZMbVp1VDBVQmUzcWJ2VHdLREVCY2RSU091c3hM?=
 =?utf-8?B?TU40b3IvNXdNRVc3bUtMVmovMG1CR3k3ZDhaSVNOaEVMNlFHanczVHRrajV2?=
 =?utf-8?B?OXk3SzdPclBUd0QxcUg0TWZnQUs0Z1orWHlqVkVpbDhEYXZmREhHUlFROFRN?=
 =?utf-8?B?RDlRdEVhM3djY1YxNUx6dTVWQThzeWVabGpyMXU2cFhTWXhteEwxSDY1cml6?=
 =?utf-8?B?SE9YR3NwWjNQMmpiL1JobFFjcWtoaExTSlFMVHJzMEYyaksvSXdnT29hSUVw?=
 =?utf-8?B?ZXVQYm5Jbi9acjBJNlA0d2g0M3p1aUdsQlk1dzk5MWVCdG0wLzV5eVVBcm1Y?=
 =?utf-8?B?MlNxRHo5cGI2c2ZaQ0xtZ0s3UmtmV3FDcDRkVUpQRnducENEWHdJRjUwT1hK?=
 =?utf-8?B?SXJWWGRrbTMzamp1NzE2VmZna0FsUTRCZnlxTUQ0eGE3MUY0WFdTd2FUV1Jz?=
 =?utf-8?B?QUtjT1F1ZTRHOVN1WGNqWFVjZGp5YzRiZmEwY2J1VVY4QVlNNkhFRGtiNEpI?=
 =?utf-8?B?SFBjNXhBOW1pY2g0UmRxMkdBbldVWmlIRGpIb1NnRWZaSEY1S2pBWUgwM25V?=
 =?utf-8?B?MGplNXJqUHlHMXFmWG0wKzBFMkhxUWhqRXNqY3E2ZlVEUFhBamtnMHBZemxV?=
 =?utf-8?B?Yi9CM24rME9GdlNVdzZpRHozNGlSaFVENVBFZGNFaUJFWWd6aG9JcXhPU245?=
 =?utf-8?B?WFdGUzBaeks5MjBvUzIxVExaOW9TNFROTU9uZmdENW01RnpieUZpenA2M1Bn?=
 =?utf-8?B?SlhUQmFuOHFsS2R5QlMyVjdhR2U4UVV1cFE0QUthYy9nYTBIVCtYOEk1UU9u?=
 =?utf-8?B?bW1NeGxOV2JhdW12YUwxZ0I0dWJwcGJFY29OWGU4Q3A1T3ErVmpLaFRlQ3NZ?=
 =?utf-8?B?S2gwQUNkWHJvUWpMcHA5czFxVFBiVHJSa2ZEUGlWRUptRFY2M3plN3dQSHNG?=
 =?utf-8?B?MnNGOFh4Ym5WT3pBamdIK0JvSHJIZEVCaGtyZ1g2OXR0QnIxQTAxeGlWcEJU?=
 =?utf-8?B?OVBVY2o0NGxoL0RtM3hVQkRzaER1aE5KQ2llUW1ncEllOEtLM2tGNW9oY0Fv?=
 =?utf-8?Q?AMvkqVKZcIuFQiKpRUQWH7wZT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7353ea3-19c4-4532-6a0a-08dcd2152e9a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 03:52:40.0572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vy6c2r58IM4bVZ19aKjbijfzSoh1+VXNCHORSRzmyKfHkTcsTTSkSpoDluuzutk7K9EGqAz3C0DqpdjA57LyNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8423



On 9/6/2024 7:51 AM, Jason Wang wrote:
> On Thu, Sep 5, 2024 at 4:12 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>> On Thu, Sep 05, 2024 at 03:12:41PM +0800, Zhu Lingshan wrote:
>>>
>>> On 9/5/2024 2:51 PM, Michael S. Tsirkin wrote:
>>>> On Wed, Sep 04, 2024 at 02:38:36PM +0800, Zhu Lingshan wrote:
>>>>> On 9/4/2024 2:31 PM, Jason Wang wrote:
>>>>>> On Wed, Sep 4, 2024 at 12:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>>>>>> On Wed, Sep 04, 2024 at 11:07:25AM +0800, Jason Wang wrote:
>>>>>>>> On Tue, Sep 3, 2024 at 6:37 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>>>>>>>> On Tue, Sep 03, 2024 at 06:35:59AM -0400, Michael S. Tsirkin wrote:
>>>>>>>>>>>> But I don't like it that looking at the registers, one does not know the device
>>>>>>>>>>>> state. Hidden state is bad for debuggability.
>>>>>>>>>>>> We have 4 states:
>>>>>>>>>>>> suspending->suspended->resuming->resumed
>>>>>>>>>>>> so we need a register with at least 2 bits.
>>>>>>>>>>>>
>>>>>>>>>>>> we could steal 2 bits from status but it seems a bit much.
>>>>>>>>>>>>
>>>>>>>>>>> This is why letting the status tell the status and control register to control thing is elegant.
>>>>>>>>>> No argument here.
>>>>>>>>> Or, to be more precise, our status is driver status.
>>>>>>>> It looks like the device actually otherwise there's no need for
>>>>>>>> re-read or poll for things like reset and others.
>>>>>>> The need is there for complex device state transitions, which
>>>>>>> can not reasonably block a read response.
>>>>>>> Another standard approach with PCI is to specify the time
>>>>>>> transitions can take. I consider that less elegant -
>>>>>>> is this what you are advocating? The advantage is that
>>>>>>> driver does not load the pci bus with constant re-polling.
>>>>>>> The disadvantage is that it is hard to pick a universal
>>>>>>> number.  A combination of these approaches might work,
>>>>>>> e.g. a recommended timeout then poll.
>>>>>> We've already had msleep() for vp_reset(), anyhow we can increase the
>>>>>> sleep time, if it can overload the pci:
>>>>>>
>>>>>>         while (vp_modern_get_status(mdev))
>>>>>>                 msleep(1);
>>>>>>
>>>>>> We can do the same for suspending.
>>>>>>
>>>>>> The main blocker for timeout is that it may break migration and
>>>>>> complicate the hardening. Another proposal in the past is to have a
>>>>>> notification.
>>>>>>
>>>>>> But what I don't understand here is that suspend/resume should be
>>>>>> lighter than reset. If we can afford a reset, so did the
>>>>>> suspending/resume. If we want to have something new, that's fine but
>>>>>> it should be orthogonal to a specific new status bit?
>>>>> I agree, if we want new status indicator, then the new indicator should not be
>>>>> specific to SUSPEND.
>>>>>
>>>>> Thanks
>>>>> Zhu Lingshan
>>>> If you mean reset, we have a problem.
>>>> Specifically, reset has to work before feature
>>>> negotiation. So we can not do as we would with
>>>> SUSPEND and use a feature bit to expose presence
>>>> of the indicator register.
>>> I guess the driver can reset the device even after DRIVER_OK.
>> in fact, unlike suspend - at any point at all.
>>
>>> IMHO the indicator should work for all device_status transitions,
>>> not only for RESET or SUSPEND, it should also apply for FEATURE_OK
>>> and DRIVER_OK.
>> I don't  know what kind of transition is there for DRIVER/DRIVER_OK.
>> FEATURES_OK brings with it more issues, e.g. it can fail.
>>
>>
>>> So we don't need a feature bit, we may just
>>> place it in the common config space as you proposed before to
>>> define common config space for all transport. We can do this for sure!
>> I have to say, this project is really ballooning out ;)
>>
>>> Of course another approach is what Jason proposed, the existing
>>> msleep and poll, driver knows whether the device is in progress
>>> of status transitions because it is the driver writes device_status.
>>>
>>> Thanks
>> or just a register for suspend transitions, worry about
>> extending it later/
> Is this for PCI only? Another question is that, if suspend needs that,
> reset would also want. Or it doesn't justify itself as reset needs to
> take longer time than reset.
Ping Michael.

I think Jason's question is critical and we should address it before
we proceed v8

Thanks
>
> Thanks
>
>
>>>> Regrettably, reset will have to still be supported
>>>> through clearing status just because this is always there.
>>>>
>>>>
>>>>>>>> Anyhow driver know
>>>>>>>> its own status.
>>>>>>>>
>>>>>>>> Thanks
>>>>>>> indeed, the status register is there to inform the device about
>>>>>>> the driver status.
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>>> If we need
>>>>>>>>> to reflect and control device status, we need something else.
>>>>>>>>>
>>>>>> Thanks
>>>>>>

