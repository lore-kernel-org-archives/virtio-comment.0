Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2065.outbound.protection.outlook.com [40.107.241.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74B926FDA7
	for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 15:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745853095; cv=fail; b=Wlqi3+mduAEm62MXiJ+kixjGO3TKrCW5BPm7mQKq23SNSyb2uEq0I1SnTIRTYQSFhr/XYLMaOxgu5FRLENXjOiBizF779mX0gVxtQNhg9qaWDalhD/zPkV4/BqcjP/ik8/CR6BWA9X0Z13CyWcJHSaSuLahPgsfqPEQD4P5f/M4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745853095; c=relaxed/simple;
	bh=JCTw7Sdc/DWQQM/GCK5P1+PTfFY/x5ZQZ3AcOm/xzo4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qMx2O39Ys943m8rw899lCdPXArkvNSpq62VQ/lGzmCMKZd4YRKAQApDoXL6HpDQLA98Qas0QArQT64OiTlOx3np78e6sIX46aUrSj+7HBXqm7qwk3NcjRJ08A9zmVKm/gPIUimFR5impLGe1wfsEqNG8yH/CAhHQyJbcvfK0yTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=Gq7e9juh; arc=fail smtp.client-ip=40.107.241.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="Gq7e9juh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2oGEqyth9vVWLHA05Mk09Hu9+rjdO8zyqdkYL9hLvBXea1NEHO6rqlxE3Py2En99MmjqSoXlmx6Dck1DXwNgYy/sHrlY3g01qp3moVYSGJ7jr3xz2owyOcPahN2X6hYa91qf6BNn1bdGaekcpJ40H8//k44yOQrEMjSI7Q6IItxSU7qUywJqjVnmJuUJjT/YI6CpGh0pjGNurLtnzoxCFjR6b+4uHbsX51BDW3CqbFo1UX3vCi/jp8ih8tLwPnq0XCYbDcQiFcocLffttLCs9P5zMpYbkWDB5bMQJCUQEA/RRQKZMmmsg4DXa4/kEcRfw3VSLxK6UUIBOjRwRPr9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReThRudn/SJpWpoa9DZOzoUBXa3aVck1FnzbmJRcIso=;
 b=K9EDff0YAoXnw39uu+3OQE458TYR2V3jSSC0SvEWDFyi0Mqc/kV8HEOkA4bw7rZxsNiDzd8LXMaaHsOjqqVe813iy+ubXwtcr6Tn00/ldazAHv3iXKuX0Dt87uj10a8BRDEM2xaEnGqI9h0xbQ5H3onbUvJsuBOIUT7k9KOyy1ebZB8hJhiBuzOH9VRgka+vjLRW0MR/txIcCeMjtYz7CaoiRKJCj1bJD8PSmblUrOe6xJhC8zl9Y8Ociz1KqQ7gymLKwU/gUxG67pVy00+z4uIyAH+tSxA56iLRwgOgFUi+URjWN2WGJ2yei6cfDlpLP7RB6Gk+TFUz+iDX1qwsaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass action=none
 header.from=nokia-bell-labs.com; dkim=pass header.d=nokia-bell-labs.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReThRudn/SJpWpoa9DZOzoUBXa3aVck1FnzbmJRcIso=;
 b=Gq7e9juhdIU025YqTbUoQZUIa/xJ7QtlsqqmreOIsv10YL/ugi9y6DLjz4I+57L7I/oJp4+u435mCQRtulSFv9+phVlx4RQPT8+Gu8FAgidDiYpo3kkHkRu6c1Go6oYPE712DtbDgHAOLeiVNCDQqLQC7hXpnO/euAGodRYfPmY+Vg/1BNA7oBzonF2dF6+VPwvUKB9ZslwwZctTuA8DtP/gEeV+Y2WJdYs8SIpAH2fKvzsS6jCMWIzvy2KDsUmMpzpfoz0zmpDxNnqSzEVjCX+HZNcGjqzGlZHQINJ6hlYa/qm7wzPodlHHRntJ/UGGkifkg1Fgp+uVl4tbZgxS5g==
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com (2603:10a6:102:133::12)
 by AS4PR07MB9611.eurprd07.prod.outlook.com (2603:10a6:20b:4f7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 15:11:26 +0000
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56]) by PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56%2]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 15:11:25 +0000
From: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>, "ij@kernel.org" <ij@kernel.org>,
	"ncardwell@google.com" <ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, g.white <g.white@cablelabs.com>,
	vidhi_goel <vidhi_goel@apple.com>, "ingemar.s.johansson@ericsson.com"
	<ingemar.s.johansson@ericsson.com>, "mirja.kuehlewind@ericsson.com"
	<mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v8 1/2] virtio-net: Fix ECN feature descriptions
