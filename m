Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8A225C6EE
	for <virtio-comment@lists.linux.dev>; Mon, 10 Feb 2025 19:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739216822; cv=fail; b=AFBtY5Sljfr7AZKS0hGM7evZPirwfrmBB+v2EDSvDg7xtLZVfCmvJm10npYwSXu6tkVSpGbSsuNBGhERBv3pTbhCzV1YbbBQMgyhh0IYLYDYqlQuCH6ao/sdLfOfZTq9++tVp9k8lJqLZDk9HFg/0D+DPF+LU/y9FgVsKxeIlmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739216822; c=relaxed/simple;
	bh=iIlA10WNYZISMEqrQCbmV2NLzixXBEgmzjgIp6Lvd3c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RMrUaSdRZgStJ8NepOp846ZQL2UVOhaeTouNfaPdWgHxyX9Z12EPvxzDg6uIkfFfn97wY8RP2sGeGfHrMLQ9uWfWwHKhlajNOuDMF4w9u46CfVXvmOZn/L9GWrPSxzOMYCyc2pU354OTAPUrfIl6itkmuQuIeWadW9fCIbhudTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BdXMNv6c; arc=fail smtp.client-ip=40.107.223.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BdXMNv6c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpiVpAMq0ibfNiCQQ0s8WODgGC4VGBdwOp18j7KmFS4Jhw3fUTmQakGlkomBFxVNw0NGuT22yTC34O46/dfffUUsLlv3FAIpHHP8BtIgiNnM9mp406lYroDRZ5JY6vNhUBdKT5iBwYpLXT4TvhwylEG/hHLarxwC3kufdnQ89NlmboY6NkRAXuRuOQ+tbL78lydzT1OM5wSAS+Cq38s3/ovxSUWlDrS5IqprzCIS6sbwdFFFY4GOEzDakUDVkInIyOd64dyJVeliLPequtrloW/I3hmqyGGlfZpcoSz4j+xL+SgTtE6FGRdcHCpdUMTA2xKzQBtqzSAMZ9u7uQtSLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQeYwg2DD0aUBrq320ucBBDvbeIlFi6C7M6yDWGsgOs=;
 b=FG6ohzi7nhLtZsW7VAH/6UhfmDBByMUAJehJwlbLYXNwJ09qRscaJgkRltsVaUzdFZMmcJJsn0hMtq8s/h6R3AzvmEF1msC3VB1IkDPdY7qb4+zPsn+n/ueECpD2XmhwP+04Wsmx2L2K94NRbefzfx3sr24i3mIEaPcq4sITGkZrq/eQbRd2AIr6a38W37EWOZACULgBuU9v7oCUZUA9NraSjqY6YM4naoqZq2ytsfKUP3wdAm1ZDrqkrcaePlxKkjWi/BSIAXcc2Dcf3XDbRVsLwufLhGL8AYtxfRPx2h+aaEziFllzudTU06aExwoPowIcJ/mC2ejsSRlhFaEekQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQeYwg2DD0aUBrq320ucBBDvbeIlFi6C7M6yDWGsgOs=;
 b=BdXMNv6c11kzpJJHxLExMPy5XT7ynP+LA47LJPbMuvH4n5pvsoR2gIwhkj1QuwRJbjOtxFToc3bOBZulDgDMx358fDPhwHD93EHSiFkcXaZ8DJPFghGwwyVFZtiahwNXoUx5XTc5YpLOnD7Vrjps51eCfF9Yg1CGTURTU1yE7wU+eYszid4larcnse4zXkUKX/eL+IfuYzqCJC+fjvWXzZFNOVVPYhN+tPIz6a7+WlolEm189kVmnLdQ/inQcsllJr4uO8IzIxp0YBYaV6/cFkJv5AvjLSs/3uDW1WmxPNftNc+aasqFFwbg0fuqlhl5yhHD20kH2htRu77feM9Xfw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by IA1PR12MB6283.namprd12.prod.outlook.com (2603:10b6:208:3e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 19:46:56 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 19:46:56 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "mvaralar@redhat.com" <mvaralar@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>,
	"anoobj@marvell.com" <anoobj@marvell.com>
Subject: RE: [PATCH RFC v3 2/4] virtio-crypto: Add resource objects for IPsec
 outbound and inbound SAs
Thread-Topic: [PATCH RFC v3 2/4] virtio-crypto: Add resource objects for IPsec
 outbound and inbound SAs
Thread-Index: AQHbbJVH2vbwekEILUSGKA0h2hr3LrNBCgRQ
Date: Mon, 10 Feb 2025 19:46:56 +0000
Message-ID:
 <CY8PR12MB71951C75DE4B72B480A64F42DCF22@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250122061644.266560-1-schalla@marvell.com>
 <20250122061644.266560-3-schalla@marvell.com>
In-Reply-To: <20250122061644.266560-3-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|IA1PR12MB6283:EE_
x-ms-office365-filtering-correlation-id: 650927a3-85c3-415c-2cc5-08dd4a0bacf2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?nIbkzSsg1D8GRk6JufeRMcHX+uSDDdStjIqKS09p2B9YIhOhN34aZ4CYya8u?=
 =?us-ascii?Q?tJ47aeMzZsraSCPb+4Bud+KGPYNJ6gn4vCK464P/iKa0JXWzJaz0GjI2Yju9?=
 =?us-ascii?Q?liLrOggzixvDz7wyV1MhWju3fHArmqLiYxLqnodgrcT6kkVZ42hxQA6tTxGT?=
 =?us-ascii?Q?jboctxy+tcAfD4AI43GzgqbCs5TaCbZNisMK6nYtfMb4A2S4TGRTNWPFEm8w?=
 =?us-ascii?Q?phCvxXoBtkA6jQzSQq3g7wbIJ2kyPemk1PyJePEE7/DBEjZLPD4e7/ZsnR0h?=
 =?us-ascii?Q?soIBDb+QQt3dtINffG7ZNEFYsZScgFWTLSy7sUa06e02Y1CeZmLVnTPR4UVd?=
 =?us-ascii?Q?eMofuqtSnlNEDxLeURWeGSptlsAgFf9mTmwgVgWiYYqXzQwGovOdt0yG3Z2N?=
 =?us-ascii?Q?PVh7xixzrmR6caceCFkeKzwB0uYRT+lqvCw0hLuDCgcitK04brjpX6JvR5gk?=
 =?us-ascii?Q?gH+0LIo2K4eyysyUOXXfROhfYhz31WVB+04biB3uml1aRKx+rr63t4coHves?=
 =?us-ascii?Q?CP6vEvuelpt4wloYOwxugPPmRXO1OtL2eB/NktbxVTiHYGBe98/nEbVl99mX?=
 =?us-ascii?Q?hJpHF2o+Uxi2xamcPjcrImugwiUipQjaG2sq4qvUkUK7iTspmtNECJc++XkQ?=
 =?us-ascii?Q?EdRiGoggBGqs/dGHW0tc5DLZK5fjExtmUZG9C4hjrD/HzAXLICRUmJI1DN8j?=
 =?us-ascii?Q?jtFOgxV9GsywFXjU3N/PwdxLeEQ42IiXZkP8+zz4u2oBSVevMgio0VP1d+fF?=
 =?us-ascii?Q?AkxfdyWuFDsOEyEacRp+CeYEKh7C0l9rDAAClrxRRSs1SB0ne6NweC1/EZoy?=
 =?us-ascii?Q?5euB6+vA7bXlHfjj9Wcx1sb5Hb0SrQub3Me+p8LVOHY+7BECVfS4sbsOGjhv?=
 =?us-ascii?Q?zhiDmcmNkjNA4h+sSJMOuB88d4VxvZX1DbxUmv7JOyNCA34ZrwUWWOPeDV79?=
 =?us-ascii?Q?jZKBTMoqlCPWQRjJb7fgVjzuYfb1QUFu9O3NIF6FtjS7HytB6TvCeo7KhZfP?=
 =?us-ascii?Q?m2aEryH64ql4vQdCndQrcnNd++/VrUhtaXdFIDXsbdAHqbMXXQK3+Sw8NBFb?=
 =?us-ascii?Q?+JaaAAzbLeTdrdi+ne7p8GVFj1w2kBL6KCA9hhpH/WlhLZyVHNmTKEkGFQ+r?=
 =?us-ascii?Q?dPr231R9CjFxWfNUfUYT0USO2yvWFZP/v8YTdLqK4TN8NIdTWPCJLzNnaXS0?=
 =?us-ascii?Q?2iK4Mb8XnhVjZH9lVie0s1O+XvFe91uxbe22nXyy65qCZfDvyxLQPCLHGiCi?=
 =?us-ascii?Q?sMyp6Dh12GcKmI6y9nbEALl4R+i46JHqIf6Yyd+lP16LabkzdwUd+b5F6mgp?=
 =?us-ascii?Q?srPrRyg8G7yGnxlWl4ZOJ2T+qazsrc2FrpkXw91rjdhwY48R1FmdiyKII6L+?=
 =?us-ascii?Q?Y2b8YqQfV4v86Tk4rz+AUIf1J7iyxNOwNlM6OCbfTgsbFT4KsKuMSsoNN5k7?=
 =?us-ascii?Q?jY+FfIsKFfjlhpzbgHaJpBTLpZaDYwK1?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zSJ+E8aVD4muxC0IhC6xVADOFWs6dOJojcQU+pmQ9Px8OKm99VZM/Fcu2T6G?=
 =?us-ascii?Q?NKF/n3mNGeoZhut2tuXWJsnf0QwjnUAWheZZEIHksLGyI4VcXzw60PluqES4?=
 =?us-ascii?Q?0CIDIJnGv0mbthDt1Job3t0SjeWRJxwZI4nL0sr2uIh4jJLrWPb//N/0iakB?=
 =?us-ascii?Q?Y5XTv8QiLyaCKE0t8jbY0+s1P+WMZ7cHIVJ32U3CwUl3+c8+iw4s6cG/HTvE?=
 =?us-ascii?Q?Jd2qaBu+QYPuR1S/ZQ+RDdHEVhsKFyQ0UY4DhSDuwi0Hpel8YiHTkku7kb0e?=
 =?us-ascii?Q?/Xj8H++FxJQfJMg2xYduQvAVTzvBCARzLB45cMdvqJkFLvsx672gVsK/AW4s?=
 =?us-ascii?Q?rDem9XjHQWOgxtHa6+6YmQJTJgdQIELX6l93Liq9B0N5pQyrqPCttcptxlQm?=
 =?us-ascii?Q?sTZTynsmjYRrfHhT1nzN5BS+ZnZZoSBQlmed92u4LNs+vCI4E9v+rRCbjO9y?=
 =?us-ascii?Q?CU5CVTapWIJuAo32CTw5qWo8AAuIm60kh8mdIJcysHg87FUPnG//RKM75wM6?=
 =?us-ascii?Q?k2q9BYpZ+fKSJ7o24Sl15OwS6zwAgkkW1JdKap0+ga+iRzXj3xf210lcOBq1?=
 =?us-ascii?Q?4FzRl4DV/eDt5AsKK0eRet+TFn6IOjRG6FARgePFyfjfBqdNZUtnIZd515QC?=
 =?us-ascii?Q?ZfQx2pQbwC1Sh3xe0Hslt0eXhJdMU26omyFk0ymHuf8fyDvC44u/BlSyiX4L?=
 =?us-ascii?Q?8mIrPIqyRX60zmzkmgmH+iU5UGT1cTQMSorsLuHuDO6iRdpQsdNe9yEIuVZD?=
 =?us-ascii?Q?JXbapOeAMO+YiCZcVNZTYZSnQqmZ7H2bOusiqgP+thHHF+5KLrh40QSx81EI?=
 =?us-ascii?Q?qS7C9Aw4QvFZZCVI9+rNxSH0ABMl4pEe1mwnymNW4Vmq7yN7QW4ryjxrsxB0?=
 =?us-ascii?Q?x+AJvq3hjwM0G3hDW2xOcuROw4WptoawE6vKoZry5lslgzspNvX6Tk9IKHos?=
 =?us-ascii?Q?uFnTIlgksmoRezcB+FCzNUBm7vyrMM8B4ibFaFq9B7RkA6iQ3yYYUvISN/ab?=
 =?us-ascii?Q?G2S6VlwRcYD3Jbp4GansG18IFPMoNz+sbkmbIygKj0PWb4wJ2Iy6VNwqoFYY?=
 =?us-ascii?Q?3RwvBsXzsv7+ORXD8bBVLAAtgxMfTbhjmZZ156hRiOGe8wN0JC1NKRuT+kfW?=
 =?us-ascii?Q?C+dVQ0mehojFQM+z5zEXe2nbSC4tvdwFtdIssozQndhrHqWGqlvUhItZx2Hl?=
 =?us-ascii?Q?3f1QXLmthQulFMMTyAmRvNZnKJosflhwRSDBs7jJKwDI33i3ZHRq+jDfFQu/?=
 =?us-ascii?Q?eKSjJNAUXkZqopFDJmYYx7ZKU9FCPVoPoq4L1N9CXY4lRY8gnjNXyglqNf8C?=
 =?us-ascii?Q?LHRx8xw3QA/5fd4QtXfRD4y1Pum1S1MTsGBUa8akdI1dGBx/Zazmv1D9fCTY?=
 =?us-ascii?Q?7skYooFwnhhu6+Vk+KpyiqNEjCts9hgLI5+StlQ5LF8i7v/b3KS9qgTy5T42?=
 =?us-ascii?Q?WIf4qpmAuuRwpPzvO1bYJh3lGvVAGcEgZiDzE1bb9lHFIgi6W72ycPGCb+gG?=
 =?us-ascii?Q?Sj6DjUNdpH8svf+fWzev2g959AacTiK73RmCOeUF/dlmZ09o0fNtBuJmelFV?=
 =?us-ascii?Q?CfQdpfinZngrHji7O0U=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 650927a3-85c3-415c-2cc5-08dd4a0bacf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 19:46:56.2564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mFhAyo0H8UPLcUORpd1zUm3dYClcplZxIJnzjYbbgkV/2h0NDIFcdJTB9XnwUxOq8VZkylHNd02sFZfrC+Pi1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6283



> From: Srujana Challa <schalla@marvell.com>
> Sent: Wednesday, January 22, 2025 11:47 AM
>=20
> This commit introduces resource objects to enable the driver/device to cr=
eate
> IPsec Security Associations (SAs) for both inbound and outbound direction=
s.
>=20
> The IPsec SA objects include essential parameters required for packet
> outbound and inbound processing, such as SPI, tunnel headers, IPsec mode,
> IPsec options and cipher/authentication specific data.
>=20
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/crypto/description.tex | 145
> ++++++++++++++++++++++++++++
>  1 file changed, 145 insertions(+)
>=20
> diff --git a/device-types/crypto/description.tex b/device-
> types/crypto/description.tex
> index 2c00e50..0ba09df 100644
> --- a/device-types/crypto/description.tex
> +++ b/device-types/crypto/description.tex
> @@ -336,6 +336,20 @@ \subsection{Device and driver
> capabilities}\label{sec:Device Types / Crypto Devi  \hline  \end{tabularx=
}
>=20
> +\subsection{Device resource objects}\label{sec:Device Types / Crypto
> +Device / Device resource objects}
> +
> +The crypto device has the following resource objects.
> +
> +\begin{tabularx}{\textwidth}{ |l||l|X| } \hline type & Name &
> +Description \\ \hline \hline
> +0x0200 & \hyperref[par:Device Types / Crypto Device / Device Operation
> +/ IPsec Service Operation / Resource objects /
> +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-
> SA]{VIRTIO_CRYPTO_RESOURCE_OB
> +J_IPSEC_OUTBOUND_SA} & IPsec outbound SA resource object \\ \hline
> +0x0201 & \hyperref[par:Device Types / Crypto Device / Device Operation
> +/ IPsec Service Operation / Resource objects /
> +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-
> SA]{VIRTIO_CRYPTO_RESOURCE_OBJ
> +_IPSEC_INBOUND_SA} & IPsec inbound SA resource object \\ \hline
> +\end{tabularx}
> +
>  \subsection{Device Operation}\label{sec:Device Types / Crypto Device /
> Device Operation}
>=20
>  The operation of a virtio crypto device is driven by requests placed on =
the
> virtqueues.
> @@ -2028,3 +2042,134 @@ \subsubsection{IPSEC Service
> Operation}\label{sec:Device Types / Crypto Device /  \hline  \end{tabular=
x}
> \end{table}
> +
> +\paragraph{Resource objects}
> +\label{par:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Resource objects}
> +
> +\subparagraph{VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA}\lab
> el{par:D
> +evice Types / Crypto Device / Device Operation / IPsec Service
> +Operation / Resource objects /
> +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA}
> +
> +A driver can have outbound SAs between 0 and \field{outb_sa_limit}, as
> +specified by the capability VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP. For the
> +IPsec outbound SA resource object \field{resource_obj_specific_data} is
> +in the format \field{struct virtio_crypto_resource_obj_ipsec_sa}.
> +
> +\begin{lstlisting}
> +struct in_addr {
> +        le32 s_addr;
> +};
> +
> +struct in6_addr {
> +        union {
> +                u8  S6_u8[16];
> +                le32 S6_u32[4];
> +                le64 S6_u64[2];
> +        } S6_un;
> +};
> +
Any reason for union? Can we just have s6_u8?=20
(s6 in small).

> +struct virtio_crypto_ipsec_tunnel_param {
> +        /* Tunnel type: IPv4 or IPv6 */
> +        u8 type;
> +        u8 reserved[3];
> +        union {
> +                /* IPv4 tunnel header parameters */
> +                struct {
> +                        /* IPv4 source address */
> +                        struct in_addr src_ip;
> +                        /* IPv4 destination address */
> +                        struct in_addr dst_ip;
> +                        /* IPv4 Differentiated Services Code Point */
> +                        u8 dscp;
> +                        /* IPv4 Don't Fragment bit */
> +                        u8 df;
> +                        /* IPv4 Time To Live */
> +                        u8 ttl;
Please add padding bytes to align to 32-bit.
> +                } ipv4;
> +                /* IPv6 tunnel header parameters */
> +                struct {
> +                        /* IPv6 source address */
> +                        struct in6_addr src_addr;
> +                        /* IPv6 destination address */
> +                        struct in6_addr dst_addr;
> +                        /* IPv6 flow label */
> +                        le32 flabel;
> +                        /* IPv6 hop limit */
> +                        u8 hlimit;
> +                        /* IPv6 Differentiated Services Code Point */
> +                        u8 dscp;
This one too. Please check in both the series, vnet ipsec and this one.

> +                } ipv6;
> +        };
> +};
> +
> +struct virtio_crypto_resource_obj_ipsec_sa {
> +        le32 spi;
> +        le32 salt;
> +        le64 options;
> +        struct virtio_crypto_ipsec_tunnel_param param;
> +        le64 esn;
> +        le16 udp_sport;
> +        le16 udp_dport;
> +        le32 replay_win_sz;
> +        le64 cipher_algo;
> +        struct {
> +            le16 length;
> +            u8 data[];
> +        } cipher_key;
> +        le64 auth_algo;
> +        struct {
> +            le16 length;
> +            u8 data[];
> +        } auth_key;
Two dynamic arrays in one is problematic.
And below fields can never be referenced without learning the length of aut=
h_key and cipher_key.
Below are critical fields to access the whole rest of the object.
So please move them at start.

Also can we have above two dynamic array as constant size array, instead of=
 dynamic?

> +        le32 obj_id;
> +        u8 mode;
> +        u8 direction;
> +}
> +\end{lstlisting}
> +
> +\field{spi} is the Security Parameter Index(SPI) used to uniquely identi=
fy the
> IPsec SA.
> +\field{salt} is the 32 bit salt value used in the cryptographic operatio=
ns.
> +
> +\field{options} specifies the Options for configuring the IPsec SA, see
> +\ref{table:Device Types / Crypto Device / Device Operation / IPsec Servi=
ce
> Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP /
> IPsec Options}.
> +
> +\field{param} specifies the parameters for IPsec tunnel mode.
> +\field{esn} is the starting sequence number.
> +\field{udp_sport} is the source port for UDP encapsulation.
> +\field{udp_dport} is the destination port for UDP encapsulation.
> +\field{replay_win_sz} is the anti-replay window size to enable sequence
> +replay attack handling, replay checking is disabled if the window size i=
s 0.
> +
> +\field{cipher_algo} is the cipher algorithm identifier see
> +\ref{sec:Device Types / Crypto Device / Supported crypto services  /
> +CIPHER services} \field{cipher_key} specifies the cipher key and its len=
gth.
> +\field{auth_algo} is the Authentication algorithm identifier
> +\field{auth_key} specifies the authentication key data and its length.
> +\field{obj_id} specifies the object id of the SA that can be used to
> +retrieve driver-defined data associated with the IPsec SA.
> +
> +\field{mode} specifies the mode of the IPsec SA, see \ref{table:Device
> +Types / Crypto Device / Device Operation / IPsec Service Operation / Dev=
ice
> and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Modes}.
> +
> +\field{direction} specifies IPsec SA direction.
> +
> +\begin{table}[H]
> +\caption{IPsec Direction}
> +\label{table:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA / IPsec Direction}
> +\begin{tabularx}{\textwidth}{ |l|X|X| } \hline Type & Name &
> +Description \\ \hline \hline
> +0x0 & - & Reserved \\
> +\hline
> +0x1 & VIRTIO_CRYPTO_IPSEC_DIR_OUTBOUND & IPsec direction outbound
> \\
> +\hline
> +0x2 & VIRTIO_CRYPTO_IPSEC_DIR_INBOUND & IPsec direction inbound \\
> +\hline \end{tabularx} \end{table}
> +
> +\subparagraph{VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA}\label
> {par:De
> +vice Types / Crypto Device / Device Operation / IPsec Service Operation
> +/ Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-SA}
> +
> +A driver can have inbound SAs between 0 and \field{inb_sa_limit}, as
> +specified by the capability VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP. For the
> +IPsec inbound SA resource object \field{resource_obj_specific_data} is
> +in the format \field{struct virtio_crypto_resource_obj_ipsec_sa}.
> --
> 2.25.1

