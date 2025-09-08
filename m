Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013059.outbound.protection.outlook.com [52.101.72.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1253318AFF
	for <virtio-comment@lists.linux.dev>; Mon,  8 Sep 2025 17:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757350914; cv=fail; b=RuDBvYCEc5ETlngElbsnxii2ShQz62bDDSxbQAeAylKMfuQsoa/lFoWsB1AEk4vudj30j9idgL8KxmyzP4dw8HStquPigZFnwA2EGZF17k9Wd4C4K44xs8/2BBsVdZ7mQT0ioDUhYqHOHbOkZ+kRM3DYA7ng+4HDGx2k72YGCPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757350914; c=relaxed/simple;
	bh=KtN1aVZ8n4ZDRvDZVOo3Jm1wqNf2wjFXKcevHHimU/8=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OKxf08i1mCx/Q9GjwyYg3P4os84FsNkl+ZdnLxCczP0qtVxVaXARV/FqJ81mT8Y58FJPjQhjYku1s6+/z0dEF0JRA/DHfOpksbDWQwT+fOZH66639ylnAUew3xJU2XCxSrTJHznPUg04PbAsIvptF+CrowUC8AVI0fVuYutCq4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=YXEpXSET; arc=fail smtp.client-ip=52.101.72.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="YXEpXSET"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUgktOe90nhlUEZ1ntilz7ZfA0g0Rh7Wv25MfwWRTs5kce3O6vOwtwH/ReitAqmC0+6RZDrayjm1zUlJBJMEGxh0yOCidpqgNmYKDYzhbjyf39j8fEstvaxqLXj6V20I6SQpvVaUANbBuAl16oc994uiTnjEWxLgTN5aKokYAYr9M+bp+F8/sF6W9rjvetC0M0YEto3bmRUNaD2d2FA5wft2DQfWT85Nel6XE7hl3Moc3QcZ9qtYJ39JAK/tMHckz20qBfcCqFMepSfCaAwNGbrAzDJLAPskF8LsStrTn9zrAx1sHcnXmZPyfzW2+ff5ohSLy99gPqgzUJZEl84Xxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAgaroVIiioAL80cSvv8YkJTAhjW3MMoC6XDBQbMtF8=;
 b=mBSHkv45TZP6HExl6BXZjlo7GHogbP6IreSFivrPVduPKqUAFTVaLf7Hww1y3BNqDZON5mnqA/xdjncTgeAH1/AaFiVg6bNxH9p7ZHh0/vs5JuALdDYBKsVjVZ+IwYHq1qNBLMLs6P0D2JphUxVKXaFs7AZjbdqeSUlRU90j/pJgndF6I5mnX08gUo1jG9jb/Lql8ZoFggmwAkSswBnDAc7kwcpydN1Pp5LAoQOxCkeOjdJ7w2PMueA4EzW5v5sZYoWSPENE+PieEfGo6GIUNUeVyWiQRIMHELvBJjecp63mEO2WXxsWxnkLT/yNQNOOlvhPN/ZZqhtifJRbElEk5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass action=none
 header.from=nokia-bell-labs.com; dkim=pass header.d=nokia-bell-labs.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAgaroVIiioAL80cSvv8YkJTAhjW3MMoC6XDBQbMtF8=;
 b=YXEpXSETfZUhoa4PvTXVhkfGmHgY1Yx8nZ6BNDOBvj2kHR+G+9MnfkTePTX6IUKaMk808ElWwyD2SR9bDxjWl3cqT9QrQTPrmrBSA3FdS5nlnqQzCgKcO3FjSW/mmnGHIUY9us55R2yVUbKYCmgHMaQgWjM5jXGFV43Ukdd1/kuAwjXbrraqN/7jta/hhCVdLr5rpkTsygZI+QQNMMyoTgZKS6rtl5E9s6r4WeusPSGQsa3XrjIyxtYQvX4EMNNrJxLsyOor5UqmNu7j9UgtbCOANHQtZcWnRTN0RXU/Qjy1AKy4W49mZwv2iY+Whc2pYDp9DVh0nFhv1D5b+mUTqQ==
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com (2603:10a6:102:133::12)
 by PA4PR07MB8696.eurprd07.prod.outlook.com (2603:10a6:102:265::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 17:01:48 +0000
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56]) by PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56%2]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 17:01:48 +0000
From: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
To: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
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
Subject: RE: [PATCH v10 0/2] Update ECN (RFC3168) and Add Accurate ECN
 (RFC9768) feature
