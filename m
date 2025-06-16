Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4622701C4
	for <virtio-comment@lists.linux.dev>; Mon, 16 Jun 2025 08:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750062374; cv=fail; b=GP8TwqZtAiLsW2Ca78P7uGiy2heqZmnJ5xoPwnwFxAtm5/TfPrZDELInLAMrAfN72OPXEphA5UTv/obRPhLpHl+8Yd6ydajyWFoGZq/tsJBdFwSX+pMehBT3Sq6Mtji2Iou1LNdW33OEjaSbqWj4GiTU76qXgUX8gWzQBqGonBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750062374; c=relaxed/simple;
	bh=k3qhTo8NkE27PdwRUUgYXYn8C5eX2F26aEdcd9ZDMk4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lyA/LayrOYXZ0v8mvdq7jTlQ6o4k10/k57+Df4FOAKaln8BRspnxQ1n7a6WbonmvMekdodgzcGQdHwqb3GSH4ymH8waGHzBIlF+JGlzfgcD+uSH1514EWR0+jnmqW2MuooGJxwRdwRJQIopGCYti+bh0Z349Jgd0PK1bYzK4Upk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gUemE/uD; arc=fail smtp.client-ip=40.107.92.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gUemE/uD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=npwAWD1BesPzv3ompNgMohRTu24PW8dbcAXCJ2jQwKlPoQ/KOQMp7H/oJsVR2fGgCGCLTVOQ58nE999MM7Ckk2/mq7HA5Wt8qD5IblJlYDvoEG8dBMyOgGI8IYjcle5umE3VWTKUbdeYeRgo5IawsbD7eDfN1UvohMw3nkukW+TehxwgODuj1yK0yZO3W0MMXr2cFGVo2OHdSzB783NiWY5fYaXjvegJiQS69BgLcnX2ZvnRrHC+SadrkBGJDJGEnBsNFboP18cr3LfuSV6+Cn4TQ2bv45T7+FebM8u5zmLw5CncIlyiIKUOmdK61YvYABLe5qX65A900ry6ZHJB4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqXZ6JBjUbbZ8XjKnPLF5oR8s+ysCyQ3L0rxUvPaMPE=;
 b=OjO4RX20VWa82HoT6gqlQ6gHYddWsgd07r7Y+Z3eB9bIhm8RikwA4LVBBei1X9MwlitAFdbjF1qr9Tf3OWpofweWvkZ5O0tuFxRT/X/nrHl7QTTXmwmX5poB7HTd7CS1MZ3ekQUg3qjQUt6Y0SZKnq95xLN9nDdnXXDYbfnPOAvHXrd2zChFS8KaeIsgLGSh6ByZuahGjzemiirZgRcgh+ZIOmHRr3hfg1w4CLpDXtxtsnZOv1yAvxjezvXBry3QMIYCDwGALJrSCM/QPrfR3883du5zjGkmgxXU3oCZivdd47HWOf2vuyP4CK5vbMj7mmxtVZVeVRKAOPlxxoTXSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqXZ6JBjUbbZ8XjKnPLF5oR8s+ysCyQ3L0rxUvPaMPE=;
 b=gUemE/uDrV7PAYS5Ls2ZK//2xAxDAgzd1Gj7Be3sDESEHiLYzOytwVhuvlR7E27oYahiyggU9jvBlR6Jb1Fm8KjaWkXc7EJmDB9VAC1MZuVtBSGKUE5799xmjz7eeZ6E3AumifnNkMfUH9CTyTHGixF+6acBKrlYPkBNMpC/NQjUgcug4lMA089Z7+GJoWkljoUnRWQLV49JejhWHu0c/seksT8ND+l59FyzZpb6COf5cU5wak900jDqDH6i9cljSMbXRPWrVx/JQT3yn8wbtjEqE9pVOgeiclmuFYJVC5gkFiGTjFkUrzb7pa9ZMXWZj7ILew023LxK2pOFBxkz1A==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by CH3PR12MB7593.namprd12.prod.outlook.com (2603:10b6:610:141::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 08:26:09 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%5]) with mapi id 15.20.8792.033; Mon, 16 Jun 2025
 08:26:09 +0000
From: Parav Pandit <parav@nvidia.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
CC: "fupan.lfp@antgroup.com" <fupan.lfp@antgroup.com>, "mst@redhat.com"
	<mst@redhat.com>, "niuxuewei.nxw@antgroup.com" <niuxuewei.nxw@antgroup.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
