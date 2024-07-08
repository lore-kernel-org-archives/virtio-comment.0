Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2049.outbound.protection.outlook.com [40.107.96.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7309D803
	for <virtio-comment@lists.linux.dev>; Mon,  8 Jul 2024 02:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720406004; cv=fail; b=gm50FQBktS5kWUIuBuaoBRLww28NAknFcodndA3hwkL2nYeN+FoHVdDGAMMUtFljCK2A2ViLGGRqDik5sS5ZhUeuhdsashRnTuSYBvyambwYyZ7uN8aV1OpKZX4yawL+iAKLpvFgSuaVocqUrJaIJgDCIJmzc+4/hnKWm+uNw6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720406004; c=relaxed/simple;
	bh=RVvA5u5hLxau0TK4+X8s/M9PV4rDKo7N9UwWGlekOB4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gx4gMKGLXpLm3uahMOcfOmP4+p0xyuzfAxZYGS2KoPeyrT/IxDIEhmlhwV7e7QRfUPS8qF2AeFl7Vw7BZ1ko/14YdBDgLAccXfHyy06k00350u2AuixyP0mg/QfaWmk/BbvtysMfnr8QYc8RgXp8ovQiYQ4sPzPKykDqjHSIATk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q6iJL71m; arc=fail smtp.client-ip=40.107.96.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q6iJL71m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hP4cprk4qHD7aCJ7wpEVD555ckFx/jbQtfWfIayQafL17zDkRsRiEmanlKA+xdyh3EPi3+F6wGwJU223IzdITAv44Qib1FJ7JoB8GKyBOAINcB0V0fXJ03af75cu1xLNwjPeO0qe8cbvjn6KoRig5/itIj+kKrA4ZujnbDr2zatMwQ5i0JUw+1uGT4JZhj7miiKXBJCGl/7nJBOdLzjRJJbsuuEF2ZItjsOnXVmIB9MWNSsS7JB7oXkEXFZ5U6qyAWH0BALEGkUHD3sYiLGnZjOB/pG0osISKIRr2nSqi6DPgpmD/erjT8z3OCJV56BsiKgoebrl7w1Lmlw8puG/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVvA5u5hLxau0TK4+X8s/M9PV4rDKo7N9UwWGlekOB4=;
 b=QMYXQi9FXAVWxkoczxdsUuhC/iHpAf5Tpo810khqHVAJ7toKOJqNf9iCbc6dsicvvVsIno122XYHF736YkJAdVJNDPYfUVpOLkiU5EBY3nEPm2wFxf+ya4UOK/xQsLDcchD5M7r75YttUmcpXIN/92KjfHncMk1Hd/tLg+3TaBMEPC3p9G6hILBFTq840PbtDZojr4Ou2VwUIwhHisUMIkcjtAYAsDBUP6x+3kDxuPgmpKpj8YiSVxi//dPXqnUVNab+rb3W9XHr92CwNEalKCpqdMS1YSBKZ9EBRdAMpAftZI+gFHjfr3Oiydoy3oUwx3nGUvzImJdmp277cd4+gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVvA5u5hLxau0TK4+X8s/M9PV4rDKo7N9UwWGlekOB4=;
 b=q6iJL71mjH3yNSQMfeD71T+CRnvxH2PhUI6LdMdFYwNp9b9WMMNRvrHxcvGzwh8gLnZ+b/Cht6nar6bJCSag/yvzCyOuRAgMcktTknI31MUSiREc/0jb4jGnLfaibtrOF/khEpVkDZFezEJwF4UxKepWwosFNkd5yxpffLAGR9bx1Pgp+nebSNx3m7eT2jINhmbXyXm1eZ+y+gW+rySbl7ddFAaLf5d+//oS3OW+DVrUoHDL9eo99Zpk7CFf6OML/mdYVVY7uj+TjFvjn7dfcBIDEHTkivlXkGwtIs+TuJ/ZsuDKgJ5R96qK4m/gJ16BQMCBUdLsh/WfoCDmG9K9Yg==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by CH3PR12MB7642.namprd12.prod.outlook.com (2603:10b6:610:14a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 02:33:18 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 02:33:16 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Lege Wang <lege.wang@jaguarmicro.com>, Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"vattunuru@marvell.com" <vattunuru@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, Leo Liu <leo.liu@jaguarmicro.com>, Angus Chen
	<angus.chen@jaguarmicro.com>
Subject: RE: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Thread-Topic: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Thread-Index: AQHay2kPZP8Br6Dhi060PfrDxcGZPbHngeKAgAAR3xCAAD8YAIAEVClw
Date: Mon, 8 Jul 2024 02:33:16 +0000
Message-ID:
 <PH0PR12MB5481EEE5EBD5AD75A04F0857DCDA2@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <SI2PR06MB5385346C86CF45806EC6E9F6FFDF2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <PH0PR12MB5481C9F0175734E5036FA2A6DCDF2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240705042420-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240705042420-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB7642:EE_
x-ms-office365-filtering-correlation-id: 25057e5d-12fe-43d4-9695-08dc9ef65284
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?4+L0kBeD8TaPoyeSxYMxf/XCVKdUyB2+ZlMDP0wHp2mPkab+zpyGiM15xIbj?=
 =?us-ascii?Q?ut/EZQ9T91UwdvqUdmHqSs5xiu5b/ytsn0yljY+OcNW3CK5PlEdv8VPQeHRh?=
 =?us-ascii?Q?OrKagk47gT82am3nCNoCNpL11p666feyy+f/ik9HGADafuMYf1pbM1M6gXny?=
 =?us-ascii?Q?6esJ1rNT0MClmDnvTVjqLrD5m1Dmvr/D12FJjch/26ZcbOIYCZWOKvxxrkVN?=
 =?us-ascii?Q?janUGatwETg66bCWITg/Pcy8J5wOQVyJrLBl98cWMlY8oCNu4vfzVRAF4zoK?=
 =?us-ascii?Q?IcwN7YasW48f6V2ggfQwgtg+PJ5FP1tUR84L9871pfI0REa1n49SbYEPJ32a?=
 =?us-ascii?Q?5jSW7ztbeH+l+RH2V1GrZsGFT8AkfWpXq3SCx88ivpPqdA8m58pYlEbV9Cf3?=
 =?us-ascii?Q?MFRb3t6ddHvEPD330kxMMqMyWX9K6RcdxRuuaGuytg2bDWxpBHRBe7kkox4E?=
 =?us-ascii?Q?1fKNATIMsUsg1E09iZeAwSkQvbYHFUcA3/K1qcxq1MJLYB7i0Y/w1LzRlFmZ?=
 =?us-ascii?Q?j0QhE6S90qmAdPTPivESxm8qbIs9yoHJ+ji4VCMvE2/kxw4EUJXyWTzrn5Lv?=
 =?us-ascii?Q?ntiW89UlJlI1GFG6/Tooc2+TQ2o/9Q9QS5sFj2hAWfCd6iTMwgRE3BNV02JU?=
 =?us-ascii?Q?lT6WJpjVNWGPeYMtmlwN+aUFMvOr68y8lax5DO8lcuo0Z7JUwCc1SCK5+KxM?=
 =?us-ascii?Q?1WffToIt5fF90vBImmE9JxQQVZ21gbF7axOrvxZQxtuOOQhcvuRsGRGWFyQb?=
 =?us-ascii?Q?PiWHKuWQqS+uXpQ7BNusMCoV019gAZK44pJaSm9d/KiIs9Vtkq6ojReJWrZ8?=
 =?us-ascii?Q?acNiJZOk1OJ9SptIKrcC2oywqAbjeWVVEaCZ7qkXNwlj8vNRvokJyMQNBtGr?=
 =?us-ascii?Q?wBy+6WpegyNLRsl7L7ObA0/HuY91kjK0qFTw+B0oqCxWErMtTc4j1R6Przbp?=
 =?us-ascii?Q?9zKq53BwGrRBy4EkWuTfSmCMcgPiZiTxOS0CgEN1roo6/Tqqt27MiEXxpJhB?=
 =?us-ascii?Q?3vcG1hveSkVsa8P8HclHG98qxeWWCqvnAshtpSoeXcU//+FtWPvrelwcMqZN?=
 =?us-ascii?Q?KIrDxnBesMWJtHdPMEtZtitq1L/1IhxCTngRfxYlkfSqzPhaNsDiJTZbt7R8?=
 =?us-ascii?Q?rJtzW3yzdqq+An23KmKv+FdnlHiJIWY3eJUP5JwHjMWclAzHwm9A+aFSCOSl?=
 =?us-ascii?Q?wwdsnAW77sjXlqbf1LkWeXfPyPN1w3ZGTkzGiD16lYSIOcK6katZNxOYwPmH?=
 =?us-ascii?Q?OYS/PaiiZtVSQ4EGlMCLivncUMm02tPl73y7vHUsDmzV9xp0YwrueAM3YgX2?=
 =?us-ascii?Q?CgzD1guAY5kQcexktBon9TgT/lc0zZF3P0reoCZeMviZBDNWxoRnDodmV5l/?=
 =?us-ascii?Q?Jm1NkEwgJzqn8J9RnNCkGCObPE1jn0CUbLX2Sw/HR8zh7cqJvA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YVNIPF556bExKJGBs2QEjK/Ph9FJOksCVT/K5JYGWzzWgca0lNrTB9nOJtxM?=
 =?us-ascii?Q?WP+3veOgkbFSWz5bK5dPAK5l3OoY04T1bYq1sSsdnVvA1mm7keBeb6q5pB4d?=
 =?us-ascii?Q?2FupC5Em+bRmk/+QrA1JwyyCLtmiltYrnjhY5AGjeLerp3qvc4Xsom5jMao8?=
 =?us-ascii?Q?0dKKSmJgosvvRsfrtuiIkLeM52it/dlZZzf7JIkAdPGIbWClGyqiSH28+MJp?=
 =?us-ascii?Q?I3/6kMux3Y879zIoSDBInFSBSnk+MAyy0EIQZzCIc9g0ZxFAwsnBwPW53pOv?=
 =?us-ascii?Q?Uvyu7NcicIHgigS+/RfgRWx+xCD9MTsasD/O+iEU8kfeAbguIs/7qkUlLoc9?=
 =?us-ascii?Q?NT5QJbiy5CjKsMUobvwgj1V/fgbrShPwBKBzaLJo5nZdsNXkcPGlanyzBzXV?=
 =?us-ascii?Q?a2jRWCh4QFECbpZ0XTTRLRxMVE/DLAdz4dWl+BhCHbyQB128bLJLOsnUk6dG?=
 =?us-ascii?Q?e3Vmf0vMujvnj88CJ4Xdk0CQFoNEiXUJ5nOBfunFn4tfXdlJeeP/cBejcY7G?=
 =?us-ascii?Q?pb54gu1WgeJHCwceHYwJO4SIG1QiFoQJFFskcV44QQBfE5b5D8oO+EX2MUoG?=
 =?us-ascii?Q?RDEh2NBHRqgh2c6OgnYiHFjpvSwpNyS+GQcz1L/Q7T72WNuKEd2AsLh/qRLL?=
 =?us-ascii?Q?Cy/k8rxyYXZjy7Igel8rMVmfESCAZHNoz+bCWu8gLt5mx5RZV1ekx1YMKDuF?=
 =?us-ascii?Q?zvSLu91Sbls57bG4+K+lP8zFBX6nd0P3FYZhpaLUuO4EsR7nEVvvIEGsTSka?=
 =?us-ascii?Q?SetDytemnAorRwoZUCIAj163yNSmU5aP6gth16PBL7wm76XGpI3Wod5S6ffw?=
 =?us-ascii?Q?AtO1WNTzMZoZhYtqFaYkqyOfv2oBfHb7X/wLLtxBF2x1z5rJfgTsfamnHhFD?=
 =?us-ascii?Q?nydeU0keUuJeEMobU/cJ6fTtVPsNp8hGP1cHUHglkZLRFtaTW+H7bZr2t755?=
 =?us-ascii?Q?nwXcWBQATN+YGiqUngRa/uMciw4uBWryGYwKNoq7FU45RriAnBST5AY6WcoF?=
 =?us-ascii?Q?64r5r/T79+LsWNeRjKlGQFdtf5r8k6LU0Y7rxfgcvFhptPki7i2lWqngrSq4?=
 =?us-ascii?Q?S6Lfs8owu4h1N3tdwP2fAh02KA2CEDIgh0gsmBIlBSw9SPOmTE6uUUQ1SV/B?=
 =?us-ascii?Q?xivdJ8FQlYc+sVvSiDVisOzNR/Xd16wH1YKfhB67HpOqk/siMsKDcb5ZXA+0?=
 =?us-ascii?Q?w1cJFovUBMhwCOoxQrd/YKJVCpQrKp4cixJwOK0qtvtC+pEinS7FY+Z0e04s?=
 =?us-ascii?Q?AC40snk1vo4kU7Nmx4mbCl7wXCcEHuw/b++zpqZea7hYzNLbr+QPC1p2XGex?=
 =?us-ascii?Q?VuIhr2wLF07VnqFYiLbMUOUNVTeU7YBDcX91sfiwhO8dlsM6vq3rUfy9vbDh?=
 =?us-ascii?Q?EqbyL4VZdlYY0wkYvmlh8YA/rLP7sNIel3SEmKwywWx0k26ZnCsK8yaGXCba?=
 =?us-ascii?Q?bir1SoFxyijySu8QTX6z01YWvsPYucJlGOsrAXDABO33cAeU1Z+eCTi94sTQ?=
 =?us-ascii?Q?JYXIeejy9s0uyaLDby/75JipVW+PdIRQs0+ojPw7e36Dg+tklTZvcQCum9t5?=
 =?us-ascii?Q?XedfLhkOYHmi1kBxKe4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 25057e5d-12fe-43d4-9695-08dc9ef65284
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2024 02:33:16.3266
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FofcGQn1zANl6LlfWWkDSfcR8j3dQJaSdT2+6UfI+jrH32S2kqvlyTXP5KNNrJoNW4eNO/17t3WamhSNK3K0Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7642



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, July 5, 2024 1:55 PM
> To: Parav Pandit <parav@nvidia.com>
> Cc: Lege Wang <lege.wang@jaguarmicro.com>; Jason Wang
> <jasowang@redhat.com>; virtio-comment@lists.linux.dev;
> vattunuru@marvell.com; ndabilpuram@marvell.com; Leo Liu
> <leo.liu@jaguarmicro.com>; Angus Chen <angus.chen@jaguarmicro.com>
> Subject: Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used
> buffer notification suppression mechanism
>=20
> On Fri, Jul 05, 2024 at 04:42:52AM +0000, Parav Pandit wrote:
> > 1. pci capability area (non-extended cap) is full to its capacity. New =
addition
> can only work in theory.
> > An obvious alternative is to add the extended cap and add there.
> > However, it is not a good idea either as the PCI spec strongly recommen=
ds
> to not keep adding vendor specific stuff in the PCI capability section.
> > (even though an option is kept for the vendor capability).
>=20
> To stress, we need to solve this problem, even if the specific issue can =
be
> worked around differently, we keep adding new caps.
>=20
Yes.
When the new use case arise, lets understand, whether its need to be discov=
ered before device reset or after device reset.
Depending on use case capabilities can be learnt by different ways.
