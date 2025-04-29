Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B872327A90A
	for <virtio-comment@lists.linux.dev>; Tue, 29 Apr 2025 12:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745930585; cv=fail; b=fNoUHilvTHX7fMO1reWExEZYW5HasPwIFFKvuQx//w53kym/2byv0KLn+ifmj4PMF3RAqq7P6EzlYmgTQ4TLzA8IOH7iR+1tUSVAZKNbcR+WQWQEJEkMJyBxxfO3sohamrzyuhMJ6zma7T52VPZtVtEsM64hwM+UTYTQk/6vFgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745930585; c=relaxed/simple;
	bh=e7frw2Ip01/Yzc+VJFqwjSCT1ZiCmPayvCHjAS/KXAE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hKRTskT5yVhNAnoai7Ctlqv55xHueARnEHuvBjDNtvn+CgtG+veGw79Kivgf4bGhusLMHyouyNnoL2FklzjsBnk8UFHKit+dp9y1gt84gz3fyuzXzjJst9+IZgWAPxQLoMwJH0V6ut6o06FEGgtdrXVNCaCKjf/qe3iLkcSuWgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H/pv0oLY; arc=fail smtp.client-ip=40.107.92.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H/pv0oLY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+JHUJkwW8WhzY1WTO5PLKDwSHlxSfh+TN4Dklmq8oKi1MbbR0tcbEX1C/bKDbXbPXhxq/nP4XVWtDn1iRtfZhg2jdy3mhpe53LzQ5r9Kg2I5Jh+nWAXXWpiJ1SH08vziyg+B8UXGyUmBI5rQu9epsfC5bHXL8eur7xHGfNdZTs0NwDUCQwKiDk7nr3DQdqtB+CyeLV31XZP4+D2ndAqDp6IJ7vn29UubEv+Oo3syYDu+km7Q1DvvgHfGbCsE5GUp7gqsb7MB0a+TdBG0pH8lvUGQcduETSy7VJR4DYZ8DGcyeLovFXjS4cf8ZIuVHQPjR8lSFOct3JQmyAe7MKHxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7frw2Ip01/Yzc+VJFqwjSCT1ZiCmPayvCHjAS/KXAE=;
 b=nYuZOdQT8sLw8TtIXjfpFLqCoFED/HS9YBLI+Ac1aqgt+UPxpBsdosdskZD0lMgKjpJ+p8/RKL/TV4/5R/r6hUeR6jEyXQtm9O0wBZcRyhnh+FEyuzRwl4Ohv3yBE843zNS2jQ8JlbJ5PcS5DUJ4E7zPvUKeujur4ILGtzQ3PDfZw/T2dRRI74XrmnT/wFJxjo0aEKiZZ4ZR0ztWbA2WSjSw8dESaQL0gd7rUBPzigidQr/L7TolTF0Nlkk79RtnsK/YtJAH4sFnDauuCKwGnuDJ3Jh+VPl8UzmLyw1r8RKHUQe03gfcPk7LomuQ+n0kSsBJQmmwb/xwoV9gHxCSsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7frw2Ip01/Yzc+VJFqwjSCT1ZiCmPayvCHjAS/KXAE=;
 b=H/pv0oLYu6cHFDIVi16KCmLc8zwn7rqUMWy5JFCFOsFZOCKN420tse+QAj6T3WiibzJ1xA/MZ6QvCU+dUTUvO6Gc0CEOBNHXYwzrWIBgbgMlXk22leyNgYSvZoh+kIssSCTKOVlaDkqOcqRRYAwmCFeE9QoLuTEVLJoQj1bjRt47fJ8gWjZRT1LkOJsKl0+5w74yVwMIW0OkxVYyS8P2+aUYG3pDGJKxBrJNNaXw84/VI7UX+67Ihy+Jt2jh5kGvBvQXyEUvvlh7BQFLW2xx+hgXmj/8JgmkR7C86Td7IkuEZ1lOFAW3+lYp4mms+s5JzzIDZ+yr+utkn7Wjy2MxHA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by MW4PR12MB7191.namprd12.prod.outlook.com (2603:10b6:303:22d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 12:42:56 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%6]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 12:42:56 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>,
	"kshankar@marvell.com" <kshankar@marvell.com>
Subject: RE: [PATCH RFC v6 0/4] introduce IPsec Operation in virtio-net
Thread-Topic: [PATCH RFC v6 0/4] introduce IPsec Operation in virtio-net
Thread-Index: AQHbuQPfX8yv6RCdwEurRCMU5IQHe7O6lfhA
Date: Tue, 29 Apr 2025 12:42:56 +0000
Message-ID:
 <CY8PR12MB7195D2EA2E60532EF09C37C2DC802@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250429124010.1949371-1-schalla@marvell.com>