Thread-Topic: [PATCH v10 0/2] Update ECN (RFC3168) and Add Accurate ECN
 (RFC9768) feature
Thread-Index: AQHcIOJD894F/xx4g0KgJPiCCFjcTw==
Date: Mon, 8 Sep 2025 17:01:48 +0000
Message-ID:
 <PAXPR07MB7984E41B6DDA5416F6B9067BA30CA@PAXPR07MB7984.eurprd07.prod.outlook.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
 <PAXPR07MB7984E74ECF19E28F857E7AA4A331A@PAXPR07MB7984.eurprd07.prod.outlook.com>
In-Reply-To:
 <PAXPR07MB7984E74ECF19E28F857E7AA4A331A@PAXPR07MB7984.eurprd07.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-bell-labs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB7984:EE_|PA4PR07MB8696:EE_
x-ms-office365-filtering-correlation-id: 34e9fdad-c101-45bd-ef89-08ddeef9664b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018|921020|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?xPFeX462UvpfjIs6VXmg1h78+vLD62KHrmqTRHPEX+ylhGX3dS4atj9xx2nP?=
 =?us-ascii?Q?l0Jj+y5EFHuYMZ+jvp6eDcp6SF9m8h0DqxZ2zHoos0wpn+FffZM7fqBszyQz?=
 =?us-ascii?Q?Kx8Gl48S0FbLN2wTvepgZ/gifeFc6Zwsi7qX9BusT1551oYzDcDfEF4Fsehx?=
 =?us-ascii?Q?7RLMZ0pHryPwhKeHovnJ/PLg1Jn04iE+TV9A6JinGpJU6j+fRzeg+pl2fshL?=
 =?us-ascii?Q?nRi/lj1rw54bXmiDE1UPOogpb1anr4gRUUS8lSMY6ygzrDd9IZ51nir5jDMy?=
 =?us-ascii?Q?Cq4WZVVvj4+5MIqYo+MpWqP6WrtxMyz9Fc8IqZaWgB5VlHKiy0UYLgXizEGA?=
 =?us-ascii?Q?y8MXXkhKTFRZMRGPZvc9JVDoPV9VM5S/WsFkuxI5zrLj7QHisW452aR8ziJD?=
 =?us-ascii?Q?PLwF5wV6/WeLZWP8a3HTzQzQAanqyw5utKy+UxCt0PKNM2cx+bT1XqYZC4ya?=
 =?us-ascii?Q?ayKW6oQNYeWsbBxxXeKnA4clgJldcSvmp4Pbv/BOqIsZiCyc94cUaczUs+u0?=
 =?us-ascii?Q?du752X/nIJ+l7cYDsMR2dYZ3wXhWl+PqzXhjUL5JEKwibv+IyJop1lZEOFNp?=
 =?us-ascii?Q?c3U7W55KMlDnNdkA2KOIl5SuOcqq5U9miSWwnReZs64kh+6Uiml0j/Q5zTgt?=
 =?us-ascii?Q?iEyQwVj/hyPlS+TX5Qdkwy1leYalrRZpfg1QnBVcBEzQes9unzZh4O2c/JHK?=
 =?us-ascii?Q?4/qGmHuI8YnPdQ4z6ofoM4aX9qS0wlAqGcps8HnEHs/Mqa8p7+eyIgJsUCSj?=
 =?us-ascii?Q?g4wOFKL/CUy617bKUgrJqHr2aHjB4p4aufJ/3Prj82TYa05NVnBIaPScjdRh?=
 =?us-ascii?Q?27XsqlNviDZwtjA95nyW0qx3u2yoWkao+YreUGYqz3d3mrbvwd+lb3r0xyIi?=
 =?us-ascii?Q?BidJYtBTCf2w1rCIwHGBEFuk6Rh41A2+18JvNcxsHTxaHZKol6TvMuh63VQH?=
 =?us-ascii?Q?d9e0y0uC24eabNLU4LF08mz/PV+5fKXfVNrfw3H12T8BrbN9Sga4zVDzXLuH?=
 =?us-ascii?Q?7hhhYbFXCOo4NEKfv9bADhjDfEy+478QFQSv6Qdolr1EmL9w9cpV5AgsZQZR?=
 =?us-ascii?Q?w5440OjxUkraEs6n1ChiWRDSPEJI6RNBRnSzSWqQHe2TSOQuEmf3YtoUyr2R?=
 =?us-ascii?Q?PYA0wbXMjK73J3JdgZI9ihb0feiQPPGRbGIpanNNSPAkHBw5KrRJPU1Cam1r?=
 =?us-ascii?Q?V0Eq7Yju40Te1JLLJbG9PuqH65Wa9o4RhK14A4vu0MvMOeJll21vTuty1gRx?=
 =?us-ascii?Q?FVB49HIsTzkVQnxZCF3VabV3sVrhhRZP5BD8XVOCn3hclcWFmAaCJOXuCtFY?=
 =?us-ascii?Q?1Y6RsU/D4aMD3ynKQiGqrIqnJx5yTIeQp7LdCNJJiKBvUtL7KllQtEguxKC2?=
 =?us-ascii?Q?R4ph1REF/U/BekC8TJ57iJFUm00dgoUwuWHLww2xknW4j6tHSsS6B1OZ15LD?=
 =?us-ascii?Q?eKRB+oMqQrEho9ADc8zhADjDgjjkN/H9EAh26F9bhc8bC+hwYPRc7oXFj5GU?=
 =?us-ascii?Q?jiTBulSo8Dt0LrXBurbozJPV3hapamqJKl7e?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB7984.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018)(921020)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qHv486Bq0IzOt5+60KJbUVRST6u/KG4aNt7jwYwYQKs6ajUepB2RCH9LwXRb?=
 =?us-ascii?Q?3tF3OZ5O6DH91mnxiRZascqMLoTwXDZH2WDBMY2o+KrYYRkFvFLUeILPiThH?=
 =?us-ascii?Q?pbmVlOVj6Oc47/AHimZEH8ztDX2kp08FG3jNBV8VTMGM06klNBq9779JnoLk?=
 =?us-ascii?Q?wAfD3T6PK5RXkQajPx8h0o9awc/0/XKBnVtMoDyR6ARJGQ50cxc4TF8IKb7Q?=
 =?us-ascii?Q?Bb37zgZxTgB1hHBqrDBA2M9X3WxL6Kopwhr3klqQ5nWahHQwL8jp+5z1w8ZH?=
 =?us-ascii?Q?UOiCWn7DiXwwDY2mOXIVxUDmSqe74DHhS/XC8JM+Mi7lN+NCxPDO1vC+ZHq+?=
 =?us-ascii?Q?ZD1sGfZU9stylMzClGSHDJkAkdcRaOGrzG3OE5pz9Ix1OVWx/5aJDOcO3kwc?=
 =?us-ascii?Q?o7xwag+0mvRfK9F2Vr6cDJJr5f11HiTwXH+29y0tBURi0xmzdlDLkpg5+7qs?=
 =?us-ascii?Q?zQvGpRekEqI4S3gDdk1mBfOCVsQvhAb1iDxDTV9LEtjyM1S45t9qG5Swoq0s?=
 =?us-ascii?Q?lx4DYdNqJ/U0brXx68zI5ql2lmjcIUbxopUqy3u1J3PSjeu93WB4aKpMC3XQ?=
 =?us-ascii?Q?/7zXjassPdROJlTBoO5TEbOEceMp+Se1oUPZcD24k6aYP7NdA6OeoDsnKnhx?=
 =?us-ascii?Q?h/G6NVHYmSxRVHK0/dXVwtrrFi6E/rdwTwoYYcswtKCNwVbqA4iJVc37Knk5?=
 =?us-ascii?Q?f1fwtKF6RC+I3mKRqCv7/M7EJjhwtusp5opzYNPMj48xhUTLeiR1Dvjxxcol?=
 =?us-ascii?Q?SnB9pXqbL1t9kV0XRRTj4Eu3Ek8Gpveg9FeYZzvqsG0shj0czFxBxFU7EZdm?=
 =?us-ascii?Q?ObGJG9Hf/9NvwYrJ227aX/Jght+RWuIjOHirE8y4nrCUmkUKFLKlXHeIljef?=
 =?us-ascii?Q?dVQRaLjH+XStCG2V4XdXEnhdbsHBYhsTp6TZzN4lwmh3Z78OMVmG6Yqug5sh?=
 =?us-ascii?Q?pfBu3a12UfXZMKu8KESXcIHfiNaAEAjmjy2fSVHmorRzJJmN04gY7xAfEuSZ?=
 =?us-ascii?Q?ZoonXHcw0qJY20JBL86d0Qcj2aaoX305JHRQZV5XgiG2KuwQF7s4DhTQFfAt?=
 =?us-ascii?Q?boXBpd3IKpGnr/WtogP3ZL1kLV/N/pJ8IiB6rv7zZlmpGzS3B6aHYnrml3tX?=
 =?us-ascii?Q?12hbe0BUk1Ye0DPnuFly+6U8WzTiiUYfjlWAX9FMi7MdhnjPqMPVMIaS4B0z?=
 =?us-ascii?Q?YOvKVbI0nKJeltIS/WpaF022J4tE3CGmTsblSVbejtS1mqS/tRpUad4psJWl?=
 =?us-ascii?Q?KaFaGKd8G9l8d3F6yhKrLHNaddZbR5aPPbd1D5e1yL8BfMPd2fR0Z9UeSQlE?=
 =?us-ascii?Q?ZYrGdLOz831cP1KXKkzpSyiyzH+HzU4OjWdFxLcjTA+bGpMdSG50srPS5X0Z?=
 =?us-ascii?Q?wAqfVW7zeOaZvOgLjk+omzOgJU+hmI2j5WedvJfJcw/S96nnsoFU0NDO2F+t?=
 =?us-ascii?Q?KUNeM70QfW4u42mPdOavKntc7oozCH8u3saLT9mAa1n4d0gzWUfBeX9O2Wu0?=
 =?us-ascii?Q?caRhYBt5X5iJjVoU5TTjQAc0X3vcJpbNeBU240t34WU3Z1AL4cV+Q5F/BCMe?=
 =?us-ascii?Q?+MIKDAjlqoSji1ltAP8KYfu7YbfvWSox40fqBiYT+ZpiRl97dhLyTwz8+eVx?=
 =?us-ascii?Q?fA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR07MB7984.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e9fdad-c101-45bd-ef89-08ddeef9664b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2025 17:01:48.6540
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GXwd3xvgK+T4ZCP/5fH3/71k0SZz13EVLcjtdXW3iCY0IkA/uqKAgPo7o5XRqShf48IEI5hisieo4mgbLEJSi24caka/PFgAW+Lm4+df0+9aK32WS1Cwn01qAb3jXsYh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB8696

