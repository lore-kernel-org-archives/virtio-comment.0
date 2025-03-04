Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A998A2036FE
	for <virtio-comment@lists.linux.dev>; Tue,  4 Mar 2025 10:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085899; cv=fail; b=TF43xhEAU+FxgluZr8R5EWYqovUjryCmm7/pOWtXwgEQkKJE3VqNCNEk2VXM5HNrFgq7DzQPYbETZUvHLXa8k+OGhPAwP86k0jdrZAJhYN9n7NtI2Eg72qoV30e+YY+SNCnyemc7bLZD4CBoxRGaAAhEuztyhqLmZ8NPj+JIRHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085899; c=relaxed/simple;
	bh=53l8uUh+NyWMoYAZHCq2ZfzsElgHC3JU/4kSFGUYkyw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RFqSK0DDhGrEzODV/JfCdlUG9PCiKlejjLxYm5rANERSxShh50ofG37qnmJqtpD1RySrzst29AxaswnRqZ5gfnm1IgL5fhkuv01NQZyMjD/RQd0RAwGwJxJFClRfNY542AXf3L12x3vOFogiQbWmvvJAlc6wVt4ITy/7/LciEHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oQlGZDT9; arc=fail smtp.client-ip=40.107.220.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oQlGZDT9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EaWKsz9VVhFxelE1rtyymE4sHcWTIJc0niebsoRqYHLWcjBGpT4r/mmbvCQrks7bFqxUrJajs1nLPijNRnvXuZ9IwS9JJt7BCI7BA0G245Vm4KhOlrGO6ozWgdrlU7TqEJvJ4cTa8yD32eHv3TLaqJyano7XQVBevLq3/kE0G/95Q1JIRsBRk6vpnD73FzgQrfM6JFiZET9pwJRQhxh3lZDe+Dbw+KIEksRFsX6drzHVU6MdzSINZI9L5EETida20EL/q1GOV96ODnBvt2Jn5+If5+O6vNX2HYYPgBvXaF/pNw+CJTOfJ7bwuC5tKiaFo2atHEqgA7GAziQ0sUyJ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53l8uUh+NyWMoYAZHCq2ZfzsElgHC3JU/4kSFGUYkyw=;
 b=rxWxNquPgAKhWnkXVCz5CfEJPMzCpNdXfmhbWFYUQdnZAUBmxNwXVXxHPwk+AaxJq1XdFM1ZRtlHtFzWhS17ZH7PpgK3dxNqlsPU7HCyJo1k0SDu1qv2Rnv8RguDED8KQqwaRDUgNjCfhVIBI+VUAjJBtN7hTUXz43QiXmO+7Ie5O/dIm6BX7b68pLKG2Of8f2rHEfTQngoM8GyRLErOdWQMeESIPM/5yEiL76Ol84G4jFyhxwheWHiuhvxfeRjHcXdMUuWRdfqP7sBzCay4wEJOekR3ZsBIZGob4nzzU1OtXpU5JJu6MLPLgMmL4XoZUFco71WntFSM3aP8e9haUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53l8uUh+NyWMoYAZHCq2ZfzsElgHC3JU/4kSFGUYkyw=;
 b=oQlGZDT9hGj8eNY1bqUXJumbhOhp1jXi7RC93KttdUpYbzFE94qXWsnrZjcBMGQPgWkvc3NKIfoZ2M9SoKSr+WOJDaWT736rCXtBOtykeTqzCbKOftz+XP8jRvSseeul1Mo6/H6o5nq8x+XiAW9CmwBMpEGgUJ+bAD6+3WvAwYzwamQeNfdPrJt+ZqrjTKAiuDbIJdSRDGAkukwkkJOsfKo/OHFgYRG4m0+osrYoj9kZuAj0Q8YjBtbrpkqDKM7WYEN3R0an1+diaJ5QM7MFlr+LGsBrctGYACLanL+7VocMQ/OFGf+mNILa6E+9gKmoO3dpjjZOrIe17jcp2SrpEg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by IA0PR12MB7674.namprd12.prod.outlook.com (2603:10b6:208:434::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 10:58:14 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8511.015; Tue, 4 Mar 2025
 10:58:14 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Sergio Lopez <slp@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
Subject: RE: [PATCH 1/3] shared-mem: introduce page alignment restrictions
Thread-Topic: [PATCH 1/3] shared-mem: introduce page alignment restrictions
Thread-Index: AQHbgTK+9SQF/Ak56Um6rrdbwMmY/LNUYJgggA6EJoCAAABJAA==
Date: Tue, 4 Mar 2025 10:58:14 +0000
Message-ID:
 <CY8PR12MB719587D7511B659F5D3BAD56DCC82@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250217115227.4961-1-slp@redhat.com>
 <20250217115227.4961-2-slp@redhat.com>
 <CY8PR12MB7195A2AFBB7530874D228954DCC12@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20250304055002-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250304055002-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|IA0PR12MB7674:EE_
x-ms-office365-filtering-correlation-id: b1d7478e-dbdb-4a8c-6c7c-08dd5b0b7628
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Rq7nqFjeKaa7xb4udNgPh2/VDgJg9YCWQGvol9Swa/dGQZO8X5xBuTMzCl/+?=
 =?us-ascii?Q?I0EpsG6QDHtqoSUSSTLS7E/MP6ZVzOO8JoV2xSX6DeZP58t7nHcY27kHUXcN?=
 =?us-ascii?Q?HVgkNwgXQ7dsLj599RRP+NM4Zo9421V83rmIp+33p1Nye32gBNtUQIznOxCn?=
 =?us-ascii?Q?qaL9KaNravxGJ2fEBVEht7lWDT8uzfC5AP8T0FtivuvaVaDhL0jiH9CpIuRG?=
 =?us-ascii?Q?eqtWj/86IDPQHqNZIEmFZbBH4aWzAYG4jVXgJntIIooETPJ17Ufk3XoOwlxY?=
 =?us-ascii?Q?iYzh1ZrCvf3x1FKEN3vGoSpgWcJedXb0jOBXhp6lCZ9RMK6cVPndRXfnlt60?=
 =?us-ascii?Q?xzc/6rpQR+52/aJGP055fkEJz/Uy0qg3DUPPz5m/0en8PWYDeUP/w8zaqd8D?=
 =?us-ascii?Q?M/tEd9aE7CFzTi0sNLEB3jLSH0L2uDPni6etusEnUkfECE0YGlpbTltUP50/?=
 =?us-ascii?Q?7g9/qWsOB6XnZ2eBYj0neiCf7T8vL5w96Jsy3NcgG0LvUzEwBIi+57uzXuI6?=
 =?us-ascii?Q?3qZgU/BWXKj9mCfPKgjsMAhpOPeVsMX5E6t2WsHdrBakfzxaTJe/Ef5p75Gt?=
 =?us-ascii?Q?0Oi8UMo1Wy+upFDsEjH8hOPrVXhciz82Vct0mA0hlnRpecuEGHXsov/Rmrxu?=
 =?us-ascii?Q?fJn5VV4xG2vcy/6+oeiPEi7fcYKjYr9aYpNCpqLhY1Zf6lSlUHf60sYxfZJe?=
 =?us-ascii?Q?9Ss8GKoIX/xF7n9yqwwAURS2xQEnS460dfa9/ynspAeuS9RPL8yLgecrYMzJ?=
 =?us-ascii?Q?oR4OrSrK0mCsI2RrteBygZFQunA60lIpwOX/a+7NE1674BMBx+TNu/cV5W66?=
 =?us-ascii?Q?rMJ9H/kyCID8z8cVmdi+WlVRt3nUmdun88VgiXjQV8M+ffYQlK2s8Kev+jV8?=
 =?us-ascii?Q?it4mitBPIM2Jelw8AE9AJocHsNTvCjeFZs0S+/38ipujDwYqRd95fBnFFOB+?=
 =?us-ascii?Q?XRqUu7Tu/ecJ+PSJXWc22OcPO5G6Xks/sQ3VAH74CftsxJhded0wJYY4SeBt?=
 =?us-ascii?Q?w8yNG/67Wrf8/U38dBZH/jHrbUwCN+J/mUOVWKVcYtY7pUX7yNArpp3ZfzyF?=
 =?us-ascii?Q?Y/YBT9ZOX0XaJ44wrOHMCZD6zYMaEuURSSrmoWsBUROhCXNiS7HO+beLwv8R?=
 =?us-ascii?Q?JDVpgAqm5j/hmL6ymq7Wo+IHpsc5GwerM0Rtx9OXQKrbLtyTf7s6DgB/lIn1?=
 =?us-ascii?Q?9naajrUu0/KP3HgORlWrnCkQyNFsOB1NHlgOFIGtib0HymSmHX6IXncDXN3C?=
 =?us-ascii?Q?eaV7rTwpjUqEHJ5XqSpY8oY59APBMiIMnODTlTX9j9aki7ti3l9s6AqXPCkY?=
 =?us-ascii?Q?ZEDh9D3EHzZ3a+3vUk2PpTpqOfp2qe+SCfg/NVlAWkXJl5KrjtVhPM5hR4jQ?=
 =?us-ascii?Q?V+d0IucCbErd+qWYBTTef9i5R80RxYQAxU+u2YCIaKkQ6Tl4s97w37uNRGHg?=
 =?us-ascii?Q?PEUCleuAadZ64rmvDO8Xus1HtR+cRpFK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rhnyKtCZDXWMvVUsDntINUwp+dtYuagjVvUpJVAb/dl3NfTvnfGZX/mzWgu1?=
 =?us-ascii?Q?VNlHSSiF3BnkkV5TbGUuG6thYg9H7w3HyotvpzlhgTtb/NZH2sTUTsDmIPiK?=
 =?us-ascii?Q?2Dikof+DLuSUZFStpPgUts40Nz/lnmHikjj5HPuzdnh3tTmTHBrinANw8lQy?=
 =?us-ascii?Q?fSz9Egb+i0hHlHmb3woYlU1Lq6QC3HHOf5vgJeMUKyjseZ9YRlCDTXNr3tpd?=
 =?us-ascii?Q?KzRMaBeyZNnxXLxjgcZiPbyFWhFGYx+MomjGjdHX8U5AIsCBgwqxEubCD6TD?=
 =?us-ascii?Q?zL+9cKlydLsAGzkQuuxlSgw1AzyRwx9dNC6S7UThzXZqrkIjvrgeq0txi2qa?=
 =?us-ascii?Q?HOvJLrD8zS0mM+22jp/0I79oDJYRadjE5kDw1evoWRndnAXH5WxqpFRM4ejB?=
 =?us-ascii?Q?G28k8tXUdC0vdwvZ7SJx69igmO5HwNf5B+w4JnlnI6zVEQkdTCFkIaZMrlQn?=
 =?us-ascii?Q?4UH1Pap7hJUxoWtJHnZNz9Ywtuoo9pQ8PotgUUbTe8yZX7HwAgdbMzp6ITVl?=
 =?us-ascii?Q?4JIm/bA4YoxhB8Oz2+UVfS8Bode3k9d/MlwZnXpjuqyFekHGVcPlDBrfVpKF?=
 =?us-ascii?Q?4W9LXzo4pKthETbiC8oY/DlOQunFFLfUYTPVTTx7pc7fwIvaOXZ1bN2IcRX4?=
 =?us-ascii?Q?dx7ixjg+KFQ7EfKVSrqIlJrSCOKTqWH70GWIENcW7WFYxHiqWSSQeyHrsD2X?=
 =?us-ascii?Q?4gvWFTm7vnewhIkQwXvmpWkeWymK6nDP0vkbtqHQreHjYDSoPF85kfmEAGi8?=
 =?us-ascii?Q?AuC433yRTlzBHEqQbms2bsG2Gr5eDs22oHBHPAxKYPJ9kjuzPbTeCU4ouVTt?=
 =?us-ascii?Q?MHuu18+BEwSAIc9IqY+cRqFjhxfEuuMhRHmeqBxc+X3z4Rg7JCflxYUt7TFc?=
 =?us-ascii?Q?lmH35DOEpjJ5p0pttMcqSqBA0OwoqWNqcSYj6JE38CeIyh66+wgexDFhBZ/E?=
 =?us-ascii?Q?GtbOb0ERD3fGaKyhNtJ2smFZoJV6fnpkDfN/iLQTEB3E+Vd7SzPNPSTr50Oc?=
 =?us-ascii?Q?3g/8Wzg+QhE9K81saA0MPiRw+k3ro38l5mPevk7ZNP6jsB7H5b6ltzXkOT59?=
 =?us-ascii?Q?zwgQ5HIP0e7kzkh/mYlIbyeJa7qi3hqOv0Mw4uPTLNDzf78Ls9HplJSFM+Xy?=
 =?us-ascii?Q?I2t4hY6STsXJQizsgxFX+C9NPVTWvozSC6uh7ACMyOTkGT3qIVILCfyE0CPh?=
 =?us-ascii?Q?hL+eEM7tVu3LbzkVheGtUbPBRTReDF4PxCboMQHb42FgLGEuBZOGLkh6nFOR?=
 =?us-ascii?Q?4jZnUZ0F1UMaWtIzkVDiMEdl1Oy6JMAWC5WA/WwFl4Qj6QQ7fqkRAk94Gxt6?=
 =?us-ascii?Q?CmCt5MdYi5+sez9aBIuzDUn9SomtZuKDDFoPy13il21eU2D0XGymEgI4HCM5?=
 =?us-ascii?Q?AO6ZSRNPSiHn5HbnetKxRJ4IjCTJ69lVQZWV8pvtST7s9RqP/+/hRcw5x4ZA?=
 =?us-ascii?Q?6rFtiVgSnZ1yPK0K2MNJpd98D1swfnluTE7HoQu6OYztG7sCVo++s4q4cos2?=
 =?us-ascii?Q?dqk9dOtxc0XvLiamUAvYsj0iL+GQru4bV6VDIbkfV5NhmlCi/lRdW7IrJSwn?=
 =?us-ascii?Q?Wee+Wcn/ib2xXl2+OAE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d7478e-dbdb-4a8c-6c7c-08dd5b0b7628
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 10:58:14.1565
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1dcANILNppc08woI/RrfHz+4u7qpvmXnRiGiALaRwqnzRXdcwmUF8NZlnLf02/d9VoS/1w/XcR+3ofyo8lW2vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7674



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, March 4, 2025 4:23 PM
>=20
> On Sun, Feb 23, 2025 at 05:21:00AM +0000, Parav Pandit wrote:
> > Overall extending pci cap structure is not good idea even though it may
> appear as small change for below reasons.
> >
> > 1. PCI spec already ran out of total bytes that can be stored in the ca=
pability
> section. Extending it will not help.
> > A virtio level extended capability is not good either due to below guid=
ance
> from PCI-SIG.
> >
> > 2. PCI spec highly discouraged putting vendor specific bits like this i=
n the
> capability section.
> > Citation: "It is strongly recommended that PCI Express devices place
> > no registers in Configuration Space other than those in headers or Capa=
bility
> structures architected by applicable PCI specifications."
>=20
>=20
> We can argue about new capabilities, but this is not doing it - it is mer=
ely
> extending the existing one.
>=20
This patch is not even extending it. it is reusing the pad field, which is =
good.
Extending capability is problematic.

> So I do not really get any of these arguments.
>
I asked him to explore what all options did he consider.
=20
>=20
> I'd be open to an alternative way to discover capabilities, as long as we=
 don't
> do that, I don't really see a reason to block minor tweaks like this one.
>=20
I am not blocking it. would like to know what other options were considered=
 if the shared memory is going to grow or its just one-off field that can l=
ive in PCI capability field.
I suggest, that this should be done without negotiating a feature bit. Beca=
use the device is just telling the restrictions...

> At the same time, I am not sure why this is a capability at all.
> why not in config space?
>=20
When you say "config space", you meant "virtio config space" and not "pci c=
onfig space".
Assuming yes, I believe the problem is, Sergio needs to add this field in A=
LL 19+ devices config space, which is not good.

> --
> MST

