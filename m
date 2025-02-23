Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7105C12E7F
	for <virtio-comment@lists.linux.dev>; Sun, 23 Feb 2025 05:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740288070; cv=fail; b=YTyMtr9QA7VovjRgRc3akkKhYIFe3YtKLOjPgp99eUpiC8TwOwxZVX+WKLnHOfT+SN0PxyBKCtELT8dk0RR0tCTWwgzITajrw7XXAKLIVqvsx8uSzpdAMt8YucDNco04d4RBW8fxqMetsTzojm1xW6JVpXCbYKzZre2rlNTdQLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740288070; c=relaxed/simple;
	bh=1AgiEpzZbTiGV6Uy8wp+qT2KoYKNdJdnGYq8GKaELEE=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AO4slNiM2hRCXP28Ts9vGiHMaIYCi6raDArWCl3CNrxraKu30dCgkMTFATYhfchnfJKlMgMEWgu2MCKW1AC5r8E4E9WYdDYEHojkWNxfC6P8qG9aVGOuKH6leu+uagM5LnoFV5TXtIqnWFT1zEYCBqejjDuzvOOf5kO04mWuv2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q9PM7aFm; arc=fail smtp.client-ip=40.107.92.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q9PM7aFm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8heS9w1Zrgrc75FSnDKpV+r/bocu5isyz84xxP5tZTUME9jz9laictc1HmioCAK0mBxtVlOqW/PTxsvhVeNkOnQHS0fC4pZqSrxbdEpvm86IUSOt2KtTrmMEXZCLWTgULFe/A5Y+mDiJKVlfRQwad9WkW4+Vzm3vftzpIkeGEhrz3PMMf4m1VeZXS3qr5M2Zrg6RCRtJHnLBzVXSq6XeLuBF4Mtnz5nZtlFFupvR8srjEc5og7ufG5FyODvWISINHCTmQwpzIceULodA4RKiKTNca1ty1qdFCgUBqVHsx+lmFh3ExMRrCPlMHpkd+S2hzvqdugNey7c7jJlkV85nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLxkypGhQDnftPEFykrhNVu2uTZp55UQyWtKleO0xkI=;
 b=juorLa3y2Xq4M6JqFD1gsEwlIx0kniPBJlRQ34se/XbBecpuWREj95kgd7MQPNeHmyQH8wPjMgZ7MM7Vo6AQqVhkEm/ia6LgS/0p3geh8PqRgvo4fRkEp5K4929RAEsNxogHbjuXjKFqn70rNFopCrVUZOE2a4DOSCNPOx7kAbHNemDzBhiHWTPQOQYQ9QYUBJCo/bdDchuRPjueBAt2D3hMfOTK0ogYcMbA5RgJ3g6E4/NqgAhsxeaOLv2IoR0KopEnFCxkTvMnEYMvdBLnEcf+GWGs5H+sfaR25ugXBKUwxNFl+rXnc+N47RYXBTnnvNamSfjs1BkiqGXyOGPCmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLxkypGhQDnftPEFykrhNVu2uTZp55UQyWtKleO0xkI=;
 b=q9PM7aFmDHoL8wwiVWh1RueJw1eTP8vSocBfV0/+rKiFhGWilOowyReMcQWxbwWtocdCCkCTNO96fbKxt08V9jFbPDlKCV0m5ExQ1e6Nww3NrQid/gaok+nNfi0R8zeQctnEsnGJnriy6aaeZpIfOvM2tJ2K78vpi6qgKmIRmQLjvXvZZ5yUECgLeUuY6BTdWcaB1UzpdvlMKDPJz3XRJkX7UGG+hGcIqxFhBWx7WZXHXeWcKLHgFuRCx+Kvsn22pb58h3YdYDprNkTZSwg5iTKkTXYrrN4Pu60uNiA9djZCBl4sRlqjhko/iRJD0Mr4pN/CbF0gNJjnsj2U3ISWhg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by CH3PR12MB9342.namprd12.prod.outlook.com (2603:10b6:610:1cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Sun, 23 Feb
 2025 05:21:00 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8466.013; Sun, 23 Feb 2025
 05:21:00 +0000
From: Parav Pandit <parav@nvidia.com>
To: Sergio Lopez <slp@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
Subject: RE: [PATCH 1/3] shared-mem: introduce page alignment restrictions
Thread-Topic: [PATCH 1/3] shared-mem: introduce page alignment restrictions
Thread-Index: AQHbgTK+9SQF/Ak56Um6rrdbwMmY/LNUYJgg
Date: Sun, 23 Feb 2025 05:21:00 +0000
Message-ID:
 <CY8PR12MB7195A2AFBB7530874D228954DCC12@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250217115227.4961-1-slp@redhat.com>
 <20250217115227.4961-2-slp@redhat.com>
In-Reply-To: <20250217115227.4961-2-slp@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|CH3PR12MB9342:EE_
x-ms-office365-filtering-correlation-id: 1791b7a6-3b63-4b31-a61c-08dd53c9dc59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?mIANXQw/tb3jBkulX0MHKCerCGggmQoT44iS7Xr8KJID9gMjk8ryJmLqKJbp?=
 =?us-ascii?Q?sBLotrC+rIh75JMF8USTYkSGGKfDqoNNWgp5+w65+oeCOUiR5lemFhGVU9CO?=
 =?us-ascii?Q?gfuUJ5lL8WTn0RMaSMpENxGb8pVzvpDLZXpzsPOO6HsAS/DAj1/JuX1yHLFh?=
 =?us-ascii?Q?S0wRviiCESMnXGVPKEQLjgGfR3naKAJGsqvD9uoODugeDta4abb/OFBwQbXM?=
 =?us-ascii?Q?D+fv6CxGWuhBPWEw26Rpc1XSkoov38ucpKyqvHKUTf9FETfnnNRfDbhsEJCp?=
 =?us-ascii?Q?pA3e69ZJn2Rpbzyd7bpaETtSDyxzHPjaQHY6QvmIoVR4U9EsAbor3G3oDBxU?=
 =?us-ascii?Q?ncMFxKLKNB9pST/6fDXIs/7a+R1uWNU0Z0OA54bw42mjBv+tnHGsJdXt4OG+?=
 =?us-ascii?Q?XnxAvuDShOfUOj+688oPpvai0iislotKDK58o61QykZ7s7hCOsnXl7Ha64md?=
 =?us-ascii?Q?QAUhcobRZzlNYARUOwfZKTQ/UBCCkyHnkozc/x9gVNDkxKtJ690RRlQRl8Hn?=
 =?us-ascii?Q?opFZiTTGKb4FsEzwNspW3RsQbBVtZcq7EMr6QyfX6TdE3F5t6GwIfqC8PJf6?=
 =?us-ascii?Q?xOj7YzXaWAuFDeBu/Qss6D+823yVxHrDHbMS8e4jc/NWpMrbF2pYqMWdzZaP?=
 =?us-ascii?Q?DlmNPfxXdqcdzcfGf+xoeUNhqSdQ7Of/f4gpH+3rKqsIocXvBP2FD252a9Uj?=
 =?us-ascii?Q?R4YmwWqHhouym1dATSefW6clJF4kquL07JxpMpWcmkxQ3e9N+go7e5z02bnR?=
 =?us-ascii?Q?c71x9RSH2sZdVoAjY0cZ/ZCZFp5ZpgqSnVAgxCkgR12j1ZVyni3C3cEKwkZI?=
 =?us-ascii?Q?ws2KzSeSFkAvo/ebMNkxhXKkgtvU+RuM9am5x8QkuKXhVZrjFVYAvyXGm0j4?=
 =?us-ascii?Q?mso2KK+ELspjwQ1n4ugLTtnJWLbFQKqeeid49/Nqc/tRuywFNiMBkprH87a1?=
 =?us-ascii?Q?vOMXB7vUjzBd9GMUnOd//4S0O0boDujoHQWLKs4Vh0cRGH1xnJM5idnUfLQU?=
 =?us-ascii?Q?iXwNsl/JCMTbfP3Q0LzaXwIF6slpbwp+CCiSrF98BMb12GsFoDarDCtoEoX/?=
 =?us-ascii?Q?3jltlMmoa7epg+bvn+5KrM1fbEfYXLreiU5iZQQcConezFq187rxlYe+m3l+?=
 =?us-ascii?Q?QsCd67mmR4kB2rkrgnRlqYtdAHcrhhFfy0J5gcvFPVByyqLh52s7qpnGPrQl?=
 =?us-ascii?Q?6gQK0+P3SyMgeOV3nd/0rVlU+SXUSpEPMBEK6guk6aH6Iu7QD03puz6CtdGN?=
 =?us-ascii?Q?3W5WfBfNnkNZFtbpi+gLA8SC2PEJdocDftwpCOqB5HPfuumLo2MYjHF6LL0/?=
 =?us-ascii?Q?HTjsWdJ3Nm2RFD3aTbHveRDI3V23WFFqLe77jYEuYVEIiIpLJkxenTko1Ytu?=
 =?us-ascii?Q?Z7O3iS9810nDmdedKt+tTwBnZ3+JwhUC7cQfLWj5u2kWWWruNdkziDM5jPXf?=
 =?us-ascii?Q?OuUYXXeRMWC6u8CdDLRyuKKdcXvXsVro?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?s5FZBAGq1JEUdGylJlOH+p+mzZPeQ/MBKyu1EfgEuUQKV+l2OEXEhsZCzX9Q?=
 =?us-ascii?Q?YZQ9+Xn44ft3d58KSILHrXN60IvrSudySsivcftEnyQpr66IXt59aLKKAkBS?=
 =?us-ascii?Q?ziFmWOp5Wlbpw7mfYIwmPqB2XWDA30SOkEAGXnpmimYfv2Rw5usp7WAzk80o?=
 =?us-ascii?Q?lRsue98z7VbxfP83Kw5Hnh7gc6gfGoKPA10HbQXZ5cIeJGBsEjdpblE2ccn4?=
 =?us-ascii?Q?137etJXigmNWd3HBdwUCcBCdlzmGOzio6uFx5SHYLvOjgq0ZjVoHsiu5Mhi4?=
 =?us-ascii?Q?diN/YwKOPvN24Hy2px4pLMtGCsIyjXkuLpaWiIduLy6TfU5vm4GmEIfsHaU1?=
 =?us-ascii?Q?B2RtoEsOA86/htcpovrsIxfgdZy2Hea1097UuAzrcUsKDdn8iVlbUx2s3a70?=
 =?us-ascii?Q?YnD+xdc7SbQD6EJNVQRpoUZ4xAlulj2OnJ42NhgxC31fVnM2eZOKNIjrmU+3?=
 =?us-ascii?Q?iXdz+xYQ/qkXceqtbtjRHXINTd/cyf1Rrbc4/P6bzcyn8B5nC/oEKchIn8Mq?=
 =?us-ascii?Q?t277aeTiOLtbsdkSgp4Xiyz+gGHDoIrFsggRCdv+EC2DnAD69h+nGxuXsrB+?=
 =?us-ascii?Q?2B9vtK5KIuF8nJzK731VQdw2XrxqFKEG2FN3EN8pW6DTFfILM/McOz5/gVFf?=
 =?us-ascii?Q?cmWo0fdQkhmXsqUiS/yDzF4CufjTyVH+ZX97iJuwGAV8lIkzmV7xWuT18U4p?=
 =?us-ascii?Q?2auo483/wIjZXDMVb+bm9xkQjC2QOFqg05hrSsOh2jNl2IvBUGNgMf0etmtt?=
 =?us-ascii?Q?NhNoxTI4qxNfrg4YfKxMVsBQd6XKPELJdLRMwYkH5lmUD61qUmpjcKYB+/Dc?=
 =?us-ascii?Q?0GgRCSIMsOuPpvdpqBpDCdQd7ACfWuWFkDYGPnSnAf4B7hbJH+3p5A9zPA0N?=
 =?us-ascii?Q?bqFdHuPERy+Xu0YEugvJxhiXozoWB4QX3XpwT3EpeqLQJR3vVBpglZ98wJtH?=
 =?us-ascii?Q?obJrf1gJpeEepMEp4pxICb4Owna8a3Bz4Qs2Hr+3YLbLmaCSZUqDVdSQC1wi?=
 =?us-ascii?Q?6g6KYEEDFbY+yJXnUSbNFVCjpXjLqmd8jOYT43z7LsFekVJ6gG1h3xLL0JOD?=
 =?us-ascii?Q?TFIIY7Ra+PoTPdGxm5VkIbS0ZH4G1gIxYqn6TsAahxTrvO4UyvjCAwj9dzCJ?=
 =?us-ascii?Q?4nlxADZwBp7MEOCmuTiT6c/Tc/wPd3Ud5eb9SFKjAFgi1MAYvFib9gkfIrko?=
 =?us-ascii?Q?gPPFrNBrH/lQJjLj45y6oNGw26eTnJq5QCZ5ozl5aYsFSyS1JkFXEx2uRX8k?=
 =?us-ascii?Q?3mA2YojDYNqdML/bGsIsA5XZDoG/00veYd98Cp1yWOLRhGUmkJ7M6tevu1Om?=
 =?us-ascii?Q?3p5iTWbeBtsdESfT4WS6I5pKQycL0203ZGWZxoXggdGlRIGcu4jsuQbYZciF?=
 =?us-ascii?Q?0xkxDoQ0izIDpwrmDr+SzKBOoNOTw+uQCwX5kcrkChdz5Y3ztqx7DMMejDCd?=
 =?us-ascii?Q?8PyHYDurMJ/yTXln32ucrVixulRV1uqfxqDIqCGWtgMYjx7TR4w/YNHvdeCB?=
 =?us-ascii?Q?gPm+zaGcEJjMd8Za2Ygie38xIxzoil1fuDTmTAi0PTrD3mjsc4Al7FaUYihM?=
 =?us-ascii?Q?cyFfQ1oEw+Ygz06ckaA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1791b7a6-3b63-4b31-a61c-08dd53c9dc59
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2025 05:21:00.6312
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TZ5LB3yU88JJe9wwA8NJzY7PFodtHx1XJaiPez2P2SuDRn9oXtOMxJVFcaHeiY2re4mcAISbbhD5WT126Hem0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9342


> From: Sergio Lopez <slp@redhat.com>
> Sent: Monday, February 17, 2025 5:22 PM
>=20
> Add a subsection for page alignment restrictions and introduce the
> VIRTIO_F_SHM_PAGE_SIZE feature bit.
>=20
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>  content.tex    | 3 +++
>  shared-mem.tex | 7 +++++++
>  2 files changed, 10 insertions(+)
>=20
> diff --git a/content.tex b/content.tex
> index c17ffa6..575065d 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -872,6 +872,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
> Feature Bits}
>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits=
}
> for
>  	handling features reserved for future use.
>=20
> +  \item[VIRTIO_F_SHM_PAGE_SIZE(42)] This feature indicates that the
> + device  transport provides information about the supported page size.
> +

