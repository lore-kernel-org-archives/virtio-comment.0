Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679DD1D86FB
	for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 10:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729246348; cv=fail; b=dM9si9p9cwFQMI2Ka5BUYfqEZ3STS0HiU2GlWeCTN3xN8U/E6pKBPYJ36iNTtH0vhtC9D5ZHvSy+0JefCMaJ7Shxv8Pn/xlcOQor8jkzPd17XvO816apyRNsF21jpkYZwSgNthbE0axD0UF3KADUVdhfEe/ISw1HbqnInXKj5N8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729246348; c=relaxed/simple;
	bh=QMk2pLes59bR/ZiwG+5cyVYyssfb0TIPdZBFogioP08=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s5RWtyNaS/F98Sa5Lnw5VGCvDOWEaQbMuUAKRcd47fvGAAVDWVX6H7rTU4Nrqe6t+0wzukhAd1To4FqHgK04uYEEtt43mhbnWcB/v8jdTAt2ogpLvCwcBmV/c0pPpGfjip9Mk0CL4RQomI0u9huS6u6/MiwxL79ivjrtAPUtPfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YTyn1Vl3; arc=fail smtp.client-ip=40.107.243.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YTyn1Vl3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EH9pmsAfhWYAR9FWeeXxchyEZyVZfKDXtEQcaNpWOrF5R/E2nwF/EZMhHUB+nVsqvqJFbqZZsXROzPwtGCkkDDFKBZnQv7iKuOtkbi4H+7fT0q9CtVpDQOqsDIvgml3yG5ZJSIlJctJqDcU79IJhVA0UJdva3nEIzn5okT55hysRXxvvE8mFruyIVxX0YpB9SJ5/4jAaDUIkJ4SOY10+eKYnIAGvbX5+VpNvt05utqlxEJw2x2mmhhKj7Ow0Ro9HizbxP5ctr7f8JEpKpJk9KxwfRqILwWfZ7SMAyF6RjArRzejbtbaaRQdL5f8u27IJ+aGijRKmpAkArGpuP5bGew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJmGsy2h8EKPe2uS9cS1nDLnwBEOSYJlFLaht36OVsM=;
 b=DKM9AIPeRsVZrig/FoqFrVRAsQpvQKeFZS+ozzP+uchAeM+PgkdS3k61F2m2n8SC7knH0/n0+EdmNOI/GUFaAFOEvnllyT/F3861qK7tSXsrGV4X1KdWAv1k+SfpVV4fH8jYUoZ7X3aXL9cmkHBi7F7c/a2M0DKTKiIzCVpt2ZLD6PKFL91V5X9tOe0zFE/z0CLZGjclS1qaFWGbubnoHO2ra4Nlbug7vknHTRJO3JEspQ5GY3ccJwdeAyDQD0xQOWcLB8nDoIxedcA7MrqYwpUNtQfF7NlLVvLR4EKYvRMzqX+wLREfd8vof01ZM6e7KApI+M0dlRl8TEgu3QJJIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJmGsy2h8EKPe2uS9cS1nDLnwBEOSYJlFLaht36OVsM=;
 b=YTyn1Vl3+5HHYeIuQ+9nB+R7wVg66gkOeMDIJdpmI7JA5Ncc9mS9bpXWoRJBLo1LoIlj+grfXrllIRhzyuMpANDPZeLERAqLVQ3dkJmXjeQyUIPMGqLEuQYjWKmuv71JS5ouQBJz8x8u+wTzTGym0u68M4C/Ev5ATIMZTIfRDEs34UwFe+S/bM7srQY274yEpzw84jDhP4sfvLZjx0jYHj9L8O9biqOQiC1Md7Dt3OllOekzPzAFgbJOxME1vEDCt0JGzgYkNbBYFvmVfbE+0++Blotb8+aT79YkuCxU0uf+83CFP5m00Wtm4GgyN+40w3pWJWZTG2FrLSHj8m6n3g==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by PH7PR12MB8039.namprd12.prod.outlook.com (2603:10b6:510:26a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 10:12:22 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 10:12:22 +0000
From: Parav Pandit <parav@nvidia.com>
To: Albert Esteve <aesteve@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "changyeon@google.com" <changyeon@google.com>,
	"daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
	"ribalda@google.com" <ribalda@google.com>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, "alex.bennee@linaro.org"
	<alex.bennee@linaro.org>, "eballetb@redhat.com" <eballetb@redhat.com>,
	"acourbot@chromium.org" <acourbot@chromium.org>, "gurchetansingh@google.com"
	<gurchetansingh@google.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"agordeev@qti.qualcomm.com" <agordeev@qti.qualcomm.com>
Subject: RE: [PATCH v3 1/1] virtio-media: Add virtio media device
 specification
Thread-Topic: [PATCH v3 1/1] virtio-media: Add virtio media device
 specification
Thread-Index: AQHbIGLiBYmaeoeRUkyIwpovLn3AqbKMSSrg
Date: Fri, 18 Oct 2024 10:12:22 +0000
Message-ID:
 <CY8PR12MB71950D7DC2CC73EEB94CD12BDC402@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20241017070423.86706-1-aesteve@redhat.com>
 <20241017070423.86706-2-aesteve@redhat.com>
In-Reply-To: <20241017070423.86706-2-aesteve@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|PH7PR12MB8039:EE_
x-ms-office365-filtering-correlation-id: d898f7e0-c99b-4090-b384-08dcef5d5b33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?y3BUCvj0YH2k6cZXt9LpSEETAaJvEYOqOGeWvmhuqXIW43hLXd59MBxEc2Sm?=
 =?us-ascii?Q?nd42/ONbr0TqhnhBDDGuiEQFYCefC9NTq6VODCfJLdR8IE3bb6904tXTpEUn?=
 =?us-ascii?Q?bzBx3sKNvbwl+mYShh+yuC39yiMpB85W+3NZMSr5PLsXwTPJgXIfkng+l0ww?=
 =?us-ascii?Q?LS//zxMLQm67v2WaUtC+h26f3Klg5V+8F93Y2lTIDA5+D1tGNfSdTE34pPob?=
 =?us-ascii?Q?hSDfRbKmpAV0LOlMySgj9iShN1gXOKQ7A1viMu8ZX9Bk4eBoy2ltvG4f3uBG?=
 =?us-ascii?Q?2ogrO21RalfOpr4js82iPhJFDACv3wjraqxJKKlVWkJjoP79W0zomL++aOmK?=
 =?us-ascii?Q?NOh8BQ5EJ0RYKkDovDzH1WfWpwIgwW+F7BeeJR4+PLoaDeopvr7ONE/ij+vW?=
 =?us-ascii?Q?bpLzHp/HhhwmNx6TBgCA1rbIaPkeZa495hU+CEwxLmjrgadGFAK+iOysVG9b?=
 =?us-ascii?Q?Aimduubh7e1r7Uo0vf6Y1OB5ae8CcwF51hLk5LQ7mYX7wMdaf5h1F7UH+J5k?=
 =?us-ascii?Q?X5xZqWm0xSzDeqP4ZE/9zZ3rTIhtlRFfNQU6Jv1beHeeLPeHXzMAsdty3suu?=
 =?us-ascii?Q?oHSQMtmsWGPPtxloRL6xwxiR1Hxo7cI2vnxZrRXubeshh8P9Bfp7IWjvQzct?=
 =?us-ascii?Q?ScaoNgof1j1//bOqTnJZOeCiSY1pGacPmd63qs3KVidqDknxtAlQIk7GdOx6?=
 =?us-ascii?Q?7aPlhkCK+zPIk85H8M2RszTwEUaJHR1hQw4AWUpXCUskhv5hNbHVfmUvVfU5?=
 =?us-ascii?Q?nIWocSopvd78lHpjlmETA7xs87Hgr4QdtP3rgilJhQ9KZkYLQJgWnYgYbnj4?=
 =?us-ascii?Q?r5g5t0xdZbkZF5uicZqfMSaMe7ykU9mMBt4MyxmV18Md3UfqAjHTWXzlVz3/?=
 =?us-ascii?Q?sE1UsyCjG/lz8ipTFqfhUC8rlOf4lybdSiSkDOZnldc8khj0Ieu8roRyiHtB?=
 =?us-ascii?Q?02vuFNv1tEwv00Agr3e3UMyG3AKdUBj6PCyOXPr3cTyEbvVFRUkvg7Z0w/7c?=
 =?us-ascii?Q?FqIFnDDYggDS8sUxlGy55P58cQ3rikf6eqrQ7rwqquoLHc1yUzF/Ab2TVGxl?=
 =?us-ascii?Q?2K3KFICgutJkLBzmF7jZdMQt0Xv5A+0+u3xBp8QtVzyuj1bKAqPGHECw7RrW?=
 =?us-ascii?Q?dYGNitlY0VgDQhVYPZ5Y4pIf57KWDf/h8mT6HqeC/Ch4RH/1JLXvJZkYaSYT?=
 =?us-ascii?Q?LfxdX30h8AchXTfy55i9b8DtUoa2gwm4CQPl51Y/boacRZAA3KCJQoZBF5Vv?=
 =?us-ascii?Q?0kmyybc66OAPgDLh40oBG1MjwSJHWSQsl0b/ZzKK0GXOYTFNzQvI3QD+duD4?=
 =?us-ascii?Q?0Cns+hd2RmkKCsiDUz0y86ijMqWFwiS1xwC68/p9WvOAdq79TtHsDQzTCjDr?=
 =?us-ascii?Q?LabjMY86QLFk2mMgvLjAkjn2pwUj?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?K8zpbqgvdklyeQreXPuyTMcHkgZDR34crDQ1F1B0sKw9TUrTNytJDud7nqdX?=
 =?us-ascii?Q?LXBaqhbjI/sOrupiNauSh0IzAXpEHCYUkM83opLw/1Ma0iQ3/tHsfTVmsyyz?=
 =?us-ascii?Q?yFGSFxqhy1swsiUAHyQBo2niG+iGFIwHih4zNKfXDFQ4QDHUEiqwjs6zIvou?=
 =?us-ascii?Q?inUAdUZPL+IBwGbobnv80FQSP/EgdESvKISgyThORd2/9oYX/oNxMEW9IYes?=
 =?us-ascii?Q?CD5NODbeG7ATDO1ki6q+89KQ3M/Mx6dvc6ELqpGN4WyBNSOVllwpRbYAbc7u?=
 =?us-ascii?Q?HhvB1dy2yJt8b7QyCcDzxxTcsaiaC1u04UaauzN0Vx4BMHchWr41Y9XkJFAS?=
 =?us-ascii?Q?+Cpu0UvgklkO46VQy/a7qX1N9KODxClV4H+VZ0WVA0EjkCav4DFCnnUrvqfW?=
 =?us-ascii?Q?LqLp10zjUWauIX1WnDz2Q2/C1TFedOYI3qKpIKceNQPwd7GqzLN4Z7F+V7lz?=
 =?us-ascii?Q?GOiOxUZvtgGC8Ftv8jeWC9CF3c1Dnv+LVIBgD2Lqu7tk6Se5q/CXoy1KGP+G?=
 =?us-ascii?Q?Xpvb28Hg0SuFVw+qTu7mnSnQTzRG6oGmXUgcSxPmpN0sLa81x6QjzqLbz7Eo?=
 =?us-ascii?Q?ImEsREzZs1qwCdOvnOARbHa3f+nfrnqcTIH2JcF3BV1236NG6Kp5b5pIZm6W?=
 =?us-ascii?Q?kAdO0B7OusCWYjKjyTjBBSof4Qp37fD4cq6g5Ft2jUCMLbzw4KyH4imwJY86?=
 =?us-ascii?Q?4uKtG0d1uS7/qUi5Jjvqco0wSmeiqXlQ3ac23VO173X8Jsf/lxiyYCMq6HQL?=
 =?us-ascii?Q?PRkWj1q0XVcc9vbiV65fwNedvTGeBpEP5jQLzPk3LQk1nBfm12Mex0RP2fvD?=
 =?us-ascii?Q?rif/8ZXzsv0YymV//qDe2YxtsmTg/lWk3CQQlHgMmLlryLkiW1bkx5NP1CJL?=
 =?us-ascii?Q?u0YSPBp+RuBod0kp+nHnAYEvuOSqe5GXDv3WnKwwIWGNzFLOHCghVMRYKlVd?=
 =?us-ascii?Q?yaOXEfNkSt8WCtJQQDhrsauuDk/2LZfYH+EmNFGBqkNpv9Hs6QpMEBQ6ZMUy?=
 =?us-ascii?Q?/Bb3JpbKL7UVWdT/5siQxCKXtFlm06qtvw9rlQL7v8oYgJNp+Z3OQ1B9GZNb?=
 =?us-ascii?Q?m3+TtJxM4V7fNWCx4EZ8LN52dJVA7axjl3FZ8of1/uhKC2lpxO8JKESAqadw?=
 =?us-ascii?Q?RtC1qHd2YRDzr0tAoWJ786uxLTopRt/+97BfosNeXpq1e8SYMsM1Ex4n4Zlu?=
 =?us-ascii?Q?eQbFmdorRqJDYpYrEzQi6uuGoT22OkOPBLGtINlEmRi/lJPJ9R5daQ8vm1mL?=
 =?us-ascii?Q?LJHPwelcAlIXNd0Hfm3Tdl5AFwwn1/+fkwf9SjZ3bxLfEMwv/H3YvtmA8yfD?=
 =?us-ascii?Q?oCUeZQtH5DXwPJzEBKV1LxrxlGcLalNelyUi/cQrBMbmJWaHZF83phmhe5jm?=
 =?us-ascii?Q?CPyDeHMJ70CzETUcDKsuZ/AxP9L7NpEUbXn0FagPfa17FiPnAsRDCEgWR4eD?=
 =?us-ascii?Q?R1pLRKP5x5EOUWywZ5HXKvWKjhrJmbJXUxbue7fT51lpyHQytX/Fh+Sprynw?=
 =?us-ascii?Q?MtfD/umnKMZ/r+xPHGrtMzHeJ9l63dHslj5iyjR52tR0F06uMns/chwW9OnK?=
 =?us-ascii?Q?/6ntnyHVLGsiKAa4pEo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d898f7e0-c99b-4090-b384-08dcef5d5b33
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2024 10:12:22.0827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kUG2N9mX70sJTI9NyF2sFGjL9jyn7uXuU/PU2U9Kmn2LhU8BvMhdC4DRFnnLLAAoaA+sQhsBcdSS7kB+WC4E0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8039


> From: Albert Esteve <aesteve@redhat.com>
> Sent: Thursday, October 17, 2024 12:34 PM
> Subject: [PATCH v3 1/1] virtio-media: Add virtio media device specificati=
on
>=20
> Virtio-media is an encapsulation of the V4L2 UAPI into virtio, able to vi=
rtualize
> any video device supported by V4L2
>=20
> Note that virtio-media does not require the use of a
> V4L2 device driver or of Linux on the host or guest side - V4L2 is only u=
sed as a
> host-guest protocol, and both sides are free to convert it from/to any mo=
del
> that they wish to use.
If it is v4l2, any reason to still call it virtio-media? How about virtio-v=
4l2 to describe what it is.

[..]
> +/* Header for all virtio commands from the driver to the device on the
> +commandq. */ struct virtio_media_cmd_header {
> +	u32 cmd;
> +	u32 __padding;
> +};
Please fix u32 to le32 here and all other places.

> +
> +/* Header for all virtio responses from the device to the driver on the
> +commandq. */ struct virtio_media_resp_header {
> +	u32 status;
> +	u32 __padding;
> +};
> +\end{lstlisting}
> +
> +A command consists of a command header
> \textit{virtio_media_cmd_header}
> +containing the following device-readable field:
> +
> +\begin{description}
> +\item[\field{cmd}] specifies a device request type (VIRTIO_MEDIA_CMD_*).
> +\end{description}
> +
> +A response consists of a response header
> +\textit{virtio_media_resp_header} containing the following device-writab=
le
> field:
> +
> +\begin{description}
> +\item[\field{status}] indicates a device request status.
> +\end{description}
> +
> +The status field can take 0 if the command was successful, or one of
> +the standard Linux error codes if it was not.
> +
> +\drivernormative{\paragraph}{Device Operation: Command Virtqueue:
> +Sessions}{Device Types / Media Device / Device Operation / Command
> +Virtqueue}
> +
> +Sessions are how the device is multiplexed, allowing several distinct
> +works to take place simultaneously. The driver needs to open a session
> +before it can perform any useful operation on the device.
> +
> +\paragraph{Device Operation: Open device}
> +
> +\textbf{VIRTIO_MEDIA_CMD_OPEN} Command for creating a new session.
> +
> +This is the equivalent of calling \textit{open} on a V4L2 device node.
> +The driver uses \textit{virtio_media_cmd_open} to send an open request.
> +
> +\begin{lstlisting}
> +struct virtio_media_cmd_open {
> +    struct virtio_media_cmd_header hdr; }; \end{lstlisting}
> +
> +The device responds to \textit{VIRTIO_MEDIA_CMD_OPEN} with
> \textit{virtio_media_resp_open}.
> +
> +\begin{lstlisting}
> +struct virtio_media_resp_open {
> +    struct virtio_media_resp_header hdr;
> +    u32 session_id;
> +    u32 __padding;
> +};
> +\end{lstlisting}
> +
I didn't read the spec fully but please explore admin commands as they offe=
r resource (session) create/destroy infrastructure already.
And v4l2 will get simplified a lot by reusing existing virtio admin framewo=
rk.


> +\begin{description}
> +\item[\field{session_id}] specifies an identifier for the current
> +session. The identifier can be used to perform other commands on the
> session, notably ioctls.
> +\end{description}
> +
> +\devicenormative{\subparagraph}{Device Operation: Open device}{Device
> +Types / Media Device / Device Operation / Open device}
> +
> +Upon success, the device MUST set a \field{session_id} in
> +\textit{virtio_media_resp_open} to an integer that is NOT used by any ot=
her
> open session.
> +
> +\paragraph{Device Operation: Close device}
> +
> +\textbf{VIRTIO_MEDIA_CMD_CLOSE} Command for closing an active session.
> +
> +This is the equivalent of calling \textit{close} on a previously opened
> +V4L2 device node. All resources associated with this session will be fre=
ed.
> +
> +This command does not require a response from the device.
> +
> +\begin{lstlisting}
> +struct virtio_media_cmd_close {
> +    struct virtio_media_cmd_header hdr;
> +    u32 session_id;
> +    u32 __padding;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{session_id}] specifies an identifier for the session to clo=
se.
> +\end{description}
> +
> +\drivernormative{\subparagraph}{Device Operation: Close device}{Device
> +Types / Media Device / Device Operation / Close device}
> +
> +The session ID SHALL NOT be used again after queueing this command.
> +
> +\paragraph{Device Operation: V4L2 ioctls}
> +
> +\textbf{VIRTIO_MEDIA_CMD_IOCTL} Command for executing an ioctl on an
> +open session.
> +
> +This command asks the device to run one of the `VIDIOC_*` ioctls on the
> +active session.
> +
> +\begin{lstlisting}
> +struct virtio_media_cmd_ioctl {
> +    struct virtio_media_cmd_header hdr;
> +    u32 session_id;
> +    u32 code;
> +    /* Followed by the relevant ioctl payload as defined in the macro
> +*/ }; \end{lstlisting}
> +
This maps to modify or it can be new command.

> +\begin{description}
> +\item[\field{session_id}] specifies an identifier of thesession to run t=
he ioctl
> on.
> +\item[\field{code}] specifies the code of the \field{VIDIOC_*} ioctl to =
run.
> +\end{description}
> +
> +The code is extracted from the
> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vi
> +deodev.html}{videodev2.h}, header file. The file defines the ioctl's
> +codes, type of payload, and direction. The code consists of the second
> +argument of the \field{_IO*} macro.
> +
> +For example, the \textit{VIDIOC_G_FMT} is defined as follows:
> +
> +\begin{lstlisting}
> +#define VIDIOC_G_FMT _IOWR('V',  4, struct v4l2_format)
> +\end{lstlisting}
> +
> +This means that its ioctl code is \textit{4}, that its payload is a
> +\textit{struct v4l2_format}, and that its direction is \textit{WR}
> +(i.e., the payload is written by both the driver and the device).
> +See Section \ref{sec:Device Types / Media Device / V4L2 ioctls / Ioctls
> +payload} for more information about the direction of ioctls.
> +
> +The payload layout is always a 64-bit representation of the
> +corresponding
> +V4L2 structure.
> +
> +The device responds to \textit{VIRTIO_MEDIA_CMD_IOCTL} with
> \textit{virtio_media_resp_ioctl}.
> +
> +\begin{lstlisting}
> +struct virtio_media_resp_ioctl {
> +    struct virtio_media_resp_header hdr;
> +    /* Followed by the ioctl payload as defined in the macro */ };
> +\end{lstlisting}
> +
> +\subparagraph{Ioctls payload}\label{sec:Device Types / Media Device /
> +V4L2 ioctls / Ioctls payload}
> +
> +Each ioctl has a payload, which is defined by the third argument of the
> +\field{_IO*} macro defining it.
> +
> +The payload of an ioctl in the descriptor chain follows the command
> +structure, the reponse structure, or both depending on the direction:
> +
> +\begin{itemize}
> +\item \textbf{_IOR} is read-only for the driver, meaning the payload
> +follows the response in the device-writable section of the descriptor ch=
ain.
> +\item \textbf{_IOW} is read-only for the device, meaning the payload
> +follows the command in the driver-writable section of the descriptor cha=
in.
> +\item \textbf{_IOWR} is writable by both the device and driver, meaning
> +the payload must follow both the command in the driver-writable section
> +of the descriptor chain, and the response in the device-writable section=
.
> +\end{itemize}
> +
> +A common optimization for \textit{WR} ioctls is to provide the payload
> +using descriptors that both point to the same buffer. This mimics the
> +behavior of
> +V4L2 ioctls where the data is only passed once and used as both input
> +and output by the kernel.
> +
> +\devicenormative{\subparagraph}{Device Operation: V4L2 ioctls}{Device
> +Types / Media Device / Device Operation / V4L2 ioctls}
> +
> +In case of success of a device-writable ioctl, the device MUST always
> +write the payload in the device-writable part of the descriptor chain.
> +
> +In case of failure of a device-writable ioctl, the device is free to
> +write the payload in the device-writable part of the descriptor chain
> +or not. Some errors may still result in the payload being updated, and
> +in this case the device is expected to write the updated payload. If
> +the device has not written the payload after an error, the driver MUST
> +assume that the payload has not been modified.
> +
> +\subparagraph{Handling of pointers in ioctl payload}
> +
> +A few structures used as ioctl payloads contain pointers to further
> +data needed for the ioctl. There are notably:
> +
> +\begin{itemize}
> +\item The \field{planes} pointer of
> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/bu
> +ffer.html#struct-v4l2-buffer}{struct v4l2_buffer}, which size is determi=
ned by
> the length member.
> +\item The \field{controls} pointer of \textit{struct
> +v4l2_ext_controls}, which size is determined by the count member.
> +\end{itemize}
> +
Can you please screen it through, and make sure that in this UAPI there is =
no u16/32/64 data type.
And all are leX or beX, to not assume any endianness between driver and dev=
ice?


