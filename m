Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347B3481AB
	for <virtio-comment@lists.linux.dev>; Fri, 30 Aug 2024 03:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724987427; cv=fail; b=pn+9b5G5xdEpv0fU7xfetbDKrhPDcsJijmlBnzeJEdz3pq0n3Dv7kIhjBlZe9O07ox6D6et5mJaV6NPR+K0hI8H3Jy+63MVAIUfG2RaAVxYHwtspwfVNe6j26YTCAClRU4Xl2XcNxay/C2aEzn40hN7lpNgDsuhfMSUcLAJzVek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724987427; c=relaxed/simple;
	bh=h9mtcCCe2Cyw9xkFVA7kiYoG4/GuncomRGUeftcqrwA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SgUJvCn9JYZ59VG3dtizAlJJWDEYIKy2P286+mB3DI7W828Z7Pv+h0HHYiVNeiZLRPorPsObYeURVj7J2/yvCuUCsX113e2ZOa4t711VbeUS0pRyatUGOHk5koafg0i5Hg+cOiKCwu8/iLgLSnZSXPreCwc+l0Om+tqymM5L+6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N98aF2t8; arc=fail smtp.client-ip=40.107.94.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N98aF2t8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftU8E4WELY7AWmtSXeLexFTCAaaAi/ev2tGO9u24SqdAWt9izpwyPL1fILm1pjBizxSQmD1F/ju1ZIOSot5ZRuDhGFYUvn2dgr1e39R7pyZzHehuFSd0jc6rjbJZtdS1nA2u/0sih8cWxuW2PRBZhcjo3e8w1idBBzjhUHcYJ+ADPU8vl8QXvOpDWb5VWzpvkPG7LcKmVim6eGp5WZZWUT4taxbrCCqj9o7izuWe4e+XY/34yOjp7I01eSFavq8ZWv6FYRmSz8z/VqHbIg5+8YHtKUrMFFGy0bp53FQqSNUFeEYcwyquXpeK/4SV7rtLw9Tlhf7UaAUMY4jSU/Hphw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9mtcCCe2Cyw9xkFVA7kiYoG4/GuncomRGUeftcqrwA=;
 b=Fcim89jfQRS4I89d7Z6oiOhMFC2aSkYHHX3XGVSG9nHLyvo1Q5a+faLGW/ajfDK7OZzEzFQVqQwa6miwUTzOii0gAOZSBmacn7g6DukrmN0BR3wDKYvsdGBg48WRhTzbqKFS68p38/Y0l5u2IEEZJRUiQ6nblTyVkSHzyMpAI5QLd5hIgkcssrub1pZjDDjwhzEuJDVVtKNjcv2iTkCCqxL9Ooafn8uz0BxSCMbh5SrddtaSiaEtwFCHYyQisUiU+dV0Sw2UWKCmMD9MogfCNsFdCbOoq0D9tkkMmNKarmZIxvVvKjaWRhqiEpN1kpK0gKBLNDRMREz2ZtoHyOQ39g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9mtcCCe2Cyw9xkFVA7kiYoG4/GuncomRGUeftcqrwA=;
 b=N98aF2t8bAa69RdnwgT+ZbOhIOS8P3GecxvEVMSGH/V6rTc2iujnnk6Eqin4zotXblrmo0OLvwr4xsNwQE/lTOIWRPp32LoN12LsDxmcghbqdOj+wNvPh8GhynaOYrlOLT46072HB/gnrzfFXJYjjko6Ekwe9X8lT/7PU5UWtbmlHhWBbFT58E3NU1OW0syehd0SqOQOscSYprXiwZixXXUqW2dus4+qYWBYMOvE0N1zUuTgUuGAhubZGuG6qdMz84qkkcEBQhfX2gH7ky9FdlGpJaxUaNeke19nRVS93kaJx/ZDtit6giqV3JjLI1ejqEDeojqBuvXAK+9AoGpecw==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by CYYPR12MB8940.namprd12.prod.outlook.com (2603:10b6:930:bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Fri, 30 Aug
 2024 03:10:23 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 03:10:22 +0000
From: Parav Pandit <parav@nvidia.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: "cohuck@redhat.com" <cohuck@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, =?utf-8?B?RXVnZW5pbyBQw6lyZXo=?=
	<eperezma@redhat.com>, David Stevens <stevensd@chromium.org>
Subject: RE: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Topic: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Index:
 AQHa5Ab4bEzmpQ/mGUCtSlfq0w80E7IkrTCwgAASmgCAAAEvAIAABvOAgAAF6HCAA2yqgIAAAXfggABFsQCAFsFYgIAACOMw
Date: Fri, 30 Aug 2024 03:10:22 +0000
Message-ID:
 <IA0PR12MB8713FA354FBC958CAA85BD80DC972@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240801113516.22155-1-lingshan.zhu@amd.com>
 <IA0PR12MB871379BD50370080A9B6849EDC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <50dae8fd-de3f-49cf-9b90-b53f0416133a@amd.com>
 <IA0PR12MB8713E194469A590D09B1BA1ADC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <fbcc2cd6-793b-495e-b036-7baf77e87e33@amd.com>
 <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240815065136-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87139D0ABCD441C9EB10F5EFDC802@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240815110443-mutt-send-email-mst@kernel.org>
 <bbebed0c-c4d1-4e9f-95f7-da0d1c12d220@amd.com>
In-Reply-To: <bbebed0c-c4d1-4e9f-95f7-da0d1c12d220@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|CYYPR12MB8940:EE_
x-ms-office365-filtering-correlation-id: 62ed301c-260e-4918-58e8-08dcc8a14915
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TDBVYjFlVjhQanZHdDlnSjZNQ0RwVXJtWHV1czd5VmZvZmI1KzZSUDZaRWFa?=
 =?utf-8?B?ZXArRzdZaWlMVTNqemo3d2c3TFhzWVpEbjV5bVMxVXFCSWQwMlhYbERkUUE5?=
 =?utf-8?B?RnhKZmhHSHBzWE9OaDRlUExCOUVlbXphZkRzZm5Ea3NnVDUvOWk2VnpwMVVC?=
 =?utf-8?B?QStEQW5ISUpEM01WUVdlVEp6bE9JcEVvMnhiVm5UY1JnNTc4TGdMN2hQbjly?=
 =?utf-8?B?SmNkRnM5R0phUEtnUHJzZTIyeGV4UTdGajJPT2d4MENUTGtHd2ZtV0FHRVV3?=
 =?utf-8?B?N1ZRQzhYb2FxUTlsakdmYW4xMmYwOHVkUWxoZXEvT2JCR1F1TjRjR01HWS9F?=
 =?utf-8?B?WDl3dEVpYTNhb0I3VDV3OGpKL0MrNzFjaS90S3dJRFBJaTBCU3NDRGFCQ2pR?=
 =?utf-8?B?SjRqZG5jUCtDOVFPeTJ1NEtFQkR1ai9zdDJqbHBXUC90bzI0ekJlSFhTNHEy?=
 =?utf-8?B?TFl3Ni95ZTlvcEpjTy9OajZsRklBaE81VjJTY21TNkdiTXAzSTlJQTRMZmNj?=
 =?utf-8?B?ZVQ0NEVqcXIyeDhQR2dUeGN3dlhLMytQNUZ5ZkNaQ3VZajF1VHR3Y2dBazEr?=
 =?utf-8?B?aXp1TTY3WlM5aW5sckhadTgvdzVjTitQRTdqckxBOXpSTXphRFFjdHErRFRG?=
 =?utf-8?B?VmowSHprWUFYQVlrWnIrbW44VlFxZENvbVJEbFJWeXF1QXVvMWUwcjZvTkg4?=
 =?utf-8?B?MmxTZFNCc0swMEhLbWFiaUlydkpSTXhaeXNjYlRsMEhFa3VhQXlBREl5aXUv?=
 =?utf-8?B?QWRzeGFLNkJ6T05keC91UGNJQXJhd0Y5cEhseWFNUWRnQitvbjErQnAzVEtE?=
 =?utf-8?B?ak5UNzg4QVRkTVpuSmJkcGVBMU1Ra3RkbDZkSkhEK2Z2UFQzeHNhL3BLSzdT?=
 =?utf-8?B?ZmZ1Y1dyZUpZd2dFdGRzaS9EL0JrSFh1SEtmM2dxYVM5YzRQRVJyaGZiU2tt?=
 =?utf-8?B?Vzlva3Z4V1MrNTVRZHF0ZS9zWlpCbXh5eDU4Y1BBS3JUQzN1N2hpajZRRXdr?=
 =?utf-8?B?aVJwK08vWE15MjBMa3l2NjUzUFZHVzl5VXA2YkxlRXhPL1lzSDZzV3UxcXFt?=
 =?utf-8?B?L3IyTmZhSEU3ZmxyMkVFUU91SmpqaENPVzlXRDVydzUxRWRTTk5OaGEwbTNZ?=
 =?utf-8?B?dC9raHViL0lGVHgvZGlBVHZId1d0dmZtT3llTnV6dURpaWxiOW9nRnJOWks3?=
 =?utf-8?B?L2p0VEZCN2tsQWV0SkZYMGFGcE9RNmhrMU1TVWRPbzBUUzJ6L1dpenV4VDIz?=
 =?utf-8?B?VnZHMi9KN1dXYjlOYU95WFNsTVg4NGk4Y0QwN2ZzRHFSWHRkR1BPTUNHRlEy?=
 =?utf-8?B?UkVGbmJTY1NaOTRWREdxMHZGazRTNE03SVAxeXFhQVNjckVpQ1RuRU94N05v?=
 =?utf-8?B?eFBOaVhrYTJIcjd6UUFrWWZKQzdkMWptRFBOTTVJZWpKcU9MRnoxTHliaEhV?=
 =?utf-8?B?S3pjQ2JKemxZWGxGWmo2V1RXN3dKc3N4azZ4SEIxbDI3TExPbFdTRkJkMVRz?=
 =?utf-8?B?akx3cklJYmRIK3VIUkxoY1BmVWxzVFJYQnMxTkxRWnNVdVJGenpFdUg5RGN2?=
 =?utf-8?B?VldLOWZ6bEJzOVhhdXBna2J5eDEwZmxaZUJYUUlCWkdxNFFlalBkWWkzQU1O?=
 =?utf-8?B?OEZtU2s5b1V1UWVhSTdpZWV6dXBmV1pPeWdqNnA0cTJuWEpUQ1loVTNyMkxO?=
 =?utf-8?B?OEs3YkhXamgzTmg2UFVFbVNJQmp0VENGak4yOHNUNW9hZWNDNktlRXFhc1RU?=
 =?utf-8?B?SGc1ekNybVFDYlR3d0FobmxNNm1OVGRRRWE1cGNXYlJTV3JTLy8xRmg3dTZH?=
 =?utf-8?B?RU9uYVA2aURaQUdWbjVLZmd5bldNSGhMWjdWTHZpcWlrTTNZVDZUbTdSTi9p?=
 =?utf-8?B?OUowVEo3dTdZWkJZbGJRQkxicmN4dE9Pbjlza3AyU0VzYXc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YkgwU2hUUHp4RlBPeVVHQ1hzZzdVMldNQUNGTmZnN0wvR2hHR2dHSS9sTEJU?=
 =?utf-8?B?U2QvZ1krTkhwZU44RG9GT29PdlRqU0x3ZkV6VTJHRldiMitOdDdjbzVtR1c0?=
 =?utf-8?B?akV4UkpvUnR4cm04eU1SaFEzM0pyTURueWFoZ1pSS0pDR1B6bHFqT3dxYkJw?=
 =?utf-8?B?M3pjMVhidXQybkZReDlEcTgyN1A4QXA4S3I3Y2tFN0xQNEQ5QWRnTVRON0lU?=
 =?utf-8?B?OHJZMWNTbE1rdnNuWmtHSXgzTnFHLzdIa05mMUJwT2p6TXJXaEt0T3RLZWdH?=
 =?utf-8?B?N2RTeDc0bllkTHpFbUo1ZmF1eDJZUUtSNndObFlERHd2eXJzVmJaTUpPWFJi?=
 =?utf-8?B?ZHUyVDBnSC9ZbHBDdHpwMkx4MDc3UG90bnJTLzBEZDFENlJ2ck5ZNUdLZmpj?=
 =?utf-8?B?VWpnY2xiQ1YrTWhKZm5ucWc1YnZqYUNXWU5QRGQ1U3BkdzJOUmlZM1NFc1ls?=
 =?utf-8?B?Z2gyZFNRM1NiTW5VSWtVekR5K2dKTWJHblJ0SHp2aCtuQS9heTBpOHZURVBv?=
 =?utf-8?B?T0g4MWxFVUdaZis4OUtDaFdza2pnVEMybmxKcmZzMFBIWlozanNXQjl4Ny8z?=
 =?utf-8?B?REF3bWM2OHdlMlZvZlZNaTBFQXF0bUpYSkEzMDUwRERPd0xRY21kVk1tV1Vt?=
 =?utf-8?B?NDBJRVpGQk95aWliK3dXbDc1TzF3WHE0OVlBMnJqSStjWXRVSUJvRDNQcWxN?=
 =?utf-8?B?OTRQWEZET3FIbHBNRU9LZmlOaExtYmIzWjhPZUN0QjRaVjFtTjRBVWZtd2Z6?=
 =?utf-8?B?WlpaYzdNeDRCWmpzQ01qNlJBZEFQdyt6dFkvSERLU2JJVEhFSVVyazVoYThX?=
 =?utf-8?B?S2p4MVd6VHo1Y1g5bzRHaXArbDkva245dy8ySFBVQ1R0eDhsZTIrSWptbVM2?=
 =?utf-8?B?WU1ka3ZwY3dWTVF5WUxybDNNbThxQ1VnV1JFY0doRnp0alpESFJySDFPNGRo?=
 =?utf-8?B?d2wvbnVFTXJPeFIwblZOMGg3SDdQU2tUT0g0VWtEMzFFd0w4Q0RKaFY1MWR3?=
 =?utf-8?B?ZkVxbSttTTd1RTMwVzN1SUdtL0RqRFAwV3RGWU1ZN0ZJblZmWXBvVWZOSTJj?=
 =?utf-8?B?UGxIdm03aGFZVG9RQ1VZU1lmR1BDdDJoVHQxbmd4eU1BMnc0TFBXSDBXZGdK?=
 =?utf-8?B?UFh6SlJFaUdXc09NVUR0QmR1Y3A4V1Bzb2ZwakFwWmt0Sm9KTmFDbmNRdzBx?=
 =?utf-8?B?ZzNzb0hzRk9WZS84UUxaYVFxNkJMck93S3R6YXJrSGFlMldNWlgyMmZYdmtJ?=
 =?utf-8?B?ZzlyWDlmS2VuZHV6eEJvWEErQ1QvT1pHUVZWZk5YUEdSa3BxTmJRcjQ5Rktn?=
 =?utf-8?B?eE5TOUdubk8wU1RHeElTSnMvWk1qYU9CNE4zbmNNemR1MVl5Q2p6SEVFaVMy?=
 =?utf-8?B?U3o4R2hOSjQ5WE9YMVdUWUp1anlOdHFDN0c5bWY5S2VjalJTTndDSXVqZXIw?=
 =?utf-8?B?Vk02ZlBYbE1NWHFOZnNyWFRQQ2h5REdOUElaMHJUb3NzWGZHa01iVlJTcEk1?=
 =?utf-8?B?aVRlaVlKNERtZTNzSEY5QnFxeFlVNHk5bzZYTTF5WG5RaU94TXVXVzdwMThz?=
 =?utf-8?B?TUorNXF5SVFMUUdqcXNDMGYrSEJvc3ZLOEM2MVhPcUF5V1g4b0hxL0RKL1pN?=
 =?utf-8?B?a2llblZWRjFJWUlpeGhKd3p3RnA3RWNONFc5aGxiUmFuUUFHbnY2UkF6WW0x?=
 =?utf-8?B?bGg0cFY1QUZKRUVIUUwyMWZ3YTFZdzQwcHV5WTlJVzJNcjdYSVFSS3duNW91?=
 =?utf-8?B?b0Q4ZllJMmhPTzZJSHRQRXRDQ0pEWXVxUFNxUDcrSkphdmQvVHBtaHFGbTFQ?=
 =?utf-8?B?dVRaVnVyMEo3WnA2N21RSmRnTkxZcEp6OGVBTU1hTFQ1ZDZKMGhrV0lMNHRU?=
 =?utf-8?B?SEhiT01XN3RrUTFpdjM2WXRlVG1rVzRxZnRRb2R5QWt4VlRQMjF3eGQzRkdN?=
 =?utf-8?B?bk9naUpkaG43MFJMK25VMyt3dnh0S1IzdDN0bm5NVitzYjdyMGVoVlBuRjI2?=
 =?utf-8?B?SEZtTDU0TytvQlZFa0NRdVdOZmV1U3FIWVRXTllGRHoyZmZKT2d5T3dPeVdu?=
 =?utf-8?B?S2xqTk9JdTg4ZXJTcVF5K1dFS3I2YzNXWU5NeGNGWGJLYnRYQUlOaDBMSmhv?=
 =?utf-8?Q?Bu70=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 62ed301c-260e-4918-58e8-08dcc8a14915
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 03:10:22.0969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JwDfFMpbsmCt32UJi7q5NZs4jTGf0+Pi2G/QIIH5J/ClP5xB9H7XNrxnjjBXBAYUt+2xSQQczb5IDmBNFYLZzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8940

DQoNCj4gRnJvbTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAYW1kLmNvbT4NCj4gU2VudDog
RnJpZGF5LCBBdWd1c3QgMzAsIDIwMjQgODowNyBBTQ0KPiANCj4gDQo+IE9uIDgvMTUvMjAyNCAx
MTowNyBQTSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOg0KPiA+IE9uIFRodSwgQXVnIDE1LCAy
MDI0IGF0IDEwOjU5OjQ1QU0gKzAwMDAsIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4NCj4gPj4+
IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+ID4+PiBTZW50OiBU
aHVyc2RheSwgQXVndXN0IDE1LCAyMDI0IDQ6MjMgUE0NCj4gPj4+DQo+ID4+PiBPbiBUdWUsIEF1
ZyAxMywgMjAyNCBhdCAwNjo1NTowNEFNICswMDAwLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4+
Pj4gVGhhdCBtZWFucywgUENJIEhXIG5lZWRzIHRvIHJldHVybiBzdXNwZW5kPTAsIHVudGlsIHRo
ZSBkZXZpY2UgaXMNCj4gPj4+PiBub3QNCj4gPj4+IHN1c3BlbmRlZC4NCj4gPj4+PiBJbiB0aGlz
IGV4YW1wbGUsIHRoZSBkZXZpY2UgY2Fubm90IGJ1aWxkIHNwZWNpYWwgY2lyY3VpdHJ5IHRvDQo+
ID4+Pj4gYW5zd2VyDQo+ID4+PiBzdXNwZW5kPXRydWUgd2l0aGluIDUwbnNlYywgb3IgaW4gb3Ro
ZXIgd29yZHMgYnVpbGRpbmcgc3BlY2lhbA0KPiA+Pj4gY2lyY3VpdHJ5IHRvIHJldHVybiBzdXNw
ZW5kPWZhbHNlIGlzIHRvbyBjb21wbGV4IGZvciB0aGUgc2xvdyBvcGVyYXRpb24uDQo+ID4+Pj4g
SWYgdGhpcyB1bmRlcnN0YW5kaW5nIG9mIGJ1cmRlbiBpcyBjbGVhciwNCj4gPj4+Pg0KPiA+Pj4+
IFRoZSBwcm9wb3NhbCBpcywgY2FuIHlvdSBwbGVhc2UgZXh0ZW5kIHRoZSBpbnRlcmZhY2Ugc3Vj
aCB0aGF0LA0KPiA+Pj4+DQo+ID4+Pj4gMS4gZHJpdmVyIHdyaXRlcyBzdXNwZW5kIGNvbW1hbmQu
DQo+ID4+Pj4gMi4gZHJpdmVyIHJlYWRzIHN1c3BlbmRfc3RhdHVzLCBhbmQgcmVjZWl2ZXMgbm90
X2NvbXBsZXRlZD0oZmFsc2UpLg0KPiA+Pj4+IFRoaXMgaXMNCj4gPj4+IHRoZSBkZWZhdWx0IHZh
bHVlLg0KPiA+Pj4+IDMuIFdoZW4gdGhlIGRldmljZSBjb21wbGV0ZXMgc3VzcGVuZCwgaXQgY2hh
bmdlcyB0aGUgcG9sYXJpdHkgb2YNCj4gPj4+IHN1c3BlbmRfc3RhdHVzPXRydWUuDQo+ID4+Pj4g
VGhpcyBoYXMgdHdvIG1haW4gYmVuZWZpdHM6DQo+ID4+Pj4gW0FdIFRoaXMgd2lsbCBlbmFibGUg
c29mdHdhcmUtYmFzZWQgZGV2aWNlcyB0byB3cml0ZSBkYXRhIHRvIHNsb3cNCj4gPj4+PiBmaWxl
cyBhbmQNCj4gPj4+IGRvZXMgbm90IGhhdmUgdG8gZm9yY2UgVk1fRVhJVHMuDQo+ID4+Pj4gW0Jd
IEl0IGFsc28gZW5hYmxlcyBodyBiYXNlZCBkZXZpY2VzIHRvIG5vdCBidWlsZCBzcGVjaWFsIGNp
cmN1aXRyeQ0KPiA+Pj4+IHRvIGFuc3dlcg0KPiA+Pj4gd2l0aGluIDUwbnNlYywgd2hpY2ggY2Fu
IGdldCB2ZXJ5IGNvbXBsaWNhdGVkIGZvciB0ZW5zIG9yIGh1bmRyZWRzDQo+ID4+PiBvZiBQQ0kg
UEZzLg0KPiA+Pj4NCj4gPj4+IEkgcmVhZCB0aGlzIHNldmVyYWwgdGltZXMsIGFuZCBJIGRvbid0
IHVuZGVyc3RhbmQgd2hhdCBpcyBwcm9wb3NlZC4NCj4gPj4+IEEgc3BlY2lhbCByZWdpc3RlciBm
b3Igc3VzcGVuZC9yZXN1bWU/IElzIHRoaXMgdGhlIGRpZmZlcmVuY2U/DQo+ID4+Pg0KPiA+PiBZ
ZXMsIGEgY29tbWFuZCByZWdpc3RlciBmb3Igc3VzcGVuZC9yZXN1bWUgb3BlcmF0aW9uLg0KPiA+
PiBBbmQgZGV2aWNlX3N0YXR1cyBuZXcgYml0IHRoYXQgTGluZ3NoYW4gZGVmaW5lZCByZXR1cm5z
IHRoZSBzdGF0dXMgb2YgdGhpcw0KPiBvcGVyYXRpb24uDQo+ID4NCj4gPg0KPiA+IFVnaCwgaXQn
cyBhbGwgcXVpdGUgbWVzc3kgSU1ITy4NCj4gPiBXZSBoYXZlIDQgc3RhdGVzOg0KPiA+IC0gb3Bl
cmF0aW9uYWwgKHJlc3VtZWQpDQo+ID4gLSBzdXNwZW5kIGluIHByb2dyZXNzDQo+ID4gLSBzdXNw
ZW5kZWQNCj4gPiAtIHJlc3VtZSBpbiBwcm9ncmVzcw0KPiA+DQo+ID4gV2hhdCBJJ2QgZG8gdGhl
biBpcyBhIHR3byBiaXQgcmVnaXN0ZXIuDQo+ID4gVG8gc3VzcGVuZDoNCj4gPiAtIHdyaXRlIHN1
c3BlbmQgaW4gcHJvZ3Jlc3MNCj4gPiAtIHJlLXJlYWQsIHdhaXRpbmcgdW50aWwgc3VzcGVuZGVk
DQo+ID4gVG8gcmVzdW1lDQo+ID4gLSB3cml0ZSByZXN1bWUgaW4gcHJvZ3Jlc3MNCj4gPiAtIHJl
LXJlYWQsIHdhaXRpbmcgdW50aWwgb3BlcmF0aW9uYWwgKHJlc3VtZWQpDQo+ID4NCj4gPiBIb3cg
ZG9lcyB0aGlzIHNvdW5kPw0KPiBUaGlzIGNhbiB3b3JrIGZvciBzdXJlLiBidXQgaXMgaXQgYSBt
dXN0Pw0KPiBJIG1lYW4sIHRoZSBkcml2ZXIgaGFzIGl0cyBvd24ga25vd2xlZGdlIG9mIGhvdyBp
dCBvcGVyYXRlIHRoZSBkZXZpY2UuDQo+IFdoZW4gZGV2aWNlIHByZXNlbnRzIFNVU1BFTkQgPT0g
MCwgSXQga25vdyB3aGV0aGVyIHRoZSBkZXZpY2UgaXMgaW4NCj4gbm9ybWFsIG9wZXJhdGlvbmFs
IHN0YXRlIG9yIGluIHRoZSBwcm9ncmVzcyBvZiBTVVNQRU5ESU5HLg0KPiANCj4gQnV0IGlmIHlv
dSB0aGluayB3ZSBzaG91bGQgYWRkIGEgbmV3IHJlZ2lzdGVyIHdoaWNoIGFwcGx5aW5nIGZvciBh
bGwNCj4gZGV2aWNlX3N0YXR1cyB0cmFuc2l0aW9ucywgTk9UIG9ubHkgZm9yIFNVU1BFTkQuIHdl
IGNhbiBzdXJlbHkgZG8gdGhhdC4NCj4gDQo+IFRoYW5rcw0KPiA+DQpOZXcgcmVnaXN0ZXIgYmV5
b25kIHN1c3BlbmQrcmVzdW1lIGNhbiBiZSB1c2VmdWwgdG9vLg0KRm9yIHN1cmUgaXQgd2lsbCBz
aW1wbGlmeSB0aGUgc3VzcGVuZCArIHJlc3VtZSBmbG93Lg0KDQo=
