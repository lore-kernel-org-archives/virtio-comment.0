Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2041.outbound.protection.outlook.com [40.107.102.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F8A1D319C
	for <virtio-comment@lists.linux.dev>; Sat, 26 Oct 2024 18:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729968567; cv=fail; b=C2Ia++4qZyGJOiFCJzoRnSdTkkMeusvJOWhqXIAvDXweVpY7+pP8ZPTjaRKRLjNPmhp/19qnaTg/WQmCFrQbtgMa6zazSmXbUMovcvULJbvv6vxiDZXRm7lvNBSl5fK4mba0a91ehjwXwvkuyzamnhW6Qu7ZsrRwe3Y7iOvVoOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729968567; c=relaxed/simple;
	bh=3VC2gpoxMsoOn97i10UlU9ipKaIAzOBWZLsQPHXj7EY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WCQkZlumCmZ/vh3qo0kQ44UiZ9WYBUvTUlUMd9j8F0lYzJFURtxgcamZp2tnh+docWfhZeSEfrTVFS2+KslSNQuDEIml7fGDsUW5xqcfdAq2NND8Nsw0YqGWGlK+d5nzeD0DFg76L8gJGK9UIYVi3ZhSI8Q7SmISn9LGYncmj28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FPObyquV; arc=fail smtp.client-ip=40.107.102.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FPObyquV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TRLedIFycNQssYZEUUokpRaAwfQISBUbnleOGMO5sK9cETv8nLYDnKp8FlaMSW8eldrp+BurBF4Emqzq7okjUTqfY3hS8Vjgvp9C7OaTG3LsMAecGQzXL8+f+L2XFvSokM8ujRcvQTlDFM0URWabKa/5rYhQeeF2z9Frtsyc49C/27UFV6Cvcrh3cyG4R9yyqDxhpAdSunNjLqgqRPRoD7oPaE36Ui0UsKKl1TuzNdvGbogJOclI0iXurf88FKIElHDDf4NH0apUh5LzhJRjoj07vYJqsMhVzycgakh99jdJmv3LDE5NhY4kjaJcO9VP+VmUmap8sA87tns/YYs81A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGxuI69/aw+vv/nFTT46srTxyzqCjZKjXVsro1OKOgI=;
 b=kZnmz2tTk7sAHkobl8UykTN1CmUhmoD2Q6WFpRyxqYbA8Mdz6sTJ2Dn0m9MslGbGtIYMO7VF3bNYLmfzsb9gp5OcVVIdDWJTYCdnMn1J4a/+sJ4jLBXjJXCIzQQhkoaAx9oqXfVQnlb28Krdvmqcxp3mzv7/OTcH+F+iszyo8+bs0KamE6+B5G6RkzAZbsMW5RQOO45hGGbVxlS09hAX/QJYQOIsWVVx4ahAWv0X5ogzOtRubcXtlGkybN2sICKdSCGst7Z8UEf1fK1HP4yvgIWMW3bMqpa5zZGyno1l+3i7nmvRQzhJdLBRevqfa28uQDRqZbCQNu7uB4/EwfmAjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGxuI69/aw+vv/nFTT46srTxyzqCjZKjXVsro1OKOgI=;
 b=FPObyquVGScKl6kkKj9ivMi8hjQkpdfe8yx619eSMFWxqKRC1MG484gmxP9hIXeAPugRFXVN7JEyGExZSLK8tRLk3ek3ioyiRNL6svuhKWY65ghbcFXASPMYYs/yXqCqyvvZC7iBwFhQpx9jxlpGBgSIzLAEfe6YD4thx5marTh4gjTZx9d3S850H6t0bKtboYKSrRsopSd7zmcwG9IoPwPFkKpKl4U3B3xvkdCRmvRqYBgZzNttgkfflUv/Z93mAXEsld37HtpJIHessHdcM+P29eqUCtL/qx3jjXHVS8LCJQf7oJ3UTvNXb0EbRYsKCJZtihG3ovPc5hRUoVQyjg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS0PR12MB8069.namprd12.prod.outlook.com (2603:10b6:8:f0::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.24; Sat, 26 Oct 2024 18:49:20 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%6]) with mapi id 15.20.8093.018; Sat, 26 Oct 2024
 18:49:20 +0000
