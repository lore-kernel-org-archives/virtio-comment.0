Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2120.outbound.protection.outlook.com [40.107.117.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A7F8F7D
	for <virtio-comment@lists.linux.dev>; Wed,  3 Jul 2024 04:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719981171; cv=fail; b=Do8pTOwRAH8uaqVqLWXe8uFQXxnagNxaxj89cKwKZZWDCtEfww82KcaVorb0zx/b5CNB/xNXbyKK/zKch4T7CEnF/n9l+6ubSFC9dpsiQUGd0ad9I91qE8b0ebiWTKvManlQWEz095rqOsoGPhDIKxCfgozQOh9HYG3mQyYkKtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719981171; c=relaxed/simple;
	bh=Iwmwhro/a0b5p3bFcAhq2HDyhhkKS95dIoo/p1P02CA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B4ZODUibx5iSXyayXK5LjzwUL44XXE4T3oD9uNzyoPFKM3jECt+irIaSBiwYTEGRTgwsuTuuIA3kCfPiBtaSGHbq+IkAvi6qYLTRXaulf4DL8QEQS+6E504BetbHUUwvgHqVStgnN9rLK0QtmgkzHlbJYeQz/dUqoEzc/sjeg4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com; spf=pass smtp.mailfrom=jaguarmicro.com; dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b=IeBfyvo3; arc=fail smtp.client-ip=40.107.117.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b="IeBfyvo3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiZoHcwd91nowF9gYbGO1qkfUeHROLzcbgOWvSgy4HxJBSl5n9/0+5ZWUptfTMq9KrqR/7xlVfn8GJ+6z9kPxW4y3HsmoV/Unt1nzGkGa/zcXMJclolUhi0zxhoiAIyko8EqvpeWHpowCYvc+HQpwD3A+7d/XXX4EBiiO+9QNTdlNfcjKMhH+tacbOamjB5usF5iJZv0hm+VM0VtViMVUthtYrKSkoESKeuBVF0PvtR8IeD7C+X+l0IVxjp0Iy41J5KXQYLB+oWh55tYIcStM/4p6Je8441iXNabk93GsymFvHFZwA89iBpvCkZRmrTkSD9bI9u9lOGYu3dngniP+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iwmwhro/a0b5p3bFcAhq2HDyhhkKS95dIoo/p1P02CA=;
 b=P3QD6+SHjQORTlFEadeHNz7Mtbp4t3umoBzMn56/VdxyG9r40hOPKXJM8VFlQWokvoQT6jPcWnPj+k8OxAzsHxJRZ3IeBh55JzNIBm3D/+DxRbXqjIfw9Gn4GIu8I5hzdtHkruB5JNpMXB/ZY4folU0zgf0d91f3sQdet4KZKZxAxxzgY5Ip59ZIkixP3Id7MiX71UQ0SSJe3evdRHvA+dMEFZtwezAhQX55sVJuBeGeS/4yCzhUMhBxZiRwM2p7z/TapDmDaCAjJApU5sKbYoWhXptFXQrJQ1csx6jYyHm/HlpZxI0epn+SGRP8d8QxhMyVVioLSmnlMnj7SD+oyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iwmwhro/a0b5p3bFcAhq2HDyhhkKS95dIoo/p1P02CA=;
 b=IeBfyvo3JM2E8DFM/RPUHawKjQVjma5oxz0rJa9KTM6m1PSj5MKl4o+URyDREQ2U+C3n6IolbCqFAG5qViKQdyx1SqaiBOPvsi0iFNPdtgbQj6FeUdWNSWZeNzAGJaZFPEKeCRYAg8SuEuS5gJlp5g0HGXTMomoS4+e5VnxuARZcWXCZY9hpr1F9f2Rp67LzGWYz/O0xzHJ1O5PSehs0YLJQ3EEAQg7TphvBzrcZ1b7+RnZ+2idUo9aDgI4NY2NLCWP171In0X5fy7jOecvf2mSTQyhMgfjY44ZxvO706+UkE4TDJkWO8qFCV3zmtowNizVBQpTB8+HN+s380aVagg==
Received: from SI2PR06MB5385.apcprd06.prod.outlook.com (2603:1096:4:1ec::12)
 by PUZPR06MB6065.apcprd06.prod.outlook.com (2603:1096:301:110::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Wed, 3 Jul
 2024 04:32:40 +0000
Received: from SI2PR06MB5385.apcprd06.prod.outlook.com
 ([fe80::967d:afda:6f4:33dd]) by SI2PR06MB5385.apcprd06.prod.outlook.com
 ([fe80::967d:afda:6f4:33dd%6]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 04:32:39 +0000
From: Lege Wang <lege.wang@jaguarmicro.com>
To: Jason Wang <jasowang@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"vattunuru@marvell.com" <vattunuru@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "parav@nvidia.com" <parav@nvidia.com>,
	"mst@redhat.com" <mst@redhat.com>, Leo Liu <leo.liu@jaguarmicro.com>, Angus
 Chen <angus.chen@jaguarmicro.com>
Subject: RE: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Thread-Topic: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Thread-Index: AQHay2kF67vqaBJYMUW1XCStKdNnOLHjD2wAgAEtn3A=
Date: Wed, 3 Jul 2024 04:32:39 +0000
Message-ID:
 <SI2PR06MB53850C468CF18A489A6E1ED4FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <CACGkMEvrHNnjdgC6Ls=YWRPFxpirCFkbf8_VnNsh-VU4NoK3tw@mail.gmail.com>
In-Reply-To:
 <CACGkMEvrHNnjdgC6Ls=YWRPFxpirCFkbf8_VnNsh-VU4NoK3tw@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5385:EE_|PUZPR06MB6065:EE_
x-ms-office365-filtering-correlation-id: 6714a374-a5ab-4117-c54f-08dc9b192c19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eE5BN2hFbk9CYUxtWERlazBHSHJCMW91eEkxQjczbGtMRWpXaTNncDNzM3BR?=
 =?utf-8?B?dWlxT3FMWHJjSFdZWklqNmRsQ0NqeVc0dzJMVDI5NmZhS1JLZ1dCZHdWNHRj?=
 =?utf-8?B?MU1qUW1kbDVGZU9mdkZpekp6cVNSZkg4MnNaTEdkMnFmalJPZWk4aDFyZzAz?=
 =?utf-8?B?Ky9LT1BSUEZwRDF1NkwvdFBTOFFrOFYrZktJMjA2eGgxQ01HaTNlRU82SGI3?=
 =?utf-8?B?U012OHRtSmQvZGZJQS9lSGJGUGpLMW5CU0t5YVZaZXFmZy8wUTViYlBVR2FI?=
 =?utf-8?B?N01yYW50QnR1TFVmSTlPeVlucS9HNmRLemx0ZlZwNGRpR1JMUldBUjdrellx?=
 =?utf-8?B?NHR5d0xpcUtYdkIxWUFZNllBZ0JHNkhna1NPWXVsV2dHSzYvYmVIQitQSWoy?=
 =?utf-8?B?d0pkUWR6MDBhVEhuelZDbUVsYURJaEVaRnk5WGtrYmt3Tk1iQ0oxVjV6YmZr?=
 =?utf-8?B?Z0Z0aEluSUJzb1h3UnJxekZIVXAwMkwwVXZwMHB4b1V6V21CMENXYWRoQlE5?=
 =?utf-8?B?ZVpPR1A1M282eUNYRVY4V2p6VTNQSW54QjM4UlNhc0d5Nm1wRDZGdGdwcXBr?=
 =?utf-8?B?ejNSd2Z5ejQ4bkRBMFNCM2I1SmtyalJ2R3llaU1UZVRmWU40UG1HUVBwMy9m?=
 =?utf-8?B?YUFVSURzZ1hqTUh0S1dvQ2RNSlZJd0xtaENpTG9aeDk2bnMyWDRYZWZ4clJP?=
 =?utf-8?B?c0xSOVJhQXlWZWgzRDRlemZJb3Z4Zmc5bjBnMkhycTE0amZ2M1VMNzB0QXU1?=
 =?utf-8?B?dUdVOCt6bllaWGQ0VHF0V3hqdDVXL0M0d1pPdld0MGlkUDhzMWpueUpWYVdY?=
 =?utf-8?B?dE1LMlRUT05oN3k4WHZ1TzJTOEMxaXY0UUNCUzNsNUorWGVrdkxHOWZkUmZs?=
 =?utf-8?B?aXdsNDhBTWc1WENkOE8zNFkwTFl1OXlzalhqTytQY0xydzVlYlhyUm5VaEVa?=
 =?utf-8?B?anhzSUJLTUV3N0RsYUZsSkVMVTB0NVZuRC9IbmoxbWZ5RG01N3U3K292bmVx?=
 =?utf-8?B?ZzdSTmlSZTNTM0ozZlFnNWpxc1lKU3FSWHJ1SmFuOXJJQ0FaZGdpbDh0Q2Vv?=
 =?utf-8?B?a3dZdkhBVVQ0eURTa0tWaC9XUkFmOURrSUJKZzBvUmo2cDRwSTNtYk9EcThV?=
 =?utf-8?B?UzBFQXZuV3FSbVdVV0w0RVhsd29QZ2trSjYzODg0dUVybVMzVncvbEFpeTk2?=
 =?utf-8?B?RWV6UGcrdStZdEZJUWhVRVl1V0czd1QxUzhXQmF3dmkyZXZaeVBDY1VmRHBF?=
 =?utf-8?B?VjNwN2ZOMlhpVzFjVjNoTWt6NmJjakdLTXJkcXEvTUhQV3c5d2hnbEFiSDNa?=
 =?utf-8?B?Q1A2VHJOQU14dTJHNyszWkdqbVFaOTY4Y0RuVnJXSjNrUzdIT0Y4WTVsQzdL?=
 =?utf-8?B?Q2czZ2g5UVlyU3JjejN4NmdESjczRnhyMlBaSlJMK3lvWE9zSHZWVlF0c3hX?=
 =?utf-8?B?ZHlRa0wxVXJOTEVVMC9GektuQVhDVGdtR0xMZkpiYjNVKzFadk54VXJMSVJE?=
 =?utf-8?B?VEdrMEFkN1FqKzRMeW5rcUs2UHQ2dzc0T2VQOUlEMDQrZjVpVkFVQzYrQzdW?=
 =?utf-8?B?cTRSTmtQbTBYQkJHU2ZoN1ZUdThOdzFoUFFTaGRkVE11ZjFCSDRWTTRjbnZO?=
 =?utf-8?B?Rnl2UUtiSGdQRHZzMU81d0VGR2dJbVFSeDh4anJNSE9ka2ExT0FBb2tEdG1Z?=
 =?utf-8?B?bVQ0RWhLWlVnZkowV1JHMEdCSHhqUjJPUS9QVGF5K040bkZ6YktacllXaUFH?=
 =?utf-8?B?RkdXU2RrRmpGdDVJcEZCemNOeC8rRmNlQ1IyaDlWOW41ZnI0NFViQmhhRGcy?=
 =?utf-8?B?cE5jeHJTR0h3ZnUrU1hQYzZ2bGx2S2lIYzhTMzVvVkp0cG5Yamtrd3dvU1cr?=
 =?utf-8?B?Z0pmT213WjFMczJXWGRlbmFoVzFkVEJhOU45aUx1bmEyaFE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5385.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RnhSSmtITldJNndPUnlVZElSQVIydU1RQXRDampocUtxZ0xhYUxacDl1dGx3?=
 =?utf-8?B?VzZKVWZjWUFFMmpYRU5EanFzSTNEVmZZLzRnMlhPK2E1djdLVkhUYlkzMHgv?=
 =?utf-8?B?TWRhSWhTWjVmaUE2cjU2RUE0MlYrZG56V3VPZ2h5Q2FMVzlmMk45L2lVL0gv?=
 =?utf-8?B?am5xeEZieElPb3ZpVThNMHR0dEhMaHV5bGZwZXh3VnF5VlRyU1JCQkhKMk1L?=
 =?utf-8?B?VmVXUUR1NXB1bDg3MDh6Mjd3MjNsaVJDemNSZFJDWFRZREppM20rUSt1ckJt?=
 =?utf-8?B?c1NEQXNmWDlRTW9mTnhZUDRFUnBHbXc3SjJ1ZDAvbVpheWdLQ2w1QUVJTFZa?=
 =?utf-8?B?WnFQRmtYSWpqV25VWTJHWDJ0bXdYV0RiSk1XakN1cDc3dnc5VGp4b1ZQempo?=
 =?utf-8?B?ZU5SYTRVTDNvR1B6dTF4bStkTnBHbHNjU3Nkanl5Y1JFUmwweEJCZkF3RE9L?=
 =?utf-8?B?QStURFRNbVYzckNSNDROZkN4aE1sYlVOaDBVNUhpTVFZYlR6UytTbmh4QkdX?=
 =?utf-8?B?dkxETkwxWUVEY05RUFZQNmVyVi9acmNxSnBYd2Yydmd4azBqK2Y2aVpjQStO?=
 =?utf-8?B?b3J0bmdXdEl3Z1lKLzIxRjNhN0tRcjRFRHVCUGNjQmZRQWp0SWdYNlRMMXI3?=
 =?utf-8?B?eVp1aGxPekRGbHJDOE1Zd2dabjlUKzRGdUEzK09ibW1oVzFBWGVZd3RXdFNz?=
 =?utf-8?B?OFZXa2g1b3ZCNEFDRnJRTU12L0NZTVRvNmM5OW50Y3I3MVBpZWNQVDhkb2pk?=
 =?utf-8?B?WGxIZXlsNU1uajZxeDJaM2lRLzlpWTJ6eFN3TG05SXBmZE5PbE9yQXZwTEIr?=
 =?utf-8?B?UlplM1lFaGxxZUdydk1PREVNSXk3Z3V1Y1J0V2daZENLdWpUdGhMUktmdkMx?=
 =?utf-8?B?VlM4K29mdTgveDJxV2JmOUxTZSt5dTJTODNpcHdrR2wwN05pdThiRnd3QnZJ?=
 =?utf-8?B?S3BrNnlzTWlOSUZwQzU4Ymw4Wld3Q2NmTkxNcm1oN2hERytidi9ad0lJUmJk?=
 =?utf-8?B?ZmNjOC9qNDQ5T09TVUJtNjlUUmZUV29rVWpTNVYwSzQyWnBkMUhvbHJiU3kz?=
 =?utf-8?B?SUxxbVVEMjNyd2dTQ2JKNm5RWUwzTjdUVFovVGkxeDMzNTJTcVhmQ013c3FU?=
 =?utf-8?B?bkRxcUx6eCs5Y1NVVmlEQUhETzdaQ3VoWFdCNXFmd3ZZUUg3RXlNcDM3aUNQ?=
 =?utf-8?B?UWRyN3hjQkJCVkxhV3BMWWRHbS85ZmNiZDkxbWlsVGRXam14d1VrZEh3Y0Ry?=
 =?utf-8?B?aWhTWmp2d2lWWFY4aEJjSEhBTjdtY0FESlZlSVRlQ0VNRWI2azN6eGJLUGpJ?=
 =?utf-8?B?TCs5SGxFanlydTdPNUMxM3ZYS0ZwMGNzWUxnaTZlaHNvV3RaMSt4U3MxVmVI?=
 =?utf-8?B?L0FIdFNpOGprSkkzWWptNFpOMThQYU9nTGROMjBpdE1MSCtYdUw1Q3h4UzBI?=
 =?utf-8?B?ak5BWCtDVHFiSitEdlM3TXIvNk9TSmNLVHZ0bWErWWFvd3pMY2ZTUUdHWTg4?=
 =?utf-8?B?dXRQUWwySVVHVnRXTlFzRWNGS1JMYUwyTVFSeGdId2ZxYVZydHk0VEZwdTdP?=
 =?utf-8?B?Wjlsa2k0ODFoSmZEZisrYWV3cmlkc0NUMDlFS1JyMmoxN3BSUHJlTEc5Z3hH?=
 =?utf-8?B?MUQrNE0wemRZYzVWQnhRVHNZelNDTjA1WG41cExXMTZBL1pjZHNyT2lVZTRY?=
 =?utf-8?B?WktBYW5CdTJkd3JxR2J1U3NzbFBBb2cwK0JLTXBTeUxpVlBvcmxFL0pzc1RY?=
 =?utf-8?B?RWlEUnhwV3dwQVY1S2tlamNoNUttNDNubTRPK05qOFlnb3o5Q21BbmNDWW5q?=
 =?utf-8?B?cTh5OG5tZG9WTi9qQm5DVkYxSjF3aGlQbWp2QW1tSm9wM0hhTWNkWXhxS0RG?=
 =?utf-8?B?TFRUOU9wRUE3VEczckUxMGhiQzhlSFZDRytmMjI4WVczWGJzZXViSU45ZWFF?=
 =?utf-8?B?d0tnWFJwdmpVWkxvbndGeDhraXlEaEpDUzdzMlZuVFU0byt6cE0vMlQ3OWph?=
 =?utf-8?B?Z0htRmw0UzRFVXJVY1VkWE5QeHh6RGhEc3I3RlRjLzl4RXA2cGpJUnRhb0tZ?=
 =?utf-8?B?SUZ0WlNnUWZUV3FPdWIwUitrRS9lRStaNmo1dUM0Q2xmeG94bThmOEFmVWsy?=
 =?utf-8?Q?CqYG/oE1VL7U7FqLUVXHMk/bB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5385.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6714a374-a5ab-4117-c54f-08dc9b192c19
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 04:32:39.5942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3rxeENET5iFbOBG/OS6q+1Et5p5LkEp8rQ7ybT2HjM8Fy/gtxBPYL07im0Bsb0AlpznhAbRULiXgshAQOI9YCn/CCpZbRTWPZ+YNEzcvh6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6065

aGkNCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KPiANCj4gPiBEUFUoRGF0YSBQcm9jZXNz
aW5nIFVuaXQpLCBEUFUgd291bGQgbmVlZCB0byBzdWJtaXQgRE1BcyB0byBjb3B5IGd1ZXN0DQo+
ID4gc3VwcHJlc3Npb24gaW5mb3JtYXRpb25zIHRvIERQVSBpbnRlcm5hbCBtZW1vcnksIHRoZW4g
Y2hlY2sgd2hldGhlcg0KPiA+IHVzZWQgZXZlbnQgc2hvdWxkIGJlIG5vdGlmaWVkIGJ5IGV4YW1p
bmcgdGhpcyBpbnRlcm5hbCBtZW1vcnksIHdoaWNoDQo+ID4gaXMgb2J2aW91cyBleHBlbnNpdmUs
IGFuZCB0aGlzIERNQSBvcGVyYXRpb24gaXMgbmVlZGVkIGV2ZXJ5IHRpbWUNCj4gPiBEUFUgYXR0
ZW1wdHMgdG8gaXNzdWUgdXNlZCBldmVudCwNCj4gDQo+IFNldmVyYWwgdGhpbmdzIGNvdWxkIGJl
IHVzZWQgdG8gaGVscCBoZXJlOg0KPiANCj4gMSkgV2l0aCB0aGUgZXZlbnQgaW5kZXgsIGFzIGxv
bmcgYXMgdGhlIHVzZWQgaW5kZXggZG9lc24ndCBwYXNzIHVzZWQNCj4gZXZlbnRzIHlvdSBkb24n
dCBuZWVkIHRvIGZldGNoIGV2ZW4gaW5kZXggZXZlcnkgdGltZQ0KWWVhaCwgSSBhZ3JlZSBWSVJU
SU9fRl9FVkVOVF9JRFggY291bGQgaGVscCBoZXJlLCBidXQgSSB0aGluayBpdCdzIGEgcmVsYXRp
dmVseQ0KY3J1ZGUgbWVjaGFuaXNtLCBJIGhhdmUgdHdvIHF1ZXN0aW9ucyBiZWxvdzoNCiAgMS4g
VXNlZCBldmVudCBub3RpZmljYXRpb24gc3VwcHJlc3Npb24gc3RydWN0dXJlIGlzIHN0aWxsIGxv
Y2F0ZWQgaW4NCiAgaG9zdCBtZW1vcnkoaW4gZHB1IGNhc2UpLCBJJ20gbm90IHN1cmUgd2hldGhl
ciB1c2VkX2V2ZW50IHdvdWxkDQogIGJlIGFsbG93ZWQgdG8gdXBkYXRlIGluIHRoZSBydW5uaW5n
IG9mIG9uZSB2aXJ0aW8gZGV2aWNlLCBJZiBpdCdzIGFsbG93ZWQsDQogIHNlZW1zIGRldmljZXMg
c3RpbGwgbmVlZCB0byBmZXRjaCBuZXdlc3QgdXNlZF9ldmVudCBpbmZvIHRpbWVseS4NCiAgMi4g
QWNjb3JkaW5nIHRvIHZpcnRpby1zcGVjLCBmb3IgZXhhbXBsZSwgaWYgdXNlZF9ldmVudCBpcyAw
LCB0aGVuIGEgZGV2aWNlIHdpdGgNCiAgVklSVElPX0ZfRVZFTlRfSURYIHdvdWxkIHNlbmQgYSB1
c2VkIGJ1ZmZlciBub3RpZmljYXRpb24gdG8gdGhlIGRyaXZlciBhZnRlcg0KICB0aGUgZmlyc3Qg
YnVmZmVyIGlzIHVzZWQgKGFuZCBhZ2FpbiBhZnRlciB0aGUgNjU1MzZ0aCBidWZmZXIpLCBzaG91
bGQgdGhpcyBiZWhhdmlvcg0KICBiZSBzdHJpY3RseSBmb2xsb3dlZD8gRm9yIGV4YW1wbGUsIGRy
aXZlciB3aXRoIFZJUlRJT19GX0VWRU5UX0lEWCBuZWdvdGlhdGVkDQogIHNldHMgdXNlZF9ldmVu
dCB0byAwLCB1c2VkIGJ1ZmZlciBub3RpZmljYXRpb24gc3RpbGwgY291bGQgYmUgc2VudCBmb3Ig
YW55IHVzZWQgYnVmZmVyIGV2ZW50Lg0KDQo+IDIpIEludGVycnVwdCBjb2FsZXNjaW5nIG1heSBo
ZWxwIHRvIHRocm90dGxlIHRoZSBpbnRlcnJ1cHQgcmF0ZQ0KPiAzKSBTcGVjIGRvZXNuJ3QgZm9y
YmlkIGltcGxlbWVudGF0aW9uIHNwZWNpZmljIGhldXJpc3RpY3MgZm9yDQo+IGludGVycnVwdCBt
b2RlcmF0aW9uDQpZZXMsIGluZGVlZCB3ZSdyZSB0cnlpbmcgdG8gdXNlIHRoZSBpbmZvcm1hdGlv
biBhYm91dCB0aGUgbGF0ZXN0IHVzZWQgcmluZyBlbnRyeQ0KZHJpdmVyIGhhcyBwcm9jZXNzZWQs
IHdoaWNoIGlzIGludHJvZHVjZWQgaW4gdGhpcyBwYXRjaCwgdG8gZG8gaW50ZXJydXB0IGNvYWxl
c2Npbmcgb3IgbW9kZXJhdGlvbi4NCg0KPiA+IG5vdywgYnV0IGl0IG1heSBjaG9vc2UgYXBwcm9w
cmlhdGUgdGltaW5nIHRvIHNlbmQgdXNlZCBldmVudHMgYWNjb3JkaW5nIHRvDQo+ID4gaXRzIG5v
dGlmaWNhdGlvbiBjb2FsZXNjaW5nIHBvbGljeSAsIG5vdyBpdCBhbHNvIGRvZXMgbm90IG5lZWQg
dG8gRE1BIGd1ZXN0DQo+ID4gbWVtb3J5IHRvIG9idGFpbiBub3RpZmljYXRpb24gc3VwcHJlc3Np
b24uDQo+IA0KPiBQZXJmb3JtYW5jZSBudW1iZXJzIGFyZSB3ZWxjb21lZDoNCj4gDQo+IDEpIGNv
bXBhcmUgZGlzYWJsaW5nIHZpYSByZWdpc3RlciBhZ2FpbnN0IG1lbW9yeQ0KPiAyKSBjb21wYXJl
IGF1dG8gZGlzYWJsZSBhZ2FpbnN0IG5vIGF1dG8NCkkgc2VlLCBidXQgc29ycnksIGN1cnJlbnRs
eSB3ZSBkb24ndCBoYXZlIGFueSBwZXJmb3JtYW5jZSBudW1iZXJzIHlldCwNCmJ1dCB0aGVvcmV0
aWNhbCBhbmFseXNpcyBhbmQgdGhpbmsgaXQnbGwgaGVscCBpbXByb3ZlIHBlcmZvcm1hbmNlLiBT
b21lDQpwb3B1bGFyIG5pYyBhbHNvIHN1cHBvcnRzIHRoaXMgZmVhdHVyZSwgd2hpY2ggZGlzYWJs
ZXMgaW50ZXJydXB0IGFmdGVyIHNlbmRpbmcNCm9uZSBhbmQgbmVlZHMgZHJpdmVyIHRvIGVuYWJs
ZSBpdCBhZ2Fpbi4gV2hlbiBlbmFibGluZyBpbnRlcnJ1cHQgYWdhaW4sIGRyaXZlcnMNCmNhbiBh
dHRhY2ggc29tZSBleHRyYSBpbmZvcm1hdGlvbi4NCg0KPg0KPiA+ICsgICAgICBUaGUgZHJpdmVy
IG1heSBiZW5lZml0IGZyb20ganVzdCBpbmZvcm1pbmcgZGV2aWNlIHRoZSBsYXRlc3QgdXNlZA0K
PiByaW5nIGVudHJ5DQo+ID4gKyAgICAgIGl0IGhhcyBwcm9jZXNzZWQsIGJ1dCBub3QgZW5hYmxp
bmcgdXNlZCBidWZmZXIgbm90aWZpY2F0aW9uLiBUaGlzIGZpZWxkDQo+IG9ubHkNCj4gPiArICAg
ICAgb2NjdXBpZXMgb25lIGJpdCwgaWYgc2V0IHRvIDEsIGl0IHdpbGwgZW5hYmxlIHVzZWQgYnVm
ZmVyIG5vdGlmaWNhdGlvbiwNCj4gb3RoZXJ3aXNlIG5vdC4NCj4gPiArXGVuZHtkZXNjcmlwdGlv
bn0NCj4gDQo+IEFueSByZWFzb24gd2UgY2FuJ3QgcmV1c2UgdGhlIGV4aXN0aW5nIG1lYWNoc2lt
IGxpa2UgdXNlZCBpbmRleCAvDQo+IGV2ZW50IHN1cHByZXNzaW9uIGhlcmU/DQpQbGVhc2Ugc2Vl
IG15IGNvbW1lbnRzIGFib3ZlLg0KDQpSZWdhcmRzLA0KWGlhb2d1YW5nIFdhbmcNCj4gDQo+IEJh
c2ljYWxseSBpdCBqdXN0IHNvdW5kcyBsaWtlIHdlIG5lZWQgYSB0cmFuc3BvcnQgc3BlY2lmaWMg
bWV0aG9kIGZvcg0KPiB0aGVtIGJlc2lkZXMgYmVpbmcgcGFydCBvZiB0aGUgdmlydHF1ZXVlLg0K
PiANCj4gVGhhbmtzDQoNCg==
