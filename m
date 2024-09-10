Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4459A1552FF
	for <virtio-comment@lists.linux.dev>; Tue, 10 Sep 2024 16:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725986546; cv=fail; b=awpQStkT8XKqCk7S8/0GPGyT5Qn56ASLWKp9dKvg6cVTnbEOu5Bjz4VGuMuLE1a7SM1Vm607+CU5pe+vxnjN5LviGIQraoSitxlHbMTtA7yYIkgwOU8PTFqOFV/mTGQRLKV7hWhUJsAal6NVKDpbdMJZp/uowuJdYZ+ZGUe2FNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725986546; c=relaxed/simple;
	bh=brCYxoX5bTZn9XlcCZfR3pZEGXLqUfI63AzgmRogva8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WORqXNTCQgQCjytlw8yF77YwK1dz+O+FVmd4OX1em7xhA2WH4MMvIFziVjbF0PAfZ1GYHTtcS4I1bFphwAYjJj8Ai5M9z0FHkd9znSYI/0eQzmRZjdwFqpCQmSTNcmGCCjPTNaKeZvWgTZEaXn6AlqVKQQOOLQy9/EL38iZpETU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KXP67ofW; arc=fail smtp.client-ip=40.107.237.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KXP67ofW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/q7qxM9HGXSFSNVJzEJuW1L5eiGRp54113M4KXzMJAYmUfxcqK5BOg6GmDIJjKwHUfLT8Mr4XI6WS/qor37UgjZn88L88n49bYKyfofedR6ASfxzEDF6lAS4mU9TUL71+nI257efIwjV3Q/S8JY18VJPYaJbplwQBhF3015YTz/In/ia+V3PtuGt5OmQdJedRBiDswzevngDDFHmZjyA6Y6FtEcQMFJFW1LcpXwE0ax70/tbWSsQm4WeVFIV/2/jX7tQAObhTiunbRsMPsiA0FCG9NZdqXt+XyKf6O8aDW5z/lSNYUssm3EmFg7Rf2IrIEf//EDlgPe3mSGExv/Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0qaHPNcjNO9E6yh/Q+ZTgDSFOTjAKewB1/J5Gvx2p4=;
 b=ChsIQUz5KgDWAdO/+2+FfsMoPo/n6fftiAMRGoumegexUhe4rHdyh7+TJEEPDYhyiKp00CNBVsk84rkq91SXuNmiviYW87xi3Z16mtYapF9Ejr8filOX2f+1tukzryCVhp0NUjGV6YWuCDDTStdMm6Yo37tbdqaVVyxjpx+e75MIdua0NXEnUsZJdG1vowwdg2Sb2/YBIa5mEL0wHYPnu3DdkaBdZzHrrKMxV7gybfPa37zWJ3arrAaVp//+PmkmWp6FYu/ENFxrI41yA/LlAGsRnyHjkLp2CzUeHACc1gpIgRLzO21PXoEBWmt2wndvMBvImSjLgnkn2nOMkIWIRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0qaHPNcjNO9E6yh/Q+ZTgDSFOTjAKewB1/J5Gvx2p4=;
 b=KXP67ofWTHdwH2gob9Gd4aJerdgK3mV/skwwVi6aX+CoP0vdhF1MBGDlU3NdMJbKhSgmtzLJPjnFcTVMG7By0Nbq+r0XyQBf+EZzPLHayL7LPUkDOe0JLhF8HjIWuUG9Tr1b/LKJlRuQTJEI6pOqQrP3R/1/TT91uyj1VbhhIj6H2qA74YYp0ujvCUAr7UNwTC1sT6grQDiLndW8rFiV266JVzZIRTujBmxNBi28Vc/oti+5OwJu1f7B6jPuMO6jM6JdeCommkKJi/JjxGGxvStb9jKqIdCf55734H/hLtCdlHPedbA3+83PA4ikVve38/EbNoLcAvRWpt8Kl0nVwg==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by CH3PR12MB9145.namprd12.prod.outlook.com (2603:10b6:610:19b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Tue, 10 Sep
 2024 16:42:19 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 16:42:19 +0000
From: Parav Pandit <parav@nvidia.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH 2/3] gpu: editorial: Fix spelling errors
Thread-Topic: [PATCH 2/3] gpu: editorial: Fix spelling errors
Thread-Index: AQHbAU42aqePadYzYk+6MPen+yTBpLJPgcGAgAG8LDA=
Date: Tue, 10 Sep 2024 16:42:19 +0000
Message-ID:
 <IA0PR12MB87130B3DF934B4698C6DB9D1DC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240907174819.778971-1-parav@nvidia.com>
 <20240907174819.778971-3-parav@nvidia.com> <Zt8CGfndBTIpbXQX@fedora>
