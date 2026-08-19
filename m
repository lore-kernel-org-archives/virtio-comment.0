Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011043.outbound.protection.outlook.com [52.101.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4710B3C819D
	for <virtio-comment@lists.linux.dev>; Wed, 19 Aug 2026 06:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787120931; cv=fail; b=RrtVXgG8ynq8ot1wTOHMQC46qW5YhVwWGOhvidcYxs7J7Xooh/tD6xb470/zdupZTgZSKnDj4aM0pHFPNx399PHBE2wGvmZ9A73PYJQlpaiGVTPP0nSDNf3uSXmn7/D4us3gy3cjoCpUZpra1TL+h3deuWHA8KPnCAuCXNa5PmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787120931; c=relaxed/simple;
	bh=HJzIzN+C+Wm5hJ//EInBPxhCjHqUMh6/DkYHEDtknk4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d2hhdqJ80h6G0jxg48Iy3oc4fjRmQ8idZpH6dPwR4bjIRziNn9QFQlVH+vO8J+eioIC2KDlb5idP3Scklov5xsJOdt9lVszsdVBC5ncQUb19egyul81A4eSIv8Ac6MqrCM/gWOy6H9JPiNBMJg2nkgfSkqab/rs3HIfEL7Bp8TE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PXax48BR; arc=fail smtp.client-ip=52.101.52.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PXax48BR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtxT0eYiMTPWbDo5gXkYTVH4AsdSfewWy5s7Hroa1rapCEh1nsLiD9lM2BJjGMxZdlzF4Bnv6B5HOvwnwgSLvyzultYvuN3sML9R4Y8xX+4p4EIvio5U5k9Lu4ziIKgak+ZIjmII/U+pwkcoFOQxP26Wj9POMqb6yXLHI9Cl3EVn+8O+8v9dNLktIj/JzysOW7CPnkzTHJC6mjR4W+XzcRdDe21FcJxeRKeD7V0J6sXM79txggTl4t9WtMejI3cZOF6TcTAWt771DwKhrqKPOqA6AFrfizP6lKBAwkp5KWu9kFHsnNw8GUkSdemgj+UibhpkuVu2LH3ZFQUTnIphxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opRaykjq4/7463+Q2/7UphA87XTdVhKr4svNN5TZG68=;
 b=rYOIIlDBMxUuAKBltOzJwNpMfPzCdvs+vqeUwWSBCN/G0nLRYxPfe37Qo0hC4McsVO4/STcYkmBu1y7Tz5xnyVdJ4TJpWaSUXnRdHAGoALOmKJK6qtAD4/o4jd1VytzFn+no2dmL8479CudvOjbutG1qIF0jS6p5MA5vSpu5pglv4lMb70yIlMXT2i7XyYeEAwQ86vfcmMqCWAlR4SdKcseunpZfS+m5zSfkP2KBSNpEIsul58lCHQNHZi9IsneGxhPR2RpVCVTWs72Xu4rBtBy6ULNdtcVrRMA290d9q8bAOdgjPiOq+brJ5B/Um/Wkef6KprY3Kjn3ZTDT2SPIFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opRaykjq4/7463+Q2/7UphA87XTdVhKr4svNN5TZG68=;
 b=PXax48BRl7mMLVHfaJAiUryq0ae1HzA5CMAWWWEjFJKzGJb2XqkULyBwd0VHLGGpMV+IKSEdrjfhKAvy1IjDWf5lh5BfU8XycKY3zTjjBeCmHK4VW5x0NpbC4zzH4OTl60ZTFG4bQ3aPQ9tRyPzBUakc/o3ZhimdOTWpp6CKvl9mlyB2r7w05xkwfAFTcITHDUNsEyB6u53B4mzm/+86+wAN5Yt6/VkmDxt9eRWfpqVvpvbow7VCDg8Qrtzqb0+LEMDlnhwoNkKLQxX++4fSkbF9LaRDt/LeRownYvrpMh7JnEd+OVVDVbDefVJy2M1Ki35squM8tHDw9KsmyolmRA==
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by DS0PR12MB8563.namprd12.prod.outlook.com (2603:10b6:8:165::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 06:28:45 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%2]) with mapi id 15.21.0292.024; Wed, 19 Aug 2026
 06:28:45 +0000
From: Parav Pandit <parav@nvidia.com>
To: Alexander Graf <graf@amazon.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"nh-open-source@amazon.com" <nh-open-source@amazon.com>
Subject: RE: [PATCH v5] Add VIRTIO_F_DMB (Device Memory Buffer)
Thread-Topic: [PATCH v5] Add VIRTIO_F_DMB (Device Memory Buffer)
Thread-Index: AQHdLtdCdMwnG0ovwkypaF9QKsaSfrak5zuQ
Date: Wed, 19 Aug 2026 06:28:45 +0000
Message-ID:
 <SJ0PR12MB68068878058CCE8E74EE00A1DCA52@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <20260818060255.6853-1-graf@amazon.com>
