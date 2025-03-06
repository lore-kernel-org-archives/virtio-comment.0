Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2AD19ADB0
	for <virtio-comment@lists.linux.dev>; Thu,  6 Mar 2025 03:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741232722; cv=fail; b=h9KXaJupkpI1WYUQvF6ZLZ5ZdG74tDq/VDV5kLv+rPlZUz0wr+EN+LCani5SD+QAfpb6jJiOVaExPpCplUuSnFNW5lKG63zNI5LC6IUv/6T1vedBqJnK/ay1AltJwpnmE6COM1RhW6s338oIS4xVQcsiopj5abqAb0DzGe6Bs1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741232722; c=relaxed/simple;
	bh=ojpZq2R3ztFVS4tqujU3wgj8HqJ84pxdq8SnU7Tvfdo=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VIcdWqub9S7Xk5Hna15DdIhNWDGEMH6fnLBJBOjpU7o99+SPiLzvgQj5DNn70bgqAJKJxUuCpXF9FVJk5qBU9sAaXE1g4WQ2fchu4hxBWggzb9rcmfzdwkG6deeQyVsylZVse7SOhDfqEWQ5LkIY6i1tvtDzLF3jrsHcLJNtosY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JGSxKsD/; arc=fail smtp.client-ip=40.107.237.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JGSxKsD/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIUymLPZm5l/MDY9MKgQ4CXD4i2Xfw1GCXYsQchUaVz0c0LzMjxyo7/VmTZ3+sK+q8uvXz+dK+vkxgws1H9oxKruZ48QELCHzu308IHBQoFrsB+47FfTHWqg3/8KKk4nlJGKJ0C9BY3PRnRc4JDRYMMtntw+LQ+571w8pUJSR2Ljk9G8oWf33W9mX3kvL4hicdgZhm1+k/JvHZf+HGzNyu35wgr+eQU0Ja32dVSs5g4gLI1iwEBZ8dVWG7XWk2Zt/6WrQN3eIELOtziNyEFHju/kuUq1lRDyvgeoxCTZyT4KL7PrpJ2/lJ6lGBowox0yVvubBEqRvp774KR8bquQCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIlG7bYKFCt0z/PJnQ3RyDaB2quNl14KyCowz7sKHug=;
 b=i+NuoqLl8NIlB1IK7EBzVF3A9RA8KGdKjiPylJzaHCshzDsOWp7ntUBOJS6tfU96MxxgDOEptqY4hKNc/MmDqvzHpGwkLHIYzaf+5CVoJIiUlbiOOamCeCza9VPyyLLEYjPlOd7ggvk7U47CcRpfxyhkhbzTQHjmPVbDTEg1+gIBAbcK4kFJ+RKklsEDFAsW20ciK9oERRua9VXAFloMHGpI5Ikc+Q2uCGioO0Vlzwh3EJmRaisRCGpo1nmZca5uJIy5Rp4K/Te9hsUPle18jWob0oM4g5dMM1NYoWN+OXUgCE1jzUNUrppsTCBwUbQFgeA+c0OIVOodFRmJeCS40w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIlG7bYKFCt0z/PJnQ3RyDaB2quNl14KyCowz7sKHug=;
 b=JGSxKsD/4mw20aF7wc7NlCTzkVFrg+vH7HWMUoCTb7o48H7Qbv/r3vVYsmuzVbMB2aONTNXoxq+VbqlZaJK+mqviFg7ZQpBJWGT19DNfxDpO9hbXlwn+sh65mK3zCVVFqil6O2vvcT5NHrQIvUB3i5s6U4tJQTunUAhv88hIsurqRhR6ahSLDnBWg/Vuyy1UshtX9WslA1MI1Z35h2s8BCfvv4FgB/p7YvIRrzajgPBkL2kd9b5Wn1rq9VaIGBUNVuJF5WwMy4TH/6S6No4r7wTcpOqDyGxgO1bSdoR4jgQilzX9LoL/ZiOXAP98+Sg+3hesCpYVcZPk8xgxWm/liQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by MW4PR12MB7466.namprd12.prod.outlook.com (2603:10b6:303:212::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 03:45:14 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8511.015; Thu, 6 Mar 2025
 03:45:14 +0000
From: Parav Pandit <parav@nvidia.com>
To: "chia-yu.chang@nokia-bell-labs.com" <chia-yu.chang@nokia-bell-labs.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"ij@kernel.org" <ij@kernel.org>, "ncardwell@google.com"
	<ncardwell@google.com>, "koen.de_schepper@nokia-bell-labs.com"
	<koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
	<g.white@cablelabs.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v4 2/2] virtio-net: define Accurate ECN feature in
 virtio-spec
