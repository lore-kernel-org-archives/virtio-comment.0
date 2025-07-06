Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463D620C000
	for <virtio-comment@lists.linux.dev>; Sun,  6 Jul 2025 12:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751804623; cv=fail; b=cvZjL2qDOwqq+zRqHsFUw2tKxJ2ZL3B4UIp0MFBJgQP/sH+spCVyhnEwBRHlnRzJDAnKnSfTm+Fo4dZr/r/AOiktmTQYL3hBO3qSuyAI3Vsq8kD4sW3Xyp9WjdI8hwc/oXdQQ7ynXV52HLLoEvq/CQ80oLrUIKtUcLGQIbe64qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751804623; c=relaxed/simple;
	bh=5C1dKjWfiZ8RJdhztKhiKVm+LPNNXRUh55FFySAj8hc=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RBPWbLm0Uz1DAqDiEUd4x6vxmYPyDPCNYOlZGDeczz11xg2RkNLFFrm2S33urYobnBYz3hKAMz6YP4c3+v07o3JbfSaJ/vwod5x+jBOZTcjXm5i7Ffx9K8QypBV0UPLDcgMJV3/vDff1DZGrQAyv0Xg0xPd45ExfDWAaf7QeVZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=a0IVqz5R; arc=fail smtp.client-ip=40.107.94.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="a0IVqz5R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSUjJ+2crrzVySAjNcHmtQX9ATboXR/9JUSRoE6XSKfuY06xA+43vGZXVPMxsTE3A5HHST+TsrHiBsBBqEIv8W0Oax4cSZ9KooqMnkMA2HZvkdiTc9nJDZxbiZvxZe5D8NmSj/7i1LLE9T1EvKiEOdmTiuspfCQoMUM3UYFhA70ZYypCoP7C+zdNF7tutJGR/0rBirNa6RhXRq7LUkavBlmgRCaoPDhxJAvW43FqWuyyDPLkTHox8gtHhsoF2zsXEgtSXNnai8hlN1o932s6PZcyOJO3qGt1x2Xo+o76/3rY9hMN8CtKb+WHSjW78SzmE0NHUGoEIBJnyQR981OKWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZBJ4UMr+r1kbmY7zEe7VEhC3X9QUxZ9eaCPFbN6Bfw=;
 b=Fb9hgfVDvEbFrZjWLyTlqAlU1fJ2xdsPwanXK4C/B8thlQqc/bku0+dDQRutIE/KZIfT7Xund8jj0oFzlxD3XB4P5R16VcryP1YQMPzsxONpKxKXsrVgdqWYjAMrf2iSljKVMZrC3yU2fKDF77ecLDsZAZ2QjsaLFasvRR+9GbzEQuIjrBpALZrHFvi1A9t3TzL2IDR9DxkdlUS1/yBUDfdKQmFeLmqccZviUuPJdcXMD1TczJ6bfiNlska7Ab/K+zVxVA88aa/bid+pgc4eZnaUbd7tnIX7Z17bL+F5zhxHWDHcM2jcUjHLIip5sVYdGw78bKYXeo325VeU7DjbuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZBJ4UMr+r1kbmY7zEe7VEhC3X9QUxZ9eaCPFbN6Bfw=;
 b=a0IVqz5RnDDKNHC9DzGuf9v1rNS4z1W2ulftreYzq0WzeNuCP96mNeN63IWwzoS4YhRy3ZhDKqzoO25mbdhH8Mk1SBwzLSPLC+4lgUuWsW99LKvP5XiNBejQ5Al5WB/vx0blH6cqFbHI16TivJ/re65lvR2IK4+HXBn70B2S1JoKy9xq+1QMZgJxH7FmOAub1zHvHZyKfzhlVAlYbYK/QRuFut7LI93LuRGm8ho6vJpVf+6SigjXfzwI73GgMqt7zI2nJgnDfJdX/4uqjtVFwpKRN76R8mdKmYb7OBXs7uAHW5XXqwoeCc6oYehNOxfuARRPd3DQQhxW2r3GFxunpg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by PH0PR12MB8097.namprd12.prod.outlook.com (2603:10b6:510:295::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Sun, 6 Jul
 2025 12:23:36 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%4]) with mapi id 15.20.8880.029; Sun, 6 Jul 2025
 12:23:36 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"ij@kernel.org" <ij@kernel.org>, "ncardwell@google.com"
	<ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
	<g.white@cablelabs.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v9 RESEND 0/2] Update ECN and Add Accurate ECN feature
