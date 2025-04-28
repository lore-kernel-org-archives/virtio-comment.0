Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2041.outbound.protection.outlook.com [40.107.20.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C931FE455
	for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 11:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745839745; cv=fail; b=fIfwV/Rj4F7Cm7Y/zNRo7yB6q6xH444FCdy9NTCja3A7nXURyOnQ4IDIebvIutdWiWQvF73ijtrJVecTsNKUm5Z77qy80Kwg8tP1ilVix5ThTntl4+9u5XNk8yv3CDRBl/uxJkRfJ/ZZkQXZcCXh6FwWzlq16aJyp+rrCXRnPRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745839745; c=relaxed/simple;
	bh=5ZvF0rfoxNIKIDLDDsiuQ8Be6QLywHDbY+gsygOw0JM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TzNMoZrnFJOjxFQIPtS2YF1fxudgKwYA0NGIsRcP4SQKpfXl8mIg27DGFZ6TsRX6AUujOtgNvzHXc36Mb3PDhyzU9rGP7LU7dB7yqCrmTaWeWZNF/b1ASkf+JnSA3dBt0zYYrCZMs8I24QZ6vYhXl12HQx4lxVwIWwOYhtQJY5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=M8hmKo3k; arc=fail smtp.client-ip=40.107.20.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="M8hmKo3k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EwBa/5VPIh/EkO4ZiM/39KN9lG2qGjyHWYmNR3bHTnQ+r+paZBo0C2+wL/e4aIizFNY2qUKeIxSWRVXGaWXSdJy2Oe8vQEYqOZV/WFo2IPzTSo6aS40rF3uLuRVCmOXuf+qfB/n0YSVRQ8lg2JC70jGS4Y11RIYiSRWckAaECLErDA9WYHoRNXBiIpFZBYrCnLA+/MCqLZmSDQvqbOLXTFxwShMEmkJy+K07uGCaz7W7592bxmy+2lXfrfP5UtNRx4odywJC5lYSaVtuVMuJYhS64K9FhhyRNsaPr6TitPPDAdKOH1YZa4ypn9OrLxqiBkusuaGSCc852LuI30p+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wniakw+WodSiXVfYEmNC4ln9MLpARnQKVH/x3aE1Ilg=;
 b=CxV73G7F9+yFfkdehg67Y6dG4JwfNXwiVuD5t7sTQyUAVDKF0GbQ6w8xa5OlJ6YGFWAKySsylLnX2Kb9aiFDxpS3e8Sa18EZScQXe/MNJSU7WkT/OQDFjw2uXsdZiBWpGKA7xrXr5cTRNHdu4gwoybDUiVTJz9mBkJiT5mKa+8kRFUU3sTA8T9/EjtktB0Mg39pGuAWaqRrfG6F3/KOsLo/qA0lUpyFRpMLE3K33lbslq9g2Jmn6RZVHR5E9wgVbo4gyrtxylbWg9XEhaSuDUmNE9G5NGVBN+e9iZ5uDDME1i1RBtmNaGjR2o+oJ7b82apbDMYWtq+ly6WL0/ak5GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass action=none
 header.from=nokia-bell-labs.com; dkim=pass header.d=nokia-bell-labs.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wniakw+WodSiXVfYEmNC4ln9MLpARnQKVH/x3aE1Ilg=;
 b=M8hmKo3kNRvhsIrwXbrxt/9z58QdEro1XGz95EbDyOPNPguExXmYhMc4UiPhZEE/pAU6N7vRYfF5n2ux6DO28JtJFiZ/q6A7HVqszhKJ/O2KqMc8AEMR5YdX2hKg/qkiz1wPSgjPDSvEa1db888vyp+KV58ymL0FAqoe+Wo7lHbwdbGdwcJVfAPG5igKeHhwBr3aiod8BsPTbdPLfFmKriVm/kAcY5a1zlpiTRYI5gyCd+jtNwhhmUtFq5AzvfJzJOybp6k9zCT1IUoKsByTXxur27bm0xFUksJwefaGGYTVwsvXVTygc/9wynrSiSs3moJjXaIcijDBswXZZx2D+g==
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com (2603:10a6:102:133::12)
 by AS4PR07MB8436.eurprd07.prod.outlook.com (2603:10a6:20b:4e4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 11:28:59 +0000
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56]) by PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56%2]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 11:28:59 +0000
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
Thread-Index: AQHbr+nHHUWCFh3PhE6DeEzOkmTDZbO4xyOAgAAbXYA=
Date: Mon, 28 Apr 2025 11:28:59 +0000
Message-ID:
 <PAXPR07MB798444A55878297F8A0D1E64A3812@PAXPR07MB7984.eurprd07.prod.outlook.com>
