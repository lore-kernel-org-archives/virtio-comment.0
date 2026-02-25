Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010037.outbound.protection.outlook.com [52.101.201.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405E112CD8B
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 05:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771996193; cv=fail; b=QIyMrtfNk8R21ZQhMdrqlxwsO7QwsS0DTAFEFEKOqn5a1QBvfKmPqXHG91Hd77ooDEdvDL0wXv6d4F8g7W/dDcOScboOD7ZmUOXoxDyK2HA65Ce2+xsAc5BhdUs9R7muRRdbSHzffDlH6upptzw+Y+7ses2PxqwFzKgLTt/+qJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771996193; c=relaxed/simple;
	bh=EQXw64GcRP+3FnX9kNC49cNL56dFRIWm4+A1cKKKkCw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kf5dzem/wgDAIiVvT8PzUrwTKJUG64qoi+tBM0g6yPkrrVzlD4eng+EPEisEPn8tTiNEJ1hHqWKSEUD2jexpRnT1CYMdhmebe0QMpz2HCnmM0NMc/CLfFAPTeeWAel7FeglokmzLYOsEG2csoPEz626KDgMp8qKyXmoYht8iR7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jyemcYbr; arc=fail smtp.client-ip=52.101.201.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jyemcYbr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxVxVMnBbtfeohRnSklwihzsk3LO3BGebR5MAaTnrFnrH+dnKn7KXWzHVwN11KaiDxlOHaYPsqZrzr7Kb77mfgGFb/XQQOurDlMej2TFNWEH1SBd8z3VEKRfFFFCkN9wpnxW7poVv69m2a2bH8JCVtVk4Oz4GWhs0IlK4CrQ6jgpe2E7n7TA64S+ExA2VwT8bOTx5hcVj59DhWFkXzik6Mt2fBSU0aW0pY72WC35Rjcp6ymbzJ10cD5XXvg+dSFf7S0HI7J9cYH6xeDgST46V2HggotwQXpkQwcZeNpw3TBhlBTBt1uJRYq2+AAw/qqvW5pga4Objzcyq2OugnRwTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQXw64GcRP+3FnX9kNC49cNL56dFRIWm4+A1cKKKkCw=;
 b=ZmwPMmz3q1Q3psOV6+rLiJ3dsgSKC9HXutDNHymNEMaYS5J8sgb+YeEYS+u1F804exyRsT+5YLg5J5Hw4anPegkgpgrEhDeoadtpe3GzTCH/G9M06Kj+ufVEZ+Ih5xojFae8Le2OlZYzh2Hh4mzpGQzOlXIxX6o6OEEywTIk528siSHvsqPYuXYc5aeJ48LvcvSp0Ub2Yal1mwX0eHMwUSXOd+tEvLQPyeKryV7dfEUEuLtgJwp0huZ6WUaCzzacl1Ajv7s78Whj58FXwGymI8KUVDwKIfBsquX0k/esvWrtJ1vMnX0cfFNy2ymgOym9pkXm1DUHRPQzfoFwmSl+lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQXw64GcRP+3FnX9kNC49cNL56dFRIWm4+A1cKKKkCw=;
 b=jyemcYbrlPPMl2kKFuWTJ7wIrABZxOFhapZdr7VQEJ+j5Q79blqnQOtwjTkannl4S6MPzQBQ5NtRZXhBpWFzeaUG5IJ0yVJPZuyBo29Bo3g6b3LGtQh5doMK2M6yv14+4Ebx7ymfDUpCTzmDNl5WuHd7BzZEygBcN26B63U684hJVqqiUC9xCbO5cPBjzgch1IwXI2hFpTd4WIEhuYKFD49fr2t00W66XPMfDoEPsqfQJqojNpnVMQgoxra74Moyqu4GaGz9WkJd4almF6rIo4wkl+Nnzw/rC95s3uPQKwgRAfbsi0uYxRB+svu33O7K1mLT+yr+3ebCN/5gIGW6KQ==
Received: from MN2PR12MB4174.namprd12.prod.outlook.com (2603:10b6:208:15f::12)
 by DS0PR12MB8343.namprd12.prod.outlook.com (2603:10b6:8:fd::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.22; Wed, 25 Feb 2026 05:09:47 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by MN2PR12MB4174.namprd12.prod.outlook.com (2603:10b6:208:15f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Wed, 25 Feb
 2026 05:09:45 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%6]) with mapi id 15.20.9632.010; Wed, 25 Feb 2026
 05:09:45 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Bill Mills <bill.mills@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, Bertrand Marquis
	<bertrand.marquis@arm.com>, "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Viresh Kumar
	<viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>, Armelle
 Laine <armellel@google.com>
Subject: RE: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index: AQHcjuFu3dyU46FhXkWSoPS8nyUxT7WAvzgggAoZRoCAAGdhoIAAQqYAgAeGvmA=
Date: Wed, 25 Feb 2026 05:09:45 +0000
Message-ID:
 <SJ0PR12MB6806139282845EA52421A9E2DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260220050136-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260220050136-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic:
 SJ0PR12MB6806:EE_|MN2PR12MB4174:EE_|DS0PR12MB8343:EE_
x-ms-office365-filtering-correlation-id: 26419f3e-794c-4606-ef99-08de742c17a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?4Vn0On+pJHv0FsQLCoKxapsepin1N9t27LeO2P1kEnHVW338vkBf1YQR9IPF?=
 =?us-ascii?Q?jMqwbgEkfAfQYWWVvf7sDZlHg42NJ2ME0lMs923qRy4pGDGxVuwzpCtqBnH7?=
 =?us-ascii?Q?ZywLW8FI3C5b0ZJffymbtgF4XjWKcBemDLeYAQAuI2ZRSUcHX60oVkq+gWGY?=
 =?us-ascii?Q?4LLI6bV0w/PZivOWnd485IzQO2VSImoeQaks2WuDQ7VH9DufsauACm6cCPly?=
 =?us-ascii?Q?VVwtOvR+qKKkGkXwamTR52HwuF98jyxuc288ysXKb0XSelZcFKaZY0tc7Ndo?=
 =?us-ascii?Q?E6kLsfe8b1Kg+YFF1vIfM9xPzEO56NDYewvj+MHvu36RjqUhNyDH2GOgQevl?=
 =?us-ascii?Q?evljVYSO4A312jSnK8XqxCjntmdOMwegKvUd7UfEFR2YA260f0AhWZMlwzJS?=
 =?us-ascii?Q?GqYtL8l1/lJE9xQTntOPCUVqBTx7uzETF+wrSNOzBaE5JzqLmjRfRzeVXbAj?=
 =?us-ascii?Q?QBY8cYIXurD847YtG/XhCEssBhiuWImu/XBQQ3cwca+TdIfxT3YLouCIJNpn?=
 =?us-ascii?Q?WR6jOLM/q8Ib60ydCiBfiWHzXOEuXxqX1lBzp9lT5RYAAX1e+bKErSrTMkAP?=
 =?us-ascii?Q?sjQvGUAUqQ4CJagZJzkHxVQ09Zk5767jifgdlRK1fPrh9lftBEgJx86zDdrZ?=
 =?us-ascii?Q?Zb2i90MphQf2rbumj1mOdrKD9saWSVd3nkUTz+qxgl9xfR1aS0mPjYksFrFq?=
 =?us-ascii?Q?2esc/Viv6ERwKZdcPCppASDe4u9BVVMCUhG5zCmMOMz76A/CPA91YgZrXABd?=
 =?us-ascii?Q?zSuKNyUCjbCBO8VNAsdWSPCr4BfsUk0E7o6biYvfwJrtqC01jjFHKZjGEGb2?=
 =?us-ascii?Q?Kh8RHaZd1tPGYVzgIL1vu+SbqRsonzy4fmWAVH/+0b27czYDs2ODrP9hnU16?=
 =?us-ascii?Q?UmxCMK2qdo84+Xm4RBvUa81Y2Woyyf977GfdLnbvlEzJNz+xQv6LfVcvQWq/?=
 =?us-ascii?Q?E/GYZLlO3DljsKM29aTK4of9fcU3cZnbpSA7OkXMv9wczHefCCApaDWVHsXp?=
 =?us-ascii?Q?zfvqWOmImdHDbbly7k9u7Gm5dMyNc1Pz3iygDY9WyHWb4zi+wRbP2CdZtiu5?=
 =?us-ascii?Q?jN5Nd6Ht6nL5sDEcbhgPkJ2LVmAj4caDnCFJPdx6FwQKXJDGAilCfQYH7Ks3?=
 =?us-ascii?Q?uJqylrsumO91u0WTmTzKAJtDDWpIOry9VGBPiyqe5VImWQBS5EWzpEU+g9eT?=
 =?us-ascii?Q?JJg8rwvCjXDu+56c/sPyvR4Et3FMuq3hMGEy8JrXbQoU7a9Q4046gkSd4Ppr?=
 =?us-ascii?Q?4LZyn7+vByo1j9tjjYEPHKq6zjV/q0mownbHUUEKdi686t+bFxeHhwpItJSq?=
 =?us-ascii?Q?0ES+4vDynkkpYIRwCUGwoBOHUHdLbn9++so6xq+kuwILowtQQf+pj6Ow+ZIi?=
 =?us-ascii?Q?z/lkbwgLmuu7UAoRrUTQ044brD0/dSpT8n0dD4b13QJt3JIKiSYicCYSNSSd?=
 =?us-ascii?Q?chIPLRUC7wWQnwoGgzl0WrupK1L982e4hsURmgiUVzhqP8rhVjs3ljsIJWD7?=
 =?us-ascii?Q?V3wVp6L6hwrn3UgcKve3KOibGcKb9BP6vYW376NPVhP4mggMMlhWoU3EUr8z?=
 =?us-ascii?Q?UsIYgYNSvPT5VaoC7m8NmYcBmOJ3N6Ho4wddf2s9p4kIDmSljTpC+z3kJlDP?=
 =?us-ascii?Q?6Z6DN9W8bJtjp7kzC8MPF4Q=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4174.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nK0jKYRC6XFXEZva2l3itiVk+8wA7CcBhn8/bUMZGAFvx0S5ASIRwVd/rKAa?=
 =?us-ascii?Q?bq4GB8hZGusPlvhmV+u7QYnrd2Im+V4rd2neYBrjZi5QnqV6sb+W+J5Yb80U?=
 =?us-ascii?Q?lTwWjb0yAglzc87rotqF5yzQPgEhloR+me0RM5o0LCgR6wvwePJo2D+m9m5f?=
 =?us-ascii?Q?hMKpuHRjjd+FiJ8rJxWbJVcCOeWJ3CDYOE40DY17Cn13mdvoRiJOXjReGqbW?=
 =?us-ascii?Q?xd5/Zj20yMHQq/a3Q6ENz3ZIMu6BUELBzfMJYygzhLzZsaiTxtpCLk6/79bC?=
 =?us-ascii?Q?fDhdevjQgIcjeQv1lhlK4VuRLhvMkepRLVA7RW0MwdclpjNKtdQ/2rchG8sk?=
 =?us-ascii?Q?5aM9sdS6hByyPk781D2jDEkzyYMbmbXlshhIhYXaMHTPHj6AwucMFtOHGjpu?=
 =?us-ascii?Q?8/hvo4GKghwRyc1bFuXYm7HvHRWOU8LlbEmrk0pcHMD2x37hq6tMXfGxjZTC?=
 =?us-ascii?Q?lH+JVdllwJ1+FkzzoYIQ41uixg8nwTHTgbPn01B4N/brZYkP9pZWP7tVV2xQ?=
 =?us-ascii?Q?zv/ChqakXlHge3zlvzAyiRSHpnCsRYJGTDuNHuf7b6MfFc7KxD4Hof44C4W/?=
 =?us-ascii?Q?iPjeZGDZLYyMtYaLGffmBakLbjsNe3jrr+TC3+bc3owktWY0Aul+NpjASD/D?=
 =?us-ascii?Q?qOvf+yE72oyyNuCFxOTN372O6OqF2fc7GbC+gof4hVSlyf5Xf7mdWRt9r7y1?=
 =?us-ascii?Q?dk3LVYqw9g/IFLGCyrHi+D8SP6MouChcwbSPfnaUCngudjkNbvyN7sEOBM02?=
 =?us-ascii?Q?k8q9t6/60hmXaq5MLi1Jj8ikmY8UyHh+viIHYBuBY5zcQOxJqCJ23YII9wSC?=
 =?us-ascii?Q?t5Y0wUq8+A6MFeeTZIQBZppuwkA0smeN4Ljge8HYKuLG0PO1b+ONHXlwUQfJ?=
 =?us-ascii?Q?ILungyz2y3WBmirgkLKOuTvUcHKdT65Ewb8puepipdxVbgB9IDnuZfeZNuYe?=
 =?us-ascii?Q?x2lFwdwF9F9WoOoiy2BqeaK95JjMkF5SduPzt/VDfl4/f9zFVi2DNmFgawxy?=
 =?us-ascii?Q?8keIL6Fy4CXYLt7b0tqvxdYgZcDmewarSMTbzI7yfWsHsSAmMfqUFBThwGvR?=
 =?us-ascii?Q?/rc0P7VnxdNjZIBzGVja8NR5JPKohUnHODJIoTC99NB99GcDdrqFP+mrKE8D?=
 =?us-ascii?Q?wnHLE7GvQzhG0KAw9A2v+ZDTgSCIcNvJhAQdxim+H+vyf97MlIOOXFwteiJC?=
 =?us-ascii?Q?2c7TNLdxpzOwGBYsG3HpFV63idP5rzLwc1qOXTDQV34UxpLCV5o1OpRkHX3E?=
 =?us-ascii?Q?nXzQe2Sn6rQ9thdrxfz8hyEgXJcG3b1iS6QZxYi0ePzmhk2z8+QTsInYjhMc?=
 =?us-ascii?Q?r6zM1p3Vo1J+NVpaLlomQKf7fMsRU2ZGzGvobSSIqCsJA6l3pJLrD/QdvFUU?=
 =?us-ascii?Q?Apsh8bFeK5U+NprD6Qr7aHe7ERtRbXsywSrERamDs5RdCfDbwJ6Jr2oKVUPA?=
 =?us-ascii?Q?M3QkIhlvl9p9bVc5pntfx+1xMjh3EbSzUAeciPAO0+lpfpp0hRvDFCdyDqLw?=
 =?us-ascii?Q?388uW/KQKlgGpQ1cBD0LvcmRP1Nw0o6jI5YPVTbDbPgh8g7z3cOfVJomvumZ?=
 =?us-ascii?Q?faQRh3x1p5flK5tGk1Mbx7i4A+fb4gqtOiURrRd0NjBFXuMZCMJnoaa7C+PY?=
 =?us-ascii?Q?ivU1UVvyzkqLSL+RPmKEp3mFH3uq/+loHlq/F2Nc6SDDVdCj5f1fLAPUh2wP?=
 =?us-ascii?Q?AR9uEyc9fB5J+exQNTa5kTPkgIIQl9c90jWps14FIR1OBAa6?=
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
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6806.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26419f3e-794c-4606-ef99-08de742c17a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 05:09:45.6970
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QBv2DltAmCW5Hdvn6LUGsLBjkIHZvk7lTONBJvLckBur5lJREvYe10Hj2z/6GMLpodcvUxYF5lmWubsPr4UKOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8343



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: 20 February 2026 03:33 PM
>=20
> On Fri, Feb 20, 2026 at 06:13:55AM +0000, Parav Pandit wrote:
> > > > 4. I dont find the transport messages to read and write to the driv=
er memory supplied in VIRTIO_MSG_SET_VQUEUE addresses to
> operate
> > > the virtqueues.
> > > > Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and response=
?
> > >
> > > surely this can be an optional transport feature bit.
> > >
> > How is this optional?
> > How can one implement a transport without defining the basic data trans=
fer semantics?
> > For example for TCP transporting, driver side OS is implementing header=
 format foo, and device side is using header format bar.
> > How does it work?
>=20
> I'm not sure what do foo/bar refer to, or what TCP transporting means.
This proposal is subset of past proposal of [1].

Proposal [1] covered transporting virtio control and data operations using =
something other than MMIO and PCI.
And current proposal is similar, except that it didn't define the transport=
 binding at all for the specific bus.
It is only a partial 'control-transport'.

[1] https://yhbt.net/lore/virtio-comment/20231023104647.290759-2-pizhenwei@=
bytedance.com/

So foo and bar are the definitions I expect as listed in the patch-5 of [1]=
.
If it has to be done by the bus, lets write up this as 'control-transport'.

> The simplest way to do TCP on top of virtio is to layer it above virtio
> net. That uses VQs for data transfers.
>=20
The intention of this proposal is not to do TCP on top of virtio.
The intention of this proposal is to do virtio on transports other than MMI=
O, PCI and channel.
Such a transport can be anything - not defined in virtio spec.
It could be FFA, some two SoC as written in cover letter example, or it can=
 be something else such as TCP or UDP or vsock or whatever else.

And hence, data transfer part must be scoped properly.
Maybe I am yet to read this text in the 1600 lines of proposed patch...

> --
> MST

