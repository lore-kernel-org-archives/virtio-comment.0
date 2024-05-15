Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC074EB23;
	Wed, 15 May 2024 10:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715769178; cv=fail; b=uC5rso5wIEhTLvYnf8qJnQZb6TUej3+4GG5k24wixtzU62ZWhLx+M0KePb8LqTufMTgWs+0sbTLUjzb3sHdV48Ejyx5FHNKa7GYHGFEN2PKzYSCz7RAlj1XNLQuXU7BZdAAbn1L6MS6dIY2bv02b1EMvxvpexr6rkidtPUn2hhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715769178; c=relaxed/simple;
	bh=8L78V1cQh43Y7HsDDkIz/on5iuPaXsobXpPC6qG0BvU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lZrFq09b/znbDjZRlj9srIoyyJkYpVYuiX2N4PN0MKQlTtEAcdWxBvs1JfFe+UhlR38ehmOhY51CX6iD1tlIQpgU112WXs9qmiylFYwqInnMJnMPazTOseydkQH+BW5epTCCmb9OHp57WJG6q0/G/RsYv+GL3siCVHWTB5VfMCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tzGTtIeV; arc=fail smtp.client-ip=40.107.220.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tzGTtIeV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZ5QQ9zaYxCTZDzomDich0X2DpBvb++MrZQG2fQgiFNOVmzuPdNDKod2miMbN+rrCYjlW1/tj/ZSnnfxob3zyQBFtQoq4aFE3Ho/hbmshth7D09g+SMZVjwPvYKt+1/DwDiys+29odLqPRnoQKn2lfPbgrXDMYnCoYmjZGysYXW+Sk7sAOX4jPt3AftDE1SX1e3lrTEjLldE/iIoWaSjyp9WXunmj2SDyZXzKkBCDYA4l8myiGexm4Gnj39UTJfOKS4qc2oV4LY1P6pSVdaHO0f6+azXSyXWUACpIIzmJpiSKXLP0k9lSC59GAuymm/+zTbI84lmVX6rUwb3spslaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OaHGuQe1DiBkghMkBDEnpdrgn1IgVjNL9lHDU52ZzU=;
 b=UXT95YvfsXbFt72rhL5YTlYHanR82z8HBjjLG9/gRnTLxbepFuR35allc40VRJVuLd0Euz3mvC/9Z2iq70heq3l5wozcCkGhBn0/oqRW+eFYtw7PCKGvhC2ZLpxKUL1HqWkpCCOnA6C0IkxubqTByI1WXRh7UkTXj2cy43qjRV9+pSYNgaN8ucU7+AQQSyoaiHI3cEsnpbk4NVEGmhXyzGen7k2jwknOPX0tsfTJgJ2d42midSwTqg4RwXE4IZuxwm/3J/PLmXSvdJ6y39S9R5G7ZBeadu6FkaQn0iQeosW2bp7t7cPXeV6IPs94rytQxhNJTjOgYKTRlCBIK46Nfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OaHGuQe1DiBkghMkBDEnpdrgn1IgVjNL9lHDU52ZzU=;
 b=tzGTtIeVUiV677sk/nilKUVugZuIvFGCMPMwC5fl3CDVEmvr9q0YI9Iq2UGtHksRcmIwmGL5BNE5MUKp2iE39jleuNDPWdeHVsj0JI+BE5HUB5XwVBG3toq02IJ87zA/XcNbV7OqJCooNQBQlRVbqZ2wCIfGVJGBewl6XSU0S2HRWilRqoi3skNmJDq5qYmbeLYbXXToqGnzbqbJx7gpgSdA+V8UoBMHqL5Cq1qb0wuIcyxX6jdFQToXaPNjw9a4ViZ2foplGE36GhcN9CKzS8stfGyqiG8/FRTSQ12et0hgP67Gkgaa6njrWiKEPBe67Ti+JrcZhDqERx0RSztXKA==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 10:32:53 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7587.026; Wed, 15 May 2024
 10:32:53 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"virtio-dev@lists.linux.dev" <virtio-dev@lists.linux.dev>
