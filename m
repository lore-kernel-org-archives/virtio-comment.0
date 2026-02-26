Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010058.outbound.protection.outlook.com [52.101.61.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE47389452
	for <virtio-comment@lists.linux.dev>; Thu, 26 Feb 2026 05:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772085597; cv=fail; b=biIn5r3F3hYZDp/5P9psU73e7csutaB6Uj/acVlspwBkivZ7g8FzCzc/J37I4BCOQSMK1jOkoOPcmbKE0WhlGFbwhAedOTjeNzYX0roZ2WbwAOqaqhjn1KlwJpEfIeNhjnpNqMkD2t4bovl7GEQyde0xrteq4EoERh98S7ioWdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772085597; c=relaxed/simple;
	bh=vstgtbzHBthBrkMeDSUbLZsFQAMCGV0VBubByMpTtB8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Nf5ZNWFXxlRU6aQ8pP4wYOhV7MUREouQDhoAx8YpJ3YZnLJwhyhz1bIy1yMbS/VW21Z5Elm4O299aB5MYQ7rDToX3lijpgyNvHaivfGRvrgEScZ6IbGnzo9jB4LXD99D8iOPTGYCY4qb/Q8TKv8hCBGm7TnCqyuYEP+QMgneZU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b4jVmxZX; arc=fail smtp.client-ip=52.101.61.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b4jVmxZX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ex5QoycDXjJ1qJNTx0cdGEWWK+VrKrCrKCXl09LShQrxxuHdNKnB6UkktxpL55ornyQiThOQtVdIIgsqbLen6MbUSK6KnLq3RptprgeH69wsoy/rWdS9G/aSKRdNm2UV6kXWvzYzwTsNYMfuYJripRX9tR9aG+ncR5xDlGliC43/Gpx65S08MvQo5Nen/nl+TGhANHJum+K9IFD367TFX4OZHQ5glppCn8KekARgzhcRX++i86Ihdv44IuJY0mqYgD1TjfN8jzrzer70dycTf7o4gmeWYtwMsiCC7jrDrKxZ/Y2lZzAhcIW4VwzEqJnYyPI8dK6lh4bQwAJf5k4Jlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vstgtbzHBthBrkMeDSUbLZsFQAMCGV0VBubByMpTtB8=;
 b=nfabWYHDfsZ1ajnUVOR6gPvc4liJaP/JoXKcakJuzBD+3zO694hThaMy2j6s0NlVpxDFmJejOrpOcJs39Y4q6eFMmphDb4C371QALD0A9UBnrWG+v0et+mxUceQlhGp7r/i/k8g6wMCk9wq7cmP9EYuWUXFwCyunrOMKbFV4XwxElcmICRgQpoN5PPqC1HYDxaw7aUk3+tCkHi8NPqMsGW1mQib97SFhSV54HVIi6H7ToY9z91CSjgGGvKwThTGOM14NsOrTDRlGpIBH6GF3szGQAswD5/5q8kKr9s0OzUda6FT+BGkERTo9BV4Ikkj5ET2GdRdIPfbV5MR5rJ+2aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vstgtbzHBthBrkMeDSUbLZsFQAMCGV0VBubByMpTtB8=;
 b=b4jVmxZXLe9+D8mUDPpbCZkV1ko2pnTtgQpJ7BU7j72i/gOzOq4xjw/spHD6ZJFVDYkUFgetukq+olXBtfR6HM0gUisD5nWjy+hIEkF3xN4dWb8t9xy9tgOVZLH+aUzOLigr0X5NH4/d3YlyQGc2+hTW9CPcRtnSkhf6YTHrXVQuekmJ0OTktMFkucmxequAwCnYq2N2MAbemd5Dy0uyNPBvjPNUspPyXLaa2p+uyNSEmO7Mq0f5VOsxzbXrZwZcXq8i7GbH4sG3UrbT+J1dYvGCCOp1xjnHJ2XmuPMbmA9PFpDzIMmsm2VvNKFAvNOJnEfcirM2vTJ/Xp3Bk81Awg==
Received: from IA1PR12MB7591.namprd12.prod.outlook.com (2603:10b6:208:429::5)
 by MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Thu, 26 Feb
 2026 05:59:52 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by IA1PR12MB7591.namprd12.prod.outlook.com (2603:10b6:208:429::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 05:59:52 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%6]) with mapi id 15.20.9632.010; Thu, 26 Feb 2026
 05:59:52 +0000
