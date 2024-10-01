Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A558819C572
	for <virtio-comment@lists.linux.dev>; Tue,  1 Oct 2024 08:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727771952; cv=fail; b=VN+hg3O9zpbicasxc3kG28klxk9V4XHJkeAEkgPGIZftxpXi9JLu6JMZ+/GWCzZqWpTkXyU1IwVdobvfwC9s3peN6p+YuXPkJNC8eLQuNnd9mpNpZoP5l4F/+jSgrxLGeDqpojzyZq2gGeq13zWXaGX0T8qFU4Q4MFY2oF/5MAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727771952; c=relaxed/simple;
	bh=u1jn/VFJlDAZ1FvKwKqrhYaM49mXxejA83r9FmqFrKg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=P9MkC5M5RE0ECjHgMfXdKgI27ZU1qI8yKtmHnDraF5+u0DOpUH6TMP28h/e4B2VsFZq8PkD9zKUMJA0LhuITh94tWJZvzauRPgke7xZstLKsxM7S9DsLI809aFfWaGxBfCXkvwysyg0ebhwS6HleS/DCsWL/x5jR0ETZsJ6VXiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FhRlUOUm; arc=fail smtp.client-ip=40.107.94.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FhRlUOUm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWpS5VQActx/w0MOlNM8W0q+//jdPuAmBVXNWEX3k7h5Nq/8AgwiCykQ0s9tOREEbifypr3evQKxmR8CKw3FHU6AH2aUzcTLWliXRxsJDpgUdKkErtd3YPbapmi8gbx9verXkYY2bY1C8OUv3OAp3QN6aaBX5bGDOGvbF069SM6xxucKvFl3CTfN2WwJDmK8Krgb57ZwzehrOrITjHiMLXh0E70LlF1p3yIEF6bsB7eVyzjo4jNOVR8tP0FbQusjfudBSscN4fqMxLxIVk1fgo/w7p7sPo1Hl7EJjk0yr/E80jzq4v3kzb434PgiRJ1iJnMVQ0kh1rTSm65aT+pgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1jn/VFJlDAZ1FvKwKqrhYaM49mXxejA83r9FmqFrKg=;
 b=Ewbsvj+oYL7nSyZ/eeFnywZ2jMi5waZtWzD1K7acM4lyozsNnmAZqDug0wKjvcm1j6kv1reBNNpzYzhUzOGdrOnqhvhyFi5MVopVPOmsou/G3en1XiL9sdXtuIWJnLy+Rhi7rLgtOuIzqNDMlZwhrPwf+JHu9beIK5G+nLzED0INxPFqWu8hOTFVAqRxAKmun/AFngjoAG0k3zK7tJhnLRuLuAFPcP9w4I34NvaHdzzfscZuVSL+lCG3cqI9lzHJ+JNJPTJW2zOBV49jEn4BoZMdSV95gP7LdX/YI9lbGPl/hbU5ZVXTeod/iAVwCKfoYBci0Qxj2yr4cHIgx/6JfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1jn/VFJlDAZ1FvKwKqrhYaM49mXxejA83r9FmqFrKg=;
 b=FhRlUOUmqpJuI8D3zH5DS/x1Rhy8A68d4TbnOj6LlzV2Ena0nvemKdbRTOtnRln141WCLvDhBKNH5cY6EcLlf1a4kh0zN9haIKUUXHouUHproydosqykkvjuvoP7EDz3T5LC072qXQ4o57pA39ZO4/O5eXNOijwxseGAMV/y69dUs80OMmG0ptrswwQ/XDIhMa1OfVDgPuyWvsTuzdf/5WcwDVustdrXyJfRMheFizd0EOzRBqeWAFe2hVS6vLBJx6MvDtqL8zjtF5ETdQI2aTz14MqC+OyGcbrDKjf7Eh2Hwe4nzAgZMgvCJn91+lMRAj0YG+R4cn3xWtD/9rn3Mw==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by SN7PR12MB7854.namprd12.prod.outlook.com (2603:10b6:806:32b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 08:39:07 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 08:39:07 +0000
From: Parav Pandit <parav@nvidia.com>
To: Parav Pandit <parav@nvidia.com>, Albert Esteve <aesteve@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"aiswarya.cyriac@opensynergy.com" <aiswarya.cyriac@opensynergy.com>
CC: "acourbot@chromium.org" <acourbot@chromium.org>
Subject: RE: [PATCH v3] content: Reserve ID for media device
Thread-Topic: [PATCH v3] content: Reserve ID for media device
Thread-Index: AQHbACulN7OJ8hVWBUuunhxN0rzrwbJoLecAgAmAf7CAAAvJUA==
Date: Tue, 1 Oct 2024 08:39:07 +0000
Message-ID:
 <IA0PR12MB87130D5F5839629436E0A748DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240906070833.1949727-1-aesteve@redhat.com>
 <CADSE00KO=VZy4_4FfgC7ODON32mZ8khWkPUcXheP6pTiEZAyHA@mail.gmail.com>
 <IA0PR12MB8713CC178EDB984292755C5DDC772@IA0PR12MB8713.namprd12.prod.outlook.com>
In-Reply-To:
 <IA0PR12MB8713CC178EDB984292755C5DDC772@IA0PR12MB8713.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|SN7PR12MB7854:EE_
x-ms-office365-filtering-correlation-id: a2960fac-b7d0-477a-bbe1-08dce1f4837c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aWFValhRekZuM0l0cGMybGN4RjdRamk2Q0V0UTd0Qzd3ZTV5N243a0J3QnU3?=
 =?utf-8?B?TUp3bmNHSGpKNWoxUWZYN21XUzIxNDJCYlNwZ1FPa0orWjZOSUh2TkJ3cVBp?=
 =?utf-8?B?OWlVcVlPbUMyL3o2alFxeHJjWTJ3bU9tSzMreWlaV0pwRmtRa2NnZFVMT2xU?=
 =?utf-8?B?YitYUkxKSGVoc2E5L0V3Nnk2Mm1oOWlpQzIxWndLOUkvRFZqTEpqakdNcXI4?=
 =?utf-8?B?SjB2NUtIQndBNHVCTzc2N01qeXYrbzZtL3hxVkFLUXJVOGNNUndIVW1GZ2th?=
 =?utf-8?B?T3FVNUJFMkNnY1d1eDYwOTE1Nm9OOHA2MHF1NXEwaGE4eFhZRk4vQmFUajFB?=
 =?utf-8?B?TWxIYndJZDI2cktmUGdpSzdmMm5BOEtEK0J0UGhGdmxEOGtBTkNnRzI2SnhS?=
 =?utf-8?B?ZXptRVVsb2ZoNFp3UklnSkJNRVZsSEhmM2Ezd1NvNy9rY2RzSU9OTi8zZGQv?=
 =?utf-8?B?UGRPUzBHSnRwcUxoRUtjNkQ1WGN4NzlIY250S2I3cmUvVUJBVzlBdGUxYW9I?=
 =?utf-8?B?Z0VUR2tPdXlOZmt0TVQwaWF2WngvSno4MU54U0MwWDk4Y1U1YlNuSS9BcGhi?=
 =?utf-8?B?TnFZL2Q2VHF0LzU2TXIzZk9XWTZLOUNtTU9FRStJOU8vNTNzQ25VZU9tSVBm?=
 =?utf-8?B?ZGRXRFUzMXoyZHQ0b09FVmRaclV5b3BGQzBGMFdMY0luV0o0TUp4Qk4rMldQ?=
 =?utf-8?B?Z1dic3pyUnUwK0k0RkJmTEMxdm1Kcmw0QnMxbndhN0EzM0F6L3FKcktveWpm?=
 =?utf-8?B?VXhpdTgvTjNkaXZ3Z3JPb1ozKzJna2JORkwvSnpWWHpCM01WRzdSOW9NSml2?=
 =?utf-8?B?VXh3SGkxODA2TTRTbmlQYkQ0YkxIdXhxcTh0V216dFlFa0dDQUI2Y0VXZzVp?=
 =?utf-8?B?d0lJQnhwTUFKTkdSSHE5RnN2bGdMOW41YXBVMzBYN0g5Y0NPWE9zcytmRDd0?=
 =?utf-8?B?ektUcTJ2RFJvNkFiQ3FXYW43VUsyK21FUGlncEd2Tkw4TmNkelI5cmJqTWhk?=
 =?utf-8?B?eGdEQkZZQmFjRk12NThnaXF5NnpDNEUxK2pBRGdNN29STmMyR296b1JaL0FW?=
 =?utf-8?B?ckxkQTYxSW1NM3ZIb0NySVViMzBkUHBXRFBoYmlnclpqNTVyNzJuNkpMSEZH?=
 =?utf-8?B?Mno5VEFWWGw5ZERiWnVHc05sb3ZQTjUrdlYzZDN0RWNpSUtUY0JIdVkrUGJj?=
 =?utf-8?B?NWRxdmNwejJFZGlOa0JiUlpnVkh5MlByNUF6aHdrb1JWbU1VOHc1MCsrTktR?=
 =?utf-8?B?Yjl6MGJpSkdUYTJEaUJBVlF0N3RFZ2E2VHl2ZlRmY0UzRFdlTGM2ZVRjNzdi?=
 =?utf-8?B?YXRIMitZajV0UUp3QkRhU2N0UTRwd0xSSnhBamFVOG1ScW50aHFPOXpnRnZv?=
 =?utf-8?B?VTJkeUZ6bUJyRUdzNkhlNFlCQnBrMWQ2eDNOTmJpQ25WMlZIMFFoQmI0bGV6?=
 =?utf-8?B?L3FzTVpJZzQxQnV3VXVmeGpaRkVtWE5zc2R1SXZIWWg4alV0YklVeEZ5MDd1?=
 =?utf-8?B?Um0zNG4vRGg3T3MvTi9xL1hCcVcyMUhVbDZsWHpjd01LbUtVcWFpTjlRa0Vm?=
 =?utf-8?B?M3JDYTlMNGZPQWE3eWFJdXNjTDZpKzBNRkxkY1lycjBUbXMySklLclo3SWpu?=
 =?utf-8?B?cTdTdUVza21mb2RRdlNFOXJra1ptRlVSd0VqRzZ0Zk11bGZPa29TN3RZdENZ?=
 =?utf-8?B?MFNHdnIyYmduV3BJY2ZoalhSamZ5TndKV0NaUkM1YzUvQjAraDhYWXl6SVJQ?=
 =?utf-8?B?YXphWDNCREppd3RxNk1RV3lqZ3FNT2o0Q2FGT1Uyb3dRTWpSaU5FejVYSU5U?=
 =?utf-8?B?dU5JNGNhZ2o4bmNwelVLOHRKMDRPVEI2MzQ2TGZZaVVSdkxJWlpudithUHBF?=
 =?utf-8?B?T043NHBoaFJJUzZONWZDajh3NlNvVnM2YisyY2duNE8vd2c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MkJSc3FZSjZaRjE4TEJTbmhZaDNhMHpkSHl3bTZoYUE1L2FTMDB0Z29hR3Fh?=
 =?utf-8?B?aHhLbFcyR2ZnV09HOVlLV1lVMi9TZHRUWnRLNFBWLzAvUnMrNzhKb0ZDQWti?=
 =?utf-8?B?QVRSMlRQVVYxOUt6a0haUStoem96d2hXUXdIY1FqaWcrWDA2S09aZlhrYTBw?=
 =?utf-8?B?c2NKK1JGMkFWZUlPNVRNSm0wNmd6a0U2aFlEQy9YcGJqSVltVklIcE1kelc1?=
 =?utf-8?B?dXZDYm53Qks1dTkxQnAvcHFvYTBrdSszdng2T3FjQk1SU2syQ0J3THM1RGZK?=
 =?utf-8?B?aW9Xc0hTdVhGdDc2R0NrRlZjK0ZDSWs2a0t5NmZ1WFdveVNYaGxEYjRpSVdm?=
 =?utf-8?B?WlpWWlNEbVBQWmoxY2xwY0l3cUZFcE9DNktLNitCMTduLzk4M2QydnYrakRu?=
 =?utf-8?B?SHFjejRXMHVubXdTSTRmRWpDbHhNeVR4UjlleWlNV05qK2I1OE9xK0o2VXNn?=
 =?utf-8?B?NExTS2dIVDB6ekpKK1U4MnFOYjlFenBNOXdUMEdpY0N3TTkya2F1TWF4UlNp?=
 =?utf-8?B?Y1llSm5FbEZocUtibklqMnU1MVhOYzM4NUc5VDl4VHkwV0pSUFBqd1oxUVVV?=
 =?utf-8?B?VExQcTNIak5WdFBKS0RuY0ZPeVdEZXNGUlE5NDFKaS8vYUFYM1NZRHp1Nkw5?=
 =?utf-8?B?Mi8rN0RURnhacGhsZTNodHhFKzJwUS94M2FzVWUwTnh3c01FVk8zTUdMMXZI?=
 =?utf-8?B?WEtCOGljRGNQRXZXYjFBb1pvbjFlK0RtZ3IvV2l1TDJXaGlpT29FZ3FHbWFx?=
 =?utf-8?B?a3RZQ0wxcUtoWlZyS0lEMHlXNkhDd1dnNnpmMnJzbEMrb0lsTHZnYzRpeEIr?=
 =?utf-8?B?TVJXZXVhaUhpcUh4RW8zVFUzZnhaelBiK0Jud1BRQ3E5bGpNclZnWitCbG5F?=
 =?utf-8?B?Skt6ck0wN3kvczdweE1BaXpTejdDYjJaUU9FRDNKTm9KUzdIdS9tKy9ibzBI?=
 =?utf-8?B?cmJJeE5OeGp5RTROai85Y2pKa0F3azkvcjlhb0dNV1A0Zlg0VkZOTE4xRUVs?=
 =?utf-8?B?L2NtNURqYTRYdGgva1J0dFA0eUJtcUpaekJkdXRrWGpTamFuUGF4eEJRQktD?=
 =?utf-8?B?RnVjWEI1WW9NcFdyTmNEY2wxQU9lVkVHRHdpdDZhei9aMmJwTEl5eHpGbzU1?=
 =?utf-8?B?aVBpVFdyMHdYcy94WkRVeXBONjl5UHI5ZzM1SjZwN0tOaXdrbEt5MStQTlFS?=
 =?utf-8?B?dkhaWHVyeUowaG1keVhUMFV2YTlnL1RrL3dSOWxNUHFHRkJuTjNUbDRteTFm?=
 =?utf-8?B?N21vdXFwNDA3b1VINWpaM3Fmc21QR1BUTktXTEw5ZTB0bDUrc0RBL0FFZ2hk?=
 =?utf-8?B?WTZyRHBsL29jeFRnemU3K3BOQ3Qyc01FMHArSUFyOWFWbE1RL0twdnlPTVNK?=
 =?utf-8?B?ZlROY2psNkFqTlg1Y3UvWTByVHJYaCtDVmkvUnMwS1FHdUxzTm54Y3pETXRX?=
 =?utf-8?B?NmRhOGhpT0Fnd2JiYWdaTEdBRVJhN1ZNdGUwelF4RDVhYzAybmcyTkFiNTV5?=
 =?utf-8?B?dFJSTUtSWWJLVk00UEZ4eFpGeVJYYkhXcjRReGtJZXJiU252T3hGNDNLMjN2?=
 =?utf-8?B?YnpGSCt2M3YrRnUrL1lMRDJxek0wKzFyZ3pVenoxUDlMSkhEUThER3ZHd2kz?=
 =?utf-8?B?Z1QyT3p0UWFSQ3hjQ0orREV5NXFsQnhPL1IxRTQrWWZUSXZlRGdxWE43Nk45?=
 =?utf-8?B?NVMvRXhpcWpqNTZtTTRxS3g5TVA5blJacEhkc3ViTDZZdDNpZjhXaFlyQ3lw?=
 =?utf-8?B?MHp2ckFHcjFoVTRrQ3VMTE5WSHBmNnlBd3lZRmFwWnBsZHdUMUo2MzFOU1dH?=
 =?utf-8?B?T1d3Y2JXbzN0SVJKbC9jVWNxSXZIQVprbWVMTmxrT0c5bEc1VW1UVUZpWDRz?=
 =?utf-8?B?QmgxNW90WitNejBOdXErdE85OXAyMGppSHl6L0lBQ0tHVHdEVG5nMjM2Rlc0?=
 =?utf-8?B?djI0V2FQSURPdGZEN3cwakViY0dvOWNkNVdYMGt5eDVKVDhGVG5TdTdDSUc1?=
 =?utf-8?B?L3Ivc2NwL241N3dSWHpjSWRBdkx2L3dIYXBOQzBlNTJLS1VRWmF1Z1VPa0li?=
 =?utf-8?B?MmMraWdDcUNTL1ZRcmhaRFp3ZkR3K0lYOS8zSXJqS01IYm9NN1UrNlVyTjRh?=
 =?utf-8?Q?J1+M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8713.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2960fac-b7d0-477a-bbe1-08dce1f4837c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2024 08:39:07.3973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LFr4uf91shFzaga5b7u9fWc2Siy++sdTcnEdjI/ZThiaxKZfDoB65tyCzJ1BvuqnXdZq+CO6ty4AFCMyn9Bd9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7854

DQoNCj4gRnJvbTogUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPg0KPiBTZW50OiBUdWVz
ZGF5LCBPY3RvYmVyIDEsIDIwMjQgMTozNSBQTQ0KPiBUbzogQWxiZXJ0IEVzdGV2ZSA8YWVzdGV2
ZUByZWRoYXQuY29tPjsgdmlydGlvLWNvbW1lbnRAbGlzdHMubGludXguZGV2Ow0KPiBhaXN3YXJ5
YS5jeXJpYWNAb3BlbnN5bmVyZ3kuY29tDQo+IENjOiBhY291cmJvdEBjaHJvbWl1bS5vcmcNCj4g
U3ViamVjdDogUkU6IFtQQVRDSCB2M10gY29udGVudDogUmVzZXJ2ZSBJRCBmb3IgbWVkaWEgZGV2
aWNlDQo+IA0KPiBIaSBBbGJlcnQsDQo+IA0KPiBGcm9tOiBBbGJlcnQgRXN0ZXZlIDxhZXN0ZXZl
QHJlZGhhdC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDI1LCAyMDI0IDEyOjIw
IFBNDQo+IA0KPiANCj4gT24gRnJpLCBTZXAgNiwgMjAyNCBhdCA5OjA44oCvQU0gQWxiZXJ0IEVz
dGV2ZSA8bWFpbHRvOmFlc3RldmVAcmVkaGF0LmNvbT4NCj4gd3JvdGU6DQo+IFJlc2VydmUgZGV2
aWNlIElEIDQ5IGZvciBtZWRpYSBkZXZpY2UuDQo+IENvbXBhdGlibGUgd2l0aCB2aWRlbyBlbmNv
ZGVyLCB2aWRlbyBkZWNvZGVyLA0KPiBhbmQgY2FwdHVyZSBkZXZpY2VzLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogQWxiZXJ0IEVzdGV2ZSA8bWFpbHRvOmFlc3RldmVAcmVkaGF0LmNvbT4NCj4gLS0t
DQo+IMKgY29udGVudC50ZXggfCAyICsrDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2NvbnRlbnQudGV4IGIvY29udGVudC50ZXgNCj4gaW5k
ZXggMGE2MmRjZS4uNmQ2YjNkOCAxMDA2NDQNCj4gLS0tIGEvY29udGVudC50ZXgNCj4gKysrIGIv
Y29udGVudC50ZXgNCj4gQEAgLTczOSw2ICs3MzksOCBAQCBcY2hhcHRlcntEZXZpY2UgVHlwZXN9
XGxhYmVse3NlYzpEZXZpY2UgVHlwZXN9DQo+IMKgXGhsaW5lDQo+IMKgNDXCoCDCoCDCoCDCoCDC
oCbCoCDCoFNQSSBtYXN0ZXIgXFwNCj4gwqBcaGxpbmUNCj4gKzQ5wqAgwqAgwqAgwqAgwqAmwqAg
wqBNZWRpYSBkZXZpY2UgXFwNCj4gK1xobGluZQ0KPiDCoFxlbmR7dGFidWxhcn0NCj4gDQo+IFRo
ZSBpZCA0OCByZXF1ZXN0IHdhcyBtYWRlIHNldmVyYWwgbW9udGhzIGFnbyBpbiBNYXktMjQgZm9y
IHVzYiwgbm8gZnVydGhlcg0KPiBpbnRlcmVzdCBoYXMgYmVlbiBzaG93biBvbiBpdC4NCj4gQmV0
dGVyIHRvIGF2b2lkIGhvbGVzIGluIHRoZSBkZXZpY2UgaWQgYXNzaWdubWVudC4NCj4gU28gaWQg
NDggd291bGQgYmUgYmV0dGVyIHRvIHVzZSBmb3IgbWVkaWEgdGhhdCBoYXMgaW50ZXJlc3QuDQo+
IEFkZGVkIHZpcnRpby11c2IgcHJvcG9zZXIgdG8gdGhyZWFkIHRvIHNlZSBpZiBpdCBpcyBzdGls
bCBpbnRlcmVzdGluZywgaW4gdGhhdCBjYXNlDQo+IDQ5IHNlZW1zIGdvb2QgaGVyZS4NCj4gDQo+
IEdpdmVuIHRoZSB2b3RpbmcgaGFzIHN0YXJ0ZWQsIEkgYW0gbm90IHN1cmUgaWYgdGhlIHJlYWwg
aWQgdmFsdWUgbWF0dGVycyBhcyBsb25nDQo+IGFzIG9uZSBvZiB0aGUgdW5pcXVlIGlkIGlzIHJl
c2VydmVkLg0KPiANCj4gQW5kIGRvIG5vdCBwcmVmZXIgdG8gcmVzdGFydCB0aGUgdm90aW5nIGZv
ciBzdWNoIGEgc21hbGwgY2hhbmdlIGVpdGhlciBvbiBteQ0KPiBsYXRlIG9ic2VydmF0aW9uIG9m
IHRoaXMgaG9sZS4NCj4gDQo+IEkgdGhpbmsgd2hlbiB0aGUgbWFpbnRhaW5lciBtZXJnZXMgdGhl
IHByb3Bvc2VkIHBhdGNoIHRvIGFzc2lnbiBpZCA0OCwNCj4gc2hvdWxkIGJlIGZpbmUuDQo+IA0K
PiBNaWNoYWVsLA0KPiBBcmUgeW91IG9rIHRoaXMgd2F5PyBPciB5b3UgaGF2ZSBiZXR0ZXIgc3Vn
Z2VzdGlvbj8NCj4gDQo+IEFpc2h3YXJ5YSwNCj4gSXMgdmlydGlvLXVzYiBzdGlsbCBpbnRlcmVz
dGluZz8gSWYgc28sIGNhbiB5b3UgcGxlYXNlIHJlcXVlc3QgZm9yIHRoZSB2b3RlPyBTbyB0aGF0
DQo+IHdlIGF2b2lkIHRoZSBob2xlIGluIGRldmljZSBpZCBhc3NpZ25tZW50Lg0KSSByZWNlaXZl
ZCBhdXRvIHJlcGx5IGZyb20gQWlzaHdhcnlhJ3MgZW1wbG95ZXIgdGhhdCB0aGV5IGFyZSBub3Qg
cmVhY2hhYmxlIGR1ZSB0byBhY3F1aXNpdGlvbi4NClNvIG5vdCBzdXJlIGlmIHZpcnRpby11c2Ig
YW5kIDQ4IGlzIHN0aWxsIHJlbGV2YW50Lg0K
