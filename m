Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B2A171D2
	for <virtio-comment@lists.linux.dev>; Mon,  6 Jan 2025 05:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736141845; cv=fail; b=kKU74Ytc1ib6+yFLyt+u4AAvo7r7eQ8CrlHNi4LW0pkb3ZEAtHuJPUVrs4lWxa2g0Y5WyATXCUN1PY6c9pwubtCyv+PqiMSMprvTCPgJRPMSTkRHJQdYlwX/ioo6s0CxVONVQQxFrwTsGgedrE0qv+D06TN5m5SgI+/5XNgdy+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736141845; c=relaxed/simple;
	bh=NSkkgfppkcZvN/+n0BevOvS4Cuymbq4ozl8AYdpr3a0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AE7OOo0GzI9It8OgSUJkMqQOBwcbi7xsz/43ThcsEe5ScTNmFMlE65USwn3z2Ng/BH3sjbgJNT+DclBkKKO+0CKzjjjggNVy6CECBspfXMck6xooGvjw0FVHYHhl26QtUC9REheUW8wDjGtgxa0FIAWWJheOhKnN3rI5AdouhzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EbbrX/eS; arc=fail smtp.client-ip=40.107.243.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EbbrX/eS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqMFocOVpRdO9DulVGZ+a85r9GOAbmK5WJZ0l6SX38I5HrU+LYr/UhSZVDY1WGvUaln1Zgb67hL2cm+doPXECULEvp8KLZr6GJki1RQJjwAKNvgbRtO5PbjOCmf8VC6JNA5fvAUbbXKTM0PTvDgQ6FvbPF9KnoMrBcEnFWV1JhhmhAEagBYPlcmschuwUmy7InvUb6phKB7u+5pzEkEOJgZMkUlXJao8QofoTXSFRCxHnfU1Dkoi8BEYpF4eWYjN5S52XjbyfUz8z5dbUYWHwO1MH/l+LG/+hXxq9zgNpDTvc0+avPEKwhc9A9Wyh/kHEOEwV+VodUASbSzHnBW7hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzBjrCyd0Jd2uLifBCPiSj0mYfagB6i0gKSp/u/N+iE=;
 b=l987tFm20qXfNrobB/0tt/+Xo2Ft8d+Qjd3Vzt9hjR28Y7u2G+6cGeHW2QlsPuAjQ+3TJy+i1h1WODmlOO+qKq50NjFhdlzU3DeAg2sk/dC0RqZgVXctKWmfmNNAFCwrs4kAa6gDIqHBitbcFgw8f2gp+80d2/aMYJ/l74BbSiWY7LgveBxCuN/N5pzuFmD0I4y7+V/8zxMaDmaJ+T3OjnXbXjk6pT8tcWHE+oxsStidEyA3SNJcpxTPFipDaOyB8AHivRBuz4aZC4dUomhMn6UNS/cWkJ7czBTLiBwANosyQ5Xc8/k38stHp1Cyjd7T6K6vbbOlaeR5zFqigJGcAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzBjrCyd0Jd2uLifBCPiSj0mYfagB6i0gKSp/u/N+iE=;
 b=EbbrX/eSMgLzjApFNz3KaQrtsqyC3qeJXj7sH1x0oFSQqCzEND+TWhcgYUt0foks56D6SSeuoixBdPmRoMvvzcT3Kck6m9R1L1+HpSOfze7orIfTLtgPGJth+s8lcV6meCquJM6ok81hfZTvHHuby97dgm6j9GIJsG7sYXED6Ju8LvbShz1ktCt9cRbz/0TtPD0n2wl4/x7/lSxIKc2jHZRTFwIriBPOiyjlhj9aSuSAjIPNjIVuK0Y4Jnmd0qAIZIP6sKFx8xkW+QwPpzu5UmWakdtD6DSN6a4ougcGvCmxa/fnaqDo1SqpiGFodRVJNmWochYQzLY7cbHokzYmww==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS7PR12MB6262.namprd12.prod.outlook.com (2603:10b6:8:96::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.16; Mon, 6 Jan 2025 05:37:16 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 05:37:16 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>
Subject: RE: [PATCH RFC 4/4] virtio-net: Add IPsec operation device and driver
 requirements
Thread-Topic: [PATCH RFC 4/4] virtio-net: Add IPsec operation device and
 driver requirements
Thread-Index: AQHbT6gu/5E7MXDJ90GF+js2wdJ5uLMJWMBg
Date: Mon, 6 Jan 2025 05:37:16 +0000
Message-ID:
 <CY8PR12MB71958EED46A3BE41BE3B41BBDC102@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20241216104859.2720719-1-schalla@marvell.com>
 <20241216104859.2720719-5-schalla@marvell.com>
In-Reply-To: <20241216104859.2720719-5-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS7PR12MB6262:EE_
x-ms-office365-filtering-correlation-id: b1ff281c-222c-4489-e9db-08dd2e142e57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hCEIdAWbkX2V4KT28d+MS+PpC9/b9TsFjYZItgJ0kaIUj5p8il6WZh4oeVEr?=
 =?us-ascii?Q?x0z7dJucZaKo8b2CeDwB4Cqse05llALakg0pav6h0iE+soZNDLODKeuhkysN?=
 =?us-ascii?Q?WgqBoi3josfv96GcgUFdYAkPg+2OAnBytyK3Vt17c1T58BlTn7ie6joNLZdz?=
 =?us-ascii?Q?fU74jVbGyZZ727+RRREuXC7UutSc5+/+T4Wr8Y5exOHw8O5sXKc4K887Y/mL?=
 =?us-ascii?Q?2M9LdSn1INElUV6kM6nvcerltZ6RDpHiq3guV4LxlaGnRanxHIf1vTmnbScB?=
 =?us-ascii?Q?58wv6tj/6ifje7hpXrmBPVRfVYutsmqJjCv5bI3p4zEZc9b97RcGA64ZPPaC?=
 =?us-ascii?Q?ncVDSIIhMUZTPe7u/lOu6DHjEaoEaG27s8a7y5NhobtTQtg0FEwQcQnZUu83?=
 =?us-ascii?Q?5CV2sMPqK/cceFQH8wvUShznIqTz5pjlpvybSo1+PlhTsn2uf3bu5vl5NxGI?=
 =?us-ascii?Q?dbqATg32YdvLyI1lYwkMubb98wJfLK38B+HCIduAOE+aqJH+wPYLhExAFgC1?=
 =?us-ascii?Q?VabfhXC0NXJCII70UMnuLfuYELaoSnXVvRTaTLBvJ/Q+h0eS9TfpIkndoBiP?=
 =?us-ascii?Q?piwxL52p7asnOnv7UfhYeDNdQWveeif4xT0YKaR4zFafMjQPuYd1wm+ecZya?=
 =?us-ascii?Q?1De3JfXcsnVp8tncgGmDU1rCjYH4oSuc+c6pNc2mgAaaQr1cImHHtiOT1/bS?=
 =?us-ascii?Q?u0t+/SZiPrOPGtaCpI4NTqO+Z119DJiHXt7B8DOCYHvbnGbnpgLtHwiHtotA?=
 =?us-ascii?Q?Ocr3p1yNwu79Upx6BVf4QCyqYW1vSg8x5mGrOkiY+/ilefrq1tTjoXRbEQFp?=
 =?us-ascii?Q?ODJrpOqr1NNXXn9dlrnY/r0qR4B1rqIqiiFYgn+SKH5KcO0pobDRHxHP52N+?=
 =?us-ascii?Q?Isv0rM6eauyJBWZpTgDZr8wLM7e0eqtcQ2bKeT5PltjmC22KufswJDkUGiJr?=
 =?us-ascii?Q?t6h1BcxOIX4VB75nJV/N/+iJjSWJdOTdl/RztlG+vzy91jTmr6OZ3Bfaxk2u?=
 =?us-ascii?Q?Vww+gBYqEGirG4pRUEO2HrDMT2cYy1FF7UXDwa6NWK50xZs/QpMmsyHHSb5a?=
 =?us-ascii?Q?F9aUORmExT226m0AezObp2bshvSzcKEvf0mbPNT0RRsaWKcTKoRD4wCw3Vzz?=
 =?us-ascii?Q?izEC3NXiB7+28cur8QJseLIbYkSl00D/ZEIy2PjM4JkdiQwKff4GhMA+++5r?=
 =?us-ascii?Q?e9TOqFZzDCMnEzYnOr/OgwV2cB9FOFPqFOHXTnHz3iL1ml+VSL/szG32mIUm?=
 =?us-ascii?Q?yzaDjEG5P5ewpItgi8ZpSvf/aRrGLbdATx7i7NAFe3fA8wtlf0LklShM8mbx?=
 =?us-ascii?Q?HesidKBtN8PPmNinGEASdZj2g5WaE91f3z5B9DFOiNYLnZTm/mNUxB5N3jcQ?=
 =?us-ascii?Q?o7HLCXsGDBjJ/CRpSPa1fsSXByayALrWHI1guSoyqsbpj/CG0Eb94QJ69RiG?=
 =?us-ascii?Q?9QZKBHIwWTrAnmQcMGKyXmHChJk+mjsy?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cggrD9vVQlKFsm6kwDowvmqYyhA3iGPIsHm7Qd3olYZHWFeHlJfcRIJVynko?=
 =?us-ascii?Q?RnPvVIEcJ6hlqMryi3XpRyy8A5DaYga9aI+ZZeIGhhdpP4sFjAPTIoUzcMZf?=
 =?us-ascii?Q?IjSgKOJjI8UcJdlBCG7Moh2Q0Wbe3+V3+7w3zp2VzOy+PfZbnQT6MmXvsOaj?=
 =?us-ascii?Q?XQJxQnk7uy4kmL7qiIIqmgje1CLxhGCYDm/lgTCip1UUu5xl2CWeVYvyUkJI?=
 =?us-ascii?Q?peJ7TpfxKdRlekUcjt/lGo6x00syOMHXYFXMlh2uXmw9gztFgX1dMVUNTR9I?=
 =?us-ascii?Q?9GJYtBoHa51nd0q34nu9dSaO+2xvdkDRIT+gyoRacZnGEVmHfcnrpWXZTsIS?=
 =?us-ascii?Q?Da/SMNedqRhm1aSALwrltIjAkU3UyOds4lPXLyOFRE4uoquckBmPAU8VxPdR?=
 =?us-ascii?Q?+P8JT9lit0XfwruFjbxRj/yyhcFGr7jwgssdxa8jjkTM7jA5cEatqQEed4TE?=
 =?us-ascii?Q?H/lz2R4akTiJ3HbHLIU/8wfUGBoP1fZST0A9fa0oUsZA19s7oyfnIDTRSWGC?=
 =?us-ascii?Q?KbUsKgFUhb7OMhqozi4Msd2ZVbffWd0dA9dESjofCZzBR2wCfyAg/kQAUT4q?=
 =?us-ascii?Q?n9hNjbaGwfZNzBjJLvqiCb5BDVwnYjDVKuZSIMyNSH71WwcVzpdSHlWr2stI?=
 =?us-ascii?Q?bfz76cOcrpYl/NyDfXvuta/WztCW9Ims3W3M5Wd3DReMElRPzq2BgxchHeBh?=
 =?us-ascii?Q?2ILJW80uvlwZj/XcX2iunMjg9xUc1LJgqpsSh97euGB912VphXev8U4aRoCI?=
 =?us-ascii?Q?OuKqfIfNXjLZi6pL+LfRMDBsFegPZm6K5oi3wxCicWszhSIBLKpWtEn15E92?=
 =?us-ascii?Q?lF81mxE3789yzLToX9S+duMY3sxB6DymykOoHaOal70hWQRFyub6HosYEHaO?=
 =?us-ascii?Q?sSFPPjh2cfdiM0wkX5QuB+J5VwKkBc2YNS7zPpJGqzKrZFqQMVeKG5pXfUy7?=
 =?us-ascii?Q?nttdCvDyjaDe/yyxtZOpMddeGhhwSulecvBSkN0CQkyECnCo7xKApZLJ2TgJ?=
 =?us-ascii?Q?iFKBI6e9rNZur8Ntj337emRcTcNXTIFJHGSxG3DIaHGg6S9lDXo2dvNMXdbf?=
 =?us-ascii?Q?34+NxtOT6glieg7/6Qn107dOBIJgG+LFqsSoxzl6ZabNX5vOnuQIIJRxSmb0?=
 =?us-ascii?Q?yOTBpLq3eB09N4QU6J4vAXbaDZ+oq8+qHoOb5jGAO3v/xxn7TYR2d00rWOL9?=
 =?us-ascii?Q?MC5RUXmPuQl8XVKcGSDPgbBsrfEv2YGwGhSnMgqK7thBhYoIiXov75dGt7iC?=
 =?us-ascii?Q?0TX7eOJZlUunJkUm25aREEZ3HV+p5S6S1MmMsd+VMl+ZXleR05hsM+PjYWmC?=
 =?us-ascii?Q?vRG5GRCwVeGHyfy4hMCQgYb5YVV4/zX1soi0Qgu69vOMWEDqCbn/VsSVFIhZ?=
 =?us-ascii?Q?Lrl630k0vvxiaXtrBTKTbi5z+g0iRhVFPIEa+WcsCLWDDzKvw7NKA5pGtVEh?=
 =?us-ascii?Q?u2iRuBrFNB4vXd+hgOoCq+hLaMTidp1UDK8i5Bc7R3mBncTNOUA019j4sFqb?=
 =?us-ascii?Q?AUGAe+E0U6UYLwqMNlrRI/ll/+qGfOaxol7//nf+5+Y/ZTWWafotlL7w2UwJ?=
 =?us-ascii?Q?FLhhMYh0mSbwn0XluGCVhN0uO8jVir27Hg7Ntbhdwp9Iga7839LIh2UK5xgA?=
 =?us-ascii?Q?aPAVyL/UQjqNE4mCwf4GYMM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ff281c-222c-4489-e9db-08dd2e142e57
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 05:37:16.7497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 54nhw85FyTywaghLNILAQzYtqqPQvCyNkU1alVZZ64yz3El5rGa3tF1NAjcZAYg6sWIQ8lXCZaaOb5pN0BYiEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6262


> -----Original Message-----
> From: Srujana Challa <schalla@marvell.com>
> Sent: Monday, December 16, 2024 4:19 PM
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
> index 5ebb28a..a686c69 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -3116,6 +3116,89 @@ \subsubsection{IPsec Operation}\label{sec:Device
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
> +and VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY.
> +
Extend above normative - for the object types X_SA ..

> +The device MUST set \field{status} to VIRTIO_ADMIN_STATUS_EEXIT for the
> +command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE when the
> resource
> +\field{type} is VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA or
> +VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA,
> +if the object already exists with the supplied \field{id}.
> +
> +The device MUST set \field{status} to VIRTIO_ADMIN_STATUS_EBUSY for
> the
> +command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY when the
> resource
> +\field{type} is VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA or
> +VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA,
> +if the object is in use.
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
> +for the VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA object if,
> \begin{itemize}
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
> +On device reset, the device MUST destroy all the resource objects which
> have been created.
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
> +VIRTIO_NET_IPSEC_SA_CAP using VIRTIO_ADMIN_CMD_DEVICE_CAP_SET
> to
> +indicate the device which capability the driver uses.
> +
> +For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE, when
> creating a
> +resource VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA, the driver MUST
> set all
> +the parameters in \field struct virtio_crypto_resource_obj_ipsec_sa with
> relevant values.
\field {struct ..}.
Please check other places in the series.

> +And when create a resource object
> VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA,
> +the driver MUST set all the parameters except \field struct
> +virtio_crypto_ipsec_tunnel_param.

\field {struct ..} .
> +
> +The driver SHOULD NOT add multiple inbound SA objects with the same
> \field{spi}.
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
>  \item \ref{drivernormative:Device Types / Network Device / Device
> Operation / Control Virtqueue / Device Statistics}  \item
> \ref{drivernormative:Device Types / Network Device / Device Operation /
> Control Virtqueue / RSS Context}  \item \ref{drivernormative:Device Types=
 /
> Network Device / Device Operation / Flow filter}
> +\item \ref{drivernormative:Device Types / Network Device / Device
> +Operation / IPsec Operation}
>  \end{itemize}
> --
> 2.25.1