Thread-Topic: [PATCH v9 RESEND 0/2] Update ECN and Add Accurate ECN feature
Thread-Index: AQHb5BeCIh2hpnd5a0y1aDY3s1sZXrQeTpiAgAbI6IA=
Date: Sun, 6 Jul 2025 12:23:36 +0000
Message-ID:
 <CY8PR12MB71958D120A087B79243A79D7DC4CA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250623081847.21264-1-chia-yu.chang@nokia-bell-labs.com>
 <PAXPR07MB7984F5C4CFBB42A74690F103A340A@PAXPR07MB7984.eurprd07.prod.outlook.com>
In-Reply-To:
 <PAXPR07MB7984F5C4CFBB42A74690F103A340A@PAXPR07MB7984.eurprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|PH0PR12MB8097:EE_
x-ms-office365-filtering-correlation-id: 73e49833-4d07-4702-7eae-08ddbc87ee6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?evLJnB34qjhjah+Li9x2U6+Y2adYExZ/oeXMuU9cqjmWxl4cdQlvgH+FhK2v?=
 =?us-ascii?Q?pF5jfCNicAP7yxYSTvwBWK1j0XZhNbL8sZkMiFwqQ6UYcaJb111gFMNkDdjk?=
 =?us-ascii?Q?8h40DOZqFU+m0vjrCNUmOLw1afVpfm5NHsaAYbP8SDmL/agYvSTnzTbjc9C9?=
 =?us-ascii?Q?gJC8x5969QcJnvOrqHG0bgMGod4Volt1f076RPGLz6sF0nOwzAaHDp36UfqZ?=
 =?us-ascii?Q?+l2NcmmnMSU/YUxY+0ge9QbgG7TgWNmb637lGy3tb2WZ3+2iYTjAZJLH2pkI?=
 =?us-ascii?Q?AADqmnVOeNqNQt4hrge5AexuUIBREjrScE6jL8fh1TyiS4GwOr1wCTJn0FDC?=
 =?us-ascii?Q?xbyWt4+uFq2uNcit0EUkBs8T1tA8bc9596dbhSW63O9tG8DavxiRMFTpnzUx?=
 =?us-ascii?Q?qnm9obBBfkoK9ntxQQXSY+C71FkeF3Gpv/ge7aUfY5QPIiQ/ErwBhSarjPhJ?=
 =?us-ascii?Q?dGZ974C1z22OE5y0+i7jASwcKgm2JbesUhaECua6oKViMHppiao2ZEXcAflB?=
 =?us-ascii?Q?KAtVKhbv7WvgVymObdLIjTH3O0aGBfyI3oOI5kSInXNq6K/1t+OaJNj3gF2u?=
 =?us-ascii?Q?yAU7+W7GEezjn4YWB3ZhtGkiln+9dbhYhGKmGb8w5aQXy9Z120sxJbOumXlF?=
 =?us-ascii?Q?wY1Dzz6nxxFE4xKlAsLwjHr//O4uE4NQJ5M7dwCuZ6WevsccWhROCI0AGzTg?=
 =?us-ascii?Q?LUo/hETzPNz5tLlE4rECB+Gm+EBeqEYws07oWu+EuKX5J6Ty4XVLuGH5qsnL?=
 =?us-ascii?Q?N3L47UsHG9voY6tIQtp0swlcj4fFDGA8kxvq26VZVrbeSMnxJpywkoynHzeV?=
 =?us-ascii?Q?xMOteyhXRYYDODNxbbvyMXZ8XOYfyZGV8q2zShIESJpscV7ipOYoFvl8zLOC?=
 =?us-ascii?Q?4dGZcNjdPl/Eia7r1PTx2ew1P41YpzOowwbQdRwOd5Sd2Vn/rn87qBgSn9XL?=
 =?us-ascii?Q?m7oD28Lb8pLiTs3j2np9gJS0wZOdcQ1aNxzMul5AK5mpRqdV1P9h1jTArMJX?=
 =?us-ascii?Q?0q35GjhMAeRaixr+mnLJxYje+MXTEySVE4wOYqOa/1+8/gqB9GF4lmCQunLp?=
 =?us-ascii?Q?Ce7NG+3RvhIwx01U1czGciIriuQZQ2WPBES+sE4JinIMmS7KH1W2QLb1DOD4?=
 =?us-ascii?Q?ptCfgHGnw0rOwRfm1RdUuBzHEcGkA7OXynp6fayDo5Ya4G7FiuVhJjl9V5+A?=
 =?us-ascii?Q?iBb88ca9+RzRFf/Ny3UUMlLZ8jdiPUdKeP5X6ROiJQdys0EsBOxAVgvQcx2z?=
 =?us-ascii?Q?Fcq0pR7xBZfxjfuXY/f/5K++ZxsJF6BEKd5dIIcCbqTSDj/Kgs0p4QLwtD7I?=
 =?us-ascii?Q?PjBdNb20whpI2WqEt4SSTe0bIiAuH7aSDtP9Sa9Yp/hnjM2Rj23QQQ+i8Fri?=
 =?us-ascii?Q?igfYxczFiY8ON5hyUsMM2yl8Yw350Wh2BjCEEPYv9147seZSvbHPL2EFOM1b?=
 =?us-ascii?Q?ePDOguk2gn+BW9rIoFcIoFcyZZBvD1S+aYLgVhtdQsICGG2d1eiWbybel83I?=
 =?us-ascii?Q?pX8eYH5d3S6RDbxg8iXd8Lt4XFUeh/LcrUip?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qbE96A31voY0oiikJWFPGecDNOJ7fKYbafYgyQ1W2jayLDyciBYd267K7hDI?=
 =?us-ascii?Q?wapiLkUgeBpF5RIeIIxL9VRItz0seQ+SZ2R+aTF+7Z9bo94pnlkpFPvznsI+?=
 =?us-ascii?Q?cXOwGMfMsOGjPHvGIPyTrReerYJYP4rw83rPjgtDhsZGZv9t592mIiPmAqNG?=
 =?us-ascii?Q?HVzcRPOviVhzj0LVBWrtwKp89Y4RliYmEE1OXaJl0+vGLx5onTbJGnDTxnrm?=
 =?us-ascii?Q?uR/kDVqAzJbwB+litSSAFn6XiLbDBRmnej8Tevjjwo/3vefwFVaRBEU353me?=
 =?us-ascii?Q?YbTc7cNtToX1W+a3vyuInbYP1Z1eL090p9OjaHHvMlf2NFvUDYi632mOzm9i?=
 =?us-ascii?Q?7aEMuq5rX0YT5EyN8SbsOjfPOJCOTGS3fGQOpAp4OV1Pry5em0/KkU+H5Qts?=
 =?us-ascii?Q?vt7rfBbQe0gGfIQ4tUTVQyuCQJOlVlRm+x3kDRNwK+XVT5uJ8yCt614BOpHP?=
 =?us-ascii?Q?59zAF/+33/3mXFtafb0AWFu7wC7palfj+MD2Pze1fWddhNCwihzLhIIUNqo8?=
 =?us-ascii?Q?2l2TUCDv7UxzPMNFrSKwBpZwow+IhQ44/ErNMVrsmDnVGKAYF7UPKrDX7HS9?=
 =?us-ascii?Q?wicThRaIP2GgPmhjCsn0ndifCxaPatCB6yRyeokizL33R1znZgoe+piiGgXZ?=
 =?us-ascii?Q?4jm1lewW82d/kjAyS/sDcU1sKarakF9magIVmwC63xvSx7Df7seU2FOaFr1w?=
 =?us-ascii?Q?GESuYW7qr1tw4RtS6ArYFnVwO1dQOEd0UW/Gv5HWKfKaw6+X8svCDWB7kXTr?=
 =?us-ascii?Q?bZi6IklWdVGzs9n/mFKWQ9UlP3Ny1cv1P0CwJp3tbPTAOYsxQoeDrRziwyDs?=
 =?us-ascii?Q?o5vSOZ4H6tEBIkENnx+E1iQGr+ftTk29Y/BQQg63zjZO8WyXwwX8YWK0DG31?=
 =?us-ascii?Q?l0/FbAVieOeGYVSYelIK94FmCxK9fR9SHhDGyIqMDWpY/cjOG+UZf814P5qX?=
 =?us-ascii?Q?sEeIPZB6GAIOK6bfHEGWiyIjmoQ4jovxbKQT8jy23iI8LDNBLV0mVP1HEvYn?=
 =?us-ascii?Q?WU6rnW27DLypH2mh8SrHqPDo5aK42vGx+pcdqGbEuI55Vit2Ac8WBPaUnvtc?=
 =?us-ascii?Q?ygATc4lbIkmhgtxHpo/TxM6xS+idyzdEsFdkjqA1l8sZneEOlHVqq51q4YSt?=
 =?us-ascii?Q?JUAnDIgnzin3y1t4gIydDWLYCyU+6rTkJaTQRTgJkHfjifYCQi0dWwLiALyp?=
 =?us-ascii?Q?V9vMT5ke1yA/tJq34mXnAUjSzOyvUM4m2D1YEo8FAREHXMMXYGJtDqlpoX9s?=
 =?us-ascii?Q?/uIipFDmvAzWG41NQuJ4XhSvuFFMKbAwO9ykSQXIbwINmJ1BW7IIdHjLqH24?=
 =?us-ascii?Q?xaUC3U3WD/P2zmvOhC2+sOSI5j+xyean8jq7xK58cmHLet71ZCWfgUAZBGJ8?=
 =?us-ascii?Q?ZeVwsEn+QLXQhOgyAF79+OOll/2ya5AJqhk+Rshn0wRlyiFjil5khbaPyLcw?=
 =?us-ascii?Q?0SePjNTscaffHzATUV6s1kaboP7EhUKqVmQypOYnvKw1mwMQZo2Pg/FHpTpN?=
 =?us-ascii?Q?yw1xos8NLTDOShlvej4dndmOYud2d7iXnRL6vWnsC7AEKqRHmLOPvD2tr4cC?=
 =?us-ascii?Q?wvi9mp8PSnKB20HS66s=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e49833-4d07-4702-7eae-08ddbc87ee6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2025 12:23:36.2788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cned7SVSyHDWA+SB9qx8fOIKm9W+AALPKmYU5cuuDwJuPkXeYogWYmJD//Ht019PfpqMGXF3ZEeOFSIJhjRH1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8097

Hi Chia-Yu,

> From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> Sent: 02 July 2025 10:10 AM
>=20
> Hello,
>=20
> 	Just want to reach out and check is there any comment on our
> submitted ECN and AccECN patches?
> 	Thanks.
>
The IETF document referred in in draft stage that expires on 10 May 2024 at=
 [1].
Is there a newer draft which hasn't expired yet, or link to a proposed stan=
dard or Internet standard link?

[1] https://datatracker.ietf.org/doc/html/draft-ietf-tcpm-accurate-ecn-28