In-Reply-To: <Zt8CGfndBTIpbXQX@fedora>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|CH3PR12MB9145:EE_
x-ms-office365-filtering-correlation-id: 36495c5c-dc3b-4d7a-dea1-08dcd1b78963
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?UO3k1tegeYeoMDWQbdWekR4hROvnMTJ96gEOegX6VrO2nVh56kCwZ8gyFzYm?=
 =?us-ascii?Q?ZdBNQS6/PFcJHTyDClLBR6ZKs/rX3JWft19DtTISF/HdwQ8K8Bh8jgEXlojO?=
 =?us-ascii?Q?/tDlj7KCofi+XsvVXKYe+6ZxjRDNWQbfbdVfyXZ254QP5incYZDUE6nVoh1A?=
 =?us-ascii?Q?RIC/WofGUtlBwfnuhNSMI3BL5N/0sV/pdxB+p7hlUX/AJeh7Wb0OIltkwbMQ?=
 =?us-ascii?Q?62znUzdt6qgHUwjkgHOW9FN6KmNh3s/AUW3AbVNZZlhmvRwrllaqkssvRk1D?=
 =?us-ascii?Q?MbqazTIDlNSVPPwUEyZ6m6b+4tJrhcSnZa3ahiAV6E+Q5aEc/G8XjGexOCA2?=
 =?us-ascii?Q?WHMTeECRbmWOxxFQFCwDrGmOrHSMZfJ1PN4DzXjWaX8ogBSuhVisKIxRWl+B?=
 =?us-ascii?Q?CkFphNkg5MJc83HJaEPuspXT/peY+qBz7oYJw4sal6u0KPe7CxxaIToGmXBt?=
 =?us-ascii?Q?pJlYtNe/F/KqWzNoWUQ+FLfP4sUyZvUYNdRqGRtUWM+enWXPHV+hscV/SRhy?=
 =?us-ascii?Q?uvPZ5BYzwUCm/wFT6iINIDaJKpM2MCSLj9/wP4T4avv6ce41xsXG6dWEFJFB?=
 =?us-ascii?Q?zKT+Qb7hKxbUKCXKfwaU8+/syN+S4WydT7KPVP21P6xsQkfA+HArn0+0qi2x?=
 =?us-ascii?Q?dctErV9HuqAveooVmDdmJJOC6w83F1qhlQ4vYmLPx444JJB2UxGzGyEf3aRD?=
 =?us-ascii?Q?W7nVexalVu2/v962KIrZPH9AfkWJ/vt2fcgcgyBFbPDF3pjlb64U8t5ZWHrd?=
 =?us-ascii?Q?paUjHCcjFJ3xxqObbag0X+h18LX5XefL1/cIVFEHFlLCnp4X4+hTfw528yLB?=
 =?us-ascii?Q?jm5qJGolDc7piDJBNC7E1+VjjMzkBCXDBl7uNh0vIQrIRElLHtCl0S8AjYhv?=
 =?us-ascii?Q?bGcA4W9tN4SN2Kw44+Ek1zliAL6s+2RM/AsYy8ofrdpzT2apCmqhOPGtVnUl?=
 =?us-ascii?Q?S+J4kduwBFIGyP+3PJptMrwEQNk1ZXgYjKWwKqFvmeWIJ/YBDMcgSmXOsGP3?=
 =?us-ascii?Q?RNmCY5LfxrzyhBwxqPUWCUZR3eEuHnhHNjsx6YXH7kQvsshy1gLgXfswHo1z?=
 =?us-ascii?Q?T4lhIRW0guw1JaFNpAJgXhkgUnN46p9u8NfQs/yf5yM8k2Vy3hZl+bs8bCU/?=
 =?us-ascii?Q?fzDtLbPa61PQ6u7g/h83q6sLMw2PeyCjGiRAmqLyjy2EjrJIUlSozffR/sDt?=
 =?us-ascii?Q?ZtbfKLJaQP6ickpLla9o0jmD7tD3WS9+hzYKkEMeJNxzq1HVbmqs8EuarUG+?=
 =?us-ascii?Q?/ex0Vi3hg9cY/j0nl2A8YwTUj8PsR3oXQTdtTiZ4zN15hTrMpuxrtkWHOW85?=
 =?us-ascii?Q?a2Bf+BTtyn75yp1oFq04JboFprKZFdJjj7yer2NViniL6ZrpIq8BvIemfHTf?=
 =?us-ascii?Q?vtXbC9LhWC5odBdE3mYn+J9nOXWEYJeNZ5s7r0umMjwL1nWt+g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MOWaIWtdT6IKVqNVf+qQ2OK8ZMoP41EMqQY6pGdxfsbRjRKPy4r5Hkh2W7eZ?=
 =?us-ascii?Q?GqgAZfHBADku75jkNDCs8lEESJezooxJWBksfRwBm37fo90GgtnqJVB7rdw2?=
 =?us-ascii?Q?KSMjHQGVP63NHlvJEFD5lAmvwW/ZqgbakmXjeQyn1N/tgcrNALhZkCsi7Duj?=
 =?us-ascii?Q?E+ZQ7jo+LhSkt/Foq99f7p+29whW9HoCe7rYBUQPkEA2zyCAbkG1YW3/I1ix?=
 =?us-ascii?Q?1N42SxWnpdEMvsNA0XYeQfzLs4y9Cv3RZdA50h1GImf3daRWIeH8M6mvUvjL?=
 =?us-ascii?Q?p24OsbxOHKngvzS48dS2Xze0YdHBYatJSCbJMLm71FfU0NlRyZA4zigrrDTs?=
 =?us-ascii?Q?L3s/jnGh5KYA6v7ffq3flT32Rtj/LaTt0aUywWIlXiTBDjI+c3Uf3KAF0ymn?=
 =?us-ascii?Q?H9fLFzMpkFAwXnCiAiq+QxVs9LVpKFCgcYRIfo1e77U/zEXBHtPf5zXfkK0p?=
 =?us-ascii?Q?CglaTimQjEoec1gA5YmtOPbKWDyQ62uZIDkD85N6033GiZ1GKkGgjRNETwhL?=
 =?us-ascii?Q?aN07kmnsiHDtLJaIYvEMGjFBuAQ+QhlPqJn1VOCnsNHKJdJptAM7c79toyD+?=
 =?us-ascii?Q?UlIU4ozyYGLHIH+b+LaVS/TW9fNtq7PGgqUNecgbw335rHtpZ/xYIoZp0nmN?=
 =?us-ascii?Q?AAlI1aq//fnpP6SIrBNxLV1j4ugpNwtRZbSpXtImvf0NAXMyECt3sAARKG3C?=
 =?us-ascii?Q?MvVD8ylRIu7O1taUa+NloR8cbfR2lmz5kO98KpY3TNczkgN5N2OUkOCXYjLL?=
 =?us-ascii?Q?fVIEChyHIA47mg6bn7tb7pgx8/2rlmUcKR8QyjWQkw+cRRuPPSV/s2B7zYEk?=
 =?us-ascii?Q?UMBG6lKPiHjL3JAWJ4Azq+O6DjmDen16VTXZ4vyvz3Sl33S7nWkSIttr0RYU?=
 =?us-ascii?Q?mnwlUkcD2Cf4D2WvlTBqDuHDpSSBZBC8d5cYTLhCczs/4dw5RqXNVtEMbw/a?=
 =?us-ascii?Q?5qy6atZB1PZAP295W7TRNjsDpnhcMkzbRSXb1+lALWAOAuM+dF+wJRHpZGHh?=
 =?us-ascii?Q?T6z8Lf+CSYsI/bbUU/WdnC4VW6R4veD6FwTkhsVANSN5b6zyhBCB/Qm1kUXl?=
 =?us-ascii?Q?BudI4VQkaowgD3l3JgziSURQnwCXf0ovUc5L+IgDtFvmQinIiPWc8qhKeCDI?=
 =?us-ascii?Q?fgH5DF2Igx2Xc2vankQwogWCiDn8Sreiud/T3MkUgvQ3JMUKjVXISAP521fo?=
 =?us-ascii?Q?gDFjZI41xvaMMOTsWwz2s1JE3g7T1TpJgc48YEYNhzncohaNu9/LUd26ZK/4?=
 =?us-ascii?Q?27Ey6Q57AlPbcEqlsK4Qb1sd6Wy6sWuEEcLGsjLaXqPN+Us6oNxeKqX/yYgu?=
 =?us-ascii?Q?mMT5pIgsDj99GoOVtC+RNFY8ib7mvKd+MWcbsO5osqDNOe46ayD4yGQ8Xs6O?=
 =?us-ascii?Q?Fe4wpLHAxPSDFHJkxRmlFELwTT492Fyo0/ymT/Wp+326+n5YmmT2SbNsZB5P?=
 =?us-ascii?Q?QqF9kKjJqFOI4LRqt1Qw8dVaVUsN2y8ublUYRNOrAxWnhN8n3fHsqux2baCz?=
 =?us-ascii?Q?GejGi6xtab2tW80bfW4UHPT0ihUjkbelRbHlsD9MTIaUkdrhTHiAzr6JHrmf?=
 =?us-ascii?Q?1pXBKwqjDy8qNMaAKIjax8Z6RE8x6t0vp3pq37ZGSq4IEsVBOf6IvlT1k+qD?=
 =?us-ascii?Q?6hv1r8bQA4I3h49sfldrEI3xjmIafw9nh0uhwAvkiuln?=
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
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8713.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36495c5c-dc3b-4d7a-dea1-08dcd1b78963
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2024 16:42:19.3985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RiizsZCMD+XxZwyBNN9pcZHR6ynXnF/O0JX/9h+IHmuT/OKASWHn6nQFJkG/QdIwHuQv6jkdnQyn2kGzD3+q1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9145



