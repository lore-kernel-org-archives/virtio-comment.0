Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD221E1E06
	for <virtio-comment@lists.linux.dev>; Wed, 26 Feb 2025 10:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740567110; cv=fail; b=tV+G2e+0ir/vFE9KXyWkjQdXSFIbu2YLP6LNUQ0uwzAQrciv/LD/0BPK2IIQmDHunHd9+JOi/y//G2NdUQSvUOso6pozlCJzPPvkceL0Gs/Kz53xKdxhQmgeuJ9Ba4pyUpEYbNI5dLG1nveJQ5Mjvu8mjwEhwtaVcRYVDqcjyQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740567110; c=relaxed/simple;
	bh=cBe2LWCestzt3jNP7YOVPaPAk4bNasH7CLcw6GokH8c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NFGE/CoQ5Xf7l5RcIclPwl4dN4djjBhCqVQvRjz/CebAN3LZqeefgWqO70qWlVCqbP/AystrDJ9GV3DeD7UdGQs8T/TdgEwX8t51/SOV73VSFGMMUo6aMY+iKC6wTfPs1fXlJb2Ywdl5QYNa0+w8NkgzJE15sVD4WeHjX5ngujs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n9apAnNU; arc=fail smtp.client-ip=40.107.236.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n9apAnNU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXkGygeWQPiC0B2jBHjRwGUXISzyWjTk95T020QXXpACWWq1drQ/QgwvVXpiSazjqB5QAkcuRr4umOE69baNfEOl4dIDirurWkdgY4hmsgJxzr2p1ocHUagJUF05otS//KnZRCueDgf3OPztJyct9BT9ciapl7JimsjU18irKIrtlgs+lw3yqCD3A61FelVAvnkSX24oNUDDI2Kk+G4ATzPnnQTne9na821bDR5IiSrd/Fs/RrRXUcLsllIDtSCff5ltUrTwKkcgcu/qlfcit5uIU9K3PR7jStyud8OlEH7qqilxn8aOKxnfC/g0qEIqDlqrzNqFe0ag4GhOL/PRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYr0gvebg66U9R5RGI3P53g9+PO/r0zkfihlgUbNd7Y=;
 b=yobf09qXn++hpthXtWcCwAD7Y+o+x+ejDFBA+j9xz0axIty78hMP7naDJ7ekxXN8IUIZRrsluVAhfxjEdYbrbiPtP43JpqGHVBkIdak8RU14PFJ1Tjxr7XENBhBJZ7i5ETgyjv2Q0wVJrSKwACRmUvQXiKSFooJAKtWcOZS8XpvFDFbdhnSIMdCLQAbcshTazmEcGuRL0Gxy6f9oSnPbs+P/9Q+wuoH+0S5on6+mrEVhJ/OPu6deq5FFd0tOzPmMc7ptbgG1hbVjrrsWb17/7v40M1ijFtVTegeu6Fu8/7s5ptJh8N8nIOA10nVtyIbqB50FT9zRn06tfFLmJCW/4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYr0gvebg66U9R5RGI3P53g9+PO/r0zkfihlgUbNd7Y=;
 b=n9apAnNUQlsntjBLtE2kzu3d/jQS+LiZreASYLBlVy2mmPOf/WPhWVsw5yi/hvxFaRzw76XcuDxMDkrlc5PRDaN9U/dvRIgtsJsw8mH+IS8+WVMbbWQvjIz1qI2xdp3IoE6O45Xk5k1rV1j/Oalt/NtpaCzVLpHD/apoNDSFBEuQ//wGniDg8GAi7UYJX7Lhx2oWy5qB84Bj2grN+c9WiGVRp40raS/5lxzFtPT5wuwMItj92VCQCT6tgBPgTiReo0FvcKk+vKcagzFsk9ticMwXW6FxsFtK0Z82GHsEb0N49VgEHcOyC2w4Bm4U5zyxGgWnBA03x4Ip67mPjxCNLQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DM4PR12MB6183.namprd12.prod.outlook.com (2603:10b6:8:a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 10:51:45 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8466.013; Wed, 26 Feb 2025
 10:51:44 +0000