From: Parav Pandit <parav@nvidia.com>
To: Xuewei Niu <niuxuewei97@gmail.com>, "sgarzare@redhat.com"
	<sgarzare@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"fupan.lfp@antgroup.com" <fupan.lfp@antgroup.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, Xuewei
 Niu <niuxuewei.nxw@antgroup.com>
Subject: RE: [PATCH v5] virtio-vsock: Add support for multi devices
Thread-Topic: [PATCH v5] virtio-vsock: Add support for multi devices
Thread-Index: AQHbJeOUaqXq2o8qzUO1VqAKj4wkMLKZX2BA
Date: Sat, 26 Oct 2024 18:49:20 +0000
Message-ID:
 <CY8PR12MB7195365CEC62D25A06F20CA5DC482@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20241024070817.1072626-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20241024070817.1072626-1-niuxuewei.nxw@antgroup.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS0PR12MB8069:EE_
x-ms-office365-filtering-correlation-id: dbcbd173-4a56-47cd-c342-08dcf5eee713
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?S6QKYV6nbKdEgg61bnPaWjSVaN8ZPWi0/XOqF4XJqypO4shtmlXD+eLpOPC7?=
 =?us-ascii?Q?pbbB3/fa88mcu5l59uemgVp/rrAhGnHc0qghcYYTOleh2NGuxuwIIOPKF3Xg?=
 =?us-ascii?Q?Ttthu8qZMiI7nGJu1WRqwcpPKPkLTnx4YbgoPbWnfQZZod/kwA6P6a64+oy2?=
 =?us-ascii?Q?DNAEtJzCEAkLAEc/cArvUBVM7MZnBOoWpV0VAZuOX8KEavH6vxwM58mQdPXp?=
 =?us-ascii?Q?YzgqqmQZYINOfW9U/crxVj6wTg9W+c6UxlHUXYeYoCFNLZZs09UaHS8IORrI?=
 =?us-ascii?Q?jW5WjL8ZNfQL/U6NWAUp948NSSl3n4HdI9hGSvtxvZLZek25fXCIgK85VPnw?=
 =?us-ascii?Q?nBULWabyfp9tmWr4y2Lpb0Nnh8tor3hRn8gXIFGwFCiCCuyLuH6pD7uKd96z?=
 =?us-ascii?Q?YGgLp9sZb9PLRqc5wTaC9/SuKIsE6GzYi5vFu1LQYZwabiMkzdXYrMtOKZ4L?=
 =?us-ascii?Q?s87u3YEPnXUBuOU0FI9Tdx4EyegS6B/lGRTMP1EtbWQxLJOv6HHAsGfq4NFL?=
 =?us-ascii?Q?VEtyoZaKThomlTLDcGD362mIWc3PJlTPUS0TR5gfFoZCpUXp9z9wRr5kXrXv?=
 =?us-ascii?Q?q6C/l+Ecli30PJAa3SiqFbVTjjyLWxqULa30K56hTk7TQti3fm1Byk3BCZnT?=
 =?us-ascii?Q?be99Whf7wIXXbZk3xDhbVjCmW/RE/XEST+cbxXlodDT3Mf+iiH4OyRxHRwLj?=
 =?us-ascii?Q?jm4PIZeHWlLdMB5xZt7gaCAK7juCnVJLiGP0oRdFixjpRxF6xDZcby+Uo2N/?=
 =?us-ascii?Q?1mO6FHfkYE8m2tMpIFVH58FHFcSH7ibQp2tygbZi1SUCAxKC1wjloh8dyHFL?=
 =?us-ascii?Q?DIw6hTzW6SAqRXSfzzR39Jn9WRXV9GPVzXISbMKWK9cH7Wckp4hANBKbzxWf?=
 =?us-ascii?Q?IgW3pBTdNTZkr1NEKu2hpGKzogL/FVHTEsfCkRmGapevXUHsAtkN+nHkI151?=
 =?us-ascii?Q?ISQE/yocic/4qZU4aJzo8XZy8RARWhSXAsClrE6pLt5FcD9g1FVfYh5EQ1S7?=
 =?us-ascii?Q?TSPOx32V1FXC4sbvXq8mXJZzeo+Z7rydkUJOPYhlG0pjkGANoR2ck8HG7Jix?=
 =?us-ascii?Q?4+3p8x4m8HvF5+sUtW84HliUIoc3wktLDnrThIapL6XAQIhaQJ2s2sTc2Fq4?=
 =?us-ascii?Q?/7FDocnwV7l8nI2upZjE7OOUSV6BC6yJkIF+B+V9OxdJO+gKvD5qyJ4ovE85?=
 =?us-ascii?Q?zUt2SVxoZKlVb8uLqbRVM4aleN0YgA36VlvSSRDcUehC1R18GksQfidnM9to?=
 =?us-ascii?Q?rfxVvLBxXtF8SqmYrAsj/Z4On6LzTXoUmTYOHiO+vH64Uy1IV/6lGHEvSYbw?=
 =?us-ascii?Q?va9cSmdPnGeYcwXu0hBP3ae17Kr8+KEZbm3IwwRDgSAaK8MA3OBQa/wuZUOs?=
 =?us-ascii?Q?PBdlbYM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TFHzPCrqN3JfSQwMOju887qMzzgJ2Va8TSNkQvcU7kQ2qwrHChKlW/wr2DTy?=
 =?us-ascii?Q?8k/fPYpnSiIXm4MOQCoYmeViLxsyVqhr2rxAexSnTF+/eDODtywjS9Bje79M?=
 =?us-ascii?Q?JRi1JRtraxQOy0FAnLOuoovRBgNBBrrCh3nKd97i8ouJAkwOBg6ADyzjWBT5?=
 =?us-ascii?Q?ROC2S57ieqCDSSmN1bLhsN/ySMUvksOw8xOOBeQ5gKa5nBZh7yzloLEh6NxT?=
 =?us-ascii?Q?ki1NzXA+0bFEXgrOfVfIyUNgSeiBQPUqjX1UvOtY6oeuWi0pMDkpyTuv9+FW?=
 =?us-ascii?Q?ARTpPbaMvXlmwUCFByMfBQ+0Cmn2/b5J14PxgWKu2BOgPGhhvOFu1BYvylpJ?=
 =?us-ascii?Q?+/55nunvTq/2GIiRMHPxGaVX4vto0oBaL9tFGRsFQ5a4dnPp6XknIok6LQfE?=
 =?us-ascii?Q?oBPZC/xjjo9Zg6aoGBQHZ7EnBQG/9E9iWawyNi3q4a1n7Gs+cpbfIoIGUITB?=
 =?us-ascii?Q?FwRz51b4ozFOrxCTeMPuVuBV3UcrG/GDhP83IuF1A7IS5GWwKeo3E8gpMSzk?=
 =?us-ascii?Q?/7BDN9jheKYLAxQYILDNoQY1MMsb0bsg5CKEW0j45haH19S5pv+tS3mJKSUS?=
 =?us-ascii?Q?vWp0w02Wai15l1LbATKfmHyXgPMWe+VQ4mwSon5zbRcUPuCY7hgwMOQHUpGJ?=
 =?us-ascii?Q?JwR3C8EwtX+ccMofIjx4znQyW3C7OSJph/K1n2HABc4b5zpn5cO/rqPW9GHu?=
 =?us-ascii?Q?z85cioR9vAbp8EK/hDxc8mOffGqZ2bMr7cKb1gqc9jgNSxGla5OTd6OFMwny?=
 =?us-ascii?Q?G4EQ//4oznImVOIfKNZxSJ6rRdaOf+CJbvA6to4lmTxRBGsDVEoy6jck0sDK?=
 =?us-ascii?Q?u1nhO8SXSJ3kciWZjbIxBPb1+0BASsoa8iBXJCivAdxGTNWvTI98bxA/InNo?=
 =?us-ascii?Q?yDKLuhPOn46TLv5vcHg0Ks5t0IlxGoPsd50Iif9KZOvyNBidsGt0UzmA/bNg?=
 =?us-ascii?Q?ff6Pg3ZFW+Op+dxFI0TQXKqm2gVeZXRTEGsVmfiDCclVt7Hob4E43324EUBv?=
 =?us-ascii?Q?JLJhhMTi8eSokd6s0IxG4TKfYgwMrciD3vApv77p0R1SlE3lIEngzu2cLIYl?=
 =?us-ascii?Q?aIqQ9CXGJYUbdpcwOBpz8sHojPwgX9tLQjTc7NUwG+PgIIo/SitPMy3KNbmY?=
 =?us-ascii?Q?DHecKVAOW2MKs7DTQ+ROS/KUYOU0L0aHNnvodH3yM5ix2GIJx8uDdHv+37WT?=
 =?us-ascii?Q?VdlULhQeBMbg4NQbCZxZRK84AJRpBgbQViEmCmcgk5cSDhoFF05RNjfazkVb?=
 =?us-ascii?Q?qelzfbqq1eOKIEGrYApbcnNDrpnsnlYePmJTMs+3tdvG4xz1wvUC5VNCgl4L?=
 =?us-ascii?Q?aKLj7Wnufmc/UIpzFZDHoGwp5FRsFQcwrx94tfiYJevWOjN1vDKcAGPX0WWZ?=
 =?us-ascii?Q?R9TzT+nd/COAB1pmwKlEFrvHEKolo22lIRQg1koCnrdBaVD/IIifHRMZiedu?=
 =?us-ascii?Q?wWhMxax2K+voyZkrqIIXG66AmLWmRfdlsuSy84S5ZQ5opTn6YscPJ+CDqC46?=
 =?us-ascii?Q?wr6wWZN/qtZHAUFphm3shWdvyAl1pA9OIJ+u38AqvWYR+T5SPskMv1QPvm30?=
 =?us-ascii?Q?OOSzRYLCf2HureFand4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dbcbd173-4a56-47cd-c342-08dcf5eee713
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2024 18:49:20.6991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rPwY9rKwDgw8ahKNZIHoqGfpWlWvg2HOxm0udzw5fP8yRqoJlcROi8RwwmhwBECeBK8yYMB6W82smjbcMT9K4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8069