References: <20250417224044.21348-1-chia-yu.chang@nokia-bell-labs.com>
 <20250417224044.21348-2-chia-yu.chang@nokia-bell-labs.com>
 <20250428034815-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250428034815-mutt-send-email-mst@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-bell-labs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB7984:EE_|AS4PR07MB8436:EE_
x-ms-office365-filtering-correlation-id: ab564d21-61bc-4ce2-b9ec-08dd8647deec
x-ld-processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?m/pu8BTRitsW5tBTiARVy8UlB2qWGhejDe+PdwHXJNY2rlG2WHH4lr32Lg2m?=
 =?us-ascii?Q?oA16bWZCwLZd1jdAgAO8kRtXAn7sKt2pEJMhaxAi1NnKl34SWo0FXSRgq3jv?=
 =?us-ascii?Q?C/xe26SavG2K4SMD4RSk3h3SOzBnIOF1QihWClPMUcHhuTvawqiH8/7Zq189?=
 =?us-ascii?Q?QPY+GEjGrr9ZGTI/TgIpAK8DIMp+Q/A+eVxQQfIiVGdAeXj0mg1LIz8UnGjv?=
 =?us-ascii?Q?L7mG6Hv4uo1YkZCzTLeTA3srUu7p2jhaRDMq22LsKDLSTI59Y9tJv9kfZ5zW?=
 =?us-ascii?Q?TwwKhrUTbFPBFZtKwkXE6kI0chS6CRnXtTrxhMjEJyJE0NhdN1R77fuAyw+T?=
 =?us-ascii?Q?NbYJMd2gzBCWMudxNjYZ4j86G6cP0OCv5ksCmPnUP91cFPwyfm9w/NVSbWjW?=
 =?us-ascii?Q?ZdDcH22JH4Q7pXg7ackme7jEjD/PquySMww24vFhx0O4VORAK0bqusgmoZKt?=
 =?us-ascii?Q?tkEejCyni5utffCY/8XDtO3flbrLH+t6sZCrNLwrCISzYKySB57R8POQweUa?=
 =?us-ascii?Q?0fg2cFWSxF2Kzj01OTR6BCZNFJ5mTmeTyDZ/i3707HCfuhzQ20OedF9iVJqf?=
 =?us-ascii?Q?AiyGIov4mRDhSEa14vmkI1D190TO3SOE1X6XzbpJSzICOn8K26pgC3FNc4wV?=
 =?us-ascii?Q?33EM+8tPnbwb2BeCT8L23EqCU2U+zQVxZbr58pGkCjTAZ4OS4MM0ZeGCPMqt?=
 =?us-ascii?Q?WheP70atCOyfttZHa+OZQQyq5myxILei2xmA/ShNRo2RQ63+6eNq01Wod8Lt?=
 =?us-ascii?Q?Qd/tkyuCHiXMWZ6HkoXTDUNZVWyn70ge76ungckhR76duoaa6vNmzTlHRgW0?=
 =?us-ascii?Q?f3fbb7YV4I0PhdXDwpwPM+/Rkr595gMre9nWCGmVx0Hz+ASXvBXx5XHWQAA9?=
 =?us-ascii?Q?tkNwoXEXbKUnbEHoQDgaIiMGTuXBUZjRd3Cnk4ZyACerCSu5ntVcW8ASBY9Y?=
 =?us-ascii?Q?eG5m4yvTmtn0W0UoADhL9oQf7QqDDudHT6PRGKCFc/o7gq7LdXvTtp05p77m?=
 =?us-ascii?Q?GxdFtKjzgrR0GYaTCo1Oka8hy049aHs0+VFawHr41FO2ZkoymrlnQozzmLEU?=
 =?us-ascii?Q?jglWJdKP6bg7hchOjmXxM00APQ4ogwPpx0sWbs3OIclm55LBbfDxhIpLhyE/?=
 =?us-ascii?Q?aBybskpsP4DOLzH1n130OfehsqNtOW10XNSLXTKI28ZFiBpXZLu05yPPxc+c?=
 =?us-ascii?Q?r+AS8eGizjP7HBKolBA1E01BxJNhfadC7ZHSCX9dqxZHxc3PyIXComVEemu1?=
 =?us-ascii?Q?XgFkmzWYCJ1ZdfLLoHtJkTKWAlCreDtG05JCmyb9A8+uWVss3nF8eCZ8nQPX?=
 =?us-ascii?Q?a4K4U6dSnpjr1pS8pMpDJXKXYyJgESixb46SuCnAIbas5YOoZc54oZK66jmw?=
 =?us-ascii?Q?o4ylh92k1cSBPz+VY0t+HgcVtlj2DOm0fmBgnjq0xZXeR/xVxRflJOmXbXcF?=
 =?us-ascii?Q?+MiSLKoADKPmOJ517JH6eDnA+kmJs417BVZcgQicQIaJ0mFmcfHu2FYfr+Ad?=
 =?us-ascii?Q?v7YQZzy87GFzfuo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB7984.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?n7qMHJO8h+nOltUA4dewy/7wsSDtykplljZ/2rHu4uklnQdIaGR1iZDjLpB/?=
 =?us-ascii?Q?kezSrsZ2IrNYtCIkZltsBjS5sUJiIVmU6nUAqJ+tJnr1Y8XaIu2b+AUk/D1r?=
 =?us-ascii?Q?VYWBAESW7AQzxlPaT1UYyxYJsVKKSgiUvnOqfxIWqrUP6cyf8gi3OysTnF4c?=
 =?us-ascii?Q?q5EuujoLU5vdyCy6gPy0/Jc6PcSPw93WaD6d1BX2KmJ49Tw11gync84LF6Ku?=
 =?us-ascii?Q?oSG3lk7d6qGSUws3MetglSO+IQS6h6UVPSvwyDMz9v1tdWy79SifWYP2/pCO?=
 =?us-ascii?Q?w1hnmnSXIXwIWU+gjT+XjdJmSwAajL5n0c7/6uB0B14vC3PHc4jK9mbLjC1L?=
 =?us-ascii?Q?BkI4hntoi8/R7NHOCXlezD8lEwp8AJDyk/Bp0KUSDSvx9LxZQYlBcxlQZABw?=
 =?us-ascii?Q?fLGqgMZeYweiGMf8mn6dMlTf0F1lqHK1ddvz/OOPRzknL5O/UL6Gz5LgM8G0?=
 =?us-ascii?Q?Jq+CWMu7NKWg04IunZsq7k/9mcYm2zWitqq7nW0gZ279X7xLdfk5cYJuIS5S?=
 =?us-ascii?Q?gPPPPQ1+KLwl+Izx7NXTii7JOtDpubXyF7AUizXRNLNpTMtuTKF7iwEn8sUb?=
 =?us-ascii?Q?viIVho0fnm963BdP7vFkX13hNO9/HSUfnZYLGa+/arPalIzqyvdEFMQwNKzT?=
 =?us-ascii?Q?ML7l5V+7NJQsJj/ZONU07epD8j9Cvw5ACdgJo72CZJzqPeRgRdWstTHkIvMG?=
 =?us-ascii?Q?YesEDlTL3QsEqB7dBjqEs8PwaEXU+Rh3HUOeSLodtroZJ4iTjQjaX7OtOHNv?=
 =?us-ascii?Q?BgBpsE6m957C/v9O4PWCJccYFgOowRJnETNgIr2r0Dx3QipGF6fgWprwEwUt?=
 =?us-ascii?Q?XF0KgZIzopOIPhHOXyfHEXACYsI7v+aeGKNAooyPQfFJsqCZQrd8VgBvMqZN?=
 =?us-ascii?Q?3T2hpSwvfXePyneJRnx7vfq2eh3ISMp9cUtPrWBpL3xXd6HFRas/aeJCN2BX?=
 =?us-ascii?Q?PclZkPShfdbKxfayLZNQZpwuv5cXwpdwjUVTNgdBXFghNjl1fY+r9FlF+9lR?=
 =?us-ascii?Q?um3Z1uP7K253LW3FTtN19RqvlRKOD7h6MsGfqXKQW5mf8Fnvrgu1HULW9OWl?=
 =?us-ascii?Q?YiiIbn6fh684V3Z/IFNkJSZh3zgr5qbmNXvJeFLHDIO7atdEQpTSxp+Nf709?=
 =?us-ascii?Q?MTaexvWYsJ+XO3hhoEpG26ZQcd0boG+TweTl+IVU3SuRNww1jO2aaZg9gveg?=
 =?us-ascii?Q?MC/bxLSYDFvDF6i7aLGOmpFr+OfITukbniTq6SDHuQomPhief67A6WFW/rEI?=
 =?us-ascii?Q?sBDL+6sDJwnu2pT3TwgRe6znMo5gX79nY5msjbIYP7MDwY1upL77BXQtTxku?=
 =?us-ascii?Q?xRO0nT2Uj998eb/FF6pB/Oqgl62NgJ5t8ZNtIoRBow28+n1kdsliN2daQprl?=
 =?us-ascii?Q?S8mn7wZOytcXqTfs53k3L3g4KMIn2lmnzmyhYBDZvVXyrfjuUDWRCKh+/LBM?=
 =?us-ascii?Q?MtDbULIWnDxwBRXktftDWXyEEA6ph+YhWG7TGBuzpxdAfocZLglAUrqM3caC?=
 =?us-ascii?Q?8t0K4bYImLAilz3B0mrHh6o7Me2lqSdxLfXuKf3SLLi6JxOq8BEI2oZlVECI?=
 =?us-ascii?Q?skR1LzBm+PSRr5f8LIYW14A3EyBLGXMZ/LQBTillHxdiMHSsvS1xsuVJSN8O?=
 =?us-ascii?Q?jg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ab564d21-61bc-4ce2-b9ec-08dd8647deec
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 11:28:59.6709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /zoZ9QHgNzGoFQ39PWIhQWrq6kwXikvmo8P92HJu0Ix1Vg7mVT380xxKaJYzYHYBqGVH+LJN5aGzGetbLGee86D4LSmTj0ZRmeSL7NVNgFlkN9X7s8YHbi/QuBs2d23O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR07MB8436

