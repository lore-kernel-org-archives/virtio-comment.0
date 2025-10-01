Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773AD2EA48E
	for <virtio-comment@lists.linux.dev>; Wed,  1 Oct 2025 12:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759321553; cv=fail; b=ChEoCQX6jaLTxFrkpSEaitXCHgERtY3jHv1bP487TT6dQbtgFnmnl9JiaHArL/pM4Cgc3KRp0bCLhvaC8eRJFQbSrOzxHJCcR9xgErdcNKtWbrJz0NC9lLypbELVpOMMjXDdAvDL96/O4a2eHq3HnLlgcJs2vNwG/3yzc9rU/xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759321553; c=relaxed/simple;
	bh=FldeJhTgk2cqLzarQoURyJ0CT+8EA+WPc3RDEUYpmos=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j5MTqYtrWwG5FFDXiDDBMcjg1tZRyvUa0HG6QB8Nmnxobmnhc5nSL8aWrhAY9ARrkTSa3YiqlSVLOQa7pgnwi7HbaS2+i5gLx0YWrJCGSv3Kdq8SDzshvPty1YliG+pvUmE6LfEZ1gmbjVObwXZQ50JVGI+BiKCjVP4NTAid3x4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=ZsOIyPYd; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="ZsOIyPYd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o28moX8NORBIH2AQrEXI3SKMCMjpm1JdyMcj4GnqEVOj1bsDtNjWar/r4Kt7nFvbOX8Bb61AXPYghiedg61bpMddjkTI5eNgBMyeIncaRytsL5ztKBypUDKlOkMDxcDfWpJsRatEUrNqd3XgO3embpqAnQGp08c4vQcqISGlSmkjlVb2OB+rR1CuT0PJFZKgmkMO4T7kqKWqsSGj6QysilES6UVKBBpTi8N5nxFaZf+BR5L28oXV2HiNOFZzhLx8HIdJNFv24Q65FphnV2dEd0dfYxRjvouqhfHqldl27DdEi4gZ4jcGmBuDIOUvKdEooFsgIBttArIkg4fQhalzWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FldeJhTgk2cqLzarQoURyJ0CT+8EA+WPc3RDEUYpmos=;
 b=yNcM5egQLlxqZ3DjeV3MnsATe4QrH3dqtjJYtAt1lNsm4CMDAXR40/liscrUl26BNO4N1+KfVM0d8z3wGQX3q+HSJCLEvHCEVY1jONqq4PCP9+f+4o8HCoS7wT1E7zo0wSPBHkPwXEDvR4F6H0zTPZm4WDCB2Tct3uFi9H1cxDCrel7FIB8yjCxpMicBAIwqXrYNJj+oNxh0UMy4FCsOCW4GfISab2D/9b85d70F4Kybl+a573L2eaSc/9nJP320bON1Gut2krNj34XBFeBlPTVEaQD+WMTlVmkFdI3hv9BgAnh55k7YdulBJSUYXno52DVaYnBp+kp9VkRGElcecQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass action=none
 header.from=nokia-bell-labs.com; dkim=pass header.d=nokia-bell-labs.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FldeJhTgk2cqLzarQoURyJ0CT+8EA+WPc3RDEUYpmos=;
 b=ZsOIyPYdYobfieKHWz9uzw7w9Gwn7ukrtKPKI80dyrJ5qxg/RkAKKeX8QzNdmz+cakxZvIA5eqjkQ1JJT/4vTK+PWrRM8jZfLiG+6uv827PWEOh4KH7e9437CrdzVtXDa50B7DbsNDZfECPHLv1HUXTTGWczG0uIna/2y2p/Z8n6MpZMeHIUlVjiJLwiw+cuIq9qkYijwzV1JEhOex++Mxd/bRIvkxhIzCkV4N00FqIKF3fO0RoffO72IlMnLQsk4pcBWzloor+ZlC7eSEl7edm17qJL8v9A5xEYwgO2Y6KPTA+z137mWbI0Z/tWujsVAIuKqnFZn/yCZzFKdo79Xw==
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com (2603:10a6:102:133::12)
 by AM9PR07MB7332.eurprd07.prod.outlook.com (2603:10a6:20b:2cc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 12:25:47 +0000
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56]) by PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56%2]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 12:25:47 +0000
From: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
To: Parav Pandit <parav@nvidia.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>, "ij@kernel.org" <ij@kernel.org>,
	"ncardwell@google.com" <ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
	<g.white@cablelabs.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Topic: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Index:
 AQHcDRMrginf6nv65kWiLWJ393AYBrSqEH4AgACeHQCAALjzAIAAY1+ggAExSICAADU0YIAANvAAgAAaczA=
