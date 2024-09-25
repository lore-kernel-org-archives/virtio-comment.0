Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E337015921D
	for <virtio-comment@lists.linux.dev>; Wed, 25 Sep 2024 11:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727264043; cv=fail; b=tDy7cCOVrq7Bqq6s80tqJG3iJ/artibSxjA1wRbViM12hCwhAI6e3taECEvgXF7ryiKo7poB8fakXBpzahI6NM4v8+EweXgHa6M+Zt3NzzhwkhNus7jqxmCPt3R58/HcwFVFcdxOr+fq/QBHxNA0uTKNQ04457W+G6Jh7GmL4cI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727264043; c=relaxed/simple;
	bh=eq9ILg5HNBMWadrDfpNB2J95xdtvO4tPFrg2mkqnSnE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kKdWi7iJdAsStHb+d6sCkYliJ4EZ+Nq6p6wlb/EoeQhETFCndccvuo5HtYvTZBQvfjwx9B+Tcl7U+bUemIb6H3bcJJvGNpXZ1vH48A3xMvKOPNO22KY+BVx2aAR7od4YzzkwQ6AU8cnt5jj0I6MyKCXa6Mrk7UajceHMYfuEUbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KhCNORQF; arc=fail smtp.client-ip=40.107.92.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KhCNORQF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYGlKdh3TJ8/OKN1kT2KQoXJiezisaFNMtcuYJ8kyX7J0fNr0cS5LcRDoc6kACotPIejC5g8SJMSlpSvgnFkI618BhvdOewDhmkoLn7dUqBoBztX5rrlwfqLh5Xdp0bTge6h3XeaboMZoJ6q7heKI1l3jxyJWCv/dAGYboGzFbp+TdwbgiQit09rPWaTlfA8p0YuRYU2F5L+0q3N1zfV4EBq79sRLVRnRyCV79J7HmyYktWCVJDd7H/x9FoRinHnyRLmtDp34PE+7oFNBR8z6adk+7pTLrl0JOnPUnlk9njlHDYQ0JxW6LqKTfNM52HDpo/HSyxaLzBEMYGsZvSZMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OntDLibePGzBW5sbZtSVgZmM+XWf6lZyrT3qxvVh1jg=;
 b=HpTCcsPXnoMG07jtp77QADEgE2C8RJxL/Ga977B8iHi1ijAErVHeEFnIy7sgNESBkFZTibgMSxs+7ww/fQuP9LuEb/QfrwCylbH8j2Fx2y82U2q4XQ3exqPh/Rd+XJe9YRhB0pFH3LJrrmu9VfOt6OkRPJf1HMMjWUzCGtK6xlEVdPU8Otj+MpmaaSJ/bcayjhNZbytaoN4l4Kkwwk9w4TOvfN/onWvLxUqN6tdCdjgmoyKmBtIKHDqNFLftKpgau97aEHYcFgIBzCrKCNWr/quG4s403MuB4LUhYYIa3LiQQOC9szv+Rcy90wBSkAeryQl4LMV2oerqp10VWY5Ejw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OntDLibePGzBW5sbZtSVgZmM+XWf6lZyrT3qxvVh1jg=;
 b=KhCNORQF6BxjY957O2G9TR+yHb5jrcXl0dUI2lI6L/a/0gNBveb0raEAXhJJgMUGeBjjEqiiyNoRDMbIoTE45pdUfsGpIFUGHgYgvGRfP4TyibK+MsMuVLeQxRy10DqTIV3JSduM9aQqafZR3mRRlqkdCYNtNt7ezdABD1n6mszrrJ1ivKcOwPj9sgpj+oq28Yq6gaUfgIkrFs2DAKfn4h8IWSFQ4V+pe9c4qTYkbsSuvMc/v8JJ8WDC3bWyKNSQW+7crCjACs9Cq5avWS79pcYFecMKubsxFKQsoNg5Tw8LvpOEhkVxsstISlupU3Uf8dIICgRmy55Pq0ArN+yaOg==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by MN0PR12MB6128.namprd12.prod.outlook.com (2603:10b6:208:3c4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.29; Wed, 25 Sep
 2024 11:33:58 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 11:33:58 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>, Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH v1 0/5] Assorted editorial fixes