From: Parav Pandit <parav@nvidia.com>
To: Julia Zhang <julia.zhang@amd.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "Michael S . Tsirkin" <mst@redhat.com>, Chen Jiqian <Jiqian.Chen@amd.com>,
	Zhu Lingshan <lingshan.zhu@amd.com>, Huang Rui <ray.huang@amd.com>, Matias
 Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: RE: [PATCH v2 1/1] virtio-gpu: get p2pdma distance
Thread-Topic: [PATCH v2 1/1] virtio-gpu: get p2pdma distance
Thread-Index: AQHbiDDvdx0hNqTsk0elfmK82iBGrrNZZ+iQ
Date: Wed, 26 Feb 2025 10:51:44 +0000
Message-ID:
 <CY8PR12MB71955656F340C5EAC2F1C925DCC22@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250226092753.1082042-1-julia.zhang@amd.com>
In-Reply-To: <20250226092753.1082042-1-julia.zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DM4PR12MB6183:EE_
x-ms-office365-filtering-correlation-id: 02688f3e-0e6a-4156-fed0-08dd56538fa6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Z3JzlVC3sr8msAfjgxIoc2FbEkEtV86pvvI0tMF7kiVaz2/Mp8sDw7rFgOUo?=
 =?us-ascii?Q?BDXF8qjbQnWkMau2TDtc/YBrDewsx7d33BM4ALpcFdCVCTUCTdypzVJ+EPNC?=
 =?us-ascii?Q?dOEw4fGpqITty6UN2hvBlfidotaymP9ucOqTOnLioyLC6yPZElWWohU4P3z1?=
 =?us-ascii?Q?xLNMFazTXz5CvcTZPMCibZtEHLP37VdFYPEyp6mfPBnXbdpDWvY+6TPkPmlg?=
 =?us-ascii?Q?VCbQ/6EiwRpNfClSCc2dFVfr22Gp4KCxla6o2XHpgOUC1i0pU1JAcPwptoqs?=
 =?us-ascii?Q?4226qvyG0azKVTFTEuTo9BK1yHHW755sWGN7QjEs07m2oUlhrXdbLkiicoxk?=
 =?us-ascii?Q?uiN8xXJ1oJ8pai8jNB5NRw4OaNCfpziKSOIRW8ikIMxQXBEomPx36UH070kT?=
 =?us-ascii?Q?mdgtDAdoh3V8RpQC5ZP3PWcEE53yZbTP6Oei68OffimCxZXQiBCnMotIyxfX?=
 =?us-ascii?Q?+jKVHt15a3LIgMeB4T8yPpAo1Iy4HQBQcjke+TDZMz644Id/ZXHtSfbkwXvs?=
 =?us-ascii?Q?xR9Cq+wYLqz9SXkU/GgYMOdDInldx1Ze4lgiCVAtSQAPPhHaZ1bYDU7EafaB?=
 =?us-ascii?Q?CjTY3QSL/SHQU7vremDVFBqfu/885djb+2SgNkpyqF5RVeBetC9aiE6lpx6Q?=
 =?us-ascii?Q?jSaHnk6sBo47XuSnZgSFcO6HpMqKJIGOx+BWwn4mrh4DwlJ9NnhsewaYLz1B?=
 =?us-ascii?Q?O/dt0jdEAuq/y9M2z91CAww4ui1B8/9gk4Mlzy8cr4a8/OlPKBtAcLk/I1l4?=
 =?us-ascii?Q?1MhvP5pkhAD4jWtYxILnSBLe8pG6ffrd7gUXLYnUNQMCJnHfzqxgZR8CzjMc?=
 =?us-ascii?Q?81mGtIGy5Ml5oCmDocFj/Tg9/goY+OaFwol0cOKC6QihnsjgrRMm7n39N9QQ?=
 =?us-ascii?Q?Zwzckzil6Kn2GP3GRLlBn3G53Uen6RKd5UExTB5ZpAfgMguEhQr2+ihm4RYQ?=
 =?us-ascii?Q?HlN8uQqVJCg8+wmnZeqsucJLXVoTRVKOQwsM9tNfhQx9OpxQxqY5hdmalbaf?=
 =?us-ascii?Q?4dUoffWLkAwJekcTZlMKAv9+AKwninOTKgBxp8e7mvO3LSFEB0wjMWkB5z6E?=
 =?us-ascii?Q?jGcc0a3n5S42USJVMHvtJh0R72jKAA9ffUOHpB6G27ZmEUDZVFntikDnKzhD?=
 =?us-ascii?Q?MVb3gMZ/aIQPuBomE6INjz3qyVsNTHlBLxj+qrQ9b9TNDIzS8i+6Ce6fPglK?=
 =?us-ascii?Q?iE5ZsKqebg3NrzM48umjvi2/HE5KR3taAsSKsbYVizpKqKj2q3PpT8zMQbLZ?=
 =?us-ascii?Q?2lwVgiWnmojSHK6GDTv8nMxEr7dQocYxy++b1oCznDk0TZD2XvjOhg4v/v4Y?=
 =?us-ascii?Q?K8wj8K7n3xS5ljZMNcofn1wo9YUxJxTYhSVBDGwGZ299uYoXyaccFbBEZicZ?=
 =?us-ascii?Q?DvvDdve20nWt29hnkxWIs/r8TYodi0VeAw2iarqUeh/vdYos2A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pGuu933EBwuu7YAxIU9DFMzKsvT3fWnVbRVWyz1qhLPo4raalAUeYcgA0CZP?=
 =?us-ascii?Q?l4SN4t4qqQHr7iVhWof/VfrezR0sv6mBCpdmMMfYnMySCZykLShmSPZ+HzyQ?=
 =?us-ascii?Q?O6AaKtDIGNDqnDUPfAZtXO9JHB0iT/PuH2Fnmm1nWpJ+scUG0F51q9gfEbjz?=
 =?us-ascii?Q?NdR30sLPCVHTBa4zvjSUOa+01FvQ/G9rmegYxM3y8EEleR+mA3G/L5e7+jBP?=
 =?us-ascii?Q?u5b3cPsiRpwdidEAzh42wjEJiOJEkL/wlqlTUq9l0Za8Q7Zj2iNDLki8DvPr?=
 =?us-ascii?Q?QXF2pLpkV1ySZ/ofoUeoLNVKlNnivZ9/fg9otCHKEzyKOePDj4N2+p5lmS8n?=
 =?us-ascii?Q?wuTQhJiPlhjQ2rkMYPQ0tfh9b72rRWrX0Nqzq0KOLM+tYFzrAZD1seSBL+xO?=
 =?us-ascii?Q?yLieL4KaF3Xz8YZ9PITHtesfDIn5HduXKuddOlXBYv86MXyEsoikFqyDAlga?=
 =?us-ascii?Q?uhpWQR/9pweEHzWz3Wp/A9fQo6aSpu3Fn4XE5KP+GjaDFVdsbCNPTkq7ofkK?=
 =?us-ascii?Q?J/ara7qSKWNyfzNMYd3JXvYHcDF1lLIyYrHS5ceN5SXn1AJvH4FehP9ocAog?=
 =?us-ascii?Q?+6h/vBlubTEVlFp8ZfwBFGs6+OxBK8ymVO7F8jTCPvKv+ZYe1V3sIazBCUBr?=
 =?us-ascii?Q?W1KS+2XzlS0CtLqE5ccbUUjl1wnNcYuMsEau/hnF8DaoukrhNGqV8i3l9p7/?=
 =?us-ascii?Q?gAqj6Acss/ubbmaWNnx7tFgeSSqFY2RjufjdAVH8zbCmRI99P564I8R5MSmR?=
 =?us-ascii?Q?zzzh18E0rBv5jttCYe0n4Q0cUF6RQ8c1/ZDjPZX5CVBkoIMEeQyBY0FU6eM0?=
 =?us-ascii?Q?5rKLVEqCd07nxjOsDdwRBGaf1VDzyfr62fzgkFXSIjJhN/sG1pb8zXgba0JP?=
 =?us-ascii?Q?csWgCnNmCoAFb9oGkVbxv1TSO4XG0qkVexMtGKN7H1aeO8BeKk6T0MN2//h9?=
 =?us-ascii?Q?ByJy+AMHLh4NFm/X1WGwBHCvQmsOIa3sYUIfPMEqK3L7FAuIl2YPkJwTx8GG?=
 =?us-ascii?Q?uwQOQXcKULk3D9T5CbHCyMYr6nIuBuSLM5r3cLeFrZpvJawjbgSKO44DTFjQ?=
 =?us-ascii?Q?3s7ZTv++kiyO1X7V9eBP87lKk7Gv6DF7SKoKmpW1mpVeA24bEM8Q/8P8I5TP?=
 =?us-ascii?Q?g7OXqaqjyY+rpQkr0vzQ/DZyr9pBLyb0o9YHk3AI9i4Xo0stelT0zkc/Ehwp?=
 =?us-ascii?Q?ThLdbEhbT+92HsLF/JZ/LV1F58LuKEO0bufL/bFE2jhjZfO1dffUP6OB8HUD?=
 =?us-ascii?Q?u6MvbdQrNA+63sgzhC/w1BQB3EBu302+W3y9JAM75fltG0GL5cVmrVyEtlDR?=
 =?us-ascii?Q?eBDmgOsYvug6Q+ETk9holiN7lr7BkYzNdGMMqSSaIsFIVlYhbqhws9ro+yHp?=
 =?us-ascii?Q?LduEjTTtn/lN3i/sVwE4bavS0LAhvVuhFqfEjwd0a8S4UCctJg7kk5UAx/Nq?=
 =?us-ascii?Q?dhpHYJVxSlyT2DF791RrRVAyYuJSopln/n9uwcPZVBk5TJyMN+MnG06hGL7f?=
 =?us-ascii?Q?JZpMJYCpjnIq/Q8UfsDm62HBHAx5aF+sDnQz9rLPTDpkcIMt/fBdfhktshXh?=
 =?us-ascii?Q?H8nN78ApF+RbWXoRz3g=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 02688f3e-0e6a-4156-fed0-08dd56538fa6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2025 10:51:44.8296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DTzNFunUVCwo6KasAKQO4KoOzSEJd+C5v7ikLcWGQaZSzaj17U4qTF9h7227dWft7N3fyc2EofijMEE7RSmNyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6183


