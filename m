Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2047.outbound.protection.outlook.com [40.107.100.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E656C17BB08
	for <virtio-comment@lists.linux.dev>; Tue,  1 Oct 2024 09:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727773779; cv=fail; b=dAZAoMAnGejE753UW8C7om4JMyu7s2tzL4QpdMOJrxgfwx9WspFyOTsJ7ONSPfOYdG28Ybi0EhG+JYprtokUhYarghokGKoEX9u2Lsak7rIK8nqJ9N1DyIdaNtSnHpncVPOmNeCGeODUfz16Vp8hETaL9UKl9/fX4MSiOKO8A0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727773779; c=relaxed/simple;
	bh=VJ9Pcqp1z8Ve0QqxxobX7n/sLJHPCjIV/3hG0s4jz4o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hIvTDOGP2r4fZnldZx/9hEWz5obF7r+jGdQVBJq/jibKkyE0Slqum8gT2qvqye0jX5NgCTMB1RpNtckyszX7JatoHAExk9aF6u3gN2d3kOizWAODYKtqXUdrSv7U7T09zz7Wr/n4mfa+qNnXcDKwwuRMHh68QT+lq4PoHXUh9Es=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UMWqhJpF; arc=fail smtp.client-ip=40.107.100.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UMWqhJpF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isoF4Mg0F/ntyTuZLHCn7/1BTHY3ld9nTnBbhvVIczv4XFIy5IfiIBtCVJDli9zrQW6RyOw1TFIQb8/eSaiBB3yImPi/nSxpTNQ7pqp/3q8izgenrUIJkFdE17ddBMJKha6DFaNG/A3i11kDcfMyNvvxtEKDmRZk7/zxrx9vVWZaJOtvHhFLbbFTeQ2bCucrmk7tkd0uFlwa3iu3HJKGj7MvvDQINQNnRQ1pmaa8uq7Rwnn9KHrRICuK1m0KOXJB3trflzEzG1jsrPi3UQKLLEOsQ0o8H5WeQ3aiobCTlh+NmU00Ngr1zpVy66vWGxbjwYYunVjW+tSh1v8//+I1Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJ9Pcqp1z8Ve0QqxxobX7n/sLJHPCjIV/3hG0s4jz4o=;
 b=YJMWoy43T3hM6QvYZGef3nihj3RxTAzKwqyDOR8MBRqr0XXvz/I2IPlcPNEEkW8+Yodllxhif+uPe6YgRyV3E1HZ+JC0X6VrFrmUUjQUy275FcsMunAScg2PpevBgqK0aaO4yNk7vJ1mFSobRrjlApkEQirGeATFC23iudChY/w8orlIkORywWj4BR0ODIOxhR+LDVtRbweF4sCvbpPAQ943UBpyGRWnC/yDlyVjEIJHZ64IJaDDbCU+7uc+1W4iuqmFZ/JsoD7smhl4Zcl2rKogkj1iUsJjY90S11Ne7B2XjFAQFO1QuMwS5d8FE5O+PDf2aXojKlEBthmHr4TiUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJ9Pcqp1z8Ve0QqxxobX7n/sLJHPCjIV/3hG0s4jz4o=;
 b=UMWqhJpFQpSwNNxfCVNKNIamnYC/sOku5WzzSWOVTe1ClvmfPuS+vbdRZit+cQV0Hxfc+/tF+4x3h8DVMm0BUZXOxlf63WkEabr8UpH9M2ltQiW6WPw5ssaT4OoivoA9jMhjOcAQiDRDtsokdoA+BQUyJVyPbwQnb6Rt1COPtJFnfPxamXNYTVLfb3ZBjvYC35y7u8abtfzbg/bOKJFuedyOk+MvXupyIafyQGHKgN/LoeMguOW/kNgOzCUfh9BaYxXnUepJkJqSg0UmC8OXvKmhKsOgY/3E6FFXluoANeKT74Ufja1UIn+swSvW72nrniWL9dmFqo6xlzYFXtAwvQ==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by PH0PR12MB7813.namprd12.prod.outlook.com (2603:10b6:510:286::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 09:09:33 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 09:09:32 +0000
From: Parav Pandit <parav@nvidia.com>
To: Albert Esteve <aesteve@redhat.com>, Cornelia Huck <cohuck@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"aiswarya.cyriac@opensynergy.com" <aiswarya.cyriac@opensynergy.com>,
	"acourbot@chromium.org" <acourbot@chromium.org>
Subject: RE: [PATCH v3] content: Reserve ID for media device
Thread-Topic: [PATCH v3] content: Reserve ID for media device
Thread-Index:
 AQHbACulN7OJ8hVWBUuunhxN0rzrwbJoLecAgAmAf7CAAAvJUIAAA7uAgAAEcwCAAABUUA==
Date: Tue, 1 Oct 2024 09:09:32 +0000
Message-ID:
 <IA0PR12MB8713A23CD9E920972F9012C1DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240906070833.1949727-1-aesteve@redhat.com>
 <CADSE00KO=VZy4_4FfgC7ODON32mZ8khWkPUcXheP6pTiEZAyHA@mail.gmail.com>
 <IA0PR12MB8713CC178EDB984292755C5DDC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <IA0PR12MB87130D5F5839629436E0A748DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <87ikucrysk.fsf@redhat.com>
 <CADSE00KJCSDBmkyBPXdpkb0X-b=wFickv8XR6AEtgSv4N2ai_g@mail.gmail.com>
In-Reply-To:
 <CADSE00KJCSDBmkyBPXdpkb0X-b=wFickv8XR6AEtgSv4N2ai_g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|PH0PR12MB7813:EE_
x-ms-office365-filtering-correlation-id: 08eecac0-ca69-4ec0-bf8b-08dce1f8c38b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SU5wenpYNlRBVzlJM05CdXVrRm5KQW4wOGpYYkkvT3JuUTVITW9WR2VrRy9T?=
 =?utf-8?B?aXpVOUtZTEZsMy95bkJpUUxQQk0vK2FFRkNMQzVhMnhiTnd1NmVETDBJSHEx?=
 =?utf-8?B?aXphUVRhd3lOcTNpbi9adGtjbWx2SElYOEtjbHgvc0ltMjVFaWsyMEhLdkVP?=
 =?utf-8?B?dkJGZnVHbFZsZmlLOHFsYzh2cnRzYTIyNmhScWxLN0Z6Q2l6VG1JcmJWNkRI?=
 =?utf-8?B?TXZodCtqQ1dVaHZlaTZkNkI2Y2gwTFd5MVBhcDc3bEloV2IzMWo5MURUSzY2?=
 =?utf-8?B?dEI0T3llK3Vkam5jK2ZNNE1ST1VXWFc1TU8xVk5HaXdJTDl6Snk2VHJEK1VB?=
 =?utf-8?B?Ry9ubHlBRFh1R2JUdFZrczVYdWlaeFZBMGFodVpITmFDRjMxSjlPYWN0MWhJ?=
 =?utf-8?B?eUd2YklRRDFSVTdUOU1JVUhHT21KWHVacC9WMXNjU2k3K1ZKTmNjZnZqZUg5?=
 =?utf-8?B?UnpCRUs0bjR4WHBxSTVvWWhvQmxiMk5MaVFBZnIyM0Fpa1NMUkJBdDNHT2Yv?=
 =?utf-8?B?L1cvKy9hYnNVbVlQOEZCM1dJKzkyL0NCRUVSOGUwRU1nQWh5TGR2OEw2SXp4?=
 =?utf-8?B?ZEtQZm12T2FaNCtIdXRvM2ltVkxLZllJdGt4YWF4MHZhUzFWYldTeDAyaUl4?=
 =?utf-8?B?OXJDZHN3NHRBWXgyQ0x0SG9rOW0za0tmYnFEQUhmdWVrMTVOTFlLMml0MEE5?=
 =?utf-8?B?RXpKUDhjNm9HQ1l2QlE5WmhWWGtSVWI5VWdJdFRFZWozRDJRTStkRkJ2YThO?=
 =?utf-8?B?UGpUQjE2ZkFFcmRjTEpLQkxGYml5YlIvbVQvcDlsNmpjSkRtczhBRVdJNjd0?=
 =?utf-8?B?SmNVR0U5TXRRNERyMlI3WklvTzRvVTRvWW5UZ1hoSDNMWnZsTXNMc2ZnWFVI?=
 =?utf-8?B?WFlxcG9wU2dCQUx1clRvOVNkejlpMVFVbkJhNUpuUEJHQTJqZVVJZzdSTExl?=
 =?utf-8?B?VUgrb3lWTWRad2xmSURDTFRnZEloam5YeFE1eEZIUVdBY2FYejMxOER1bXI5?=
 =?utf-8?B?eFpFT2VHRjljUlF6cnV4Sng1ZjZtdnVKRG40NWtzZkdDcmYzdDIweGV4M2FG?=
 =?utf-8?B?Z3luVHFIWTJSSGdSek1LRHdQc3l4STZScFMrWm1TaDkxd004YmJlMGZUYTJi?=
 =?utf-8?B?dXJuYWpMMDFLbXo5ZFBEMFJzTUpKVG1qdTZhNEVtelFlTkxrWGI5cllBNmNv?=
 =?utf-8?B?a3lYT2s1dm1qM0o2a204UU5BOUZSUGdSUXNiRDlHSk5EUWcxRGZhdFRqeDM4?=
 =?utf-8?B?bXY5elRBRm5VTFdyd2NSYUhoQWZUanVvR1k4VzBPTE5obXFZd0NLWksrZDZQ?=
 =?utf-8?B?TlNMQlBZNnVHYUtjUk9VV0U1cCt4cnp1MktnYnEzNXRtMTY0aWNHSGdqUGpy?=
 =?utf-8?B?YzJqN2kxU2MwNDlYZ2J5ejJTTTVTbmUrUG5JU1lJUTVVYURERlRldVRLRmFS?=
 =?utf-8?B?R3NEZUg5RDdJTm9xdVhSNmJNcXJ5UWg3SEdESjh1ek94QWRDbGhoZW03OXVB?=
 =?utf-8?B?MXMzaXZWODBjTkhPWllrUVdRcnBtcTJsdmJ6eFhtZ3Fzc1RJd09xd0xReWtC?=
 =?utf-8?B?T0VsTy9kTXMrbXRIU3VHOEVibzBCRkhyd1ZwQzVpSEExbGtiT3dlWDV6dHdo?=
 =?utf-8?B?bUM2M1RtUHA0V1BYRW1DUjBaeCtvZmtKRzdXRVVYeXhweUc4R1pnYkx4eVV6?=
 =?utf-8?B?aGVjSTk4elR0QWRJc0QrTHFyeU8zamlHdzZaMDVCOWtmSHJFMWdaaElmSHdW?=
 =?utf-8?B?OTBJMkJPTWNrbE0zOUd5ZnpwalY5RDFFY3dUMVh4QUppL3hLZ0dUZU5VK3Zu?=
 =?utf-8?B?UHN0Wk9VSmxuWENnbENzdz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OUM0MzFpcThjNXRxbmcxK0EyMlJIUFRiclA5dHZQRG5uTkZ5UE0rODgwRE9I?=
 =?utf-8?B?cXVsWjErbkxWNktaS0QwcTZ4cW4vTllKNTVYNkk1Kyt3a0dVL2xNbVRnZFhy?=
 =?utf-8?B?MWhyRENKSVN2YVZyS0dxME1aOE1NeVFEN0VOdVlQZTMvLzA2c01IMTdjaHpr?=
 =?utf-8?B?aXVFak1lQW40SnlrR2NHYm1OYXFraGwxd2V1K1UvSFlwL1FpZTNyYXdkRm0v?=
 =?utf-8?B?aE9za2xEblpSQ3J6TFlURjl5NkNha2Z6T1BCVEJJV3pEdDY1WmRQVTcwTG9h?=
 =?utf-8?B?Mnp0dklJWWlRb2U0UVRIWjNOR09iL1BrOXFrZ0UySnVkQ1lnWm9hWThUMkRm?=
 =?utf-8?B?M0lIYzh1TitDKzIzZW5XaCtERGVXa0dyQmpYaDZlV2hzWXpMYnFXbUV3VVMv?=
 =?utf-8?B?RnJDcloreFhHbDBnZE5McE4rRi8rY0NjNVVTUURvT2hRbG5wd3lOZGUzYVVQ?=
 =?utf-8?B?QUxDczB0TU1nbE1qcGxsSVhJTExFd0tOczVFbWZLY3FKMzF2ZlFTZ2VXVWds?=
 =?utf-8?B?NkNVTUNrcFBPTXBQOEszMDdlUkhDNjJERHhFcGdoMWtOMnQzSnVxZ3E5OUhq?=
 =?utf-8?B?c1Z0QW52cGkwMlliSm5jTmJBM3gvQjlKa2lsdzdaMFR2NE1VOUlSQ3BtNnR6?=
 =?utf-8?B?aWtqWXRmT1lkWkkrL0c2MUhHdVpwckFpSzg4N0pIRC90eGo4MFNrWTVYV1Rt?=
 =?utf-8?B?N1JUZGs1UG1YeUNMS2dqY3ViS2lVOGZWSVlXSkt5VCtiTXdsK1dZU2xOYXUy?=
 =?utf-8?B?aWhKb3dIQkkxbE1XNVoxcjZId1psbzJYMEtBcWoxODhiMVE3ZjU2Q2lhbHc2?=
 =?utf-8?B?Zk9mMWVoYlp5NC9zaWRzeEFYcEMwZzBCYU1KVzNhYjR0eDhOMkZZNW12MldU?=
 =?utf-8?B?UlNUaDZwa0trS0cxQ2EwNmpaME5uWjRZYTdwOVp0QXJMQW45bnh1djEyWjJm?=
 =?utf-8?B?UjE4Y2tZSkthUnA3Mk4vL1U5S1Vrei9GMU9pVWpDbHJFUy9aSE1WNFo2RWkr?=
 =?utf-8?B?ZzBqL1VQS0ozRjRCbHRoV0JkWENBb2FsSCt2c3RjTkhiejBwWm1qaVRnRVFE?=
 =?utf-8?B?UmdreDZTTWFTWFdKaVRNcWtydHlQTml3UnFUS1BYbHJXVEg0YnEydlIwNG5m?=
 =?utf-8?B?SkNOZ1prVFNQdnVSRU5ndkYrdVl5eWFKdmZGUVhja3lyazh4WnBvV2RaU3Rl?=
 =?utf-8?B?dUhTQWFZK3JsMllFeGtqWTBQY2lBeEpLTTZVMnQyYTY4ZGU4eGFmbEtLWjdj?=
 =?utf-8?B?SDNsWVJ2U3ZOVzgzZ09MZGRJVzhCajZ4TnFXTW1jbGRIWVREcVdtWlUvOUtt?=
 =?utf-8?B?eExYSlRjSTR4TUxwTWpic0w5bC9DY3psTVVOdjFvclo5TWNpQjhFOXl3b3Y4?=
 =?utf-8?B?U3RNanRBSlpnbzRoL1RDbCswOENwZDlScXpucndWVVM3cDdZOExQYitTM0hl?=
 =?utf-8?B?dEtEWVlxQkl5aGtGazdxWVppL3h6NVdadExIR2NaYUhrekdiSEdmNW1UR3Vr?=
 =?utf-8?B?d0VXcHRXclY5ei81aXJZQ0YycTBTN1RNVGwyRTYxWFdkK2FEVGtFTVRrc0ow?=
 =?utf-8?B?OEc4MjYzdkVlZVJLbUg1VTJLc2JPQzAwaDViRHFNS0N6YkIvd0pDYUQ5U3Rj?=
 =?utf-8?B?NmNRSTJRUkcxZnRGVjJPV1NhZ3lvbWp0WDhaK3RWQXcvaml3aHhROHMzaDFP?=
 =?utf-8?B?bnAwVlhNOWw2MjN5UitmaGE5L0NWcFBHKy9sRW80Z2I0czlxZTBjWFN6ZXBn?=
 =?utf-8?B?YUx4ajBQYnNmU3lHc1pVTCtGY21QYVpCR0ZBYlh2dVp0U0NuTzNZRHVDN2h4?=
 =?utf-8?B?cnZVRGRpM1pQSzkxOHlRTDI3N0dRaFBRU29USVRMVlRlcTFNNzI2YWxHd25h?=
 =?utf-8?B?SUY0QnFTT0pwRVRHZ1V6dTcybkRGcEMxMWlrZVNYcDRnRERZYStkeXg4N3ZV?=
 =?utf-8?B?U2FCWUt6VnFBanZxZDRqVjd1Y0x1WmlybzZMWXBLaWl0UmI3YnJrUTFuWTZE?=
 =?utf-8?B?cVBxaEQwQm9nM0ZXSFg5a3AyLytYTlcrZEZkeXhTQi9QTnpWbjZ2Mng1T2Yr?=
 =?utf-8?B?anAxdGM3Q1dWZWdLUEdaeXhqM01RL1I0Y1FRelB1bVFsV0MyTHhRdS8ydXg4?=
 =?utf-8?Q?jgx8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 08eecac0-ca69-4ec0-bf8b-08dce1f8c38b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2024 09:09:32.8103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uv0qLKM4MhuAYbA0ejFlH+wYkz3u0lch+Zu1mUtv1DDUz1BR2AIDO4qehAg2lJU+t3NGXQ64LHym/35H5Y5coA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7813

SGkgQWxiZXJ0LA0KDQpQbGVhc2UgZml4IHlvdXIgZW1haWwgY2xpZW50IHRvIHNlbmQgdGV4dCBv
bmx5IGVtYWlsLg0KSXQgZ2V0cyBoYXJkIHRvIGNvbnRpbnVlIHRoZSBjb252ZXJzYXRpb24uDQoN
CkkgZG9u4oCZdCBzZWUgdGhlIG5lZWQgdG8gY2FuY2VsIHZvdGluZy4gV2hlbiBtZXJnaW5nIHRo
ZSBwYXRjaCwgd2UgY2FuIHVzZSA0OC4NCg0KRnJvbTogQWxiZXJ0IEVzdGV2ZSA8YWVzdGV2ZUBy
ZWRoYXQuY29tPiANClNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMSwgMjAyNCAyOjM4IFBNDQpUbzog
Q29ybmVsaWEgSHVjayA8Y29odWNrQHJlZGhhdC5jb20+DQpDYzogUGFyYXYgUGFuZGl0IDxwYXJh
dkBudmlkaWEuY29tPjsgdmlydGlvLWNvbW1lbnRAbGlzdHMubGludXguZGV2OyBhaXN3YXJ5YS5j
eXJpYWNAb3BlbnN5bmVyZ3kuY29tOyBhY291cmJvdEBjaHJvbWl1bS5vcmcNClN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjNdIGNvbnRlbnQ6IFJlc2VydmUgSUQgZm9yIG1lZGlhIGRldmljZQ0KDQpIaSwN
Cg0KSSByZWFsbHkgd291bGRuJ3QgbWluZCByZXNlbmRpbmcsIGJ1dCBnaXZlbiB0aGF0IHRoZSB2
b3RpbmcgaGFzIHN0YXJ0ZWQsIG5vdCBzdXJlIGlmIGl0IGlzIHdvcnRoIGNhbmNlbGluZy9jaGFu
Z2luZyBpdCBub3cuDQoNCkJ1dCB3ZSBjYW4gcGVyaGFwcyB0cnkgdG8gbW92ZSB0aGUgbmV4dCBk
ZXZpY2UgdGhhdCB0cmllcyB0byBzdGFuZGFyZGl6ZSB0byBmaXQgaW4gdGhlIGdhcCB0aGF0IHRo
aXMgcGF0Y2ggY3JlYXRlZC4NCg0KDQpPbiBUdWUsIE9jdCAxLCAyMDI0IGF0IDEwOjUx4oCvQU0g
Q29ybmVsaWEgSHVjayA8bWFpbHRvOmNvaHVja0ByZWRoYXQuY29tPiB3cm90ZToNCk9uIFR1ZSwg
T2N0IDAxIDIwMjQsIFBhcmF2IFBhbmRpdCA8bWFpbHRvOnBhcmF2QG52aWRpYS5jb20+IHdyb3Rl
Og0KDQo+PiBGcm9tOiBQYXJhdiBQYW5kaXQgPG1haWx0bzpwYXJhdkBudmlkaWEuY29tPg0KPj4g
U2VudDogVHVlc2RheSwgT2N0b2JlciAxLCAyMDI0IDE6MzUgUE0NCj4+IFRvOiBBbGJlcnQgRXN0
ZXZlIDxtYWlsdG86YWVzdGV2ZUByZWRoYXQuY29tPjsgbWFpbHRvOnZpcnRpby1jb21tZW50QGxp
c3RzLmxpbnV4LmRldjsNCj4+IG1haWx0bzphaXN3YXJ5YS5jeXJpYWNAb3BlbnN5bmVyZ3kuY29t
DQo+PiBDYzogbWFpbHRvOmFjb3VyYm90QGNocm9taXVtLm9yZw0KPj4gU3ViamVjdDogUkU6IFtQ
QVRDSCB2M10gY29udGVudDogUmVzZXJ2ZSBJRCBmb3IgbWVkaWEgZGV2aWNlDQo+PiANCj4+IEhp
IEFsYmVydCwNCj4+IA0KPj4gRnJvbTogQWxiZXJ0IEVzdGV2ZSA8bWFpbHRvOmFlc3RldmVAcmVk
aGF0LmNvbT4NCj4+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDI1LCAyMDI0IDEyOjIwIFBN
DQo+PiANCj4+IA0KPj4gT24gRnJpLCBTZXAgNiwgMjAyNCBhdCA5OjA44oCvQU0gQWxiZXJ0IEVz
dGV2ZSA8bWFpbHRvOm1haWx0bzphZXN0ZXZlQHJlZGhhdC5jb20+DQo+PiB3cm90ZToNCj4+IFJl
c2VydmUgZGV2aWNlIElEIDQ5IGZvciBtZWRpYSBkZXZpY2UuDQo+PiBDb21wYXRpYmxlIHdpdGgg
dmlkZW8gZW5jb2RlciwgdmlkZW8gZGVjb2RlciwNCj4+IGFuZCBjYXB0dXJlIGRldmljZXMuDQo+
PiANCj4+IFNpZ25lZC1vZmYtYnk6IEFsYmVydCBFc3RldmUgPG1haWx0bzptYWlsdG86YWVzdGV2
ZUByZWRoYXQuY29tPg0KPj4gLS0tDQo+PiDCoGNvbnRlbnQudGV4IHwgMiArKw0KPj4gwqAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+PiANCj4+IGRpZmYgLS1naXQgYS9jb250ZW50
LnRleCBiL2NvbnRlbnQudGV4DQo+PiBpbmRleCAwYTYyZGNlLi42ZDZiM2Q4IDEwMDY0NA0KPj4g
LS0tIGEvY29udGVudC50ZXgNCj4+ICsrKyBiL2NvbnRlbnQudGV4DQo+PiBAQCAtNzM5LDYgKzcz
OSw4IEBAIFxjaGFwdGVye0RldmljZSBUeXBlc31cbGFiZWx7c2VjOkRldmljZSBUeXBlc30NCj4+
IMKgXGhsaW5lDQo+PiDCoDQ1wqAgwqAgwqAgwqAgwqAmwqAgwqBTUEkgbWFzdGVyIFxcDQo+PiDC
oFxobGluZQ0KPj4gKzQ5wqAgwqAgwqAgwqAgwqAmwqAgwqBNZWRpYSBkZXZpY2UgXFwNCj4+ICtc
aGxpbmUNCj4+IMKgXGVuZHt0YWJ1bGFyfQ0KPj4gDQo+PiBUaGUgaWQgNDggcmVxdWVzdCB3YXMg
bWFkZSBzZXZlcmFsIG1vbnRocyBhZ28gaW4gTWF5LTI0IGZvciB1c2IsIG5vIGZ1cnRoZXINCj4+
IGludGVyZXN0IGhhcyBiZWVuIHNob3duIG9uIGl0Lg0KPj4gQmV0dGVyIHRvIGF2b2lkIGhvbGVz
IGluIHRoZSBkZXZpY2UgaWQgYXNzaWdubWVudC4NCj4+IFNvIGlkIDQ4IHdvdWxkIGJlIGJldHRl
ciB0byB1c2UgZm9yIG1lZGlhIHRoYXQgaGFzIGludGVyZXN0Lg0KPj4gQWRkZWQgdmlydGlvLXVz
YiBwcm9wb3NlciB0byB0aHJlYWQgdG8gc2VlIGlmIGl0IGlzIHN0aWxsIGludGVyZXN0aW5nLCBp
biB0aGF0IGNhc2UNCj4+IDQ5IHNlZW1zIGdvb2QgaGVyZS4NCj4+IA0KPj4gR2l2ZW4gdGhlIHZv
dGluZyBoYXMgc3RhcnRlZCwgSSBhbSBub3Qgc3VyZSBpZiB0aGUgcmVhbCBpZCB2YWx1ZSBtYXR0
ZXJzIGFzIGxvbmcNCj4+IGFzIG9uZSBvZiB0aGUgdW5pcXVlIGlkIGlzIHJlc2VydmVkLg0KPj4g
DQo+PiBBbmQgZG8gbm90IHByZWZlciB0byByZXN0YXJ0IHRoZSB2b3RpbmcgZm9yIHN1Y2ggYSBz
bWFsbCBjaGFuZ2UgZWl0aGVyIG9uIG15DQo+PiBsYXRlIG9ic2VydmF0aW9uIG9mIHRoaXMgaG9s
ZS4NCj4+IA0KPj4gSSB0aGluayB3aGVuIHRoZSBtYWludGFpbmVyIG1lcmdlcyB0aGUgcHJvcG9z
ZWQgcGF0Y2ggdG8gYXNzaWduIGlkIDQ4LA0KPj4gc2hvdWxkIGJlIGZpbmUuDQo+PiANCj4+IE1p
Y2hhZWwsDQo+PiBBcmUgeW91IG9rIHRoaXMgd2F5PyBPciB5b3UgaGF2ZSBiZXR0ZXIgc3VnZ2Vz
dGlvbj8NCj4+IA0KPj4gQWlzaHdhcnlhLA0KPj4gSXMgdmlydGlvLXVzYiBzdGlsbCBpbnRlcmVz
dGluZz8gSWYgc28sIGNhbiB5b3UgcGxlYXNlIHJlcXVlc3QgZm9yIHRoZSB2b3RlPyBTbyB0aGF0
DQo+PiB3ZSBhdm9pZCB0aGUgaG9sZSBpbiBkZXZpY2UgaWQgYXNzaWdubWVudC4NCj4gSSByZWNl
aXZlZCBhdXRvIHJlcGx5IGZyb20gQWlzaHdhcnlhJ3MgZW1wbG95ZXIgdGhhdCB0aGV5IGFyZSBu
b3QgcmVhY2hhYmxlIGR1ZSB0byBhY3F1aXNpdGlvbi4NCj4gU28gbm90IHN1cmUgaWYgdmlydGlv
LXVzYiBhbmQgNDggaXMgc3RpbGwgcmVsZXZhbnQuDQoNCk9UT0gsIGEgZ2FwIGluIHRoZSBpZCBs
aXN0IGRvZXNuJ3QgcmVhbGx5IG1hdHRlcj8NCg==