Please extend the description around "Feature Bits" section to increase 24 =
to 41 -> 24 to 42.

>  \end{description}
>=20
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}=
 diff
> --git a/shared-mem.tex b/shared-mem.tex index 6e6f6c4..dd90cb7 100644
> --- a/shared-mem.tex
> +++ b/shared-mem.tex
> @@ -34,6 +34,13 @@ \subsection{Addressing within regions}\label{sec:Basic
> Facilities of a Virtio De  The \field{shmid} may be explicit or may be in=
ferred
> from the  context of the reference.
>=20
> +\subsection{Page alignment restrictions}\label{sec:Basic Facilities of
> +a Virtio Device / Shared Memory Regions / Page alignment restrictions}
> +
> +If VIRTIO_F_SHM_PAGE_SIZE has been negotiated, when requesting the
> +device to map memory into a shared memory region, the driver MUST
> +obtain the page size information from the transport and honor the page
> +alignment constrains derived from that page size.
> +
A device requirement is also needed to indicate that pci capability field i=
s only valid after/when the feature is negotiated.

>  \devicenormative{\subsection}{Shared Memory Regions}{Basic Facilities of=
 a
> Virtio  Device / Shared Memory Regions}  Shared memory regions MUST NOT
> expose shared memory regions which
> --
> 2.48.1
>=20
1. Shared memory cap is already defined as VIRTIO_PCI_CAP_SHARED_MEMORY_CFG=
.
This capability should be extended instead of polluting generic structure f=
ield of padding.

If its done in generic way like proposed, you need to call out that page_si=
ze field is only valid for VIRTIO_PCI_CAP_SHARED_MEMORY_CFG.

Overall extending pci cap structure is not good idea even though it may app=
ear as small change for below reasons.

1. PCI spec already ran out of total bytes that can be stored in the capabi=
lity section. Extending it will not help.
A virtio level extended capability is not good either due to below guidance=
 from PCI-SIG.

2. PCI spec highly discouraged putting vendor specific bits like this in th=
e capability section.
Citation: "It is strongly recommended that PCI Express devices place no reg=
isters in Configuration Space other than those in
headers or Capability structures architected by applicable PCI specificatio=
ns."

So, you should consider discovering the shared memory page size and more su=
ch fields using device administration commands.

It may sound overkill to use administration commands for 8-bits of page siz=
e,
but as more generic and device specific things evolve, it is likely useful =
vehicle where you don't have to search hard to squeeze things in some exist=
ing structure like pci capability.

I skipped reviewing patch 2 and 3, and would like to understand your though=
ts for above considerations.
