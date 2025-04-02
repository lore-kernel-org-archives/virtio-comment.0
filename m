Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1589AFC08
	for <virtio-comment@lists.linux.dev>; Wed,  2 Apr 2025 08:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743584078; cv=fail; b=VclsOH12ArMeNz7PNrzKzhW/mfRmrySNyhQBcsL7tdYfcd54BV1htDZznhzDwJxn3vwEc/XpuI/TAfsl3L5UMXlviXpO6dRIw6bCEH6BYHNHfNroffhu6q8PmxKYISMh1bacjvqGerHTONOMJFOdalVJmA9T4hwxgbZE11Bjhas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743584078; c=relaxed/simple;
	bh=lSwqye1huuwF+RQDJoqqtlVmWCP+kakJ++KZVoTB77Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BvgiKrfVVAykZ7HZZZBpl2hTRJQfkkeftWQMvndXerRHUs71N7Ua1liVYlKKaO02q2telFGa0oUWp9J7EFBedR5fXq7nVb4MncPUxiy1kr07V/X5Y8vdM4SJDzi5o1i01QseObaJ0wnJqHELUWX1YvVNc5vNQpQnIKQiDH/ryQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Rpjk+sFM; arc=fail smtp.client-ip=40.107.92.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rpjk+sFM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OflzBvUxxfQOEiPGlbsy6VupENAU1dGG52z8V9ChHc0stzq/oF2teOMfRlFhj4ChbTjdVlZEiXMb98MKAwMJFDQjfoXEeb4acsSZhMOlSQVs3Kkd4c14IVlTTKEFYDVEgakzKqdKbSeADis+IA+bjtVA5mrhHXLAuqGdEjnJicvUbmnWdjIi0LhBu8TuA8khQL6xKDn2fj7rgq4mk+BNcfO1s6HlKrslzEYw8P7d2d5cJKNroovbSK0lnhRsND+hv4HRCvdQ9M9YkRCZ7fHm0iOjStsTnNjSpPltBmeyg/65Ch90abrwRftSpnD6An0qr6JhV49iqavPBEmTTZWg9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSwqye1huuwF+RQDJoqqtlVmWCP+kakJ++KZVoTB77Y=;
 b=q9XlESvXJg2A6OTSAlK6CpE4INUetWMW3bCLmF2+uDzxwoQJcJmrZedxP9ZZgVRrEhTosd406MNAroU7XBQQD/gNwEra4gYnQ2NBCNTpVUuSq9dV0iEYsNuHP72qXqwsNsBSkclHJJZcCZH2Ysc+61p+yYf5XIaEiFyHqIXgmYDvcj+MkS0HYRihFPkPoEQT664X7NkHNeY5Jm9iia+0wMdu+kLlgA3/kHO3vFxakAVHj4YTIstZWsbm5rAbF5TeXRdiJdb/ZyvN1jVlTIF85/ZzS8JIYuzN3icAWZ0tsxzlpmcAWOaG32vvn5st/iO5eVE3KTJqBhv3oJRe8AaGBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSwqye1huuwF+RQDJoqqtlVmWCP+kakJ++KZVoTB77Y=;
 b=Rpjk+sFM+Bf0GWmRt4uIZ6xqu4BguPMqwu+cj1rweyg/2J7S6nwvgaFa/xRTsXMJPKbChxctTK2J+txuhtViuzWiGk8wcojI3o5/zklNaf4Ca2OaIHdnXvqBnYkj2CiZL22z8toi/EIEDvJiTu+P82fMQ2pQomwdJL4XdfPkFyQKiE7N3YyzqNDb417Ic49MCHqrDvOeRbAzJCpzzQ9Q5QbYo6lpmwhjQUUBTD/jjTlJimq2lcwnOIVa//KtfPg04VciL5oAdA3EmmFz8/dgKqotuXAtQNREKsdlVKyvwMHhuobsPRPT2S7rBCLZkQ1V9JaSUxmuSx1fzj7iENkWUQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS7PR12MB6336.namprd12.prod.outlook.com (2603:10b6:8:93::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.46; Wed, 2 Apr 2025 08:54:21 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 08:54:20 +0000
From: Parav Pandit <parav@nvidia.com>
To: Sergio Lopez <slp@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "dmitry.osipenko@collabora.com"
	<dmitry.osipenko@collabora.com>