> From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> Sent: Monday, September 9, 2024 7:42 PM
>=20
> On Sat, Sep 07, 2024 at 08:48:18PM +0300, Parav Pandit wrote:
> > Fix spelling errors.
> >
> > Branch: virtio-1.4
> > Fixes: fed64230bf31 ("Add virtio gpu device specification.")
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > ---
> >  device-types/gpu/description.tex | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/device-types/gpu/description.tex
> > b/device-types/gpu/description.tex
> > index 66e4873..ba4ea76 100644
> > --- a/device-types/gpu/description.tex
> > +++ b/device-types/gpu/description.tex
> > @@ -166,7 +166,7 @@ \subsubsection{Device Operation: Multihead setup}
> >
> >  \devicenormative{\subsubsection}{Device Operation: Command lifecycle
> > and fencing}{Device Types / GPU Device / Device Operation / Device
> > Operation: Command lifecycle and fencing}
> >
> > -The device MAY process controlq commands asyncronously and return
> > them
> > +The device MAY process controlq commands asynchronously and return
> > +them
> >  to the driver before the processing is complete.  If the driver needs
>=20
> I think here is `completed` instead of `complete` although it is not part=
 of
> this patch.
>=20
> >  to know when the processing is finished it can set the
> > VIRTIO_GPU_FLAG_FENCE flag in the request.  The device MUST finish the
> > @@ -345,7 +345,7 @@ \subsubsection{Device Operation:
> > controlq}\label{sec:Device Types / GPU Device /  display).
> >
> >  The \field{enabled} field is set when the user enabled the display.
>=20
> I am not sure if it is `enables` instead of `enabled`.
>=20
You are right for both the comments.
Will send separate patch to fix them.

Thank you for the review of the series.

> > -It is roughly the same as the connected state of a phyiscal display
> > +It is roughly the same as the connected state of a physical display
> >  connector.
> >
> >  \item[VIRTIO_GPU_CMD_GET_EDID] Retrieve the EDID data for a given
> > --
> > 2.34.1
> >
> >
>=20
> Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
>=20
> Thanks, Matias.