> From: Xuewei Niu <niuxuewei97@gmail.com>
> Sent: Thursday, October 24, 2024 12:38 PM
>=20
> This patch brings a new feature, called "multi devices", to the virtio vs=
ock. It
> introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a "index"
> field to the config for the virtio vsock.
>=20
> =3D=3D Motivition =3D=3D
>=20
> Vsock is a lightweight and widely used data exchange mechanism between
> host and guest. Kata Containers, a secure container runtime, leverages th=
e
> capability to exchange control data between the shim and the kata-agent.
>=20
> Currently, the virtio-vsock only supports one device, resulting in the fo=
llowing
> limitations:
>=20
> * Poor performance isolation: All vsock connections share the same
> virtqueue.=20
Do you have rough estimates on how much performance is affected (or is poor=
) due to single queue?
I am not familiar vsock application space.=20
It is something like 10K socket msg/sec or 10 million socket msg/sec due to=
 single queue?

> By the way, although multi-queues can solve this problem, they do
> not conflict.
> * Cannot enable more than one backend: Virtio-vsock, vhost-vsock, and
> vhost-user-vsock cannot be enabled simultaneously on the transport.
>=20
> We'd like to transfer networking data, based on TSI (Transparent Socket
> Impersonation) technique, over vsock via the vhost-user protocol to reduc=
e
> overhead. However, by default, the vsock device is occupied by the kata-
> agent, a control component for Kata Containers.
>=20
> =3D=3D Typical Usages =3D=3D
>=20
> Assuming there are two virtio-vsock devices on the guest, with CIDs 3 and=
 4