From: Parav Pandit <parav@nvidia.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, "Bill Mills (bill.mills@linaro.org)"
	<bill.mills@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "Edgar E . Iglesias"
	<edgar.iglesias@amd.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: RE: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index:
 AQHcjuFu3dyU46FhXkWSoPS8nyUxT7WAvzgggAoZRoCAAGdhoIAAMZEAgAfGMQCAAAUmAIAAIlAAgAACG8CAAAYFgIAARRCAgAAB9wCAAAEjAIAAAL7AgAAEIoCAAABxMIAA8S0AgAAFdXA=
Date: Thu, 26 Feb 2026 05:59:52 +0000
Message-ID:
 <SJ0PR12MB680610CBC90E1ED27D61E1BDDC72A@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
 <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
 <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
 <SJ0PR12MB68068FA1D1893B774C5A8A15DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225094902-mutt-send-email-mst@kernel.org>
 <8B4F5FE2-1F80-43BE-A60B-5C24B69C8B4E@arm.com>
 <SJ0PR12MB680642C4277CBAC888052FDEDC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <u6crvmiyjbz4d7gokuegarg7d2c2krymfutzgtr26epzmv2ro7@5saaxv4agwwi>
 <SJ0PR12MB68066D1ACA893589E0675028DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <yogqvbadx7kqirie47fjmndlpgprj3jzoltdeuh2hzcpms3rcm@nlde6ernzinx>
In-Reply-To: <yogqvbadx7kqirie47fjmndlpgprj3jzoltdeuh2hzcpms3rcm@nlde6ernzinx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic:
 SJ0PR12MB6806:EE_|IA1PR12MB7591:EE_|MN2PR12MB4357:EE_