Thread-Topic: [PATCH v4 2/2] virtio-net: define Accurate ECN feature in
 virtio-spec
Thread-Index: AQHbjh8KNAN1CUXrxEukps2r2Fwi47Nldxjw
Date: Thu, 6 Mar 2025 03:45:14 +0000
Message-ID:
 <CY8PR12MB71956D6324E6C43FE9072065DCCA2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250305223544.85812-1-chia-yu.chang@nokia-bell-labs.com>
 <20250305223544.85812-3-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250305223544.85812-3-chia-yu.chang@nokia-bell-labs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|MW4PR12MB7466:EE_
x-ms-office365-filtering-correlation-id: 0a5418c9-c3cb-47eb-4282-08dd5c614dc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|38070700018|7053199007|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?1oWd0i4cmOcvKYlXeYnH6llM8usMk6NZG/gouTm54mOD47004G8XCkbrBmCy?=
 =?us-ascii?Q?p7Xas63S9Q1OvtfmUPZQmazd9RkiBlQnX1sRJW0+TveOZBHIMmdNrBryiTYV?=
 =?us-ascii?Q?OFM/+tZDMrAalLS62ALxU9ogN1+7NhW8gXdpBgumiOWOkmzSycpVKS+WLw9G?=
 =?us-ascii?Q?u4fI2OyBhlDfClueReSiH1yE16xL7Xwa+VD/tY6PazkE5vJ0pFlaPj5G99gy?=
 =?us-ascii?Q?3Q2LBq3RRmBxLtOtEHn8RXRAJh9xBQa5GIOm/2FA41Ls1B+L8V2P/J+bS4yW?=
 =?us-ascii?Q?CLSRG+nd/+eHnu4XJZ7YbG1Acp1x06cVlF+X2u6D47dYBp7ivLj1CsqfhQBE?=
 =?us-ascii?Q?7inJJpUo0gcD4qG9AuVx6SDTfu0A9OaLFJ9LSbQ3Awo1XIRw6oaFQYNfmK8k?=
 =?us-ascii?Q?Cg8DpKF5f/2eV23x2y4A8rnXn0unVDkfVDoLDqdRDOBs3mgTUxlih0nkjVd9?=
 =?us-ascii?Q?1xJpHJg9KYn8/H8fkqYy6tnYVWYZeFxxGU8S6mL3rgRYYqAs7D4pmm4XA8vA?=
 =?us-ascii?Q?XvzuvU2njey/p5RJ3tnwzQZi/borOzxX5wQuLSUWZDfV3EO4XPbu7vbtSY0h?=
 =?us-ascii?Q?KOcACV6APLm2xKsU0sELr/9qy072JlFAakQqM3qDwUEHxey4O+2AyUx8T2DR?=
 =?us-ascii?Q?G/DYScYLGcY5vL8NyyoS7lTZoT7r5r6eg7dzIt2NGYC9hrgkjA1mellOm8lB?=
 =?us-ascii?Q?q6NSgGxHDRFoI4+OHbTjwdMpDX8aPOYMEGKfgZ8xrL0ThqP8ONeaiNE9vsi0?=
 =?us-ascii?Q?lcI3JTNK2nsikxtlbl1U/1PGHTuq6tIDbLTQ+N/ZiohHdBFZ+ch+SL3HloSA?=
 =?us-ascii?Q?oHRfPuul5xKtOgmroQZzFjPJFix+9A/QX+prGOWumbSR7XKaxLSerx6IGPWk?=
 =?us-ascii?Q?q0Us1cIjeGg/2QytA6ggwOZU2RwPvyOb05OWE79cQEe43WlDNPHBvqCB3CN8?=
 =?us-ascii?Q?Ts5gTvj6DnoW+899ybuAZWfZiBBDk7FUtor+j+smanyfGCcvXOnBdtYCpQuO?=
 =?us-ascii?Q?gi3x1bwCf0pRdtW8D2+1fOgSK0ELCLGQLnlEXoEX+fiofu/h3NkIUEgcnb/Y?=
 =?us-ascii?Q?vYUh0szCNtUAg6Z2nWKKs8LojiG1AXAB8WxWtjloEvuuMGK2Nw5PPUCpM6zx?=
 =?us-ascii?Q?+f0A1toZSKNd73OGTm9BDDu2YV/4qdrvuRxPE5S+H3PUlb9eN0L9GoYJSAIg?=
 =?us-ascii?Q?q5PMVnos+VTlMInAhBZ9J10TB1dSjJLTl3QHHAISqtiHTMIbd7HnsSPLqJdx?=
 =?us-ascii?Q?iBKLgp/qBJcPvSrXEtvMcm/Vupyg+nzSUVe5llHMGPmtDtLW4a+v/NcUzl+9?=
 =?us-ascii?Q?D0T54h/OxrYZl6CPJ+gNq7zZg9+eOEJ69CVZDQGYwTTgHorBowb45LQfHgh3?=
 =?us-ascii?Q?UoCVjsBF3KS8VhWVzsL+st2zg3WgsYi2+M5E3NP2BcWtgTgxPxRrZubQ/4o3?=
 =?us-ascii?Q?LjNIIDjOTT3OawsRyACdPmS8YYdlGsSIGC70eMrWElwlk6QYPu/61w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(38070700018)(7053199007)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?K8KQxjRsAAMjWgU/nGcIJj469U8m5nMNvZ4MiXcg/xpCOid119sC2mXZ3V1z?=
 =?us-ascii?Q?kaDeOJQn7NoEJMCxLPw/jSXwMaJfrhXU+MTaBxQL6QAUTKLoXfCNIv3PFj8h?=
 =?us-ascii?Q?MMXN1raCJMEJM+oEbGMmPzMbyRUBnCJhql43rQVoiVQ1NWX2uOb1hcCXXEMv?=
 =?us-ascii?Q?7zNIKuIb0+AQJBYelrE5qoH78S1X+yqb/1TitnCz/78fGuMjX7ARWUjbAJYO?=
 =?us-ascii?Q?MLVQ+OGiHmklOuYDffvfd/7ehVVUJlPuUV0r+2FWAFGwwwYeCIzcZOhdGoYd?=
 =?us-ascii?Q?4P7P/UGvikPavHDP2A3Wdg+gn83A0otu7Gg2j6jHOozyBiN/vy2XVzL/5oju?=
 =?us-ascii?Q?l7GPpxFOMv02BYjZ4+DXmXBoE3sAogBJND+x4eLcCHPlD3xUXhW7Z8+gUbwl?=
 =?us-ascii?Q?yP+2xCAC9GcGYpSodBXNIjX0NxZSnRizz39KLw07qLQrQtrdHe0igmlz6lFt?=
 =?us-ascii?Q?jOv6q73U0PhQZBVyDN152ZzIc4jqTCnEySD29E7V/6UgCQnZhz8aEjt4geDz?=
 =?us-ascii?Q?SkFtQk/DgznawW8FLWjCr5nQpce2nuBPErooD/7ACVjN8GOeIX1zjP3h1/YP?=
 =?us-ascii?Q?zdlU0rwfi/9AgLQNM1M+8vBG6Kn8uLX0KxpjkkMG1i/YugO8Li7vHeT07DMf?=
 =?us-ascii?Q?UHA5HdjGdUuhECxVeSRgJ+V3hPoAw9E/DmJyzXdN4GYBdmLA2P3wx2nsDaHR?=
 =?us-ascii?Q?tvQwAuiBrzpSPen2S0UvQ05TNPwrWpLc//qkha04CWPs86LAuquWy++512Gv?=
 =?us-ascii?Q?5AYMVtYZEYapn2ICqIJE/5SRQ9MtxeNkQsFq0Jv/VGs4o4qgn9j5K+KFg4Ho?=
 =?us-ascii?Q?f0g2kbK8ws04GVEZLlzzB23LUwNOSvAmnqrSzylzsrOeCeAcfitf7oxvWS0g?=
 =?us-ascii?Q?V0Xv0WgAVSC4JnoaBtN8IJFuO5RoLIeEqcQH+kU1l/C3PvcvvBAiWBbiVJrU?=
 =?us-ascii?Q?wtQmYldo7NGozByUnuSK4dsFRcE8gtvX3NV5/RnpH6MbgbezRYpTAsYOifzD?=
 =?us-ascii?Q?wAUSkRMAQxZVsiHXazkZ4Dkuf5nHifM3hqkoReLpOxuKhWKW8w37Wub1fbqR?=
 =?us-ascii?Q?WYIkVUDz22sAM5nN2EoJfM30GTkgqmsnpeVvewNvotCNc7hLaDideKVoyYQy?=
 =?us-ascii?Q?VR94Z9Vv5dslAOmXa1XXpB//q/AIRbt+N0N4nIGeOEVr8scxbxNsKyNcjNpq?=
 =?us-ascii?Q?ZuViYwvZY7aUtQcB3Q/rbSszeGIQClyKfqEEkevbD8lnw8dA80ij7VBM6/eN?=
 =?us-ascii?Q?M664NxYS5UPwwWVVXsFPoDD5+jdble59WmmhjNfu6epFdo9xNPI+Sry0WlLK?=
 =?us-ascii?Q?BBHotu83vpsKiCU+kNFY+YBAhTg/3Xq1tKu2+sB5goy0MLYjeFXwdi09nUjg?=
 =?us-ascii?Q?kAwttyiSwbcepkYnvit8ehWwJPC72Gy/W6sB3NrkTLIUxnO1wZbInEoJ1pFI?=
 =?us-ascii?Q?ksk41Nq/UElkigpcONei2IvXfAPADSDqu/HbAA27MggP1aNMtKSpROaBY+Eo?=
 =?us-ascii?Q?QQo6DHvrONA4YV7CcR1rf9oYg6VY4osnWV/m7o8tKNoYx3bix9ryEmG4gUxH?=
 =?us-ascii?Q?exju0dGiuKxBrysxzZrHCnnVlk6OMn2lCjKp1YwikS7IPzTD1zRCrnEE6/6F?=
 =?us-ascii?Q?ucGJqh2RvhnIPvq1dIKaQ6E=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5418c9-c3cb-47eb-4282-08dd5c614dc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 03:45:14.2436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5pCNxves/737mXcQNGvi68NzdSLCXcQpWuOmTLsm+EYzQ6Vrq1uce0c3AX4F6H+kypa5ElwqRiXdahIvobGqXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7466