> -----Original Message-----
> From: Chia-Yu Chang (Nokia)=20
> Sent: Monday, August 18, 2025 4:52 PM
> To: chia-yu.chang@nokia-bell-labs.com; virtio-comment@lists.linux.dev; ms=
t@redhat.com; cohuck@redhat.com; mvaralar@redhat.com; jasowang@redhat.com; =
xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij@kernel.org; ncardwell@g=
oogle.com; Koen De Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>;=
 g.white@cablelabs.com; vidhi_goel@apple.com; ingemar.s.johansson@ericsson.=
com; mirja.kuehlewind@ericsson.com
> Subject: RE: [PATCH v10 0/2] Update ECN (RFC3168) and Add Accurate ECN (R=
FC9768-to-be) feature
>=20
> > -----Original Message-----
> > From: chia-yu.chang@nokia-bell-labs.com <chia-yu.chang@nokia-bell-labs.=
com>=20
> > Sent: Thursday, August 14, 2025 2:01 PM
> > To: virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com; =
mvaralar@redhat.com; jasowang@redhat.com; xuanzhuo@linux.alibaba.com; epere=
zma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De Schepper (Noki=
a) <koen.de_schepper@nokia-bell-labs.com>; g.white@cablelabs.com; vidhi_goe=
l@apple.com; ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.co=
m
> > Cc: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > Subject: [PATCH v10 0/2] Update ECN (RFC3168) and Add Accurate ECN (RFC=
9768-to-be) feature
> >=20
> > From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> >=20
> > Hello,
> >=20
> > Please find ECN and AccECN patch v10, which aligns ECN functionality wi=
th
> > RFC3168 ECN, and adds Accurate ECN feature. The Accurate ECN draft can =
be found in https://datatracker.ietf.org/doc/html/draft-ietf-tcpm-accurate-=
ecn-34.
> > And the Accurate ECN draft will become RFC9768.
> >=20
> > Best Regards,
> > Chia-Yu
> >=20
> > ---
> > v10 (14-Aug-2025)
> > - Update AccECN reference and it will become RFC9768.
> >=20
> > v9 (19-May-2025)
> > - Update descriptions for VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_HOST_ECN=
, VIRTIO_NET_F_GUEST_ACCECN, VIRTIO_NET_F_HOST_ACCECN (Michael S. Tsirkin <=
mst@redhat.com>)
> > - Add reference sections of RFC3168 ECN and AccECN (Michael S. Tsirkin =
<mst@redhat.com>)
> >=20
> > v8 (17-Apr-2025)
> > - Further typo fixing
> >=20
> > v7 (15-Apr-2025)
> > - Fix typos in AccECN patch (Michael S. Tsirkin <mst@redhat.com>)
> >=20
> > v6 (14-Apr-2025)
> > - Shrink descriptions and make more reference to RFC3168 ECN and AccECN
> >=20
> > v5 (06-Mar-2025)
> > - Update feature bits of VIRTIO_NET_F_HOST_ACCECN(69) and VIRTIO_NET_F_=
GUEST_ACCECN(70)
> >=20
> > v4 (05-Mar-2025)
> > - Update commit message of AccECN patch
> > - Add reference to RFC3168 ECN and Accurate ECN
> > - Simplify feature bit descriptinos to avoid duplication of text
> >=20
> > v3 (21-Feb-2025)
> > - Separate the original patch into 2 different patches
> > - Fix several reabase issues in v2
> >=20
> > v2 (17-Feb-2025)
> > - Rebase the patch on top of v1.4 virtio-spec
> >=20
> > ---
> > Chia-Yu Chang (2):
> >   virtio-net: Fix ECN feature descriptions
> >   virtio-net: Define Accurate ECN feature in virtio-spec
> >=20
> >  device-types/net/description.tex | 83 +++++++++++++++++++++++---------
> >  introduction.tex                 |  6 +++
> >  2 files changed, 65 insertions(+), 24 deletions(-)
>=20
> Hello,
>=20
> A Github issue is created for this patch series.
>=20
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/232
>=20
> Best regards,
> Chia-Yu

Hello,

Since there are some weeks passing by, just want to check is there any upda=
te on the voting for this patch series?

Or do we need to make more changes?

Best regars,
Chia-Yu