> respectively. And the device with CID 3 is default.
>=20
> =3D=3D=3D=3D Guest -> Host =3D=3D=3D=3D
>=20
> Use the device with CID 3.
>=20
> ```c
> fd =3D socket(AF_VSOCK);
> bind(fd, 3, -1);
> connect(fd, 2, 1234);
> n =3D write(fd, buffer);
>=20
> // or use default (no bind)
> fd =3D socket(AF_VSOCK);
> connect(fd, 2, 1234);
> n =3D write(fd, buffer);
> ```
>=20
> Use the device with CID 4.
>=20
> ```c
> fd =3D socket(AF_VSOCK);
> bind(fd, 4, -1);
> connect(fd, 2, 1234);
> n =3D write(fd, buffer);
> ```
Above and below example is not using the index that you are introducing in =
this patch.
Can you please elaborate?
If the binding is based on the CID, than why the new index needed?
Or the example is stale here in commit log?

>=20
> =3D=3D=3D=3D Host -> Guest =3D=3D=3D=3D
>=20
> The usage is no changes in this case. Send to device with CID 3.
>=20
> ```c
> fd =3D socket(AF_VSOCK);
> connect(fd, 3, 1234);
> n =3D write(fd, buffer);
> ```
>=20
> Send to device with CID 4.
>=20
> ```c
> fd =3D socket(AF_VSOCK);
> connect(fd, 4, 1234);
> n =3D write(fd, buffer);
> ```
>=20
> I've pushed a version of code for the implementation of multi devices to =
lkml
> [1].
>=20
> [1]