Subject: RE: [PATCH v3] README.md: update mailing list info
Thread-Topic: [PATCH v3] README.md: update mailing list info
Thread-Index: AQHapq3cqOwFBT2zLkCXuuWIgQjcxrGYE1qAgAAFLACAAABCoA==
Date: Wed, 15 May 2024 10:32:53 +0000
Message-ID:
 <PH0PR12MB54818853B8A407B6F2A3D463DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <8f5db33c96d685fcebca3579b05d09b64dd720d9.1715766697.git.mst@redhat.com>
 <PH0PR12MB54818B506EFE9E4ED61B4294DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240515062910-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240515062910-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MW4PR12MB5667:EE_
x-ms-office365-filtering-correlation-id: 8891316e-19fe-45de-4596-08dc74ca6087
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?OblLmB00KW56TmXZEuSRitwaoVDSyVLArSTeaqA+OyOODtsrvETiIPoIyUFm?=
 =?us-ascii?Q?Q0rQmBi4Lf/L/s9wp3oFmYsAxbbSTc6gwWz2Ee1mfepz3ABhe1LiqycMcxt7?=
 =?us-ascii?Q?7nF4hPilU4fXy494BfHAwwh6dnkDtoxsBUTzELAodqESceoRn0VTSUuohCCT?=
 =?us-ascii?Q?83drrfVcOD7eIV6DpqQRSvEIxGMlbl8r0ZQloRF51peRmp8werIByyxSA9Wp?=
 =?us-ascii?Q?7AHa6Up2g0mOZGpNnz11grXjBGba96gbjFX/uSFQF7q/d+nnnMSgZi2wc66f?=
 =?us-ascii?Q?TbL1dqv62SsNbud2oLwxssGh5serZe670hfwMaJlt7+Om0vOUfdt/DkoCB5x?=
 =?us-ascii?Q?9K21YKHiSBFQK0h03v6i0CK1BwzPUwPVUQIvh3KjRk+iachaB1FWUd1EABpu?=
 =?us-ascii?Q?/uvqpa9UcEAce/yluW2CBRQ1oHuFk+tGzUUuMdgUJYg4tJ9nH/xG/j2Sqg1i?=
 =?us-ascii?Q?qGgr8aldqHFg3s0L3GcqQ6tUhplYE2weK9FxZNxGYbXY9cKgHy8PmWx3Jldv?=
 =?us-ascii?Q?V1lNxqr3u/gL3QLTb8/vHT6SjDrJ/eUljFGyQPGTknIUSbDTkkTTW8dAw3C6?=
 =?us-ascii?Q?ZMUTRUv7AOzsE7rIwt2GeSX1sk/62TdbDWAduxMX+DBV7YfS361JTnzSO5lA?=
 =?us-ascii?Q?PJV/jTi/PvoOeyVy9cyxtzsYt3YtIhsvNe5Zt6o0KU6e9kWUzoL/zzOjjzR9?=
 =?us-ascii?Q?gBfkDC3ZdF8kCLiFjkoFID4G9L1oNXDGVjjQ5S0MA8tthMAR4NJ603hz+JVC?=
 =?us-ascii?Q?6UeC7U9hTNOme0/RgnfpyTMYdwn50GJkc0NTpkIWrkfYzCEAwAIx9PoA0N/a?=
 =?us-ascii?Q?ZUlOzh9KU0VN2rIrL/snc2q+aZBCM+ZR6LCT50NMB3p7DsbhqOcYjiT7sgZI?=
 =?us-ascii?Q?lU2v2D3/aDkFHmBsVYkwxmS9PEJBwUXZ2EYrpyvxEOEoqHnIEHvDDSYgl163?=
 =?us-ascii?Q?WzCNXPglSC0EVKF+vNFgNgqktueamsiC1GNgkd4mn5Bmy79VvgdlCpCLXFuf?=
 =?us-ascii?Q?toIl/qCcCDOdI4bwxHKOylVOnlY6yIxsDkMNyrh6fvaC7VMddvs231NXnKUy?=
 =?us-ascii?Q?7Qzdn7nWSjLWJmKsDkDVlZIVAy/qTb5PUnFp68WaVej/dFTXjPeE9KXk/3s3?=
 =?us-ascii?Q?FPwNgp0JzxLmgRKJsKGI8Nu6LfJ69P/FVYiIlQ4hS1RU7y4phAI+BIlLTvGL?=
 =?us-ascii?Q?SxH8NHmnnAN7wM8/JOESTDDkXQTtQyeVz++XCcNbChTUyrX32MFgFYIroNtD?=
 =?us-ascii?Q?4AbkiIb7P6GOWHEmdZGI9ycM4h+oPu+QR9NObtofbWM3kPVdrDy3sLVVgIn0?=
 =?us-ascii?Q?svU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pLX0l422YfTpYLHjGEuFGFMB6MsDKQnO+k6HIWimzswvemKgoti5u2bc5XfB?=
 =?us-ascii?Q?zu2KlS7NvjnstIFxsoAXrydZSkJOEjxO9+xXco74W4aiPYgs1Z4jyasiIxsQ?=
 =?us-ascii?Q?rNKFKmvtWChkH20Wc5MgdWIcl5Kk2nPnpVGV+3FB0a8mss7ojfzrkmrIiv5g?=
 =?us-ascii?Q?Cho4T20Xq8QhEfSDkx+iKsjkgtPl1ARpfs0G9JsBViixCWv+dBCRWjzHvmgv?=
 =?us-ascii?Q?2CW4i7CC8nB6vlIovgYXCIXVIa7kLLIryYJ/ZBTYI48Z7xqIOg0bo5cyv8mj?=
 =?us-ascii?Q?cqnVpgHChqTHSt5vCctcuCHbACD++9d5kSpdmYelNHX7B+mOPIKbyNUTl4LI?=
 =?us-ascii?Q?mJ+caHKAgKaiZEISlu4zVFOu3lGGhvUYsA85+xFoIkActvjSdZtJwmpOAUiT?=
 =?us-ascii?Q?Zt27MYiLcprolidTV02Ay6U2kAnLoRDtvCXpkkdxEAYcVAucBDwdy+YoxGiz?=
 =?us-ascii?Q?zqfOf95i5qbeb4UncLhUNZCJ+my5Tz3kSr2YPfs8RDZfz/iU4YmkRGVWy46S?=
 =?us-ascii?Q?DDdMpSIhWOhg215ubHRA8aKXZDYaTLcs3o5xP+0Ak2YMT7G6l5vEBR0YAkXM?=
 =?us-ascii?Q?baG4VBVFg0XzgFRn5VzuU3oWC5JMoa360+D8qHCQWNPfwW0yzst51Nul5y03?=
 =?us-ascii?Q?owXrxdgF27jmf91ywJD3oknfXbUphs2eajG5flhp1ZAOj3GBXCW6AeQN7SX6?=
 =?us-ascii?Q?VsI1obeLOc28HHmGOMRlx7PtFoNEOyt4sESqcj7vUUicqF/hy2ydo1Md2VEq?=
 =?us-ascii?Q?z4UttIkKiowRtyUQq54veItCg9FJ7mM09o/pVhzClUo2GadMhJlWHtvIM5s9?=
 =?us-ascii?Q?isx8WWpNW/gzAUEW/xbArutYnrHCDMABjCpA637iNev/9xSS9pjJ/qbrDQnw?=
 =?us-ascii?Q?TkMCcyDTGK+IZKy5KQrP12I5CXjnblSpSb8UwCuAlQ5B9ZkYZLHHNUlWwZXx?=
 =?us-ascii?Q?KImZPMM9Jj+aeZwG8FU7a00uVawO8FfFT74WKXtp7hi/OKtCvcyWM20SIeKX?=
 =?us-ascii?Q?Ib/uBdc/8wpPzgbWWqu7xuNSD7O6c0ylWCIcZtSwidcno9DyRvrsamaHVi+c?=
 =?us-ascii?Q?cF9KEUx9fiBiPZTRoELciK6kyglJPF39cnDQzBfpMZWysfMnDUmMxA+czq4Y?=
 =?us-ascii?Q?KHGhypM2OgNe9Vkp8yVjCliGQgEDro9tyEiaI2MeziABuSTxnTb4K+wl6war?=
 =?us-ascii?Q?kDXj4M7xOpOo6aaDRTpRb7zkL6ivj6nN3xoD52lX6gKKsgI7gDz8pJ9aI86u?=
 =?us-ascii?Q?tjCzKkliNhllLf5qJQWrPPDQdLz4Oxru0qeKfrQAR6rmar7L/WPJleBNxAWw?=
 =?us-ascii?Q?d0hMoj3kAy1iCp1/6OYDz/La12gus82Ph+1yflzw+Djd/d9DpemxTA7FTMaR?=
 =?us-ascii?Q?rE9gbmUM5MvSbd3h0VOH7lq/TUX3t/vpQYN16mpKvmkUakgGhDr7ZT/I4HFT?=
 =?us-ascii?Q?RtaLqoSCULeg8H0tkzlDJV8+R6d7movieewYfNQxP2rTXJT75BjDsxIbDgTO?=
 =?us-ascii?Q?pHLd4ily5gLs2/RclGUgNOEf0uVJ9adL6CF2+NFXbrIkLKRJaZoAZC54slrk?=
 =?us-ascii?Q?p8+vZvgLHspR/hHIEzk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8891316e-19fe-45de-4596-08dc74ca6087
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2024 10:32:53.1422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9TmA0xG9pKe7rGvbnwUt1+jOGXp71uQK38C8dFIaxk3Pg0WS2ANZOhBoT4OXlMH5T95MDwutFvvrH4AtJg40tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5667


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, May 15, 2024 4:01 PM
>=20
> On Wed, May 15, 2024 at 10:14:46AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Wednesday, May 15, 2024 3:23 PM
> > >
> > > As approved by the TC, we are moving to a less formal way of
> > > discussing the specification, on the mailing lists provided by the Li=
nux
> Foundation:
> > >
> > > https://groups.oasis-open.org/higherlogic/ws/public/ballot?id=3D3820
> > >
> > > Update README.md, CONTRIBUTING.md and newdevice.tex accordingly.
> > >
> > > Use this opportunity to explain when and how to use each mailing list=
.
> > >
> > > Oh yes, and device numbers are reserved through virtio-comment not
> > > through virtio-dev. Correct that.
> > >
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >
> > > changes from v3:
> > > 	update CONTRIBUTING.md and newdevice.tex changes from v2:
> > > 	Use this opportunity to explain when and how to use each mailing lis=
t.
> > >
> > >  CONTRIBUTING.md |  2 +-
> > >  README.md       | 80
> ++++++++++++++++++++++++++++++++++++++++++-
> > > ------
> > >  newdevice.tex   |  3 +-
> > >  3 files changed, 72 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md index
> > > 1330a98..ee7318e 100644
> > > --- a/CONTRIBUTING.md
> > > +++ b/CONTRIBUTING.md
> > > @@ -10,7 +10,7 @@ in the TC's technical activity is invited to <a
> > > href=3D"https://www.oasis-open.org  (Member, Voting Member, Persisten=
t
> > > Non-Voting Member; Chair, Secretary...)</p>
> > >
> > >  <p>Persons who are not TC members are invited to open issues and
> > > provide comments using this repository's <a
> > > href=3D"https://github.com/oasis- tcs/virtio-spec/issues/new">GitHub
> > > Issues</a> tracking facility or using the - TC's <a
> > > href=3D"https://www.oasis-
> > >
> open.org/committees/comments/index.php?wg_abbrev=3Dvirtio">comment
> > > list</a>.  All such content created in GitHub Issues and/or posted
> > > to the TC's <a
> > > href=3D"https://lists.oasis-open.org/archives/virtio-comment/">archiv=
e
> > > d comment list</a> is governed by the terms of the <a
> > > href=3D"https://www.oasis-open.org/policies-guidelines/ipr#appendixa"=
>
> > > OASIS
> > > Feedback License</a>.</p>
> > > +TC's <a
> > > +href=3D"mailto:virtio-comment+subscribe@lists.linux.dev">comment
> > > +list</a>.  All such content created in GitHub Issues and/or posted
> > > +to the TC's <a
> > > +href=3D"https://lore.kernel.org/virtio-comment/">archived
> > > +comment list</a> is governed by the terms of the <a
> > > +href=3D"https://www.oasis-open.org/policies-guidelines/ipr#appendixa=
"
> > > +>OAS
> > > +IS Feedback License</a>.</p>
> > >
> > >  <p><b>Use of Contributions</b>.  As with all OASIS Technical
> > > Committee assets (TC <a
> > > href=3D"https://wiki.oasis-open.org/">Wiki</a>, TC <a
> > > href=3D"https://issues.oasis-open.org/secure/Dashboard.jspa">Issues
> > > Tracker</a>, TC <a
> > > href=3D"https://lists.oasis-open.org/archives/">General
> > > Discussion List archives</a>, TC <a
> > > href=3D"http://docs.oasis-open.org/">OASIS
> > > Library</a> assets), content placed into this GitHub repository is
> > > visible and publicly accessible.  Subject to applicable <a
> > > href=3D"https://github.com/oasis-
> > > tcs/virtio-spec/blob/master/LICENSE.md">licensing</a> rules, the
> > > repository content may be re-used freely, including the creation and
> > > publication of derivative works.</p>
> > >
> > > diff --git a/README.md b/README.md
> > > index 2bdf485..c06caf6 100644
> > > --- a/README.md
> > > +++ b/README.md
> > > @@ -76,11 +76,12 @@ font packages.
> > >  <dd>
> > >  </dl>
> > >  <h4>Providing Feedback</h4>
> > > -Feedback must be provided the <strong>virtio-comment</strong>
> > > mailing list, -and archived in the mailing list archives.
> > > -<p>See <A
> > > -HREF=3D"https://www.oasis-
> > > open.org/committees/tc_home.php?wg_abbrev=3Dvirtio#feedback">
> > > -https://www.oasis-
> > > open.org/committees/tc_home.php?wg_abbrev=3Dvirtio#feedback</A>
> > > +Informal feedback is accepted through the
> > > +<strong>virtio-comment</strong> mailing list, and is archived in <A
> > > HREF=3D"https://lore.kernel.org/virtio-comment/">the mailing list
> archives</A>.
> > > +To provide feedback, subscribe by sending mail to
> > > +<HREF=3D"mailto:virtio-comment+subscribe@lists.linux.dev">virtio-com=
m
> > > +ent+ subscribe@lists.linux.dev</A>, then after confirming you agree
> > > +to the IPR sending your feedback to
> > > +<HREF=3D"mailto:virtio-comment@lists.linux.dev">virtio-
> > > comment@lists.linux.dev</A>.
> > >  <p>Note that only plain text part of the message is archived, and
> > > all attachments are stripped. Accordingly, messages sent to the
> > > mailing list should use text/plain encoding and not @@ -106,8
> > > +107,38 @@ Signed-off-
> > > by: Name &lt;email&gt;<br>  git format-patch -o proposal1/ HEAD~1..<b=
r>
> ...
> > > generates a new directory proposal1/ and a file starting with 0001-
> > > ...<br> <p> -git send-email --to=3Dvirtio-comment@lists.oasis-open.or=
g
> > > proposal1/0001-*
> > > +git send-email --to=3Dvirtio-comment@lists.linux.dev proposal1/0001-=
*
> > >  </code>
> > > +
> > > +<dl>
> > > +<dt>When to use the virtio-comment mailing list:</dt> <dd>
> > > +  questions and change proposals for the Virtio specification,
> > > +  including the specification of basic functionality, transports
> > > +and
> > > +  devices.
> > > +</dd>
> > > +
> > > +<dt>When <em>not</em> to use the virtio-comment mailing list:</dt>
> > > +<dd>
> > > +  questions and change proposals for Virtio drivers and devices
> > > +  implementing the specification.
> > > +  (please use the <A HREF=3D"mailto:virtio-dev@lists.linux.dev">
> > > +virtio-dev
> > > mailing list</A> for this).
> > > +</dd>
> > > +
> > > +<dt>To do:</dt>
> > > +<dd>
> > > + send email preferably in text format (best for archiving).
> > > +</dd>
> > > +
> > > +<dt>Not to do:</dt>
> > > +<dd>
> > > +<ul>
> > > +<li> copy both virtio-dev and virtio-comment mailing lists
> > > +(instead, pick one); <li> send full copies of the virtio spec (in an=
y format).
> > > +</ul>
> > > +</dd>
> > > +
> > > +</dl>
> > >  <h4>Note for TC Members</h4>
> > >  <p>TC Members should review TC specific  process rules under
> > > "Further Description of this Repository"
> > > @@ -116,16 +147,43 @@ HREF=3D"https://github.com/oasis-tcs/virtio-
> > > admin">https://github.com/oasis-tcs/vi
> > >
> > >  </div>
> > >  <h4>Implementation discussion</h4>
> > > -Implementation discussion should take place on the <strong>virtio-
> > > dev</strong> mailing list, -and be archived in the mailing list archi=
ves.
> > > -<p>See <A
> > > -HREF=3D"https://www.oasis-
> > > open.org/committees/tc_home.php?wg_abbrev=3Dvirtio#feedback">
> > > -https://www.oasis-
> > > open.org/committees/tc_home.php?wg_abbrev=3Dvirtio#feedback</A>
> > > +Implementation discussion takes place on the
> > > +<strong>virtio-dev</strong> mailing list, and is archived in <A
> > > HREF=3D"https://lore.kernel.org/virtio-dev/">the mailing list archive=
s</A>.
> > > +To participate in the discussion, subscribe by sending mail to
> > > +<HREF=3D"mailto:virtio-dev+subscribe@lists.linux.dev">
> > > +virtio-dev+subscribe@lists.linux.dev</A>.
> > > +After agreeing to the IPR, to participate in the discussion, send
> > > +mail to <HREF=3D"mailto:virtio-dev@lists.linux.dev">virtio-
> dev@lists.linux.dev</A>.
> > >  <p>This is the correct list to copy on Linux virtio UAPI change prop=
osals.
> > >  <p>Note that only the plain text part of the message is archived,
> > > and all attachments are stripped. Accordingly, messages sent to the
> > > mailing list should use text/plain encoding and not  have any attachm=
ents.
> > > +
> > > +<dl>
> > > +<dt>When to use the virtio-dev mailing list:</dt> <dd>
> > > +  questions and change proposals for Virtio drivers and devices
> > > +  implementing the specification.
> > > +</dd>
> > > +
> > > +<dt>When <em>not</em> to use the virtio-dev mailing list:</dt> <dd>
> > > +  questions and change proposals for the Virtio specification,
> > > +  including the specification of basic functionality, transports
> > > +and
> > > +  devices (please use the <A
> > > +HREF=3D"mailto:virtio-comment@lists.linux.dev">
> > > virtio-comment mailing list</A> for this).
> > > +</dd>
> > > +<dt>To do:</dt>
> > > +<dd>
> > > + send email preferably in text format (best for archiving).
> > > +</dd>
> > > +
> > > +<dt>Not to do:</dt>
> > > +<dd>
> > > +copy both virtio-dev and virtio-comment mailing lists (instead, pick=
 one).
