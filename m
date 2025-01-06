Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2048.outbound.protection.outlook.com [40.107.236.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FB8AD24
	for <virtio-comment@lists.linux.dev>; Mon,  6 Jan 2025 04:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736136849; cv=fail; b=YkpfaKREB3gWyPXIZmysXBFV0IsZ7Hm4jUYjmwdwSntHcLgw9AEol6aPtp6A7MA/ktidPCYjOKx3FBuGzLy/XxLkY/WaGXXLlxrrqJDPDgmCcfNkfE4MzuKp1vujhlVeNxWDTcquSA80K8bjXqFis7gB2gCcqoRiX8p7Dm+nIyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736136849; c=relaxed/simple;
	bh=g+Q8KBVNxN9J7ggkTjxdsjp4H55taECp1dJMgaN8/B4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b+GzHLCH5400CxeszyZb16jfm7aTO2dYLYS8n9Pd1lIMMdAxP184GuxOxdNCwsRSuFpuGTMbROhMnBv44TGn1JEhh2D5kSErnxh84R11+F5/NMaA4UmJ8qmyhqht5wJqNqVWxsKbj1qXnnD/fMkUqRt1yKNjkDlslJ+BfU+RiT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VAtLu6GG; arc=fail smtp.client-ip=40.107.236.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VAtLu6GG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1NXsQkBgpHRRWATqLQclyy4Y6mvyln5Q4t/gXkdOGUfWDhHeaxUDUO5y0MvdjGD5HcfOOIR6bVZGKBtFiJl4zyA0vjWDbIsAJAZSVR6IP9Jurr08eZt4Xh1zoNl5oAnz+ZpnIiYwATwGBfH7icmm2b20us2CIJTifoSocYE7rqtcUHc0yLttoKiBAxB/RJ0dG+UjwFBmq77EcwXlxEjwvQMCVz8oycc8DTmN0niKNoloDiQX9wf7kSpL+GlB96GcHUe6HJvO3WYGmBq6w86jJhaYLs5ZUov0uWEaC41F9KlZNApmPd1FIf1Z4PQ/zDD4ONMkzISXWxKNAnedzP4eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+Q8KBVNxN9J7ggkTjxdsjp4H55taECp1dJMgaN8/B4=;
 b=Uv4ugYLCoMizBDUDgdyGYPTVb8m/XdzbH0VjGUFaa8KKKqRd+yNCiSTqp5vJZ6+BhmpVn26zlN3w1Ne5ZGJsLCPDnIJDNZQPg5+WsEURrQA6cPYF58Bo9Bmc4/sAE1fkbT+i2wEo5OaIq6APs95ehDSJDWURey9FBK9GO8evBNcOPYGjzoZaKDWbbHVBBMZUh+Y+lMuyajIAwh1SNDZZIAY8K0TFe3xqE4QlFdWDZNjn7i9IXUxQIxhjM7UdZjHurrUeDsrPOLD54+wnvHCdbXSWKFX0w2qaA4hFO8544fCWdbFs1YqoIMSaFaqttNAlzYF+sjMIjnSa4u/eZWBuOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+Q8KBVNxN9J7ggkTjxdsjp4H55taECp1dJMgaN8/B4=;
 b=VAtLu6GGMi8bihg7XvSLUGHtIpJ9AuLQKUhvF8NCAlDH6yF4jmAo99y+5j6rRo45/piHZt3TTcI19UYQpWtAYDsxqaETVgtmcBR4eYT34gOpVBpX8ZFMIsvuV/aZGoiap18BJ8HpVvrkzrqf5E40gEAdro/wge4VfcOVdjedZ8WDMwUGgf5k8YJLdjKRGAkaX2xFTLKNw9lMjQuzagdl3cm0c1EsGq0Esuk/fIPj3ZND6sh91U8WxnkPVaIRoLrGNJH4aTiBhvm1QGjFnHV5yhus73r8Mx26IIDFS5fIM4MyASlvcWbT9AWjDZVzekwHXyXfaBJFvXKY1HhaJpxh5g==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DM4PR12MB5793.namprd12.prod.outlook.com (2603:10b6:8:60::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Mon, 6 Jan
 2025 04:14:00 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 04:13:59 +0000
From: Parav Pandit <parav@nvidia.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>
Subject: RE: [PATCH 1/2] virtio-net: Fix receive buffer size typo
Thread-Topic: [PATCH 1/2] virtio-net: Fix receive buffer size typo
Thread-Index: AQHbS7QzfULeVNWPokaqSwmIXE/BCLLpQGtggCAKbPA=
Date: Mon, 6 Jan 2025 04:13:59 +0000
Message-ID:
 <CY8PR12MB7195AD4BD198EF3E96915EFADC102@CY8PR12MB7195.namprd12.prod.outlook.com>
References:
 <20241211-v1-4-topic-virtio-net-rx-timestamping-v1-0-bdd882e7b53f@pengutronix.de>
 <20241211-v1-4-topic-virtio-net-rx-timestamping-v1-1-bdd882e7b53f@pengutronix.de>
 <CY8PR12MB7195093184CEEBD1817DEB83DC3B2@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To:
 <CY8PR12MB7195093184CEEBD1817DEB83DC3B2@CY8PR12MB7195.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DM4PR12MB5793:EE_
x-ms-office365-filtering-correlation-id: b427cf5b-913b-4b33-4a9e-08dd2e088bf2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?b1pGUlBqV1premRNM0pIUEp4ZHpnN21RaEFjazNaR3BWcU1QbS96U2VuelBX?=
 =?utf-8?B?SnNQT2NWUHRpK2VyVm10R3hMZCs3Q2d4SitEaGtmRW91UmR2bHBScmxyRzZU?=
 =?utf-8?B?SUl0NWNOT09VN2Q3aHRiTnU3Rk9JN0ZQUXpXVldDOGRnYzBEZW90SnltaXJs?=
 =?utf-8?B?YmhBNWtocEk1WTIrc0RkU1pZWnVPZ1lzeVdiQlhhUDFnTWUyd25tbHh1VkZ5?=
 =?utf-8?B?QmhyUmliUHVpZUloSDUvK0hCekwvNnNXK3ZQcmVyRWlIdHgwSkdrSkp5cW1y?=
 =?utf-8?B?bmpWYjZKNXZUSW1pKzlYak15amdERFc2cUlaRko0dXhtU1VaTy9IZlNreEZp?=
 =?utf-8?B?MjBHck5LMTR4dDZRTHRXbktacjR3Z1RsTGhIc0xtbDBraEdScDZMM05wQlJi?=
 =?utf-8?B?aXNXQW9NSE9ycHpyakdkREFmVW1QS3Z4Um9pVE1mMXBjTHlrNk5zcnFQbXZB?=
 =?utf-8?B?QnNMUERldW5IRGNudVFjT21VK2ViODBxR2VhQWtrdXd5WVdUUXkzOFBTbnFC?=
 =?utf-8?B?dlJsYXNVK3JkYk02bjlBUUVIVUdBRS9GT0xkWmpUbDMwcm9uUHZJQ1p1V29v?=
 =?utf-8?B?dW43b25aYUlJMm9ubzhCMy94QXpidTFuWG1ncmNscDVtenlGd3NKUnNIaHRh?=
 =?utf-8?B?akJPaVh5MWI4c0c4MEN3cU5HY2VzOGdZMEZzOXF5Z3FZVzE3clhiVzh5Rmdj?=
 =?utf-8?B?dGVRdlZQNm5JaW5FMWdkYWZjTzZWWlo3RzZPL2I2b3NvQjZrOHFRUVJudGRz?=
 =?utf-8?B?eFNZWER2MkFHUk5MdzJJVUsxZk8wMk5QLzlneTZubys2R2k0TVdCNW1SRW9z?=
 =?utf-8?B?NnhSOExyUk1XcWNLTDB2eWwvaXcraXBQVVJMNjdKNDdqVDFpQ2x4SStBMVR3?=
 =?utf-8?B?MTV5WWNwNnkyNW9vb2xBeno2aytGQjNXbjZkak5jNDFtWWwrZy9nM0E3NjdP?=
 =?utf-8?B?UWdkUTJtdVM3dWJHcHU3TU16YzF0T090ekdqb0QxT21CS1R3Y1ljOFcwbTFt?=
 =?utf-8?B?ZlVQakFqK2VPTkhsNWhpVjdiZ3l3WHVqV1l6cGRKU0FlMFVqdXVPSXBSbEpC?=
 =?utf-8?B?OUk2OVpqc3hFaURLOW9FcnFtYWgycHVjOFVpTDhTeS9Gak0xWUFhZFdZTHU1?=
 =?utf-8?B?V2RyVC9QNURLNWVzbnAvdWt5M2EvdjhZMm1tZUlEUThaQ1QxK3JFSnkzcklN?=
 =?utf-8?B?MEM2NXhHeW9ZRDdRZlByNm9aM2czcHhZbXBqVFk2MVBCNzlxOGZucEl5eUVV?=
 =?utf-8?B?N0xWTlFsU2o4L1dDeVQvVWl6cUs2OEJJUHV2cW9ZVlBvVGZOTEtOSW52OUNY?=
 =?utf-8?B?ZEo2OVVycEVqZFcyRjJsS0UzWjc5bnFYdWpmaDFpc2VvdEk1UFJ3VFRjSWtB?=
 =?utf-8?B?cnE5cG9QTzZZTnZ4ZHRVT3ZBeUtyR3lDU3dUQVU0MGxpNy9Zc05HOVZwNWUx?=
 =?utf-8?B?ckZENk9rUjYxeTA5UVZzbEFPa0U1SFJDbnBnRDJGYklKWkx5T2ZRYm1mUkxk?=
 =?utf-8?B?ZFV5dUtiY0cyRktOQ0V1UVN5SGtvdnUwQkdIVW4xSkt1TnBWRUhwOEd4SUl4?=
 =?utf-8?B?TmdzaHZlcWNVSXBHbUFGb2oxditlMmg2TnlKRUNVd2I1WHVGYVM2SGU5UEdw?=
 =?utf-8?B?UU1zV0Y4RUFseEh4OHlyYU5KUVlBTDNiMkJWclQ5RGVqQmRvUVdJOFVrckVy?=
 =?utf-8?B?b0tTZEJuZ01DdGZyVzNpeE1FVjROQkNuRGcxVEM1WG5MTytoMmkyZ3pray9j?=
 =?utf-8?B?eUdmVVhnS3RXdzFqVURpNTRURFQvQ2Uwdit1ZDIyRWxMaEQvdmhSTC9jbFZJ?=
 =?utf-8?B?djY0OVlqMWJhbmVlbEo0QzRjckNIY3h3blM4YU9pMjVKRUlEbFVxK2dwNFhG?=
 =?utf-8?B?WjJVY1RBaU5lb1NpTVFPQVFNd1FzWDNUUklvS2s1RjVHeCsrYTJnVW9uUWcr?=
 =?utf-8?Q?A7tCxkuOJdYlzqdO9fU7ZtnPOSkoinwW?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UTJDRWZvakE3K01NazdEYU0wc3FyODkxTm5QczNnaW1BNzA5elNtdStZM1VS?=
 =?utf-8?B?c09ReE55OUNNMkFabEYwMm5yZVFJdmdDNU5FOXM2L3h0cDdoc0JEUDdzYnlh?=
 =?utf-8?B?WmtEWFcwTFhldWc4SzBrRFk0cmJxV2pORTVBamdRalArY2tPbS9rSGJKeGIr?=
 =?utf-8?B?SFB4VEduNy90SjJVaFcxL0hKZEJmU2ZEclA5WitTK1RuQmFFR1R5b2V4eno1?=
 =?utf-8?B?UFVQNmJjd2RFMzlxbzVieFI3MDgrSWkzVm5USlE4UGJZWDhFVE5IVXIzdkty?=
 =?utf-8?B?U0dFcVdEUU52eE9ydUxoN3FKR3VjSkhvOUlGSUtCZCtxMk9jYW9SZG9OZWMy?=
 =?utf-8?B?R0t4eWRHRXUrME0zUVZ6Wkd5dHVKejRPamxSY3A0eS93ZVIxakpBVDJGK0Yx?=
 =?utf-8?B?UlpDN2lKK0tiMC9DeTBXUHNneFNERVpGdWdmc0ZMeldHaGdjTXB5SGVJUmVG?=
 =?utf-8?B?dVlXWEtyY25VNEwvdCtvK2k2eERnSGovMXZmVkV0bFpFZzhhUkFXK1pmcXkz?=
 =?utf-8?B?YUw4cGtFVW5hNGloc05vUlV1U2NRRXFCd2xzVXJISkk4ckhuVW5DQTl0MU81?=
 =?utf-8?B?MjBNVml6dHdJN2VyOElkL1dqOHcwNWNQTHhKU0ZpakpYRjlPWVd1UjkvNWNx?=
 =?utf-8?B?bnozK2R3c2lGMitiQ3hlUk9PcG5nd2dGam1iUFVyd0RzbkNFZnNkOVpyS3h6?=
 =?utf-8?B?TFpESll5dDZGbkgxNk4yRndrK2lwSjdtSDRSYklVbWo2UjM5OGRTVFozTVd2?=
 =?utf-8?B?VEVpQmdmclpjclU5bVk2T0ZWMzBRZG84clk3ZmFNajEyaFBFUUliMlEyMU5v?=
 =?utf-8?B?NEFWcnc5RGp0eXd2Z2tEN2t5UmthQTFkcTFYRC9XK0JQdy91RzVyWGpHL2NW?=
 =?utf-8?B?MjA1Y2ZwR3EzLy9YWXBWMk1YckFQSEFvczRxcHNUcjdjRHRjTzFOVmpJUWpP?=
 =?utf-8?B?WEpKVlFkTm50SVN0UStVTjEyMWFtZGNOQmZrdm1kTEgrWnJEeTBrd29Obk50?=
 =?utf-8?B?L2g0SkFiRXNyT3orWTdnVVM4d3piUHh4QkdWYzEvYmZKVWc0YWtEam1rV05n?=
 =?utf-8?B?QjJPUWdoUUx5ak0wbGpKOEs5eStWZEUvR2RPR1pLcm5seXhUYVJpeXlkUTZE?=
 =?utf-8?B?THNjVkkxbTJrVk5PMTgzc2ErVDRmVXIvL3NhWlhtRjQ1bVZXaWlZS3NjSEhz?=
 =?utf-8?B?YjYyNldPQ29jVlJia3Q2Yi9QbVhhTmEyZHVZN2IzV2JRQXM4L0c3elRwNThQ?=
 =?utf-8?B?a2llclhTSXBydnU5c2xxN3pJeG5yMVF1cmU2MFBLNVozejFLZ3VURHNDM2cy?=
 =?utf-8?B?SVNOR0djd1V4d1lTb0xpSlRzTEMyaWRtaDNjUGs3U25nV3hsL3E3R1kxVFg3?=
 =?utf-8?B?b2lPdEF4UDdPaDl6a0JKU21IMnMzNzBKeUVJQ21CekZnNzUvSHpRalJnd05B?=
 =?utf-8?B?RENaaWQrS1J2U3NSeHlub1BwYVA2ekQwa0ZHT1NlY2tzaTRhWW5SdnM4U3B0?=
 =?utf-8?B?RUU2RE5vUUVCZ1Nmb2VLTUE1MHMxNExaRm1lMURjdjF6REdZMjJmanExODQ3?=
 =?utf-8?B?L040WnBMdTlOdGFFNlBSaHJIeTRjQk5oaEdxSmFmZDBZZmVRVEpKOXJYTE82?=
 =?utf-8?B?Sk43aldjdmFYSmdwdUpGV0NaRmNER1pxTll6Nm5XeG4vUVFkbFNKYm9KTHZp?=
 =?utf-8?B?eGZBMXJQcXBsN2hrNmFXRzJMTTBrbnNrMnVWcjVtTGJPMG9tZGt0bm15S3dv?=
 =?utf-8?B?YkI3YUFJRlFPcGpRZXBLc1FlVTNqYkM0N1RpTy9PTnpwYjdaanhFYmhoRnUw?=
 =?utf-8?B?YkExNERSTURTQ2VTZ29udWZDSU9tcWJFcWpBTEw5MnZsK3hmT0hHTWI1MXVG?=
 =?utf-8?B?dk0yR2hXbGpjVTZJVUtzMmZrS0lDYkw3S1Bscy9IYjN4VVB4TWxuTVl0cTJz?=
 =?utf-8?B?bU1ZOTJsUXY4YmovMUVBS2E1NmJkMHBNOGVKVURCVVpsaWpnOUYrRXg5dHY4?=
 =?utf-8?B?aklwYTkxVVJad1F6RVMvdFkxMWNWNHlIeGdMU011ZTZ6Q2lpSytGcHpjSWNF?=
 =?utf-8?B?Mml2ZmlhYVpoTXUyZVVCOGs2eG9ha0NOOU8vWDFKOHpDUGk0c1JGc1U3Y0tO?=
 =?utf-8?B?dGRNbFZGdUpTRjRUNGZiUmV4YSswM0l0dXg2a21uQXlmSVNIUDBhd3dTNzF6?=
 =?utf-8?Q?+41l9aTqIOzXr81B1Sb7GEg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b427cf5b-913b-4b33-4a9e-08dd2e088bf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 04:13:59.8709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EshLDpl1e3xxOOpsjvXhIjf2yVyaQ+2WkRz4GpXV/dA1kXKGjH9JZWHG4cX+fFR6CBq1+3SCuYde8ToW13jVew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5793

SGkgU3RlZmZlbiwNCg0KPiBGcm9tOiBQYXJhdiBQYW5kaXQNCj4gU2VudDogVHVlc2RheSwgRGVj
ZW1iZXIgMTcsIDIwMjQgMTI6MjYgQU0NCj4gDQo+IA0KPiA+IEZyb206IFN0ZWZmZW4gVHJ1bXRy
YXIgPHMudHJ1bXRyYXJAcGVuZ3V0cm9uaXguZGU+DQo+ID4gU2VudDogV2VkbmVzZGF5LCBEZWNl
bWJlciAxMSwgMjAyNCAzOjM1IFBNDQo+ID4NCj4gPiBUaGUgY29tbWl0IDAwODA2ODE1Mzg1MzQw
ZGQ0MTFjYzY3ZGYzZjY4Mzc5MzViYjVlMjYgaW50cm9kdWNlZCBhDQo+ID4gc2xpZ2h0IHR5cG8g
aW4gdGhlIHN0cnVjdCB2aXJ0aW9fbmV0X2hkciBzaXplIGNhbGN1bGF0aW9uIGRlcGVuZGluZyBv
bg0KPiA+IFZJUlRJT19ORVRfRl9IQVNIX1JFUE9SVCBuZWdvdGlhdGlvbi4NCj4gPg0KPiA+IFdp
dGhvdXQgVklSVElPX05FVF9GX0hBU0hfUkVQT1JUIHRoZSBzdHJ1Y3QgaXMgc21hbGxlciB0aGFu
IHdpdGggdGhlDQo+ID4gZmVhdHVyZS4gVGhpcyBtaXggdXAgb25seSBvY2N1cnMgaW4gb25lIGlu
c3RhbmNlOyBzaXplcyBhcmUgY29ycmVjdCBpbg0KPiA+IGFsbCBvdGhlciBvY2N1cmVuY2VzLg0K
PiA+DQo+ID4gRml4IHRoaXMgdHlwby4NCj4gPg0KPiBQbGVhc2UgYWRkIGZpeGVzIHRhZyBsaW5l
IGFzOg0KPiANCj4gRml4ZXM6IDAwODA2ODE1Mzg1MyAoInZpcnRpby1uZXQ6IEZpeCByZWNlaXZl
IGJ1ZmZlciBzaXplIGNhbGN1bGF0aW9uIHRleHQiKQ0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBT
dGVmZmVuIFRydW10cmFyIDxzLnRydW10cmFyQHBlbmd1dHJvbml4LmRlPg0KPiA+IC0tLQ0KPiA+
ICBkZXZpY2UtdHlwZXMvbmV0L2Rlc2NyaXB0aW9uLnRleCB8IDQgKystLQ0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL2RldmljZS10eXBlcy9uZXQvZGVzY3JpcHRpb24udGV4IGIvZGV2aWNlLQ0KPiA+IHR5
cGVzL25ldC9kZXNjcmlwdGlvbi50ZXggaW5kZXgNCj4gPg0KPiA0ZTRmZmRiNmUwNGUzNDZhZjQ5
MWVkZjY1ODg2ZmEwOTZlNTA2YWJjLi4wODczNmI2ODA0ZWFmYjMwM2E1Y2ZiMmYyDQo+ID4gN2Vj
MjAwY2VjOGJkOTQyIDEwMDY0NA0KPiA+IC0tLSBhL2RldmljZS10eXBlcy9uZXQvZGVzY3JpcHRp
b24udGV4DQo+ID4gKysrIGIvZGV2aWNlLXR5cGVzL25ldC9kZXNjcmlwdGlvbi50ZXgNCj4gPiBA
QCAtNzg5LDEwICs3ODksMTAgQEAgXHN1YnN1YnNlY3Rpb257U2V0dGluZyBVcCBSZWNlaXZlDQo+
ID4gQnVmZmVyc31cbGFiZWx7c2VjOkRldmljZSBUeXBlcyAvIE5ldHdvcmsgRGV2aSAgdGhlIElQ
djYgaGVhZGVyLCBwbHVzDQo+ID4gNjU1MzUgYnl0ZXMgb2YgbWF4aW11bSBJUHY2IHBheWxvYWQg
aW5jbHVkaW5nIGFueSAgZXh0ZW5zaW9uIGhlYWRlciksDQo+ID4gb3RoZXJ3aXNlDQo+ID4gMTUx
NCBieXRlcy4NCj4gPiAgV2hlbiBWSVJUSU9fTkVUX0ZfSEFTSF9SRVBPUlQgaXMgbm90IG5lZ290
aWF0ZWQsIHRoZSByZXF1aXJlZA0KPiByZWNlaXZlDQo+ID4gYnVmZmVyIC1zaXplIGlzIGVpdGhl
ciA2NTYwMSBvciAxNTI2IGJ5dGVzIGFjY291bnRpbmcgZm9yIDIwIGJ5dGVzIG9mDQo+ID4gK3Np
emUgaXMgZWl0aGVyIDY1NjAxIG9yIDE1MjYgYnl0ZXMgYWNjb3VudGluZyBmb3IgMTIgYnl0ZXMg
b2YNCj4gPiAgXGZpZWxke3N0cnVjdCB2aXJ0aW9fbmV0X2hkcn0gZm9sbG93ZWQgYnkgcmVjZWl2
ZSBwYWNrZXQuDQo+ID4gIFdoZW4gVklSVElPX05FVF9GX0hBU0hfUkVQT1JUIGlzIG5lZ290aWF0
ZWQsIHRoZSByZXF1aXJlZCByZWNlaXZlDQo+ID4gYnVmZmVyIC1zaXplIGlzIGVpdGhlciA2NTYw
OSBvciAxNTM0IGJ5dGVzIGFjY291bnRpbmcgZm9yIDEyIGJ5dGVzIG9mDQo+ID4gK3NpemUgaXMg
ZWl0aGVyIDY1NjA5IG9yIDE1MzQgYnl0ZXMgYWNjb3VudGluZyBmb3IgMjAgYnl0ZXMgb2YNCj4g
PiAgXGZpZWxke3N0cnVjdCB2aXJ0aW9fbmV0X2hkcn0gZm9sbG93ZWQgYnkgcmVjZWl2ZSBwYWNr
ZXQuDQo+ID4NCj4gPiAgXGRyaXZlcm5vcm1hdGl2ZXtccGFyYWdyYXBofXtTZXR0aW5nIFVwIFJl
Y2VpdmUgQnVmZmVyc317RGV2aWNlIFR5cGVzDQo+ID4gLyBOZXR3b3JrIERldmljZSAvIERldmlj
ZSBPcGVyYXRpb24gLyBTZXR0aW5nIFVwIFJlY2VpdmUgQnVmZmVyc30NCj4gPg0KPiA+IC0tDQo+
ID4gMi40Ny4wDQo+ID4NCj4gUmV2aWV3ZWQtYnk6IFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlh
LmNvbT4NCg0KUnggdGltZXN0YW1wIG1heSB0YWtlIGxvbmdlciB0byBjcmFmdCBpdC4NCk90aGVy
IHBhdGNoIG9mIHRoZSBpcHNlYyBwcm9wb3NhbCBhbHNvIG1vZGlmeWluZyB0aGlzIGFyZWEgb2Yg
dGhlIHNwZWMuDQpIZW5jZSwgd2l0aG91dCB3YWl0aW5nIGZvciB0aGUgbW9yZSBmZWF0dXJlcywg
SSB3b3VsZCBsaWtlIHRvIHRha2UgdGhpcyBmaXguDQpTbyBjYW4geW91IHBsZWFzZSByZS1zZW5k
IHRoaXMgYXMgaW5kZXBlbmRlbnQgcGF0Y2ggd2l0aCBmaXhlcyB0YWcgYW5kIHJldmlld2VkLWJ5
LCBzbyB3ZSBjYW4gdm90ZSBhbmQgcXVpY2tseSB0YWtlIHRoZSBmaXg/DQoNCg==
