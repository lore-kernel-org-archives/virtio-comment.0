Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D901C7660
	for <virtio-comment@lists.linux.dev>; Tue,  3 Sep 2024 08:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725353762; cv=fail; b=d+5WY4obRQerJVslvhhURuM09omgv40dAM0ppHpxDHqp98h/WhDawydQjN2CesQHPDmAhV/oIOLqXWEF/OTMqpiXgBa1Jly2WgDNHGzchwuWBuznThXuoGvYyvOZ5/0qBC5Lj8WddXknxG8Jd67oq8So6DLIocEFMq5SMAtIDrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725353762; c=relaxed/simple;
	bh=hSlORDsDdwWLtvx3d35fZl3GDN24AV1HN9HZXIysDDE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N9b5yCHJ9V1fvJQweyR7k/bJBKYr+ezjTT6T94eSHlnf2/X5KJWFLqX3Jkw/CJUcRAiJ0LX6LWOEHI3tYDVCX7nIp2fGh5dXs+osQhASlrGMwmC+BylhEGJXog0fdIyo81Iq/ZmmFU4kqxvtQkV8uPgeMd4msElNKIwSJX0zoTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Tb8S29oQ; arc=fail smtp.client-ip=40.107.94.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Tb8S29oQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YF89upLOdpQ4mEbSN4ASXGfH+SF2xnKLdkM8XLiTr5FApP1cUv0qfSfU8GwtxfS9RVuEjgcMXFX9wxXfD8dm6J8h2ltOTPyrrSInpSQqNdbDfjoYwdjC2nRwucVvCzgfKb8xcB1pz1r9AVhTEKMPNkrVOOhemEZzioWj4leHyv73BXKNzEFm5oZt82Vxh/cX6yS0xl3WFtxO/GVEBOR/fx+ITHksXIMrrYtd+fTLXg53dYehGoYxIq8VEQER5k6UiC4dCnilbiuW4UbZu5M1W1LWTF5Y3T5b+h0AjHWSFOfUTvoanEie4/9JvX0HActtjNUeE6QYZ5zZbr1qzQdKOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSlORDsDdwWLtvx3d35fZl3GDN24AV1HN9HZXIysDDE=;
 b=T2x/6L9p1ig3mKE3Zewy8yavehaHOv/9/KuVelyiFZZCSQ8aKD4Lua+fDkOjy7kaHa6hgzxUVOjHHksQDvdDUqPJWCdQrFCBeg1giqMCDhcuTiy72DbrXAm3JAhfSpaGCpSwlB+5jfvR+GC950vSwW9WuVtQZlc2yFYZIeDyYDAdgwc456j1FlTCTuSQbeQIiPoHiZxYEvhkTGcG7cSxT2QID99yMWXm4zVRHJTfnPKhILkDPEcfyFtlw+IFjxPWr1J7siOsXgLkeUDOTzt2NxRHABcBDiFmvZxN7XKP1C4ldqJ7goujS83gdZr5O1u6cA7SR00Nq2DV/Z0Vm2GadQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSlORDsDdwWLtvx3d35fZl3GDN24AV1HN9HZXIysDDE=;
 b=Tb8S29oQt78OhHSZea+FEikwGGJEPhs/VAaMHxJLaxsByvCy7DkhwUuDRYsULjk8yXOfgEq1WcGTrf0szAzLR7WUJxNnysbUsFwhtqOx3VJN5K7SmsaZcB5fNgd1BRCghpCK+EV+nE35kqQZwNCfcsGvfYB6zPumOYebqRQvNM5ZrG2lheEt+pYLiiTAc4/GmdswlicKmG2uBlWeolT3qpySHkYmKg5wXJeWqzlQJw2AxkXL/SbJnyYWo7eHL05XsOrSwOYEsWO6qF7HRHY6dD3pcAUhrF/U26oF7+H12ZBKhCwlR92QVTU1vL0b6xrrlkSTUsboVDhWNQvbpiOn9g==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by DS0PR12MB7748.namprd12.prod.outlook.com (2603:10b6:8:130::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:55:54 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:55:54 +0000
From: Parav Pandit <parav@nvidia.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: "cohuck@redhat.com" <cohuck@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, =?utf-8?B?RXVnZW5pbyBQw6lyZXo=?=
	<eperezma@redhat.com>, David Stevens <stevensd@chromium.org>
Subject: RE: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Topic: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Index:
 AQHa5Ab4bEzmpQ/mGUCtSlfq0w80E7IkrTCwgAASmgCAAAEvAIAABvOAgAAF6HCAA2yqgIAAAXfggABFsQCAFsFYgIAACOMwgAao8gCAAABewA==
Date: Tue, 3 Sep 2024 08:55:54 +0000
Message-ID:
 <IA0PR12MB87130028564C3B173C2719D6DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
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
 <IA0PR12MB8713FA354FBC958CAA85BD80DC972@IA0PR12MB8713.namprd12.prod.outlook.com>
 <3bbab011-d4b6-463a-a092-cc3d4535cdc8@amd.com>
In-Reply-To: <3bbab011-d4b6-463a-a092-cc3d4535cdc8@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|DS0PR12MB7748:EE_
x-ms-office365-filtering-correlation-id: c734ba8b-d560-44c8-a62d-08dccbf6386d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZEovR1B2SUJKNWYwblN1TVVZbG5iL2d0UFhIbGEwVCtBelhEVW50TGpIVVFh?=
 =?utf-8?B?bHdjK0FoMUhTV2pUZEtpZko5T3A5eDM4bzZ4TGUrcFpsbDRIaUNPcGRxRXNl?=
 =?utf-8?B?TWNQdngvRzVPelpyTlBxMmhGQzA3Z0VoSVltL2lFRk9pSWNMMDdCUk5QTG4y?=
 =?utf-8?B?NE4zUy94YkUvdFpzZlJoZTE0Zmk1OXRiUzY4NmtsejRLRTN6OUMza3I1OU8z?=
 =?utf-8?B?cXRmUGZYNGhRNkxFdmRxaStCemROeWZMVFpRWTk3c3N6WmpwZG5FOUtxTlhD?=
 =?utf-8?B?OTVIdXl2cE5sZlNjcU1OUFhmYm9tUXVpWXl1VUlldThIV2g3OWttWUxNVXNN?=
 =?utf-8?B?bjJkMkM1WXp2bHU5bDJUbG1wRzZlek1zZ05BVWtlWkRKZXFxVXR1NWFmVEdK?=
 =?utf-8?B?UDFTU3BjYmQxcG5hSkFzWEd3WnAvZnF5SnJNazlXRjY0YU1yMUF6MnhuVmxJ?=
 =?utf-8?B?QkJXSVVPR1pqSGZsN3NUczk2SmtPSk96R3V0ZXFqOGU0bmRIVVVrMWFJYzJZ?=
 =?utf-8?B?M1lkS3hZcWdJMkVWYXpRSmUrcTQ2c3FzKytZZXZhMmFJaXZKOXF0OG12SnpV?=
 =?utf-8?B?dWhZUTNBZmxlaHNrT3NXK3F5VnUrbW4vTlhQR3kvMStTUHRrQzJJRDVwUTE4?=
 =?utf-8?B?RnVZYm92c1Y5TTIwbVRITHRKb3RqRlFQdFZkN2lmbUcrYkR1UStZYk9UOEdp?=
 =?utf-8?B?c0xNKzdwNHIrZkpsZE9YQXRtMkZxZE9WdlBVRElMMXZUcE9EQTFPT0hTZ0k0?=
 =?utf-8?B?Q0R5bndrUlluZk1MRDAzdkZRZDJDeTc4Q280MVpmT2xTdUp2RXZkYlkrekFx?=
 =?utf-8?B?dXNXaUs4VUwweXlLdWJmY2lWc3ZaeHpCOGE5bHUxZ0tKakN1RTExRUpSbHg0?=
 =?utf-8?B?VTNpQU5kZUQ1UXM4YS9CYjRmMHREK0c3aDlhRHhlWVp0ME9mUTFvby9pYjZu?=
 =?utf-8?B?dGNTTzZ6b05RWkdpMXdxUmJvc25tR2p5OWFYR1pqN1djQTRmZCtwbnlqemd0?=
 =?utf-8?B?LzRRZHB1T2g1Q1FJWWJmem03YWRla1FLazFrTHdlY2VRUlpZK0w0RERQS1Yv?=
 =?utf-8?B?MlpHQzdyNEJYell0ay9EOS9mS3RZK0hRMjNqaWJ0UHM2WWhKeHR4bzZkRGI5?=
 =?utf-8?B?Tm9CbzhHYnZxNFhNbnZ4eFVvZElYZjcwdDNkQ3NHbm1CdUJpOHp5RXVpcXZM?=
 =?utf-8?B?OFdSaTNqbEhuY3R0cVpUUDErMGlkT3BnNCs4MTdxNnlPSS9rUVpGdWV4THVT?=
 =?utf-8?B?QUVpQkpRTUFUc2o4N3FBMW1IMjNwSVIrcGpuTkV3cUE1WlF3UTI2cVM1TDh1?=
 =?utf-8?B?ZjJ4a0hjN1RXUHZNMm1wVzVoZ3k5YlNCWFdDWmwxR0MySk0ybUlsQ1orbnJm?=
 =?utf-8?B?K014RStDUVBpSzVyY2ZBNU1jcnhybytBNlpPOGpZeHhuMkVoYzZnbDg4Zk5E?=
 =?utf-8?B?ODQ0QnNQTk40bEd5c1N2WnIxZ2JqdTJ4aDdZZEpNUjllbGhSWXp4R2N6T1Vn?=
 =?utf-8?B?YytqMm02VG1WY2U5NXJRa3RRemZXN3QxNmR1dk5KUGlic1h3UFdscmhqWDVr?=
 =?utf-8?B?TVNDUTJmTlE1SkE5QXoveGg3aEpZM0FuWWRDMjh4SXdZMW02TnFYY2hJc1I3?=
 =?utf-8?B?SzZmMHBmNFVzRjNWWERQN2p5S0xvNmsvdHZFajgwRkdyZlJjZWJ5RkpYdnJS?=
 =?utf-8?B?N3dmZkpIZFJaRHBrUkJiODVoNWdGazBvWU9mOHdEZE1BcEhZaDNxaVBxSFVT?=
 =?utf-8?B?V2VwOE1lUzhYVUhCQjNHUTh4em5DTFpNbXU4Vy9Tb3VLd1JNbWZnOVM5dEJF?=
 =?utf-8?B?NU8wQUN6M2V0V2dvSmNNQWlUMndZN0VsaHp1MEU0a2loVlViRFNqbHZoc0hj?=
 =?utf-8?B?QXdxNm5OZnl3N01WWXNLbTU4RHpCSlJXTG9qVjc5dllsamc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NzRMNXZ6azU4ZkVWME9TQ1VwN3FSZmRIRllGQmZQQ09QNTVxSjRZaHgxMkc2?=
 =?utf-8?B?cnJTZDJzaVVaZHU2Qjg2SC8zelU3aHJYL1hwWmMzdTBKVDVXaHhDYTFKK3Jo?=
 =?utf-8?B?ZFp5NUhTcDVoSExmdElyMWNGWmJMa3F6R0UxSDRzcVpzREJQTWtYN29udlBM?=
 =?utf-8?B?Y2R2MmlJMWR0ZXcwa3FZbC90b285MjIzMnZ4aVJqZkZ3ZXY2eTFEcjdyMFEw?=
 =?utf-8?B?MWMyUFlLbE83QXVTZnI0Y0E0WHlrS2FBN0YxL3pOZWVuQXhPZEs0VitLTkVy?=
 =?utf-8?B?MkE4Ulp1RDQ5K1FLUDk5dzJ1bzU1UWJkWWVLeXlaeUxxazZYYTdtOXJQLzBN?=
 =?utf-8?B?Y1hSYWVodjFLN1ZqNFV6TUU2QTdIREZYRTJDQWdDeDFmOXdYanVFdW8vUXkr?=
 =?utf-8?B?aDVHbE1Ia0xIQS9QZjlBYWNDZjNkMkRGakp2cXo0bjdBRTNINEx2c1hBWllJ?=
 =?utf-8?B?T2Y0Njl5YitmN1RTSUJ5OGtOZWdxNkFINnpCc2sxeEp6NEZXUHpGWlMrNC81?=
 =?utf-8?B?UEJzQnorWGQwdDRiVVRmZVZ2UUh5SEFSRnUwZWY2MEZjMWt3UUp4NWlZa1pr?=
 =?utf-8?B?elUycFo4SzdnbmxYTEhDNC8xY0ZnSnlJV0VKREp5aEtha3oyYURoZXRuZGZW?=
 =?utf-8?B?U3lpeTJUeW5GMzVwQnUxemFLbGFLNitKK2dLQ0pYZnVUUjZUOEpzbFpBTlN2?=
 =?utf-8?B?Znh2MFV3YysxQktRR0YwRTJ3YVlQclZBZTE2Q2RsZUZ5UGxkUWIrQWhTODds?=
 =?utf-8?B?ckdSMnExSi9CUDJPTFFodjVrUzVEVXZYNFpDMDJBZ1AwODFXMEFzV2xoSTh5?=
 =?utf-8?B?d3JpUStBYkgxTHM2c3NxZU5wOHNVbVdpdVRWalFPVVRiM0QvbmcxWmVocU8x?=
 =?utf-8?B?NHZRa0RDTWRRM1p2Rml4UnhPK1loWTZsY0NDaVFRMHR6UDd2Y0dGdzNXaGpw?=
 =?utf-8?B?TS82L0Zta2NXbUlkZ0VJSEszc3VxMXEwdmdPYUhyUjVHYzZuWTI3bXFKczVQ?=
 =?utf-8?B?SFNCbmMwd0w2VkJaV05FRGNoRWFhaWJoc0hZeE5VWTRzZ29lUWo1M1l6UWdw?=
 =?utf-8?B?dFgwNzZmMUNpYnJ5aWtRa2ZuaERCQ3VxRUQxcXhpQ21KMm1FYXlzTExJOXVq?=
 =?utf-8?B?aGNVY2I5Si92OW5Qb1FGK1BhNTV6OW4wZWlOVU9vaFh3NU1ES1ZHYlRONDZs?=
 =?utf-8?B?U1JzT1l3R0t2cU9obktGOVZtRDBnT1lYUzJ5VHRCMDRsZ2x0c01NQ2QvTlhp?=
 =?utf-8?B?UTRKdzg5UjhLRHo2TUR0aWtWWkRKMHdrWGx3czZ3aGJ4Z2NXNWYwNGh0YmFk?=
 =?utf-8?B?d2RjK2pOUE8ybS9heE5haWszdjBGZU1PRGtsRWVySXpVSSt3Q2M4TUVRQ0FJ?=
 =?utf-8?B?cWlPSCtiWUFQNkJHQWN0Njh0L0dhNG1zNmxTSHBkWFJYRjJMYmQweVNnYzN2?=
 =?utf-8?B?ekt0ck1TbzMxRlZFYTZ1VTZsNnB2S1RENHg0VW5KMHZUUzZobHFZOS9RU09L?=
 =?utf-8?B?TjBnTS9YQ2xZTWI3U3Y4WE9aT1Eyekd5dmxwV0Zad1B3eEhLb0F1T3MyU0Q3?=
 =?utf-8?B?Y05QYzNyNndNZHQxT2Rxa1BPYWFINGg4N0FmQVNTOXJWM3ovQkNWNy9kVkQ1?=
 =?utf-8?B?WkpTWkNvUWQ3cnBhbDZGaWY4SyswTlJkd2NMZXRVaHZPOVB3amp1TUdTYzdm?=
 =?utf-8?B?TURXeWVMbjhZT201STR3dFpXRUFRVHNnTjEvRzAyL3A4N1NvYUMrNDBBU0VE?=
 =?utf-8?B?UGVzMy9aL05Ya3JJbGZ1d250bmJKZWRBTTBGZisxdldrcWxnUHp2YWVwQ0lW?=
 =?utf-8?B?aHpIUzhNL2MxaXcrWWxGNWdpN1owUS8xV1JQcGoxZnJkeWxFbUlOOVcrT3VV?=
 =?utf-8?B?SHZLNkpROUlOazlRempweGZ6VzlpSlMvckVMY2dCa0o4VHVSV3ZCV1puMHkz?=
 =?utf-8?B?V0ZvbTcyek5qNkhvUFJlZEQyZzhtb2hRWGk5a3B6THB6RFNBOXF1LzlBV3VS?=
 =?utf-8?B?SVFQbjFFSzBUV1hzT2pDN1BPYnpDN3I2ak5MemprUmNtUXlubzVVN2hsWDBJ?=
 =?utf-8?B?bFIxSVZpQlc2UXErSFFTNXFUOThhbGRJRVJBOFYwSHBscUZmcERFT2FwZ1Q1?=
 =?utf-8?B?NkdtS20zT1lSdG1aZkdHeGg5VHNLZ20yUlBabEhWY0dGR2w3RG9KVnE2d2lE?=
 =?utf-8?Q?HIB8ToXCNmqAobdP7gIC2Ud8mLq10dqSMIfoexo8l9JH?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c734ba8b-d560-44c8-a62d-08dccbf6386d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 08:55:54.8379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dohiDsBlOlC83nVAxIOJ5SHS73Ydf9ZtLKEY3TM10RVwA9a4QtSIZGEJ5JVmJcdjxDimnkDvluInv/hfvyn27A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7748

DQoNCj4gRnJvbTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAYW1kLmNvbT4NCj4gU2VudDog
VHVlc2RheSwgU2VwdGVtYmVyIDMsIDIwMjQgMjoyMSBQTQ0KPiANCj4gDQo+IE9uIDgvMzAvMjAy
NCAxMToxMCBBTSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+DQo+ID4+IEZyb206IFpodSBMaW5n
c2hhbiA8bGluZ3NoYW4uemh1QGFtZC5jb20+DQo+ID4+IFNlbnQ6IEZyaWRheSwgQXVndXN0IDMw
LCAyMDI0IDg6MDcgQU0NCj4gPj4NCj4gPj4NCj4gPj4gT24gOC8xNS8yMDI0IDExOjA3IFBNLCBN
aWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6DQo+ID4+PiBPbiBUaHUsIEF1ZyAxNSwgMjAyNCBhdCAx
MDo1OTo0NUFNICswMDAwLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4+Pj4+IEZyb206IE1pY2hh
ZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+ID4+Pj4+IFNlbnQ6IFRodXJzZGF5LCBB
dWd1c3QgMTUsIDIwMjQgNDoyMyBQTQ0KPiA+Pj4+Pg0KPiA+Pj4+PiBPbiBUdWUsIEF1ZyAxMywg
MjAyNCBhdCAwNjo1NTowNEFNICswMDAwLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4+Pj4+PiBU
aGF0IG1lYW5zLCBQQ0kgSFcgbmVlZHMgdG8gcmV0dXJuIHN1c3BlbmQ9MCwgdW50aWwgdGhlIGRl
dmljZSBpcw0KPiA+Pj4+Pj4gbm90DQo+ID4+Pj4+IHN1c3BlbmRlZC4NCj4gPj4+Pj4+IEluIHRo
aXMgZXhhbXBsZSwgdGhlIGRldmljZSBjYW5ub3QgYnVpbGQgc3BlY2lhbCBjaXJjdWl0cnkgdG8N
Cj4gPj4+Pj4+IGFuc3dlcg0KPiA+Pj4+PiBzdXNwZW5kPXRydWUgd2l0aGluIDUwbnNlYywgb3Ig
aW4gb3RoZXIgd29yZHMgYnVpbGRpbmcgc3BlY2lhbA0KPiA+Pj4+PiBjaXJjdWl0cnkgdG8gcmV0
dXJuIHN1c3BlbmQ9ZmFsc2UgaXMgdG9vIGNvbXBsZXggZm9yIHRoZSBzbG93DQo+IG9wZXJhdGlv
bi4NCj4gPj4+Pj4+IElmIHRoaXMgdW5kZXJzdGFuZGluZyBvZiBidXJkZW4gaXMgY2xlYXIsDQo+
ID4+Pj4+Pg0KPiA+Pj4+Pj4gVGhlIHByb3Bvc2FsIGlzLCBjYW4geW91IHBsZWFzZSBleHRlbmQg
dGhlIGludGVyZmFjZSBzdWNoIHRoYXQsDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gMS4gZHJpdmVyIHdy
aXRlcyBzdXNwZW5kIGNvbW1hbmQuDQo+ID4+Pj4+PiAyLiBkcml2ZXIgcmVhZHMgc3VzcGVuZF9z
dGF0dXMsIGFuZCByZWNlaXZlcyBub3RfY29tcGxldGVkPShmYWxzZSkuDQo+ID4+Pj4+PiBUaGlz
IGlzDQo+ID4+Pj4+IHRoZSBkZWZhdWx0IHZhbHVlLg0KPiA+Pj4+Pj4gMy4gV2hlbiB0aGUgZGV2
aWNlIGNvbXBsZXRlcyBzdXNwZW5kLCBpdCBjaGFuZ2VzIHRoZSBwb2xhcml0eSBvZg0KPiA+Pj4+
PiBzdXNwZW5kX3N0YXR1cz10cnVlLg0KPiA+Pj4+Pj4gVGhpcyBoYXMgdHdvIG1haW4gYmVuZWZp
dHM6DQo+ID4+Pj4+PiBbQV0gVGhpcyB3aWxsIGVuYWJsZSBzb2Z0d2FyZS1iYXNlZCBkZXZpY2Vz
IHRvIHdyaXRlIGRhdGEgdG8gc2xvdw0KPiA+Pj4+Pj4gZmlsZXMgYW5kDQo+ID4+Pj4+IGRvZXMg
bm90IGhhdmUgdG8gZm9yY2UgVk1fRVhJVHMuDQo+ID4+Pj4+PiBbQl0gSXQgYWxzbyBlbmFibGVz
IGh3IGJhc2VkIGRldmljZXMgdG8gbm90IGJ1aWxkIHNwZWNpYWwNCj4gPj4+Pj4+IGNpcmN1aXRy
eSB0byBhbnN3ZXINCj4gPj4+Pj4gd2l0aGluIDUwbnNlYywgd2hpY2ggY2FuIGdldCB2ZXJ5IGNv
bXBsaWNhdGVkIGZvciB0ZW5zIG9yIGh1bmRyZWRzDQo+ID4+Pj4+IG9mIFBDSSBQRnMuDQo+ID4+
Pj4+DQo+ID4+Pj4+IEkgcmVhZCB0aGlzIHNldmVyYWwgdGltZXMsIGFuZCBJIGRvbid0IHVuZGVy
c3RhbmQgd2hhdCBpcyBwcm9wb3NlZC4NCj4gPj4+Pj4gQSBzcGVjaWFsIHJlZ2lzdGVyIGZvciBz
dXNwZW5kL3Jlc3VtZT8gSXMgdGhpcyB0aGUgZGlmZmVyZW5jZT8NCj4gPj4+Pj4NCj4gPj4+PiBZ
ZXMsIGEgY29tbWFuZCByZWdpc3RlciBmb3Igc3VzcGVuZC9yZXN1bWUgb3BlcmF0aW9uLg0KPiA+
Pj4+IEFuZCBkZXZpY2Vfc3RhdHVzIG5ldyBiaXQgdGhhdCBMaW5nc2hhbiBkZWZpbmVkIHJldHVy
bnMgdGhlIHN0YXR1cw0KPiA+Pj4+IG9mIHRoaXMNCj4gPj4gb3BlcmF0aW9uLg0KPiA+Pj4NCj4g
Pj4+IFVnaCwgaXQncyBhbGwgcXVpdGUgbWVzc3kgSU1ITy4NCj4gPj4+IFdlIGhhdmUgNCBzdGF0
ZXM6DQo+ID4+PiAtIG9wZXJhdGlvbmFsIChyZXN1bWVkKQ0KPiA+Pj4gLSBzdXNwZW5kIGluIHBy
b2dyZXNzDQo+ID4+PiAtIHN1c3BlbmRlZA0KPiA+Pj4gLSByZXN1bWUgaW4gcHJvZ3Jlc3MNCj4g
Pj4+DQo+ID4+PiBXaGF0IEknZCBkbyB0aGVuIGlzIGEgdHdvIGJpdCByZWdpc3Rlci4NCj4gPj4+
IFRvIHN1c3BlbmQ6DQo+ID4+PiAtIHdyaXRlIHN1c3BlbmQgaW4gcHJvZ3Jlc3MNCj4gPj4+IC0g
cmUtcmVhZCwgd2FpdGluZyB1bnRpbCBzdXNwZW5kZWQNCj4gPj4+IFRvIHJlc3VtZQ0KPiA+Pj4g
LSB3cml0ZSByZXN1bWUgaW4gcHJvZ3Jlc3MNCj4gPj4+IC0gcmUtcmVhZCwgd2FpdGluZyB1bnRp
bCBvcGVyYXRpb25hbCAocmVzdW1lZCkNCj4gPj4+DQo+ID4+PiBIb3cgZG9lcyB0aGlzIHNvdW5k
Pw0KPiA+PiBUaGlzIGNhbiB3b3JrIGZvciBzdXJlLiBidXQgaXMgaXQgYSBtdXN0Pw0KPiA+PiBJ
IG1lYW4sIHRoZSBkcml2ZXIgaGFzIGl0cyBvd24ga25vd2xlZGdlIG9mIGhvdyBpdCBvcGVyYXRl
IHRoZSBkZXZpY2UuDQo+ID4+IFdoZW4gZGV2aWNlIHByZXNlbnRzIFNVU1BFTkQgPT0gMCwgSXQg
a25vdyB3aGV0aGVyIHRoZSBkZXZpY2UgaXMgaW4NCj4gPj4gbm9ybWFsIG9wZXJhdGlvbmFsIHN0
YXRlIG9yIGluIHRoZSBwcm9ncmVzcyBvZiBTVVNQRU5ESU5HLg0KPiA+Pg0KPiA+PiBCdXQgaWYg
eW91IHRoaW5rIHdlIHNob3VsZCBhZGQgYSBuZXcgcmVnaXN0ZXIgd2hpY2ggYXBwbHlpbmcgZm9y
IGFsbA0KPiA+PiBkZXZpY2Vfc3RhdHVzIHRyYW5zaXRpb25zLCBOT1Qgb25seSBmb3IgU1VTUEVO
RC4gd2UgY2FuIHN1cmVseSBkbyB0aGF0Lg0KPiA+Pg0KPiA+PiBUaGFua3MNCj4gPiBOZXcgcmVn
aXN0ZXIgYmV5b25kIHN1c3BlbmQrcmVzdW1lIGNhbiBiZSB1c2VmdWwgdG9vLg0KPiA+IEZvciBz
dXJlIGl0IHdpbGwgc2ltcGxpZnkgdGhlIHN1c3BlbmQgKyByZXN1bWUgZmxvdy4NCj4gVGhlcmUg
c2hvdWxkIGJlIG5vIGRpZmZlcmVuY2UgaW4gaG93IHRoZSBkcml2ZXIgaGFuZGxlcyBTVVNQRU5E
IGFuZCBvdGhlcg0KPiBkZXZpY2Ugc3RhdHVzIGxpa2UgUkVTRVQuDQo+IA0KWW91IHN0aWxsIG1p
c3MgdGhlIGZ1bmRhbWVudGFsIHBvaW50IHRoYXQgSSBleHBsYWluZWQgbWFueSB0aW1lcyB0aGF0
IGlzIHRvIGF2b2lkIHNwZWNpYWwgdGltZSBzZW5zaXRpdmUgY2lyY3VpdHJ5IGluIHRoZSBkZXZp
Y2UgYnkgbWVhbnMgb2YgYSBuZXcgcmVnaXN0ZXIuDQoobm90IHRoZSBkcml2ZXIpLg0KDQo+IElm
IHdlIHdhbnQgdG8gYWRkIGEgbmV3IHJlZ2lzdGVyLCB0aGVuIGl0IGlzIG5vdCBvbmx5IGZvciBT
VVNQRU5ELCBidXQgZm9yIGFsbA0KPiBzdGF0dXMgdHJhbnNpdGlvbnMuIFdlIG5lZWQgTWljaGFl
bCB0byBjb25maXJtIHdlIHNob3VsZCBpbXBsZW1lbnQgdGhpcw0KPiBuZXcgcmVnaXN0ZXIgdGhh
dCBhcHBseSB0byBhbGwgZGV2aWNlX3N0YXR1cyB0cmFuc2l0aW9ucyBmb3IgY29tbW9uIGludGVy
ZXN0cy4NCg0KU3VyZS4gTG9vayBmb3J3YXJkIHRvIGhpcyBvcGluaW9uLg0K