Subject: RE: [PATCH v7] virtio-vsock: Add support for multi devices
Thread-Topic: [PATCH v7] virtio-vsock: Add support for multi devices
Thread-Index: AQHbq7cy7Mcj3ywZwU+rYtE4WxELUrPZJsIAgADFHgCAKVi30IACkmoAgAAAtsA=
Date: Mon, 16 Jun 2025 08:26:08 +0000
Message-ID:
 <CY8PR12MB719509E84C1BDDDE468A1E19DC70A@CY8PR12MB7195.namprd12.prod.outlook.com>
References:
 <CY8PR12MB7195DEF6014AD36A46C04971DC76A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20250616081820.1159352-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250616081820.1159352-1-niuxuewei.nxw@antgroup.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|CH3PR12MB7593:EE_
x-ms-office365-filtering-correlation-id: 6b13582f-b0b7-46a6-dd97-08ddacaf7209
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?jlAG5KGW/UCg8XYtoAcUgujfjxNnXnY53sJUaedGFMrtidH4qkL8W8UkwGtJ?=
 =?us-ascii?Q?ajk9uf1Te/voA/CzAAUfcVxtFHkb0ApGsOnEV4bAcnuPkF6UPFtrdcGxTZev?=
 =?us-ascii?Q?4mTyoILFVb+c8GJpmRxDn0Yd/uIFpw7DTGlhORtwf6wDT7vweCqFG5rT0t5m?=
 =?us-ascii?Q?ymiILpUDGzN5iFh2xZXdn+hPhvrvOJvjIVh8fUl0iQheJf1mBm5KuWF+qnWT?=
 =?us-ascii?Q?zxL29jxv6ceyudiexgEncVZkNaCM0vCa2Lmt8KLzdFgTUXaPdtgJO7SB2uwg?=
 =?us-ascii?Q?KCVMfScBSuyzXHdoQVIa4wKdE4MTb4aQODgSTTVhJPPVGTgiEtiqUXsIv7RB?=
 =?us-ascii?Q?v1/d3PShfvoFqqWc3dBCc4gGuEx/OQqmzJJ4XDtZxvImt85UMSuuNPmbsMwI?=
 =?us-ascii?Q?bExfBpsVINeNVDap/edmFKhEfnbW0At1CqpY884NvSavjBZcC17Eb10BkaI7?=
 =?us-ascii?Q?nIP/1/LdgCXLhyEDxWq+b2bU2WJfThe0teZlc89PzOOIxgJPZlfc/CWc7m5S?=
 =?us-ascii?Q?PsAD2cz/Vnf2S2NFXy46S+6Zywl0wGs8LUEXUWbaQwCL3IoJr57ENgKEkiW6?=
 =?us-ascii?Q?s5W2pzhrI9LSS92loqSnJwtWqRNlz4s78iBp2el+oJih5CP9uLzDoJV1Yuha?=
 =?us-ascii?Q?37njJfMeLSsyi9ETkIpzA/57CQtcFUTwM+9WXgqBHY+ci458jQPse8oXMtkw?=
 =?us-ascii?Q?L799CbFebh8bko+J6DRQYZJmlaoa0NBNq8vmfWYOU8VufQSYXeb9M08ay/XR?=
 =?us-ascii?Q?mrLc8v44o8jwR4ndxFN5JVcz74dVNQ2uMIkxsAn+f9Y76dpwY5CgDoE0jwEo?=
 =?us-ascii?Q?6TFVSiWsUhFV+uJmZRHgOPKnx5eQ1dVmn6Gjs5Ie9wuxUhHagL93Guv3ZN1s?=
 =?us-ascii?Q?eHriU7WXbNiDVjAhrs9OPqNtezsWWpGf2DSWuf94QT2xBkUrWrvkuJYFOIF9?=
 =?us-ascii?Q?p46OLX1+hbxWpzNpmf4/nnOwtTphccxY1n8F0Mmh8o8BAwWPz79hbIX86tBh?=
 =?us-ascii?Q?GQrM80gywzrPCL+57HS09psGjhTfjeZYeZ2QnmnxCCewtO5/5aIcLSPi7Ln/?=
 =?us-ascii?Q?n7Quy8goJ+c56vxRCB9W3Al2GDNMy+q1bNM41Pw18WwZhlx1fnC72eaUCrFt?=
 =?us-ascii?Q?GVeuAxdxmNrUCN+IPdbGxa4KJmz+SLsi9De0aGxhmD1b73nhyd8/2BfWaXKW?=
 =?us-ascii?Q?JfDRTNOvoI1/Sfa3BzMempOh2XkYeuMmQfvaTYeH5/xVjm3AQS3IYVqIDMnw?=
 =?us-ascii?Q?l+av9Nddj06SBadpe8F8wM5rNfu6rTdXL7hANlZ0V/UTqc/HfzAkUiKBzOMF?=
 =?us-ascii?Q?wZ1zSk4gIp+thFeYmOGadNvnYciLgJZbo/mptY2E62Ao9mhm6VWl/+tuzC7V?=
 =?us-ascii?Q?ntprAaop+gs33/drUTe67OVD65wLAzE+YQZU1mWCS9FaEM9b2sWyYkpIaoSA?=
 =?us-ascii?Q?BQDPaxBDD1oex6V1yqADI2ioA0WAZcFgzytvDXMEckUW5kHK96rxuA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8KA6rjaP8E310D+eR7qimrN+wfNd6fd45Ttx0IRHwGr3HpZgo6tQ5JoRLor1?=
 =?us-ascii?Q?6PWGJpNhjpN002l0P04AbtAtisKUbwdRMEojuUAIgK4gXnf/zihdk2il5AQC?=
 =?us-ascii?Q?nQ+0r1mWpCmDe6Z0L3A8l6AhEBS/1TdLrQKgCMC1m8GYWdGU9HmM2TXC7jmc?=
 =?us-ascii?Q?K1PCZ2YrsY6KxGw1hXc8zfOMgtXHWoB1OwUjxn1TB/e0OVh383Q4gHk8Nh/+?=
 =?us-ascii?Q?g7NXpr2ZWZji+TlKjPVeM/MdlVz8jKeAN+eoQZ7hupczBIRkhTGz5JMrZ643?=
 =?us-ascii?Q?YfRB422y9IB1Ced5kYwzwdz0xkV4vSiEf27UfETGwnvcuWpR4IfXOMCKV6OP?=
 =?us-ascii?Q?ynsOgnfVUv03jOkoYIerg/VJIna1CJgP/J53RNYYNx8n19BvezzQ0wdVtgZ2?=
 =?us-ascii?Q?1kzAwzBhj0gSBqdDeHI6xdyEshMon6aZE4h4eU0jmfgnsQ3/ygwLTuZfbo7H?=
 =?us-ascii?Q?X75hxij+rE85lnkOcAP0ywF+uwiYDkJTTN5U/Ijz2ajS5fzfN0raVjvsZW9a?=
 =?us-ascii?Q?cv6R2ttBYDq/6bbUcS3KPzV/xbsKFTdf8gQJrzBFIaW6z0NJbsPVzFLZPJZC?=
 =?us-ascii?Q?ZFNjKIdf27df4xWeJ5NKHb+fTZb05RWrU5e2hUHwKYod4IyLRlS34C7tLhid?=
 =?us-ascii?Q?jIJOes1G14YljUzFvTeaDW//I2SY2qmDc1rdm1FF9+zUgfwQ5y5uun+biAi4?=
 =?us-ascii?Q?GbiwPo3fCaVT+pR0kxjN2kNkculAeqDfUXNfjiq/mbbrfRmKBA00CVS6SYxA?=
 =?us-ascii?Q?DUuZe1EVeSXboB7U+m6ibCMrBTrsKUXprMNZeiuRFV3FQFw3QHQznHMywxz8?=
 =?us-ascii?Q?34RppjaVcnFC+wIWNAWXhyb+tSTB0+LnSUGuJJV5vrQgCDrcuWAuXF2p99UM?=
 =?us-ascii?Q?pihUMsGIDRVRqdU5YGJEiLOlqxvmR8CttYaZWO/9f2Rmus4BIlVyLxct0AeJ?=
 =?us-ascii?Q?TMWd86Usguiimj73XsjsoKPzvsq072bfJ/e/VAcy9Km3kM99nl2QkInSPEzR?=
 =?us-ascii?Q?mQjfhf4obexyK1pePREwdhucESQZa6dIwplxn5ZUIHZdQar+v0F53G0Djv83?=
 =?us-ascii?Q?pYlx2obPxKkeSbk6ROBZl17mdYPw8hJLJXpgTbS8NSf7SJacJcbpYGGCiMOW?=
 =?us-ascii?Q?vy0d7+8Poe6P7Eu5YicpTRPrMfstrRtw5CLDWk0AZ6OxKlnzH9PJ9NgD+p/z?=
 =?us-ascii?Q?760OaOYXrMm1mnU8A/YyUYdfVsHIYozd8UwKuhA+zLaRztgT6s1b52yH6Qva?=
 =?us-ascii?Q?dNN7AkBR0EriZek0Ke7icwYAVfpu9zxNtzjG9X1kLVDxWJgW+lD6bYSQPZ1S?=
 =?us-ascii?Q?MIfgdZxYm8wSoMOlOs5iDzuhVLWpz2H1Gdcq7PEDWDWN5jXDF+dxZY/S3VS+?=
 =?us-ascii?Q?0i4sRkttin365/cwqnrDyLs9w98DQeS+73cBixfK6DdWSnNu2T/RzV6D/KVF?=
 =?us-ascii?Q?ItmxNbN+5nrdT5CHj8vBYYQzRkFCSATRykXaLvO60/aQJqJfWPq0LA+EiVTc?=
 =?us-ascii?Q?jB/Mb25+0RVAIxQI2Pna5vSZZ3YTUKB+2pjc6IpZ7EFLMBTw5bRDTSQv9Ud2?=
 =?us-ascii?Q?Qi1nZrzMDuHFi5Sqfm31FGoNGMwl3HtVnJb9VwX2rpPrcYnpIwKYWwtGXGmQ?=
 =?us-ascii?Q?epswNF5r9sC7T0hOfQfuAFPSV0kw4KPrOXp3Ly9JhT0Q?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b13582f-b0b7-46a6-dd97-08ddacaf7209
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 08:26:08.8662
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vj94K2ZKJFsV89J1DjDIQyFv4djRKp7jmxd4vhCjS02BBAJ2UnMpUZRiEYt/PLKT2pHPcXGE2o6+eKMlDmBpbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7593