Thread-Topic: [PATCH v1 0/5] Assorted editorial fixes
Thread-Index: AQHbB+XG22bbSO6HhUGnjAsPwWCkVbJZvB6ggABavQCADlbEYA==
Date: Wed, 25 Sep 2024 11:33:58 +0000
Message-ID:
 <IA0PR12MB8713778C6241F4F3D5D6A16FDC692@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240916030835.68178-1-parav@nvidia.com>
 <IA0PR12MB87130A72951032F2936544B1DC602@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240916043440-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240916043440-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|MN0PR12MB6128:EE_
x-ms-office365-filtering-correlation-id: 4e5e6dc9-8c60-41c0-a4d8-08dcdd55f200
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?epircTWcdlbbMfhwk3pn9EA9oJJGNvV5LwmQyAGESUJXNiKVEgmSg87oT+qG?=
 =?us-ascii?Q?wChWivD5GRYn46H8rd1DfsWBnv4bXMEY1SaXHKXHrHnF7u0rk5/Eo3b63fSh?=
 =?us-ascii?Q?63WvQ1PqdvtLCGXCYgE+xdQCp7OTJbBYHRmfInNM1KaTWoC0B5TyYVrZ5TQJ?=
 =?us-ascii?Q?VO9QmIeYGVk+GYa/Djqqc37QxpeGfMro6kaMgtMUfJvNACkqQDWkZPoCn7lh?=
 =?us-ascii?Q?bsuzmQPtpjKPG4Ot+NR8lHJfDuXMdfMSkTEnqj+jNWpFCoqLBxIPrh/lvZdC?=
 =?us-ascii?Q?IC9BYLaKscLdrkpNdYjoChBCUTAacqSng1FcLXMvEGUahON9bBvnedXVAOZj?=
 =?us-ascii?Q?45uXLPNBkJLSNpF9LaacMDgZuUDawyepZn9XAEQoloG41d7oXeCXsw4MELhL?=
 =?us-ascii?Q?ZOeT7ayaZv+4UdNzt8aPOClYFvsFdifgwVtfNEwPU5QF43XwHiV+ZP1W6qdj?=
 =?us-ascii?Q?RDb9KZ27saOnQ+DSlBJUcEu1o9HFw0vMGYq4ZIgax6un9ymJz32fMRuhg/Y/?=
 =?us-ascii?Q?x/+7T8YVzueNCVZsjJv8MKOPWvbwBk7xxNEEX9TJqcBPf0cHMqR0ew/+VHuz?=
 =?us-ascii?Q?nmTmChKtvKQ3dSF6GWU72ep7bpvmCrwUntPzUpJzk5VKM40QbUUOdSpm6mGk?=
 =?us-ascii?Q?GfLxhV0fZTZIeSs54e6HY3tKoYShYh8zYm3Jr2qRGmMflgU5izPAjPfdFtnq?=
 =?us-ascii?Q?8es7dcay7wCe/Am+jhjLUII1T4Jl2g/wdxGastCncLfgU42DBwQikr6GJOrq?=
 =?us-ascii?Q?Z8+u5N4qtdwoVyvxauWEB0dWJ16kq3NfJo55SvIhI4KkRs3f4jAs27q1Q16f?=
 =?us-ascii?Q?1YvkdI+oMIGwnRtxuAXM9B14h6od4OCIXyqA5cVDruXGIxnA1Ue2Uhk8Jp8Q?=
 =?us-ascii?Q?yC+0PzPYmzMD1JStaoHy3PM9oC1XM+yKiWVJItIiCpbXBfy2aQkQaJ35nGfn?=
 =?us-ascii?Q?ERimX4I8sgT+PzCtmQg2D8qs1ZY2Mke76ZihAECQMuFOGax6clEcNfSAWqHe?=
 =?us-ascii?Q?54Hu5tR3Kvzb9oTNg0iLAwJ80H2NW7JNDn9cengqfVEFbVb/en1UmiSUIlNt?=
 =?us-ascii?Q?LAGbcumo1fTlKNqjtJAefUMM1+q8FjrIbF26py64oRBFloi+6SpHTbJaSHkd?=
 =?us-ascii?Q?JTgJ5CxVwH0JZvN+1r2XhwzTWn7fZegE70nzPmeYz3LgGW80aOMDlcZbhmaO?=
 =?us-ascii?Q?k61TAoMShIIkTbjhYw+bwnax16bDX1oX2Bwn9PNYePDlkXooDXro3lApjUNT?=
 =?us-ascii?Q?q0Jn6EstPDhR4XE3zsqCtK29hWWtJUPOWllWGuiul3fVMmVR41cLNavuaC19?=
 =?us-ascii?Q?6wYr4MA8iN0LmhBY7YhhXVW8D/zljHCLfAMYtDE7wMfJJR+mymGvdF7/duwp?=
 =?us-ascii?Q?gPQ16z8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Qh3e5RoswXmTVxxqjqGfosWtC138HC/fTex7jI6WvLZ6QH2CUIqAabVVCY4E?=
 =?us-ascii?Q?JZ35+5VhsPPWkM1RzSxnoccefkX8hyCmueqK7R8PvFBPmujcX7HXrr65BGAP?=
 =?us-ascii?Q?rVJGMQtR6itQsUp7SI/7ciFJJZaNQ3WugrykWoHadNITdpwk8ZevVlWQUHTE?=
 =?us-ascii?Q?NjTV+0VtzDypeMh3U7XIS0/2M3n/KIoKFniR0/V++Xa0XP2n8JLCmyL0RJN1?=
 =?us-ascii?Q?i/BsReyJ944IxNstGNZjn8zcKkt3YJmaBd8tqL0kS02EsbWyOsCJPQPs714r?=
 =?us-ascii?Q?2RbWAlACkvXVF+4sn8/ckFsgqzYc9Fb9dOWyHHUfAl02YCPCJX50dHVir7tG?=
 =?us-ascii?Q?UuhaVROGhI3mLmtEMY0VAlLMflsswucIjXDdSgySDNvuMs+2CCNytdqdZeQ2?=
 =?us-ascii?Q?WwJKAeLCvJYrVx3JbKJw1NiaLkUTUBJV5ArIQHAGuvol8NciZqmNr+y/3NN2?=
 =?us-ascii?Q?1l/hgC9DZvy5yUagQOe3nMWweSQpNV7D+D1H+GXxWT6i/oDKnD8Rlvp6E+tY?=
 =?us-ascii?Q?s2rAZf6X4RLeClAefAMfZkI7d/DzkJtPk9tyM6l3DHykA+CXl4S+PEkXpQNM?=
 =?us-ascii?Q?5Ys6q0JAf1bPCmBbu4wOU2ZW3VXhMVt4ZVx6uK4nW+2Xl/CPNDcJM0dAI4u0?=
 =?us-ascii?Q?bCvTOi+l0sqGr47AnrrRYCplSV+scBxlxZ31SsKMzgWapqM35Lhgr5FyT1Eu?=
 =?us-ascii?Q?ex1/wk38yhjDkbnJdAuWoVDrb+q4jm0hUDAmjkBB2Gj4VgFt/n0EdG2OSzqb?=
 =?us-ascii?Q?apK5o44e4dOBC770TckM3rRNdlHRm+/H8zfG7W3FbS3naaa6uSK0+mEqt1gX?=
 =?us-ascii?Q?IJBm2icXptSLDIfO1SvdXxjLwYGJY3d+Xj66PaiVP4DToK04eDgCtHWR1Oi0?=
 =?us-ascii?Q?pIyyoLGa1Bw4v6mVEpa+5BGSQ7ypzNmuhnBpmkftVAWpG/epyFHQjUaTaMEa?=
 =?us-ascii?Q?4hQ+wutwHY59xVMmn62YJ18/eZbtxL+Y/ULWulLKB5ILkg0A80yn1usb0R3A?=
 =?us-ascii?Q?iLe23Mj2d67x/pIUsBp4qdfrxtkTZubyaqU2JG2hUr6QD0+Sh8lR2kC3SL48?=
 =?us-ascii?Q?o/w0gcln+0HR4mfREdBOcRWr1GnViWY9LTwECK5HuVZWAgJSH1oAfM/2U1yl?=
 =?us-ascii?Q?+AjinEG6M682CilDqyiUO2EewElzp/tKeMDFgt3RmftMVziaosCxn2uOf0iz?=
 =?us-ascii?Q?0xwOSr8G9ubXdWIzJ8DQhuKxVn2sv8TXKL5lbSOPzBgeegoZnsqf+IyDPIxY?=
 =?us-ascii?Q?8vTt+JuioPkwDbOJ2SyMaQeHn/SitNA0OO0MDR7NNbRRNk954Ozxa1OTCKOI?=
 =?us-ascii?Q?gC4M9311UpRf8UEyLYDmM3O36zYNV82Q0F6TUlAP4bDAYT8CsJInd0ohICOL?=
 =?us-ascii?Q?TyETML+ogsRm3UzTz7fI4ZzcVzM4EEnXpFSkvYBW8ty3O2nvar3WTNksGGAg?=
 =?us-ascii?Q?v6YnIy6hx/igMIeQkXhWX6XfwDeTq9myZZRXOoWkKe08ZMAo364xmmqCLlNI?=
 =?us-ascii?Q?nadfucWXuMSYH/YbKkuE0h7uGW7XLr32nzA4kHunSIeyxb+79gBV4D01wr75?=
 =?us-ascii?Q?P3vC9/GawRj6zMLcKORf81Uwl1pA3xUPF9+JgDb1uAwzqz3DZx0qjRxSXY4b?=
 =?us-ascii?Q?odo8SMBb9M0veXDI9HP/G8M=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5e6dc9-8c60-41c0-a4d8-08dcdd55f200
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2024 11:33:58.1780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d0eN49Y6q8ZgWl3DFu6BRYw0tOyCNRVL/Pkf8v77AT6YlrG3B86damgSHXjCS/hRIEAPBoMj6bWjAjR2i/B4lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6128


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Monday, September 16, 2024 2:05 PM
>=20
> On Mon, Sep 16, 2024 at 03:11:10AM +0000, Parav Pandit wrote:
> > Hi Michael, Cornelia,
> >
> > > From: Parav Pandit <parav@nvidia.com>
> > > Sent: Monday, September 16, 2024 8:39 AM
> > > To: virtio-comment@lists.linux.dev; mst@redhat.com;
> > > cohuck@redhat.com
> > > Cc: Shahaf Shuler <shahafs@nvidia.com>; Parav Pandit
> > > <parav@nvidia.com>
> > > Subject: [PATCH v1 0/5] Assorted editorial fixes
> > >
> > > This series covers assorted editorial fixes to fix name, adding
> > > missing struct and fix spelling errors.
> > >
> > > changelog:
> > > v0->v1:
> > > - added Reviewed-by of Matias Ezequiel Vara Larsen
> > > - added github issue link
> > >
> >
> > Please open a voting ballot for these fixes.
> > The github link is:
> > https://lore.kernel.org/virtio-comment/20240916030835.68178-1-
> parav@nv
> > idia.com/T/#t
>=20
> yes but everyone is at plumbers/kvm forum.
> Pls request it in a week's time, ok?

Can you please open the ballot now?

>=20
> >
> >
> > > Parav Pandit (5):
> > >   device-parts: editorial: Add missing struct keyword
> > >   device-parts: editorial: Fix metadata type name
> > >   crypto: editorial: Fix spelling errors
> > >   gpu: editorial: Fix spelling errors
> > >   common: editorial: Fix spelling errors
> > >
> > >  admin-cmds-device-parts.tex         |  6 +++---
> > >  admin.tex                           |  2 +-
> > >  content.tex                         |  4 ++--
> > >  device-types/crypto/description.tex | 10 +++++-----
> > >  device-types/gpu/description.tex    |  4 ++--
> > >  5 files changed, 13 insertions(+), 13 deletions(-)
> > >
> > > --
> > > 2.34.1

