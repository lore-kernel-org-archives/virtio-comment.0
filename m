Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590BE221FBA
	for <virtio-comment@lists.linux.dev>; Tue,  8 Jul 2025 06:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751957790; cv=fail; b=AqxgV63iTnv7SqROSKQ3D0PnVdJ00rgQaDnxcEADf1jeqeKtdAjfFm7Yg45n7RR2Y6ujCtyjZPBNBkwNgaWjUdDKjmVpXBuL2n9A42B97MyLGXUHQZqlls3wqA/I9hUTKF/VQPntiPVCVpZOdvHQ3QcF/q40XOAFzKWLVh/t9P4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751957790; c=relaxed/simple;
	bh=fl09AjInHREDcHP7cqvp1AiRihjXhiwJJbna0vQu1VY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Hg/UOaePveZniQWyBV1AESed7S+bAPwlwYk8Ci9hNpH6+UtmVQW0WXW6TDKc4rDC/CZlKy9sB9Y0a890k6gWM/74TyH2eO8ahJY6yrK2VlY1rthmW1n5xNIxByill9NqxTTdza+p2RUaG3SqyEu4VqNXl0YdQ3edjG0oyPQUdMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dHGEtvLi; arc=fail smtp.client-ip=40.107.94.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dHGEtvLi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W54+x7XkSXwg3GW5GcfbQ7LLk8yWCdOefOMbghXAzFcRtQH7KRBm8q/K8pSwMB0p0ZnW/+udVWtUc4nuaS/ezbGunDAEt2by74pH0RLyknup1EMd17xhDMJQ0SgEQB92I4AlpxyBZ2kGa/1XCo1WFFudG+poqp1dXtSWXLVSL9y8LS/UH0cHJVCsTdnav1z6n9I/JsUruKpJmnDLMIm7ZIt3IaKNq3dSuakl1OrDPzB8QJSdY+nx01nrKw9hmf4HKtvyDmzVaezu0/zsHf2MhxCNj4Aelc6YCwLwekwIW0r7SbtCGWJzeTve82L/1gZZc7nfFpEFPkuS8VQOZOtfUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZV7aLs2IgBfqeUGl8SyWFu5qnQyrx4b7jnvQzDKDIaE=;
 b=rfg8r37YvmI+SSiPp5tTLUoJlp1OcSj5KeYSl5Voq+L+8Sn0z3Uz5hhUQqwgUfzfzXVL8eeabTZ63ywaswJsJaFwwN3+PXX/PMJQFMjzQnjf5OFGWlztB0pRcu+S8/LfOmMvZpxjud48G2gobLIuuYxpYXBGitXOxjoaalad8UquCbc+oiIrwm4jgv+mC1E/NYSVewHJkylRDu5Jr+1NSxj7wpkuDTQE0GEwZmY0ymD1VpgiZZ+BD8kX8H6T5tIH5MP5Gom0Npb8iWwHkDlQM7PCJxjZwIrC+gOJIm0gh25ogYLlOv5gB9nxCo/89bN0YRKDAtk82g8NNAga5q93pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZV7aLs2IgBfqeUGl8SyWFu5qnQyrx4b7jnvQzDKDIaE=;
 b=dHGEtvLi+Oni2rrBKAZ6cjyM01TwNFYaOU0VodwZIcTBQfgrlQ3yaLGRrNxFrehMwKyHey2lH7o+KEAiOTnhf+ASbyJ2APaaxyWt0hOW2qZlZqCVshO/UuECL7r51yogFsCqE+9Op+xarOpVyH6z2H1IYaxSBxA6F5rtsJY2MNt85Fm5NupRezclYTJhfPImoBf7fHhE+55NUJN4pap+6gCeYjv2EGX3RHab+YdEhcLj1H719gmn0dOBr+jSc4IiXoqtOpmhNPyC7BovsB5c+u3oH2YZxVU2bIVlrbVzLqRhUgXxHkQ33jIScjDyhv57xfMbWgiylwUz5VkXT66jog==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by MW4PR12MB6876.namprd12.prod.outlook.com (2603:10b6:303:208::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 8 Jul
 2025 06:56:26 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%4]) with mapi id 15.20.8880.029; Tue, 8 Jul 2025
 06:56:26 +0000