> From: Julia Zhang <julia.zhang@amd.com>
> Sent: Wednesday, February 26, 2025 2:58 PM
> To: virtio-comment@lists.linux.dev
> Cc: Michael S . Tsirkin <mst@redhat.com>; Chen Jiqian
> <Jiqian.Chen@amd.com>; Zhu Lingshan <lingshan.zhu@amd.com>; Huang
> Rui <ray.huang@amd.com>; Julia Zhang <julia.zhang@amd.com>; Matias
> Ezequiel Vara Larsen <mvaralar@redhat.com>
> Subject: [PATCH v2 1/1] virtio-gpu: get p2pdma distance
>=20
> PCI peer-to-peer DMA transaction may be used in guest for some scenes.
> For example, dGPU prime feature will let virtio-iGPU access to passthroug=
h
> dGPU buffer.
>=20
> To support P2P DMA transaction in guest, virtio-gpu needs to check the
> compatibility which is represented by p2pdma_distance. This defines a
> command VIRTIO_GPU_CMD_P2PDMA_DISTANCE to allow guest send virtual
> pci notation of two devices to host and get host physical p2pdma_distance=
 of
> these two PCI devices.
>=20
> Fixes:https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
F
> github.com%2Foasis-tcs%2Fvirtio-
> spec%2Fissues%2F217&data=3D05%7C02%7Cparav%40nvidia.com%7C86ac1a37
> e844437318e308dd56480fa2%7C43083d15727340c1b7db39efd9ccc17a%7C0
> %7C0%7C638761589695627211%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0e
> U1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCI
> sIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DIHhSmc4IGcvfStZERt0tv6hp5Se
> Ifsm1M5xIb37T9Tg%3D&reserved=3D0
> Signed-off-by: Julia Zhang <julia.zhang@amd.com>
> Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> ---
> Hi all,
>=20
> We are trying to implement dGPU prime feature in guest which will let vir=
tio-
> iGPU read rendered data of passthrough dGPU. Before that, virtio gpu driv=
er
> needs to get p2pdma_distance to check if P2P DMA transaction is possible =
or
> not.
>=20
> To implement getting p2pdma_distance, QEMU needs to handle the
> command from guest with virtual pci notations of two PCI devices and send=
 it
