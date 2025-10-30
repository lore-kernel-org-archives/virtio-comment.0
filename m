Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012036.outbound.protection.outlook.com [52.101.48.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67033312829
	for <virtio-comment@lists.linux.dev>; Thu, 30 Oct 2025 10:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761821846; cv=fail; b=bygT5TI88q0UkdiSjOuDvZSjmUK63ZHUQs0UEYRKlaUj88M/1HKjwciXKc9/5636l4c33ZXv+afZYTnB3QUNZ4VU3NUms2gan6nSwLqxfqyqCbG9myn6fW0LvItz17N4FwcMyp2sWlrMtTkNgGNJXEVe7V7vVA7yblze14IkdBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761821846; c=relaxed/simple;
	bh=ZGAWYYfmFG0Is7F0txTGd4RDffpLXKK7GHxPTYbs+gE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nnSKdNnxkHK9M4VLO/oQ1/gcDLmh0iEAH12eeErnV1k51T48FzWAYVgL9SQvJZ0gTIo6JWUIMa3C5qN76Xtp80tl6fDkV1ETna/NMAYkKjHbFsJuruPo1UEC7VPPb/v+r9QTmjNg5tZNR0aOtyYoC1rKTySFIbS/CX/nr2NiAIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h+IP/AJ+; arc=fail smtp.client-ip=52.101.48.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h+IP/AJ+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZ3rqabDZ9n/l0a93i06LsaFc0S/ElpGW5tw2d9ql2DuXfgk86rvcXUN6taWGq7l32MU1gN4ZsRz9eYJbdWdNtrCfUKgAhv3/DZkgqORk2F1J+SK8xLl7NuFtnW078+k0dx4ykVrf0VEu3tYQrDJksG1LKwKBAYvDw/BoJ1SW3cqcOi4Sl5hEwG/lKq8bQ5Q+kUdtIEdKr9kHX+Q50Ofp3C53GhB/82Ssssim3lI03p7HE2P8mdd9drAfiKYtAK7c6i6hjfOym7QbK3Y2nAMYyBqfWZrrQiJKFyB1FJUZ9v1XmNAvzZgHGrgK+qcn9ONtMA3OvKYqiiX70xq8pphMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5hs5f3entR2GgMwoLD9eu/7V9IuyGGg1JNh2AP2D80=;
 b=uLScntyshJko/SOY50fdG22o2CY/mYCObHzg8OrwuKxy35Ys5A5lG/SODCSAZp4eX4A9u/4J594ohLizECjraLPpVd+Hn3IgA/vOWMFp0RFMB6qakrsJHrRdgRJdq6Wao1SCDylViRfoyxkX+aoCLzXaJOixBAMQafCEnw45HLuRdVlxmDXhFmB+Ggn0lqhYIHcHx0cDn5POysEi9urCi8hQDwceDxxOorye8KUDlOYD8hyUqOrQQufKXGokVsa1x59+byM8KvCw2fIII3PzoyFUYnlrMnU9vRKJFPN2lqaZpokYvh8WM/UT0TT36KOkKW/AMjfqhWY9/FesOuFnrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5hs5f3entR2GgMwoLD9eu/7V9IuyGGg1JNh2AP2D80=;
 b=h+IP/AJ+ctvAVHv2GwGYo9p8MDI6zmcay9SPWZ0NLdDjB8BxYljosVNCkpuWGtYixDBCCn79IABIvLw8voAccugQsNTad3rIMdFryqFtc9mQpu+yxSVTmtGEBR/vqIyzVujUV1XOzpn/I1dcfRRlszsn+nlibnf/2eOi/5xRz742Yzdqhl9IOukeeH+dIi0ab4jtCLu1o3B+9YlBHZmtBLLiGFN9Wbd8qlHX21OosJJK/7rwWeezzfZlvHT13Dbj/2XmcSBe9Pl5pn0N95WYYCuggL51TWd+685lLvBhzUTN9BpDgKik6M6IZIBiAsacTuoBKCbroSFbcaE1kuxLQA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by MN0PR12MB6367.namprd12.prod.outlook.com (2603:10b6:208:3d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 10:57:22 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9253.017; Thu, 30 Oct 2025
 10:57:22 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH 0/4] editorial: Prepare master branch for 1.4 spec release
Thread-Topic: [PATCH 0/4] editorial: Prepare master branch for 1.4 spec
 release
Thread-Index: AQHcR2oUx7Fm6uhzsU2LljkS4jUGVbTWR0uAgAABzjCAAAD8AIAEPsDA
Date: Thu, 30 Oct 2025 10:57:22 +0000
Message-ID:
 <CY8PR12MB7195F98A28E03E4BA9EDEDE8DCFBA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20251027174756.56284-1-parav@nvidia.com>
 <20251027135611-mutt-send-email-mst@kernel.org>
 <CY8PR12MB7195D654CC8553C5B686105ADCFCA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20251027140542-mutt-send-email-mst@kernel.org>
In-Reply-To: <20251027140542-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|MN0PR12MB6367:EE_
x-ms-office365-filtering-correlation-id: 58b1a050-e467-4121-906b-08de17a31a4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?kcWiJMHikNiGPVtZgh8hsLOHlJA/7VVO3CcrFF8OyjpfgV6XsGbkswp6iw7O?=
 =?us-ascii?Q?7wKQ1DeJcmrpDe+0ioQX/6v1gwxmAcqiJq8ytHlhlsn8Hij+KoI6kR4LYsfP?=
 =?us-ascii?Q?YRTRN15cX8tKoJZynp71ELlVDmnyrJD5lolyk71rh9tWd1RMvtq52dMwQ31/?=
 =?us-ascii?Q?ffAuExZoZ7soqW6DqHKjK9Bp91e4/DJN0/jfVoNFZr7aVQ3GBF+rnbkfeesS?=
 =?us-ascii?Q?EmWYs8kZjd4EyacbDdxmrASPKFc1f2rcIsfynK8iyiVRMNPfDyoO1lswhyDc?=
 =?us-ascii?Q?jYQjSKMrQqay6ZjtR+cNQvka5yXGaMwGpOvWSu+DiOCOcuLREyy0PjAqRzH9?=
 =?us-ascii?Q?bcGPF0PmKaNy1uk6FWTLWqXuUWQWhDqI1oXcUSqRNxWhT2wAlOJbm0/3oCjJ?=
 =?us-ascii?Q?4Da/McuSXQ9LwYCS1unuArirrCZ5iFyC0SsqZQ+yLCMbBj3B79KiKfFU2byV?=
 =?us-ascii?Q?0l7T0JeBF35RxWyouGyeY4QR+lRt4W0CredQ/jOKi/DCHzjJBpixfZYcEZDY?=
 =?us-ascii?Q?4Hr7wgG+lSBmXGaLxKRGU25rL533wzp0zjwiRA/+oj1SGzn+oCS3S8ZcxYvz?=
 =?us-ascii?Q?XiWX49vLPC9zXbr58fHVCyX74kxmsTqd9RnnxlEeQy/6tvCsGHQui1W12StH?=
 =?us-ascii?Q?HjCyvtbevcvIk1WZcjB5uaZeqUeSpZNDRgHa5oitJeCbH2D6GsTpE/CPhTkU?=
 =?us-ascii?Q?WJPJ4yftx/IhYdvJwI43tJDt4ymT7r9dz2BWZTSP9bRVrq3i+yVaJx/sJyJX?=
 =?us-ascii?Q?uTHf3owqEDDFpqdq7RYvnyXE3F6LYdxdLZfXgs+GkbUONWj+MjG2bAIB+Fpq?=
 =?us-ascii?Q?u/Vip4j1bYIwBK4jDhELpBzN75hREbtLjXvA050y2r+5X0qF/TylbLC6Sgob?=
 =?us-ascii?Q?zaTG7rLryofSYcE+jKp8OKBbq8TNgpraPtUnwZ4hozrcJMgw4ryu/ox3flmx?=
 =?us-ascii?Q?O88Jib9sq4eM+2lbTLG/bd9ievaSzEIaolgaURrPDiBr6re+b/MvJL7imKjA?=
 =?us-ascii?Q?Akary+lycor6PgXeXQVXehomRFta0pIAzdw9nx7YMIXubNhPNTk7Ueusq8me?=
 =?us-ascii?Q?7OklU4aMqmwYyuTTGBvHGZutYgS0ZP0o3ejDYtYdvw4ii9LFaJXyBnd8xH9p?=
 =?us-ascii?Q?B+nB0+2IkTlpsh/zo/qqy3hIfjXonJuCH2vrjZ/Dn20vC3Z0BRhLAKm4NS20?=
 =?us-ascii?Q?Y8UnK2ahWlOm3S609swGJBxfJgoCWsahuSpaezRaoJE3DSiglyOI7ykjxJn/?=
 =?us-ascii?Q?s10xrrqHlXh7AAKvnYsJt6EDYo28P8JzXkIfbtTMUavotbD39O9donVcT5tu?=
 =?us-ascii?Q?pFl5o1IXBbmKpyRTQqHRj3S/TPHYZV6BB5jQgOiIj4ljzuBoeDXgabTjQ784?=
 =?us-ascii?Q?5fF2GlTE8alHvRZB0g/DOmkOVy8MPHchigzCYMih0+X1R4D6Cgc+ah0qVefN?=
 =?us-ascii?Q?1FUloFC9TJu9d3bdMdiqUe9tPzWfTjRNerxnn/i4Aq1l7QIBOgCVuDl29KGs?=
 =?us-ascii?Q?ISo3mqK3sxs5Li3106Up+lfy1Cr8sZNQ2Vgx?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tx8rQ3Mmcf1h0ZXitbCwWdgpD9gkMZHV5QjRT0TMgwd4BltmFd0tgrfSi+1+?=
 =?us-ascii?Q?1K6yEShyi8/zDtheb7OhnVcgJwtdYGgb6uD2Ntwg7wayMBBK2DzYCRnfy/6H?=
 =?us-ascii?Q?2ry09Z891BLZvbVhxxx6i++3AjO0kwgymKGOumJ00y1g+orzIYG0BAjPFnqZ?=
 =?us-ascii?Q?yDikRuHfThQ1ua1HFlVjcKV5yikkq+mVXwTAOT2Fc2xEbqMCZlLbtGZ/HoH3?=
 =?us-ascii?Q?wZzJ2DVSO+PLmktsrLxTkDpwf6tugJY3In6Z0cu75olKXTG8v8Xp6rZYZNdV?=
 =?us-ascii?Q?Ucwf4FPODK2OGNpZHVbJwqa824hwrxpvqVZ8xaJCB0pA/9Nfgf1DSvISHIEP?=
 =?us-ascii?Q?t2pbUsdJU+IC2Z6DpFY4s8X13SyWRWFG+S1M1eKcJuyB4VvxTsknKpbl52Z1?=
 =?us-ascii?Q?zbc8lHI+ngvtPOHfxMuk6GNrdy1arMdayr7B2dA3xP1DbSlYDm6pkOQs5BRu?=
 =?us-ascii?Q?opO/fNxnaEOGdZN0QHl8kN+89Mm8BHFxh/sTna2EvbQfLG1kvoQdqB6eNepi?=
 =?us-ascii?Q?Js7q9sQEC1xzwLTX93z6nPB89paOc3HXWpIJvymCCzbUsm119xDO5MwN6Am0?=
 =?us-ascii?Q?sEwi8sTbF/zCPKytA5m7FIFGOMvcEB31u476N5ZbQzvBlYMVziN+x45G6Fob?=
 =?us-ascii?Q?z51gv22q18oT+/oK/WevM28gUycVG9M10L5kfGzY+xUCfplgpFTnNUCkdzK3?=
 =?us-ascii?Q?Td2fXFRjIGcayql6sfMa9T27WpRtmUSbdJv2ot/U0jqaoHuIE1+MmH4dFRR3?=
 =?us-ascii?Q?jZQAEmhsLQD0KIoKlroLRaGz2pSEOFvOHwThcI9cVtrM5QV3jqobPBMu7FJO?=
 =?us-ascii?Q?hzB4CaduNLN9QGOXM7K0tfs1Fxgmn3ZIBhbtPxXfyetQ4LyZhtPZyjUYGvHj?=
 =?us-ascii?Q?QQ/lvI2Lp+2+NMiS5wwXxtpKdejYSXKmsIx9Tv4tb8AWD+E7uyMYBimZKvDN?=
 =?us-ascii?Q?e6CLPMomC/ID1V/Rhc4jIx6l4bwZmJ5cZg995ys+zdOa8k/K9JH6Xu+qHZ8w?=
 =?us-ascii?Q?S9zhTkxarf8JWfc9nPCYpKo0xQlgWLexhcCf9KW0vIb6sUdG92rewUrDRKkB?=
 =?us-ascii?Q?pCpNomyFvgLsySL4ixOPWjPZYpx1vlPVG+3rggjEci4IE3+GfqW3JWOoPkrA?=
 =?us-ascii?Q?Cx39SWrRlQvSR0cW8vafckdXz95R/vg1tWZGdpEe6k6v8JB8wAO8tI4TmuWt?=
 =?us-ascii?Q?+zpLn5SR0g98Q5Fzps3Op2YzeTRvvqSAuSLwRagjzcXGDEGSfmEmSW52oIIF?=
 =?us-ascii?Q?BOrr864Y07gxpoXn0Elib++3JcshGulZpk1WDUkCXKWz2RgGzR4TxK/WjRsg?=
 =?us-ascii?Q?pFhnPRvSfjw+nRye/saNC4pjSe2sPbqT9sMElernvQkHjpBHkiFpZNY2ue8h?=
 =?us-ascii?Q?MlxlXzW+iujSgPqmELbUIwe6BDsT527tmwBXF3PurNa9hNxnopp1cZ/ERbAd?=
 =?us-ascii?Q?crSpW1z/NcudAWb4Jqoh+84rzkyl2cPkCqPwourQJu1UbqF+ctHFF0T1r8HI?=
 =?us-ascii?Q?hcIWFNNDoBefCK8wAbiLVK8eNtrZWbPzgWEBt5eAcQpl1ozoqdHAn7bGqRdc?=
 =?us-ascii?Q?3ilmbtvg7VHFOfvFLdT9FjdA/UJXoOwCiJbQXWNJkgyRi5bXAkOjyrNany2b?=
 =?us-ascii?Q?bcgfIWP4lvdxN1e6sb58DoM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b1a050-e467-4121-906b-08de17a31a4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 10:57:22.1406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M/j19TJOaIeb+u6Iz5GbXgC/BjQF4x0r1NZhWVXuw/hLbjhZKjSluSwLfL8BmHLmqrdMcFI6WHVBlS9XTwM+yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6367


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: 27 October 2025 11:37 PM
>=20
> On Mon, Oct 27, 2025 at 06:04:22PM +0000, Parav Pandit wrote:
> >
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: 27 October 2025 11:27 PM
> > >
> > > On Mon, Oct 27, 2025 at 07:47:52PM +0200, Parav Pandit wrote:
> > > > Hi All,
> > > >
> > > > This short series prepares the specification for release 1.4
> > > > version from the master branch.
> > >
> > >
> > > I noticed you updated latexdiff module - intentional?
> > >
> > I didn't. :(
> > Latexdiff is able to generate the necessary diff without my changelog
> patches.
> > Below is the version I am using for last sometime.
> >
> > latexdiff --version
> > This is LATEXDIFF 1.3.1a  (Algorithm::Diff 1.15 fast, Perl v5.34.0)
> >   (c) 2004-2018 F J Tilmann
> >
>=20
> changelog is not supposed to affect diff at all.
>=20
> Also I think we need to have changelog 1.2 to 1.3 preserved for now
> (separately).
> I do not see it there.
>
Ok. I added cl-cs_1_3_to_1_2.tex to v1.
=20
> > > > note:
> > > > makediffpdf.sh still have fails and needs resolution. WIP.
> > > >
> > > > Parav Pandit (4):
> > > >   edit: remove old changelog
> > > >   edit: add changelog for 1.4
> > > >   edit: Remove annotation of special character
> > > >   REVISION: update to 1.4
> > > >
> > > >  REVISION      |    2 +-
> > > >  REVISION-DATE |    2 +-
> > > >  cl-cs05.tex   | 2120 ++++++++++++++++++++++++++++++++++++++++
> > > >  cl-os.tex     | 2605 ++++++++++++++++++++++++---------------------=
----
> > > >  4 files changed, 3407 insertions(+), 1322 deletions(-)  create
> > > > mode
> > > > 100644 cl-cs05.tex
> > > >
> > > > --
> > > > 2.34.1