In-Reply-To: <20260818060255.6853-1-graf@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6806:EE_|DS0PR12MB8563:EE_
x-ms-office365-filtering-correlation-id: 433d5235-dac7-4210-4d36-08defdbb1f14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|6133799003|22082099003|11063799006|18002099003|38070700021;
x-microsoft-antispam-message-info:
 blIFt10LYPpXVlouBpxgNZp8lxCoPcRuQAzERpqJTjqWFwmXEt5pND4BYlhx233uv/TGotqbF7AajtsRhZR2Dq2jr3qx2yBjlAva2J+x7Rd5xqgnLd4A+JqZNcKPHB21psHUzyG+NWGo6XfoTDdnZ/eYF1XrfO7j3IumC4/vO5jfhHA2EFSrLg+sSlJS6GlQwcT77Q58ERfQSo8EsMUiztaf/3t2RyB1X+dgRVj48Qb4im0Ufl6WKMoPHvh0Z7BuUbsmAQL6INdgG9pSYbuMRBZTm+VOA7ZWmXHTmqCqSdU4kzrLlEhZ1PcIxRkiAvjL1oGLkr3KCY7b5ZIZvyiEEcHLDc90A9mFWuWHxoUZK/ped7JcEpI5QuJhxC2UH3PANWqN1BykBSzKKdC6MybQsXJwc25kmgcXDRAblKkxXM+/FxUJOngY1kKDgrXj62ctCBGLatPqT6OMGiMrUKV+UEwlTVQzFoS2fScN+iUKCuE5Ly9nqrVPvJmTaDAnyILIDaxahqWyiTXp9pEKYfz7GsUGgt5xPp5sptlfP7Jm1fMa+S+LVBhu49EncMzyURNIPXDoRLxVtRXhsioXLhcJhq7ye2m9kNdBjNkOsYcBYYXe/pyPNlEH96TCPb4KiPhZ1SdWPW6HUSb4bXevG0qlsAjpxEhIBUnfC5uf2O87oBTiwE6eQnqqJhiBlyEqBwSr+5dNb0PieBYyIg4xkxgzQqGygf1wS5QISINXXUGISAM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6806.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(6133799003)(22082099003)(11063799006)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/y3MIq1UIbXOTE2rcE2ymI1sWnwu9l8np2+VAagikEUL4d/wYlbZ6esMlEFw?=
 =?us-ascii?Q?yvAnLr5BQtpifH0FRXPqE6CVTbwCxcQrG2TXSiJChGF7o+MGdbi7/c40nCoJ?=
 =?us-ascii?Q?WimnDdGldu1z7/y0DZSOfP16bHrXhaksKvg8fmlTMqHzGrnCqoKuUTxfd4i6?=
 =?us-ascii?Q?fnJe2OJULuwuCsWgiHXh0+n6nFWSwIK+Hp6JG6xaJse9A0f0w4MHsrGq/Tel?=
 =?us-ascii?Q?bl2x5EPV9+K2yp/+4IHUxvA2yGV1mn3L23GS51759uwRmtBJnACYT0t8Y+DH?=
 =?us-ascii?Q?dS7TV4IwCgYKbY/BnJ1oOMChzzwf+8ctTBS/lKVMWUdvCQmaxZ5WWRexesfu?=
 =?us-ascii?Q?DIVtu/OQsyetHrVBDIih8LhvSGlZJ2rbiq96tdkWFD0NzZyohEpjTTchdoRV?=
 =?us-ascii?Q?DkPRaSdeQys4Vcg/wy7oKIGE6Rq9sLOiJ/x6+prWau2PesG/WBNOKlYH9Hll?=
 =?us-ascii?Q?gjfH1EdJTnxOcBMqwLO4gU2zX/h+i5Bqi5vyfpHGGkG7MZ11OKK7HlRt739A?=
 =?us-ascii?Q?I8azMH/tkDuJw25oLwepF6D9aWdE3HGs7qNaXx8P2qkbCVCl6xOmjzxjBMI+?=
 =?us-ascii?Q?Sqi5Pm6v9nfmGmjrdpfxd0aUrod3nRiMvsyFcc15VB69lVwl+F7IJ72rwuD/?=
 =?us-ascii?Q?tW6D+fXEhLABC3ghxDjms6Do7g1gE8GUWynd/lZExw3ud3snTyFeiBjGWp0X?=
 =?us-ascii?Q?rbQPGksvdqpb9L/OJVxjefIGHDYLQj2EKxzGQFwyatoF5FrnOs3tZ1aXomXd?=
 =?us-ascii?Q?scVlYj+IjuZ78GPzy+fzjDpM1AB1KkPI0w8aW9DagDE99YDT1gyu6rnK5zkE?=
 =?us-ascii?Q?SPx4SDjexwJlJQkwu+WowUg1c2PNrorDzg/M0pD5IARoIwpoJrv9RGVYJWrM?=
 =?us-ascii?Q?rL2FdcJobMRU8tQaTfFUjVluwiOQd9uaAZKZ85cZfzQ/LMIJvVDsTLD+gyjW?=
 =?us-ascii?Q?ZQvuLIiF+4BSU3VZDYRqACCB0PEdF1TuB+Eyql8XSU6CxhmKQ1mlMXc2DKEe?=
 =?us-ascii?Q?VDSJ06Nh7x4dZyihxGcXFOaDmnn1kqLmiV0TcIzDxOcaN8TO83b+QKJVsSGS?=
 =?us-ascii?Q?10gpXNIkBoBxrxApqtpfeTwDTKOx56AbkV0ib7UIEjXJBpKwUldddXt5DB5q?=
 =?us-ascii?Q?JDF07JSZPzf8wZRbzdbOxDaOuNRz7kry+u7Ymk3bE84iXNszvH1KE90lZgLs?=
 =?us-ascii?Q?WEx/8wdFwFp9lrTr6Kns900s/+S3fqnUUBgUKtM/AYuw8JXp4ctOBwRcAZHL?=
 =?us-ascii?Q?sTRpK4x7wtibNfMaoon1AX+mdrmZkw1vwCH2Rxujmvd3HwfnO3ddKQ7w/l0h?=
 =?us-ascii?Q?0r1dwdVIh1GbFEz0LixOaJKPN7wUj+QQgiBNp1QEncPDdS+DhZed8fTdeoF1?=
 =?us-ascii?Q?z0v0mNDzmWoEmAks98QXRWh7xTnR33P614fwROjcrcZ6rkHyJB7dl+nSQG57?=
 =?us-ascii?Q?TteEXEm5Gdo95nkxqReYTLMaWJ4MzQmDKQ7nrXbGPEUpphLXOJlR5w4uFB+Y?=
 =?us-ascii?Q?IceOpM/zcG+aAMrVBPRkN0znPVBHOplA7SPDMW7PLLzsthQtoJrNgUIBPqlZ?=
 =?us-ascii?Q?ZZjZD9v+KSl233lBsPR4ErUqUgtIITJW4AKJeIHzpwO+ZndWxcrJDhTu45h9?=
 =?us-ascii?Q?QS27H3uY/KsZDCcf4LVsz7O+cyjMjz7GP/oBvOt8qehb4F9b3SFsJ7wskmkV?=
 =?us-ascii?Q?KTdg9Ra30suYZlWIydPKVmFXNVN7Tsc9qdE0SVTIKHgl9qw9?=
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
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6806.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 433d5235-dac7-4210-4d36-08defdbb1f14
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 06:28:45.5104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TS/GuZxXSTARhGcgAV/GIEFtD4utTvR/FDLKU1pCXLe83ecg7UQ2pk07TPq4jckkm7mIBrOMhZBny1dBzkB/9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8563