> +If the size of the pointed area is determined to be non-zero, then the
> +main payload is immediately followed by the pointed data in their order
> +of appearance in the structure, and the pointer value itself is ignored
> +by the device, which must also return the value initially passed by the =
driver.
> +
> +\subparagraph{Handling of pointers to userspace memory}
> +\label{sec:Device Types / Media Device / V4L2 ioctls / Userspace
> +memory}
> +
> +A few pointers are special in that they point to userspace memory in
> +the original V4L2 specification. They are:
> +
> +\begin{itemize}
> +\item The \field{m.userptr} member of \textit{struct v4l2_buffer} and
> +\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/bu
> +ffer.html#struct-v4l2-plane}{struct v4l2_plane} (technically an unsigned=
 long,
> but designated a userspace address).
> +\item The \field{ptr} member of \textit{struct v4l2_ext_ctrl}.
> +\end{itemize}
> +
> +These pointers can cover large areas of scattered memory, which has the
> +potential to require more descriptors than the virtio queue can
> +provide. For these particular pointers only, a list of \textit{struct
> +virtio_media_sg_entry} that covers the needed amount of memory for the
> +pointer is used instead of using descriptors to map the pointed memory
> directly.
> +
> +\begin{lstlisting}
> +struct virtio_media_sg_entry {
> +	u64 start;
> +	u32 len;
> +	u32 __padding;
> +};
> +\end{lstlisting}
> +
> +For each such pointer to read, the device reads as many SG entries as
> +needed to cover the length of the pointed buffer, as described by its
> +parent structure (\field{length} member of \textit{struct v4l2_buffer}
> +or \textit{struct v4l2_plane} for buffer memory, and \field{size}
> +member of \textit{struct v4l2_ext_control} for control data).
> +
> +Since the device never needs to modify the list of SG entries, it is
> +only provided by the driver in the device-readable section of the
> +descriptor chain, and not repeated in the device-writable section, even =
for
> WR ioctls.
> +
> +\subparagraph{Unsupported ioctls}
> +
> +A few ioctls are replaced by other, more suitable mechanisms.
> +
> +\begin{itemize}
> +\item \textit{VIDIOC_QUERYCAP} is replaced by reading the configuration
> +area (see \ref{sec:Device Types / Media Device / Device Configuration
> Layout}).
> +\item \textit{VIDIOC_DQBUF} is replaced by a dedicated event (see
> +\ref{sec:Device Types / Media Device / Device Operation / Dequeue buffer=
}).
> +\item \textit{VIDIOC_DQEVENT} is replaced by a dedicated event (see
> +\ref{sec:Device Types / Media Device / Device Operation / Emit an event}=
).
> +\item \textit{VIDIOC_G_JPEGCOMP} and \textit{VIDIOC_S_JPEGCOMP} are
> +deprecated and replaced by the controls of the JPEG class.
> +\item \textit{VIDIOC_LOG_STATUS} is a driver-only operation and shall
> +not be implemented by the device.
> +\end{itemize}
> +
> +\devicenormative{\subparagraph}{Device Operation: Unsupported
> +ioctls}{Device Types / Media Device / Device Operation / Unsupported
> +ioctls}
> +
> +If being requested an unsupported ioctl, the device MUST return the
> +same error response as it would for an unknown ioctl, i.e. \textit{ENOTT=
Y}.
> +
> +\paragraph{Device Operation: Mapping a MMAP buffer}
> +
> +\textbf{VIRTIO_MEDIA_CMD_MMAP} Command for mapping a MMAP
> buffer into
> +the driver's address space.
> +
> +Shared memory region ID 0 is used to map MMAP buffers with the
> +\textit{VIRTIO_MEDIA_CMD_MMAP} command.
> +
> +\begin{lstlisting}
> +#define VIRTIO_MEDIA_MMAP_FLAG_RW (1 << 0)
> +
> +struct virtio_media_cmd_mmap {
> +	struct virtio_media_cmd_header hdr;
> +	u32 session_id;
> +	u32 flags;
> +	u64 offset;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{flags}] is the set of flags for the mapping.
> +\field{VIRTIO_MEDIA_MMAP_FLAG_RW} can be set if a read-write mapping
> is
> +desired. Without this flag the mapping will be read-only.
> +\item[\field{offset}] corresponds to the \field{mem_offset} field of
> +the \textit{union v4l2_plane} for the plane to map. This field can be
> +obtained using the \textit{VIDIOC_QUERYBUF} ioctl.
> +\end{description}
> +
> +The device responds to \textit{VIRTIO_MEDIA_CMD_MMAP} with
> \textit{virtio_media_resp_mmap}.
> +
> +\begin{lstlisting}
> +struct virtio_media_resp_mmap {
> +    struct virtio_media_resp_header hdr;
> +    u64 offset;
> +    u64 len;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{offset}] offset into SHM region ID 0 of the start of the ma=
pping.
> +\item[\field{len}] length of the mapping as indicated by the
> +\textit{struct v4l2_plane} the buffer belongs to.
> +\end{description}
> +
> +\paragraph{Device Operation: Unmapping a MMAP buffer}
> +
> +\textbf{VIRTIO_MEDIA_CMD_MUNMAP} Unmap a MMAP buffer previously
> mapped using \field{VIRTIO_MEDIA_CMD_MMAP}.
> +
> +\begin{lstlisting}
> +struct virtio_media_cmd_munmap {
> +    struct virtio_media_cmd_header hdr;
> +    u64 offset;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{offset}] offset into SHM region ID 0 previously returned
> +by \textit{VIRTIO_MEDIA_CMD_MMAP} at which the buffer has been
> previously mapped.
> +\end{description}
> +
> +The device responds to \textit{VIRTIO_MEDIA_CMD_MUNMAP} with
> \textit{virtio_media_resp_munmap}.
> +
> +\begin{lstlisting}
> +struct virtio_media_resp_munmap {
> +    struct virtio_media_resp_header hdr; }; \end{lstlisting}
> +
> +\devicenormative{\subparagraph}{Device Operation: Unmapping a MMAP
> +buffer}{Device Types / Media Device / Device Operation / Unmapping a
> +MMAP buffer}
> +
> +The device MUST keep mappings performed using
> +\textit{VIRTIO_MEDIA_CMD_MMAP} valid until
> +\textit{VIRTIO_MEDIA_CMD_MUNMAP} is called, even if the buffers or
> session they belong to are released or closed by the driver.
> +
> +\paragraph{Device Operation: Memory Types}
> +
> +The semantics of the three V4L2 memory types (\textit{MMAP},
> +\textit{USERPTR} and \textit{DMABUF}) can easily be mapped to both drive=
r
> and device context.
> +
> +However, the driver shall only advertise support for \textit{MMAP} and
> +\textit{DMABUF} to the guest userspace. \textit{USERPTR} is merely
> +employed to discern \textit{GUEST_PAGES} buffers, similar to how
> +\textit{DMABUF} is used to signify \textit{VIRTIO_OBJECT} buffers in the
> driver and device context.
> +
> +\subparagraph{MMAP}
> +
> +In virtio-media, \textit{MMAP} buffers are provisioned by the device,
> +just like they are by the kernel in regular V4L2. Similarly to how
> +userspace can map a \textit{MMAP} buffer into its address space using
> +mmap and munmap, the virtio-media driver can map device buffers into
> +the driver space by queueing the \textit{struct virtio_media_cmd_mmap}
> +and \textit{struct virtio_media_cmd_munmap} commands to the
> commandq.
> +
> +\subparagraph{GUEST_PAGES}
> +
Please change the notion from guest/host to device/driver respectively.