Thread-Topic: [PATCH v8 1/2] virtio-net: Fix ECN feature descriptions
Thread-Index: AQHbr+nHHUWCFh3PhE6DeEzOkmTDZbO4xyOAgAAbXYCAADDbgIAAKxyQ
Date: Mon, 28 Apr 2025 15:11:25 +0000
Message-ID:
 <PAXPR07MB7984627B11C4528429AD5F99A3812@PAXPR07MB7984.eurprd07.prod.outlook.com>
References: <20250417224044.21348-1-chia-yu.chang@nokia-bell-labs.com>
 <20250417224044.21348-2-chia-yu.chang@nokia-bell-labs.com>
 <20250428034815-mutt-send-email-mst@kernel.org>
 <PAXPR07MB798444A55878297F8A0D1E64A3812@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <20250428082427-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250428082427-mutt-send-email-mst@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-bell-labs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB7984:EE_|AS4PR07MB9611:EE_
x-ms-office365-filtering-correlation-id: 8c0d4163-436b-4481-a975-08dd8666f16c
x-ld-processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?EYnTPUR0NkA+1KldFefyEdsSpw9qFp5xU/bwRM+Ky9u4tWTPXx0xjPg6HR96?=
 =?us-ascii?Q?8uF0sInDIydTTEJZf8VaB5DMOhLAUJdZenocN2Lm3Kbv5qJjqZlrroowVYR8?=
 =?us-ascii?Q?7EGXZIGSuZUuXdvr0HjcRUNeL/QOPHHlOulvmneodyyLwkJNGb5NJDeMEigj?=
 =?us-ascii?Q?tKnkcgRx8O0XP902Vp51IDfso7UCiitDWqGHetM54UTFz6szgCBbblIoRO1R?=
 =?us-ascii?Q?fXEzWDf7b2CFFvG8u8UgLoYkXaBLrtJ8hA7Bi5Z6Gyj4NK8ZHrXcjiBwiOzz?=
 =?us-ascii?Q?RcfEFllIMj7xF/jpjSFDLRYETE5MQUpz4TVia5+HULOqBFbfUeiVj9wHwkpd?=
 =?us-ascii?Q?gMBc5azppTv9yvCFNKe1YDNV0PQRAkQO6j+88Gwz81FqcTJGfUCi4nb3LP3a?=
 =?us-ascii?Q?y+JvwQeUQyKXvF/om00WE+VbbQqLKOBfA3myON6k/FdWK2yFD4ZG7zbLRiU5?=
 =?us-ascii?Q?QCgGUPNc5E4ZAXQnRXrTOAkOgz3DWZ7N0n2Dsq46mimYCyrR+GXMLd/Un3js?=
 =?us-ascii?Q?Lt8caHxIaPcuQWqH9Y4jKA/bV86DdE/FJhgF5WzsOO6wHzW/fpLGK4xrVfAc?=
 =?us-ascii?Q?2V8OmArYsqkzQbmJ/atEE6/XKljZ4tjY1gwZ2pD0wg7XQ1ggi8j+H32ixOuX?=
 =?us-ascii?Q?UzF92VVz3gGaxOCP+xXkdPA7sS5uljH1ZCE9Dpws1WJJpBjxl2yp825mBz5K?=
 =?us-ascii?Q?kqFBgmAXZ+pnirizNqq80NrGaufjhDgfL/VbMvUHnq+MLx6RfN085HrufZRT?=
 =?us-ascii?Q?8R9pZ2cTwjfyqj6MOpNTxZr38jEZxZZt4Ndkhy4sjpDdB5Jer0QeGc7UQtA6?=
 =?us-ascii?Q?iZgulZnb8CvvtS2jkPolXNSoffCS8b+A2t3GwLq3R9bBFuF46Mn3Fot8u8mn?=
 =?us-ascii?Q?hIZaKMaVMvqn/0oDdizTgdpn++iEtgjkYtxNfoLCT3aDouDHCsQpJVMQUhHK?=
 =?us-ascii?Q?sjnN8hNsg9H+S8U9mj76cTxbImm4qdcA/BQ6N6J4iFFVFIE3sthPkcZcA044?=
 =?us-ascii?Q?leD45f3QM9nfizWRSZJHgP0tKLkJFsQNr7QsQGyosSx8ECMwvdVCdFwC/7ox?=
 =?us-ascii?Q?nzW7ssONdQubsJzJa/gWjW2sbyhVMZU0Hw+vPj8VXpRfxbVaZYqNbR/PpWTZ?=
 =?us-ascii?Q?KfdaBveP6t2r6d4zReCrvH6mBUw90t8dbqdA8/kpFCELCDCiug7I9cnNv1ys?=
 =?us-ascii?Q?pqrreNm/XjfuUXltXg7YGQ2EiqrxysXYQ4q2mfMSzBXWajlPmhivQdPalb6Q?=
 =?us-ascii?Q?XdNcqH/hRHlP0JOEuLme54xfqDilacMQ+wZbTXhJyH0B48DM45k/2AoHn9VW?=
 =?us-ascii?Q?TDPNzKmG/SkIEtb2r+gD2CT90PjZWO8ZcY/DfzFek6Ww7pHy9hMY/yG2aW+Q?=
 =?us-ascii?Q?0F92atiqjHtKRQHKB1MyD6e9Thxo7g9ldbuiBuF7fdd2i30Gwwe9YkS1lTze?=
 =?us-ascii?Q?buPNrZOFoPSW48oNHhz5R1QwAFCEzjVL/CfZbd0Ltxc17aP3oMbDJ2kZRh81?=
 =?us-ascii?Q?jvuU8gEUyBOz+B0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB7984.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uRh2NKBFagEFiFZ8On2lsM3vbO6i0s4YgYCT1tcl75+tYMHV68RYlpRaPXwW?=
 =?us-ascii?Q?s/R/J5cgHtLDSXXIdBD9oTuT1Qf5xuUOU4jG34p+dUm9+S55j7Xu6hAN4os0?=
 =?us-ascii?Q?vNoQj56oq3FgeEa5ZRd2+3B+ftTGdpT3dUspoG7AYtnSQhGcCUlXWSlufNrA?=
 =?us-ascii?Q?LcKTQhqampSNehH8fubXfaYAOa7m+RVOqeaVbhBkTIn+1Z0LVFLieQn4x9Kb?=
 =?us-ascii?Q?xHyvLUTAKUGf/ayvLA/Vn+S63ASriNbaJa2brfw2Dm62znRYIwgGpOAuGJ8a?=
 =?us-ascii?Q?vw/Y30eLelffAuD/0b+AGSbiEiqiaGXae3Vb/El93QsWtDMOe4LakzVINJoO?=
 =?us-ascii?Q?G/8c/8J0qZexTLQidEe+FVWvl6L0b55vZH1GwOC2vphFh6cKQ7nqG9eQcGxp?=
 =?us-ascii?Q?jTGa2sKDMryEqyFGq8P+6NjCn/w/cIPttkWfRSNmmP6h/49pS7cjYOm/MVmL?=
 =?us-ascii?Q?yzGXdUp4IAj9xMYE3m1n0YT3isSRQUCbZO70PaSkkKIv5C85YtzIo/3mRKOK?=
 =?us-ascii?Q?L0+9lM0zD6m+iRVsV+U4DR1Zs5yk36hSfC6FJ3a8lrVLJs7CME11Q/02LU98?=
 =?us-ascii?Q?5PqbdRlLO3K/cmAJFu3cN7SZQ3Y6+cxvw1WWxcjY4KVm/ZoawAK1/hbbFnhA?=
 =?us-ascii?Q?bdgrhbUW54ulJEPzSJgZc7cBoAZ/rJ1/lfp0bXfZnS2XPlNihbwdpnKfTKOy?=
 =?us-ascii?Q?zul9r3HSjaKBfdOr/WKxdWymrFihnRfyRDjiggnqWYJ+B6AL3XxGEihrl2qY?=
 =?us-ascii?Q?MKoWDYhRKiBdEgu53tYJG4HyV6X7PV/GtMhWSKEiLnLk96xrrLyE6KHiu0kI?=
 =?us-ascii?Q?Wl5HVk5UddGh42EsDanUaTV8F5uexvdW3nIqO835jS0kA5XxY33/hDqOtARU?=
 =?us-ascii?Q?wJWlwgtwlSmNGogGtxmzD8xf7A+bVt/x+b6Wtza9yK9m3dn3/vnOCTQLwBEZ?=
 =?us-ascii?Q?ReYaHMB1JI+urj9wJxF3nGQuHbsANl28BQ341hwqTonM6twUQFXP2+VM0zYo?=
 =?us-ascii?Q?ZR8jhXL7wUUhUgB3ORT/+iGoeTFO9ki+Q0dSIvg9QlKFX0QGFt31sn760brP?=
 =?us-ascii?Q?BFlnR9jxNPmCRXVfi7Ir7MAZ9pMbx0X88qplXN69w7uJ3BqCZT9ciJRy/dke?=
 =?us-ascii?Q?CPj4zQM9imr3Hs9GZxr+Jaf10MzvE3TEyVp74FEFQChu3JKFYdkTj8MFDGfr?=
 =?us-ascii?Q?1RJQ+VW/3NXZf7qPJhb1R2A1fvf5NquKT3PEhOMabXZjpM5f//dNk9AcLR2T?=
 =?us-ascii?Q?cIXpbjtpNw01zO9Of9JlA848jcaRc82b+Kyhl/XJ5mWCAzbwgBChZx4PwhO4?=
 =?us-ascii?Q?oo6t9Yj1Dsa+AiikzMqq4BdcFYdlQimmLQ0k1ZX0FUJs7n+gzxPdSiPuRyIq?=
 =?us-ascii?Q?7JjtRJ+QgJk2w/UvtcciVck/gNZncBZLdOA02kAda1VIhqh7rNQpWn5cYcr5?=
 =?us-ascii?Q?5qj5c4qTqyzgpG9ahwtoHYWqAI3RQvcmtI2QBeaVQ6rUDMnzH8mbQmj+rrVT?=
 =?us-ascii?Q?IonuShXBMkXu0Yj3pk2mWnPFEz4Yir0MnRwkRyGqj1Q3kfavN0nzVa4Z23Ud?=
 =?us-ascii?Q?bFB8HsomWF4ajF1SIIgSkHo/2PDfk3BJOOI3Sk4jBdxdJcEwljXh+ldNxFbz?=
 =?us-ascii?Q?Zw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c0d4163-436b-4481-a975-08dd8666f16c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 15:11:25.1191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4CxQinXeqElJxL3jrB61/gb8EZtHBFktsjOyRfwu4IocVFBe2rMzQBAyvU5f5JBpqjcG/gTns/8oD/QN3W/3CGIUVis0Piq5ryDBY0gl4MjuPqhhoE5u4vsrpZwYX7lH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR07MB9611