> From: chia-yu.chang@nokia-bell-labs.com <chia-yu.chang@nokia-bell-
> labs.com>
> Sent: Thursday, March 6, 2025 4:06 AM
>=20
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>=20
> This change implements Accurate ECN based on AccECN specifications:
>=20
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Ftools=
.
> ietf.org%2Fid%2Fdraft-ietf-tcpm-accurate-ecn-
> 28.txt&data=3D05%7C02%7Cparav%40nvidia.com%7Cbaf8817982ca4d633c870
> 8dd5c362798%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C6387
> 68109909203851%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRyd
> WUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D
> %3D%7C0%7C%7C%7C&sdata=3DbgUrPTzqtRQqDdYGXIeytzsmGIb98%2FttuKfG
> dx6wGS8%3D&reserved=3D0
>=20
> Unlike RFC 3168 ECN, Accurate ECN uses the CWR flag as part of the ACE fi=
eld
> to count new packets with CE mark; however, RFC 3168 ECN-aware TSO will
> clean CWR flag from the 2nd segment of an aggregated segment.
> Therefore, fallback shall be applied by setting NETIF_F_GSO_ACCECN to
> ensure that the CWR flag should not be changed within a aggregated segmen=
t
> (e.g., super-skb in Linux).
>=20
> To apply it in virtio-spec, new feature bits for host and guest are added=
 for