> From: Alexander Graf <graf@amazon.com>
> Sent: 18 August 2026 11:33 AM
> To: virtio-comment@lists.linux.dev
>=20
> Virtio devices assume R/W access of guest RAM to perform DMA into it to
> access its virt queues and data to operate on. This basic assumption
> leads to multiple problems:
>=20
> Confidential Compute - In SEV-SNP or TDX, the host has no direct access
>                        to all of guest RAM. We work around DMA access by
>                        having the guest limit DMA access to a common
>                        shared memory window between guest and host
>                        (swiotlb).
>
In a hypervisor example, where virtio device is composed sw hypervisor and =
SEV-SNP/TDX is configured,

When the guest VM read/writes to this shared memory,=20

Can hypervisor see the plain text content of virtio descriptors and actual =
buffers?

> Vhost-user - vhost-user backends require access to all guest memory, not
>              only the memory they are actually supposed to access. This
>              is fine for trusted backends, but if you want to limit
>              visibility into guest, you need to do weird stunts like
>              bouncing memory in the vmm [1].
>=20
> To restrict DMA visibility, virtio-iommu allows the guest to open specifi=
c
> windows into guest memory to the device, but it comes with its own bag
> of problems, such as dynamic allocations and complicated device <->
> iommu connections that need to be represented reliably.
>=20
> Instead, introduce a simple mechanism that lets a device communicate
> through its own dedicated shared memory region: Device Memory Buffer.
> A device that offers Device Memory Buffer exposes a shared memory
> region, owned by the device, that holds the virtqueues and the buffers
> they reference.
>
To my understanding this is only suitable only for virtio-devices composed =
by the SW hypervisor.
In other words, for a real hardware PCI device, guest VM reading used ring,=
 virtio net header, actual TCP packets, over blocking PCI reads seems like =
a snail device.
What do I miss here?

I don't understand how a basic virtio-block write IO work here.
A data is located in system RAM to be written to the block device.
So its buffer address is placed in the virtio-queue.
But in DMB mode, this buffer should be written to the device memory first, =
and than put this address into descriptor to complete the IO?

As I start to write above question,
I start to think that I totally misunderstood this DMB when reading " SHM t=
hat holds the virtqueues and the buffers"


