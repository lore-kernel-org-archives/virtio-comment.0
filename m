Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08881741C8
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 15:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720798202; cv=fail; b=EhvlMPUKnRKjzig+sA5Ahayvt/P0ttRKTstUn9ciUbTvYCdr+c9/0Dal26jEor0Jwvgt0ueqWZJ4+uyqmEaWI9/3QVnHwnTtAdNJKulASrmcHQ5mZf7YNwDbelROjlxVw6Zfx2PnENYm7QfHVg4eozOcHMKSqiHERO9tfnXEk4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720798202; c=relaxed/simple;
	bh=pIIE01C+VaO84xoOwegTOVUqI01Y5BdjapI2Lqhb+TE=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AoAM6ubaDkqMb1d0Vdsd0KDcUqeXxggJ3grTBCs89fiB3eRBVSMDD1J0Ip874pbQYah+cVcjG2Nux5Po6UFapADbw91eX0YgAmNAtFpeOWZPe/TMsZN7aWkvNF+UVMTCVzo4mU5T12mqCDofKdcsV/+xgjsm0OawLuZ71i+qrEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TCuyRLTx; arc=fail smtp.client-ip=40.107.236.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TCuyRLTx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PiIWpt7Mk0OdC/X9cn8uKBkhWj5wFkJU1H7QEsf1Nq7PhTuZBhKgd8BTdlnAiB5nAZWDb1S5pJdLuMtDXOrS5J/Z+EXAVFAx7PSlFXrkOEL5W3w2zPwXlx5PU//xuUw0pQemt1GX+kODjDDBzHGThQK6H4zbx5MXoWRd4vaqEtV2uC1PKrN+kPBoMmuhfrQvkH1Fz3h7v8R/4h/AurryVrUo8ybKZ2wbBNIS8y9IE47Ey9wwUq4NrzCepide6rPgMUAqhZekVhZOmj7jBjjMdK+LUT/5s2HG4HDCbx+7+6lFX1Nb0uPXH8nEVcYWCF9Ij19gVUukRYc3pRkKxL2gGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnfMV/tzOJB53PxQQcGTCbixFqeuDpXwcawMOhT4kS4=;
 b=PlAEyD6oYjjfMfG39CjFBdOij3n6y27rZqXruFX0r28MkEZXXZuXzuPFleWzWJDEx3gZndT9EilIrswN2HNlA8T8BhHvlfp8ihHuZC8oyuwoAw7msoqzBqtkBeWOW+pMSqo0TsYrczcBgrr93BBSElBgLHO788g/j3WZMHgHkAFowT8PjFzXyCHvyFbEOzJAGG6gADYAWctxh0nI9pp4fae4REb2+QhzqR9WeXlRXcpMLUZht+LGZ8ZTcMllw30ISiEE/zePvCHZsWNnXT58/bfVPzMOAGEutF6/zw7bmXkCk41MKU+0/6xSfZo4FDjmc1CTo+z9+45oxZ8wcAf5eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnfMV/tzOJB53PxQQcGTCbixFqeuDpXwcawMOhT4kS4=;
 b=TCuyRLTxij3fTi9CuykZSNnk6HEguKSAk87BUtCsGtbUik7PISAiPSPIqn0i4vwYPuArlZgzFj8MoyVk/VW4BnPtsLIK0mIF/tpUXGq/K3tlr89tMige4MlElFveuKeAAX+7zd3HgvnlDWUw41WGwSyQN9HV/QwzM6IVY5Qa6kZ3SUO5ItRSWL24WDisTj3fVVwD5ranQU05Ioc19tW32YaHGDrKfQDDCc2/j6goZCRT1qRwFeKY12nunTJMOLPdQfVlCA7UfG9w3krA5utk3dcNsLxvoGd5IDfDUcSuLHm5mW3srYJuDD07CHAiKHe4UGkN1OD3uSLvzkoRyYlSww==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by SA3PR12MB8438.namprd12.prod.outlook.com (2603:10b6:806:2f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Fri, 12 Jul
 2024 15:29:55 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 15:29:53 +0000
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <pandit.parav@gmail.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>
Subject: RE: [PULL v2] administration commands for device parts
Thread-Topic: [PULL v2] administration commands for device parts
Thread-Index: AQHa1GB08HLy+kBRb02ltULJqKUVa7HzJ8QAgAAN+cA=
Date: Fri, 12 Jul 2024 15:29:53 +0000
Message-ID:
 <PH0PR12MB5481392736D62FAAFCD35CD1DCA62@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240712133550.3271761-1-parav@nvidia.com>
 <87cynibs0t.fsf@redhat.com>
In-Reply-To: <87cynibs0t.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA3PR12MB8438:EE_
x-ms-office365-filtering-correlation-id: 667815ca-0417-43c4-6eeb-08dca2877a52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?JnZIuqF0iEdoImRz9lJ6kVLhxa/Lhfo5f85TdCm/zoHe9KsYoRTESJbJs62O?=
 =?us-ascii?Q?qV5NaTO3iGaYg8+CXACxWAvz4GFyU43DvGGn2aCxPmG0cU+aXJlfKkUoKl1d?=
 =?us-ascii?Q?ATAZasacWSoE0FTyDlwNZ2jTtfJFlqNyR+9pucHFGi4kIKaQlI0vRPWn5M2d?=
 =?us-ascii?Q?HO1czw6eBq+4IMXzKGbjKisL9ce70D32Tj0bMz5ArRKj6tBSnB2Eaodkm7Gz?=
 =?us-ascii?Q?7eKAATNw9HPwJ9CTV0u+/DAPxzLkldDfylJ1Ia1xfhFRavlMGBJ8xjkLJ6J3?=
 =?us-ascii?Q?PupzD4OI4KMFzK+o99dx5WZSiTkMPaQtWP/fxjHp/XqDfEe1gKgYXmRXhEAQ?=
 =?us-ascii?Q?C4J+Shr+k7E1D64EcT5GfcQz0AC6PjWGxDB+rUnEcvnUVW+aEdX2nP8qkfj7?=
 =?us-ascii?Q?YqwtZbW4mvdt0JdXrms++rbTB1dWy7cmVFL603VuMjyfwdJAgbLowAhAOkLS?=
 =?us-ascii?Q?nK8sCw6+dfI/fXngKslvBR6L8zMUGudmI2whJjs9s+4qGPowBfmKZ4m426IN?=
 =?us-ascii?Q?cF2C7vX0XJ8rsVO6SDS1dIOyv+3Tc8w/jhJgid+HEWwHQT0yOkmZQeTpAPZB?=
 =?us-ascii?Q?KnbW/x79YpEtUk7rbxNz2z8PauCUt01JXypxQgcX5LPBgwcp/SP+seIStr/M?=
 =?us-ascii?Q?NCHgDxVy+uYE2X1FEQ9lPmXQhCnK/ajMOOWZSwSIpwYc/eNRg+PGNw+okHUk?=
 =?us-ascii?Q?6ib5GpfTaoS3W0KdUSUQpqSfFFZWAF3crd18MnwSz7sqm3QF2QlrBpkTQkUx?=
 =?us-ascii?Q?oOtuMXcfovtz/1yQXzAebVjPbrOClOYK5bx4BPkADt7dGcRLRUU8LJXh8dqy?=
 =?us-ascii?Q?hcPhdnhV/zIULqZYp+Sz8HkHmV/gUcq1bYzz1hjo6NlRYA4dqQHSTlMZ3v7p?=
 =?us-ascii?Q?f+501dxsFg63lGuJOfkTPj4MJuGn2hobAkjwwjpt7tzgTLoz1O0KTyeoUkyt?=
 =?us-ascii?Q?FX8jwOXS3Az/GcrV8wHtpADAuRWggEiCh+eSDNsPsiT7e5X/GlpPSwVkgpsq?=
 =?us-ascii?Q?+NJgXwXd6F6I9LdpApRz6DmOfcY29agBt95l/p3jPRIEHr1f9aXYECqH87AI?=
 =?us-ascii?Q?nUJbCxAbLLSnBB6Twl4PeBoXz1JKmnrM9u7DjCu73bnWsHgA6JLOFPFlJCdw?=
 =?us-ascii?Q?iMENEFxofVoPP4lYWV4bBKglS2ix70lAPH+qRJAaEuDGPYfPF86ZSms7wuKV?=
 =?us-ascii?Q?cWSMKwseSvsyIIkP3uVN50w5N9Bv43VS7JbiL7cy0pwZST33ic7XEhJCglLy?=
 =?us-ascii?Q?1ZZgAKFlBMAw9nHSvsjzWnUUFh/xUIf/dtrZ7crNQ3bI4wrJHMaFyHi88NIN?=
 =?us-ascii?Q?3wgwZg9gMHMczGao8a+cBvuvIsnGwTsa5Lr/Gf0x+jEPFN/L84tzPMfx3ejq?=
 =?us-ascii?Q?tzV/Jmw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ge8/GYQ3VJebdno+hcykzjkj8PDwLa5Zt+c4HpkJ9iJ+X5M1vYK78/BnA8iZ?=
 =?us-ascii?Q?gwzwvGJwRFNFm6v+0oEbhgbF00CAhYot8ByrgRnG8FQJbg0zzA1vQJQkDBcM?=
 =?us-ascii?Q?eUp8ImR+Z7WqTl359rRHGQzrBqrXGIVujVwmxRQ530yGWV2bCKiNPo5wjOvL?=
 =?us-ascii?Q?3BfpkjVOvj4dFI5nIVi6TDGJ3baOy0RCfwa2bObCIkjc6DBFPT5DYD0sNlLj?=
 =?us-ascii?Q?5pBRbUTfuZgTrMYoXHCFJ6DSlUp7pmlm4K6qzf+Zq6tIcrZVhGtOsJXgQnGO?=
 =?us-ascii?Q?a5onIN3WR5bakYot1Dn/1snltL+CvypWpO18cuGivtMqBsUhY3/ZwbLuIO5q?=
 =?us-ascii?Q?IfYItxEVv6VoFGQGqknjRRf0UkRxEC1QM+25DLggPgVovQR60QppYeF9JXdg?=
 =?us-ascii?Q?tjb6g4h3bTCGi6f37PlE08v+lhgZynd970NnDaDZCbP0TAlFvLI9fkJ+uhsT?=
 =?us-ascii?Q?8EDubzUGsWq9BNWyfc3vUC4+apbtrjgD/mAq4pE7ZPO63r9YSiwkGkn0Hkow?=
 =?us-ascii?Q?Vw8aae+5WhGgQTAVfNlS5tIKk6KkR+S58iyom1AjPFcBn3CceTxJPbW+NdRI?=
 =?us-ascii?Q?g0pwY0IEoPCRg3+xjRpHKtxcXwOQm0XgRFC6k7Yyf6jZzjJtuG94KFqXoJ//?=
 =?us-ascii?Q?bbmitEILLWz9hf3og4sBVrrbTv/7WJVZ6d63iz5sXhrvuDoOfjgyDxQOpk0Q?=
 =?us-ascii?Q?1guNO5FzfoiDnFiMlyiIvKqsN3/iFxW2Mg1yTRXuWGKyRXH+znjXQLR/DB1G?=
 =?us-ascii?Q?BcraVfRp4+IsdzvZFChD1iMiF2Oxlm9OZvKTqK7LyxYz2oQ0KeikyKWgRcJh?=
 =?us-ascii?Q?7b84DAFqMwg8wQ7IBGL2+KfeXogh4aCTqSixU4qMPD6jNzOwIZVU3PSCnXE1?=
 =?us-ascii?Q?RIuFMqGrd8AgxUTRC4J/ErCCFlzSJ1+hrBfSDkLSQmEIVlYWT8GG5T/CqY+x?=
 =?us-ascii?Q?Bf5/cJsBrO5T4WCBowowZ3qOTpNkBG+0h3nfr2ranKVRPaDAt3m0DG4Jpjc9?=
 =?us-ascii?Q?xl0iiMfdwimDvIcks+GCYeT5yq5XEZJb6pRU/DRtiKhQeVBQWD8Jtogb562F?=
 =?us-ascii?Q?+MpvXVK4KiAX53HW9bNCTjVQqQ+ffJyy78s9Makgqd6VEC+R4qBHx5g1ugs4?=
 =?us-ascii?Q?iz1is5aYK08xk5Hol7bDAo2jG0UbQVABsH4AgsXohS6FExqXPTN3SczlBCj4?=
 =?us-ascii?Q?yyRpLlyMFo6RROI63VaSfrLiN+5uMUHdyzSwCdZrnR5AfjLFAyfRM27pvun2?=
 =?us-ascii?Q?rUwSt7Mz2fBp1hJC0gBlQ6u5l8009XHNo+6Oz+4ExHCLjV09hvXBb1634xPM?=
 =?us-ascii?Q?5oFmdv8VpoamDAFynwnii3lsHLh6bKb+PihmN330zU003eghf/3U8af29y15?=
 =?us-ascii?Q?HdLYM+AokwxZOuQf/MCeu8+4Xx4dlrMN4/DLsWvfFS7auJNATats8Ap8DO9f?=
 =?us-ascii?Q?nXZ8jWhbRaofwtppe4AbU/OYwS9tr54LqfHyqr92RJf/NVmrCP/QzdBwd2O5?=
 =?us-ascii?Q?UG7tRNeiX4RdbYItlVCJR7px39YMZDNJoZMnqoAgdCFoynbyo+ZJ5fBT/dtT?=
 =?us-ascii?Q?sMM2BAzfQ+Ld963XAsM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 667815ca-0417-43c4-6eeb-08dca2877a52
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2024 15:29:53.5925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K2qlX1pPcVVLGN+RAEhJeyMJZcmyXJRXsceqbcKfjYoErsrC6lzmoJO51zaPx7Fp7kKNNTnnWz6M0gUIfUNoiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8438


> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Friday, July 12, 2024 8:02 PM
> To: Parav Pandit <pandit.parav@gmail.com>; virtio-comment@lists.linux.dev=
;
> mst@redhat.com
> Cc: Parav Pandit <parav@nvidia.com>
>=20
> On Fri, Jul 12 2024, Parav Pandit <pandit.parav@gmail.com> wrote:
>=20
> > Hi Michael, Cornelia,
> >
> > The following changes since commit
> 9b3129fe72360a78e76b6dd890d3abc5a45fa915:
> >
> >   virtio_pci_cap64: specify offset_hi, length_hi endianness
> > (2024-07-12 06:43:53 -0400)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/paravmellanox/virtio-spec.git tags/for_1.4_v2
> >
> > for you to fetch changes up to
> 5b1ed863cf9701e110042e9e85d69acd06cd33c5:
> >
> >   editorial: replace hyperref with ref (2024-07-12 16:08:59 +0300)
> >
> > ----------------------------------------------------------------
> > This tag contains administration commands for device parts
> >
> > changelog:
> > v1->v2:
> > - fixed hyper reference to name reference
> > - fixed typo in commit log
> > - reduced the patches of pull request due to rebase of virtio-1.4
> > branch
> > v0->v1:
> > - resolved merge conflict for an empty line in newdevice.tex
> > ----------------------------------------------------------------
> > Parav Pandit (6):
> >       admin: Add theory of operation for device parts
> >       admin: Extend resource objects for sr-iov group type
> >       admin: Add admin commands for device parts
> >       admin: Define common device parts
> >       admin: Add requirements of device parts commands
> >       editorial: replace hyperref with ref
>=20
> The last patch does not have the changelog cut off from the patch descrip=
tion
> (not sure why.)=20
I don't know either.
I see it following.
commit 5b1ed863cf9701e110042e9e85d69acd06cd33c5 (HEAD -> virtio-1.4, tag: f=
or_1.4_v2, origin/virtio-1.4)
Author: Parav Pandit <pandit.parav@gmail.com>
Date:   Fri Jul 12 07:14:33 2024 +0300

    editorial: replace hyperref with ref

    Replace hyperreference with the name reference.
    Fix the broken reference link for the DEVICE_STATUS part.

    Suggested-by: Michael S. Tsirkin <mst@redhat.com>
    Signed-off-by: Parav Pandit <parav@nvidia.com>

    ---
    changelog:
    v0->v1:
    - this is a fixup patch to fix the editorial changes to
      drop hyper reference and fix one broken link.
    - This is based on virtio-1.4 branch + admin parts patches
    - fixed comments from Michael
    - fixed typo of reference
    - replaced table reference as named reference for better reading
      and direct reference

> Also, shouldn't it have the message id of the mail you sent to the ML?
This is complicated flow being asked.
What is asked is:

1. Send a patch on top of patches not yet merged with commit ids of those f=
rom local tree.
2. Once it is on the mailing list; pick the message-id of it and modify the=
 local patch!!
3. Now send the PR with this modified patch commit log which is different t=
han what is posted on mailing list..

Please...

Can I please PR with just the 5 patches, and we apply the fixes on top afte=
r its merge?
It is at least less error prone to me to follow. It simplifies the flow for=
 everyone ( at least it simplifies for me and rest of the revies).
We may more fixes on top of these PR anyway by multiple people.

>=20
> >
> >  admin-cmds-capabilities.tex     |  16 ++
> >  admin-cmds-device-parts.tex     | 469
> ++++++++++++++++++++++++++++++++++++++++
> >  admin-cmds-resource-objects.tex |  29 ++-
> >  admin.tex                       |  12 +-
> >  conformance.tex                 |   2 +
> >  content.tex                     |   1 +
> >  device-parts.tex                | 232 ++++++++++++++++++++
> >  newdevice.tex                   |  24 +-
> >  8 files changed, 778 insertions(+), 7 deletions(-)  create mode
> > 100644 admin-cmds-device-parts.tex  create mode 100644
> > device-parts.tex

