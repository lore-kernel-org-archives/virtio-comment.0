Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB403232
	for <virtio-comment@lists.linux.dev>; Sun, 12 Jan 2025 12:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736685133; cv=fail; b=SduRH8XJfQpu1Xux4kIR1QiGx3uKNiuK1z4mWLSd0ixQ+gs7yaflgZLxvHjQDjzRM3gfZDcDSkguJ6NgcYpHXsD5PxIebENaH2sLjTfhUIQjCbE91/ft5LBfne0qCLcvFdo+NH1YE1hAuYBDddPUlnrIq2Z5W4jTyXpSzfSroc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736685133; c=relaxed/simple;
	bh=AyBhqK0h1JJgIEhIoAHzJPMDQzftCHtvrZx508hmycg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tpzm1rUrWqovuBLtCKVvdLB0qOSPgWg32M1c7U8ltobcnf2PKigkE7sryLHYec/J/TQASQ2QpFA+wp85IqqyG6+XyhnYvKasUCBvqCb+HYc2FvLQ3DPQ4zBPpNTuvVdcWg6igZA+no5VtN3LRwG86tSMj+EHptsSDgI6gAPU3V4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MfFoJEsF; arc=fail smtp.client-ip=40.107.220.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MfFoJEsF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nx/MvSYafkdlzdukQWt1xoGSOEjMdtKTFKhR64rNSW6wCV2mKMIKsCmPE2ipCCety7hohW/sdVDfNQnl1Sqi2VtlFA8k9p3CN1daShts6NrIm6C+6ZCJng8FJxkI+Q3wQg4cNaBo3nNT88PXAdTnF6YGNCltryU96bjTXYz0v9b+Ov6Av81/maIZEzWV8SgO4meNmX8SkikVvKbF5DQlGnJFWNXMjxZK2lAWlFMb0BVfdgwqB7Nbf/HG9ho9ruop1JEdmWsSp52Q7Backg7kkmvLX/EgBTIsbkB3xsl0TGEtvKrsFbgg51d7OI0n0WKgY1jM3nzotaX67MgQTXI96Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X17lolcorcIocYY8gIVjlMMeMtEse1ChRDfymfDKAJY=;
 b=ucXfa74DM/gsk5/KX3wYXIKOmXh+oG2KmJJw2OjtcrphZAzP9+7SXfQGmYYBlUL8HkTy6bboGvbzEy8UUZaHgLNDx8zIgmB+qR6o1CwJXiIOk4kxFsXMsow7hJllLkFda1a8yxKDsiRiDmOk9I155V9WCOO+GGaxhV9YwMTtZmldQ6yh4ijZLFpXaU6Z6GVZuC9Cbsb7suGndZGUX9JUH8gFFmE2qVO6tsQp1feqOUQL6VVRsK6ijR5eLp9MGmVjuySg4J4hBc9MchGft+KVcd7OR56pbe9pU12ej57MnLQqnVShouxKyG6iwelq775SV1n81w6cLy0XILvkcV34VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X17lolcorcIocYY8gIVjlMMeMtEse1ChRDfymfDKAJY=;
 b=MfFoJEsFIUJDOEnuwPtwCNfWaMNzKqtopf2smZ8/d6hCnUi4/mWJioZ352A9RgBqsxKXGxHNskwWyJS5uHfZss4/6JZKXOvhDJoXaWBEpMu6MI55sglSBvmBxAX5VHbK7m2TIuHcH0G+UXbLSanwN6AIdo98NWrPQwDUmjt9CwDaFyDXIBp+xuxYI5oOMkwTDrNX3y2dSZgN/0TVAy18qmvIuK84Hruo1uiCwi1a7Gde91ql5GN3UKfGCpMf+SpvfqN2QKV5Fvfy50XPe2/oc/q1tVNG6EKT33zQLNiyimJ5OssUq3YGNaVyrHiEES24IJ6uaAy8tdpc2eyWYOgmXQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by PH7PR12MB6636.namprd12.prod.outlook.com (2603:10b6:510:212::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Sun, 12 Jan
 2025 12:32:05 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8335.015; Sun, 12 Jan 2025
 12:32:05 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "mvaralar@redhat.com" <mvaralar@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>,
	"anoobj@marvell.com" <anoobj@marvell.com>
Subject: RE: [PATCH RFC v2 1/4] virtio-crypto: Add IPsec service operation and
 Capabilities
Thread-Topic: [PATCH RFC v2 1/4] virtio-crypto: Add IPsec service operation
 and Capabilities
Thread-Index: AQHbT6RAXHQM2WZ2cUmSk3H0vre9lrMTL34w
Date: Sun, 12 Jan 2025 12:32:05 +0000
Message-ID:
 <CY8PR12MB7195938C4C9DE77848CED41BDC1E2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20241216102102.2720453-1-schalla@marvell.com>
 <20241216102102.2720453-2-schalla@marvell.com>
In-Reply-To: <20241216102102.2720453-2-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|PH7PR12MB6636:EE_
x-ms-office365-filtering-correlation-id: cabf8831-01df-4533-b58e-08dd33051f71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?c0KFm3QeLZ9eHijq1VGNrTfTUTN3ai8IPPAxT5A/usVPKM2qFEEag+ux6UGb?=
 =?us-ascii?Q?FdvBsaEu21nqmAQGCbSlSGmLXGVRNCHD96Mp3CxSvZq/PflD1+hB6JiCUdRW?=
 =?us-ascii?Q?xPRfu/44V0D6c7/cnIg3pOfYOWOPUfQxh8UPKTqgCWEHP1/5x6GlmZ0xxeC6?=
 =?us-ascii?Q?f62Y1beWDiwYDo3bxV1106Z3DFI6crivIKMVwJTkJvPK9FcGAylx1+ubgZUE?=
 =?us-ascii?Q?PzmHsJ+2eGVdhFI9ibQX2rJD51kgXGMJXgoDNO97QCqjtBa6eIe6BLR7tzbN?=
 =?us-ascii?Q?f72LpcrGTPMxDmyC/ff2WKK/aEg/uzmMzSXAxScm4+VmFScEy/4PFtTt7zzx?=
 =?us-ascii?Q?b9E6tednjuXYHvzBILafORrcGhx/3i2ZQZfkh7MCxZ1dqU3ZYkZRI/Jq2EDb?=
 =?us-ascii?Q?zR/h/JxogoIJPgHa5sm5Yw2ikX65TrjtoV4Tze8r9sYczFUiyJz/LPKtKPpj?=
 =?us-ascii?Q?dnkpLBcYDZ7OxjOT+768z2gShpAGR8YTtc1cVTftL4JS70RYKNTBzzhBSwQg?=
 =?us-ascii?Q?DH11mODblNMTlQXEWIgtMcWSP+LMdO9QTiEPFHpcoe7eZMjzsxT5yJx9Tj1v?=
 =?us-ascii?Q?WEtDVfvEZvx/sZT2EgneO5sLWKyAbAvnHTkoZNQSSSfWHYQBtATTvJqqzWYa?=
 =?us-ascii?Q?BNafZzr+/8MKQQVEp93OW+c2aiQPnrbFeeAvUMUnePmGZ7s7wrjaHzeExtPO?=
 =?us-ascii?Q?NxwoVxBCacriv9aPm2DRE/rUQizK1ROkrO4/9bZ9kb79w0F2tWZjRFuCoYPc?=
 =?us-ascii?Q?tOs+njyYJKsTs3WaGiCQ0ggLo948N4NnRYIoJZsnU518NLpUjTpv+9RprupV?=
 =?us-ascii?Q?hR4ngnzpzsoxgM5e+5xsRodhIilS/yuhLV9VdtjFUQQPpjQp6OBHvvoCRzWE?=
 =?us-ascii?Q?n7vzhv1eoDf7iYDRRIaRwnK+r0wgCh9zPtB0cSD2pA/n0qFV3xaMFQhNpal/?=
 =?us-ascii?Q?124K+5yws6s5FcrfJrJJGa6dNIaV/bPGgoJNkP/4u7B22csMyd0/u42mhonH?=
 =?us-ascii?Q?kFkqRfFFYVVysY8gBuhvkjJb6PNICUcERlBan1EUM6hi+2vp1hgXbXAWpOnN?=
 =?us-ascii?Q?+G4t6CF1/RBEGZItAsz2iXUh1mtA2JHhokRN//4PYvkzQS47X5rzfeymWDdt?=
 =?us-ascii?Q?AWV7hDbYRWw6cRzTuGSHfQg+0TGvVJ2tkZ93JwKXrF/dNKe9KZ6PNZtyXnAT?=
 =?us-ascii?Q?wJbNL5FabnGdXTlzNoLCEXlcWjyZm52bBta6j6paEQBFgYbRgPo5Aq30gHQu?=
 =?us-ascii?Q?Hly3BIJBZ9q5YPbeqADC0Dk0etKdQbUwZsHc+nCDBm/nJm5IylgSiu4ILn7x?=
 =?us-ascii?Q?cKE9u3+Aa0c3h7g4bsqqhudum15LXNkKwCFxJc6KmIQtad2ij2BfGzcMqrh5?=
 =?us-ascii?Q?ORCq3lcV3dbXF9hYKjwm1jXETfVkaz0IFg+xL4xEq21IJmoGRVi/lWbGU9yc?=
 =?us-ascii?Q?D9yJ+PO7ZtfKrpYyjt0+rEtHiC+VxcC9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1HBKGcuYnXhjifBxWi4dPvCTESCmNBuVeJmIlBRD5k8G51wChDczMcDBbRqm?=
 =?us-ascii?Q?Pc59Vgssgtm+MRrUVVevs+1QCclCyPdnDDCLNK09FSxZc6uXcnwuEFn4REQ+?=
 =?us-ascii?Q?iEDIIvF9Ze4MST2UgO45noHnIOuOMv/CSskJBV+KXFlRKgoidzoLJ2VUX6Ze?=
 =?us-ascii?Q?IC0gZgs1Kng3Aki5sEIxuGDoyW+QrT4SsdPGK+mdjjoM/m3jRdEjWKi4wtw9?=
 =?us-ascii?Q?OZfbTl+33upyW/AjFzLO2rA6gcn7se24PwEUZtwTpsAVrbS8nS4mZ4IYol9u?=
 =?us-ascii?Q?StRRkcYpsg9HjQiPEicJqiNmDja6cownB+rLiEjrWK4EapWYFFfsXlr65dCb?=
 =?us-ascii?Q?B11i3xlrgjXUFlOqByQ45VBF33qyv8WfnyJn6x4vv1p5Vq1VOxC/Pq/Px+VT?=
 =?us-ascii?Q?QxsD3YOjL83+cbSKBdmBHtqD0B0cbrtOq6UKd4EHxp+4Ays/1vZMpFCk+KtM?=
 =?us-ascii?Q?IQwQXIiG1rq0UsqiOEWz2B6cIQULZV7ulZGo6aacu7p899vhZKGFccg5t2DT?=
 =?us-ascii?Q?BvtnG4QFd5xl3HonX3zcO5ifd51hmTXCgy5HTPRrfwdps0kR3qmISwHpwSP+?=
 =?us-ascii?Q?TUO4xnoaEUb4qTvifBPpGlYnLOc9eLaCMfntxJH2w4MA+irzSdgeb8Gq6UJB?=
 =?us-ascii?Q?td0vPId/Qkp8Zh3Nt12bZYocazbKHrWM4RHgHbjwDmjZ7qST0FSpE+KeZXbi?=
 =?us-ascii?Q?/edTFezr6TURuDMl3/g/Y9uOCqau07dnTO0b0K64Svm2nzqL0PtELP2v/VSI?=
 =?us-ascii?Q?HFHFiZTia71SbaY+90cS9hqFxr5bXIQW0dxr72qj09FSLqZAet9WLGgEm67f?=
 =?us-ascii?Q?H/VU2mXgKtjmWN/BIApAeloqW9FNkLNFHog5GjMIUMpnXQPmWYCuKXA5fFk7?=
 =?us-ascii?Q?hGrwxEVLq/S6UjrexwIBNmphUO9A7DEJPrQLCDrQG6/SPSOfln6Yb6H93xbF?=
 =?us-ascii?Q?12LXDjszyHaYG5VkLRVV6WrxjoOQ43NqismW2c6ZVFjGkhcjz3G9ypN+wGTG?=
 =?us-ascii?Q?URdcHGpJSIsoG09J3qySlQYcxESRCWPyowGUIW5CIA7DidA4r//hyK9kIwFF?=
 =?us-ascii?Q?eaYYP96nndToyjgSQMRFznA4fWVmz0V9AFPQQXsFWH/XeQ/c2xjWfqyMa+gy?=
 =?us-ascii?Q?oWm/39uFGgvDY2FLffjTQ4PsPhYJ+sUVYlw1Z5pgXuNVi93lTUGF4hiF2P/K?=
 =?us-ascii?Q?OqpX/cqnLYsoo43b/jnoUpw3gFlj5cQ46avw7ZPl3QOw0NH3KCy8+v+OGcXC?=
 =?us-ascii?Q?KgF9e8Ur39X1EF0+lvvDUdgp3aIv0EmUPTnYiLghLNbWmdTPE/L8x8ur7epn?=
 =?us-ascii?Q?Ola+8SstWRGytCh/hwvhTcXGlYSUSz+srBLhDua6WRMElPF37PfPKwyycmNB?=
 =?us-ascii?Q?tz+t7CBmU+D4AwR5RA3+paJR7N4zQuBpFUJwEmODAkpSlFIVu4ylItBftLcx?=
 =?us-ascii?Q?+DRh+RR9llJ+6Nbsg8c82SRIBT7VXFmo3/NthliQ+daJikZYSj6o8aTapoK/?=
 =?us-ascii?Q?fBekPQB5OT2DSWhUmgvyFeJmXbYLNMpsw0LwOTf9NH2vWgYzBfXATas6DZ+D?=
 =?us-ascii?Q?uChBrszY/PpUbKmQAp87jlCH2P7JrWg5zSWdScGHYqj1eBTotbsO0Cr7rVhw?=
 =?us-ascii?Q?prhAKI3ytJBvi6HNH6fCQtM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cabf8831-01df-4533-b58e-08dd33051f71
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2025 12:32:05.1591
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JpWR28Jy43mjSW/4JTlmfqWjoQXAYwGtSGPzUvRsVXfdXAVHOA4CqltCnDILc66aomDINpcqiRaass9QR18MNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6636



> From: Srujana Challa <schalla@marvell.com>
> Sent: Monday, December 16, 2024 3:51 PM
>=20
> This commit introduces the IPsec service operation to the Crypto device,
> enabling offloading of IPsec processing.
>=20
> Capabilities:
>=20
> 1. IPsec Resource Capability (VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP):
>    Indicates the device's IPsec resource limits, such as the number of
>    outbound and inbound Security Associations (SAs).
> 2. IPsec SA Capability (VIRTIO_CRYPTO_IPSEC_SA_CAP): Specifies the
>    supported IPsec modes, along with the supported cryptographic
>    algorithms, authentication algorithms, IPsec options and
>    anti-replay window size.
>=20
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/crypto/description.tex | 160 +++++++++++++++++++++++++++-
>  1 file changed, 155 insertions(+), 5 deletions(-)
>=20
> diff --git a/device-types/crypto/description.tex b/device-
> types/crypto/description.tex
> index 5705e26..df863da 100644
> --- a/device-types/crypto/description.tex
> +++ b/device-types/crypto/description.tex
> @@ -2,11 +2,11 @@ \section{Crypto Device}\label{sec:Device Types / Crypto
> Device}
>=20
>  The virtio crypto device is a virtual cryptography device as well as a  =
virtual
> cryptographic accelerator. The virtio crypto device provides the -followi=
ng
> crypto services: CIPHER, MAC, HASH, AEAD and AKCIPHER. Virtio crypto -
> devices have a single control queue and at least one data queue. Crypto -
> operation requests are placed into a data queue, and serviced by the -dev=
ice.
> Some crypto operation requests are only valid in the context of a -sessio=
n.
> The role of the control queue is facilitating control operation
> +following crypto services: CIPHER, MAC, HASH, AEAD, AKCIPHER and IPSEC.
> +Virtio crypto devices have a single control queue and at least one data
> +queue. Crypto operation requests are placed into a data queue, and
> +serviced by the device. Some crypto operation requests are only valid
> +in the context of a session. The role of the control queue is
> +facilitating control operation
>  requests. Sessions management is realized with control operation  reques=
ts.
>
Please mention that, the crypto device may have administration command inte=
rface through which IPsec service capabilities and resources are configured=
.
=20
> @@ -72,6 +72,8 @@ \subsection{Supported crypto
> services}\label{sec:Device Types / Crypto Device /
>  #define VIRTIO_CRYPTO_SERVICE_AEAD   3
>  /* AKCIPHER (Asymmetric Key Cipher) service */  #define
> VIRTIO_CRYPTO_SERVICE_AKCIPHER 4
> +/* IPSEC service */
> +#define VIRTIO_CRYPTO_SERVICE_IPSEC  5
>  \end{lstlisting}
>=20
>  The above constants designate bits used to indicate the which of crypto
> services are @@ -318,6 +320,20 @@ \subsection{Device
> Initialization}\label{sec:Device Types / Crypto Device / Devi  \item The =
driver
> MUST read the supported algorithms based on \field{crypto_services} field=
.
>  \end{itemize*}
>=20
> +\subsection{Device and driver capabilities}\label{sec:Device Types /
> +Crypto Device / Device and driver capabilities}
> +
> +The crypto device has the following capabilities.
> +
> +\begin{tabularx}{\textwidth}{ |l||l|X| } \hline Identifier & Name &
> +Description \\ \hline \hline
> +0x0800 & \hyperref[par:Device Types / Crypto Device / Device Operation
> +/ IPsec Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-RESOURCE-
> CAP]{VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP} &
> +IPsec resource capability \\ \hline
> +0x0801 & \hyperref[par:Device Types / Crypto Device / Device Operation
> +/ IPsec Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-SA-CAP]{VIRTIO_CRYPTO_IPSEC_SA_CAP} & IPsec
> +Security Association(SA) capability \\ \hline \end{tabularx}
> +
>  \subsection{Device Operation}\label{sec:Device Types / Crypto Device /
> Device Operation}
>=20
>  The operation of a virtio crypto device is driven by requests placed on =
the
> virtqueues.
> @@ -1872,3 +1888,137 @@ \subsubsection{AKCIPHER Service
> Operation}\label{sec:Device Types / Crypto Devic  \item VIRTIO_CRYPTO_ERR
> if any failure not mentioned above occurs.
>  \end{itemize*}
>  \end{itemize*}
> +
> +\subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto
> +Device / Device Operation / IPSEC Service Operation}
> +
> +A crypto device can support the programming of IPsec Security
> Associations(SAs).
Instead of programming, can we say processing of IPsec protocol processing/=
operations?

> +In addition to standard crypto processing, the IPsec protocol
> +processing is also offloaded to the Crypto Device as lookaside operation=
.
> +
Lets avoid the term offloading in spec context.

> +IPsec Inbound processing: The device will perform decryption,
> +authentication, integrity checking and remove additional headers,
> +including tunnel headers if in tunnel mode, as well as the ESP/AH
> +header from the packet. The resulting packet contains only the plain dat=
a.
> +
> +IPsec Outbound processing: The device will perform encryption, attach
> +ICV, update/add IP headers, add ESP/AH headers/trailers.
> +
Also lets avoid inbound and outbound context.
Let crypto just describe a set of operation. And give an example, such,
Decryption. ... and then say,
For example and IPsec encrypted packet processing can use these operations.

Also header or headers?

> +A crypto device can support number of IPsec SAs, allowing it to manage
> +multiple secure connections simultaneously.
> +
Lets add reference to IPSec SAs.

> +The device and the driver indicate IPsec SA resource limits using the
> +VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP capability specifying the limits on
> +the number of IPsec outbound and inbound SA resource objects.
If possible, lets try to avoid inbound and outbound context. As long as we =
can say attach it to a specific resource type, possibly its ok.

> +The VIRTIO_CRYPTO_IPSEC_SA_CAP capability  specifies which IPsec
> +protocol capabilities the device supports. The driver indicates the
> +IPsec parameters by setting the IPsec SA capability prior to adding any
> resource objects.
> +
> +The driver controls the IPsec SA resource objects using administration
> +commands described in \ref{sec:Basic Facilities of a Virtio Device / Dev=
ice
> groups / Group administration commands / Device resource objects}.
> +
> +\paragraph{Device and driver capabilities} \label{par:Device Types /
> +Crypto Device / Device Operation / IPsec Service Operation / Device and
> +driver capabilities}
> +
> +\subparagraph{VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP}
> +\label{par:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-RESOURCE-CAP}
> +
> +The VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP capability indicates the IPsec SA
> resource limits.
> +\field{cap_specific_data} is in the format \field{struct
> +virtio_crypto_ipsec_resource_cap}.
> +
> +\begin{lstlisting}
> +struct virtio_crypto_ipsec_resource_cap {
> +        le32 inb_sa_limit;
> +        le32 outb_sa_limit;
> +};
> +\end{lstlisting}
> +
> +\field{inb_sa_limit}, and \field{outb_sa_limit} denote the maximum
> +number of IPsec security Associations (SAs) that can be utilized for
> +IPsec inbound and outbound processing, respectively, which the device is
> capable of creating.
> +
> +\subparagraph{VIRTIO_CRYPTO_IPSEC_SA_CAP}
> +\label{par:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-SA-CAP}
> +
> +The VIRTIO_CRYPTO_IPSEC_SA_CAP capability lists the supported IPsec
> +modes along with the supported cryptographic, authentication algorithms
> +and anti-replay window size for each IPsec mode.
> +\field{cap_specific_data} is in the format \field{struct
> virtio_crypto_ipsec_sa_cap_data}.
> +
> +\begin{lstlisting}[label=3D{lst:Device Types / Crypto Device / Device
> +Operation / IPsec Service Operation / Device and driver capabilities /
> VIRTIO-CRYPTO-IPSEC-SA-CAP / virtio-crypto-ipsec-mode-cap}] struct
> virtio_crypto_ipsec_mode_cap {
> +        le32 replay_win_sz_max;
To be consistent with below auth and cipher convention and other in the spe=
c,

max_replay_win_size;

> +        le32 options;
> +        le64 cipher_algo;
> +        le64 hmac_algo;
> +        le32 aead_algo;
> +        le32 max_cipher_key_len;
> +        le32 max_auth_key_len;
> +        u8 mode;
> +        u8 padding[3];
> +};
> +
> +struct virtio_crypto_ipsec_sa_cap_data {
> +        u8 count;
> +        u8 reserved[7];
> +        struct virtio_crypto_ipsec_mode_cap mode[]; }; \end{lstlisting}
> +
> +\field{count} indicates number of valid entries in the \field{mode} arra=
y.
> +\field{mode[]} is an array of supported IPsec modes. Within each array
> entry:
> +
> +\field{mode} specifies the IPsec mode, as defined in table
> +\ref{table:Device Types / Crypto Device / Device Operation / IPsec Servi=
ce
> Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP /
> IPsec Modes}.
> +\field{replay_win_sz_max} specifies the maximum anti-replay window size
> the device supports.
> +
If this applies to only inbound, lets add it.

> +\field{options} Each bit indicates the IPsec protocol options supported
> +by the device, as defined in table \ref{table:Device Types / Crypto Devi=
ce /
> Device Operation / IPsec Service Operation / Device and driver capabiliti=
es /
> VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Options}.
> +
> +\field{cipher_algo} CIPHER algorithms mask, see \ref{sec:Device Types /
> Crypto Device / Supported crypto services  / CIPHER services}.
> +
> +\field{hmac_algo} HMAC algorithms mask, see \ref{sec:Device Types /
> Crypto Device / Supported crypto services  / MAC services}.
> +
> +\field{aead_algo} AEAD algorithms mask, see \ref{sec:Device Types / Cryp=
to
> Device / Supported crypto services  / AEAD services}.
> +
> +\field{max_cipher_key_len} is the maximum length of cipher key supported
> by the device.
> +
> +\field{max_auth_key_len} is the maximum length of authenticated key
> supported by the device.
> +
s/authenticated/authentication?
If this applies to the AH processing, lets write one line for it.

> +\begin{table}[H]
> +\caption{IPsec Modes}
> +\label{table:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Modes} \begin{tabularx}{\textwidth}{
> +|l|X|X| } \hline Type & Name & Description \\ \hline \hline
> +0x0 & - & Reserved \\
> +\hline
> +0x1 & VIRTIO_CRYPTO_IPSEC_MODE_ESP_TUNNEL & IPsec ESP protocol in
> +tunnel mode \\ \hline
> +0x2 & VIRTIO_CRYPTO_IPSEC_MODE_ESP_TRANSPORT & IPsec ESP protocol
> in
> +transport mode \\ \hline
> +0x3 & VIRTIO_CRYPTO_IPSEC_MODE_AH_TUNNEL & IPsec AH protocol in
> tunnel
> +mode \\ \hline
> +0x4 & VIRTIO_CRYPTO_IPSEC_MODE_AH_TRANSPORT & IPsec AH protocol
> in
> +transport mode \\ \hline \end{tabularx} \end{table}
> +
Yet to read full, but if not mentioned, lets add 1 or 2 lines that describe=
s tunnel and transport mode.

> +\begin{table}[H]
> +\caption{IPsec Options}
> +\label{table:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Options}
> +\begin{tabularx}{\textwidth}{ |l|X|X| } \hline Bit Number & Name &
> +Description \\ \hline \hline
> +0 & VIRTIO_CRYPTO_IPSEC_ESN & Specifies whether extended sequence
> +number is supported \\ \hline
> +1 & VIRTIO_CRYPTO_IPSEC_UDP_ENCAP & Specifies whether udp
> encapsulation
> +is supported \\ \hline
> +2 & VIRTIO_CRYPTO_IPSEC_COPY_DSCP & Specifies whether copy dscp is
> +supported \\ \hline
> +3 & VIRTIO_CRYPTO_IPSEC_DEC_TTL & Specifies whether decrementing the
> +time to live is supported \\ \hline \end{tabularx} \end{table}
> --
> 2.25.1
If above each entry has some IPsec RFC reference, its ok, if not, lets add =
more for example, copy dscp from where to where.