From: Parav Pandit <parav@nvidia.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>, "mst@redhat.com"
	<mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"slp@redhat.com" <slp@redhat.com>, Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH] virtio-gpu: Fix missing driver conformance file
Thread-Topic: [PATCH] virtio-gpu: Fix missing driver conformance file
Thread-Index: AQHb3VgKITqp2x6oL06l3KDqVOKljrQFmJuAgCJXCsA=
Date: Tue, 8 Jul 2025 06:56:26 +0000
Message-ID:
 <CY8PR12MB7195A50158F11DE199936838DC4EA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250614181302.277794-1-parav@nvidia.com>
 <aE/yNzLLs+lZh/we@fedora>
In-Reply-To: <aE/yNzLLs+lZh/we@fedora>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|MW4PR12MB6876:EE_
x-ms-office365-filtering-correlation-id: c87f0bb6-bcb9-43b1-4a14-08ddbdec8eb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?IAQ3xnZlUCVxhxuHdo8PiBwBeUgZ/piEW1hTXZOMBU5+GlNbPJDaKlpMicmM?=
 =?us-ascii?Q?Zspj8UbcJljzB+UmjaaSpPUf6Pv8rOIuXHTDweAOpSC2I/DtHUcQrya9cK/e?=
 =?us-ascii?Q?M0ARDoJF76iR/1GWY4XsanZ1fnM4nZezwzLcuW2iuoVWdvE3uNVrEpm5+2WF?=
 =?us-ascii?Q?P5OExx5cCosNC+7z6ZiRQExAhicwICoQRWXC1eP3i4gG8CHdWdxA1xXjB2fI?=
 =?us-ascii?Q?0+lW7FLLGFGFlaxhK9Y6MUbuqB3wyhipoVRhDVmjpuuFPAe6QwZhzYSuAz6I?=
 =?us-ascii?Q?uIw633MQVDehnYNk1TGoJ1oqbYhW29MHJXBfQsN3aG6j3yAcY44fWuvTU5U/?=
 =?us-ascii?Q?dkbETQDf2ZsxRqLpBzj/u4zyiAQ6VGwYVq6S8S3cUItLlmX4dwF72120VpiQ?=
 =?us-ascii?Q?7Idk2LioIQpjaAvV5jwWl0dCXkhkf2NPXCIg77MSPAmpLGK6lqjPnuPnj+15?=
 =?us-ascii?Q?dl/bCExINLejvcMR7nhLq2cf5Ogm2x7EuhjHumi9MYjtbK0GVVALX1MVaKJK?=
 =?us-ascii?Q?+VOtDh8oRlZPCvRqGaSPknbrjDwP07InQ2vmZSmABDF3oAneknuzhWyK4Grf?=
 =?us-ascii?Q?XTwPA9qo/JONK3Nh+JmTTCrHMHej2xUhRFkYH1yCl9RRXdNYTzAR92kV77M8?=
 =?us-ascii?Q?7BSXRT/B27ReyYwUgaawNPzwAjm2csaUcXBNBWcfFYJvSBUt8rQYT/kLhFpH?=
 =?us-ascii?Q?aexoZoUDvMZrsZ5oXg6GpLnG5jiAW6D4B8eSmXQnSB4gn51XRJb5yJfP/Z29?=
 =?us-ascii?Q?cOObueOonKQgjT1KEFsK0vpZHNgxUXK7DtT/Gh4SE7KnKjzSOmbzSbV5tc5l?=
 =?us-ascii?Q?2yOQwd7QVsyAch6a321ZD+bE8HzUCaHyvLA1es8opqhSWOiHKoEzdDyu5Aas?=
 =?us-ascii?Q?5G91jLjloiOAPHARHhPpC2crvtL6G1Sc2CykAJ4wRjWeUSTwr845zoTZs07M?=
 =?us-ascii?Q?MWdDhPTgI9AmqWCFsGA88w5b3bz3WUgkgffXff600KJIdguVe8kY7dfqgJBj?=
 =?us-ascii?Q?nw9m9fxjY9OajjW/HD9hjTUEa9sK/oOMBs7pG77yr72eI1mQVwqP+Waa5Umb?=
 =?us-ascii?Q?+xwtU8H+z3yF+xar/b7eek9ich734H23Hi/+RZkJopYJ/OXT3UjF9wF3AF/S?=
 =?us-ascii?Q?TKhVPI3M5s241YbP5hhL7EOXKBxLRgXa0Drt6DNRXb9JvoMaK2mtSsUIgvPD?=
 =?us-ascii?Q?4r01MNZohhQPgC5edvLw/vgQSQLPzseBi8U2qs2T6lT7dMp8y/i5u0zHor7a?=
 =?us-ascii?Q?ElEiyufaf+pgdSx6E3hN94mFfsl0U0nyWy6IRan8kPy3bdbIkGBCN96eAoWK?=
 =?us-ascii?Q?0VsBnURId2EuPxt5LgnZbtqSAgt2P0r8CQeAXDypgsxo4dhhgt3w9sBRwRzQ?=
 =?us-ascii?Q?ccDsSAjmxpskScbD3zKiNlNYwpU2oFWK7x/EnYzTjkTcEq/UsWHZNKMxhc6W?=
 =?us-ascii?Q?0HZ471am3uQ6SJlT5NZJiGwBoR0XRc76K0+EJonGrGt4pHHdc4Y5z9Oe8oVO?=
 =?us-ascii?Q?t0EF4zeQgOc+SfY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?eIdbQGX4AXEPz4B7DYIwFyhZNBCBNyub7EeLC4KT6ifQorKsiMaLkXYpkwA0?=
 =?us-ascii?Q?d4cRGP0Bg1eclYGltZaM5gRnq5VJc3mjQNBlCzqWEwua0a6gfNCMhNCmO3/D?=
 =?us-ascii?Q?eerV1N0g+I2K8xu8geHeY/tny+NUCHDGde/VvXwHcL3bKX7Qur+DtBL0fV+1?=
 =?us-ascii?Q?oE2QDykOiXGrlWT49Q4oqfdExQLIbNZNiZ9Ur9xWhA8Y4AtLpGdcL003E341?=
 =?us-ascii?Q?4T40Dtj3RanwzxkalbXalQultDhqSGsVFFMWI9Xvm/6fuNIgNjSPvNE/HU6L?=
 =?us-ascii?Q?+iQv97RzuZzyWXU0ls5RUDOA/R0POYMkc1KQtYJgS47U18T2PD9CtZ0G0i5n?=
 =?us-ascii?Q?Xn3RBYYLCvY+olSRJdqu76tAD6Y4UiDNYNk8/M5OoMJ7IO+ILbk5R7FlapvW?=
 =?us-ascii?Q?CBQExSXqHLRgVoT8dBePXjsOhA1XisXKZPfVUnMbGuBdqMWW0z5/YscE3nmw?=
 =?us-ascii?Q?DmLv5N9aL79qyqbmEZwG41xOedYtJEbQtK2zq1KcirDL4rNRnfeJZHr/27j7?=
 =?us-ascii?Q?Z9Rk6olD9CrDOrzAf26xEAZh/+viUX9GUBa5NWm+CS3Tf1mkDnoDRv0JhgZD?=
 =?us-ascii?Q?hm8q+Z+fBm/efLeZnvQZHrkqH2Hu7Yx5a8iSr5NXj0BKDbz0re7ZNRqMNcA6?=
 =?us-ascii?Q?YvqcwT3rtHg10abCS+08LK1mPV9YLavX7nQTR75WYyV8olf69pSDUrELSsuM?=
 =?us-ascii?Q?b6CpHrGQsvCvmj2eZ7xBJ8k+fMcEwc/sEdYwQ8E/S1No42ih5dSJTx15IDMJ?=
 =?us-ascii?Q?jsGImZ7GpIgmz0Rzbm8pSQsGCl1RK9Rb5TbT6SqXYAmmhUYzA/ecQq6YcMyG?=
 =?us-ascii?Q?v0Td0a+WvaZTMLIrqb2KfmYs6KWF/3QqfjkAyHIHH8pI/uruMollydw9aA3y?=
 =?us-ascii?Q?+OuNQr6Sd/FEKNj5cEHlscOhVgB0FtvxHUED+VuUBVKXHxT2lmkFps81oSv9?=
 =?us-ascii?Q?zIW0KQJyOUOEOUnjjwVx8/gt+DLaXVlXuXvPjyf38dbCIrNX2ovf2hFn2b3X?=
 =?us-ascii?Q?UJYUXtAKNuAgslyzrjd6CwQWZujeT07goEWxjWzlpnU0b8OZssssfsn2lV32?=
 =?us-ascii?Q?IK7GzvP56KV87QKZtcbfOLUaBzlLB8BcAx9fPWVP7LJoogxBQpmXGxDjkjZl?=
 =?us-ascii?Q?7fZZMknBRSISCzvumSk617/Z8J5lPsQOg3PFfr2IoC01eqJqIUYPmMM1Zk5L?=
 =?us-ascii?Q?3xLfKu1GpplNPP/vGnr9zy9qMVgQq4u1D/JZf7fiHPcBxQgvVE0mnCh/blUX?=
 =?us-ascii?Q?ps/nmiRXbezZQJaKn5ICJzb2uY1ySg14+lD5I6chTs+LKkohtEx7YAT7OO1G?=
 =?us-ascii?Q?1xQrLTbfHjo/TkCcCvPwWVgA2BW2b1RWCVxyrvOiwIuDqmVj5XeUNmq79DwN?=
 =?us-ascii?Q?oVJhI5hjqyImFvcAvLWv0IsyYAw5k00y/ACjvltaRU+duyGuMcOIiXKktCKF?=
 =?us-ascii?Q?0oPWE5v0TBmrkXjcJS3fnoXOhs52HULo+BUDjqEmxqGf+MPCtiP8sggunI1U?=
 =?us-ascii?Q?0PTWlgXeZoOi4+dqWnvG9D4TKm3KWCiEnv087uSKXgdmJjtjTyQsIHM3+PvN?=
 =?us-ascii?Q?yST4be6EO1dXyTAcwaM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c87f0bb6-bcb9-43b1-4a14-08ddbdec8eb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 06:56:26.0407
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oe5fNv/suYt6QCPA0VVbhMMu2zhcEq7Tr4IdziShF1N7laP4JjrREYx65yG27PzSWomrMSPowKOddqMUG/wjXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6876

Hi ,

> From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> Sent: 16 June 2025 04:00 PM
>=20
> On Sat, Jun 14, 2025 at 09:13:02PM +0300, Parav Pandit wrote:
> > Cited patch in the fixes tag missed to include the driver-conformance
> > file. Add it.
> >
> > Fixes: f52fb20cbe38 ("virtio-gpu: support blob alignment information")
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > ---
> >  device-types/gpu/driver-conformance.tex | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >  create mode 100644 device-types/gpu/driver-conformance.tex
> >
>=20
> Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

Can you please raise the voting ballot for this patch which fixes https://g=
ithub.com/oasis-tcs/virtio-spec/issues/223?
I didn't create a new github issue as 223 is open and its half written patc=
hes are not merged.
It is fixed with this patch.