> > > +</dd>
> > > +</dl>
> > > +
> > >  <h4>Use of github issues</h4>
> > >  Note: according to the virtio TC rules, all official TC
> > > communication  is taking place on one of the TC mailing lists.
> > > diff --git a/newdevice.tex b/newdevice.tex index 28e1c7b..ed0124b
> > > 100644
> > > --- a/newdevice.tex
> > > +++ b/newdevice.tex
> > > @@ -29,7 +29,8 @@ \section{What Device Configuration Space
> > > Layout?}\label{sec:Creating New Device  \section{What Device
> > > Number?}\label{sec:Creating New Device Types / What Device Number?}
> > >
> > >  Device numbers can be reserved by the OASIS committee: email
> > > -virtio- dev@lists.oasis-open.org to secure a unique one.
> > > +virtio-comment@lists.linux.dev (after subscribing through
> > > +virtio-comment+subscribe@lists.linux.dev) to secure a unique one.
> > >
> > >  Meanwhile for experimental drivers, use 65535 and work backwards.
> > >
> > > --
> > > MST
> > >
> > Reviewed-by: Parav Pandit <parav@nvidia.com>
> >
> > I see that patches are posted on virtio-comment for balloon device.
> > Should community wait for this patch to be merged or ballot 3820 is goo=
d
> enough to consider this new mailing list active?
>=20
> I would wait until next Monday at least. Give everyone time to subscribe =
to
> the new list.
Yes, make sense to me. I assume you would merge this patch before that? or =
this also needs a vote?