> From: Xuewei Niu <niuxuewei97@gmail.com>
> Sent: Monday, June 16, 2025 1:48 PM
>=20
> Hi, Parav.
>=20
> Thanks for your detailed comments.
>=20
> > Hi Xuewei,
> >
> > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > Sent: Monday, May 19, 2025 3:08 PM
> > >
> > > > On Sat, Apr 12, 2025 at 10:28:25PM +0800, Xuewei Niu wrote:
> > > > > This patch brings a new feature, called "multi devices", to the
> > > > > virtio vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES"
> > > > > feature bit, and a "device_order" field to the config for the vir=
tio vsock.
> > > > >
> > > > > =3D=3D Motivition =3D=3D
> > > > >
> > > > > Vsock is a lightweight and widely used data exchange mechanism
> > > > > between host and guest.
> >
> > Even though it is the current use, the specification does not prevent i=
ts usage
> between two guests via a host.
> > So we should not assume such guest <-> host communication as the only
> case to add new feature.
> >
> > For example, in the spec only must requirement is that src_cid =3D=3D
> config.guest_cid.
> > Dst_cid can be anything, it need not be well known 0x2 (for the host).
>=20
> Yes.
>=20
> > With this flexibility in the spec, one can connect vsock devices with m=
ultiple
> different backends.
> >
> > For example,
> > QEMU can insert one vsock device for VM to HV communication.
>=20
> It is also able to communicate with other devices on the same host, i.e.
> VM-to-VM.
>=20
> > A real PCI device can insert one voscket device for VM-to-VM
> communication bypassing a full TCP/IP stack.
>=20
> AFAIK, all devices are implemented in software. Is it a real PCI HW devic=
e?
>=20
Yes. virto PCI devices are implemented as hw or as vdpa for many years now =
by cloud operators and by NIC vendors.