In-Reply-To: <20250429124010.1949371-1-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|MW4PR12MB7191:EE_
x-ms-office365-filtering-correlation-id: 3676c6fe-eeb5-436a-779c-08dd871b5dd0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?VWzyUg9NuYSiitZZIk5QhGxTXOjmh6Nw3SbM0z16EnBPd5aUrStN9Mxg2QC2?=
 =?us-ascii?Q?Kl3S9eJJFpJamwSy8+M8yWm8YpXcFgKlfudN0/wWRUzhKmMR7EciyKzosd84?=
 =?us-ascii?Q?vZixqiMcGfPoNXuB/iE9wpvzt4Ak9Xp0uu6+SN6eFNq9J9M3CdC2yB6+6wtk?=
 =?us-ascii?Q?a7DC/gaA4WA1GvjocWZfuWkJjMPbHotUpvOgbYpFzg0N9LUFGCyxYyWFlWM6?=
 =?us-ascii?Q?QftwH1C0BwK7Y+YFegZHQnC6OLz3P6py7ajBuaF1Dph6I+QXnsAmRcT2hH8W?=
 =?us-ascii?Q?kPr1F5U5W+rVhXyxpjbVJc4Ee4nnfOKHTvpTtD+T7F1tb1wZwj/4rfRRV/xc?=
 =?us-ascii?Q?QcsHXVWAcdxzoauq4P+pljvx0mdpQtKxXouFszRfvAO2a7DCFnN/eIVRTrQO?=
 =?us-ascii?Q?K9NJzI6AF6GYAq8FDDyA/QMp6A07TkucGq/srRJ1gmxHHKt1c3UBbQ4dCbYT?=
 =?us-ascii?Q?1swPHGdeq5tkonOwIXDfyzo9S3Soi+IwGiTIcewL43m4nZr6SNpYhurn+09N?=
 =?us-ascii?Q?qMbE+D40jSTL/j5vHcTKa2mqhPJBMkz9bgU0jKIjO+APuzMxTNg+XL2O/YlV?=
 =?us-ascii?Q?eOBFFGjbTOAEGtGDANWVKRcHaqfUTKBa6q560cEYjWLzkEushd4Vhae80Cwt?=
 =?us-ascii?Q?Cm43hz2N5R7VT2T96P+R+cW8LA86klZHHmbXd5Qh3EZnOWz4c0Lpxh+J1L+v?=
 =?us-ascii?Q?BOU7+ptgTpUaFnIRLXaonVpBvimWG8FkqGrGAAt+V55Q08F2JexPWFoF/RzM?=
 =?us-ascii?Q?bQy7rvMSg1msAazuMG7VD2X2OjWK3hBdenI0SM9O7SsRK/UNJzybD0e3vqrj?=
 =?us-ascii?Q?GDXFpbnFTMvwjB1rUtajTFWgGhBXhuiYXW9DHhEfLgpeLJ3ai+MxfwdZ+C0J?=
 =?us-ascii?Q?59OunsCnd/MoA4Exl+ZzjT9Saqzbgr15TzX/nbaLh+oJsTlDkiYmyNIJBiCA?=
 =?us-ascii?Q?IHLhQyZqpy07UJmSZj8+rpNgjQ87inII3tfqtkvMldMI/4tXgysft467aFUA?=
 =?us-ascii?Q?q/osbdqkwUdmt9iLwlcQzVN2Z3g1PvVJ6kFryZ7m/3m3THymjPdBTb7E0DfH?=
 =?us-ascii?Q?DzECOHpqhA+5GNfd6hYMjrWj+jhwFOdFc3Qslmvvg0O/i5YZonRfS1+lnBPj?=
 =?us-ascii?Q?/9yktXawOBpzsXHV0PSuPyzNXSa2q62aHEUwjzS7f8+04DnZ/9dJVnBpJ+0/?=
 =?us-ascii?Q?+xLzu99BMDg3f76BQNXnFZZZ/0hjRe1HugVCIfNXIDs2r0N4wj6+bBjUQpJf?=
 =?us-ascii?Q?YUhl5j3B51w5EO5uG8Mp+vBMkuCoOwLkdRnjGuh5hqJ8igmaITHg20SO9b5+?=
 =?us-ascii?Q?A13vRJIMrcFxYSvqOQodBU6yU2g5AirNXED5HtTsSwsyUzxaeJ2aAbpNj/jH?=
 =?us-ascii?Q?zUmjg23o89lsIwz/Up/nl3rWLK05kdAFVeTkKOvbO6DwVA4vPVihDf7+zRjc?=
 =?us-ascii?Q?jadntI0tMUA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2F/O1NRjYRdMpELL7WUMdY8RsUvK+Csq7rfp5D6+pDRj1T1M4vKcaUeNoLRh?=
 =?us-ascii?Q?eINoi5yfypaeeylU7tYks6u8VHQ9eRpCXiSEgjD5eEpSFsTNda5eI/SCSYZ8?=
 =?us-ascii?Q?anteCzPaOqsUVN1sZXXzFDKQqym/cCrHO1CTBCRfWkOSe2udibWkclRQgBb6?=
 =?us-ascii?Q?bRabckSWvrre/mJMLRJ3ebuGGPRWpuZeJKMsCAV9dE1bKAB6I9zHD/YX3sAs?=
 =?us-ascii?Q?xCrrRLrK1tJ3BDqyzV4GbHFg/9lG2Gux4EB5HdIYdUFS1oS75B0skK5giGNc?=
 =?us-ascii?Q?y0PzmMezf8tq4TXF6nl4600x9UZ90vY1Bd2hrHgMT6Htdl5zXYLHpbVEt8OI?=
 =?us-ascii?Q?6//DWQv5ejK58MultfBHsn93mhLzB+EEND1nPFDjlPx0GVP0rJReu2wcPze5?=
 =?us-ascii?Q?zKAxiZ6s84sdtGxX7jn7skUhF3JwKhA+29t3EWvKR/Q1yoUIa90Q/aGz0Pn5?=
 =?us-ascii?Q?aFFJfIGYar6D4E/2vKXtMNFrMpSuZWfs46ubZDagII+91XG/x5W1Yc5YFVZD?=
 =?us-ascii?Q?boIon2ov0GRNcj5tPijgOq/pjdAOVzRMVi1zfDVe+r2xjTRuuH1uBJgRsIEG?=
 =?us-ascii?Q?VHo18tRTH/Id8iiXJYgB6xhrRXeW258fPY/2MBORLUwSOb53K6za2TSY9ykV?=
 =?us-ascii?Q?ypaWYODy6HJJzHFrr3iRJV1LeY3lIneJr+crbCWLC9AT3Brdfm5vhEqSPj+3?=
 =?us-ascii?Q?zBRTcMKe7bD4L2p+2SbP9luuJykDC1GN2OQhfkTm0bkWUJaxw9uofOHvbGz7?=
 =?us-ascii?Q?bohIA/zK3Zuuq8kA5Gvy7U/YqQbZvt8rzWU3OU0cfcNFlJnw/orJGswQSVcX?=
 =?us-ascii?Q?rOEa78/ai+504keOkeXaTs/acrR0FaTyA3z5LOad9COA0r8GCjRyjBUd4Wzc?=
 =?us-ascii?Q?Av/HkiqrtJ+hjOZM5Mt//uNOwPHc7Ed/teKcW+lsyyWBUhfQRuhEC0+LNE/y?=
 =?us-ascii?Q?s4EcK3jhjphjIWGGmK1l79Ah63PlcaIrZAbIbhXrgc8r5wQRY2H+8bC+FgY/?=
 =?us-ascii?Q?JpYzfdhVP7bA2A9BNtE/ZC8LRj1DNNw/GoyshXnXt5GBO43keeyykAdBOKrM?=
 =?us-ascii?Q?KeUaT524nh1ly7Iy/iVU2owxICiDh1O2wM1MSGa+NvuAMctftAFaZD+TCcIG?=
 =?us-ascii?Q?CPkAy/NW8vqlHbqgeGR8fmRqlGX8KU+c2ZyAxzrMWF+6yX/kiP/08LFMW3mc?=
 =?us-ascii?Q?JAZu1dpfyHLk3ss4yfqW1r4HoRglrYbQPMo5Q7npqP2Lyzdd8iZ3Bgbg1YeJ?=
 =?us-ascii?Q?9efKB8t2G3iePKmpvp4UzBzSWe2o72vlTLzPCnHqd2KCTwh6XZMm8Ch5ADbD?=
 =?us-ascii?Q?wtwTuWlgfo8b1JBfbhjqabUnF21i/lYTdkdEVferQx+A+YeWj2Q/BXpFIfAi?=
 =?us-ascii?Q?eR0EJgVr7YBaa9qX9GR1ma8m1NLHDeYAwzkB0Kz7LiVoSIMG5HbglhooL8YJ?=
 =?us-ascii?Q?BPSqOZUQ9fSkfvxT49xLYJPmYawwDkfwwErhxfTqmRGCcVYR4R2SKXdB6hfH?=
 =?us-ascii?Q?ZYG7LKEVHDYluPzSn5xYOJgjw268vuL5cBj+emMdh4FaqIxUeAXdNycRnGrG?=
 =?us-ascii?Q?9qoK3vRGoILMW/2eXIc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3676c6fe-eeb5-436a-779c-08dd871b5dd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 12:42:56.4111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8DaO46vsyrOmYcvEuer4+PCgKjnn/shfbLOjrqPhUidD1EDT36/j1yv2gbqnUR2uehtNIO+nMP16TQKIbH3nhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7191


> From: Srujana Challa <schalla@marvell.com>
> Sent: Tuesday, April 29, 2025 6:10 PM
> Subject: [PATCH RFC v6 0/4] introduce IPsec Operation in virtio-net
Can you please drop the "RFC" from the series as Michael asked in [1].

[1] https://lore.kernel.org/virtio-comment/20250428032726-mutt-send-email-m=
st@kernel.org/T/#me325584c9d646c3fdda00a2ed7d98054924c48d7