> +In virtio-media, \textit{GUEST_PAGES} buffers are provisioned by the
> +driver, and use guest physical addresses. Instances of \textit{struct
> +v4l2_buffer} and \textit{struct v4l2_plane} of this type are followed
> +by a list of \textit{struct virtio_media_sg_entry}. For more
> +information, see \ref{sec:Device Types / Media Device / V4L2 ioctls /
> +Userspace memory}
> +
> +The device must not alter the pointer values provided by the driver, i.e=
.
> +\field{the m.userptr} member of \textit{struct v4l2_buffer} and
> +\textit{struct v4l2_plane} must be returned to the driver with the same
> +value as it was provided.
> +
> +\subparagraph{VIRTIO_OBJECT}
> +
> +In virtio-media, \textit{VIRTIO_OBJECT} buffers are provisioned by a
> +virtio object, just like they are by a \textit{DMABUF} in regular V4L2.
> +Virtio objects are 16-bytes UUIDs and do not fit in the placeholders
> +for file descriptors, so they follow their embedding data structure as
> +needed and the device must leave the V4L2 structure placeholder
> unchanged.
> +
> +Contrary to \textit{USERPTR} buffers, virtio objects UUIDs need to be
> +added in both the device-readable and device-writable section of the
> descriptor chain.
> +
> +Device-allocated buffers with the \textit{V4L2_MEMORY_MMAP} memory
> type
> +can also be exported as virtio objects for use with another virtio
> +device using the \textit{VIDIOC_EXPBUF} ioctl. The fd placefolder of
> +\textit{v4l2_exportbuffer} means that space for the UUID needs to be
> +reserved right after that structure
> +
> +\subsubsection{Event Virtqueue}
> +
> +Events are a way for the device to inform the driver about asynchronous
> +events that it should know about. In virtio-media, they are used as a
> +replacement for the \textit{VIDIOC_DQBUF} and \textit{VIDIOC_DQEVENT}
> +ioctls and the polling mechanism, which would be impractical to implemen=
t
> on top of virtio.
> +
> +\paragraph{Device Operation: Event header}
> +
> +\begin{lstlisting}
> +#define VIRTIO_MEDIA_EVT_ERROR 0
> +#define VIRTIO_MEDIA_EVT_DQBUF 1
> +#define VIRTIO_MEDIA_EVT_EVENT 2
> +
> +/* Header for events queued by the device for the driver on the eventq.
> +*/ struct virtio_media_event_header {
> +    u32 event;
> +    u32 session_id;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{event}] one of \field{VIRTIO_MEDIA_EVT_*}.
> +\item[\field{session_id}] ID of the session the event applies to.
> +\end{description}
> +
> +\paragraph{Device Operation: Device-side error}
> +
> +\textbf{VIRTIO_MEDIA_EVT_ERROR} Upon receiving this event, the session
> +mentioned in the header is considered corrupted and automatically
> +closed by the device.
> +
> +\begin{lstlisting}
> +struct virtio_media_event_error {
> +    struct virtio_media_event_header hdr;
> +    u32 errno;
> +    u32 __padding;
> +};
Mostly you wont need padding once you move to admin commands, but wherever =
applicable, please convert into reserved field in the name.
So, it can be used in future. Converting reserved to meaningful is doable c=
ompared to padding constant bytes.