> > This means there are two different backends.
> > And these two devices should not be grouped in the use case you describ=
ed.
>=20
> I think one group is enough for all use cases. It is required that CIDs a=
re unique
> in global, i.e. all backends.
>=20
> As your example, let me assume there are two VMs
>=20
> 1. VM0 (two vsock backends)
>     1.1 device0 (cid=3D3, default), backend is host kernel (vhost-vsock);
>     1.2 device1 (cid=3D4), backend is HV (virtio-vsock).
> 2. VM1
>     2.1 device2 (cid=3D5, default), backend is host kernel (vhost-vsock).
>=20
> The device0 is able to do VM0-HOST (src_cid=3D3, dst_cid=3D2) and VM0-VM1
> (src_cid=3D3, dst_cid=3D5) communicatation, while the device1 is only abl=
e to do
> VM0-HV (src_cid=3D4, dst_cid=3D2) communicatation.
>=20
In example 1.1 and 1.2 no devices are grouped.
Your proposal of this patch wants to group the two devices and pick one of =
them as default device.
If device0 and device1 are inserted to the VM0 with the feature bit you sug=
gested, the guest things that they are part of the same group.

When bind() call is not done, host sw does not know which device to pick up=
 between device0 and device1 when binding the devices.


> In a word, a tuple identifies a connection.
>=20
> "Refuse to connect" will be raised if the device1 attempts to connect to =
the
> device2. "They are not in the same group" is a reasonable explaination.
> Am I right?
>=20
During bind call, one needs to select the device when the devices are comin=
g from multiple different backends.

[..]
