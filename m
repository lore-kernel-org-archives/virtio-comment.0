Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2048.outbound.protection.outlook.com [40.107.96.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326BB224236
	for <virtio-comment@lists.linux.dev>; Thu, 20 Mar 2025 10:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742464856; cv=fail; b=dz2tHYGVqRIJD9RTolqkCZlk2QkHpVkCa7Osuzj4uIT+cqKCvV8qEaz0oCTz3IjRo+j0YpADM0wBJ5NCrKN0TqVckUeIRgWVKEVTIhYm/GCwm2d3hh4XX6o+3/hgW+yU0lHM4VJzu8jFqeDKOeD2TBl2ZRYTvPqBIzvHrMN2uDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742464856; c=relaxed/simple;
	bh=5/491q+ySh0ktbc5b36snWD2tqcKGX0qu6++ftr7grM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X36jUzRLK7P0KpDpza2qLth51PZ9T5a8m+lZkjAa7hTLNIOQLpUdtNdtLGyV+ZqHJynFDYZw74DZFkgMPqO04FVfNMlbf30VgpozQ9CblUdarp15kI4vfdg0Rr+Ebc2ic47ZntM2PSJj7+X3se1m8LO9rncIeRUk7lgXJkXS65g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cHXQdlnC; arc=fail smtp.client-ip=40.107.96.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cHXQdlnC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=He/IHEIUamLh0RxjgeOLfR5mqY5wb1sAJEwLzsIt7FN6gyDFBaHffYulIwG/FT03mnnK/jLKqnaYniAv2/28nApweSSHX0GCLZHPJIVctJ5XNSNEzM3iZnGfaFXGc0CGcxppbj3bHLXowvucwx25B3vgIo8u/0wAesrSMkhaqiNRbVOWNfZuwNSJC74+AAa/wVdj+3ZeZLwb0jlai18PIpRtTT4GXYqeOT48Ny6xqgjkkVw0UK5XIx3QnWKczVCQeu3v+tP9rc/yIYl3vJRHZQ5zIs8IWrEpcbj3PPsAGxZI12Bp+vuhN4QH2CzjoiuRkRs7PjtqPcSMgga5YF3viA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/491q+ySh0ktbc5b36snWD2tqcKGX0qu6++ftr7grM=;
 b=U3seVlnHA1oyz9fk4xf78OrcHFlKCY3Y0sqmM3jFG1bj3gYhTa/2Wdc2RvBJt0x4IniGOTRGx3BATlyjQdoZjEewHbSziS6qpx+rAZE69qIUvxO81If9c0z00T3koCICnfF9cDe7+08yZizfXC67nd5uv2nPHnkucM07Zamf9E8f6ld+7j+KEiXKLymHw6nqWXOSfSRwH8PUmNIZWdpx3T9Rgqi8VfkCcbmW6rlZlAT35Edj0wiX1y/bPk83l+tp6pNsgfAJE+Pcxc1WQazGOqezitVihOY5m4QZvL+yuEGPXHXhOU5Ki8uID2byImeox7SanRGM23vaHpEQ5atYaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/491q+ySh0ktbc5b36snWD2tqcKGX0qu6++ftr7grM=;
 b=cHXQdlnCfiJzC2CfyWq+8Ofgqcbg4r3HuDPMp8LvQPuM0+GpDm2nQEOoeiq9jgreTpXeYdC8HyQLT3zmKdanFQqYgoxbhNr38csihviFTMq+fegR/j0m0Z/jvlkLe7WujUYU5Yiip/C49yYA84dAhMSG2xuEkO/WQRJYnMwWWt4=
Received: from IA1PR12MB6532.namprd12.prod.outlook.com (2603:10b6:208:3a3::12)
 by MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 10:00:51 +0000
Received: from IA1PR12MB6532.namprd12.prod.outlook.com
 ([fe80::dc05:a63a:39fa:ff0b]) by IA1PR12MB6532.namprd12.prod.outlook.com
 ([fe80::dc05:a63a:39fa:ff0b%7]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 10:00:51 +0000
From: "Zhang, Julia" <Julia.Zhang@amd.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "Chen, Jiqian" <Jiqian.Chen@amd.com>, "Zhu, Lingshan"
	<Lingshan.Zhu@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, Matias Ezequiel
 Vara Larsen <mvaralar@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, Parav Pandit <parav@nvidia.com>, "Zhang,
 Julia" <Julia.Zhang@amd.com>
Subject: Re: [PATCH v2 1/1] virtio-gpu: get p2pdma distance
Thread-Topic: [PATCH v2 1/1] virtio-gpu: get p2pdma distance
Thread-Index:
 AQHbiDDqEEldwfUQwEWlrThUs+ZiJLNZaHcAgAuAK4CAAKefAIAAtF0AgAWJooCAAMV1AP//p4KAgAGlUQD//4NpAIAAwCEA///8NYAAME+RAP//uzgAgAGn4gCAAPe0AIAAkj8AgAhdnQD//5WBAIAB8FAA
Date: Thu, 20 Mar 2025 10:00:51 +0000
Message-ID:
 <IA1PR12MB65320B3C035082C0A139708EF2D82@IA1PR12MB6532.namprd12.prod.outlook.com>
References:
 <IA1PR12MB6532B13A9BE99961E6D79722F2D12@IA1PR12MB6532.namprd12.prod.outlook.com>
 <CY8PR12MB71950B845BB9E5C10D864F39DCD12@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB6532DB3DD088B6F11351C645F2D12@IA1PR12MB6532.namprd12.prod.outlook.com>
 <CY8PR12MB71956575D93118AF3C425B51DCD12@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB6532768F74BE1198A9F7D100F2D02@IA1PR12MB6532.namprd12.prod.outlook.com>
 <CY8PR12MB7195003C2A8F7C8FE289EEDEDCD02@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB6532CD94403647007FD05EE8F2D32@IA1PR12MB6532.namprd12.prod.outlook.com>
 <CY8PR12MB71957E86BD3271121B8501DDDCD22@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB6532627FB0D9567568601700F2D22@IA1PR12MB6532.namprd12.prod.outlook.com>
 <IA1PR12MB653225F6373D8337181B649EF2D92@IA1PR12MB6532.namprd12.prod.outlook.com>
 <20250319080936-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250319080936-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: IA1PR12MB6532.namprd12.prod.outlook.com
 (15.20.8534.033)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB6532:EE_|MN0PR12MB5716:EE_
x-ms-office365-filtering-correlation-id: 6d8957f8-1efe-4e75-10ad-08dd679618ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cXh1clNiSnEvalllbit5aXVPUWVYL2NUT1UvL1pFczBiUnFubjBEalBRc3Mz?=
 =?utf-8?B?bFpQVERNZS9Cb0tBcVRPMHdwQ0NnOC81cVFIRW5CZWlsU081Y3JKSGx6RFNS?=
 =?utf-8?B?UGVkOGRUaExhTmNoOHN4RGNyMGdlWnhYUm5TdHcyZ1hTNDlIWUxObGJHTWhM?=
 =?utf-8?B?OTJXWmpTNXNVVW0zME90MGszV1U4SVYzQk9NN09rM3ZjQStRZFZIc2hQYU9E?=
 =?utf-8?B?V2JDaS82YVhRODJhb2JOZERhZjBYS2NnYVduTERDT2FVWDJPR3hpUW9aa2gr?=
 =?utf-8?B?RTVpeE43ckZDdklZemdHQmdNTE4zeEVRMEdjc2VRUG5Tb1V6RmZkcXAwL0dV?=
 =?utf-8?B?MzRRdzBGRW1hVkZCL1FNOVB2eDhvK0p2V1B6d3phM292NmJZSmJKSFIyZDU4?=
 =?utf-8?B?YzJIOGJQMnRRREtWUlYvNElXM1VmNkxnYzk5RGF5ZFUyd1pkbkxGbUxBVXhS?=
 =?utf-8?B?NE4wZHZIaWxsUFBsM0psSmdIVFpGbHl0Smg3NUc4NVRJWXcrVnJhM2FaZjlL?=
 =?utf-8?B?WCswOURiV08zTlNXNjV5VWlRQkxkNmxyTlB2TWNrM0pRM1Q2ZEZDTGEyakh6?=
 =?utf-8?B?QmVJTURLd3FTY3c1WkRmaUhPUU15a0ZSc25qOG56Mmg0VzVMZmNRTUwwU21J?=
 =?utf-8?B?QncveHhOTk01MWdDV0lGNTNUKzR2cTBKdzYyOHdlQXJnYmJuNFJGYkdtR0FR?=
 =?utf-8?B?KzBmVDE1VVJxUFkvdUtaTkNSb2tqa3RNUHV4VDFPekNWSFZLQ2tMSzcyTERp?=
 =?utf-8?B?eDdEdnJDTVBENmFwaXBsTjNZdW5kNWNvU0RlK3lONzkrOW9LNjlCejAxQk5U?=
 =?utf-8?B?RzlZT0VLdi9hMHN6VW9vTmw1QjNsMXh5RGlmQUlTTjdVU3k5QVFUZCtrcHF2?=
 =?utf-8?B?QXB2K1NnaVc4TjcwSFdXdnV2T2lIblkrOTRGeGVDL1M1Rkl0YjgveTJZL3Zv?=
 =?utf-8?B?aUFxbDJaQTJaR2daWnZFQjVVQWJxYkE2Qkd1d1VuOURNSEpKNVhXNGYwdUpQ?=
 =?utf-8?B?MGJDUXNKamFyb2k2NUVtNzhJU3MwRmxGYWRJS2tGZm44Zm5RVStVNEZwYU1m?=
 =?utf-8?B?UDl2S0c2V3l0dnRIWVZSQldyOEZXOTFROXUvRkh3MnM2UVVLZlNMOG5ibWhN?=
 =?utf-8?B?N0hocm5NSzlhbnFOb0VCMHIvY0R1T1k0T0NDTmV4aGcvMlc0ZmsyUmZtOTQx?=
 =?utf-8?B?aUxrRGIvbWdmUkZxV29mZ2g0T0Y0bHRQakM1cXpmSFBsUTBQaXE2RG1xMVRE?=
 =?utf-8?B?QzEvK21zYUp0QkJrV1ovZURCMmdaMk1hRVFzVUk4Z09mTEVQYnVwcVd2OVJB?=
 =?utf-8?B?VGl4NEI1SFdiTTNEV0NZNS85WXRQRUZ4SjJXc3FLcEs4UEE1ZWI1MjBKckdK?=
 =?utf-8?B?R2dEK25mUCtIQ1gwTGhSWGs0QWFSdUpuYmVtcXFjMkcxelU5MVhlcm91RFRV?=
 =?utf-8?B?dnhmUTFwZXFaSzhpUUt1YVZzUFFkNXVxU0NpeGg3SXVZaXpGeTlMcXBpOStM?=
 =?utf-8?B?eWJ2M0hDWTRSRjZUb0RBT29jZ3lnTmxkZlUxNERaWE9jQ0VmWlVCWUQreUJZ?=
 =?utf-8?B?RmlhRUNDaGQwTU11ODNQNFJkeFJPOUpDSlppQXh4K3hPNlliSlo4ejZJV05U?=
 =?utf-8?B?bGZCeEh0dGFKMjBPdEVseG9tclhZaUUxUHdJbGVsMVFkak92VmRKN2twZzZu?=
 =?utf-8?B?bkpzZTRPUXlGZ1AwQk9oRElUVG9vYzdHLzVlWURuVGxQV0RFSDF3TXE2MDBE?=
 =?utf-8?B?dGZQcFB0b0pHcFJ0d3MrTlJHUFJrU3pCN2t2Z2pzOGJZK2R6OHNKSFFSbmdn?=
 =?utf-8?B?ZWJyNHBtTTc1ZWZBRm9BWGhNc09WdzVsZExTd3FQTERrOGxmYXZmd24yalhv?=
 =?utf-8?B?QTRaMEwrQnZ3RGJONnRYVEw5WWFIVkV2dWdmcERHRkVTUHAzc0VUTzN4RVRo?=
 =?utf-8?Q?o/nwRq5ZF5MlHrVoegIdLNBTJnXdoeLl?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6532.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MEVwcVN6R0RIS0IydWZyVmhZVDI4NVBQUGM3VFVFL0krcU5tNGNCZVBHK2dM?=
 =?utf-8?B?eXFFRXB3czUzSEhmYk1WTm1rU25IMkQ0TGlTMEd0WnM2Qjh4WDhHMmJrbTd2?=
 =?utf-8?B?aVNGeGhvaDRWc0lxY0xUUEVTRUlyaGNsem5FZ3dxOVZlaHZFTWszWHpOam9J?=
 =?utf-8?B?WlRQWElOcnFSbUtKK3ZWL2thaUFJREEvT1ZBeFlFRVkwRVBVdExFd01hNk9Y?=
 =?utf-8?B?Rms2R1llMkJvMW9QUUs4Snp3VHdyYmdoSDk2cXpHemlQVmJMaEZXYUZqa1lT?=
 =?utf-8?B?RmI0VXRKZnREMWVFYVIwWE9xd2RxTUJvNjhYeUluNys1dXVEekQvdC9DYjRF?=
 =?utf-8?B?KzNGd1pOWkFZTkFKb1BXR0NweXdrL3c4UU1pNXV1L2VheTNJUjhIMFZscDBS?=
 =?utf-8?B?bUl5YmNmeW9pelRIRFRrZlAyMVNOZWZ0UUhvVy9ORnZ3N2dnaU91eVZkTEIz?=
 =?utf-8?B?bDVFZ3ROV2IxMWM4Rkl4aGtaQTFwbEpZcFI1RkN3SnovMmhTbDF6MmUwS1F1?=
 =?utf-8?B?elJjZ0lDZVFJQWhHMDJqdGM3Tnovbk8xbjlqUUh3ekRMR2VTM0Rydmp1RWhS?=
 =?utf-8?B?aEhBcDYrZ0hmRkVSOVRmNTZ0SGd4aW9tYm91QjlkR1J1SGtEZFNFQ2puOUxj?=
 =?utf-8?B?MHV2TkkwRXRpcE1PUGI0ZFRqWHJ0cVp5V0h6em5Rd0dBcmEvRnJCTjZoRXRk?=
 =?utf-8?B?OHZxc1JjcHlMdHFGcnhhRkJqd1BBLzQzT3lzaVVzc3VQTVdKRnVZekoxTDRB?=
 =?utf-8?B?SFZtT2l3NGVHQ2VTU2NDQmdRdWJRVm1jY0VZUUVlSXZVcy9OOFQ2MlpaTmdM?=
 =?utf-8?B?aU14eWxuTG9BN0ZUcFR2NDNyaGwxWUE4WCtpcmNtVldkWER2SG5EUkxrM253?=
 =?utf-8?B?bXZyY2hPcWFSS016Y3NlbWd4SjFuRjVROFFPMUt1TXA4K1BIVTRUbmx3aHBy?=
 =?utf-8?B?VFF3anpZQkl6T013cGJqS3E3Q3ovcDBPRFRURjF0S1VmRmtLd0k1ZEFuaTZi?=
 =?utf-8?B?Njh5ajE0VnhOSHNIQ1ZyQ3g2QzRuK2VYMnM0TjhUT01XN1R1TVR6Y3JsbTc0?=
 =?utf-8?B?NCs1WlUzTkpsWTVQT1VGd3lES1NhQS9kTmRwUzRJcmZZanJTekVqaVAvYTNX?=
 =?utf-8?B?eWE4Zm00MWV4T0VYcjg4bGlVckg5Y3BHeW1pOE13OGpHcGJNcmdKQUk5Q0hS?=
 =?utf-8?B?aU1RcUxvU0NyRWR0bHQzNi9MOXJScDR0M1NQVlROUVF4S2dQcUVTdzlNOTgw?=
 =?utf-8?B?UzJJQmRtc0dSUnRtWTlDK1lSQTYvbVc0OEJBMytGMmRNQ1RFbjVoZnRRckto?=
 =?utf-8?B?b1J2ODhKRVI4L1lIWFh5QVdnaDhsZHVGdWVqZmVJZjNTSkpySWZ1Y0kwOHZa?=
 =?utf-8?B?Y29FN3Z4NUdMRjZ2eXpzU3lrT3daSXZEWS9ROHkxZUFGc211QjFtK3NXMCs0?=
 =?utf-8?B?bXhVZWtVeTNUSENoYVJ4bWFMMHRmQ0dxQXdVaTgyWlE5a1B2WFdlQ2F5a2xs?=
 =?utf-8?B?KzQ0ME42UExCQnp1QXp6b0VqR0ZUUHlETk5RVHlQRTNzSDZXK3dGaGpjSnVs?=
 =?utf-8?B?M3RKUlh6bktSb1Bod3d5QUFSNTBkcVFSYTlVSEVMYTZWMzlSL3RVYWVMOXZl?=
 =?utf-8?B?ZWEvNzlQTWYwemREOE5aZ28wM29lVTg0SDBHRzF1RFBTMDlHcVZmdzNGZ2VE?=
 =?utf-8?B?UWhiajl4WEExanV1bjlxNlUyUS9WTStYWGVhVXArUC9ia0dHNXR5QWhuT1Ev?=
 =?utf-8?B?dXJaWE5NcW9vU1V3V1NTRmZuZ28ydkwrYWpqcVhqME02cHA4REc2Z3psZU9Z?=
 =?utf-8?B?Ny96ZEcrc3FVT2hGWXRuWVUwV3BkVTRMSk1KYmkvTDlCdFhJdEZNSzhMbGZM?=
 =?utf-8?B?MjM0eHoya2Yrcm9BWTMwNDlmS2l2Q1dqMlo1VVZhOWZDZzhhaEhOS2F4Ulpz?=
 =?utf-8?B?allzRE9yWitXbm9ITSs3UFFoNXVmZktmSjBXYjAyS3kyWm01ckpkV0Z1MFA3?=
 =?utf-8?B?aUxrakJMT2FXTmpGQVVVYjZMcDFqeVZaM0crcDVHd0xMNW9mVzZlTlRkTXp4?=
 =?utf-8?B?SkhBeDV0YmxwSHJZREtCSkJPRkUwd21MbHNKWVRDNlZvWUtZYnR1OVl0SVRF?=
 =?utf-8?Q?SIZs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2769FF7B0D2CDE4FB86B6F0B694725CE@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6532.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d8957f8-1efe-4e75-10ad-08dd679618ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2025 10:00:51.2549
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zB5O2N6lMWJVZVzDqMyCyhZRoXQYxNds5tliDg0wQEJBAF1Rb4PWRqbHMs+iElrPoP4+NEnLyeIKzgCxhqrFEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5716

DQoNCk9uIDIwMjUvMy8xOSAyMDoyMywgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOg0KPiBPbiBX
ZWQsIE1hciAxOSwgMjAyNSBhdCAxMDo0NToxNEFNICswMDAwLCBaaGFuZywgSnVsaWEgd3JvdGU6
DQo+Pj4+PiBDYW4geW91IGV4cGxhaW4gbW9yZSBkZXRhaWxzIGFib3V0IGhvdyB0byBsZXQNCj4+
Pj4+IGd1ZXN0IGRpc2NvdmVyIHRoZSB3YXkgUENJIGRyaXZlciBkaXNjb3ZlcnMgaW4gcGh5c2lj
YWwgd29ybGQ/DQo+Pj4+Pg0KPj4+PiBUaGlzIGlzIFFFTVUgb3IgVk1NIGxldmVsIGltcGxlbWVu
dGF0aW9uIHF1ZXN0aW9uIG9uIGhvdyB0byBidWlsZCB0aGUgc3ludGhldGljIHRvcG9sb2d5Lg0K
Pj4+PiBJbiBsaWJ2aXJ0IGFuZCBvdGhlciBwbGFjZXMsIHRoZXJlIGlzIGEgd2F5IHRvIGRlc2Ny
aWJlIHRoZSBQQ0kgbGV2ZWwgQkRGIGV0YyBkZXRhaWxzLg0KPj4+PiBZb3UgbWlnaHQgd2FudCB0
byBjaGVjayB3aXRoIHRoZSByaWdodCBvd25lcnMgb24gaG93IHRvIGFjaGlldmUgb3IgZXh0ZW5k
IGl0Lg0KPj4+DQo+Pj4gSGkgTVNULA0KPj4+IEFzIGRpc2N1c3NlZCBhYm92ZSwgUGFyYXYgc3Vn
Z2VzdGVkIHRvIHJlYnVpbGQgUENJIHRvcG9sb2d5IGluIFFFTVUNCj4+PiBsZXZlbCB0byBtYWtl
IHZpcnR1YWwgUENJIHRvcG9sb2d5IDEwMCUgc2FtZSBhcyBwaHlzaWNhbCBQQ0kgdG9wb2xvZ3kg
c28NCj4+PiB0aGF0IHdlIGNhbiBnZXQgYWNjdXJhdGUgcDJwZG1hX2Rpc3RhbmNlIGZyb20gZ3Vl
c3QgZGlyZWN0bHkuIFNpbmNlIHlvdQ0KPj4+IGFyZSBvbmUgb2YgdGhlIG1haW50YWluZXJzIG9m
IFFFTVUsIGNhbiB5b3UgZ2l2ZSB1cyBzb21lIHN1Z2dlc3Rpb25zIG9yDQo+Pj4gZXhwbGFpbiBt
b3JlIGRldGFpbHMgYWJvdXQgaG93IHRvIGFjaGlldmUgaXQ/DQo+Pj4NCj4+PiBUaGFua3MsDQo+
Pj4gSnVsaWENCj4+DQo+PiBIaSBNU1QsDQo+PiBTaW5jZSBQYXJhdiB0aGlua3MgSSBzaG91bGQg
cmVidWlsZCBQQ0kgdG9wb2xvZ3kgaW4gUUVNVSB0byBtYWtlIGl0IDEwMCUNCj4+IHNhbWUgYXMg
cGh5c2ljYWwgUENJIHRvcG9sb2d5LCB3aGljaCBJIHRoaW5rIHdpbGwgYmUgYSBiaWcgY2hhbmdl
IGZvcg0KPj4gdmlydHVhbCBQQ0kuIENhbiB5b3UgZ2l2ZSB1cyBzb21lIHN1Z2dlc3Rpb25zIHBs
ZWFzZT8NCj4+DQo+PiBUaGFua3MsDQo+PiBKdWxpYQ0KDQpIaSBNU1QsDQpUaGFua3MgZm9yIHRo
ZSByZXBseS4NCg0KPiANCj4gSGkgSnVsaWEsDQo+IEkgZmVlbCB0aGUgaXNzdWUgaXMgbm90ICIx
MDAlIG1hdGNoaW5nIiBvciB0aGUgc3BlY2lmaWMgaW50ZXJmYWNlLCBidXQNCj4gdGhhdCB0aGUg
bW90aXZhdGlvbiBmb3IgdGhlIHBhdGNoZXMgaXMgbm90IGRvY3VtZW50ZWQgc3VmZmljaWVudGx5
DQo+IGNsZWFybHkuDQoNClBsZWFzZSBsZXQgbWUgZXhwbGFpbiB0aGUgcGF0Y2hlcyBhZ2Fpbi4N
Cg0KV2UgYXJlIHRyeWluZyB0byBsZXQgdmlydGlvIGlHUFUgaW1wb3J0IHBhc3N0aHJvdWdoIGRH
UFUgYnVmZmVyIHRvIA0KaW1wbGVtZW50IGRHUFUgcHJpbWUgZmVhdHVyZS4NCg0KQ2hlY2tpbmcg
aWYgcDJwIGlzIHBvc3NpYmxlIG9yIG5vdCBpcyBzdWdnZXN0ZWQgYnkga2VybmVsIG1haW50YWlu
ZXJzIC4gDQpUaGV5IHRoaW5rIHRoYXQgYWxsIGltcG9ydGVycyBzaG91bGQgY2hlY2sgdGhlIHAy
cF9kbWFfZGlzdGFuY2UgYmVmb3JlIA0KcDJwIHRvIG1ha2Ugc3VyZSB0d28gcGh5c2ljYWwgUENJ
IGRldmljZXMgY2FuIGNvbW11bmljYXRlIHdpdGggZWFjaCBvdGhlci4NCg0KQnV0IGluc2lkZSBh
IFZNIHdlIGNhbid0IHNlZSB0aGUgcGh5c2ljYWwgZGV2aWNlcy4gSW4gb3VyIHVzZSANCmNhc2Uo
dmlydGlvIGlHUFUgKyBwYXNzdGhyb3VnaCBkR1BVKSwgSSBjYW4gb25seSBzZWUgcGFzc2VkIHRo
cm91Z2ggDQpkZXZpY2VzIGFuZCB2aXJ0dWFsIGRldmljZXMgd2l0aCB2aXJ0dWFsIEJERiBhbmQg
YSBidW5jaCBvZiB2aXJ0dWFsIGJyaWRnZXMuDQoNClNvIGNhbGxpbmcgcGNpX3AycGRtYV9kaXN0
YW5jZSgpIGxpa2UgYmFyZW1ldGFsIGRvZXMgdG8gZ2V0IA0KcDJwX2RtYV9kaXN0YW5jZSBpbnNp
ZGUgdGhlIFZNIGlzIG1lYW5pbmdsZXNzLiBXZSBoYXZlIHRvIGZpbmQgd2F5IHRvIA0KZ2V0IHRo
ZSByZWFsIHBoeXNpY2FsIHAycF9kbWFfZGlzdGFuY2UgZnJvbSBob3N0IHNpZGUuDQoNCk15IGRl
c2lnbiBpcyB0byBzZW5kIGEgY29tbWFuZCBmcm9tIGd1ZXN0IHRvIGhvc3QgdG8gcGFzcyB0aGUg
dmlydHVhbCANCkJERiBvZiBndWVzdCBkZXZpY2VzIGFuZCBnZXQgcmVhbCBwaHlzaWNhbCBkaXN0
YW5jZSBmcm9tIGhvc3Qgc2lkZSBhbmQgDQpyZXR1cm4gdGhlIGRpc3RhbmNlIHRvIGd1ZXN0IHNp
ZGUuDQoNCj4gDQo+IEl0IGlzIHRydWUgdGhhdCBtYW55IGh5cGVydmlzb3IgdmVuZG9ycyBoYXZl
IGEgcHJlZmVyZW5jZSB0byB1dGlsaXppbmcgbmF0aXZlDQo+IGludGVyZmFjZXMsIHNpbmNlIHRo
aXMgcmVkdWNlcyB0aGUgYW1vdW50IG9mIGd1ZXN0IGNvZGUgdG8gbWFpbnRhaW4uDQo+IFJlbWVt
YmVyLCB0aGF0IGd1ZXN0IGNvZGUgaGFzIHRvIGJlIGltcGxlbWVudGVkIGZvciBldmVyeSBPUy4N
Cj4gRnVydGhlciwgZHVwbGljYXRpbmcgZS5nLiBBQ1BJIGluZm9ybWF0aW9uIGF0IHRoZSBkZXZp
Y2UgbGV2ZWwNCj4gbWVhbnMgdGhhdCBiYXJlbWV0YWwgYW5kIFZNIGd1ZXN0IGJlaGF2aW91ciB1
c2UgZGlmZmVyZW50IGRyaXZlcnMsDQo+IHdoaWNoIGluY3JlYXNlcyBzdXBwb3J0IGFuZCB0ZXN0
aW5nIGxvYWQuDQo+IA0KPiBJIGFsc28gbm90ZSB0aGF0IHRoZSBhZG1pbiBjb21tYW5kIGluZnJh
c3RydWN0dXJlIHdhcyBkZXNpZ25lZCB3aXRoDQo+IHVzZS1jYXNlcyB3aGVyZSBvbmUgZGV2aWNl
IGRlc2NyaWJlcyBvdGhlciBkZXZpY2VzLiA+DQo+IEhhdmluZyBzYWlkIGFsbCB0aGF0LCBpdCdz
IG5vdCBhIHJlbGlnaW91cyBhcmd1bWVudCwgYW5kIG1pZ2h0IGJlIHJlYXNvbmFibGUNCj4gZS5n
LiBpZiB0aGUgaW5mcmFzdHJ1Y3R1cmUgaXMgcmV1c2FibGUgdG8gYWRkcmVzcyBhIGxvdCBvZiBv
dGhlcg0KPiBwcm9ibGVtcy4NCg0KSSB0aGluayBjb21tYW5kIHF1ZXVlIGlzIGFsc28gZGVzaWdu
ZWQgYXMgYSBjb21tb24gaW5mcmFzdHJ1Y3R1cmUgdG8gDQpoYW5kbGUgY29tbWFuZHMgZnJvbSBn
dWVzdC4gQW5kIG5vIG1hdHRlciBob3cgSSBzZW5kIHRoZSBjb21tYW5kIHRvIGdldCANCnRoZSBk
aXN0YW5jZSwgdGhlIG1haW4gcHVycG9zZSBpcyB0byBnZXQgdGhlIGRpc3RhbmNlIGZyb20gaG9z
dCByaWdodD8gDQpUaGVuIEkgYWx3YXlzIG5lZWQgdG8gYWRkIGEgc3RydWN0IGluIHNwZWMgdG8g
cGFzcyBCREYgb2YgdHdvIGRldmljZXMgDQphbmQgdGhlbiBjYWxsIHBjaV9wMnBkbWFfZGlzdGFu
Y2UgaW4gaG9zdCB0byBnZXQgZGlzdGFuY2UuIEkgZG9uJ3QgDQp1bmRlcnN0YW5kIHdoYXQga2lu
ZCBvZiBjaGFuZ2Ugc2hvdWxkIEkgZG8gZm9yIHRoaXMgcGF0Y2guIENhbiB5b3UgDQpleHBsYWlu
IG1vcmUgZGV0YWlscz8NCg0KPiANCj4gR2VuZXJhbGx5LCBvbmUgd2F5IHRvIG1vdmUgdGhpbmdz
IGZvcndhcmQgd291bGQgYmUgdG8gc2hvdyBhbiBleGFtcGxlOg0KPiAtIGEgYmFyZW1ldGFsIGlu
c3RhbmNlIHdoaWNoIGhhcyB0aGUgaXNzdWUNCj4gLSBob3cgaXMgdGhlIGRpc3RhbmNlIGRpc2Nv
dmVyZWQgb24gYmFyZW1ldGFsDQo+IC0gaG93IHdvdWxkIGEgbWluaW1hbCBlbXVsYXRpb24gb2Yg
YmFyZW1ldGFsIGxvb2sgbGlrZQ0KPiAtIHdoeSBpcyB0aGlzIGhhcmQNCg0KLSBhbWRncHUgY2Fs
bCBwY2lfcDJwZG1hX2Rpc3RhbmNlIGJlZm9yZSBpbXBvcnQ6DQogICBhbWRncHVfZG1hX2J1Zl9h
dHRhY2gNCiAgICAgICAtPnBjaV9wMnBkbWFfZGlzdGFuY2UNCg0KLSBsaW51eC9kcml2ZXJzL3Bj
aS9wMnBkbWEuYyBmaWxlIGV4cGxhaW4gaG93IHRvIGNhbGN1bGF0ZSB0aGUgZGlzdGFuY2U6DQov
Kg0KWy4uLl0NCiAgKiBJZiB0aGUgdHdvIGRldmljZXMgYXJlIHRoZSBzYW1lIFBDSSBmdW5jdGlv
biwgcmV0dXJuDQogICogUENJX1AyUERNQV9NQVBfQlVTX0FERFIgYW5kIGEgZGlzdGFuY2Ugb2Yg
MC4NCiAgKg0KICAqIElmIHRoZXkgYXJlIHR3byBmdW5jdGlvbnMgb2YgdGhlIHNhbWUgZGV2aWNl
LCByZXR1cm4NCiAgKiBQQ0lfUDJQRE1BX01BUF9CVVNfQUREUiBhbmQgYSBkaXN0YW5jZSBvZiAy
IChvbmUgaG9wIHVwIHRvIHRoZSBicmlkZ2UsDQogICogdGhlbiBvbmUgaG9wIGJhY2sgZG93biB0
byBhbm90aGVyIGZ1bmN0aW9uIG9mIHRoZSBzYW1lIGRldmljZSkuDQogICoNCiAgKiBJbiB0aGUg
Y2FzZSB3aGVyZSB0d28gZGV2aWNlcyBhcmUgY29ubmVjdGVkIHRvIHRoZSBzYW1lIFBDSWUgc3dp
dGNoLA0KICAqIHJldHVybiBhIGRpc3RhbmNlIG9mIDQuIFRoaXMgY29ycmVzcG9uZHMgdG8gdGhl
IGZvbGxvd2luZyBQQ0kgdHJlZToNCiAgKg0KICAqICAgICAtKyAgUm9vdCBQb3J0DQogICogICAg
ICBcKyBTd2l0Y2ggVXBzdHJlYW0gUG9ydA0KICAqICAgICAgICstKyBTd2l0Y2ggRG93bnN0cmVh
bSBQb3J0IDANCiAgKiAgICAgICArIFwtIERldmljZSBBDQogICogICAgICAgXC0rIFN3aXRjaCBE
b3duc3RyZWFtIFBvcnQgMQ0KICAqICAgICAgICAgXC0gRGV2aWNlIEINCiAgKg0KICAqIFRoZSBk
aXN0YW5jZSBpcyA0IGJlY2F1c2Ugd2UgdHJhdmVyc2UgZnJvbSBEZXZpY2UgQSB0byBEb3duc3Ry
ZWFtIFBvcnQgMA0KICAqIHRvIHRoZSBjb21tb24gU3dpdGNoIFVwc3RyZWFtIFBvcnQsIGJhY2sg
ZG93biB0byBEb3duc3RyZWFtIFBvcnQgMSBhbmQNCiAgKiB0aGVuIHRvIERldmljZSBCLiBUaGUg
bWFwcGluZyB0eXBlIHJldHVybmVkIGRlcGVuZHMgb24gdGhlIEFDUw0KICAqIHJlZGlyZWN0aW9u
IHNldHRpbmcgb2YgdGhlIHBvcnRzIGFsb25nIHRoZSBwYXRoLg0KWy4uLl0NCiAgKi8NCg0KVGhh
bmtzLA0KSnVsaWENCj4gDQo+IA0KPiBIb3BlIHRoaXMgaGVscHMsDQoNCg==