[..]

>=20
> Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> ---
>  device-types/vsock/description.tex | 46 ++++++++++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 2 deletions(-)
>=20
> diff --git a/device-types/vsock/description.tex b/device-
> types/vsock/description.tex
> index 7d91d15..f2e663b 100644
> --- a/device-types/vsock/description.tex
> +++ b/device-types/vsock/description.tex
> @@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types /
> Socket Device / Feature bits}  \item[VIRTIO_VSOCK_F_STREAM (0)] stream
> socket type is supported.
>  \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
>  \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not
> implied.
> +\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple socket devices are
> supported.
An individual device cannot indicate what other devices are supported.
The question is, when multiple devices are accessible to a single driver, h=
ow should driver choose which device to use?
This is the question that driver needs to solve based on certain informatio=
n.

Therefore, the only thing needed in this patch is a feature bit to say, fro=
m device point of view is:

VIRTIO_VSOCK_DEV_INDEX This feature indicates that device configuration spa=
ce has device index.

And somehow application chooses which device to use to transport the vq ent=
ries.

Right?

>  \end{description}
>=20
>  \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Dev=
ice
> / Feature bits} @@ -34,6 +35,13 @@ \subsection{Feature
> bits}\label{sec:Device Types / Socket Device / Feature bits}
> VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the driver MAY act as if
> VIRTIO_VSOCK_F_STREAM has also been negotiated.
>=20
> +If a device without VIRTIO_VSOCK_F_MULTI_DEVICES has been registered,
> +the driver SHOULD ignore all subsequent devices.
> +
At driver level in virtio spec, there is no concept of registered.
It should be something like
If the device index is not present, the driver SHOULD pick some default dev=
ice etc.

