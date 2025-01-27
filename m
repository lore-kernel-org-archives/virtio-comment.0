Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EBA53BE
	for <virtio-comment@lists.linux.dev>; Mon, 27 Jan 2025 12:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982447; cv=fail; b=jXIGr5FJVy34rq6Gnm1OymWTWfbevhSLoIQTCpeDnJGbwLlE4z5SHnWQGUXZZVCjRwy+AIsszCxpzje88ki4jJ1vKBc0eJsczZDHQo3uaAUt7NJ+agI21S5FZQgbgQt5DaTLrZZ0ZvXfSMMsesg/wo+N0XrjDbfWYaBfoc5iRS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982447; c=relaxed/simple;
	bh=wKThnmSJGBVEHj8KKwF437Y2NhvZJ7uaxeqfLosgZX4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sVCAtot6ZjJGxB2QCcA6xcVQMDwEI6DOV/eRpFcvmepoAhsxQwH7U5ijCPiHfx3Ge96GFMKNrzpABqkjgTC+00Wb4fhdiSlctlC3MWzvsuz9xzb3FtSJTCNvZf8qdSTUwGsN8lFxBNQvXxsVWqM46v7D4yh8jWpgyPxfaG3a/qo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MjEW9Rof; arc=fail smtp.client-ip=40.107.244.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MjEW9Rof"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5sX/x2sFTHTYX6ZRoSXbxYqtRK4VBpSUtnZD78sBYqUukZivsl8EvThUPSSsjEyCPMvU65pN/Rec1auM0/p7tGa8TdcrE8wgD7zNqM9LZm8inzC4l0iKWiULp4zZta6dJM+lKdPvDKdpcmUIN/Qy7qRClpzytvIoVUi2xeRE0Rn4L73zmI6tyMsgtdrVaDin0SfGLL/TriC7zFnSgYyONIEsBrLvRS4r2ENKKQAQZ8N0JLtdiDSFAd+m5TboL9dxzQ9yb4P9uClP08W5kXbeFA/8PbD9FWoh6gLQlKTWliTvs6BdsuRd5fMpJm+WW+kDOeUeQ/p2tH9sMglrXIwQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKThnmSJGBVEHj8KKwF437Y2NhvZJ7uaxeqfLosgZX4=;
 b=PXyg9GS2zPrLANV+99oaevPzvUyUBfzdsBE9q2wnvuLXmVMK3m2bGfdVtMeQhHAGLeNXS/fJR1s++61QpkM8ddmpzd9kYr9JiHv3S/qSJiLkTDpOVrQ/HhUG1MXqJ6mMeXauOJw1n3AyaSFmeQDWmR6YLtmGTEmbIvX7m4m9lIoxb3O+BkEI39+sJlxUvDTGb1nwsfQsPyG63v8E2qnwbTRIa9yUg/9Wmu6uRDGZXnc8jU4sw70/TF1WmLqr4MC3Kz2rWHaWdW1YeAeTsdSoqlabI+H5ZEFoWM1iAzJjagxwOnuxoAHfyqe7Oe/j4nL9LKK/CAVxzIPCpBSLiEq4bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKThnmSJGBVEHj8KKwF437Y2NhvZJ7uaxeqfLosgZX4=;
 b=MjEW9RofFaII2E+7wmQ10MypfXI6QROyOup65+cCr2HiUp9tZ1O41CO+Ro0QsKeG83BsrwsJUrQkBAyDJx66MRi0f3uUYz2hCtkeADZsTilbXtSOLd3RN9mCO2lBgQOPbl+hVyLOpwg5GJrnKTYzQRawXT8DJySrI9XDBKq9q4JokW0Vi6Sq8fRJnqycquqAiHBKV8TffXzQHLXN8hvK12qnuQ4G6X9Uqkexs1dPJeecE91xZ/jzTnI6VJ/g9FXb1GP/BtjSj509EkEiXIV5/px06t6TUWTWWkaIJx87n7VzFn4hc1W2VhHZ2bN+z1SKcNmF5Jnu+OI/P0C7CWA40Q==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by SJ1PR12MB6241.namprd12.prod.outlook.com (2603:10b6:a03:458::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 12:54:00 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 12:54:00 +0000
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>, Shahaf Shuler
	<shahafs@nvidia.com>
Subject: RE: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
Thread-Topic: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
Thread-Index: AQHbb7qQTK1IFlk3mUyW0rZK+XznHbMox2mAgAB7UaCAAAKugIABFOYAgAA6xfA=
Date: Mon, 27 Jan 2025 12:54:00 +0000
Message-ID:
 <CY8PR12MB7195DC378520C9CB6E434443DCEC2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250126062058.13695-1-parav@nvidia.com>
 <20250126041732-mutt-send-email-mst@kernel.org>
 <CY8PR12MB71954013A3A3E5F81E03CD9CDCED2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20250126114917-mutt-send-email-mst@kernel.org> <877c6g8vdj.fsf@redhat.com>
In-Reply-To: <877c6g8vdj.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|SJ1PR12MB6241:EE_
x-ms-office365-filtering-correlation-id: 6d9854d9-d4ff-4da7-fde5-08dd3ed1abdd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?PESYJ5XGrvh00bOD7bMoazLlZbrqhwjZs4rYCCfW7cigLJJmBmKyuTF/xkmf?=
 =?us-ascii?Q?kJtBNc5yoqeAXbXMUVIICG+Mno6ZzGyVUqmIVJUktO6TEWA/AoDP2vbzI7Nf?=
 =?us-ascii?Q?eDOoPg34onZc3HJyArvdHNTwFgMP2LkQlUIbvlHoixbSoZqd3mlyZLqRclY5?=
 =?us-ascii?Q?erq+MkDpAHjU55GKkSrNGf4qQ5FeLWRzVpwC4S7h3sZ3vnyvm6+L6bY148zP?=
 =?us-ascii?Q?Bmof34EHzUQ3zXBiXvQS026TFmKYxdp7SlVAg0jKwuM81qurjf7JhqeD9Znk?=
 =?us-ascii?Q?asdYq9/bajRoPWmmcLrlrpBSdoIDionIDXMIgaUk1JRiGACGv6UvVO/b1kXZ?=
 =?us-ascii?Q?38RmHKfmeLvUrhniZXiQH20gelQnp+EVJZodaxhOPo42LSYdjmjQHD/NoOD5?=
 =?us-ascii?Q?4S4fk+AzU0WhGn+iQ9/hmU22/G3HZ4nG40CGKjwX0OeGCDlMRYdKKYVZiFNx?=
 =?us-ascii?Q?d6uaAIlN/d+Ub5dtDSx2mpO9r0qgmY9DYH6bz/oqP+eCaqwcEHlVCAxj+jXk?=
 =?us-ascii?Q?TB7DMCf951hSxlEuxHnxMkBkAVLa6y0No1HM3C0/1OnFOt98qgnzmGu2uJnT?=
 =?us-ascii?Q?6XUdRJ65vJMJyfiL2cP/xT3h5C0gcJwW+U+Mk7v7MUOVa1FRXkyQhGudQigP?=
 =?us-ascii?Q?wIEiWFOB+zXEF/6lOTS/9YVVBLB5BGWD9ej3BzcXztnjrwkehcfIPW7Eijrc?=
 =?us-ascii?Q?KVmlE5uPfQdg1GB+NfmL5Kd8WQPt3RWjey65ipVE8pJZrRVdUsVjmVgNWDVa?=
 =?us-ascii?Q?AyNLRuvQzK7ccWWEN/9sS6Q6aQhkdSD705CYIbFjwGWODqv/PvwtHLaV/3B0?=
 =?us-ascii?Q?sM6q+GlBVnfEp9AOnPIYQ9HFfnwHRCHVBU3SfvsYFCHJoWT8FL9773q5DpPX?=
 =?us-ascii?Q?8Xu98fTGGVoB3QiM01M2bcDNGoW4SoNRuTRf8EN3vZDDtycKUiQQgOnajkl0?=
 =?us-ascii?Q?kF7iLrSZ0J1e1M1TAuKpLYxUBlQMzjU6PjidYw5mZ90Vg+taLuXr5mbC6re6?=
 =?us-ascii?Q?meEvoucjvM+VmjDe+cgBlQiVZO1Z+tcfRfSUc4Fz1Nb8HXiIGY+j41sqqqGq?=
 =?us-ascii?Q?gZJK5r7w/kntB2ptlDueW/evl4ZG+Kw87Kw++uN0TDSB3P4iR22BlZvQFDwh?=
 =?us-ascii?Q?SKJwr9TmW+NkYr/ddrHDLBY2BC9Zzl8yWspH+lBPKrDyaY2h8Xwws8qV2SlN?=
 =?us-ascii?Q?u5m4s1AfcW+zzJd4oXXP7ruQAr15cnLiLESBHESOLJQxQIhKmAaD0wJt8ouW?=
 =?us-ascii?Q?epO0fpy8fhQiAp3NIa4rzPYVUzueVBOMfP4QNxcmOtjlewF68Vu3GSUIMd+E?=
 =?us-ascii?Q?pdiyY04Ae2q06NDV5OCP5PEaPRQYaZ72Ez4sRO/iVcL+53ugR/+sV6KvsO2j?=
 =?us-ascii?Q?Y3b+JMD+JEX63Qd6KMc0gDSdFGUxMgG7wJPXRS5dhE0qMlfLAg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9kDrexSmJi8beyIK6lsNNNpD/U8GzjgbKw1CenBdN6fmYN9apg76n2gdQo9H?=
 =?us-ascii?Q?0ORU+1sH4T1gyLuFs/tnneZGX99/cHadPlRCCTz7tMruH/eC40frj/sz10ot?=
 =?us-ascii?Q?HxhypYvWzjoSQWRKloUMEb/jHNBIwsqE8YXuqT/u/Sc4TtuA5IfguyqdYUZT?=
 =?us-ascii?Q?OVuG1D0qrCnVrd9Bfpnfww+FxIC3Lu4Z/Gh3GWBzLYhZYEbAXTT7Fr4RLXlW?=
 =?us-ascii?Q?CxYMXYV9Ubh/py3j7GzKG9J1t1ZZMahZQi4rCrvec3Pj9RzRZ8q1f0ei3gfS?=
 =?us-ascii?Q?PcxIaF/a5E7wf3v/QkSzHEF7CHn13ykNX9s/eiTesXgnafXHuk+os3IMm8wu?=
 =?us-ascii?Q?NzBaM7LD89EswQGByqSrZK/E3qYj6bOL0pjCaDzrnZj1W8/TJiaTibPMhw2O?=
 =?us-ascii?Q?CtAsfOHBMyHcpVELa8cajHGq7FSF8BWJvxVnkQfHPavRkDF9xI5taFJ9li+o?=
 =?us-ascii?Q?W8IgrkWP+woz3/mFsoNul4NQY2tttaKhvXkFvNkQ/i+217KDY++eO4HWE3YE?=
 =?us-ascii?Q?cc+MeYT7K1+kvQsEvYXGyeg/m9EkxTnEgpHpawlWc44cegnxKTh0tuKaN0Xt?=
 =?us-ascii?Q?xZGmsqyGv0F4kvCMRMslK/Gq4dfbCMEEyMgvBT2zgtJl2vQ3Q0xfNHj2jqwI?=
 =?us-ascii?Q?DN5GEG03h5h0MjiNSGO9uq7FI0GECuUaQwaCpiV2HfVeRWxwkBOBmYiaNgwK?=
 =?us-ascii?Q?UQNxCEVZDtxuMiBvWKc7v9PHZjMhgFvxgbX69m27hskZGXrA/L910nYr+SOX?=
 =?us-ascii?Q?FPhm2V2BUezB+apekwhl0tc9XrQRWPayUrXN/qIz/gQiqTWeF2qo7BtAVK4x?=
 =?us-ascii?Q?L7TtkMLwfKjcRyXmIiWgb7Q3ihfzvkOnJDF8UhAN4+sTdpGl5u6XJ6/j19VP?=
 =?us-ascii?Q?4LrWs5wfjNoWGYVxjdttO0Ft8Hu36LuC2KUselhgBpWRfIW3UDEwAOSMfr/s?=
 =?us-ascii?Q?c44iZT1pSijYUops2XZCnUsUJR8uS3OnEaZXXFj9oRNBAZzJqljW//BsE6wJ?=
 =?us-ascii?Q?0iaZVbUOtCqaQFRXK/ng8iZonevrpK9ItYCYTGWYWJkxrfN87ozrhj3ssahj?=
 =?us-ascii?Q?OxOTjDLZCepX2L8cRbuPxfFkRA+k7kwwXJkzabFPYMp2zJPhVR4ZBhGyLbbJ?=
 =?us-ascii?Q?ZFnv/nDX8BDkqYXrSHuOrkzOj1jH75PXbofacATFjH239KFZNrHsRe6PrGnO?=
 =?us-ascii?Q?jYxP6r+UZehXZCMTCDuva1oLxeDwOU+bBhfT96kHqI7gEQynnrPSHx6Hvr4c?=
 =?us-ascii?Q?Gz/ht+eGTV4SX9JDidCsQahr8oXyJm+pyqnZT3lhDjvlFDmUUf45fPcF8ua1?=
 =?us-ascii?Q?uP/yVesd6oys3lkE5OIdt/wBjYtuzB1QyEZco9dHBEdY1kBzRkKYqByfp56l?=
 =?us-ascii?Q?8OzspDr2sVksQWIJnGRXK2hz5Hp5at9sTIhc7dAvKUYDoHe15/STmxryZp+E?=
 =?us-ascii?Q?y9DDe3NOw5msJdabO6Qe+ag8zWbsh7xibbYq43bp+2ApIyhAdBGIxDO2eWDu?=
 =?us-ascii?Q?6+IZp6GNIOSh37kXQ0xNyW49kbM0gtkD0+4u09XMlZrAnbFVHDZ99FfGjxhE?=
 =?us-ascii?Q?G7//Hy2yIgtq5AS9L+KmJ5/jhZM7ZmZ/958OJ2O2vwmiZdUbYbyZh9VPGBow?=
 =?us-ascii?Q?ZnKNiq5UH+IcMSIW/lMaEXaMdYhOFyNrQZMClg16Vfb/?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9854d9-d4ff-4da7-fde5-08dd3ed1abdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 12:54:00.8640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nDHGC+AYzecDt74pPF0+VQIIs6yIJ7l8JK3+84oFNrV5bWgBnp5Qs0JutS9gmV9rSd49WA0ctT1mV9p9IImwTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6241

Hi Matias, Michael, Cornelia,

> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Monday, January 27, 2025 2:52 PM
> To: Michael S. Tsirkin <mst@redhat.com>; Parav Pandit <parav@nvidia.com>
> Cc: virtio-comment@lists.linux.dev; mvaralar@redhat.com; Shahaf Shuler
> <shahafs@nvidia.com>
> Subject: Re: [PATCH v1] virtio-net: Fix to avoid using reserved feature b=
its
>=20
> On Sun, Jan 26 2025, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>=20
> > On Sun, Jan 26, 2025 at 04:44:51PM +0000, Parav Pandit wrote:
> >>
> >>
> >> > From: Michael S. Tsirkin <mst@redhat.com>
> >> > Sent: Sunday, January 26, 2025 2:50 PM
> >> >
> >> > On Sun, Jan 26, 2025 at 08:20:58AM +0200, Parav Pandit wrote:
> >> > > Listed patches in the fixes tag, incorrectly used the reserved fea=
ture bits.
> >> > > Fix them to use the well defined device specific range.
> >> > >
> >> > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/212
> >> > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/213
> >> > > Fixes: 8cd457d8aa82 ("virtio-net: define UDP tunnel segmentation
> >> > > offload feature")
> >> > > Fixes: 3fea589bd7c6 ("virtio-net: define UDP tunnel checksum
> >> > > offload
> >> > > feature")
> >> >
> >> >
> >> > Well the hashes will be wrong I think.
> >> I pulled the patches from the mailing list to local repo using b4.
> >> Once the new fix is voted, I will merge both the series together so th=
at
> hashes stays the same.
> >
> > ok. just make sure to verify them before you push.
> >
> >> > So, we can do the ballot for this fixup, and wait with applying the
> >> > patches until that new ballot completes.
> >> Yes. The small fix is reviewed by Paolo and Cornelia, so if it looks o=
k, we can
> wait for this week for any additional review comments.
> >> And merge by Feb-10 or so after new ballot completes.
> >
> >
> > Acked-by: Michael S. Tsirkin <mst@redhat.com>
>=20
> As I don't see this change as particularly contentious, I'd suggest to ju=
st go
> ahead and start the voting process -- there's plenty of time to voice con=
cerns
> while the ballot is open.

Can you please open the voting ballot for https://github.com/oasis-tcs/virt=
io-spec/issues/213 ?
The proposed patch is: https://lore.kernel.org/virtio-comment/2025012606205=
8.13695-1-parav@nvidia.com/T/#u
