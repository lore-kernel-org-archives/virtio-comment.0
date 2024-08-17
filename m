Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EF6433C1
	for <virtio-comment@lists.linux.dev>; Sat, 17 Aug 2024 05:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723871972; cv=fail; b=a3kaGuqLGGEYp1RtvPvMxxXEPJ/GU/26gj7bhjVOqWqc3ViqATSlCQUgBs3zGUizRrQ6PXALOFn6lZa6DIPo0zULv0GLNIX8roCj77x2oupR3kFWVkq0MSbjjnoy4IB3CbdcL/yXvX5mN/fRlOe/8MVkjugZQnpUcz7SiDK9EIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723871972; c=relaxed/simple;
	bh=2of23W7bmF+mqEkxJ9UIru9AKiGUV2al7hcSwiK42BY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rHJIa8edNMHMvTDoV8QRk5TG9iqyyc20/blOwFTTd24IfvE4t/3b2suVfhBAcLsG4v0zy+uzeug7gcA/b2wWuw31qgHOXi2YbFHGD2u3t4yNGELfUxGw5xu3jZEfv9vmF4Gj+Mqm/T7HNpzWvphIoaFi56VquHz3PvAguAmLkqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rToXjvAk; arc=fail smtp.client-ip=40.107.223.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rToXjvAk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4TbsGgP1NNPGC7CcoqCamhVj6iZ5zTmBQWaCm2HXBn66kbMg/iiutp3sV+8Kl7ZXA2WiyjpmvRPy9XNAMvk42g6E/nvZop4/Y3T4NWOXXUEGoxBZXLHnq1WBF0MMDDl2+iXKh//NT6wtqveUcxYNimlJzjOXKpcZZ71eQKVgEhSaucunahcA+rZ8AkYe/5RgAdJE2SSNmZD2nDNN8isYfsGWmpvUtEnQNtwUvR1H/POv/8dduiaNmH2QIBq0kWhksXlGfAK6ENWHnrP7RUlAwdYq9LUC7UU/PuBp/CsDKT2+1l0BlfRcpUyN77GPbFGOeVFGwaW4T/180LakGR4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCuq3rhyJvwseWZ4PFs1lV7NhHbTu2dC3e63U6PWWG8=;
 b=YlTxG0QCLHAP7dbXF1ypVLLtZgxQFQhSjLxdsWvtY2OHC5Ox2nHF1q34P5+Q6hr5pbT6c66luJdXxLyUdwYeS5sVaNNlMQM0n8u0CnKAxdZfIxtcEnOhCvuxjtDpPM8NByzuKiOzDsMclHfORVoUmNdBTM0CUU7vW4p5qdqW094oDf6lecF56hwWQVKCZJmBhQKqzmXHsC64PY8NiEClT9n5r4DMJ/OtqEd0e39oSBtruFvMf8JrbtGZE2eap6a2kD6Z16WaTaZhnQ802Zym5DWAT9D0OKttJSzC5251pogWgjNg3vFk+YPMvs4jKZmbQDED38kwKyg6NAhycxwt/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCuq3rhyJvwseWZ4PFs1lV7NhHbTu2dC3e63U6PWWG8=;
 b=rToXjvAkV/rl5yvSHpKEoPW1iV75Wmwqo5owonVBTYuD1gc4Ls9OASUPuk7dYY6twEf8tHNV8G+QI1JKzMCrvag4eWNypI/gI6S7XcQwMbpba1cuxAUbJpcQVlScG00LarW1XJKSH0mBFhNxV18pNQeA/VNPJXJADE2URBMy78kHforg1VJBa8E62bm4r54zYUNBxsFaIuq/Che2i6l7nPKzumTY6uBG3BAYhh5jWmvhS4yyMQmakLUcXJsMSNKWC/hy37Kyny49c2yKRyldaY35EJkq7RHpi+MM2MyBU5uX1Wf+PtMas1IgQMCLhT4OBIg2Kq5BeLw0OC7T/dqYJA==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by SA1PR12MB8968.namprd12.prod.outlook.com (2603:10b6:806:388::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Sat, 17 Aug
 2024 05:19:26 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7849.021; Sat, 17 Aug 2024
 05:19:25 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Zhu Lingshan <lingshan.zhu@amd.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	=?iso-8859-1?Q?Eugenio_P=E9rez?= <eperezma@redhat.com>, David Stevens
	<stevensd@chromium.org>
Subject: RE: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Topic: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Index:
 AQHa5Ab4bEzmpQ/mGUCtSlfq0w80E7IkrTCwgAASmgCAAAEvAIAABvOAgAAF6HCAA2yqgIAAAXfggABFsQCAAn7hcA==
Date: Sat, 17 Aug 2024 05:19:25 +0000
Message-ID:
 <IA0PR12MB8713496BF8FD13A1DE46CDFBDC822@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240801113516.22155-1-lingshan.zhu@amd.com>
 <IA0PR12MB871379BD50370080A9B6849EDC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <50dae8fd-de3f-49cf-9b90-b53f0416133a@amd.com>
 <IA0PR12MB8713E194469A590D09B1BA1ADC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <fbcc2cd6-793b-495e-b036-7baf77e87e33@amd.com>
 <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240815065136-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87139D0ABCD441C9EB10F5EFDC802@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240815110443-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240815110443-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|SA1PR12MB8968:EE_
x-ms-office365-filtering-correlation-id: 1361e6b4-bd78-4483-abfe-08dcbe7c2930
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/SwbptUClSmOHzSQ06YwCYalMPb5NiNcB6HfC4x2uSsJW889u4ag+06bjL?=
 =?iso-8859-1?Q?z0i4KUd1E7C8sQREnhWb1FR915B+4P+F5QkIGpZ9CB7aNbpC7W3Gq/gDRb?=
 =?iso-8859-1?Q?bsEG0BMkpCDqlSzHOusADzW4IVu6cyM/RVXhOlerGHmiJubx3tqeER/P8I?=
 =?iso-8859-1?Q?lLEySsZzPC8FPDlFhuI5xJfMbnrErp92GLLvaFOfRazq41CPvBsAaOP7hH?=
 =?iso-8859-1?Q?6hct++NatyaTCGtMazkeGVVSX5uMVV/+64SpuWqM1A6AMUEJoBhL591iwg?=
 =?iso-8859-1?Q?KRsX4f8UQihFtss+BNSh10NDZKLlbFvcSAMnVUyg5NMMAoRHhagKaB5Y/a?=
 =?iso-8859-1?Q?UiK9JD/Kne0gxGzMeDnOxe0tNEyeaFtOxZT3tnNdpAKwz0WgWRCjBQ8jgi?=
 =?iso-8859-1?Q?+JTVyErYb/ypL+b93nkyPfyEC6FvL2XMbBBjl+cLOabPXhdBa6BYXN03GM?=
 =?iso-8859-1?Q?NGS6NoE+CxyiLiAyojZwu8hgXqjmJ2GO7GEqCvFFgMTYaGglWsJtuVau6I?=
 =?iso-8859-1?Q?rDUfKwQcPxPp4iGVg6w4ebmosSh8UA2l8Z406M4JToiCslaFGYVRkaGJmP?=
 =?iso-8859-1?Q?RO/q4cG1ZWsjszJJz3WQB6GrJGCcijxsRMxAWNBshSfphcEEH5OHDva77h?=
 =?iso-8859-1?Q?/puBHXxCMZDWARMfyTxhqf9Lw9oleQsvrDMVgG3Tid28yhkKrKl3TtN6Ta?=
 =?iso-8859-1?Q?R5SnnBUTDhSqeY3lFqXCaFByplUIXpc0wb51aUtnyHSeLBh5WGM9If/2QN?=
 =?iso-8859-1?Q?UJFTZO74eKkgT/yw8aIN2U42JjiWA61spjMXrXCdT5FbPyWdy+EqAgIfIC?=
 =?iso-8859-1?Q?fKcGtICG55mdSJ+bv/HdRmcQcWpzzymVWfV5PohDAskPRGjhmAJS+g6bhh?=
 =?iso-8859-1?Q?QmJY4Ibou8JgQVrZA+7sZIL4D6LV3N/lxF1lZXzGlP1Ba8R77fiDGu4oF7?=
 =?iso-8859-1?Q?Yh8zPel+TVKotDTBRqX9EIn8IKBqhETXYKKWhxrch2SsdK+37Wx/cfZnba?=
 =?iso-8859-1?Q?WK36wrLu6fLNuFH0QABGavu+DsdAJJOABIuHKZLgU8fzTdZAagvqUlyLEe?=
 =?iso-8859-1?Q?1Fd7Wv4evg2hXAQSNQL5sQk/6cXwn7ywgEobzKkt2kTwNCMDoto7YamFXO?=
 =?iso-8859-1?Q?QUDZvsAh5X2e5EuSBvp5EVy96Ic96NZtCRJDsuK64eoXcvg+YZtdl+/hcd?=
 =?iso-8859-1?Q?pyTeO7rAXZNc4AxJvskiiO5hdXefgemoxyusDyvo682QJzSnf5HjyulnjY?=
 =?iso-8859-1?Q?5Jz2uccAxW58YzE+W9eo28jaIEa5Cfm5irYx/pdB/6DNdAoQ+u0YqA55YN?=
 =?iso-8859-1?Q?N+BfMQFWd136JKHhtQhPMw8f6KZLLHouJIt4Y8bkbb3aNAA4fjpSFqnVZ6?=
 =?iso-8859-1?Q?NCOcl/OrB3Z+iHVwdUk4i6TVKOpcXsITnNSvRzzsM2MKQWSW581ngBj19v?=
 =?iso-8859-1?Q?HLHX0IGYAdIQ77AayC2vo93ZEQXJaAmSCrqGBA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?AB4+1AIyiNyaA/SDOnWSl4WSp75EtzKmLugKLVq3Shl6Am6TrFyuAgd2SK?=
 =?iso-8859-1?Q?d6+B47Q9kizymk2pEeg9dxuwgpjdvxMn/jpnMn2JxGcvUG1yiKM7ziv4l0?=
 =?iso-8859-1?Q?JoOC1ViLKVJ6Mki+jQMhyXzOY3RAk25J0/7UC1I28Fgm6mtGmrLfz2rxE8?=
 =?iso-8859-1?Q?kl8bdb2XFqqofUrWmdJCagYC8d7KwMN4o3PD0GqGr5dgCFWKx8ifXzNkVh?=
 =?iso-8859-1?Q?0I4ClQQoaeXgLP48X+l9hhLslPexmpgE+TQxs7CSJrU6dnBhBPfWlHp+q/?=
 =?iso-8859-1?Q?J8aSu3XxmdG67GIXQ84H4U+tfE7fV7uVOdaPFZ9zKMcRqYcnVGU6zCnOaL?=
 =?iso-8859-1?Q?RvMlksFnTZnGQkpF1fWmIWkIIkwDaJR4dcKGnqqKaedfjWXw7KyQwcjUCO?=
 =?iso-8859-1?Q?czeyqEq391Lg7idPbx92XJzQOx90wGZdOCmWDA4yzfgrxJAH3AYK3cdr8A?=
 =?iso-8859-1?Q?d22dsJmKKPjLJYCGYZQ6Tu9Ntj0RZ5ZBd/fw9T5SImhFshbZeFKxZR4aSg?=
 =?iso-8859-1?Q?J8WA2XdxwF2x0FCVUZqvtVnkDCkDpvaMikjlRpj3H84Ps+NygftnbDll7u?=
 =?iso-8859-1?Q?tmXccZHS3A/UIX6Ftocm3+ALi0QzMXCYmJK/cNILUQhLzPZ3TorCuWSP0y?=
 =?iso-8859-1?Q?n4awPnR2z9X7YPB3qZbElvUsxGsuOnf2aaY0Nldsrf1Qk6uebLbBJztif4?=
 =?iso-8859-1?Q?x7EDkNgYUecfOMVT9jx8Zq9IT5sMBk0PzXHLEFbykoJCPUtzBtPyzxurzg?=
 =?iso-8859-1?Q?mJ6Maf51MrbhUh6sP1NbaNg4qDhRSRLZEEdQskXvRMoMx8isEQWRha01fs?=
 =?iso-8859-1?Q?d4rsc5iYC32jopoJ1ndyFrcYYB3h3B5msMRtZfcgsiDFwErSlb1V5XdnN7?=
 =?iso-8859-1?Q?7RYX4WaIHugUiDLbuDguav/Kauuauqg3DcHty17RcwYEFhfnmGwt6XIZ1/?=
 =?iso-8859-1?Q?/yOtLl10PgkftAE17NFZqRvKHBfQUEQ5QX/zF8VMeZhLZ1ZLY/JMHWwnWO?=
 =?iso-8859-1?Q?BCuK+4gK3SRxeb2o8NynXOSpofOXMsh5X8rHgedwNqXqxqEz9pa+IS+nrt?=
 =?iso-8859-1?Q?uZx+K8qczmuWfHrbofiRA1zSkgbVGbruP+JqKwiy2uVK14hV9lv5ALH6e9?=
 =?iso-8859-1?Q?HuzzLQ9ODG0fh7pc0Rt2mJffUF9FU3y3D/X5hFKHEXWfoBVpCJXJ33/jzS?=
 =?iso-8859-1?Q?0af2nzLFhk9jBCwroo9PxdoqRxs2cSq7Suws7n5c7RwupSs5zO767aGsJv?=
 =?iso-8859-1?Q?WVZscOu80cThqhEohxFapRSE7hk2Xz4G9l8+wL3OrGlEdT9csFWe0DEYLc?=
 =?iso-8859-1?Q?KFba9kmbl8qY/LpcpCqY5KnKMtWTvrpXWxJJJgF57P9Th42k50oSESb/ev?=
 =?iso-8859-1?Q?9KWZcg3o246pkVMS3AL4YI5vCNEQy6Mu5tylo+o3K7W1GNLl9emEZdnMYw?=
 =?iso-8859-1?Q?o/qS1dcF+6Gxm8v6EBEg1TpwDkZq2O/DYXlTw/Ip+yPPaJe0eYlEiBQeKT?=
 =?iso-8859-1?Q?BROzMaFalXRdV1fM3iuGSmA1cMj/6f5n2xZjU2ToMkrRquP1s2eVgclbTZ?=
 =?iso-8859-1?Q?DbGteGKiIdWHBcr71MMS0modcA8i+ClkOGuVywzziNVITHoefO1a5PlWz3?=
 =?iso-8859-1?Q?vx9GS88EEkDjM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1361e6b4-bd78-4483-abfe-08dcbe7c2930
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2024 05:19:25.5737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d1kjBcjnNWskbmwcrYBh1QAc2Spj3BKr53XOTWnYUoaICL6IiW1FM+fUqU2fiek1du1gWDBVoLzf+1ofEbxWYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8968



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, August 15, 2024 8:38 PM
>=20
> On Thu, Aug 15, 2024 at 10:59:45AM +0000, Parav Pandit wrote:
> >
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Thursday, August 15, 2024 4:23 PM
> > >
> > > On Tue, Aug 13, 2024 at 06:55:04AM +0000, Parav Pandit wrote:
> > > > That means, PCI HW needs to return suspend=3D0, until the device is
> > > > not
> > > suspended.
> > > > In this example, the device cannot build special circuitry to
> > > > answer
> > > suspend=3Dtrue within 50nsec, or in other words building special
> > > circuitry to return suspend=3Dfalse is too complex for the slow opera=
tion.
> > > >
> > > > If this understanding of burden is clear,
> > > >
> > > > The proposal is, can you please extend the interface such that,
> > > >
> > > > 1. driver writes suspend command.
> > > > 2. driver reads suspend_status, and receives
> > > > not_completed=3D(false). This is
> > > the default value.
> > > > 3. When the device completes suspend, it changes the polarity of
> > > suspend_status=3Dtrue.
> > > >
> > > > This has two main benefits:
> > > > [A] This will enable software-based devices to write data to slow
> > > > files and
> > > does not have to force VM_EXITs.
> > > >
> > > > [B] It also enables hw based devices to not build special
> > > > circuitry to answer
> > > within 50nsec, which can get very complicated for tens or hundreds
> > > of PCI PFs.
> > >
> > > I read this several times, and I don't understand what is proposed.
> > > A special register for suspend/resume? Is this the difference?
> > >
> > Yes, a command register for suspend/resume operation.
> > And device_status new bit that Lingshan defined returns the status of t=
his
> operation.
>=20
>=20
>=20
> Ugh, it's all quite messy IMHO.
> We have 4 states:
> - operational (resumed)
> - suspend in progress
> - suspended
> - resume in progress
>=20
> What I'd do then is a two bit register.
> To suspend:
> - write suspend in progress
> - re-read, waiting until suspended
> To resume
> - write resume in progress
> - re-read, waiting until operational (resumed)
>=20
> How does this sound?
>=20
Yes.=20
Just that having command in different register than the status is better ap=
proach to me.
As it allows steering command to different piece of hw from the status.
1. separate status register can be optimized by the device as its largely s=
erving the reads.
2. modular
3. simplicity and clarity to developers

cmd_register:
0 =3D resume
1 =3D suspend

status:
0 =3D resumed.
1 =3D suspended

cmd	status
0	0	operational (resumed), typical default.
1	0 	suspend in progress (initiated)
1	1 	suspended
0	1	resume initiated (still suspended)

> --
> MST