Subject: RE: [PATCH v3 0/3] shared-mem: introduce page alignment restrictions
Thread-Topic: [PATCH v3 0/3] shared-mem: introduce page alignment restrictions
Thread-Index: AQHbovlVGtD020GCykyvnWr6inKTN7OQEU8A
Date: Wed, 2 Apr 2025 08:54:20 +0000
Message-ID:
 <CY8PR12MB7195B5E575099CD9CA1F2F39DCAF2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250331213711.63398-1-slp@redhat.com>
In-Reply-To: <20250331213711.63398-1-slp@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS7PR12MB6336:EE_
x-ms-office365-filtering-correlation-id: 5e75e10b-3c5d-40f0-7360-08dd71c3f597
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z0JvcXdHRTJVVDBLZWc3SGxHb3J6cHVkTDJMa3NoS0xiSnBvczZ2YXA2SjJh?=
 =?utf-8?B?SUhrUmRqNmJaVTZ6TEVWNUZPQmVUa3VmVWh2S3JnSlZkdkZpc3Bwbi9ha0dV?=
 =?utf-8?B?VTRhRTVDSFFHd2tSUVdSVXpDTS9iLy9FNEtsdGs5R2dTU1BjZUYyeU51Z1d0?=
 =?utf-8?B?SzFCbzliSnZLbXozejg3U1U4MkhULytwZnFlcysyNjM2NXZYTjZ3Y3VMMmtL?=
 =?utf-8?B?R2ozQVUxcXdObDBOVWx0WVIrM1p1YlJBTWI2OUJGMVJEV2pMQlplM09xeEhG?=
 =?utf-8?B?MDZaaWl4ZUs2Y2NZUWZrajd6S3h4UmRJRytKR2ppS25PbG04RFp3NjJPMXVz?=
 =?utf-8?B?aHRCUXI4UCt0L25LVDJ1NEh4WUN2VlVHWVJIWFZLWklrcmE4Y2ZaYnFxK0ZG?=
 =?utf-8?B?V3RhMUM5cTd4VWx4bi9KYk40TG1WN3BiV1QyT1czeTVRRy9YYjVOWFVFTWZF?=
 =?utf-8?B?QTREZHppNmhUMG5VemZESCtXLzRFbVlGUytUcXR2NnBNV0VtNTB1MW5IekVY?=
 =?utf-8?B?SHFiUlNjTmEyMVlmajgvbDh0Z0JUWjFYQkcwM3dWckU5ZFpXV1JqN0tFQ0FE?=
 =?utf-8?B?UE1wMTJKZWlIaDhzYlBKb3JZLzdkU3ZTT0pDdjBTNUltSG4vMFUycm5KOHg4?=
 =?utf-8?B?aW1hTnZEOGVDMHU5VkVVNk1reXdPNWtOcFdhVWlpbUZpbFhkSkNqSXFWbzlq?=
 =?utf-8?B?UmxTM0dSa04vWEk2ZnZFbHNaU1NoeG96TXdudlVBNkJPblVPSlN4MWdCZW5M?=
 =?utf-8?B?d2pzcEJVSXhHVkJla3U1RjdnbWFEc0ZJdXdXcDRXNk90NEpaT1BwQ1Y5MW9o?=
 =?utf-8?B?TzhmVlU2UEhFbVJndG96WThSZDIwSlNQY2owVzJLM2FUendPQzJMMzNSNGNP?=
 =?utf-8?B?WWkxQXhZY0c2b0hnVG5Gb2o1Q2pXMTlWamdhalNQcS9icDJ2N1cyYkF0QUVS?=
 =?utf-8?B?cWFQeDJBVzk4VGFkTU5CUmYxdzA4K3V4UXBHV0EzNmpRWjNNWnJwOEhDVkRE?=
 =?utf-8?B?RjVmaFlrR2xDNTdhUElnMnQ3VGVwcUt3NzFuak0vU0I1WXBSL0w0V05VM0dY?=
 =?utf-8?B?b3JJNUJlVW5WY0RzYnkyN0NDY1U3dHNqa2liZlJKamc1SSt2cG05d3BsdWZj?=
 =?utf-8?B?VENCUzBCY1phazFMN3ZiUVdHcDhmNURIdHFpZmhBWFNXeTFBK01pQUorNCt2?=
 =?utf-8?B?cHhNdEgrUkZPTDV2akhabHY1S0JqSjhMVFQ3QXJhWTA1a0o0MVl3TEErZlpR?=
 =?utf-8?B?b09sSW5NTjBiMTNKWkNWZStCSDcrZi9WOWduTmpUdnhwNkZDMUNvUkpuM3lC?=
 =?utf-8?B?L0FDSmN4QVg2OXlpZXZJQzBsdWx4L0cvakMzYkcxaDUxMTl3NlY1ZGs4UWRX?=
 =?utf-8?B?SVEzOHp2VCt2V1NyUTFOWVZQakt1M3ZBdE1LeHAzRUFWeHo4VmhDMlFVQ0ZB?=
 =?utf-8?B?OGRLNHZ3RWZBVjhockJCKzljdGJ5RDdJZGc1WEFlQnpiMUJGdDlEbkZXR1dW?=
 =?utf-8?B?YTR6bUZFRFlnaWF6ZDFUTXpqNHdyZ2lkUTNUMWFVRnhyb0psZ3RwQ0hZS1pM?=
 =?utf-8?B?R3FTaHNTSlgvcCtHRFB3c2FLVC9lUjNUM2RSNS80Z1NtcCtkQytSNVNBdklo?=
 =?utf-8?B?NDhMTmJ5S1h0KytHWXRzTmEya0puUlppUGNsdFJucHhKN21oZ0hZR0ZobGtE?=
 =?utf-8?B?SEZ3KzhMUk1sQ2hvRVhTcWI4bExyWTRYaGIvS3IrSW5JUlBka3hRcGl6azYw?=
 =?utf-8?B?c3Z3R2ZqOGZkSnc5SUFhdGVPc0RneENnOUxnbC9IaE9neXg2STdVRlFHZEFY?=
 =?utf-8?B?RGlZMlFhMVhFRG1KazhkL0VNUkFsSWxxL1JNU0k1eWtuVG1jazcwK0tUWG1W?=
 =?utf-8?B?cVkvZ1poOHhEdTlNTU1tV1ZVNTJlQlI4NUNEQStrZXUyTzNPVnR6WWVPN0Fr?=
 =?utf-8?Q?l6auQ+asppaeHWakHFlDGm6KAkF8+nw8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RDJ5bHVPNVBNTnNMRUo5UzVwL1FGL3N2K2NhZWZQZXpBaEE3ZTFDR0JxS2dM?=
 =?utf-8?B?b3ZUWjVSOVRoSW1wdTNBdjhTaTFPOHRjSFJacXlqNm1VdWFWdnlET3JRYVk1?=
 =?utf-8?B?M1hCamJqYkpSeDJTa3haZjBQTUJJUDZqbm41U1l5M0YzUEMvVTg4bnBIY3hZ?=
 =?utf-8?B?amViU2FzUnBwbFpMbTVCZlAyMlg5Q1N4M01hSElqVmJNa1RzanVLaEJsTHEx?=
 =?utf-8?B?a0s3Z24zMDZ3UDV1SEo5dnhnUkhoWktkT2hmSHRQQVpHZjVMMVpIZFBva1Vh?=
 =?utf-8?B?OHQ4YlBJZGdQbXZyUERnVmpGK1JIMzFpME4zMVozWldRK2RHK05DaUV5L0xL?=
 =?utf-8?B?MGgzZmhzMzlLUk5vS1BqRlBtQnBWbVZ2aUJaeGxSazk5SWljemNWY3dTMEFn?=
 =?utf-8?B?NTJJd1RZZ09CRTNhWGIxMldFRGVZdUNqUXlaM0d3NWFJUUl3VWx5MkZRbkIv?=
 =?utf-8?B?dU1YeWQxS0lVaXNYUW9jOTdvanJWYzl4YnlRYUk2ajV3R1N5S053Q0ZTc0xY?=
 =?utf-8?B?a2ZaUURQeTZZQnl3Q0g4ajF2WUZSZDJLZXFJOFljSnRYQmd4UDRIWFd5d200?=
 =?utf-8?B?WFpYd1IvMFdRYmRvS3VKQVovejhNWXUrYjlycGZTSmhLek5lY3dJWTlMeTFs?=
 =?utf-8?B?REpqZ0E3YlQ4ZHpDZy9GVHRvcGRHblNZYUtlWjFVMDFMaloyV3RJbklLNUh6?=
 =?utf-8?B?Z1B6aGdlb3FFNnBnY0FHTHdzRERNVHNrSmpMcEVyMk9UcE0wdzNUaTkwN2hJ?=
 =?utf-8?B?VVdmNnJKSS9FWnBsZXFXMTNrU29oYUxXVSsvNmU5QU9kNmpwSnd2eTJrY3NX?=
 =?utf-8?B?ZXZiUkJkMlNmeHVXYytaNzhPYjZGVUtwaUM3aE9wZnJDWE5XOThGRzdjaWxZ?=
 =?utf-8?B?SVZmbWRFUmNCSVUranFjQTh0OTVjZ2RpM0YwNnkxdXV2VkJSSVgyWVNZQ0tu?=
 =?utf-8?B?OXR0TURONEtTZzBwUVlnMWtlRzcwT1FQdHJrN2REdlZVUmtrejJXN2tNYThO?=
 =?utf-8?B?MnV5eVZFZ2hMRkNSanN0RFI3TEZNVm80VmdUb29GVFF2Ry9nNkZqdHdzTytr?=
 =?utf-8?B?WGNpMFdXK1J0cFU2TzB6ZVoramlleEN5R2plY0ZRaTZlQURaZWJORldTeUtZ?=
 =?utf-8?B?TkFFZENzTWFPMnI2L0JrdC83QzFWK2Fjb2wvMi9zR1VWNmRGNlpVOWkvZ282?=
 =?utf-8?B?VXB0NnNZRVMwUnVTMUg4b2R5eWZab0d5SjZKb21kbUM3d1V2MWd0SXdzWmVP?=
 =?utf-8?B?MGtBRU5iVGlkdCs3eEhYOFJJbHg3TFk4TDVOcWhrc0pPZyt1U055c0hhai9P?=
 =?utf-8?B?RDVrSTlsUmRubXBUUkVVa090STFaYTZGa1MwMGxlaUc4cFU4TlhEbWRjVEFv?=
 =?utf-8?B?THNiV1RFWDdXZkxxWC95dHJ4VXVrRjJxR2thRFI3RlU4S29uRDRsRmFNZFdE?=
 =?utf-8?B?VDJLU0h5Sm5CSjVuaCsvbXdRV05kZUtuVzNHR0RmUlpvVVRVMkxTaC9NdFU5?=
 =?utf-8?B?Z1lPOVFkWERpMWk3L3RYOG8zOFZJVTlxczhSeHQrd1NjQWh5a2dxQWV0MUtW?=
 =?utf-8?B?UGg3SVQwRUNsZkJXYjZPbmlLZktadldPT3FWd21Ub3c4TWdXRU5lNUlOV3Rm?=
 =?utf-8?B?N2oxcENqK0VzdEcwczM3M0tpb0d3R2lvRGRPMkg2S24yN1V5QXF5aHhBdzJK?=
 =?utf-8?B?eTl0ZXlOVDVyL0pGZE5pMXU2aWwwQXRFcytpVEIvV3BXRENXS1dYNzN2VjN0?=
 =?utf-8?B?a1VCakFjbjUzSFhKZHFaanZtZnJWSGl3Um9rcGgvaG04UkpFQUcyUE0yTXlw?=
 =?utf-8?B?TmFQeWhqOUt2TkhoL1B1dEZYUzUrNHl6V3M3RVNxV1U1cFc5TlIzT0tVUTJz?=
 =?utf-8?B?b3h4U2g5TEN2Y1AwUWtuS1ZQdm52QkJZTlRUUytPUEFqaEtwYWtBRjU0SXJG?=
 =?utf-8?B?cmFIRko3OVNWYXdmSVUrTmxhNFdvYWo3VWFoVVpGblNKZnVuS0ZGclc4bE9T?=
 =?utf-8?B?WXdiUVZNRFBvaXZZUGRTcUJMMUNpQmYxdFUvK21teHdIdkxSZEdPeERncjRU?=
 =?utf-8?B?TUhLendJN3c3Vll4UDBPTkZyUjZYSlNoYVRGVkltcHdmdU4zSEYyb2F5UmQ5?=
 =?utf-8?B?N0dWRVQxU0czSC9oaVVXN2hWUnUyOEJ1WGR6bFV4TTJDbkNwY05QVzQ0aERy?=
 =?utf-8?Q?2S+AZmNfBDqqddAGvSfUIFm0kxnlxirfhzhkG330Dc3F?=
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
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e75e10b-3c5d-40f0-7360-08dd71c3f597
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 08:54:20.9215
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dB1n+ZrUy4bcSMx3ceWneS2OdwAJGqaSZxGdWtj4A/BImwoihToXu9mgYeUTOq37clxJjLFBNY4Oz99qs704xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6336