> to host kernel and return host physical distance back to guest.
>=20
> So this defines the new command follow the suggestion in https:
> //lore.kernel.org/all/20241207105537.542441-4-julia.zhang@amd.com/
>=20
> changes from v1:
>  - add issue link to commit msg
>=20
> Regards,
> Julia
> ---
>  device-types/gpu/description.tex | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/device-types/gpu/description.tex b/device-
> types/gpu/description.tex
> index 4435248..9d0f30b 100644
> --- a/device-types/gpu/description.tex
> +++ b/device-types/gpu/description.tex
> @@ -223,6 +223,7 @@ \subsubsection{Device Operation: Request
> header}\label{sec:Device Types / GPU De
>          VIRTIO_GPU_CMD_SUBMIT_3D,
>          VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB,
>          VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB,
> +        VIRTIO_GPU_CMD_P2PDMA_DISTANCE,
>=20
>          /* cursor commands */
>          VIRTIO_GPU_CMD_UPDATE_CURSOR =3D 0x0300, @@ -236,6 +237,7 @@
> \subsubsection{Device Operation: Request header}\label{sec:Device Types /
> GPU De
>          VIRTIO_GPU_RESP_OK_EDID,
>          VIRTIO_GPU_RESP_OK_RESOURCE_UUID,
>          VIRTIO_GPU_RESP_OK_MAP_INFO,
> +        VIRTIO_GPU_RESP_OK_P2PDMA_DISTANCE,
>=20
>          /* error responses */
>          VIRTIO_GPU_RESP_ERR_UNSPEC =3D 0x1200, @@ -791,6 +793,33 @@
> \subsubsection{Device Operation: controlq (3d)}\label{sec:Device Types / =
GPU
> Dev  };  \end{lstlisting}
>=20
> +\item[VIRTIO_GPU_CMD_P2PDMA_DISTANCE] calculates the cumulative
> +distance
> +  between two devices before Peer-to-Peer(P2P) transaction. Request
> +data
> +  is \field{struct virtio_gpu_device_p2pdma_distance}. Response type is
> +  VIRTIO_GPU_RESP_OK_P2PDMA_DISTANCE. Response data is
> +  \field{virtio_gpu_resp_distance}.
> +
> +\begin{lstlisting}
> +struct virtio_gpu_device_p2pdma_distance {
> +        struct virtio_gpu_ctrl_hdr hdr;
> +        le32 provider_bus;
> +        le32 provider_slot;
> +        le32 provider_func;
> +        le32 client_bus;
> +        le32 client_slot;
> +        le32 client_func;
> +};
> +
I assume above bdf information is what is visible to the guest?
Why cannot it see this distance in the guest VM itself?

> +struct virtio_gpu_resp_distance {
> +        struct virtio_gpu_ctrl_hdr hdr;
> +        le32 distance;
> +}
> +\end{lstlisting}
I am not gpu expert so didn't pay attention to details.
I believe you are missing basic information in the patch is what is the uni=
t of distance?
Can you please add?

Can you please wait for few days to raise the vote and sort out this detail=
?

> +
> +The request data contains guest virtual pci notations of p2pdma
> +provider and client. The response contains the distance between
> +provider and client, which represents the compatibility of these two PCI
> devices.
> +
>  \end{description}
>=20
>  \subsubsection{Device Operation: cursorq}\label{sec:Device Types / GPU
> Device / Device Operation / Device Operation: cursorq}
> --
> 2.34.1
>=20

