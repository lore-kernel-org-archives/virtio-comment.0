Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2088.outbound.protection.outlook.com [40.107.96.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFE0202642
	for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 16:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729270446; cv=fail; b=kNl3SIuBOAao2w70a2ZnyfcWqwLIKJADTNIJjN/aDCFmytAfT9iXuK5yXRXKQN7qQKTt+kpNJHWHfnHqiksNmlwhozTA/3t9CJjC4RcRKWMVjqJGCvlcsfNLJtL/SrgLy/SXKC96e2F3AosoUaEFFgPeA6Y6gIVoeAB7Wq94VZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729270446; c=relaxed/simple;
	bh=uuLFYV6dm4Quxmvhwhkv5nj67fYJBE4mrFn1um64eKU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nxhzw6LYDkpaRhbht/tht/U60Pcz5jvRVIteO7kv7gVEAblcYdlgv+aSoe182TV/L5mki3OfHvlxsXPD1zezLMdsNEjQu6oMTpodVBStbL3fSToc89qQ4fJza/zo+QM299lwwljvB4Y+XDPzRqvHvt9WLwxbaOatxdJNTIwWdIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=e30v1uDr; arc=fail smtp.client-ip=40.107.96.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="e30v1uDr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFKaGLg7qJca3mLTsLy1h0Y+ONkTymy9p6ia9ynHXsPG2tah8nfK2HW7jk4bYs63jLfBnGGKalvTKQyZWNIjfXrfFYYSvWNGNJiQEFqw5L89XraiVZPZ46xoAeVvmK+Uffb1qtqjDHe+Xm1R8ttGsonVIqwv+fhAAF3xe0g3mOKTMK8JkG3ekBfdW674vy7XieTzapszyzxmZrd95BS/plyo4X/0aaPDVf+sV1SMxrzMwLMwbmAK19sv7BDYCSjTZzGdoITI48dbCXvYo5GcgPWm4BQIy/u0R02qDwq/xp3zabDC2MhkgYhw2W/vvUN60nqfJIwv02sQfFxrmd0Fpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuLFYV6dm4Quxmvhwhkv5nj67fYJBE4mrFn1um64eKU=;
 b=lsOpdO4HOriA9qnzjJN9s9kHo5767aM/W1ZhE5FduQqqeCN5Ca+RJUu1AKFPh6OnD7RvPrG0FovUQsP3OCKMXv0WTKM8zjZyXINInoKBCIJ4YgBrQjf7t6z6CAs3wiad+H2h7nXZTColLSIEVfwd2Ox1U6IfkDOhF8sr492JqavSUH56VvpETDTT+fBWoNFyQbpojCLamiyKlrpQE01z2liD5s9CUHZZEbZlPJmK8/LjV7LDt8DbIK2Fu9wehBwGQCIG/oS1dI3nF4B5zDdN2omFivBUORPnJsY7n884LafGoA+C4D/acMWsHmuBUzxQ0v/jVVdRRg1dWpEJpBLqeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuLFYV6dm4Quxmvhwhkv5nj67fYJBE4mrFn1um64eKU=;
 b=e30v1uDrZJgCjwCw8nbX+CNVQFrYjF4DeCVdJk7Hq/YGhhGtuR/0IqwJtyscki6Tp80UIhZGatjafS8NkQY2vxuBK7CzKHLqArzegRv++fm+koZFN4VfAvdB/ly8mdKs9fgFURRgf1by7bNL02D2Z4ent3AIA0+jS1yUVQ3BfKCA8hKGqWnmhLAGHG+bys/e1hhf0t4ge/3Gvzp+K9noJSQY8Xtd2HmuX9QJymX13QCyPnQg5g9U+CRBJAOugnTsZmAZ/5mjCU5SC0JF9HqlQKK85wR+LjBKwfz1lzCeP3pSveGS+SCM7a12MpLjG2dQ5pvbVwa1SqtIZu2DQWMxJQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by PH7PR12MB6882.namprd12.prod.outlook.com (2603:10b6:510:1b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Fri, 18 Oct
 2024 16:54:00 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 16:54:00 +0000
From: Parav Pandit <parav@nvidia.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH 3/3] virtio-net: Define cvq configuration related device
 parts
Thread-Topic: [PATCH 3/3] virtio-net: Define cvq configuration related device
 parts
Thread-Index: AQHbIWAx7jE2PyAhjUODqTjR4COQ3LKMsbuAgAAH13A=
Date: Fri, 18 Oct 2024 16:54:00 +0000
Message-ID:
 <CY8PR12MB71954366488C948EB97F19ABDC402@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20241018131741.443635-1-parav@nvidia.com>
 <20241018131741.443635-4-parav@nvidia.com> <ZxKLzVV94VW3utAh@fedora>
In-Reply-To: <ZxKLzVV94VW3utAh@fedora>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|PH7PR12MB6882:EE_
x-ms-office365-filtering-correlation-id: ca51acad-7406-4efb-679a-08dcef9576f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NVVHWWM1LzNtcHJOSzV4Zmp3YU53S3dDdTFIUU9TaGYwdEV3ZWxiYW1mREdl?=
 =?utf-8?B?SnN4L0JCS3RZWXppWmZDaXVjMHllNXY3RWJRU013YjkzTkpLcnpROHE1YzQ3?=
 =?utf-8?B?UmdheFN6ZGxhUDFTUFJQbWpPdEtGQ1lzT3RzNGRxRW1kNkFveC85ZDdOUmdW?=
 =?utf-8?B?SG1WdWZXWjdaV1k0TTJxblpISlZjaUdvOEVzWWhLNGlrWWw2UTZrZ0hZM201?=
 =?utf-8?B?bFUrNmNvdzhKQzJ0Y3Y0NzVTcUxsc3hJMkhxM1RqcFJTWnBLSksxTzhKUCtD?=
 =?utf-8?B?R2VaaEJ4Z2M2RGM4ZEN3cXltZG93RGRSWlE2WCtPZVZOcVJOY0x0Vld3ZTEx?=
 =?utf-8?B?NnRyTGc4SUIzNzh6SVUrLzNqTDZibXd4MFJWalhpTHhsZUg1dDZaU3RuOW9C?=
 =?utf-8?B?czBwdW9WTEcyOVFpbFlRMEI3V0g2S0FDdkNIZDRJWWF1YU1UbS9XL1FYM2ZU?=
 =?utf-8?B?MmVhUUdadUEwcWREMUZzNGFGd0FmVzRzU0UwUzVFaFlDWTlnR0RycWVTMEZh?=
 =?utf-8?B?cG44YzhmMzcxd2xZdzZ4OSttaFM0QkhIN25wbm9acHZxaUpidW9QQWt6STdS?=
 =?utf-8?B?WGtTcnpNd3c5ODJ0Z2FFSG85S3ArWXlhdVY1STlnZkNCWEdJUU4zTEswT293?=
 =?utf-8?B?ZGZkK1RvYmdKMlBIRVM0TlZreWQxSDdqTTE2b0toY0xwczA3WkdGbUdlcnI2?=
 =?utf-8?B?MDlrUkgrbzlrWW9kZTZ2QVBoNTd4enN2Rlh3RHdJSlBuMVBPdWxmdWhtaUx1?=
 =?utf-8?B?VG9RTjFESGx6Nm9ORzZ2bGhCZmUvSHdLZllNTWdXL3dQRWNReUNOMXY1Vjdt?=
 =?utf-8?B?UHRPTHZueVp4RGNJQ2MzVnF5OFVqV2E1bmYzWjNSYkg4YmdKYzJIVTNzelJt?=
 =?utf-8?B?dnFxVkMrZGVHTlBiemVmK25zLzA5Y2sySVZpMFk0TDVNQzZEb2t0Qno1ejV2?=
 =?utf-8?B?RDV6QkpEWEhkNXhjL1IyREJpNE1Db3VzSjEzUU5TSm4wSzdOUlQzeDVEQlNi?=
 =?utf-8?B?cWhzdU0rYzJnUXZ3S3JtODdKTEJtSVd0amlSNS9ONTF6cjIzV0h5dWZDU3lT?=
 =?utf-8?B?QVZXcXNoYzhTbTlLWkxIbzNSdDJobXZGbmdlbmRONTUxcEVadXExY3huMFFm?=
 =?utf-8?B?MklvYWIzQWFBcERNWCtWSzIxa3B0YVdHQjlNZzlKZGpuZVRxMTdGNGEyckU5?=
 =?utf-8?B?NlkwOS9EOVUwd3pyalFNUW1GM3lmQ2Z0bE9nVmFiM3dyNFZuem92dnVqNkJz?=
 =?utf-8?B?M2RaUEdrV0QwOHVlTFVWZUEvanpuVmViWDJrWndzRTdqeVI2bGw2eUZKQ0Jw?=
 =?utf-8?B?UGV6cStEUWpQTjcvcjRuU3FDSTRRV0VYYVUrdDJjMXVxbERWWU1kUmlJc0NO?=
 =?utf-8?B?RmpIQzFNUVpNc2FJQ3pGMVlUOWhvSjRFWDNydzFRZEVkRTZReitCbzM1aGh1?=
 =?utf-8?B?MzdTYURLNDBMM0dsOTZXeXp0Qm81Y0d6bHVrcEQvbW9odUpIUU1oMkJOdFl5?=
 =?utf-8?B?Qkwxb1dqV05vZUI5MUp1aHVjTkhLU0tzWDFIYTJhYmZiRUc2VFpuT1dyeFBT?=
 =?utf-8?B?Mkg5ZG9MVXZzOVp2d1BzaHFLRXdJTWQ4UFdrcG1TaHJmS0VnNGhTZXdzbmF2?=
 =?utf-8?B?Uzd6eGFoMUdEZlpvaUtuTllveklTTjJ5MGFvWW8ycmErK0tTQzdieStWZWFB?=
 =?utf-8?B?a2wxK3ZuY1N6SVlKd1YxV0pLUjg4Ty9CMk85WmloeWQ0WERra3QxOXBkR1BU?=
 =?utf-8?B?L3JhZTJ5UTJzK01KaHVVb1ZqSE1PQk1BS1FiakhLeGVrSHJOOXdibGh0VWVk?=
 =?utf-8?B?cStTdkplb2hLc0dWS3ZRRXJkaDJ5TW4wVnNYZjFib2E4bGR4QS81UGhIYjlv?=
 =?utf-8?Q?8Y9v5TGuz6w04?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bFJwTEpBeDVkT0ZRU2ZqK1c0MFJHWm5SbUF4bWtKMHdvOG1Bb1R0TzhISDdn?=
 =?utf-8?B?aWlyN2IzSzVtSFVjbytWOFdIRHBsbmh2YTBrOWt4Wkg0VzBMZkdUQnBRSko4?=
 =?utf-8?B?aXpLekJINkdtNlo5cWVlcHBqcllBVFQrVy9yelMxUExUU0VVSk5leW1uNDF6?=
 =?utf-8?B?ZmJlTWsrWDRZSnpSTUh6TUM2Y3dxdDFWcVZVenJVY3I0bitSM09RaUZydVV2?=
 =?utf-8?B?WjdHZGpMZGkyOG44Q2hXZjg5VzNkQllHMU1EbzZsdERtYzRZakFLMXpnVXY0?=
 =?utf-8?B?LzdTeFdpWnJXVnlpRDVRNkZObUcwSXdwWVFBS2JaN0dtNXNhakJaWEhlVlNo?=
 =?utf-8?B?ZkUxZ2F5R1hCNTh6Q2wzd0dGL0p6WUk4SVhHL0ZtNHIwd3JzSzVUY1dtTC8z?=
 =?utf-8?B?d1VCL2szSlJvVUZmSjB4Njh2bmRqUmRFdGZCQ2VqOGdVZ2tpUER1cG1HdkdL?=
 =?utf-8?B?SnZrR0hqMVp6QjJvZGJlRmQxVGVEN1RvelpIRjFIM25xMVV5akRGY3F1bVZt?=
 =?utf-8?B?dG1YY1pRQllneHN1RjJZaUpKdVQxM09TMk5zc1dUeTJUamFOSncxTERraGpW?=
 =?utf-8?B?b1JPaXhteWNGUlEyQlA2US9pem1EWVJlQnBpNVJzWExrVnJwNjNjbzEyUjM1?=
 =?utf-8?B?QWg1Mklud0JKd0pCNWczWThLaGRrT1o2ZkhEdjBoTVVKN2NXUXA2MGtUbU8y?=
 =?utf-8?B?bTVYWitqMlJaYTlib09WeHB5WUJQUTNRa0RxcEJGOWFDcS91RXpHSHliWVBj?=
 =?utf-8?B?dVA1ZXR5MkEyYU1LZkFjQjVSL2tqcXBoZm5YSG1ZdHhWS1dwUVcyQkZ3cjNw?=
 =?utf-8?B?bEwvd3BXYWJlM2ptaHkyZUkrU0k5aFpNQ0JGWjhzV0tTUmlQL2p2WGZldEZK?=
 =?utf-8?B?RHI4SkxkbDZjNVNSdFpJRFJ1b1RkRGlnRUdyMW1XeDhBYzl0RitnN21GRWh1?=
 =?utf-8?B?aDRXNG15OXZjekZyVkZlTXNaU1B1MW52V1gvQlRuQWRDZGlqanZjVmlyMWtx?=
 =?utf-8?B?ZDQ5STE5Y25KTlpmT24vQ2RKazEwWFlOd1E5cDVTS0tFaDFPd3JhWXlpYmFR?=
 =?utf-8?B?QnptajM0bFhUSmJ5OXUxcElDOERleG84ZzFRMEdWSzFwSlptSTZHaWVoVUMw?=
 =?utf-8?B?dWdzQ2tFdmp1YXA1NCtUVi9KK1dFUHdrUGNSN2RSK3pKS3hLRndDenBEU2kr?=
 =?utf-8?B?QnZ5cTBxbTBWR09CcFFxeWxaTmNyaUJ2Z3ZCZDEzZC9CTjQvQjNIYjNBT0dU?=
 =?utf-8?B?Z01uQ1ZjVUY1UHdnZ0syczlsVjdhRlVvbEZDRXh1RTZPbXI5MGU3Z3lEQTdY?=
 =?utf-8?B?MVhtdnVHQ01mZGxoWHVDQzd2cFRHRFN6RVNJZGFjVzZXMW1ZYzE1QW80NEVV?=
 =?utf-8?B?SUUrSHJ3Ti85V1pPS3BpOEZuMzBuWlc0eUNiam9lMy9hZjZyNEdvRXRXWXJa?=
 =?utf-8?B?WU1nMXNvNHNPNzMzRzIvRmZ1SjFzTnlWLzVqd3lXQ2tyNUxyVFRHV2FBTEx1?=
 =?utf-8?B?bTFzSnN1dUZNZk93SlByazF6MFo2SG9tMSs2U3g3SmQwenlNMTZWOStHV0Vz?=
 =?utf-8?B?VXlJY0owNXkzWEw3SXV6TXU4RGs3U3diRE9ZRkRvNWNEblZzN2dqWFZ4RDdW?=
 =?utf-8?B?Ymt3ZHcrN2VaeXJzdjJld3VBVXpqY04yNi9NN25kclNNa29ZbE85Vk54UGhH?=
 =?utf-8?B?bzkxYVVyWktmUFNFOWF0TmdVY2R5bnloZDlKRjNpREdha3dZd29iRlRKMUlU?=
 =?utf-8?B?QWd0ZXNtRXc2d3JsWGo0NFo4T0F4RkRTS2NkdUpNSURIV1RrVHc0VUtFdnB4?=
 =?utf-8?B?SDJOTm9yS3RUa0N3NXhMazVTQU5YRUZBZCt0Q045b3FxdWxXUWFjRWJFT2Vs?=
 =?utf-8?B?Vk1kTDdlQ3ZLMnJjTG5CbS9DN0VFQ2dIMTczeGRBRWhJMEZvK2x0QmZkZXZV?=
 =?utf-8?B?cnA2NUtmOXg1YVVNUG8wZzR5N3BEOUwxMmMzblM0dldUb0YxU2NEelF2eDRT?=
 =?utf-8?B?dk1sdzl6NUlzcWdrY3NnNzdJOEw4WmRYUjl1R2tFSzVRbFdZbnlnUnJHT1RR?=
 =?utf-8?B?UFRRTFd6NEZKYk1vN29IeE5uWkZuS2NvMWVrRGlWZE1NdlNvaEpXcDN4eERG?=
 =?utf-8?Q?sTVc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ca51acad-7406-4efb-679a-08dcef9576f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2024 16:54:00.4935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cl3eeWtxrSYTJhMwSDfy+MSho4JPXuXle2qYkC/lVt29HlJxYZyUr+ARD6GToBULnSpzTyZAmwhjDU+hMe85vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6882

DQoNCj4gRnJvbTogTWF0aWFzIEV6ZXF1aWVsIFZhcmEgTGFyc2VuIDxtdmFyYWxhckByZWRoYXQu
Y29tPg0KPiBTZW50OiBGcmlkYXksIE9jdG9iZXIgMTgsIDIwMjQgOTo1NSBQTQ0KPiANCj4gT24g
RnJpLCBPY3QgMTgsIDIwMjQgYXQgMDQ6MTc6NDFQTSArMDMwMCwgUGFyYXYgUGFuZGl0IHdyb3Rl
Og0KPiA+IHZpcnRpbyBuZXQgZHJpdmVyIHNlbmRzIHRoZSBjb250cm9sIHZpcnRxdWV1ZSBjb21t
YW5kcyBmb3IgZGV2aWNlDQo+ID4gY29uZmlndXJhdGlvbi4gU3VjaCBkcml2ZXIgY29uZmlndXJh
dGlvbiBpcyBjdXJyZW50bHkgbm90IGNhcHR1cmVkIGluDQo+ID4gdGhlIGRldmljZSBwYXJ0cy4N
Cj4gPg0KPiA+IFRoaXMgc2VyaWVzIGFkZHMgc2V2ZXJhbCBvZiBzdWNoIGRldmljZSBwYXJ0cyB3
aGljaCByZXByZXNlbnRzIHRoZQ0KPiA+IG5ldHdvcmsgZGV2aWNlIHNwZWNpZmljIGNvbmZpZ3Vy
YXRpb24uDQo+ID4NCj4gPiBJdCBpcyBkb25lIGJ5IHV0aWxpemluZyB0aGUgZXhpc3RpbmcgZGV2
aWNlIHBhcnRzIHN0cnVjdHVyZS4NCj4gPiBBIG5ldyBnZW5lcmljIHNlbGVjdG9yIGZvcm1hdCBp
cyBhZGRlZCB0byBlbmFibGUgZGV2aWNlIHR5cGUgc3BlY2lmaWMNCj4gPiBkZXZpY2UgcGFydHMu
DQo+ID4NCj4gPiBUaGlzIHNlcmllcyBhbHNvIHJldXNlcyB0aGUgZXhpc3RpbmcgY29udHJvbCB2
aXJ0cXVldWUgY29tbWFuZA0KPiA+IHN0cnVjdHVyZXMsIGZpZWxkcywgYW5kIHZhbHVlcyB0byBk
ZWZpbmUgdGhlIG5ldHdvcmsgZGV2aWNlIHBhcnRzLg0KPiA+DQo+ID4gRml4ZXM6IGh0dHBzOi8v
Z2l0aHViLmNvbS9vYXNpcy10Y3MvdmlydGlvLXNwZWMvaXNzdWVzLzIwOQ0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNvbT4NCj4gPiAtLS0NCj4gPiAgZGV2
aWNlLXR5cGVzL25ldC9kZXNjcmlwdGlvbi50ZXggfCA5MA0KPiA+ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5MCBpbnNlcnRpb25zKCspDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZGV2aWNlLXR5cGVzL25ldC9kZXNjcmlwdGlvbi50ZXgNCj4g
PiBiL2RldmljZS10eXBlcy9uZXQvZGVzY3JpcHRpb24udGV4DQo+ID4gaW5kZXggZTQ1ZWNiZC4u
YTVjNjk3NSAxMDA2NDQNCj4gPiAtLS0gYS9kZXZpY2UtdHlwZXMvbmV0L2Rlc2NyaXB0aW9uLnRl
eA0KPiA+ICsrKyBiL2RldmljZS10eXBlcy9uZXQvZGVzY3JpcHRpb24udGV4DQo+ID4gQEAgLTQz
Myw2ICs0MzMsOTYgQEAgXHN1YnNlY3Rpb257RGV2aWNlIHJlc291cmNlDQo+ID4gb2JqZWN0c31c
bGFiZWx7c2VjOkRldmljZSBUeXBlcyAvIE5ldHdvcmsgRGV2aWNlIC8gRCAgXGhsaW5lDQo+ID4g
XGVuZHt0YWJ1bGFyeH0NCj4gPg0KPiA+ICtcc3Vic2VjdGlvbntEZXZpY2UgcGFydHN9XGxhYmVs
e3NlYzpEZXZpY2UgVHlwZXMgLyBOZXR3b3JrIERldmljZSAvDQo+ID4gK0RldmljZSBwYXJ0c30N
Cj4gPiArDQo+ID4gK05ldHdvcmsgZGV2aWNlIHBhcnRzIHJlcHJlc2VudCB0aGUgY29uZmlndXJh
dGlvbiBkb25lIGJ5IHRoZSBkcml2ZXINCj4gPiArdXNpbmcgY29udHJvbCB2aXJ0cXVldWUgY29t
bWFuZHMuIE5ldHdvcmsgZGV2aWNlIHBhcnQgaXMgaW4gdGhlDQo+ID4gK2Zvcm1hdCBvZiBcZmll
bGR7c3RydWN0IHZpcnRpb19kZXZfcGFydH0uDQo+ID4gKw0KPiA+ICtcYmVnaW57dGFidWxhcnh9
e1x0ZXh0d2lkdGh9eyB8bHx8bHxYfCB9IFxobGluZSBUeXBlICYgTmFtZSAmDQo+ID4gK0Rlc2Ny
aXB0aW9uIFxcIFxobGluZSBcaGxpbmUNCj4gPiArMHgyMDAgJiBWSVJUSU9fTkVUX0RFVl9QQVJU
X0NWUV9DRkdfUEFSVCAmIFJlcHJlc2VudHMgZGV2aWNlDQo+ID4gK2NvbmZpZ3VyYXRpb24gZG9u
ZSB0aHJvdWdoIGEgY29udHJvbCB2aXJ0cXVldWUgY29tbWFuZCwgc2VlDQo+ID4gK1xyZWZ7c2Vj
OkRldmljZSBUeXBlcyAvIE5ldHdvcmsgRGV2aWNlIC8gRGV2aWNlIHBhcnRzIC8NCj4gPiArVklS
VElPLU5FVC1ERVYtUEFSVC1DVlEtQ0ZHLVBBUlR9IFxcIFxobGluZQ0KPiA+ICsweDIwMSAtIDB4
NUZGICYgLSAmIHJlc2VydmVkIGZvciBmdXR1cmUgXFwgXGhsaW5lIFxobGluZQ0KPiA+ICtcZW5k
e3RhYnVsYXJ4fQ0KPiA+ICsNCj4gPg0KPiArXHN1YnN1YnNlY3Rpb257VklSVElPX05FVF9ERVZf
UEFSVF9DVlFfQ0ZHX1BBUlR9XGxhYmVse3NlYzpEZXZpY2UNCj4gPiArVHlwZXMgLyBOZXR3b3Jr
IERldmljZSAvIERldmljZSBwYXJ0cyAvDQo+ID4gK1ZJUlRJTy1ORVQtREVWLVBBUlQtQ1ZRLUNG
Ry1QQVJUfQ0KPiA+ICsNCj4gPiArRm9yIFZJUlRJT19ORVRfREVWX1BBUlRfQ1ZRX0NGR19QQVJU
LCBcZmllbGR7cGFydF90eXBlfSBpcyBzZXQgdG8NCj4gPiArMHgyMDAuIFRoZSBWSVJUSU9fTkVU
X0RFVl9QQVJUX0NWUV9DRkdfUEFSVCBwYXJ0IGluZGljYXRlcw0KPiA+ICtjb25maWd1cmF0aW9u
IHBlcmZvcm1lZCBieSB0aGUgZHJpdmVyIHVzaW5nIGEgY29udHJvbCB2aXJ0cXVldWUNCj4gY29t
bWFuZC4NCj4gPiArDQo+ID4gK1xiZWdpbntsc3RsaXN0aW5nfQ0KPiA+ICtzdHJ1Y3QgdmlydGlv
X25ldF9kZXZfcGFydF9jdnFfc2VsZWN0b3Igew0KPiA+ICsgICAgICAgIHU4IGNsYXNzOw0KPiA+
ICsgICAgICAgIHU4IGNvbW1hbmQ7DQo+ID4gKyAgICAgICAgdTggcmVzZXJ2ZWRbNl07DQo+ID4g
K307DQo+ID4gK1xlbmR7bHN0bGlzdGluZ30NCj4gPiArDQo+ID4gK1RoZXJlIGlzIG9uZSBkZXZp
Y2UgcGFydCBvZiB0eXBlIFZJUlRJT19ORVRfREVWX1BBUlRfQ1ZRX0NGR19QQVJUDQo+IGZvcg0K
PiA+ICtlYWNoIGluZGl2aWR1YWwgY29uZmlndXJhdGlvbi4gRWFjaCBwYXJ0IGlzIGlkZW50aWZp
ZWQgYnkgYSB1bmlxdWUgc2VsZWN0b3INCj4gdmFsdWUuDQo+ID4gK1RoZSBzZWxlY3RvciwgXGZp
ZWxke2RldmljZV90eXBlX3Jhd30sIGlzIGluIHRoZSBmb3JtYXQgXGZpZWxke3N0cnVjdA0KPiA+
ICt2aXJ0aW9fbmV0X2Rldl9wYXJ0X2N2cV9zZWxlY3Rvcn0uDQo+ID4gKw0KPiA+ICtUaGUgc2Vs
ZWN0b3IgY29uc2lzdHMgb2YgdHdvIGZpZWxkczogXGZpZWxke2NsYXNzfSBhbmQNCj4gPiArXGZp
ZWxke2NvbW1hbmR9LiBUaGVzZSBmaWVsZHMgY29ycmVzcG9uZCB0byB0aGUgXGZpZWxke2NsYXNz
fSBhbmQNCj4gPiArXGZpZWxke2NvbW1hbmR9IGRlZmluZWQgaW4gXGZpZWxke3N0cnVjdCB2aXJ0
aW9fbmV0X2N0cmx9LCBhcw0KPiA+ICtkZXNjcmliZWQgaW4gdGhlIHJlbGV2YW50IHNlY3Rpb25z
IG9mIFxyZWZ7c2VjOkRldmljZSBUeXBlcyAvIE5ldHdvcmsNCj4gRGV2aWNlIC8gRGV2aWNlIE9w
ZXJhdGlvbiAvIENvbnRyb2wgVmlydHF1ZXVlfS4NCj4gPiArDQo+ID4gK1RoZSB2YWx1ZSBjb3Jy
ZXNwb25kaW5nIHRvIGVhY2ggcGFydOKAmXMgc2VsZWN0b3IgZm9sbG93cyB0aGUgc2FtZQ0KPiA+
ICtmb3JtYXQgYXMgdGhlIHJlc3BlY3RpdmUgXGZpZWxke2NvbW1hbmQtc3BlY2lmaWMtZGF0YX0g
ZGVzY3JpYmVkIGluDQo+ID4gK3RoZSByZWxldmFudCBzZWN0aW9ucyBvZiBccmVme3NlYzpEZXZp
Y2UgVHlwZXMgLyBOZXR3b3JrIERldmljZSAvIERldmljZQ0KPiBPcGVyYXRpb24gLyBDb250cm9s
IFZpcnRxdWV1ZX0uDQo+ID4gKw0KPiA+ICtGb3IgZXhhbXBsZSwgd2hlbiB0aGUgXGZpZWxke2Ns
YXNzfSBpcyBWSVJUSU9fTkVUX0NUUkxfTUFDLCB0aGUNCj4gPiArXGZpZWxke2NvbW1hbmR9IGNh
biBiZSBlaXRoZXIgVklSVElPX05FVF9DVFJMX01BQ19UQUJMRV9TRVQgb3INCj4gPiArVklSVElP
X05FVF9DVFJMX01BQ19BRERSX1NFVDsgd2hlbiBcZmllbGR7Y29tbWFuZH0gaXMgc2V0IHRvDQo+
ID4gK1ZJUlRJT19ORVRfQ1RSTF9NQUNfVEFCTEVfU0VULCBcZmllbGR7dmFsdWV9IGlzIGluIHRo
ZSBmb3JtYXQgb2YNCj4gXGZpZWxke3N0cnVjdCB2aXJ0aW9fbmV0X2N0cmxfbWFjfS4NCj4gPiAr
DQo+ID4gK1N1cHBvcnRlZCBzZWxjdG9ycyBhcmUgbGlzdGVkIGluIHRoZSB0YWJsZToNCj4gDQo+
IHMvc2VsY3RvcnMvc2VsZWN0b3JzDQo+DQpJIHJhbiBjb2Rlc3BlbGwgdG9vbCBidXQgcGl0eSBp
dCBkaWRu4oCZdCBjYXRjaCB0aGlzLg0KTmVlZCB0byBsb29rIGZvciBhbm90aGVyIG9uZS4NCldp
bGwgZml4IHRoaXMuDQogDQo+ID4gKw0KPiA+ICtcYmVnaW57dGFidWxhcnh9e1x0ZXh0d2lkdGh9
eyB8bHxYfCB9IFxobGluZSBDbGFzcyBzZWxlY3RvciAmIENvbW1hbmQNCj4gPiArc2VsZWN0b3Ig
XFwgXGhsaW5lIFxobGluZSBWSVJUSU9fTkVUX0NUUkxfUlggJg0KPiA+ICtWSVJUSU9fTkVUX0NU
UkxfUlhfUFJPTUlTQyBcXCBcaGxpbmUgVklSVElPX05FVF9DVFJMX1JYICYNCj4gPiArVklSVElP
X05FVF9DVFJMX1JYX0FMTE1VTFRJIFxcIFxobGluZSBWSVJUSU9fTkVUX0NUUkxfUlggJg0KPiA+
ICtWSVJUSU9fTkVUX0NUUkxfUlhfQUxMVU5JIFxcIFxobGluZSBWSVJUSU9fTkVUX0NUUkxfUlgg
Jg0KPiA+ICtWSVJUSU9fTkVUX0NUUkxfUlhfTk9NVUxUSSBcXCBcaGxpbmUgVklSVElPX05FVF9D
VFJMX1JYICYNCj4gPiArVklSVElPX05FVF9DVFJMX1JYX05PVU5JIFxcIFxobGluZSBWSVJUSU9f
TkVUX0NUUkxfUlggJg0KPiA+ICtWSVJUSU9fTkVUX0NUUkxfUlhfTk9CQ0FTVCBcXCBcaGxpbmUg
VklSVElPX05FVF9DVFJMX01BQyAmDQo+ID4gK1ZJUlRJT19ORVRfQ1RSTF9NQUNfVEFCTEVfU0VU
IFxcIFxobGluZSBWSVJUSU9fTkVUX0NUUkxfTUFDICYNCj4gPiArVklSVElPX05FVF9DVFJMX01B
Q19BRERSX1NFVCBcXCBcaGxpbmUgVklSVElPX05FVF9DVFJMX1ZMQU4gJg0KPiA+ICtWSVJUSU9f
TkVUX0NUUkxfVkxBTl9BREQgXFwgXGhsaW5lIFZJUlRJT19ORVRfQ1RSTF9BTk5PVU5DRSAmDQo+
ID4gK1ZJUlRJT19ORVRfQ1RSTF9BTk5PVU5DRV9BQ0sgXFwgXGhsaW5lIFZJUlRJT19ORVRfQ1RS
TF9NUSAmDQo+ID4gK1ZJUlRJT19ORVRfQ1RSTF9NUV9WUV9QQUlSU19TRVQgXFwgXGhsaW5lIFZJ
UlRJT19ORVRfQ1RSTF9NUSAmDQo+ID4gK1ZJUlRJT19ORVRfQ1RSTF9NUV9SU1NfQ09ORklHIFxc
IFxobGluZSBWSVJUSU9fTkVUX0NUUkxfTVEgJg0KPiA+ICtWSVJUSU9fTkVUX0NUUkxfTVFfSEFT
SF9DT05GSUcgXFwgXGhsaW5lIFxobGluZSBcZW5ke3RhYnVsYXJ4fQ0KPiA+ICsNCj4gPiArRm9y
IGNvbW1hbmQgc2VsZWN0b3IgVklSVElPX05FVF9DVFJMX1ZMQU5fQURELCBkZXZpY2UgcGFydCBj
b25zaXN0cw0KPiA+ICtvZiBhIHdob2xlIFZMQU4gdGFibGUuDQo+ID4gKw0KPiA+ICtcZmllbGR7
cmVzZXJ2ZWR9IGlzIHJlc2VydmVkIGFuZCBzZXQgdG8gemVyby4NCj4gPiArDQo+ID4gIFxzdWJz
ZWN0aW9ue0RldmljZSBPcGVyYXRpb259XGxhYmVse3NlYzpEZXZpY2UgVHlwZXMgLyBOZXR3b3Jr
IERldmljZQ0KPiA+IC8gRGV2aWNlIE9wZXJhdGlvbn0NCj4gPg0KPiA+ICBQYWNrZXRzIGFyZSB0
cmFuc21pdHRlZCBieSBwbGFjaW5nIHRoZW0gaW4gdGhlDQo+ID4gLS0NCj4gPiAyLjM0LjENCj4g
Pg0KPiANCj4gUmV2aWV3ZWQtYnk6IE1hdGlhcyBFemVxdWllbCBWYXJhIExhcnNlbiA8bXZhcmFs
YXJAcmVkaGF0LmNvbT4NCg0KVGhhbmtzLg0KDQo=
