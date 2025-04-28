Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C331D61B7
	for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 07:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745824093; cv=fail; b=L3rKhDbob8Sm0cxh5v8SnyvXxBlLOuPL1eCLzosnDys4Jx5BwxTOGSBIzn0iswImmYVlNW+lKztGKsF4zEwOVRo9IRGybDULU6qC89BEbCAsIsmN26zeZOuYq04/0seCa1FBK9ChZmaQgXqiNOYrf+Vy77n3J8EBG3UgSACQcps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745824093; c=relaxed/simple;
	bh=na0qUpjsmsqYYdVIHbQUSlbKIjcUKrns9TiQtw4l+N0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Yy9U5y0aGpTfu/HfAr0cFA0ZXhLl+3OmuOrXLRa/kJA7zSmp3Oj0euyERBsV+U2vOMw8zh3ZILNh26idWX5e/TzFm4QYEGkxF1aCXk9t5pVVWuNl/okf8CZA96/Jw+SO8T/KWvL1CMX/e2bdJVIsc7E4bBWYTBtycpAK0xsNx+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uWHjX5wL; arc=fail smtp.client-ip=40.107.237.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uWHjX5wL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJw1KO+rxbMe2CSazSLZ5VeOo9GwQ2X7zA1+oY1UfieHzR4R55WcdAI8YX42JM6ueQU4O1F3jTemv01zJbyJFpMNui62Z9OGKoZGf5UqtEkgkwx017KPBRxBzqft6r+VWb67htcy7EjEXIcE7PtuL6RQwWYkGef3Ykj+kM4lKhj5YvugR7snIW+aX2lB79mWmDzT+GdCYWn6OEXs3RZ0qta4z6cU5z2YPBfaRbtyLm+IV9J4DcVQe4vmIUXbweWAoCUrqQU6dZEyzvZHJoFo5tRvYS3bTeZacBWRHrJspNL6blFqR09mamdYdeZdJPX/kliFSWzqBaDgzY9n71CHiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hzy7/phBp1mM6jUjP8ZowS2nKhNu7vBsRNTUk6YEyEg=;
 b=jzPqTK+vDrbzC14/3CTdhyBOYPpjLrsOQI2gx4Y3XEbRJCmBLOkMl9tZfYZEV/tO168+jWS6cFU0i8qUOE5DnW0uoakDc3XS9Fec1s01SEauvt80+pIC4R072NF/P9IgRor11k5OgtTjb4/8WSLSbwROmuy2KSbNZsKAt7+JbtmZAiIXPsfacYccACKy4k3akYIxrwNbn5QR4WXGIAmIudbJ44no3z2RVwfTQNCBzLqBqxXu2qQ8p5+23II54GvOIb7Y1/pXxvXUCzZCBzwnJ8LUPQKyN/IqqQbG6gWt1s/fTasgwx04NW0uNp+RpqIX3nXMfkzZcjDzbuwC68LOAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hzy7/phBp1mM6jUjP8ZowS2nKhNu7vBsRNTUk6YEyEg=;
 b=uWHjX5wLn682yZpHtMJw29TlIhPO+THr5RW4hc2cAJqG8qrbt3dCOW+kU7Zw06wCnpBK9F9Djo0/TrHX48QOsD5gaSxN0/zkqXL9guGpihXvM9SiK7Wla9B//uFpQSmG1kWh+eK0c/xML2UuannlG1HIPQFZ6APdHZK91Jb/AQss04eUmlyKwaW5gdhquAmk6Dop4wepSfa+h2tczG5YalZj+IMqpH6/DYg+ZYE9TQFdT7SoFsQr8C/oWAvuHgJJ5kszHdTxnrcRMHFgRtmhNf5DLBZZvJnTg9tgJu+UWQFbRoqIfFOdSG67iGjAdQe7CTwrkjHzGeVOealA8Dxh4Q==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS7PR12MB8249.namprd12.prod.outlook.com (2603:10b6:8:ea::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Mon, 28 Apr
 2025 07:08:08 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%6]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 07:08:08 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>,
	"kshankar@marvell.com" <kshankar@marvell.com>
Subject: RE: [PATCH RFC v5 4/4] virtio-net: Add IPsec operation device and
 driver requirements