> -----Original Message-----
> From: Michael S. Tsirkin <mst@redhat.com>=20
> Sent: Monday, April 28, 2025 10:00 AM
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
> On Fri, Apr 18, 2025 at 12:40:43AM +0200, chia-yu.chang@nokia-bell-labs.c=
om wrote:
> > From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> >
> > Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not mean=20
> > that TCP has IP-ECN set; instead, it identifies that the TCP CWR flag=20
> > is set and will be cleared from the second segment of an aggregated seg=
ment.
> > This is used to offload the TCP CWR flag in a way that is compatible=20
> > with
> > RFC3168 ECN but is problematic for non-RFC3168 use of the TCP CWR flag.
> >
> > Foe detailed requirements, please refer to IETF RFC3168:
> > https://datatracker.ietf.org/doc/html/rfc3168
> >
> > Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> > ---
> >  device-types/net/description.tex | 33 +++++++++++++++++---------------
> >  introduction.tex                 |  3 +++
> >  2 files changed, 21 insertions(+), 15 deletions(-)
> >
> > diff --git a/device-types/net/description.tex=20
> > b/device-types/net/description.tex
> > index 1b6b54d..6b09f0a 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -54,7 +54,9 @@ \subsection{Feature bits}\label{sec:Device Types /=20
> > Network Device / Feature bits
> >
> >  \item[VIRTIO_NET_F_GUEST_TSO6 (8)] Driver can receive TSOv6.
> >
> > -\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
> > +\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with TCP CWR =
flag set
> > +    and follow the ACE bits handling approach mentioned in
> > +    \hyperref[intro:rfc3168]{[RFC3168]}.
> >
> >  \item[VIRTIO_NET_F_GUEST_UFO (10)] Driver can receive UFO.
> >
> > @@ -62,7 +64,9 @@ \subsection{Feature bits}\label{sec:Device Types /=20
> > Network Device / Feature bits
> >
> >  \item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.
> >
> > -\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with ECN.
> > +\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with TCP CWR =
flag set
> > +    and follow the ACE bits handling approach mentioned in
> > +    \hyperref[intro:rfc3168]{[RFC3168]}.
>=20
> What is "the ACE bits handling approach"? It's agrammatical to use a plur=
al while reducing the relative in english.
>=20
> I looked at RFC3168 and I see no mention of ACE anywhere.
>=20
> Also "mentioned in" is weirdly informal.
> described maybe?
> which part of the
> spec do you refer to?
>=20
> you should also expand acronims at first use.

Hi Michael,

Thanks for the comments.

RFC3168 does not explicitly discuss offloading, and one relevant statement =
is "When the TCP data sender is ready to set the CWR bit after reducing the=
 congestion window, it SHOULD set the CWR bit only on the first new data pa=
cket that it transmits."
Therefore, IMO, RFC3168 does not provide a clear specification of what occu=
rs when offloading is applied.
While the ACE field is a new terminology introduced in the AccECN draft, it=
 incorporates the AE, CWR, and ECE flags.

To make the virtio spec clear (i.e., without expanding on the implied infor=
mation that should be in the RFC) and simple to grasp, I would propose the =
following changes.
"Device can receive TSO with the CWR flag set and follow the SHOULD require=
ments of the CWR bit described in Section 6.1 of RFC3168."

> >
> >  \item[VIRTIO_NET_F_HOST_UFO (14)] Device can receive UFO.
> >
> > @@ -695,8 +699,9 @@ \subsubsection{Packet=20
> > Transmission}\label{sec:Device Types / Network Device / De
> >
> >    \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
> >      the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
> > -    indicates that the TCP packet has the ECN bit set\footnote{This ca=
se is not handled by some older hardware, so is called out
> > -specifically in the protocol.}.
> > +    indicates that the TCP packet has TCP CWR flag set, and the flag=20
> > + will be handled differently for all segments of
>=20
> the CWR flag.

Will be changed.

>=20
> > +    an aggregated segment, as mentioned in=20
> > + \hyperref[intro:rfc3168]{[RFC3168]}
>=20
> i could not find this in the spec either.
> "segment" is mentioned once, when talking about MSS.

Here refers to an aggregated segment (e.g., one big super skb in Linux) tha=
t has more than one MSS block.
And the CWR flag will be handled differently for all segments inside, like =
I mentioned above, as implicitly described in RFC3168.
Is there any other suggested terminology that is common across OSs?

>=20
> > +    \footnote{This case is not handled by some older hardware, so is c=
alled out specifically in the protocol.}.
>=20
> what does this refer to? which protocol? hardware older than what?
>
> >     \end{itemize}
> >
> >  \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO=20
> > feature and the @@ -788,10 +793,9 @@ \subsubsection{Packet=20
> > Transmission}\label{sec:Device Types / Network Device / De  \field{gso_=
type} to VIRTIO_NET_HDR_GSO_UDP_L4.
> >
> >  The driver SHOULD NOT send to the device TCP packets requiring=20
> > segmentation offload=20
> > -which have the Explicit Congestion Notification bit set, unless the
> > -VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the
> > -driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in=20
> > -\field{gso_type}.
> > +which have the TCP CWR flag set and require the flag be handled as=20
> > +mentioned in \hyperref[intro:rfc3168]{[RFC3168]},
>=20
> still confusing.
> should not send packets that require the flag? or should not require the =
flag?
> if the former, "and which would require" ... if the later "and should not=
 require".
> or better, make sentences shorter.

Should not send packets that (1) require segment offload, (2) have the CWR =
flag set, and (3) need to follow the SHOULD requirements in Section 6.1 of =
RFC3168.

Is it better like this?
"The driver should not send TCP packets to the device that require segmenta=
tion offload, and the set CWR flag needs to follow the "should requirement"=
 in RFC 3168 section 6.1, unless the VIRTIO_NET_F_HOST_ECN capability is ne=
gotiated, in which case the driver must set VI_IO_NET_SO in GSO_type."

BRs,
Chia-Yu
>=20
> > +unless the VIRTIO_NET_F_HOST_ECN feature is
> > +negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_E=
CN bit in \field{gso_type}.
>=20
> in which case? when it is or when it is not negotiated? or when it sends =
packets maybe?
>=20
> >
> >  If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
> >  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the=20
> > VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit @@ -1105,9 +1109,9 @@=20
> > \subsubsection{Processing of Incoming Packets}\label{sec:Device Types=20
> > / Network  \end{enumerate}
> >
> >  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL=20
> > -and ECN features enable receive checksum, large receive offload and=20
> > ECN -support which are the input equivalents of the transmit checksum,=
=20
> > -transmit segmentation offloading and ECN features, as described
> > +and ECN features enable receive checksum, large receive offload and=20
> > +RFC3168 ECN support which are the input equivalents of the transmit=20
> > +checksum, transmit segmentation offloading and RFC3168 ECN features,=20
> > +as described
> >  in \ref{sec:Device Types / Network Device / Device Operation / =20
> > Packet Transmission}:
> >  \begin{enumerate}
> > @@ -1210,10 +1214,9 @@ \subsubsection{Processing of Incoming=20
> > Packets}\label{sec:Device Types / Network  the VIRTIO_NET_HDR_F_UDP_TUN=
NEL_CSUM bit in \field{flags}.
> >
> >  The device SHOULD NOT send to the driver TCP packets requiring=20
> > segmentation offload -which have the Explicit Congestion Notification=20
> > bit set, unless the -VIRTIO_NET_F_GUEST_ECN feature is negotiated, in=20
> > which case the -device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in=20
> > -\field{gso_type}.
> > +which have the TCP CWR flag set and require the flag be handled as=20
> > +mentioned in \hyperref[intro:rfc3168]{[RFC3168]}, unless the=20
> > +VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the device=
 MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
> >
> >  If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the =20
> > device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in diff --git=20
> > a/introduction.tex b/introduction.tex index e60298a..d52622e 100644
> > --- a/introduction.tex
> > +++ b/introduction.tex
> > @@ -168,6 +168,9 @@ \section{Normative References}\label{sec:Normative =
References}
> >      Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Wo=
rds", BCP
> >      14, RFC 8174, DOI 10.17487/RFC8174, May 2017
> >          \newline\url{http://www.ietf.org/rfc/rfc8174.txt}\\
> > +     \phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
> > +    S. Floyd., ``The Addition of Explicit Congestion Notification (ECN=
) to IP'', September 2001.
> > +     \newline\url{http://www.ietf.org/rfc/rfc3168.txt}\\
> >  \end{longtable}
> >
> >  \section{Non-Normative References}
> > --
> > 2.34.1