x-ms-office365-filtering-correlation-id: 5d721ffb-3aab-4855-04c0-08de74fc41fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|7416014|38070700021;
x-microsoft-antispam-message-info:
 Ek4AfW8L53XBHPnae+pPAHITtsQY1lN2SliCgn7PUwjTJ+x0IX+cgKtwqN2NPnn4PFjMuC9wcn3ikzsyqIvGDTEe8Tu6dgC6DQ4E7E4dC6ybrx7GczQAUoSSuAVB6fUz93puqTVhEZ2EOb2xENNxJ3HmshxgJ6wIRUGEnOemPoYiZGbmOcozc1P45jBJ96zus/AV4De5Eaqu+29z4iItd6AFLUva0hmjczoYuHZ4QH2QQZ0hafJKi1wAKtY2QeMgUOtzvnW1INN25vbegHUs7f+MAjIxl8XwBsVCwUEmtQcXDfOmmKqDCVU1knwRHAicJ3mavSV9SmRlDWhtIq0c6HqyExxHpFSm4gOctCUc7JA3t9uadVhbZvPQQN1u8GKVXjkVW3is6fGk837FSuIdSr+MiPG0BOk2NLWIiL9rOdnaMVm9aLAejJoDsnr4zj9teowS7JccqrtVRXvSBP3ixt6NP35STYFbPKa+zlr1j7kPZoaMd8o/+jQN7lFKldoM8bJPeECjafX/3LRXqeuYpQ3qJGmZFOufOYo5vfjmARYEaqocm/1X/7VJda1++CkhvR45hIb2RvqAjHU6ij7qyV2i0BrzpD5TnT1yJQyfo2wtmzH3BzA2dc/3dq1Efvz+sk3N/jhIiNd+R/L/N8DZLGiru+THpVPhIRr94XGnn1alytj4i/pWvgOLEJTrEqW9La5BNlWoKeEtJhdmx9qJbcYoRIOZXeoyYsQcncml0n3RtnIlLio3P04ZP+bvDZ5GS+gWQagFrPpyxMjNpTM+B/Sxt2dZ1tm47nRIw/Akdeg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB7591.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NDZ2aTJaRUhYZXoxZ3c3K0dueHZNdnpXdkdSVnFtZHlJejYzbjJNZHdZUWRw?=
 =?utf-8?B?Y0VMRVA2VkdLTHlUeGVoTEk4L1FXSDJ3NVUxbXpBdjUrNmd3UFBZeWZGVFZK?=
 =?utf-8?B?bkEvSUNUdS80MUNVMlFENFFVWWpKN3VIcU5OcTAraUVkeXowZ1dPS0twS1hG?=
 =?utf-8?B?M3BYZGpROXBUQkxmQWNDdXFRdlFHKzMzV2Zkc1VhaTQxdldVZEJSUVpOK2h2?=
 =?utf-8?B?RXNrODRGQklNVmFiWFYrQUw1a0tjanVuVmpPZTJJQVFpdXY1SDVqbndvM3JH?=
 =?utf-8?B?S1dNRzBjQWFGRTBzNDJWM2VUcUx1K3ZwK1JFUVpyZnExOVE3eEZMM2d0L3RT?=
 =?utf-8?B?V2JiYno3dzVzb2tGWUt0TnB5cVprVlJWbGZCbjg2Z05kWjZYaGd6L1dMallZ?=
 =?utf-8?B?ckE3WHNlMS9vT0dOR21vYTNNNGM5bEVMeWVyZUVXbXdrU2J4YzczRVJNRTQr?=
 =?utf-8?B?S0R2WnJUQm5SMWRseFVLeHBpbFRLNEZTeHkxSjJod0tRRWtoNTNUTEdHVWZ0?=
 =?utf-8?B?T3hQckxkUE8zR2xPR0JBa1lKMlVVSlhReGNDSk9ibXhXQyt2M096TlVqQjE3?=
 =?utf-8?B?enMrYVlKYzRQNlBlaE9TWFlwZURQYmhEanZ0d25zaUxzMnZqY1VFSzAvQVZM?=
 =?utf-8?B?L1FZVjlsUUtFVSt3MGgvdXExYWRkamdwRURBT2duYmtzWnU2a1FNV2ROZEg0?=
 =?utf-8?B?L2l6RWpDelNpemc4WWU0MkdFdlpGaGM5OHN5Nmd5SC9BZHp6Y1JWZWtOVmhD?=
 =?utf-8?B?bmZLQ0JCay96enV5dGpmNjQwTFZxY1NMYjhHSk5uaVJFUXV0T0tOeWwxM1dY?=
 =?utf-8?B?dUpkSWlkK1M3M3lwUkZMdHlIRmlXcUtnZVdWbVllc2I5VzZZWVkwNDZ5N05K?=
 =?utf-8?B?YnVKVXNxczRORkI1RUFmNytBTWxDRXMzYkUzekFzanVxYVkyTy83QXFTOVpL?=
 =?utf-8?B?M05lbDFlNlBYVkZ3MmdGdFdYdjhnV0tnSGt4Wm40NURtcjU4QlRJTFRhYW1q?=
 =?utf-8?B?YmMya3ZrN2FOME9rYUg3cWdHdjVEZWcxT1V0STgyVXQrSEwxbjVDc2F5Vm1R?=
 =?utf-8?B?RlpDeXRvRWd0cjg5V2JqNXRQR2JnU29XTEkxUmNFUDdOaUpHUHpVMjFQbUNl?=
 =?utf-8?B?K2h2cXVXeVRYUWFFVlJabW1vQkw4SUxlRUJvci8wYThQbzcydVE2N2tKMXpE?=
 =?utf-8?B?a2plTVJaM1ZaSFlUMVdtYXNwaWdwbFFhNjl3Skg1RGcxTFpkd2pwSlNPMVVx?=
 =?utf-8?B?eEhXTktZMXNaZU5XeHRGV0ZPMkpEN0xYYXlFcXQzRnpRU3Myc003SDBHUnlq?=
 =?utf-8?B?SGxXZEZBK3BLUlJ6OU44RTA2YW1UZXJaQ1YzQ2ZsMys1ZGpQekVOUDR0VDQx?=
 =?utf-8?B?ZTZIZHp3VFZDeXlaaDI0OCsxaXR0Qlo3U0RFb04yN1hPS3hibzM5c0N6MThi?=
 =?utf-8?B?bExLTWRFaTdEcVhCMDZoYjE2Y3FuSFR5VmhjL2ZtWnMwYlFTZE9SdlV2SFJr?=
 =?utf-8?B?U3NROTFyN2p2Y0tQb1dnQm1Kem90a1ZmQ3pMNDZ3alJpMUgzTDdOd0RmRlFD?=
 =?utf-8?B?RU9BakRjK2pxbWs5M1M0eVc0UnhyQjRJTDg4QVA2Y3Nyb2pCS2NuM1hLbm8w?=
 =?utf-8?B?aDR3UEgrOVpaN3I5WXltT1lXQzB3cnNkWXkycytIc0FDQnEveFU4b2Y2SzVP?=
 =?utf-8?B?UXR4c0QwMkRzRnowaVord1lJcnd0ZEdZcWk3WkVhY29wajVRbSsyN1hMYnE1?=
 =?utf-8?B?RGZNeFBPT1NMT2tycFd1ejlmeTBFa0hBYXZ1SjYyQWk3NlFaVEVQZFd2TW91?=
 =?utf-8?B?RkRPZmovQ3hXTUZ5bVdxOFA2RUdlQ1RHOEhVd1dHYlhlNjdnUkQ0blVTVnY5?=
 =?utf-8?B?NHJCaVJhY0pZQ1lKcENnNXV6eXMzRlpvdVJ2bldzUm1mcjNvZTFFOTlwS1ov?=
 =?utf-8?B?dXNDWEEvMGpRZ2p4d3ZGcGRycjMyNEIwdEoydFY0NmxDeG85NXlVa3dMU2t0?=
 =?utf-8?B?RXB1TWJOSUdqMmM0VjVjUzUvUFB2dGJPK0lGUEdGK2JQWUVuNndWUG1yem1X?=
 =?utf-8?B?UFpnVEo5YWs5SWY4RGZ3R0g2ZjdSeFFGOVAyMTdOZ0IzNXQ5SE5Wdkg1SkIw?=
 =?utf-8?B?MlZDSzNza0IxNTU1ayt5c0E3UUF6di9sRE91R1VNc1AwU3VIUUZicnBGajNS?=
 =?utf-8?B?SXJhVGdnbExWRFQyRVcyZHV5RWppbG0vS2ZPVDFuSjkwMUpYeGlMVzdTbUJl?=
 =?utf-8?B?TTZYM1owelliVVp3bDRQcURuam1GUHdpUTI2NjczcWszcWgybENESGF5WW1I?=
 =?utf-8?B?SFZwTks0NE9nZTJnUHUvRjUydlRXVzZtQmtqbmc3ZmQ2RzlxUUM1Y1hYcFJT?=
 =?utf-8?Q?Xa0O+WMtzWIM5ERBnlZN+PaksPxXUx+WJZoGf?=
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
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6806.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d721ffb-3aab-4855-04c0-08de74fc41fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 05:59:52.0323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a0tNq9zrBUqY29O2xoqbMmiviD66Njg0XmICLT8HrjFr2jqHOLkGxoPP7h/dS5KawP8Sb6wN2Cf3ayS1U5zN8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357