Thread-Topic: [PATCH RFC v5 4/4] virtio-net: Add IPsec operation device and
 driver requirements
Thread-Index: AQHbtP1pb2jr1p5dLUKCNy+AHPjhiLO4rOCA
Date: Mon, 28 Apr 2025 07:08:08 +0000
Message-ID:
 <CY8PR12MB71959919529D28EE34378D00DC812@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250424094332.1927688-1-schalla@marvell.com>
 <20250424094332.1927688-5-schalla@marvell.com>
In-Reply-To: <20250424094332.1927688-5-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS7PR12MB8249:EE_
x-ms-office365-filtering-correlation-id: 9718b604-e4a0-4913-5887-08dd86236dd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Xb0OPxM7qZpBR5VxiOuO5hQOBkCXB2sxOCTdYgQ9nzLAVPElgSqhoPKeU5pL?=
 =?us-ascii?Q?eA2kv6DczRWXQb4aux/MpqGykpF/3PoXaHfIvY47SxGBbS4ImmC36szVlDyf?=
 =?us-ascii?Q?Xnu0tk2E0/CxUTSdr4bN8tGlXQHokstVpF7YS6xTmozz/PN4cJXo35NMHVPj?=
 =?us-ascii?Q?sySnx4yjUncMpbzKmKN0F6En0FNRJ+6mZyGLTVHa/xdBNEL4UPkHxb9/hvA1?=
 =?us-ascii?Q?KUlTxmc+jzt2OrOmq/0OSCKPOyRRY0sK1xUHPwLc/kd4G8FMQmgn4+BvAaWt?=
 =?us-ascii?Q?eECBalPwWeywC9ww5Bl6DkQSdaml5yYlPigw+ypSKgbWNfh1ewf6rZVo/F99?=
 =?us-ascii?Q?Wppyy4x3r6Lp4P9VRESOUQzplCAxQZjOPPALrbpvkqPg7M2ZhMJPcKQQ6Rga?=
 =?us-ascii?Q?/Z4dXVhvhRYQmG1FUQihk1SnvcwGQLFFdmCqEEH1gIx8dhaEw5ws41FcbcYL?=
 =?us-ascii?Q?yXD0+6lKzcSJ+kDvr4NhRbjZzmVIEHQvdvs0PjlY2gX1p1zfPpAIZ8BBc0mG?=
 =?us-ascii?Q?p7qDhraMA+oVU7TqwioadUKFezeb4GxhF/GlHKezFBevVrvlISiVrtoqk9hC?=
 =?us-ascii?Q?AhhZRge+lh2M0vWkj+HFosKzPlMHi4G5upvwvYWnBLMwmUPYJbohV46PSs4m?=
 =?us-ascii?Q?bubgNjXrBpuI492vp2BYNT1GRt7FXxGzOH0XZWCNRMcmTUFZ38K0slopH6+M?=
 =?us-ascii?Q?F8rugZW8SxZWBaVGQPyA0mm87B5zhl93uBi8Fqp0fXSjYs+rQmtcnlyPLCxZ?=
 =?us-ascii?Q?MCDWc5zfoMZH19yK3Pdcj6JS0Ji/pmckdjEwAoZTN3pXPCPJ88KW9V3xhaYY?=
 =?us-ascii?Q?SLNYUu5QynVkO3IEQHoUCc6h/Zfdt/maXpntjwUUSmQpUCT4KNLT+ARtbbZ2?=
 =?us-ascii?Q?JfvNWgM7VEaWeO4CE6ZtnEd8DxyB/apMmBArTEm9IjR7GILSISRHJ681bV52?=
 =?us-ascii?Q?6v99jjML5ER3vrTTWVAEZl3chkHYWlVv24jDM8M2cmNmxn9wX2aeKCoYyDcJ?=
 =?us-ascii?Q?9Zqwm2k1QYMBLc2lwIMD6pH6kvazhoT10V9wzB2TKqvEdjs5+k7KTxgGYWwf?=
 =?us-ascii?Q?0vpOrOjxPIu64UL5LIE7bo6xmVW0k7RFa9IXVle4uEiuSwa+TxhP0IXMwYU8?=
 =?us-ascii?Q?nOjgDzfMH1DWSpqhRPnGLMOsNJTsYot323+a+Ina9lsbIfDp7nvX8HBu5de5?=
 =?us-ascii?Q?wfKzStFFsboxsELvTp2WH5KHcn2LW9cY3vvb8n2DtDk5VxbEpjL9B2thq952?=
 =?us-ascii?Q?t8ijf9XdIwYccTSV4vfQddqlh/c65glIx6RlgjmkdP7StUOSJ8KrLpn1vAuP?=
 =?us-ascii?Q?AmvS0DZbHPCCcWVpNMWpG1wztET93hoO4b18b38ZlNsqR2gDbwuOfFJ9+rl9?=
 =?us-ascii?Q?9huhValzvQ/S3wz//YAFjPijiR76tA4oF8PbcoKEjxezjoI9XEN5uPa0PIUo?=
 =?us-ascii?Q?r5uBOOqQkw2scvc5JzWm3M48xQOvNNA3nA5sKzRaJeiO9C2jKkbjain6jnN6?=
 =?us-ascii?Q?DE2NuZkdcySJa4g=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kT3loffPRHM/PVxWt7G6dg+wxfExgRQQgdY+3mvbqxhAXjQVkUs1mAUqiVmj?=
 =?us-ascii?Q?A540hhmCryBqxzjG/gscGh4ZPu0T0rZR7Khcoss3w0Ot7TIRta9k8E2V2pn/?=
 =?us-ascii?Q?bh7MCsLGSZ1wO4hWJQ6WtAtJ8Hxs8YS47P47X7ITnZP1XpwFq1ErMPxVzN81?=
 =?us-ascii?Q?o+nyM3wuFwiUDKHVljKZEhB7o5RmtWSSJq9PlwVeiny+KKkGH8FhQK7FJ9YH?=
 =?us-ascii?Q?zFGg+ezu1NKmiwAkRm1Dc52F/bXf/uTshQHEYVYscfEC4aJ5YNY+kd8LZgc/?=
 =?us-ascii?Q?OExyzlVUZkJqYBmgCIDUCswvljZa0tfoaxWIv/mFbAtixVWj0IsXBVfiU3CY?=
 =?us-ascii?Q?5eLohAVgQguOvinM5Bzypk8qRbh87FvKkpnoXdSAkQpjf70KM/t0BUy9aG0W?=
 =?us-ascii?Q?b7P7UV8tWirLOdBKPL/g8hCx9xG0Tl6Vdn1N9LkBao35pmgno/cqmkLaGBeT?=
 =?us-ascii?Q?1gGAYqRy4p/NajWxxdm4dOf6PzhcQ6yUwucfboqoCP+Yb9Uhs+vlgBs7HdSQ?=
 =?us-ascii?Q?M2sRbwfHRSlKf2PbkZix0Chignpdt2rgk7WDlG6U5IGQl6VImWQnxPsX7xg+?=
 =?us-ascii?Q?hkzY57MoVKZjw+5E0rBH9uOE0jvIalGh4d+n3D7yRaR3kBD6SW8y8IwACi8b?=
 =?us-ascii?Q?hLfU78gm9gc2qrGYNL6jX5i62BAWo/GtbKHHD27iLIWtb1tdWqcyBYUREtdS?=
 =?us-ascii?Q?Ya8MCbK3hV8kZLKWwrcTnS72dA+NZ9sySGxIL9mj69dkG3SNgCmrFuIqHTvJ?=
 =?us-ascii?Q?iAIu3KhhnCrn1sEMegByVG1tpaLQhraF3knBgUmoKkktsuEUQriduDnbXU8A?=
 =?us-ascii?Q?rV43FwxHOmrAnQu2DaNG5xmbd1dYg/w6+sPqwrkSUeiuWAcyLf6hssTYfiIq?=
 =?us-ascii?Q?Bb+GBOqBEgpltQPQn7aVv46XOjkYhWmL2QNKhU3BIrbi/Jfc8FluVRAILMgx?=
 =?us-ascii?Q?6uQTTHz4f0m9SHEVNWTogGb8na36lv4D4ye+3ylKtDIEkvUZ7sx0mB9wzpPc?=
 =?us-ascii?Q?JjbuzrjoGfjMAghGYS/lVnbocB68xDZloZYKoxNvKoD6HpWPPKfjrce4eBin?=
 =?us-ascii?Q?ZqwbZyv8VcxGdXLxht/+BnGKYWG9SsP5M7Zv97KlCOZTl2weLx3WS7mrsU1S?=
 =?us-ascii?Q?K6AjPfzCgPiHqbc4EYvCjXAD+/sqY/D/V2gJ83edAp40V5aEoTGiBnCG3Jnf?=
 =?us-ascii?Q?JFEWe5zjRIeC4nrjArH12EqjGDXBKsUNGrzBZ+Rr0cqTxJLN8jaj7hTWwVL3?=
 =?us-ascii?Q?6VcBw9kW6hTCEvqaILGsSFzd8NqDDTx3R7Fwk3irRAgWlKEi1g5NZVaGcReW?=
 =?us-ascii?Q?YVYBcmELYEimISbwligVtZcmzLNXmRXt431b92bCr1kj1lD0uoSJT29Mkz43?=
 =?us-ascii?Q?vqqNTZSRqUqIZPH1uBrPkbB1+laPi2Ym+r2E0i7ektVjEUbWNhM8MOdrcrxp?=
 =?us-ascii?Q?BXb5K3gzFGb6+erBVKQhPw9IeqxaPuDNzXSa9DT71i5ggglyAU+fbOdeWbMv?=
 =?us-ascii?Q?T52nOf3S79C7Oe7meqk+24KpG43PE6ZGqFFjatuOQbDfISOltqntpmyzUNjZ?=
 =?us-ascii?Q?SDWLX3JmWSQcag5g+Ls=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9718b604-e4a0-4913-5887-08dd86236dd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 07:08:08.0615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1JfFwoJ/tov3nWkEZ7LilTsMwIHmyckQe1ebptTH23/1nzDtesxUzUG74Fduh7ot+aQvPUtsBn8OTRFOUcnxrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8249