> -----Original Message-----
> From: Michael S. Tsirkin <mst@redhat.com>=20
> Sent: Monday, April 28, 2025 2:32 PM
> To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> Cc: virtio-comment@lists.linux.dev; cohuck@redhat.com; mvaralar@redhat.co=
m; jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij=
@kernel.org; ncardwell@google.com; Koen De Schepper (Nokia) <koen.de_schepp=
er@nokia-bell-labs.com>; g.white <g.white@cablelabs.com>; vidhi_goel <vidhi=
_goel@apple.com>; ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericss=
on.com
> Subject: Re: [PATCH v8 1/2] virtio-net: Fix ECN feature descriptions
>=20
>=20
> CAUTION: This is an external email. Please be very careful when clicking =
links or opening attachments. See the URL nok.it/ext for additional informa=
tion.
>=20
>=20
>=20
> On Mon, Apr 28, 2025 at 11:28:59AM +0000, Chia-Yu Chang (Nokia) wrote:
> > > -----Original Message-----
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Monday, April 28, 2025 10:00 AM
> > > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > > Cc: virtio-comment@lists.linux.dev; cohuck@redhat.com;=20
> > > mvaralar@redhat.com; jasowang@redhat.com;=20
> > > xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij@kernel.org;=20
> > > ncardwell@google.com; Koen De Schepper (Nokia)=20
> > > <koen.de_schepper@nokia-bell-labs.com>; g.white=20
> > > <g.white@cablelabs.com>; vidhi_goel <vidhi_goel@apple.com>;=20
> > > ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > > Subject: Re: [PATCH v8 1/2] virtio-net: Fix ECN feature descriptions
> > >
> > >
> > > CAUTION: This is an external email. Please be very careful when click=
ing links or opening attachments. See the URL nok.it/ext for additional inf=
ormation.
> > >
> > >
> > >
> > > On Fri, Apr 18, 2025 at 12:40:43AM +0200, chia-yu.chang@nokia-bell-la=
bs.com wrote:
> > > > From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> > > >
> > > > Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not=20
> > > > mean that TCP has IP-ECN set; instead, it identifies that the TCP=20
> > > > CWR flag is set and will be cleared from the second segment of an a=
ggregated segment.
> > > > This is used to offload the TCP CWR flag in a way that is=20
> > > > compatible with
> > > > RFC3168 ECN but is problematic for non-RFC3168 use of the TCP CWR f=
lag.
> > > >
> > > > Foe detailed requirements, please refer to IETF RFC3168:
> > > > https://datatracker.ietf.org/doc/html/rfc3168
> > > >
> > > > Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> > > > ---
> > > >  device-types/net/description.tex | 33 +++++++++++++++++-----------=
----
> > > >  introduction.tex                 |  3 +++
> > > >  2 files changed, 21 insertions(+), 15 deletions(-)
> > > >
> > > > diff --git a/device-types/net/description.tex
> > > > b/device-types/net/description.tex
> > > > index 1b6b54d..6b09f0a 100644
> > > > --- a/device-types/net/description.tex
> > > > +++ b/device-types/net/description.tex
> > > > @@ -54,7 +54,9 @@ \subsection{Feature bits}\label{sec:Device Types=
=20
> > > > / Network Device / Feature bits
> > > >
> > > >  \item[VIRTIO_NET_F_GUEST_TSO6 (8)] Driver can receive TSOv6.
> > > >
> > > > -\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
> > > > +\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with TCP =
CWR flag set
> > > > +    and follow the ACE bits handling approach mentioned in
> > > > +    \hyperref[intro:rfc3168]{[RFC3168]}.
> > > >
> > > >  \item[VIRTIO_NET_F_GUEST_UFO (10)] Driver can receive UFO.
> > > >
> > > > @@ -62,7 +64,9 @@ \subsection{Feature bits}\label{sec:Device Types=
=20
> > > > / Network Device / Feature bits
> > > >
> > > >  \item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.
> > > >
> > > > -\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with ECN.
> > > > +\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with TCP =
CWR flag set
> > > > +    and follow the ACE bits handling approach mentioned in
> > > > +    \hyperref[intro:rfc3168]{[RFC3168]}.
> > >
> > > What is "the ACE bits handling approach"? It's agrammatical to use a =
plural while reducing the relative in english.
> > >
> > > I looked at RFC3168 and I see no mention of ACE anywhere.
> > >
> > > Also "mentioned in" is weirdly informal.
> > > described maybe?
> > > which part of the
> > > spec do you refer to?
> > >
> > > you should also expand acronims at first use.
> >
> > Hi Michael,
> >
> > Thanks for the comments.
> >
> > RFC3168 does not explicitly discuss offloading, and one relevant statem=
ent is "When the TCP data sender is ready to set the CWR bit after reducing=
 the congestion window, it SHOULD set the CWR bit only on the first new dat=
a packet that it transmits."
> > Therefore, IMO, RFC3168 does not provide a clear specification of what =
occurs when offloading is applied.
> > While the ACE field is a new terminology introduced in the AccECN draft=
, it incorporates the AE, CWR, and ECE flags.
> >
> > To make the virtio spec clear (i.e., without expanding on the implied i=
nformation that should be in the RFC) and simple to grasp, I would propose =
the following changes.
> > "Device can receive TSO with the CWR flag set and follow the SHOULD req=
uirements of the CWR bit described in Section 6.1 of RFC3168."
>=20
> This looks better.
> receive from where? The driver?
> Add a section name, too. You can drop SHOULD just say requirements, too.

OK, then I will put
"Device can receive TSO with the CWR flag set and follow the requirements o=
f the CWR bit described in "Section 6.1.2. The TCP Sender" of RFC3168."

>=20
> > > >
> > > >  \item[VIRTIO_NET_F_HOST_UFO (14)] Device can receive UFO.
> > > >
> > > > @@ -695,8 +699,9 @@ \subsubsection{Packet=20
> > > > Transmission}\label{sec:Device Types / Network Device / De
> > > >
> > > >    \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature=
,
> > > >      the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
> > > > -    indicates that the TCP packet has the ECN bit set\footnote{Thi=
s case is not handled by some older hardware, so is called out
> > > > -specifically in the protocol.}.
> > > > +    indicates that the TCP packet has TCP CWR flag set, and the=20
> > > > + flag will be handled differently for all segments of
> > >
> > > the CWR flag.
> >
> > Will be changed.
> >
> > >
> > > > +    an aggregated segment, as mentioned in=20
> > > > + \hyperref[intro:rfc3168]{[RFC3168]}
> > >
> > > i could not find this in the spec either.
> > > "segment" is mentioned once, when talking about MSS.
> >
> > Here refers to an aggregated segment (e.g., one big super skb in Linux)=
 that has more than one MSS block.
> > And the CWR flag will be handled differently for all segments inside, l=
ike I mentioned above, as implicitly described in RFC3168.
> > Is there any other suggested terminology that is common across OSs?
>=20
> I don't really know what you refer to.
> Given it's according to RFC, maybe no need to talk about segments?

OK, so I suggest the following without going into the details:
"If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature, the VIRTIO_NET=
_HDR_GSO_ECN bit in gso_type indicates that the TCP packet=20
has the TCP CWR flag set and follows the requirements of the CWR bit descri=
bed in "Section 6.1.2. The TCP Sender" of RFC3168."

> > >
> > > > +    \footnote{This case is not handled by some older hardware, so =
is called out specifically in the protocol.}.
> > >
> > > what does this refer to? which protocol? hardware older than what?
> > >
> > > >     \end{itemize}
> > > >
> > > >  \item If the driver negotiated the=20
> > > > VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature and the @@ -788,10 +793,9=
=20
> > > > @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Net=
work Device / De  \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
> > > >
> > > >  The driver SHOULD NOT send to the device TCP packets requiring=20
> > > > segmentation offload -which have the Explicit Congestion=20
> > > > Notification bit set, unless the -VIRTIO_NET_F_HOST_ECN feature is=
=20
> > > > negotiated, in which case the -driver MUST set the=20
> > > > VIRTIO_NET_HDR_GSO_ECN bit in -\field{gso_type}.
> > > > +which have the TCP CWR flag set and require the flag be handled=20
> > > > +as mentioned in \hyperref[intro:rfc3168]{[RFC3168]},
> > >
> > > still confusing.
> > > should not send packets that require the flag? or should not require =
the flag?
> > > if the former, "and which would require" ... if the later "and should=
 not require".
> > > or better, make sentences shorter.
> >
> > Should not send packets that (1) require segment offload, (2) have the =
CWR flag set, and (3) need to follow the SHOULD requirements in Section 6.1=
 of RFC3168.
>=20
> Any of these? All of these? Any two of these?
>=20
> > Is it better like this?
> > "The driver should not send TCP packets to the device that require=20
> > segmentation offload, and the set CWR flag needs to follow the "should=
=20
> > requirement" in RFC 3168 section 6.1,
>=20
> this part is still confusing. what is "and" here? do not send packets tha=
t both require segmentation and have the CWR flag?
> do not send packets that require segmentation and also do not send packet=
s that follow requirements?

OK, it shall be the latter case you describe.
Because, if the TCP packet requires segment offload but the RFC3168 require=
ment is not required (notice that it is a SHOULD requirement rather than a =
MUST), the packet can still be transmitted.
In this case, the CWR flag will be delivered not just in the first packet, =
but this is as intended.

As such, I would like to propose a shorten text:
"The driver should not send to the device TCP packets that require not only=
 segmentation offload but also following the CWR flag requirements describe=
d in "Section 6.1.2 The TCP Sender" of RFC3168, unless..."

>=20
> > unless the VIRTIO_NET_F_HOST_ECN
> > capability is negotiated, in which case the driver must set=20
> > VI_IO_NET_SO in GSO_type."
> >
> > BRs,
> > Chia-Yu
> > >
> > > > +unless the VIRTIO_NET_F_HOST_ECN feature is negotiated, in which=20
> > > > +case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{=
gso_type}.
> > >
> > > in which case? when it is or when it is not negotiated? or when it se=
nds packets maybe?
> > >
> > > >
> > > >  If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY=
=20
> > > > set
> > > >  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
> > > > VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit @@ -1105,9 +1109,9 @@=20
> > > > \subsubsection{Processing of Incoming Packets}\label{sec:Device=20
> > > > Types / Network  \end{enumerate}
> > > >
> > > >  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP,=20
> > > > UDP_TUNNEL -and ECN features enable receive checksum, large=20
> > > > receive offload and ECN -support which are the input equivalents=20
> > > > of the transmit checksum, -transmit segmentation offloading and=20
> > > > ECN features, as described
> > > > +and ECN features enable receive checksum, large receive offload=20
> > > > +and
> > > > +RFC3168 ECN support which are the input equivalents of the=20
> > > > +transmit checksum, transmit segmentation offloading and RFC3168=20
> > > > +ECN features, as described
> > > >  in \ref{sec:Device Types / Network Device / Device Operation /=20
> > > > Packet Transmission}:
> > > >  \begin{enumerate}
> > > > @@ -1210,10 +1214,9 @@ \subsubsection{Processing of Incoming=20
> > > > Packets}\label{sec:Device Types / Network  the VIRTIO_NET_HDR_F_UDP=
_TUNNEL_CSUM bit in \field{flags}.
> > > >
> > > >  The device SHOULD NOT send to the driver TCP packets requiring=20
> > > > segmentation offload -which have the Explicit Congestion=20
> > > > Notification bit set, unless the -VIRTIO_NET_F_GUEST_ECN feature=20
> > > > is negotiated, in which case the -device MUST set the=20
> > > > VIRTIO_NET_HDR_GSO_ECN bit in -\field{gso_type}.
> > > > +which have the TCP CWR flag set and require the flag be handled=20
> > > > +as mentioned in \hyperref[intro:rfc3168]{[RFC3168]}, unless the=20
> > > > +VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the de=
vice MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
> > > >
> > > >  If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the=20
> > > > device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in diff --git=20
> > > > a/introduction.tex b/introduction.tex index e60298a..d52622e=20
> > > > 100644
> > > > --- a/introduction.tex
> > > > +++ b/introduction.tex
> > > > @@ -168,6 +168,9 @@ \section{Normative References}\label{sec:Normat=
ive References}
> > > >      Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Ke=
y Words", BCP
> > > >      14, RFC 8174, DOI 10.17487/RFC8174, May 2017
> > > >          \newline\url{http://www.ietf.org/rfc/rfc8174.txt}\\
> > > > +     \phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
> > > > +    S. Floyd., ``The Addition of Explicit Congestion Notification =
(ECN) to IP'', September 2001.
> > > > +     \newline\url{http://www.ietf.org/rfc/rfc3168.txt}\\
> > > >  \end{longtable}
> > > >
> > > >  \section{Non-Normative References}
> > > > --
> > > > 2.34.1
