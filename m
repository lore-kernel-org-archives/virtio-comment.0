Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91E62207A
	for <virtio-comment@lists.linux.dev>; Tue,  1 Oct 2024 08:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727769897; cv=fail; b=pRtekX+0GEaDsLxs9ybv1q/NZE8+tu7U0vIxeEtDmEbJV2jkLGG/ntp2NuTipc4WXnfLNE2JgEMBhyfIlrzWpj7y8I7Go8jEFRPXhPnb/JQCujBuVXKq3Qo0E2+Ai6Qn15u5lxjyeKMIFWfRelUHSUG1baApwUHuiEZnBcpmzAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727769897; c=relaxed/simple;
	bh=OqI3Y4FBFS+osS/EeKB1qN7zmfcI8aH9hWOd+MNPYgY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ln2dAArofoEsFN1WzmQLHukom+YRaYIp532bSTy/wKTtKt6L3N3Jw/A/TwIWuyk4yQwLsmnaQ2M1fLt2MSJvCGMwk9AnUj2ih0gdg5XlS2aZZbTedcSeeZmW75bX+gPVh4GNh9sEgvjhB6sW7YKWyKY1uR1D2MqBFEq9x2y5Kfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=E7FbVZKg; arc=fail smtp.client-ip=40.107.223.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="E7FbVZKg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VEOwe3U09td1YAkBxkedNuafP8uFGRXVPwxeKQQxBhD+hPdqNHCfUqF0dkIkP1s9pjoSG1Tmnpebrw+NDvcOGmhFzZ+8hZP9dNBzarTbBmABJ6EVi7GCkKkHkrs9G+wG8NxGUPC+KdhDKSQruv0uJHekfW9ChvA36el4HdEPJrs0lzjasS72kQz+6wngUIJE5ntCGWYgGVSbNBSwoPetiMv/wOcNDp4oG4LnK50j2vED2iD04lP3zklHfTc6Y3vbXlazIIrKrrALbSbIrISwA29xIsUSzsdkzHDfXPzpSPLmpbAW1e2umbJUQiA6PAzYhVfZOhMTw1TTFJxUW4lr+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqI3Y4FBFS+osS/EeKB1qN7zmfcI8aH9hWOd+MNPYgY=;
 b=YIO9GNlr0rbq/Elc/JLVuv6x/7U+KNc+n0YNoquoN/Ul/LUyA0VWLvw9r9gvBCaEJULoTfPaBUIWNZLbEwJUyPnTtXHaQ/DyWUBc5hznrNN1yVt9ykwyz1jmiVzYT30NwWdyCiH0cPC3POp6sA2murbb5hBkGc4NKw7g4Nwu8BnfrP9/XBwzr95Tg4Rr0iGV26/jz1lcgGgg5U0K/Cu7OVyr5ZFQfYerpdwhUojbE6UGEXN0Df9Q32SATn3b8jKQy96bxdFsVyUWrSCxgG0UWRkvXy3V2ckroQFs6b113JvnznnptEF+sHcsqDyAGhqucA+pX77jn0LfG8HpxA/qrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqI3Y4FBFS+osS/EeKB1qN7zmfcI8aH9hWOd+MNPYgY=;
 b=E7FbVZKg1jifa2605ibgrKzMKZEsansI7d6cti7id6fC7yE6ZdGjQHW6Kue0Mp8SN9adTcGbjoNQ8X8uN1WYDgCP/d94eEgmvw3VSkHUkRolMFP5HB8QtfFG78NZYiohhXO0NQeVOPCmvy/e5XORgdl5IMSvn/tOx1Yjz4LrJGO5L5NIHsgOAInwql2bsZVzXUU0HXaqK6EiotJU0m+KaSJISuci+DIphPjy8P2ZIO7Fryqh7goQv7gnCdiLtmFVqgFcGxV75WL/GkTCfzJ+68h0n3cc2HDOk5OXAGls+LZ/tuOkDJ/bTNKJOvpkP8/EyxShqqKOeyn4VE4THHzMLA==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by SJ0PR12MB8115.namprd12.prod.outlook.com (2603:10b6:a03:4e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 08:04:52 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 08:04:52 +0000
From: Parav Pandit <parav@nvidia.com>
To: Albert Esteve <aesteve@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "aiswarya.cyriac@opensynergy.com"
	<aiswarya.cyriac@opensynergy.com>
CC: "acourbot@chromium.org" <acourbot@chromium.org>
Subject: RE: [PATCH v3] content: Reserve ID for media device
Thread-Topic: [PATCH v3] content: Reserve ID for media device
Thread-Index: AQHbACulN7OJ8hVWBUuunhxN0rzrwbJoLecAgAmAf7A=
Date: Tue, 1 Oct 2024 08:04:52 +0000
Message-ID:
 <IA0PR12MB8713CC178EDB984292755C5DDC772@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240906070833.1949727-1-aesteve@redhat.com>
 <CADSE00KO=VZy4_4FfgC7ODON32mZ8khWkPUcXheP6pTiEZAyHA@mail.gmail.com>
In-Reply-To:
 <CADSE00KO=VZy4_4FfgC7ODON32mZ8khWkPUcXheP6pTiEZAyHA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|SJ0PR12MB8115:EE_
x-ms-office365-filtering-correlation-id: a995bf32-ae08-4c74-1179-08dce1efba7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ak5BTDZNUndiN2Y4YmxhLzVjTG1JWmZBQWRkaERvOUQ1SFVUU2xlSTk3OEVE?=
 =?utf-8?B?bkpZNHpRY3lka2lmWFNsaGduRXZLdGN2MnlORkwrVi9MTG5BQldBa1JUNVlq?=
 =?utf-8?B?dE10VElUdm9uSDdkZ2FTYXR2WlAvTmpDRWRtS1dveTd2VktEcDkzSmt5ekZt?=
 =?utf-8?B?OTkzU282NUFsQ3BtWURhRlh5WE5LRmFyWDZmNjdseW5FVUtTcjZHNnQvQTlP?=
 =?utf-8?B?emU2QXBJTUVSRzY5bFQxbHBrNjhUeGZLVVJvcVExZ0tzU0RCS05ZRTBQbi9q?=
 =?utf-8?B?aFdmMVQ3d1VDTVVtWjhKZmtXa1hxbHdsUEVQalZSTGhTYnczeFlIbFZmWDcz?=
 =?utf-8?B?eDF1U2pKKzAzY2R0SDJ2QmhEeisxSzY3T2dueHk4SzZyWi94a2YxM3J4S3VT?=
 =?utf-8?B?WkRjWG9JcWNDSzE5dU8yME5JbUxuZFB3Z05sTSt1VmVhUXowcWFlTjU4OVhT?=
 =?utf-8?B?dUl1SjFkREpjMmJtWCszUDdHZkJxckxRM1E1ODVGdk9RUVVkWDhUWngwT3Jq?=
 =?utf-8?B?UTV4RTY2RWgrY1RzblVYTFQxRzd3WVRHblQ4NEt5eW8xTE1lL0hzb2RVWCtl?=
 =?utf-8?B?bHpVcVFFTFdqUE96T3gwQ0tWai9GUlU4QkxzV0FmeHlpV29TaGFMVmtoMnJ6?=
 =?utf-8?B?NitRelBDYlR3SUxZNENNUXlxSHIwNCtaYVVXNEdXa3MrTDVtd3VNSmpMK09O?=
 =?utf-8?B?V094YWRHaFNyVklCb01uSDU3R3NITENoVnIzSVJCbzlHdEVFSmNHQktSck54?=
 =?utf-8?B?K3VkUEZISVkwdjlXR3lpZGlwRUc3cHRnVHJZSENaakFkMFh0TTc2ejRxLytO?=
 =?utf-8?B?T215Mm9yY2RtTkhMNWRZQUl0ZWlpaVQyZEluSFZVeHFZRExCTU9UUWpoM2k0?=
 =?utf-8?B?V1VlTEphZ2JHQkh6Nlk1aDZodGc3M2Vsb0dhbHEzL3hyT1ZJTGxLcnNxZFRG?=
 =?utf-8?B?dGdsbnpjbkZWcFR5NGp0eng3TTkxYXVMbFF1K0JFRy9tUGtiQmVvdW5ibXRs?=
 =?utf-8?B?M3p0OTQ2TnMzbHg4SWZUbUdNUEwxMXAyazZHWjYyMzNCa0cyRzdTOUNoOGJo?=
 =?utf-8?B?VzRGRUJGYm5XTU5LWEVNZGg0OTJKWDNMR2l0TFIrVTJpZFFtMUJ6bVlqNUl4?=
 =?utf-8?B?a3NBKzlWVkF6c3QvamJUR1NQazZZRWV1NnIrVEhiZ0RGcjVMbVRtQ25IdGRi?=
 =?utf-8?B?SitZOWIzQ1V2N3JNQUlaSXhMSENYTzdIajI5aWlKTWZBU3F3ZXhrTVc4dkNU?=
 =?utf-8?B?UWRjOE5rUjl0OHZsNHFTcEhlem9yQjNZcUllRCtMeVZ1UUNJUVFTNC9jalFK?=
 =?utf-8?B?dEFsQ2duZTg1ZGZ4ODUxU1htS01JZy84eVNlajhmYVRoa2tjaDRrenBDZ24x?=
 =?utf-8?B?L2FNUmM4VHBhNmgwdUR2bkJHYlVYa05rY0JrRWRxWC9uSnpTYXJaL3k1SDAw?=
 =?utf-8?B?NXV0SnpDbENzRTRpNGJIS2dtVHJIeTA5bGpBWFNnaS9iR00rdEo3L09XN1ZE?=
 =?utf-8?B?ZlFjcTVDcFNtanBuajlUSGk4MGVlcVkzTmxzb1gvV3BOTUlXbWIyTTZDcmFI?=
 =?utf-8?B?Q2YyMWhiMnRFdXJJZDZTRkp1ZFRWQi9iby9oL0lLMldTMmtzM2R1RDlYNW0z?=
 =?utf-8?B?cmg5M2Vmdzk5TFlYRng4RGdNS0M4OXgrckExUlk2bXdMZFpwMUhwVVFDQk8x?=
 =?utf-8?B?RFVXTVZVYm02aFk5a2hCbmhjU2xDUC9RVmZBT0w2RGp3YUdTQU9HaVhKWjll?=
 =?utf-8?B?VHM2WHYwRlRGcUs4dkMvQ2JVTC8xTldPVXI2YmFETG1BTkRqTmxXNkJKd29H?=
 =?utf-8?B?RHdmeURXZ2ozNHE0L1lUUT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZG5WeUNaclUvc2tuTmFhVEJTekNtRlZQVGsxWURzYUFsWDBhOFd2WWRHdmVJ?=
 =?utf-8?B?QWJYU2pCVnJncFpEZURFRExqYU1VcmhzbHNsZFFrWWJVeHByY3ZNRS9JYk03?=
 =?utf-8?B?WGZ6Qmt0OWM0bnJSd1oyS3RFUWtTSVU2bnQ3QkFwc0YxbVh4NUVlalgyTC9a?=
 =?utf-8?B?aWJoQ1JyNnlGSWptRzBBUUxEeHkxMkluOVkxK1Vab3FVUURJQVRJRHNHb0V3?=
 =?utf-8?B?aG4xMWxvcElIbDdKOTR4VlFmLytHQS9iL2tHamNTT2k0NHlzdlo4RG42TE15?=
 =?utf-8?B?NlZxVW1pRkdjdlJDRTl3WDF2SldvMk4xN2JyNmswUjVScmV5amxIR01MUVFv?=
 =?utf-8?B?KzErbGZadnVGc2VZSXpyUjEvRkhZTHdjbElCdmtYdkt0RDdPV3hSVjFabm04?=
 =?utf-8?B?VkRTTTZqWE1tVmhxb2U2MHIwQXdFek10YW5nRUZJUGNlSHhQYzhiTVNKeUhx?=
 =?utf-8?B?NDhQWjZCNjB1YjUxemJKNE5uWDYwNE4wOVNsYjBnaWdINDk1cHZiWWtpQ2U0?=
 =?utf-8?B?K0FxYUtHZVZTNzBUQzdyMkZHMnU4TFM3Snh2eTZnSDdIVHZ2WnR1eUN4aGN0?=
 =?utf-8?B?WmttczlCR2R0cU9VTWc4RGVMWVUyMktoZlVzUzdTMkx1dXlqT3Zmb0Q1ek9H?=
 =?utf-8?B?YWVUVjJ0VGxiUXZhY09JektJbXVER2RIRHVWMFFoaGNVTWZwYzJrZDg1aVIv?=
 =?utf-8?B?elVIUUwzL3RrTVFVTGRVSnJ6ZVo5QTVvQ01YS0NLRkdYQzJiWmo5Mm0zQUs0?=
 =?utf-8?B?U2hHREFoRnQ4eEplbStkblRpdjA4SWE3RE52R0VyT3JnUTFWNy9Ya0U2NmZx?=
 =?utf-8?B?SDJlRmJSdUNFMXFFU2doN1EwVlJTL3NLaEpZWS9IL1ZhVzkzZmNSSjU4RUds?=
 =?utf-8?B?dmt4UnRpQStSaEN5bnBvay80Y3Npd2lCaTdXS3YvU2tzanUxNnVIY3QxNEt6?=
 =?utf-8?B?S21hd0ZQVTJnQUF4eU0xRG52cllzUTNSc3BBUGFKekhiMlV0ZUlGVWtyb0Zs?=
 =?utf-8?B?Y2U4TWp1NnBNby9DUmpYVlJ1ZHIzVkRkUGsrY1BFb1BuK3hKNWxReFFvWWxz?=
 =?utf-8?B?aDlFWFIwTXRXNmRKT08yalB5Q2RqelZvQ0Q2LzBjcU1qdXNMZUZ0aGJqMjdj?=
 =?utf-8?B?RWpUdkh3SCs1Z3JncEt4VHpsMzNFMFIyU2k4a3NKM2pZZmRENlhUZXlicjd5?=
 =?utf-8?B?NTk3RzIwQ2d4T0ZPOE9pNi91ZkpnSnNwWFF6eWZCOUJVbUE3QkJDRktzbWE1?=
 =?utf-8?B?WjVvWk0xRjRIclpOQ2hkcktiVkRDd3d0eW9vQUIwanExaFZ5Nk1qMnQ5eWxL?=
 =?utf-8?B?dFdGMzVZVnVNcWRZMVh6a0hOU1oyYS9WRFRPdW4wNno5SFVMY0tqZG11SWNh?=
 =?utf-8?B?emwrQjVvbTFOaGtjT3Z5aW9YWDNkN2dqdFNMbnVheGZVdDFKbVhvVjNDbWVz?=
 =?utf-8?B?aVVuUEhtVEsyK0N1SXE2empOUVkzOG0vUlhiYTBGWHZ0Vld5V2cvNmtHenFp?=
 =?utf-8?B?MCtwZXRROGtBenU4MHp4VHNaWGtyeDdmNTQvaGFodVBtRG5tTDZxM0xOTEFT?=
 =?utf-8?B?L25iZlVYcUlhcGY0bGFOdG5senJSbU40bkMrY3lBelE1MmdJc2EvM01GVGFS?=
 =?utf-8?B?aCtkNFVuK0tQWjEyNitEdFcrYlhnVXEwL0tiVkg3NURzZEJFWGI1eVZ6K042?=
 =?utf-8?B?dlFva21vRzV1YXBUYjMwWTBXL3paa3pONVVUV1ZvN3k4azA2dWNQNmVFZVQ3?=
 =?utf-8?B?NEh2b3IzcWZyZWxNMWJac0FISTcyTStESnZaWG1QRkM5bjZneDhFbnh4elRX?=
 =?utf-8?B?R2RxOU12YmNaOTZSRG56aTFhcEhCalA3RHJyWUxJaktKb0IwQnBnRmUxaUQy?=
 =?utf-8?B?SDFmVVVFTkVTbzFPYndDa3orYUNYc2Zyc005Z3dYengrZzlBNjNabENiYWRJ?=
 =?utf-8?B?M3dUUzZLT3g5Z3FIN2FrWjBKdEp6dm9YbFNMeUZCK3FqSTNETnVyWDR2dVF3?=
 =?utf-8?B?dEw5MDJsNThOTndsS0RJbGtWaXhnVkN6dTRJcU5jalhjRkVCcXZtUzBmOVd4?=
 =?utf-8?B?eDBRZmdXSUJnM2lJaU40dE43RGxZbWhGWHBGWkZRUXFLek1pUGlzelVVRFdp?=
 =?utf-8?Q?98Kg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a995bf32-ae08-4c74-1179-08dce1efba7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2024 08:04:52.1720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QN30oHOClUg1gxsFZhZ6ca4ceVg5O7tAQ7SbYGWzMFq2bsDQYlLX1ACIpz3WEURVf3QvHR4UCi24Ux5gAIBj2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8115

SGkgQWxiZXJ0LA0KDQpGcm9tOiBBbGJlcnQgRXN0ZXZlIDxhZXN0ZXZlQHJlZGhhdC5jb20+IA0K
U2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMjUsIDIwMjQgMTI6MjAgUE0NCg0KDQpPbiBGcmks
IFNlcCA2LCAyMDI0IGF0IDk6MDjigK9BTSBBbGJlcnQgRXN0ZXZlIDxtYWlsdG86YWVzdGV2ZUBy
ZWRoYXQuY29tPiB3cm90ZToNClJlc2VydmUgZGV2aWNlIElEIDQ5IGZvciBtZWRpYSBkZXZpY2Uu
DQpDb21wYXRpYmxlIHdpdGggdmlkZW8gZW5jb2RlciwgdmlkZW8gZGVjb2RlciwNCmFuZCBjYXB0
dXJlIGRldmljZXMuDQoNClNpZ25lZC1vZmYtYnk6IEFsYmVydCBFc3RldmUgPG1haWx0bzphZXN0
ZXZlQHJlZGhhdC5jb20+DQotLS0NCsKgY29udGVudC50ZXggfCAyICsrDQrCoDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2NvbnRlbnQudGV4IGIvY29udGVu
dC50ZXgNCmluZGV4IDBhNjJkY2UuLjZkNmIzZDggMTAwNjQ0DQotLS0gYS9jb250ZW50LnRleA0K
KysrIGIvY29udGVudC50ZXgNCkBAIC03MzksNiArNzM5LDggQEAgXGNoYXB0ZXJ7RGV2aWNlIFR5
cGVzfVxsYWJlbHtzZWM6RGV2aWNlIFR5cGVzfQ0KwqBcaGxpbmUNCsKgNDXCoCDCoCDCoCDCoCDC
oCbCoCDCoFNQSSBtYXN0ZXIgXFwNCsKgXGhsaW5lDQorNDnCoCDCoCDCoCDCoCDCoCbCoCDCoE1l
ZGlhIGRldmljZSBcXA0KK1xobGluZQ0KwqBcZW5ke3RhYnVsYXJ9DQoNClRoZSBpZCA0OCByZXF1
ZXN0IHdhcyBtYWRlIHNldmVyYWwgbW9udGhzIGFnbyBpbiBNYXktMjQgZm9yIHVzYiwgbm8gZnVy
dGhlciBpbnRlcmVzdCBoYXMgYmVlbiBzaG93biBvbiBpdC4NCkJldHRlciB0byBhdm9pZCBob2xl
cyBpbiB0aGUgZGV2aWNlIGlkIGFzc2lnbm1lbnQuDQpTbyBpZCA0OCB3b3VsZCBiZSBiZXR0ZXIg
dG8gdXNlIGZvciBtZWRpYSB0aGF0IGhhcyBpbnRlcmVzdC4NCkFkZGVkIHZpcnRpby11c2IgcHJv
cG9zZXIgdG8gdGhyZWFkIHRvIHNlZSBpZiBpdCBpcyBzdGlsbCBpbnRlcmVzdGluZywgaW4gdGhh
dCBjYXNlIDQ5IHNlZW1zIGdvb2QgaGVyZS4NCg0KR2l2ZW4gdGhlIHZvdGluZyBoYXMgc3RhcnRl
ZCwgSSBhbSBub3Qgc3VyZSBpZiB0aGUgcmVhbCBpZCB2YWx1ZSBtYXR0ZXJzIGFzIGxvbmcgYXMg
b25lIG9mIHRoZSB1bmlxdWUgaWQgaXMgcmVzZXJ2ZWQuDQoNCkFuZCBkbyBub3QgcHJlZmVyIHRv
IHJlc3RhcnQgdGhlIHZvdGluZyBmb3Igc3VjaCBhIHNtYWxsIGNoYW5nZSBlaXRoZXIgb24gbXkg
bGF0ZSBvYnNlcnZhdGlvbiBvZiB0aGlzIGhvbGUuDQoNCkkgdGhpbmsgd2hlbiB0aGUgbWFpbnRh
aW5lciBtZXJnZXMgdGhlIHByb3Bvc2VkIHBhdGNoIHRvIGFzc2lnbiBpZCA0OCwgc2hvdWxkIGJl
IGZpbmUuDQoNCk1pY2hhZWwsDQpBcmUgeW91IG9rIHRoaXMgd2F5PyBPciB5b3UgaGF2ZSBiZXR0
ZXIgc3VnZ2VzdGlvbj8NCg0KQWlzaHdhcnlhLA0KSXMgdmlydGlvLXVzYiBzdGlsbCBpbnRlcmVz
dGluZz8gSWYgc28sIGNhbiB5b3UgcGxlYXNlIHJlcXVlc3QgZm9yIHRoZSB2b3RlPyBTbyB0aGF0
IHdlIGF2b2lkIHRoZSBob2xlIGluIGRldmljZSBpZCBhc3NpZ25tZW50Lg0K