DQo+IEZyb206IFNlcmdpbyBMb3BleiA8c2xwQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IEFwcmlsIDEsIDIwMjUgMzowNyBBTQ0KPiANCj4gVGhlcmUncyBhbiBpbmNyZXNpbmcgbnVtYmVy
IG9mIG1hY2hpbmVzIHN1cHBvcnRpbmcgbXVsdGlwbGUgcGFnZSBzaXplcyBhbmQsDQo+IG9uIHRo
ZXNlIG1hY2hpbmVzLCB0aGUgaG9zdCBhbmQgYSBndWVzdCBjYW4gYmUgcnVubmluZyB3aXRoIGRp
ZmZlcmVudCBwYWdlcw0KPiBzaXplcy4NCj4gDQo+IEluIGFkZGl0aW9uIHRvIHRoaXMsIHRoZXJl
IG1pZ2h0IGJlIGRldmljZXMgdGhhdCBoYXZlIGEgcmVxdWlyZWQgYW5kL29yDQo+IHByZWZlcnJl
ZCBwYWdlIHNpemUgZm9yIG1hcHBpbmcgbWVtb3J5Lg0KPiANCkkgZG8gbm90IHdlbGwgdW5kZXJz
dGFuZCB0aGUgcHJvcG9zYWwgaGVyZS4NCklmIHdlIHRha2UgUENJIHRyYW5zcG9ydCBhcyBhbiBl
eGFtcGxlLCBhIGRldmljZSBoYXMgc29tZSBOIGJ5dGVzIG9mIG1lbW9yeS4NClRoaXMgbWVtb3J5
IGlzIHNoYXJlZCB3aXRoIHRoZSBkcml2ZXIgYnkgZXhwb3NpbmcgaXRzIGxvY2F0aW9uIGluIHRo
ZSBQQ0kgQkFSIHZpYSB0aGUgY2FwYWJpbGl0eS4NClRoZSBsb2NhdGlvbiBpbiB0aGUgQkFSIG1h
eSBuZWVkIHRvIGhhdmUgc29tZSBhbGlnbm1lbnQgbmVlZHMgYmFzZWQgb24gaG93IGRyaXZlciB3
YW50cyB0byB1c2UgaXQuDQpGb3IgZXhhbXBsZSwgd2l0aGluIGtlcm5lbCBvciB3aXRoIHVzZXIg
c3BhY2UuDQoNCk9uZSBleGFtcGxlLCBJIGNvdWxkIHRoaW5rIG9mIGlzLCB0byBtYXAgdGhpcyBC
QVIgdG8gdGhlIHVzZXIgc3BhY2UgcHJvY2VzcyBmb3IgcmVhZC93cml0ZSBhY2Nlc3MuDQpFYWNo
IGNwdSBhbmQgT1MgbWF5IGhhdmUgZGlmZmVyZW50IHJlc3RyaWN0aW9ucyBvbiB0aGUgbW1hcCgp
IHNpemUgdG8gbWFwIHRoaXMgQkFSIG1lbW9yeSB0byB1c2VyIHNwYWNlLg0KQXMgYW4gZXhhbXBs
ZSwgQVJNICsgT1MgbWF5IGhhdmUgNjRLQiBwYWdlIHNpemUgYW5kIHJlc3RyaWN0cyBtbWFwKCkg
dG8gbWluaW11bSBhbGlnbmVkIHRvIDY0S0IuDQpJbnRlbCBjcHUgbWF5IGRvIDRLQiBldGMuDQoN
ClRvIG15IGtub3dsZWRnZSBwYXJ0aWFsIG1hcHBpbmcgaW4gY3B1cyBpcyBub3QgcG9zc2libGUg
Zm9yIElPVkEgdG8gUEEuIFNvIEJBUiBtdXN0IGJlIHNpemVkIGFuZCBhbGlnbmVkIHRvIHRoaXMg
bWVtb3J5LiANClBsZWFzZSBjb3JyZWN0IG1lIGlmIHRoaXMgaXMgaW5jb3JyZWN0Lg0KDQpBc3N1
bWluZyBzdWNoIGxpbWl0YXRpb24gZXhpc3RzLCBkZXZpY2UgZG9lcyBub3QgaGF2ZSB0aGUga25v
d2xlZGdlIG9uIHdoaWNoIGNwdSBhbmQvb3IgT1MsIGl0cyBydW5uaW5nLg0KU28gaXQgd291bGQg
anVzdCBlbmQgdXAgdGFraW5nIGFsaWdubWVudCByZXN0cmljdGlvbnMgb2YgNjRLQiBvciBzaW1p
bGFyIGFzIHdvcnN0IGNhc2UuDQpBbmQgSSBkb27igJl0IHNlZSB0aGUgbmVlZCBvZiBhbnkgYWxp
Z25tZW50IG5lZ290aWF0aW9uLg0KDQpPciBhcmUgeW91IHRyeWluZyB0byBzb2x2ZSBjb21wbGV0
ZWx5IGRpZmZlcmVudCBwcm9ibGVtPw0KDQpDYW4geW91IHBsZWFzZSBleHBsYWluIHRoZSBtb3Rp
dmF0aW9uIGFuZCB1c2Ugb2Ygd2hhdCB5b3UgcHJvcG9zZSBpbiB0aGlzIHNlcmllcy4NCkkgYW0g
Yml0IGxvc3QgaGVyZS4gOigNCg0KPiBJbiB0aGlzIHNlcmllcyB3ZSBleHRlbmQgdGhlICJTaGFy
ZWQgTWVtb3J5IFJlZ2lvbnMiIHdpdGggYSBzdWJzZWN0aW9uDQo+IGV4cGxhaW5pbmcgdGhlIHBv
c2libGUgZXhpc3RlbmNlIG9mIHBhZ2UgYWxpZ25tZW50IHJlc3RyaWN0aW9ucyB3aGVuIHRoZQ0K
PiBWSVJUSU9fRl9TSE1fUEFHRV9TSVpFIGZlYXR1cmUgaGFzIGJlZW4gbmVnb3RpYXRlZC4NCj4g
DQo+IEZvciB0aGUgZGV2aWNlIHRvIHByb3ZpZGUgdGhlIHBhZ2Ugc2l6ZSBpbmZvcm1hdGlvbiB0
byB0aGUgZHJpdmVyLCB3ZSBuZWVkIHRvDQo+IGV4dGVuZCB0aGUgUENJIGFuZCBNTUlPIHRyYW5z
cG9ydHMuIEZvciB0aGUgZm9ybWVyLCB3ZSBib3Jyb3cNCj4gOCBiaXRzIGZyb20gdGhlIDE2IGJp
dCBwYWRkaW5nIGluIHZpcnRpb19wY2lfY2FwIHRvIGhvbGQgYSBwYWdlX3NoaWZ0IGZpZWxkDQo+
IHdoaWNoIGNhbiBiZSB1c2VkIHRvIGRlcml2ZSB0aGUgcGFnZSBzaXplIGJ5IHVzaW5nIHRoZSBm
b2xsb3dpbmcNCj4gZm9ybXVsYTogKHBhZ2Vfc2l6ZSA9IDEgPDwgKHBhZ2Vfc2hpZnQgKyAxMikp
Lg0KPiANCj4gRm9yIE1NSU8sIHdlIGFkZCBhIHRoZSBTSE1QYWdlU2hpZnQgcmVnaXN0ZXIgYXQg
b2Zmc2V0IDB4MGM0LCBhbHNvIGhvbGRpbmcNCj4gdGhlIHBhZ2Vfc2hpZnQgdmFsdWUuIFNpbmNl
IE1NSU8gcmVnaXN0ZXJzIGFyZSAzMiBiaXQgd2lkZSwgd2UgY291bGQgaGF2ZQ0KPiBhc2tlZCB0
aGUgZGV2aWNlIHRvIGRpcmVjdGx5IHByb3ZpZGUgcGFnZV9zaXplIGluc3RlYWQgb2YgcGFnZV9z
aGlmdCwgYnV0DQo+IHNlZW1zIHJlYXNvbmFibGUgdG8gYmUgY29uc2lzdGVudCBhY3Jvc3MgdHJh
bnNwb3J0cy4NCj4gDQo+IEFuIGltcGxlbWVudGF0aW9uIG9mIHRoZSBjaGFuZ2VzIHByb3Bvc2Vk
IGluIHRoaXMgc2VyaWVzIGhhcyBiZWVuIHB1Ymxpc2hlZA0KPiBhcyBhbiBSRkMgdG8gdGhlIExL
TUwsIHRvIGJlIHVzZWQgYXMgYSByZWZlcmVuY2U6DQo+IA0KPiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNTAyMTQtdmlydGlvLXNobS1wYWdlLXNpemUtdjItMC0NCj4gYWExNjE5ZTY5
MDhiQHJlZGhhdC5jb20vDQo+IA0KPiB2MzoNCj4gIC0gUmVpbnRyb2R1Y2UgdGhlIFZJUlRJT19G
X1NITV9QQUdFX1NJWkUgZmVhdHVyZSBiaXQsIGJ1dCBsaW1pdCBpdHMNCj4gICAgc2NvcGUgdG8g
cGFnZSBhbGlnbm1lbnQgcmVzdHJpY3Rpb25zLCBzdGlsbCBleHBvc2luZyBwYWdlIHNoaWZ0DQo+
ICAgIGRhdGEgaW4gdGhlIHRyYW5zcG9ydHMgdW5jb25kaXRpb25hbGx5ICh0aGFua3MgTWljaGFl
bCBTLiBUc2lya2luKQ0KPiAgLSBBZGp1c3QgdGhlIGZlYXR1cmUgYml0cyB0byByZWZsZWN0IHdl
J3JlIHVzaW5nIGFub3RoZXIgb25lICh0aGFua3MNCj4gICAgUGFyYXYgUGFuZGl0KS4NCj4gDQo+
IHYyOg0KPiAgLSBSZW1vdmUgdGhlIFZJUlRJT19GX1NITV9QQUdFX1NJWkUgZmVhdHVyZSBiaXQs
IGV4cG9zaW5nIHBhZ2Vfc2hpZnQNCj4gICAgaW4gdGhlIHRyYW5zcG9ydHMgdW5jb25kaXRpb25h
bGx5ICh0aGFua3MgUGFyYXYgUGFuZGl0KS4NCj4gIC0gRGlkbid0IHBpY2sgdXAgUi1iIGR1ZSB0
byB0aGUgc2lnbmlmaWNhbnQgY2hhbmdlIGJldHdlZW4gcmV2aXNpb25zLg0KPiANCj4gU2VyZ2lv
IExvcGV6ICgzKToNCj4gICBzaGFyZWQtbWVtOiBpbnRyb2R1Y2UgcGFnZSBhbGlnbm1lbnQgcmVz
dHJpY3Rpb25zDQo+ICAgdHJhbnNwb3J0LXBjaTogaW50cm9kdWNlIHBhZ2Vfc2hpZnQgZmllbGQg
Zm9yIFNITQ0KPiAgIHRyYW5zcG9ydC1tbWlvOiBpbnRyb2R1Y2UgU0hNUGFnZVNoaWZ0IHJlZ2lz
dGVyDQo+IA0KPiAgY29udGVudC50ZXggICAgICAgIHwgMTAgKysrKysrKystLQ0KPiAgc2hhcmVk
LW1lbS50ZXggICAgIHwgIDcgKysrKysrKw0KPiAgdHJhbnNwb3J0LW1taW8udGV4IHwgIDggKysr
KysrKysNCj4gIHRyYW5zcG9ydC1wY2kudGV4ICB8IDEwICsrKysrKysrKy0NCj4gIDQgZmlsZXMg
Y2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IC0tDQo+IDIu
NDkuMA0KDQo=