> feature negotiation between driver and device. And the translation of
> Accurate ECN GSO flag between virtio_net_hdr and skb header for
> NETIF_F_GSO_ACCECN is also added to avoid CWR flag corruption due to
> RFC3168 ECN TSO.
>=20
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> ---
>  device-types/net/description.tex | 49 +++++++++++++++++++++++++-------
>  introduction.tex                 |  3 ++
>  2 files changed, 41 insertions(+), 11 deletions(-)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index 50b1372..a21437d 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -92,6 +92,14 @@ \subsection{Feature bits}\label{sec:Device Types /
> Network Device / Feature bits  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)]
> Set MAC address through control
>      channel.
>=20
> +\item[VIRTIO_NET_F_HOST_ACCECN (25)] Device can receive TSO with TCP
> CWR flag set
> +    and follow the ACE bits handling approach mentioend in
> +    \hyperref[intro:accecn]{[AccECN]}.
> +
> +\item[VIRTIO_NET_F_GUEST_ACCECN (26)] Driver can receive TSO with TCP
> CWR flag set
> +    and follow the ACE bits handling approach mentioend in
> +    \hyperref[intro:accecn]{[AccECN]}.
> +
I will take a closer look to the details early next week.
In the meantime, please fix above feature bits.
Proposed feature bits above are in generic range.
For net it needs to use the bits in range, 50 to 127.
So, pick next higher available bit mostly starting 69.
Refer to the section "Feature bits".