> +If a device with VIRTIO_VSOCK_F_MULTI_DEVICES has been registered, the
> +driver SHOULD accept other devices only if they expose
> +VIRTIO_VSOCK_F_MULTI_DEVICES.
> +
>  \devicenormative{\subsubsection}{Feature bits}{Device Types / Socket
> Device / Feature bits}
>=20
>  The device SHOULD offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM
> feature.
> @@ -52,6 +60,7 @@ \subsection{Device configuration
> layout}\label{sec:Device Types / Socket Device  \begin{lstlisting}  struc=
t
> virtio_vsock_config {
>  	le64 guest_cid;
> +	le16 index;
>  };
>  \end{lstlisting}
>=20
> @@ -77,11 +86,36 @@ \subsection{Device configuration
> layout}\label{sec:Device Types / Socket Device  \hline  \end{tabular}
>=20
> +The \field{index} field indicates index of a device, and is required
> +for each device when VIRTIO_VSOCK_F_MULTI_DEVICES feature has been
> negotiated.
This is not needed. A driver should be able to make choice on which device =
to use.

> +The \field{index} is 16 bits in size, enabling support for up to 65,536
> +devices.
> +
Bit width is visible, just mentioning maximum device size is good enough.

> +The source socket is allowed to not be bound to any CID. It is required
> +for the driver to choose a CID for the socket. If
> +VIRTIO_VSOCK_F_MULTI_DEVICES is not negotiated, the one and only
> +device's CID is used. If VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated,
> +the driver uses the default device's. In this case, the driver selects
> +the device with the lowest index as the default.
> +
If socket can choose the CID, why does it need new index?
Its confusing to see relation of CID and index here.
Can you please explain?

> +\devicenormative{\subsubsection}{Device configuration layout}{Device
> +Types / Socket Device / Device configuration layout}
> +
> +When VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the device MUST
> offer
> +an \field{index}, which MUST NOT be same with the \field{index} of
> +other devices.
> +
> +When VIRTIO_VSOCK_F_MULTI_DEVICES is not negotiated, the device
> SHOULD
> +NOT offer an \field{index}.
> +
This should be MUST.
I don't see a need to write this.
In other words,

If VIRTIO_VSOCK_F_DEV_INDEX is offered, field index is supported.

>  \subsection{Device Initialization}\label{sec:Device Types / Socket Devic=
e /
> Device Initialization}
>=20
>  \begin{enumerate}
>  \item The guest's cid is read from \field{guest_cid}.
>=20
> +\item If VIRTIO_VSOCK_F_MULTI_DEVICES has been negotiated, the
> device's
> +index will be read from \field{index}. If not, the device's index will
> +be ignored.
> +
>  \item Buffers are added to the event virtqueue to receive events from th=
e
> device.
>=20
>  \item Buffers are added to the rx virtqueue to start receiving packets.
> @@ -167,6 +201,10 @@ \subsubsection{Addressing}\label{sec:Device Types
> / Socket Device / Device Opera  consists of a (cid, port number) tuple. T=
he
> header fields used for this are  \field{src_cid}, \field{src_port}, \fiel=
d{dst_cid},
> and \field{dst_port}.
>=20
> +If at least one device has negotiated VIRTIO_VSOCK_F_MULTI_DEVICES, and
> +the source socket is not bound to any CID, then \field{src_cid} should
> +be set to the default device's CID.
> +
>  Currently stream and seqpacket sockets are supported. \field{type} is 1
> (VIRTIO_VSOCK_TYPE_STREAM)  for stream socket types, and 2
> (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types.
>=20
> @@ -233,8 +271,12 @@ \subsubsection{Receive and
> Transmit}\label{sec:Device Types / Socket Device / De
>=20
>  \drivernormative{\paragraph}{Device Operation: Receive and
> Transmit}{Device Types / Socket Device / Device Operation / Receive and
> Transmit}
>=20
> -The \field{guest_cid} configuration field MUST be used as the source CID
> when -sending outgoing packets.
> +The \field{guest_cid} configuration field MUST be used as the source
> +CID when sending outgoing packets.
> +
> +When VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated, the source CID
> MUST be
> +one of the \field{guest_cid} configuration field of the multiple
> +devices handled by the driver.
>=20
If the guest_cid is used to distinguish between devices, why the new field =
index is needed?
Can guest_cid be sufficient?

>  A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
> unknown \field{type} value.
> --
> 2.34.1
>=20

