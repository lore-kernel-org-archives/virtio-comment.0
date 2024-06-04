Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA112A8D0
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 05:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717477831; cv=fail; b=Ivx/sNDeMmomIuAa+O5cSz0gdhs/yvzbVw3n9v5tNMNbHX0Rjg6Y2R78SfRHockOvLAMlHMyEJwQ7ajhjmR4uVpyEC1hgBXeujPpnEv51PZjhwn3ZTNMQ2UGY2Txv1gPNkypAb/zLWk05PdcRqFUjPCgz0YbRr5bzX01sSOjUIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717477831; c=relaxed/simple;
	bh=OiIpbxqJ/UpRm1foLZySE0NXKi3XjeDI8RO+WiNB+Z0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CtXI8ESoQRyv6rQf6m63cNNRlzjcsR/gkSihBSiBcW6ofzNkQxACcdamqLI2JWIfn/N2x9hEyZM3URO+oqr7ZhS1Z6SZbyliHwUgV7tA/GKU99EvYNV5dlR+bm94pK6mzw8OioT+p1J7gQqKc9+rvKbWJYdSSQh2VICvjJIE8UM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fc5R93W3; arc=fail smtp.client-ip=40.107.237.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fc5R93W3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGNpVXZas9kLrLPeWeJ/4fFj1I2i4l9q1J1AzmtOgFrcxEPOXGPp1a61r1GVIcICM0AVAJAtnjms9Bf5BHhYsH/V4ALBbk9lVmpiNOTyOhWhY8nKZebP1lvpBPsFG7Zm/Z0lWa8Tq1l18fnixyWtfX3UiIlJTeIhM2mtSwLQkniFZF5lv5oQHghEBug43Q/sr9q4gQjRkXZByjvxoZ6f+ZIwFtJEQuTe/4+UbZyc/FvoS3GojFhK4jlBy6SiE+G8NNhsVa9ikb5QR+iu0P+4EBSzBVy1OVgDqSaetmPRYn+MOLt3+PMBx0IZWhMFUnjyH5FXr2iO7hA3lRimK8QeMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0irKWiamvuWFgP4kgn2aU6+qQ+dbMTHwnpo9PLgh9w=;
 b=SkrLQ0ANFahiJAqKE2YFLYOJSwvpkH5wqtOnn+7eQi4LkAd23jL6vh4qDb1UgjTLhpaBThCj55AokvJAn+LaksiYRLFveKBiEpF8rlcVs+PmA8dfUAnA3XfQjt1qGxJ+udZ7tUoBaCWAaz8TsknEljt0pTgG72rOTEYFrbCP/WqSaTehBDcjULaGrc/94eb5oLFwIO1u1uNdCrC2dlaPMPM/l174xi21vNU71hPD+E1QIGkNbawsrLacpiCJJVdT+JXz2CELUIAVsbda3v24DKXfij48VwWheSzVljYBE96GgyLYHbiGkzY1ePhsSBYAywwhW9o2y4diawluMijxrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0irKWiamvuWFgP4kgn2aU6+qQ+dbMTHwnpo9PLgh9w=;
 b=fc5R93W3Qk7A+oMgqnKVXDnPlGCO6ngVNrWszYnoRFrOWwF7xariF/wO/VMvH6W8QFtPklbu/Yh+7c326l1bCruouQ9U4uPY8qVSZaQpGpB8Bo6F8/szN+YWcJZ0Jm6np4soX6+y31+GU7JJSFlZC5CZt2mMBNUqTZ9H+oG1patG2sqCOyAiGAun79FLNvAo1KXJEngHG6dcp+EoXjhev20meZPZe09bvaaxSWVmABYSf99Fr1tND1u5EzGxlvxAjskrhcwgTKelSramlTddKt5FcW+MBQ6xl8Z60QRJUlnTe+jQGCGdkoRk7GA6K1JT/wJzNVREGm12Jr3ymMXDyw==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by PH7PR12MB7210.namprd12.prod.outlook.com (2603:10b6:510:205::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Tue, 4 Jun
 2024 05:10:25 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 05:10:25 +0000
From: Parav Pandit <parav@nvidia.com>
To: Satananda Burla <sburla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"peter.hilber@opensynergy.com" <peter.hilber@opensynergy.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>
Subject: RE: [EXTERNAL] [PATCH v10 11/13] virtio-net: Add flow filter device
 and driver requirements
Thread-Topic: [EXTERNAL] [PATCH v10 11/13] virtio-net: Add flow filter device
 and driver requirements
Thread-Index: AQHaq3q9IcpWUvDTv0qsXeunl+psKbG20JEAgABM3wCAAAWnAIAAAEZQ
Date: Tue, 4 Jun 2024 05:10:25 +0000
Message-ID:
 <PH0PR12MB5481EE27EBF8D735BB50168CDCF82@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240521122937.2004180-1-parav@nvidia.com>
 <20240521122937.2004180-12-parav@nvidia.com>
 <SJ0PR18MB4477D6A644C2C0A7F7E14DF0C3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
 <PH0PR12MB5481D8FD1CC10D99E6102DACDCF82@PH0PR12MB5481.namprd12.prod.outlook.com>
 <SJ0PR18MB447755648B087A2113FE0C0AC3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
In-Reply-To:
 <SJ0PR18MB447755648B087A2113FE0C0AC3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB7210:EE_
x-ms-office365-filtering-correlation-id: c024efe2-8069-413f-2673-08dc8454a482
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?/6VujiT6CPXu00R4l0lL/+KfIzn2jtV4Uj43fAX5S30ZkRMQxMnX2YWKQtNj?=
 =?us-ascii?Q?LfG4PSoQ+/jzcJRyJ9CCY/0Qo+0eJkMdjPJDrT1PxFcsuOvYWy9OM/bFAWrC?=
 =?us-ascii?Q?gVNQ3wrGMKbong2IAYVd0oQdtZmzCWLwyLP3AUPn8v3Sj2qV8QaT4CoS1Fd+?=
 =?us-ascii?Q?ojmqa61SjNTcHE+MhosdRVXP2N4XMvtqDk+aeUURJ+a/uDmSk7o4WkbKkkQ6?=
 =?us-ascii?Q?sqsycC6TiDujUfueNtqy0FjrZUe/3XjxfwA6AO/3alf6jhzGJKr5wj+HvmH8?=
 =?us-ascii?Q?Ew3kfBBKWHxN4IIkrUUYPSDNHo3jqIT64k5nPQOHmYsuPEe4XwcYUKmB4H+D?=
 =?us-ascii?Q?4tREuLRCIWxfrd5C09YHuP1sMHCqDUwmUYxQMG4nBXLDBm51CkTwY3pgJyW+?=
 =?us-ascii?Q?BzsXigQNkrls53NcHi3LP7jRTlXYK8MHUetyoiun8dJUQ9eBWV/2/OX0UyvJ?=
 =?us-ascii?Q?Bium9HR8+oorPqDPBy+QQfke6e6M5mVK1wiDWQ9I2KD5HeDbWvgzpLQ1nj3q?=
 =?us-ascii?Q?TjLecAGl1K6C10OZ9yEyhOJmy5Ub5lzSffvfi5Y3qSlA9Epfg2DH0Hs5HWrb?=
 =?us-ascii?Q?mYE6Fyvw9r/F+H0eAxDopgNovK0Pe+0D2foRyGspsimkShd1V3DKa2D703tZ?=
 =?us-ascii?Q?NCF7skinC4sVCw/A8Y26xg12CSpUC/fxPeXwtkVo/0PJgAKXvzyDR9AZAxDZ?=
 =?us-ascii?Q?5wL9eaJCjAk/8ZcqviQ3YkcBM48xlzlc4NWGS9qUT4Ld8bm8Yf56cCY+sJVN?=
 =?us-ascii?Q?QQFJ1sXZ3A8N6MVbDBxuWtG2ifKJeHr7k9JIHfy82Ac912OdRSF6IdsCfIpC?=
 =?us-ascii?Q?Zd546Z+M9CnxQTE4ti+DCsAeEWLom/pN46lU0Vik71hXsMnmqXLIAUa1PguT?=
 =?us-ascii?Q?X/KyXaqTmNvc7ItW/eOt8sW4W5JfZTAnA6GIz5BWO+amYNg1qeDp8Q4VtwPh?=
 =?us-ascii?Q?VHNvEm58IpR0awj3/tkATqJSp/uq+UcXHEFB36bPgLGuOXqY+AVLzQQkyMvk?=
 =?us-ascii?Q?gl/WejQXw/mUsNY/8thDKkN42DidOUGgxBfTZVHu+MGLSPSIgNb+WyHHu5SF?=
 =?us-ascii?Q?0ucdh5eujGdihAVb9jVq6LRoKMzOo9GMs5OEng0hX1A6/W9sP6u+yIGbjvat?=
 =?us-ascii?Q?9ounbzKZFVDAMihllPPCvyzNZTtZRLxbwPwHC0f/BxFywTxAdB7o7Lp9pmpt?=
 =?us-ascii?Q?QfL/cyS1xIaDMYIIFI0ltP6Wcdaxm0CqliiC4Z+ztNOuK8V5kz1v9N4piazf?=
 =?us-ascii?Q?YGQtz6PZ1NvRH7HICL4Qah3t2X/PgExq2FGYrzkr84TtAd+C/Ylj7Ks0EHF0?=
 =?us-ascii?Q?gRmzs/DhOnnyg8eAkcVWmT5xCsnK8UIsYWwadoETg8dv1A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gmEaFDtYrMZZSz13juI5afDBhUHk+N5a1Y60iUeWapNERb43t7wKDxj928i+?=
 =?us-ascii?Q?TbT6sRmj4kDHd8FBPGwFZazPag/YxQwxbhBUQ0TCvL+0G+M3gChU9n614Vpk?=
 =?us-ascii?Q?W5I0ZGilhKqbLxm57Vm6WFUlAJfUsZrTRwYrDKjSRlnW3btHUaUBHhksJPQv?=
 =?us-ascii?Q?fo+oAaK0m90M2M/2/n64PFFTcnUl9dSCD9YS57VU5qBRFlWkiYB4+hEqW3bu?=
 =?us-ascii?Q?dLH46nZmExKvRl7OH2lykt3W0qechuLS5AJj8r6/1c0mtis1rVGAcjLlUqKP?=
 =?us-ascii?Q?1Uhw9SF3Tsr8RoGuTcPEN/hWTGkmh8t19C8W8dnpxucQ1Gx0KiHPa8bBSFPs?=
 =?us-ascii?Q?396Bf/8IJSamKWc/LeFvWgpIbfezaOSwsVxOJzD4FBPdRN7KlqWeAYk5Izia?=
 =?us-ascii?Q?SciflQLOPAL/ch/MlSF6siXDyMsZqOk9Su2QmUc2Nlox2FPOqjuZzt1W3F3x?=
 =?us-ascii?Q?4Lv4I/2OOQ+n2I6Tq6PwNxdlXyROiYODjjy2u+XBuS+yS4gU9C1Rlr99Gj2j?=
 =?us-ascii?Q?ZzIy4zNrYEzL52XuE1O9+zC050J1TNjcFeTMqXjcM0pkrhHNhfiBAysLZEPn?=
 =?us-ascii?Q?1PW2btB+B7v07Q5C9w8++tVkulR1QUaHkyAOwzhpLKvITm1/r/oX0nxkDP6m?=
 =?us-ascii?Q?zXTTHThpCti5DmB6odj78H5feZ6EzMcBCJ4LNmMqTRIp5FsWuGB2xwI5YbBL?=
 =?us-ascii?Q?VT8iWSt+TShxGU3X0ZsnaUTDHD8+J93nr8TgrmjPYNOvC8Ct9KcKssUG7fYG?=
 =?us-ascii?Q?yUlKcQjSGmkFDi3rK2NrP+0SHNFfsP8gop9mUhmyjfiubVNRJkNHFocvzqhn?=
 =?us-ascii?Q?kw/mU8zwo/UFLsZqFp8k6w6OBDW9QmdQKkREUAyfINxUcbkF6Jjepwc1q0vs?=
 =?us-ascii?Q?CJj6YbVHIg3zxluNQhSl7Nh9XVNoC2Vp6SZfbd8xYwauW978NSHC0eS87z8E?=
 =?us-ascii?Q?eO0Aoo3Crhl3kUUzPmqoQZ+mfviccRKifFHpGK9sedFTx0gpXCW7Kzh26PsW?=
 =?us-ascii?Q?xHAHSvpsa7wk4ITkj0LsHY8E/Wv2xckvetEBtsJBNCCe2FGf6AcbqfnKjfwt?=
 =?us-ascii?Q?TpzTWalzkdTg/y4ufm9NZ2Mgq74atQzymbzjiiP7E8PBqYDg+brKJ40ttn73?=
 =?us-ascii?Q?g8rXAvaSkj9nwDtNIdoyYJKT0c8szZJX+szV5+bcgfw4FC9O5y+VsiuLTXLM?=
 =?us-ascii?Q?VVOeTbhHP8HIwu/Ho86bjtMN7xARMxzd6h9Q66NRxxlOdIXDyMbqtbFNKUUb?=
 =?us-ascii?Q?FxtoqnZLN+y1kKHWHXYQI5X9Uqv35lcgLXlzrNJ+OZO9aABk+NiQ38d0xDBu?=
 =?us-ascii?Q?TMfyayuQsmMuT/X5mLx1UymXTjL0+sE5hjOU1c0fDyT73eIjwtFekaLlKYch?=
 =?us-ascii?Q?CDurQyn1Qegb3LtVchy82vsGHw+3DV+osJBLgmtjkBw774m4bZEGtBA06nyD?=
 =?us-ascii?Q?qFfbq/lfO4wUVrwSDsRy1NE+7L+hj9Ph5Z1ChK+uni8Wm+BQKn/bzZYTjNLw?=
 =?us-ascii?Q?qjnwEk7tYMQlMmERP+hZ9BpaZ0ZscuFaC6gPXEf0fWuPAUHeVUwM1Jync4Xf?=
 =?us-ascii?Q?2XyOh2Hx8+62b4pALHA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c024efe2-8069-413f-2673-08dc8454a482
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 05:10:25.1523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w4izALH4ilNMD8XfTEdPiN5WR+bOTDXxvnJCYlEIdbW49ViQlkDWm5kvAr6yFpDf3vQUZr+6Y95ZSP434Ty17A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7210



> From: Satananda Burla <sburla@marvell.com>
> Sent: Tuesday, June 4, 2024 10:37 AM
>=20
> > -----Original Message-----
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Monday, June 3, 2024 9:50 PM
> > To: Satananda Burla <sburla@marvell.com>; virtio-
> > comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com
> > Cc: hengqi@linux.alibaba.com; Shahaf Shuler <shahafs@nvidia.com>; si-
> > wei.liu@oracle.com; peter.hilber@opensynergy.com;
> jasowang@redhat.com;
> > xuanzhuo@linux.alibaba.com
> > Subject: RE: [EXTERNAL] [PATCH v10 11/13] virtio-net: Add flow filter
> > device and driver requirements
> >
> >
> > > From: Satananda Burla <sburla@marvell.com>
> > > Sent: Tuesday, June 4, 2024 5:42 AM
> > >
> > > Hi Parav
> > > > -----Original Message-----
> > > > From: Parav Pandit <parav@nvidia.com>
> > > > Sent: Tuesday, May 21, 2024 5:30 AM
> > > > To: virtio-comment@lists.linux.dev; mst@redhat.com;
> > > cohuck@redhat.com
> > > > Cc: hengqi@linux.alibaba.com; Satananda Burla
> > > > <sburla@marvell.com>; shahafs@nvidia.com; si-wei.liu@oracle.com;
> > > > peter.hilber@opensynergy.com; jasowang@redhat.com;
> > > > xuanzhuo@linux.alibaba.com; Parav Pandit <parav@nvidia.com>
> > > > Subject: [EXTERNAL] [PATCH v10 11/13] virtio-net: Add flow filter
> > > > device and driver requirements
> > > >
> > > .
> > > .
> > > .
> > > > +The driver MUST enable VIRTIO_NET_FF_RESOURCE_CAP,
> > > > VIRTIO_NET_FF_SELECTOR_CAP,
> > > > +and VIRTIO_NET_FF_ACTION_CAP capabilities to use flow filter.
> > > Does enabling here mean  reading device capabilities and setting
> > drivcl
> > > capabilities ? Or is there something else to be done ?
> How about this ?

Sorry I missed it.
Nothing else to be done.
Yes, get and set capabilities command.
The word 'enable' was chosen instead of set, because one may still clear th=
e bits in set command.
Enable is sort of more clear to indicate that one has to enable the capabil=
ities (by setting non zero values).
