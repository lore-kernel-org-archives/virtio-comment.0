Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9C414A63C
	for <virtio-comment@lists.linux.dev>; Tue, 18 Jun 2024 11:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718711656; cv=fail; b=cSTbtV1HUx9h/LOxvmOJ8haNzvMG6v+YgAA7cbbLTapjZQPvkQqsSbSdHI2BYnrizEtzVOVpCdg83i/+mz3Nb7t0wfTqpyAQaUpLdVmz8AvNESTxAZoOCSyYz+gY1nI6j8KMOQvXtz9/+Vs8xHZE9KEQVEDsjy8FtyIZoCqyOaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718711656; c=relaxed/simple;
	bh=mDW8DxxtyuG1c0EKWmEhtdbkUL9+ECvUM89hQY0EBHw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MSziloP3OQrVyCGfEPPmfAYEvA68Ah5+RL8V7pn/lSpjMfacvq/sl/tLi3iQ626soRL4kZ+r5lIhQk7+ie0D0QifXyHN/iWnhh/nKbXM8j2hctWc9QBdC7gbFz7y/wWq6sRGdUj85h3ramtbwmD9MBVR7jGk3WTzgojxjNNlvK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=B4tCCoNk; arc=fail smtp.client-ip=40.107.92.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="B4tCCoNk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Im6Yv+4nmy17J86guFdtA/u+l3oT/IjfHLawEfLB6gt3zUchpsJHKZX1+8hdlkkxlRD85IxN4qPHDQtysyqWUC/o2R2KOTPzk4o2ZZRoV7eB2MEYRhTU3Kbkcyd+flYOYq8AzaJdFTbJz/26GD6MlmQOXhtzodp17iggyU1PyQVHiwQR9WJo2hnvgZshK0GWjEZehvxSyojkZza5Bh/R6+/mnbaa6HLsvot2B+hhgB1BMIWQLQINVBjcrf/zp8qXtyZLvB2Hila8b/m9NEVSpW52zFNWAtaIP8I0W7kYBZ5KH2lhJLrf6Ff68rwRx48DkPwJOZl6/V+ibTtI6UYNWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVBhq+2tIYS04D3Nn7t4ZzbYzDcOg1LHG+MLkOOwz8Y=;
 b=Qvjw7atU59f3AyWM8uVxRJPGmZpsg8t+7LDeMC2GwOa0CP8ivyoVRDcYojsFLE1rpEgqYNJs/ES4U9REMw3ikN6kHUv/ouILZcBvDYrvz1vc6oXHmHtXKQKBLEMktH1jkb/FYkBWTQAUeA7MrZ00ROkDEzdl7DJ9t9jHOSzM3HHsbfouAwVUFaiIsUMLg4y+mHnvPhBQuF3BkakXuCFQO71pNmkTZiMaIohPOYNL0+ajBxbP/7W+ZSXjjnwemHVbB9Uxmbo575ZMgHNIPYlaXA0jGi5vS/7JafimQtgZXSoeC2f/zCVWtghhEu/nCjTyFzphk4cMlqmeNvwP64aqSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVBhq+2tIYS04D3Nn7t4ZzbYzDcOg1LHG+MLkOOwz8Y=;
 b=B4tCCoNkskrNrUtok0m/Bap9yXJtaGab8SvwBd0fGGU5KuH5nHADZxjLGDMIq4H7Uf9SRF+BzHecI8B/FDwpokzFNiXsQKA8ODfVHVbrJ6a68Ge00CnunLvWr6hQYp1mozr2zQeLXCM+sLYiWZ2R8uTJBN7+LOaA8LwXIx5io+V1sqqkTJqKLLpkg3jI8MzIqC9Uzk1DmJ+vp8H12qibBVj1XGGaDvcchBqFwuCL1ls+9SU5C8MG0VQzz1zn5VFphnzNOLAV5fFxs6WTQ/KKKyWWNvpbzCJrBcceqUPupg0ap4tH/90b5ztJdFaCOlYrogEFlnAMTRTqoAo8pP0b4Q==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by CY8PR12MB7681.namprd12.prod.outlook.com (2603:10b6:930:84::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 11:54:10 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7698.017; Tue, 18 Jun 2024
 11:54:10 +0000
From: Parav Pandit <parav@nvidia.com>
To: Keiichi Watanabe <keiichiw@chromium.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "uekawa@chromium.org" <uekawa@chromium.org>, "takayas@chromium.org"
	<takayas@chromium.org>, "dverkamp@chromium.org" <dverkamp@chromium.org>,
	"tytso@google.com" <tytso@google.com>
Subject: RE: [PATCH 1/1] virito-blk: Support NOSPC error
Thread-Topic: [PATCH 1/1] virito-blk: Support NOSPC error
Thread-Index: AQHawWrdwzcIsa1R1kKu7fjMnv5ZY7HNZ83A
Date: Tue, 18 Jun 2024 11:54:10 +0000
Message-ID:
 <PH0PR12MB54811C1FD9D666D13077E817DCCE2@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240618081858.2795400-1-keiichiw@chromium.org>
 <20240618081858.2795400-2-keiichiw@chromium.org>
In-Reply-To: <20240618081858.2795400-2-keiichiw@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CY8PR12MB7681:EE_
x-ms-office365-filtering-correlation-id: aefda22e-5e0e-445e-e833-08dc8f8d5da3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|366013|376011|1800799021|38070700015;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?jAnuTb3qzbOZCBjdMkjZrnenYS6otzYLrg2EbQOKl5STILELYDT7iOvwaLy+?=
 =?us-ascii?Q?jrD9mPlXjBltiNNDupiu4LA6Rrpa+SHzaNVFNX6v9PoGy0BvlLs4FS10Bwh7?=
 =?us-ascii?Q?4+B0vi3jjTKYtPNcd5JCsbEbGsqAvGag5AP/HXvHJ212wlOnVYbQ5qwMK21F?=
 =?us-ascii?Q?PvQQJjvYmV7jfhloVYp3LMzVIAe3ZogkWHTRqdZ8orT5yL0zSUtWRx4PJEmk?=
 =?us-ascii?Q?gwi+Rw8FAcpKd9hffamziIBfoG/brsA4UPE2fcdfelClmeA7afaqLwQ9KrAq?=
 =?us-ascii?Q?ITvKRkaWkU9g1NTOxU52FN5zhemUtNd2qtXTYmhRyRlC/U8rlj/WXTcA+foE?=
 =?us-ascii?Q?0dUOYhPxaI+McpI+snf9NL1ez+LOvMWZqgyik+BPPEy9zDWFGwZN6iVOKiEa?=
 =?us-ascii?Q?UARRjdFLRCxwZtXxNKTz8wnsGZet6JzZWdAAdiS6xORGDRbXnmufX+Sr/R73?=
 =?us-ascii?Q?ohGBFwBVrDONZJJcJtqSeShdzt9Ys09kUN0Z0HgvCnT45eIzoAQCQruT/KLB?=
 =?us-ascii?Q?+ny1Y3LH3S7n4ml+7azhBCuLs2YZjiMeZbLWKdj79/1xeyvW6RpnqGY0rFAr?=
 =?us-ascii?Q?Q3LeCw6QRm9r33+wTHzmVD/wjrYh4Ha6L+RQBP2g7ZYPlMZsOFixLCwg9CEI?=
 =?us-ascii?Q?5y48xLqoAeRTmH99JD9OYLbSRUHghdinxE3zd/9OTbIJpczI7Oy9cpALsCLW?=
 =?us-ascii?Q?RheoH2JsWlaT3mjw0VUD8lSykEJGp62rhfhwvR0OwDKG14ubmfgQfz8MZFzz?=
 =?us-ascii?Q?ViwpJBNQTEDcnOyOk7nfdiYL5xq7S7OECr6tc/WZfADaZA/pOiDRYZJqS1Ye?=
 =?us-ascii?Q?LhdEbFm4Md1P70uPaR6I8l5nXA6zOlwr5p+eIwmDJDG8X9KSv6aI9dGpLNJZ?=
 =?us-ascii?Q?RG5Q3lfii89w4RxIz9NQ+UxxiMw71CUQPKAQ5JGbUJF0Ly44Bm8UB6HCs8ju?=
 =?us-ascii?Q?RtvpQ27VIyCx9coUgzZP5tM3L8xY0tV/bUv6YTBnvNmVMvEhcF6VIi1+hFpP?=
 =?us-ascii?Q?d6Ou015bweTr4vUSSlrlrNssB3zsdKALzyNWad2Fd8gOJUtmZ7LWLz5Tmcsz?=
 =?us-ascii?Q?YL/vPIh6M4hiX6P66XqHEx1MU5fhycJd5DmivHVbdokVAqPdZyAnRyw0ldmn?=
 =?us-ascii?Q?pzg/vp6Ujir2wp1hPoslRp0yysP3JwQFrJ2iJBiC5sXbwbJywDzdT1XfPU3A?=
 =?us-ascii?Q?vsLo2Lt/fqEGNZ8SF/r6PDJ+TDaxivP886gkE4iGq9eGTY8+RuUqCeZsp6e0?=
 =?us-ascii?Q?u7le1HAoHSqahMN47DQd0JTaoQ7yfBhD85dGO1vL4k0yLFg5OA9d8INaI29Q?=
 =?us-ascii?Q?aUVXgTrmSxTEAYvbeOhE+JwJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?RDIDGSmvVyqpitAqTd3CRFEHu9SzKagKzRIZr+Dmb4XOxJBv21oqCnc4pr1l?=
 =?us-ascii?Q?v5MlEU2GafNKcyGjMWSr6Ed5DFftkZBCKB679SsHmLbEBMyMfMWxcJefRC4v?=
 =?us-ascii?Q?P23wbKC0q0Ki1uTAZziml78MtyoeT+WFhe3dCwKyLICvfa7a863QuLbL2kmi?=
 =?us-ascii?Q?yVPXMVJi6kXOa1D3hgmmERLaICZ4wty3wUAoc6vz2UQD4nO+WoVQ5SnZE5Rz?=
 =?us-ascii?Q?3kGioBnAlGkiRG6QdvV83arRJ35T+O7wybS+voc/SFGt9zNtrAUnv06LoGDD?=
 =?us-ascii?Q?lWnFct+Vr1EJ+7J9lLc0z6J0DKPPIxrNgbU9qsDYZ3Pf/Lu8dGHlZsQfQQ3O?=
 =?us-ascii?Q?YfBvM9P6oFCsNVnECLmAPGcnZJBbEQd22V6F+pIj6c//zNenmWTwPnxxgCv+?=
 =?us-ascii?Q?VJTVU46sSkV+d/Ug97wTSbJeaPN3tp7XdBBWFc5WLXxZlJgaY5lWB2qNEaFe?=
 =?us-ascii?Q?PcnOauLHrlKlBkqH9VkUAW7VaR6Ud6j2fqtK3uAXDnJA9Gm34dX1EjCV5Qx+?=
 =?us-ascii?Q?nZEsfplj8g1zpAqBcv5UyO1GX0jwBdh7bpTe0n0606Njn3Q9mh9BMj5zSQ1H?=
 =?us-ascii?Q?ydFRJOCyePbxdlR4xcZV1rFHoByXjnGcxLL3Eqt2Ygwwx2/+bglJ2dd5ttzA?=
 =?us-ascii?Q?eUyyaQT71kTT0lmUoag+6zi9JJpvIHgV+T63aSDOFlrWpnk6nVcaBaYEvvTG?=
 =?us-ascii?Q?2CxJZPj1QUtomHLsnUHJcojJnkYFmEDJKsUYg2vKqMvV0GN6iTMdNxsYmzpp?=
 =?us-ascii?Q?xm1IZGeCQgLfeMJS1nF85kIfjBsxygZu3CPu02OpPL4bgphYCDv7wd/M8t2w?=
 =?us-ascii?Q?9JTCbGEvt7pVFsA9E0nBdOTq4jAYgpsiel/mU05Tsq7DbrZt+y4LINcGfELj?=
 =?us-ascii?Q?K5yVQotXFbrHy49EXJvC6sAXdfvKdXPcfl2Q66ejSBXYRCeu4dzFvhZi+za3?=
 =?us-ascii?Q?xVjt9EELHckJhICxgos//1N1HekNz2g3OjdUxTjUOlQTU6/WPrW3rpzF7zOc?=
 =?us-ascii?Q?tiYCgk9BBItbOMz5/ERZYrXGYjbn+STzhNFhLB0pcqpvW7rTxXYgYkxopIQ8?=
 =?us-ascii?Q?w6MeSXEnzfzqE22ocV7c/radUWZ4ioCt0HFSwNN9uat+vpeYi0mcUENtAjh9?=
 =?us-ascii?Q?Aq/mliNG31fwj98QzsxSz3SEHKGyvSb75khTCUne/4dt0ORfvED+4Pqmd3Xo?=
 =?us-ascii?Q?iqOSlFXhtikp4/A+08P6QqKpKBr5eG5fFSBKZygRlRLUVo+joTNxgn6rZF4o?=
 =?us-ascii?Q?FR498NXg+2v7mOXLLXBg4ZUcqF/73bWNokxpnzriFCcp1WDGBvWXcomrBf6k?=
 =?us-ascii?Q?c6vUXeHoInUi/6yU0GQkwV/Y710yW00/FaK0PODCJPwuaXkPZc+REwAC3Qe4?=
 =?us-ascii?Q?1pohJ6whBdQKPu+z8WqtobMqPfZZUDjT4ijooX4x6ruIRnwf/ZIDwkQTDUoN?=
 =?us-ascii?Q?iDb3WHU71aiszeAU1w84eqB9Jf6bZNjVp3kkhx2lx9eymFUglnjnH9pell6c?=
 =?us-ascii?Q?v4wLGg+y9XCQh+wKd3JaLe4ZD0ZkTCojXQDUfc0uTECjuJV9gTAQvYj0guda?=
 =?us-ascii?Q?9Cd7EzuqlYhXsXo8bIE=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aefda22e-5e0e-445e-e833-08dc8f8d5da3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 11:54:10.3878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iWi9yM89cGIW1bZQ7WCM/hb0uKMVvv55TMqrFt6IDXN0PoMAIuCPHp1i78lNFrzXNBGajUVpT9q2MuDvYegNNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7681

Hi Keiichi,

> From: Keiichi Watanabe <keiichiw@chromium.org>
> Sent: Tuesday, June 18, 2024 1:49 PM
> To: virtio-comment@lists.linux.dev
> Cc: keiichiw@chromium.org; uekawa@chromium.org;
> takayas@chromium.org; dverkamp@chromium.org; tytso@google.com
> Subject: [PATCH 1/1] virito-blk: Support NOSPC error
>=20
> Add a status code to indicate that the storage is full on the virtio-blk =
device
> side.
>=20
> This is useful in scenarios where a virtio-blk disk image is provided on =
a sparse
> disk and the host storage is full.
> In this scenario, the driver cannot create a new file to the disk image b=
ecause
> the sparse disk cannot be expanded.
> However, if the host have a service that clean up host stroage regularly =
by
s/stroage/storage

> wiping cache files, the guest may want to retry the request.
> For this type of special handling, this error should have a separate erro=
r code
> in virito-blk.
>=20
> Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>
> ---
>  device-types/blk/description.tex | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/device-types/blk/description.tex b/device-types/blk/descript=
ion.tex
> index f04c932..5a34bd5 100644
> --- a/device-types/blk/description.tex
> +++ b/device-types/blk/description.tex
> @@ -532,12 +532,14 @@ \subsection{Device Operation}\label{sec:Device
> Types / Block Device / Device Ope
>=20
>  The final \field{status} byte is written by the device: either  VIRTIO_B=
LK_S_OK
> for success, VIRTIO_BLK_S_IOERR for device or driver -error or
> VIRTIO_BLK_S_UNSUPP for a request unsupported by device:
> +error, VIRTIO_BLK_S_UNSUPP for a request unsupported by device or
> +VIRTIO_BLK_S_NOSPC for an error that device doesn't have enough space.
>=20
>  \begin{lstlisting}
>  #define VIRTIO_BLK_S_OK        0
>  #define VIRTIO_BLK_S_IOERR     1
>  #define VIRTIO_BLK_S_UNSUPP    2
> +#define VIRTIO_BLK_S_NOSPC     7
>  \end{lstlisting}
>=20
With recent work from Michael and others in admin command area,

we try to use existing Linux error codes referenced by the spec [errno] in =
the "Normative References" section.
So for this new error code also, it would be good to reuse value 28 (instea=
d of 7) of [2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/include/uapi/asm-generic/errno-base.h
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/include/uapi/asm-generic/errno-base.h#n32

>  The status of individual segments is indeterminate when a discard or wri=
te
> zero @@ -567,10 +569,11 @@ \subsection{Device
> Operation}\label{sec:Device Types / Block Device / Device Ope  Requests o=
f
> type VIRTIO_BLK_T_OUT, VIRTIO_BLK_T_ZONE_OPEN,
> VIRTIO_BLK_T_ZONE_CLOSE, VIRTIO_BLK_T_ZONE_FINISH,
> VIRTIO_BLK_T_ZONE_APPEND,  VIRTIO_BLK_T_ZONE_RESET or
> VIRTIO_BLK_T_ZONE_RESET_ALL may be completed by the -device with
> VIRTIO_BLK_S_OK, VIRTIO_BLK_S_IOERR or VIRTIO_BLK_S_UNSUPP -
> \field{status}, or, additionally, with  VIRTIO_BLK_S_ZONE_INVALID_CMD, -
> VIRTIO_BLK_S_ZONE_UNALIGNED_WP,
> VIRTIO_BLK_S_ZONE_OPEN_RESOURCE or -
> VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE ZBD-specific status codes.
> +device with VIRTIO_BLK_S_OK, VIRTIO_BLK_S_IOERR,
> VIRTIO_BLK_S_UNSUPP or
> +VIRTIO_BLK_S_NOSPC \field{status}, or, additionally, with
> +VIRTIO_BLK_S_ZONE_INVALID_CMD,
> VIRTIO_BLK_S_ZONE_UNALIGNED_WP,
> +VIRTIO_BLK_S_ZONE_OPEN_RESOURCE or
> VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE
> +ZBD-specific status codes.
>=20
>  Besides the request status, VIRTIO_BLK_T_ZONE_APPEND requests return the
> starting sector of the appended data back to the driver. For this reason,
> --
> 2.45.2.627.g7a2c4fd464-goog
>=20