> From: Srujana Challa <schalla@marvell.com>
> Sent: Thursday, April 24, 2025 3:14 PM
>=20
> Add device and driver requirements for IPsec Operation.
>=20
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/net/description.tex        | 83 +++++++++++++++++++++++++
>  device-types/net/device-conformance.tex |  1 +  device-types/net/driver-
> conformance.tex |  1 +
>  3 files changed, 85 insertions(+)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index 8903e03..0674bd8 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -3597,6 +3597,89 @@ \subsubsection{IPsec Operation}\label{sec:Device
> Types / Network Device / Device
>=20
>  See \hyperref[par:Device Types / Crypto Device / Device Operation / IPse=
c
> Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-
> INBOUND-SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA}.
>=20
> +\devicenormative{\paragraph}{IPsec Operation}{Device Types / Net Device
> +/ Device Operation / IPsec Operation}
> +
> +When the device supports IPsec operations, \begin{itemize} \item the
> +device MUST set VIRTIO_NET_IPSEC_RESOURCE_CAP,
> VIRTIO_NET_IPSEC_SA_CAP
> +capability in the \field{supported_caps} in the command
> VIRTIO_ADMIN_CMD_CAP_SUPPORT_QUERY.
> +\item the device MUST support the administration commands
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE,
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY,
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY,
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY for the resource types
> +VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA and
> VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA.
> +\end{itemize}
> +
> +When any of the VIRTIO_NET_IPSEC_RESOURCE_CAP or
> +VIRTIO_NET_IPSEC_SA_CAP capability is disabled, the device MUST set
> +\field{status} to VIRTIO_ADMIN_STATUS_Q_INVALID_OPCODE for the
> commands
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE,
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY,
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY,
> +and VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY for the resource types
> +VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA and
> VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA.
> +
> +The device MUST set \field{status} to VIRTIO_ADMIN_STATUS_EEXIT for the
> +command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE when the
> resource
> +\field{type} is VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA or
> +VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA,
> +if the object already exists with the supplied \field{id}.
> +
> +The device MUST fail the command
> VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
> +for the VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA object if,
> +\begin{itemize} \item \field{id} is greater than or equal to
> +\field{outb_sa_limit}.
> +\item the supplied SA parameters, such as mode, options, cipher and
> authentication
> +      algorithms are not supported in the capabitlity
> VIRTIO_NET_IPSEC_SA_CAP.
> +\end{itemize}
> +
> +The device MUST fail the command
> VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
> +for the VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA object if, \begin{itemize}
> +\item \field{id} is greater than or equal to \field{inb_sa_limit}.
> +\item the supplied SA parameters, such as mode, options, cipher and
> authentication
> +      algorithms are not supported in the capabitlity
> VIRTIO_NET_IPSEC_SA_CAP.
> +\end{itemize}
> +
> +The device SHOULD maintain a table for subsequent lookups to
> +inbound/outbound data with the corresponding SA based on the supplied
> \field{id}.
> +
> +The device MUST allow recreating the resource objects using the command
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE which was previously
> destroyed
> +using the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY
> respectively
> +without undergoing a device reset.
> +
> +The device MAY fail the command
> VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
> +with the \field{status} set to VIRTIO_ADMIN_STATUS_EINVAL for the
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTB_SA or
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INB_SA
> +commands if the resource object with the same \field{spi} already exists=
.
> +
> +On device reset, the device MUST destroy all the resource objects which =
have
> been created.
> +
> +\drivernormative{\paragraph}{IPsec Operation}{Device Types / Net Device
> +/ Device Operation / IPsec Operation}
> +
> +The driver MUST query the capabilities using
> +VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY
> +to discover the capability types the device offers.
> +
> +The driver MUST get VIRTIO_NET_IPSEC_RESOURCE_CAP and
> +VIRTIO_NET_IPSEC_SA_CAP if listed in
> VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY
> +command result, using VIRTION_ADMIN_CMD_DEVICE_CAP_GET to
> discover the
> +capabilities the device is able to offer.
> +The driver MUST set VIRTIO_NET_IPSEC_RESOURCE_CAP and
> +VIRTIO_NET_IPSEC_SA_CAP using VIRTIO_ADMIN_CMD_DEVICE_CAP_SET to
> +indicate the device which capability the driver uses.
> +
> +For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE, when
> creating a
> +resource VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA, the driver MUST set
> all
> +the parameters in \field{struct virtio_crypto_resource_obj_ipsec_sa} wit=
h
> relevant values.
> +And when create a resource object
> VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA,
> +the driver MUST set all the parameters except \field{struct
> +virtio_crypto_ipsec_tunnel_param}.
> +
> +The driver SHOULD NOT add multiple inbound SA objects with the same
> \field{spi}.
> +
> +In the outbound data path, the driver MUST ensure that packets do not
> +exceed the PMTU prior to transmission to the device.
> +(Refer to \hyperref[intro:IPSEC]{[IPSEC]} for a detailed description of
> +PMTU)
> +
>  \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
> Types / Network Device / Legacy Interface: Framing Requirements}
>=20
> diff --git a/device-types/net/device-conformance.tex b/device-
> types/net/device-conformance.tex
> index d88484c..7fe8505 100644
> --- a/device-types/net/device-conformance.tex
> +++ b/device-types/net/device-conformance.tex
> @@ -18,4 +18,5 @@
>  \item \ref{devicenormative:Device Types / Network Device / Device
> Operation / Control Virtqueue / Device Statistics}  \item
> \ref{devicenormative:Device Types / Network Device / Device Operation /
> Control Virtqueue / RSS Context}  \item \ref{devicenormative:Device Types=
 /
> Network Device / Device Operation / Flow filter}
> +\item \ref{devicenormative:Device Types / Network Device / Device
> +Operation / IPsec Operation}
>  \end{itemize}
> diff --git a/device-types/net/driver-conformance.tex b/device-
> types/net/driver-conformance.tex
> index d346b88..0d20190 100644
> --- a/device-types/net/driver-conformance.tex
> +++ b/device-types/net/driver-conformance.tex
> @@ -18,4 +18,5 @@
>  \item \ref{drivernormative:Device Types / Network Device / Device Operat=
ion
> / Control Virtqueue / Device Statistics}  \item \ref{drivernormative:Devi=
ce
> Types / Network Device / Device Operation / Control Virtqueue / RSS Conte=
xt}
> \item \ref{drivernormative:Device Types / Network Device / Device Operati=
on
> / Flow filter}
> +\item \ref{drivernormative:Device Types / Network Device / Device
> +Operation / IPsec Operation}
>  \end{itemize}
> --
> 2.25.1
Reviewed-by: Parav Pandit <parav@nvidia.com>