DQoNCj4gRnJvbTogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pQGtlcm5lbC5vcmc+DQo+IFNl
bnQ6IDI2IEZlYnJ1YXJ5IDIwMjYgMTE6MDYgQU0NCj4gDQo+IE9uIFdlZCwgRmViIDI1LCAyMDI2
IGF0IDAzOjE1OjM5UE0gKzAwMDAsIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPg0KPiA+ID4gRnJv
bTogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pQGtlcm5lbC5vcmc+DQo+ID4gPiBTZW50OiAy
NSBGZWJydWFyeSAyMDI2IDA4OjQxIFBNDQo+ID4gPg0KPiA+ID4gT24gV2VkLCBGZWIgMjUsIDIw
MjYgYXQgMDM6MDA6MTlQTSArMDAwMCwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+ID4NCj4gPiA+
IFsuLi5dDQo+ID4gPg0KPiA+ID4gPiA+ID4+IFllcy4gVGhpcyBtYWtlcyBhIGxvdCBvZiBzZW5z
ZSBub3cuDQo+ID4gPiA+ID4gPj4NCj4gPiA+ID4gPiA+PiBUaGlzIGlzIGEgdmlydGlvLW1zZy10
cmFuc3BvcnQgZGV2aWNlIHRoYXQgbmVlZHMgaXRzIG93biBkZXZpY2UgaWQgaW4gdGhlIHRhYmxl
Lg0KPiA+ID4gPiA+ID4+IEFuZCBpdHMgYmluZGluZyB0byB0aGUgUENJIHRyYW5zcG9ydC4NCj4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBvay4gaG93IGFib3V0IGFuIHJmYyBvZiB0aGF0IGlkZWEg
b24gdGhlIGxpc3Q/DQo+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEkgd2lsbCBsZXQg
RWRnYXIgYW5zd2VyIG9uIHRoaXMuDQo+ID4gPiA+ID4NCj4gPiA+ID4gU3VyZS4NCj4gPiA+ID4g
QWxzbyBwbGVhc2UgZXhwbGFpbiBob3cgaXMgdGhpcyBkaWZmZXJlbnQgdGhhbiBTUi1JT1YgZGV2
aWNlcz8NCj4gPiA+ID4gT24gYSBQQ0kgZGV2aWNlIHRoZXJlIGFyZSBzb21lIGNoaWxkIGRldmlj
ZXMgZXhwb3NlZCB1c2luZyBzb21lIHZpcnRpby1tc2cgYnVzIHRyYW5zcG9ydC4NCj4gPiA+ID4g
QW5kIGFsbCBvZiB0aGVtIGFyZSBnb2luZyB0byBzaGFyZSBzYW1lIFBDSSBCREYuDQo+ID4gPiA+
IFRoZXNlIGluZGl2aWR1YWwgZGV2aWNlcyBjYW5ub3QgYmUgbWFwcGVkIHRvIGRpZmZlcmVudCBW
TXMgKHNlY3VyZSBvciByZWd1bGFyKSBpbiBhIHBlcmZvcm1hbnQgd2F5IGVpdGhlci4NCj4gPiA+
ID4gU28gd2hhdCB3b3VsZCB0aGlzIHZpcnRpby1tc2ctdHJhbnNwb3J0IGRldmljZSBhY2hpZXZl
Pw0KPiA+ID4gPg0KPiA+ID4NCj4gPiA+IElESyB3aHkgeW91IGFyZSBjb21wYXJpbmcgdGhpcyB0
cmFuc3BvcnQgd2l0aCBTUi1JT1YsIHdoaWNoIGFsdG9nZXRoZXIgc2VydmVzIGENCj4gPiA+IGRp
ZmZlcmVudCBwdXJwb3NlLg0KPiA+ID4NCj4gPiBJbiB0aGUgZXhhbXBsZSBzaG93ZWQgdGhlcmUg
YXJlIG11bHRpcGxlIGRldmljZXMgYmVoaW5kIG9uZSBQQ0kgZGV2aWNlLg0KPiA+IFdoeSBpcyBp
dCBub3Qgc2ltaWxhciB0byBTUi1JT1YgdGhhdCBkb2VzIGV4YWN0bHkgdGhhdCwgb24gb25lIFBD
SSBsaW5rLCBleHBvc2VzIG11bHRpcGxlIGRldmljZXMuDQo+ID4NCj4gDQo+IFRoYXQgY291bGQg
YmUgb25lIHVzZWNhc2UsIGJ1dCBub3QgdGhlIGFjdHVhbCBkZXNpZ24uDQo+DQpJIGRpZG7igJl0
IHVuZGVyc3RhbmQgdGhlIGRlc2lnbiBwYXJ0Lg0KV2h5IHRoYXQgY2Fubm90IGJlIHRoZSBkZXNp
Z24gaWYgdGhlIGludGVudCBpcyB0byBoYXZlIG11bHRpcGxlIGRldmljZXM/DQogDQo+ID4gPiA+
IElmIHRoZXJlIHdhcyBubyBQQ0kgYnVzIHdoZW4gaW1wbGVtZW50aW5nIHRoZSB2aXJ0aW8tbXNn
IHRyYW5zcG9ydCwgaXQgd291bGQgbWFrZSBzZW5zZSB0byBhdm9pZCB0cmFwLWVtdWxhdGUgc3Rv
cnkuDQo+ID4gPiA+IEJ1dCB1bmRlcmx5aW5nIHRyYW5zcG9ydCBiZWluZyBQQ0ksIGl0cyBiYWNr
IHRvIHNxdWFyZSBvbmUgZm9yIHRoZSBvcmlnaW5hbGx5IGRlc2NyaWJlZCBtb3RpdmF0aW9uLg0K
PiA+ID4gPg0KPiA+ID4NCj4gPiA+IEV2ZW4gd2l0aCBQQ0kgYXMgdGhlIHBoeXNpY2FsIGJ1cywg
d2UgZG9uJ3QgbmVlZCBhbnkgdHJhcCBhbmQgZW11bGF0ZSBhc3N1bXB0aW9uDQo+ID4gPiB3aXRo
IHRoaXMgdHJhbnNwb3J0LCBiZWNhdXNlIHRoZSBjb21tdW5pY2F0aW9uIGlzIG1lc3NhZ2UgYmFz
ZWQsIG5vdCB3cml0aW5nIGFuZA0KPiA+ID4gcmVhZGluZyByZWdpc3RlcnMgZGlyZWN0bHkgaW4g
dGhlIEJBUiBtZW1vcnkuDQo+ID4gPg0KPiA+IFRoYXQgaXMgdHJ1ZS4gU29tZXdoZXJlIGluIHRo
aXMgdGhyZWFkLCB0aGVyZSB3YXMgbWVudGlvbiBvZiB0cmFwK2VtdWxhdGlvbiBhcyByZWFzb24g
dG8gY3JlYXRlIHNvbWUgbXNnIGJhc2VkIHRyYW5zcG9ydC4NCj4gPiBTbyBJIGRvIG5vdCBrbm93
IHdoeSB0K2Ugd2FzIG1lbnRpb25lZC4NCj4gPiBJIGRvbuKAmXQgaGF2ZSB0aGUgbGluayB0byB0
aGF0IGVtYWlsIGF0IHRoZSBtb21lbnQuDQo+ID4NCj4gDQo+IEkgbWVudGlvbmVkIHRoYXQgYmVj
YXVzZSB0byBydW4gdGhlIGV4aXN0aW5nIFZpcnRpbyBQQ0kgb25lIHdvdWxkIG5lZWQgYW4NCj4g
ZW11bGF0ZWQgUENJIGRldmljZS4gSSB0aGluayBpdCBpcyBhbHNvIHBvc3NpYmxlIHRvIGV4cG9z
ZSBjdXN0b20gZGVzaWduZWQgSFcgYXMNCj4gYSBWaXJ0aW8gUENJIGRldmljZSwgYnV0IHRoYXQn
cyBub3QgdGhlIG1ham9yaXR5Lg0KPiANCj4gT25lIHByaW1hcnkgZXhhbXBsZSBpcyBob3cgdGhl
IHZpcnRxdWV1ZSBjb25maWd1cmF0aW9uIGhhcHBlbnMuIFRoZSBkcml2ZXINCj4gc2VsZWN0cyB0
aGUgcXVldWUgYnkgd3JpdGluZyB0byB0aGUgJ3F1ZXVlX3NlbGVjdCcgYW5kIGltbWVkaWF0ZWx5
IGl0IGV4cGVjdHMNCj4gdGhlIGRldmljZSB0byBzZWxlY3QgdGhhdCB2aXJ0cXVldWUgYW5kIGdp
dmUgcmVzcG9uc2UgaW4gb3RoZXIgZmllbGRzIHN1Y2ggYXMNCj4gJ3F1ZXVlX3NpemUnLiBUaGlz
IG9ubHkgaGFwcGVucyBpbiBhbiBlbXVsYXRlZCBQQ0kgYnVzLiBCdXQgaW4gYSByZWFsIFBDSSBi
dXMsDQo+IHRoZSBkZXZpY2Ugb24gdGhlIG90aGVyIGVuZCBjYW5ub3Qgc3luY2hyb25pemUgaXRz
ZWxmIHdpdGggdGhlIGhvc3QuIEFuZCB0aGlzIGlzDQo+IHdoYXQgYmVpbmcgZml4ZWQgYnkgdGhl
IG1lc3NhZ2UgYmFzZWQgY29tbXVuaWNhdGlvbi4NCj4gDQpZZXMsIEkgYW0gZmFtaWxpYXIgd2l0
aCB0aGlzIGluZWZmaWNpZW5jeS4NCldlbGwgZm9yIHN1Y2ggZnVuZGFtZW50YWwgY2FzZSwgYWxs
IHJlc291cmNlIGNyZWF0aW9uIGNhbiBiZSBkaXJlY3RseSBtb3ZlIHRvIGFuIGFkbWluIGNvbW1h
bmQgaW50ZXJmYWNlIGJlaW5nIGJhc2ljIGZhY2lsaXR5IGZvciBsb25nIGVub3VnaCBwZXJpb2Qu
DQoNCj4gV2UgdHJpZWQgdXNpbmcgdGhlIGV4aXN0aW5nIFZpcnRpbyBQQ0kgdHJhbnNwb3J0IGlu
IGEgZGVzaWduIHdoZXJlIHR3byBTb0NzIGFyZQ0KPiBjb25uZWN0ZWQgdXNpbmcgUENJZSBidXMs
IGJvdGggcnVubmluZyBMaW51eC4gT25lIHdpbGwgYWN0IGFzIFZpcnRpbyBGcm9udGVuZA0KPiBh
bmQgYW5vdGhlciBhcyBiYWNrZW5kLiBUaGVuIHdlIHJhbiBpbnRvIGFsbCBzb3J0IGlzc3VlcyBk
dWUgdG8gdGhlIGFib3ZlDQo+IG1lbnRpb25lZCBhc3N1bXB0aW9uL2V4cGVjdGF0aW9uIGJ5IHRo
ZSB0cmFuc3BvcnQuDQo+DQpXaGVuIHlvdSBzYXkgZnJvbnQgZW5kIG1lYW5pbmcgdGhlIGRyaXZl
ciwgYW5kIGJhY2tlbmQgYmVpbmcgdGhlIGRldmljZT8NCklmIHllcywgdGhlbiB0aGVuIGl0IGlz
IHZlcnkgY29tbW9uIGZvciB1cyBhcyB3ZWxsIHRvIGhhdmUgbW9kZXJuIGludGVyZmFjZSBmb3Ig
cmVzb3VyY2UgY3JlYXRpb24gc3VjaCBhcyB2aXJ0cXVldWUuDQoNCkkgYW0gc3RpbGwgeWV0IHRv
IGNhdGNoIHVwIG9uIEJlcnRyYW5kLCBFZGdhcidzLCBEZW1pJ3MgYW5kIG90aGVyIGVtYWlscyBm
cm9tIHllc3RlcmRheS4NCg0KIA0KPiAtIE1hbmkNCj4gDQo+IC0tDQo+IOCuruCuo+Cuv+CuteCu
o+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40NCg==