Date: Wed, 1 Oct 2025 12:25:47 +0000
Message-ID:
 <PAXPR07MB79845B9580C4D17590E8C2DEA3E6A@PAXPR07MB7984.eurprd07.prod.outlook.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
 <20250814120118.81787-2-chia-yu.chang@nokia-bell-labs.com>
 <CY8PR12MB7195670B68CC8F454DA821C6DC1BA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79843798615E61FA134A5428A31BA@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <5f1f310d-8a17-414b-ac70-80028832a78b@nvidia.com>
 <PAXPR07MB7984310A505E7EDDCA0CBFA6A31AA@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB719523226B3E785B8433C823DCE6A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79847467B33487A8F0CA5ED5A3E6A@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB719518C4A8F3EE03690E44B1DCE6A@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To:
 <CY8PR12MB719518C4A8F3EE03690E44B1DCE6A@CY8PR12MB7195.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-bell-labs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB7984:EE_|AM9PR07MB7332:EE_
x-ms-office365-filtering-correlation-id: 33e092db-5fd2-4694-0c2f-08de00e5a6bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|921020|13003099007|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?9zbZ7shsIKhq6D0mtbZyccoiYfpov4MaW22kFWibusVOBMKrov3Fivzx/GpX?=
 =?us-ascii?Q?PsmI8yxllUMSDlt3NruCtvEWRdN9Cb7TUO1Hv0QYEleE3V6WikUou5k+Oea9?=
 =?us-ascii?Q?hXQmSGn1LH5PrD+OMK/JufMvNtRi1HCb6Bw5FYuOf17j7Gf6ZKTvUN+uJWSM?=
 =?us-ascii?Q?98w16VOF8YRvWMcVq6+xt7KSdSdV3zlvZPk0+6BohUGTPtFJ2VSYqeIw6xnM?=
 =?us-ascii?Q?DGCAD4pPCCqZmnr0a89uIvzrX5NYkmf9eRgaFA08JZa9GJ2Q26njM65+6Jm0?=
 =?us-ascii?Q?esRPMQVdhmyZLmwUkF2UBah8AUsJPxVWE/aZGLygy5QxkfZBeoODQ8vTBB68?=
 =?us-ascii?Q?q2Dr7zvV3H6zlQ3YR50EdAZu8Oh6IHzxbHLbXT84UNiJCs+WAlUS0hdT8Cq/?=
 =?us-ascii?Q?uglKIW6bwhvbo/NVEb5gEYrUsxhdWI9GRrGnqF2OPsjBJ7REJ8HiRjTl+UjP?=
 =?us-ascii?Q?/sFGbAShgjriFLaxtl8bKlS0bwvBLHsU3utvb8e+MRyYmKowyPIfdLQsqyZ7?=
 =?us-ascii?Q?ZM1EgPVnj2wi5DcyZVWNasje4xJlcJi0S7jVTBqByx5gGT6t/VB7B5oLhOcp?=
 =?us-ascii?Q?6Pp26NuvdcgNXQWNLi5IDkY6LRVW0S1BXLRkyDtiuzmVPKcbTNrRm0SA7OBA?=
 =?us-ascii?Q?6HFtP8eGfcsbYYaKq0TGRSSuSNRMxfh1SKnHE4glPsehN3IQe558t/6aAOyM?=
 =?us-ascii?Q?6pqI+wiL4Kf/x7MDVoLC5e16eoV5aADehoPnUMipL1/tl0LXqQwQ+k50j8Zj?=
 =?us-ascii?Q?g/5WOsc29Rq+s9th3j5WZES1csCS5NueaUQW5rPj0qpY8FlQMnUJMyaJ6W7X?=
 =?us-ascii?Q?w8V3nMHIyhKyWyGfoqAL8I27Bl89Jpf++Qac/r4F4QKcRSBUFzA9Tg2kTxrc?=
 =?us-ascii?Q?fI4+89Ql0GtdApn2aSDeWLPGaPyKs3Ld+d+jb04oRpZSWnwVwX/kCMyx0z1F?=
 =?us-ascii?Q?GLyb4Zf9EPjMgWx1EVMyyJKb3pBadxrue+49ttuoQfjim6n6OenQdVOErsss?=
 =?us-ascii?Q?9/eycFfQlT/o4Uzi6XNfqxOe47h0kE7b9M1XtqADQL1F2wbEPIC9Ve6j0mVf?=
 =?us-ascii?Q?aqkWlKOz2uotDq3Z/4PMAPaWCiIUXZsT1WU2X7c361P8k2l36T1jsrOuGscj?=
 =?us-ascii?Q?cVEbvpWeq1FDmXSQob1nFU0VMQKeqRcu067LWRuWw6jhNjB8bFyFe0foYHEw?=
 =?us-ascii?Q?LQcexd4iQZYyhww1JwqXEHerDtmW7kwM6L6QwlVALPsjxVh+gqKRo22Z83mI?=
 =?us-ascii?Q?jPEC6b/uo+8ndqMSIeyMz/VVDNxI8/86wvuorjda+/F8JcvUmSf26SC0nHho?=
 =?us-ascii?Q?3mKvFPJW00r/YYEs/CXILaCdX+XH9o7e1qAxZ5NWaPFmDp5u2JBLT0UaCa5J?=
 =?us-ascii?Q?+OzFkgBUcCNRTfGyDieX7iE+LZZFyAIVpAMHP3cUuRUQ266yIeUhgwzK1lFQ?=
 =?us-ascii?Q?G8kWDpSYfpvUeCIxFdPdjtWpC4dXSjsY2Ba/tZSttjnYONrKtyuKLvRrKo5e?=
 =?us-ascii?Q?cs089eb0SiL4hSCyQOuDA73Cr32kN7ceM4t3GP6busNqJf35oFQ6LEsQbQ?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB7984.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bdk0iAI21keKdPlyBjEfej1dzUS4dhdBhq2Z5nqkATbaGRGRlFNEcpL+zg4N?=
 =?us-ascii?Q?ZmqnGnf8Ox59jp7n7Jm/M4CHqmC9oP0ERtsdxmZXP+5mj06wz1InKvzEaOMD?=
 =?us-ascii?Q?FxYBYA/Uf/4+wWmTLwyd9hDwH1jiyhOC1aL9ZN1lNHQogRqmZoXKh0vcK8sL?=
 =?us-ascii?Q?Tl/c3BHiSplBAz8p+D57xY6a8wfWn54CtOmkipXMrHoXFP1zKUqy4LOkBdiZ?=
 =?us-ascii?Q?AHMfxNb+NYuQ9lGdLe2tfEPu0oHrM+vhpanQ/Exu8PpXjwNpm3DljpEW/g7W?=
 =?us-ascii?Q?LuAD+lJf2XHghFsvs6O0RBy8ETnNLRfxTennnjoz5Ys6po92rK1+H+y4fGur?=
 =?us-ascii?Q?owryHOMrv6hurJ5JrcYNgHEu2BZT5IcvhT4EAbH6Zpx6R6WP/uW34MVT5+yD?=
 =?us-ascii?Q?l8wyM+DcSH/x5p4Snf7RjaRYzz0+yiTtgwCuhzgu9cRja4fenH51B9+ejyFC?=
 =?us-ascii?Q?OCEv4yid/wBYJncBd37FgX9Q9D9EVh6M0iamAdkEAnlwcqquCgl/oS8s2k4A?=
 =?us-ascii?Q?DElVtsqGQTyk7jvHTmauC9FyXUSsB4teDNAS0UwB1vXQ4KJjW8y8RHOw2Hqu?=
 =?us-ascii?Q?hvaGktGriDv6h0FhCBKsqEcpZip/T8SgP0vGlT8auqXWkJ3PE49wj/5b5S44?=
 =?us-ascii?Q?jqdfS6WiQbUEd2ItScTwescgC7WHl00ZthhqlO6TYeX4VVxOKQs0szDxc8Bc?=
 =?us-ascii?Q?u8Z4vD7ItVSGvw91yN9flyUUTNHGKkPqDWJmojrf/H2+N1ZjbaSjLPxRuO5V?=
 =?us-ascii?Q?LQ3Gf/qeiVcfNSpYdNFr+k7vtWmakX5xlhlED7xOzEYUEdr/cjSD9ugkFnRe?=
 =?us-ascii?Q?W8o5vG1Yw4HVD+V5/co+HONurqXA49qOD/7WriGrj5wl1HLxOiVVdovc6Zzs?=
 =?us-ascii?Q?8mpTAl+4c4tvNokpZOsXhELuROymcH3ONUuNblUNayxw9CjQt79fMMOjTk0o?=
 =?us-ascii?Q?MumIjiu07hm+/X8vOwQrpcy1TCyBUi0xu7YmxMlarlgCIPxwf084GhhV4XZA?=
 =?us-ascii?Q?eUHnZkK/XP1rKpqfM32y/z8uO1n8rA6YHgSl6EwSCwlLjWxappG8/wZC5hjx?=
 =?us-ascii?Q?yMu/2C0FAuV9Mme92JyLSouYqWPdMxHhwb0fSsapvIgda0EktBAsG3/v0FU6?=
 =?us-ascii?Q?8RPmAdXe9ubaYhBLXhJv9+zcPsjuBK/aECm6+kQ7zkRN7Py3aEWhFl6uoYdf?=
 =?us-ascii?Q?hsxn/bMf2bFwZAUyItsqJLo+ypjgoIhtmi04Mydrc6vNoMqhmOLVBF+O3B2E?=
 =?us-ascii?Q?nn1SHtnCo6TyUT0kIiaMiWQj90fNSLfmSfSVGlKTiesuMhgc7s4OSRdgtLfQ?=
 =?us-ascii?Q?P0fkdeCXUI+9t6/Ks3jEhGjRSi0l9UIN8XKvyFvjCcKwGKjJkq2v+N2frf4r?=
 =?us-ascii?Q?qjMCMT0Vu1EdnoYTwopbA5mYC108aOnl1xRgsFJdW9wmRkTUSZsUnO/LZdQx?=
 =?us-ascii?Q?5dPFYgaxHMRgfF9FR1pnAM+dD6JZbDW3GX+e6/f4E2q+yasJez3nuCXk9SWX?=
 =?us-ascii?Q?I6zsZgeSSUbkiSZyXbjTGEn5xUoyK9oMnFtu9qHzoSxQhTeON0tjMDxHtLa2?=
 =?us-ascii?Q?l+o/OePN8hlWFytufQJ43tujNnnIOs3LXFRLGKqtqwDXn9XugyCjVWP8xdJl?=
 =?us-ascii?Q?xg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e092db-5fd2-4694-0c2f-08de00e5a6bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2025 12:25:47.8073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8PLi29T+1oBHKi8aUHTGPrEHWr905fT0YH3Q0S1KOz4QmyJKu5GkdhZ0nCuw4VY5nhK1HsgGiPMrOtpysBwQFwGhTRq8KBUydycwIbl6a3XvH9OWR3VCi5yMgbIarHKD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7332

> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>=20
> Sent: Wednesday, October 1, 2025 12:51 PM
> To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>; virtio-com=
ment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com; mvaralar@redhat.co=
m; jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij=
@kernel.org; ncardwell@google.com; Koen De Schepper (Nokia) <koen.de_schepp=
er@nokia-bell-labs.com>; g.white@cablelabs.com; vidhi_goel@apple.com; ingem=
ar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
>=20
>=20
> CAUTION: This is an external email. Please be very careful when clicking =
links or opening attachments. See the URL nok.it/ext for additional informa=
tion.
>=20
>=20
>=20
> > From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > Sent: 01 October 2025 01:04 PM
> >
> > > -----Original Message-----
> > > From: Parav Pandit <parav@nvidia.com>
> > > Sent: Wednesday, October 1, 2025 6:24 AM
> > > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > > virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com;=20
> > > mvaralar@redhat.com; jasowang@redhat.com;
> > xuanzhuo@linux.alibaba.com;
> > > eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De=20
> > > Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
> > > g.white@cablelabs.com; vidhi_goel@apple.com;=20
> > > ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > > Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature=20
> > > descriptions
> > >
> > >
> > > CAUTION: This is an external email. Please be very careful when=20
> > > clicking
> > links or opening attachments. See the URL nok.it/ext for additional=20
> > information.
> > >
> > >
> > >
> > > > From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > > >
> > > > > -----Original Message-----
> > > > > From: Parav Pandit <parav@nvidia.com>
> > > > > Sent: Tuesday, September 30, 2025 6:15 AM
> > > > > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > > > > virtio-comment@lists.linux.dev; mst@redhat.com;=20
> > > > > cohuck@redhat.com; mvaralar@redhat.com; jasowang@redhat.com;
> > > > xuanzhuo@linux.alibaba.com;
> > > > > eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen=20
> > > > > De Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
> > > > > g.white@cablelabs.com; vidhi_goel@apple.com;=20
> > > > > ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > > > > Subject: Re: [PATCH v10 1/2] virtio-net: Fix ECN feature=20
> > > > > descriptions
> > > > >
> > > > >
> > > > > CAUTION: This is an external email. Please be very careful when=20
> > > > > clicking
> > > > links or opening attachments. See the URL nok.it/ext for=20
> > > > additional information.
> > > > >
> > > > >
> > > > >
> > > > > On 29-09-2025 11:14 pm, Chia-Yu Chang (Nokia) wrote:
> > > > > >> -----Original Message-----
> > > > > >> From: Parav Pandit <parav@nvidia.com>
> > > > > >> Sent: Monday, September 29, 2025 9:48 AM
> > > > > >> To: Chia-Yu Chang (Nokia)=20
> > > > > >> <chia-yu.chang@nokia-bell-labs.com>;
> > > > > >> virtio-comment@lists.linux.dev; mst@redhat.com;=20
> > > > > >> cohuck@redhat.com; mvaralar@redhat.com; jasowang@redhat.com;=20
> > > > > >> xuanzhuo@linux.alibaba.com; eperezma@redhat.com;
> > ij@kernel.org;
> > > > > >> ncardwell@google.com; Koen De Schepper (Nokia)=20
> > > > > >> <koen.de_schepper@nokia-bell-labs.com>;
> > > > > >> g.white@cablelabs.com; vidhi_goel@apple.com;=20
> > > > > >> ingemar.s.johansson@ericsson.com;
> > mirja.kuehlewind@ericsson.com
> > > > > >> Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature=20
> > > > > >> descriptions
> > > > > >>
> > > > > >>
> > > > > >> CAUTION: This is an external email. Please be very careful=20
> > > > > >> when clicking
> > > > links or opening attachments. See the URL nok.it/ext for=20
> > > > additional information.
> > > > > >>
> > > > > >>
> > > > > >>
[...]
> Virtio spec requirements are clearly written.
> So just by referring to RFC 3168 is as blurry as today in context of GSO.
>=20
> At best possibly it can be written as "device SHOULD do ECN and CWR in fi=
rst pkt.. and subsequent packets SHOULD have cleared".
>=20
> If that is not aligning, than better to not make it more blurry.
> ACCECN feature bit can be more crisply defined in that case.

OK, then could you let us know if we make below changes in the next version=
, are they clear enough for virtio spec?


1. VIRTIO_NET_F_GUEST_ECN (9): Driver can receive TSO with the CWR flag set=
. This CWR flag is only applied to the first packet, and the CWR flag of su=
bsequent packets should be cleared.

2. VIRTIO_NET_F_HOST_ECN (13): Device can receive TSO with the CWR flag set=
. This CWR flag is only applied to the first packet, and the CWR flag of su=
bsequent packets should be cleared.

3. If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature, the VIRTIO_N=
ET_HDR_GSO_ECN bit in gso_type indicates that the CWR flag of the TCP packe=
t applied only to the first packet and is cleared in subsequent packets.

4. The driver SHOULD NOT send to the device TCP packets requiring segmentat=
ion offload with the CWR flag set ONLY for to the first packet and cleared =
in subsequent packets, unless the VIRTIO_NET_F_HOST_ECN feature is negotiat=
ed, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in gso=
_type.

5. The device SHOULD NOT send to the driver TCP packets requiring segmentat=
ion offload with the CWR flag set ONLY for to the first packet and cleared =
in subsequent packets, unless the VIRTIO_NET_F_GUEST_ECN feature is negotia=
ted, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in gs=
o_type.


