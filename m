Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAC613D516
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 04:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717476779; cv=fail; b=JFSjkIMSmhXAYak6KrS5jxnq9EdzTvi+HokB67onC8rJ/NYG3ih3VSG0YW8RgrZA9gk2Iun64HVm1i2Mx8JDrmBrpxEBGQv+xuNVmQLYXmlTCbaDnk/rZ3HRKu+B6oxhMHmcxwDimal9hYdHZY+QM3nR88Ac6bWiRmWz8KI8eRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717476779; c=relaxed/simple;
	bh=ZPseEEvWA7YRo+vvL/JYrvfNj8sZUUX6B4ASExwtI3M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U4LLJkPhtcDYME/OkaA4kHcPlKcS0TYwcBfJMFVnveYBy4vwkU74QYmtkOMJh8ZfgInqRIUuv8RxRiO93HjewtjXe5ljq/r2G/dNpgc5AzLrktPP3GvFAKrYB7oW3YYsjDdRqxK6qd1vBX/SOJxRQdupuU7/sDtImLtm9Gilmt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=c39hrFb4; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="c39hrFb4"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4541hwVn003084;
	Mon, 3 Jun 2024 21:52:44 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3yhsh5rfjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 21:52:44 -0700 (PDT)
Received: from m0045849.ppops.net (m0045849.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4544oIRo014506;
	Mon, 3 Jun 2024 21:52:43 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3yhsh5rfjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 21:52:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuvJ4/XBetMo30zN9zypNMZDQTfjz/KOuVVYR9DwWBl+YvNUG4gSUlm3MQAy2zDhxVp9rZDqgbJrL63E6EdHGiStgYRdaNv1DMDv+tWcTaa6j56bllVdtgL6Eqz0MR43a6OrFvaNGliXdx1r9GES6HkhIv8q5b/zToyIeqwdsgFNdmMMM/o9RZ8NCd2/hChKJUfBgbOhpW5UCJ5o9VXjoU0c9OmGX84Drpbr4Hq2OYYEygC+mrMP4f1LZN4uUGYbMY9PVDVUL3UErAH//LcBpw5fc7P47CS7PqXD/TvrNLcCpx7hg7Z6ln7ZMgia84U01yIp1CydTYiUJA7bh+UFAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bK37acq1OuuMB3TQAeXbWRjLvbYBhq0QJuwy3Mjp5bU=;
 b=g0su3oqrEba1YoKBP8Htic6fGBFZnTFhERDvRiHLYHOOMM7AXxA9Ge4riazZTQHbbLDB+EoJoMzT8nzu7YuBe82enrxJGXZOkGJ+3ZFqMMGrYfRkOllqXeCSvRnHs7Nmr4cMyQ1cOrqv/fnPUtgspi4JNr1xCq5LY9ky5dZAe75VKqYOATjeXMWRKVHOWk4EYZ+/0IJuYqi1tF0wxXwICLnnldhzh8kmoTPYN49b3DA2dKwgLXm1ZUFXGukD7xfkk6EPpMWhOTn0GpMI9/jfo5ds7jUhdzQ5TsamyCGe1+5z+vZDLRglQOyCHOM0bD8r5LeVV5e0QLUHVMylyCSdAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bK37acq1OuuMB3TQAeXbWRjLvbYBhq0QJuwy3Mjp5bU=;
 b=c39hrFb47lnG7Xqkr4OtYQx0yYJ3xvzNtgqr/TQofyYzMB+zkJOum/9U2Y7bFe2zbzA9zmba3GToqL4H9/GvEKZ5yAj4poiefPGmWsDjXdLpOsJ2SDLoGtNlSm5MehjLV44nj0TP/sOOgHnKbYkqNZ6oLfFTb9/xVhTb1IJ+AYw=
Received: from SJ0PR18MB4477.namprd18.prod.outlook.com (2603:10b6:a03:304::23)
 by LV8PR18MB6180.namprd18.prod.outlook.com (2603:10b6:408:266::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.26; Tue, 4 Jun
 2024 04:52:40 +0000
Received: from SJ0PR18MB4477.namprd18.prod.outlook.com
 ([fe80::7c90:e416:9ec6:583b]) by SJ0PR18MB4477.namprd18.prod.outlook.com
 ([fe80::7c90:e416:9ec6:583b%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 04:52:40 +0000
From: Satananda Burla <sburla@marvell.com>
To: Parav Pandit <parav@nvidia.com>,
        "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>,
        "mst@redhat.com" <mst@redhat.com>,
        "cohuck@redhat.com" <cohuck@redhat.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
        Shahaf Shuler
	<shahafs@nvidia.com>,
        "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
        "peter.hilber@opensynergy.com" <peter.hilber@opensynergy.com>,
        "jasowang@redhat.com" <jasowang@redhat.com>,
        "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>
Subject: RE: [EXTERNAL] [PATCH v10 07/13] admin: Add device resource objects
 admin commands
Thread-Topic: [EXTERNAL] [PATCH v10 07/13] admin: Add device resource objects
 admin commands
Thread-Index: AQHaq3q2FshspUNOLkCO6ZOTmkCqHbG2wvvggABVmwCAAANLkA==
Date: Tue, 4 Jun 2024 04:52:40 +0000
Message-ID: 
 <SJ0PR18MB447735575118111B35A11DEBC3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: <20240521122937.2004180-1-parav@nvidia.com>
 <20240521122937.2004180-8-parav@nvidia.com>
 <SJ0PR18MB44771AD893EA425C0A486692C3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
 <PH0PR12MB5481063D81836C1B063AB41ADCF82@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: 
 <PH0PR12MB5481063D81836C1B063AB41ADCF82@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|LV8PR18MB6180:EE_
x-ms-office365-filtering-correlation-id: 56497b61-4dc0-4094-d51e-08dc84522a01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|366007|1800799015|376005|7416005|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?3CjGE17BCioo9xvsUpNoSYl+6pLsrX+bgawdFDfAWNdZl2Xe7yda+IqhHf3g?=
 =?us-ascii?Q?uFZkh7zadRvAcTNJwghTPB248MT+3py9w0zmqWraXGrWpzq1Xj0i0TIoSPLg?=
 =?us-ascii?Q?e4qhFHGhKli4joeE3IRxPG2dy6zotdZ1KE4tHvkw4UoS3ilzLqXYUAVThjug?=
 =?us-ascii?Q?mNeZo8CYOvxBRWLsvNKwPiBj3Ep1IEopDU50bk1rmcjxiP3pY2fyGPjBqfJY?=
 =?us-ascii?Q?ztI3sntzXcDOYDv0r2LewAd4LvqD3XgyrwyDVxM6sEuApxahLKSD95PBxi7i?=
 =?us-ascii?Q?fi6N884cABgq62hPZFz+m61riThxDhGhOBMco6Gbh/DNiRb21F0LFGw+DDzd?=
 =?us-ascii?Q?NfO8l6fKg2IGqkjzLNLd97iDZt9ghDK81JO4lfb5Od5dr50sDlsEWULUCbaS?=
 =?us-ascii?Q?qwciV31iFMPiFYXsXF6w8BRPJFJBrpbUXYo5X/mrRwDjvNAaogbqQ/0c18l9?=
 =?us-ascii?Q?rDIOwfDQR0KGwFXddBsRfkQOCf8Jtz9peBoe84UPyNUsnwVg+FFUtdWE54Qa?=
 =?us-ascii?Q?CqWS3hjhifpbn6YH41HgI2KscuQl70PYu0x0su6T+2kV0fDh1d562JHWzYRL?=
 =?us-ascii?Q?QO5Qf08W87sn/aDuxqVKhovNbd9RScuN77JOvChmhhFKg/XqIKltwF2j6SG8?=
 =?us-ascii?Q?C+bpILG/gsbxsFfKCMTxZm6PdIdw9S7uR+pfsKhFqJ537ME/UUzyalCqMIns?=
 =?us-ascii?Q?qF6hfwI6+ipoA7n96yj6dIw4pt6mwmq3gUzuCgQGwMP1qHhTCgeqiq3ijG6+?=
 =?us-ascii?Q?zFwXhnaeHQ1jEVhucEKI2enz7PM5JkJHq65mmGXBK8GuU+enR6UkUurYUGMr?=
 =?us-ascii?Q?nMzhD0ZRRWwFPAOhTn20iv6REBQ7sSI9CsejzBafhW1sh39Hb6kBMX/wtG+q?=
 =?us-ascii?Q?xumTvObW4sigBiBmKBJrSvovEyBi/IP3J0Ck0xt9f22/9T6fjJJ6FfwgNnW1?=
 =?us-ascii?Q?8iweOeNeNQ+xGg1xEgTLknsWBpsS2/oq/Rgj71WV+/hynZqUgLy3OIpyBxzb?=
 =?us-ascii?Q?M3mcxOakvduFKZM93cogdSNBQ4scWTIucjjyjT6dr+K74/CGLkK4Jlz/RDhZ?=
 =?us-ascii?Q?BVc0Q/G1OmKrHUW5a8AgjgZ+g3DuOFd13CXb4bCy4lOitDP4PFkatqyyqTvf?=
 =?us-ascii?Q?nj2mXEQNWaphooqcnDLcJ2/Qy6ossB0ICmRZ2RZ2GN+TEsKVVhQyETdi57GP?=
 =?us-ascii?Q?V7pSyScu0o0pBQvm7Hl2/at3vwlXfQ+5QXDcqoYC+xIZYiBc2MIXzmU0XX1g?=
 =?us-ascii?Q?gn7LrphFggQD2XDiVwVlPzfUqEUwUP65UaBo49NHmZ0YWIZGUlTRCEdMhKlu?=
 =?us-ascii?Q?oP4eX1nU/+GVxcsx97mKORyRbXwjo+uKBSlReF0Nl1vvlA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(7416005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Ndp+eXr0VHSV644Omhs/Mcbx9gPRiWblRQWM601EctLz9atawZ5VoVeN1c96?=
 =?us-ascii?Q?ik+K4BXa/AhXCiVrDeJL+MpvccRFUmDg8jlpEDGcgT+2mTnm4cfoP6SMRSn/?=
 =?us-ascii?Q?Q81KJpE1Ibs3MWGO4wMT0hQq3sQgEMMpmRi+smHjdxeQOuKzG0rDNFdnJjl2?=
 =?us-ascii?Q?BgnvrPimPE/u1tF30qmV/UxbwWVU284/nD99Nzv0SOCo4zW+ylaFodxsieHE?=
 =?us-ascii?Q?/bU5HzjRB5Uy6UeJZLyTdAkkxjgJvD+DW6EWtaD6x9vgNK27a626qOPjNj/4?=
 =?us-ascii?Q?LwMbJKfZT+j+zo8axBWSEvRW/ryfgSWN48qLzxiS3TFwSMgKFMLFwKwyc3nG?=
 =?us-ascii?Q?KfDhkSfv2zTDMVG1uLpApd/ZFsjyRlkOO43+oqemNowLi1JKx/kqoWKyaVu7?=
 =?us-ascii?Q?aWsca2xLJ951qkHkuGTdrAuB7SBn8GdViqmRqY8x9IdeOinJ5FD9alsC9hA1?=
 =?us-ascii?Q?727XQf9krgtneTfNTEO8qkSK8gSDQgftRn5Iv7ZjiCw59A0GoEzFpR3lc9/N?=
 =?us-ascii?Q?7kxYF/gktp3U3o2CKJWlOmOIOzsljLHNbkxFbgPvslCRd4eFw5PW8SkUH5Iu?=
 =?us-ascii?Q?bQLXoyIAfaHYVXE2UmXC0FxmO7ifc4NTPK1Ld4NxA1ONP1jtASPU+a0loBtn?=
 =?us-ascii?Q?BocTWJf5STmt5ArYYZWNrxaqsT31ASCiX0j7YgXyAxmDy4Ox0wbS6fv2B9c3?=
 =?us-ascii?Q?Ykx0d5PR1A9YfamHbNF/vGHn1iqIFPrYSd+p35WQDzvse8X14zqW4uXA1SzA?=
 =?us-ascii?Q?qn9pxunOUxyC5hntIwTl0cLHk8H7k/ThW5TuhuKBKxWXlOhmShALkR0gsqRz?=
 =?us-ascii?Q?iVrLQAA6+N0cutUSuNgnVdun2qCY+dovu0iouq6CrVa39Y+FkHgGcQntKE4z?=
 =?us-ascii?Q?TJ4MsIFHdzioqbGHhgZO3BRWtF5EqL5yHNzsimzTr2ZiwmzKdnpOd0h4y2OI?=
 =?us-ascii?Q?Jg0QTREsLf2UXpcueVKo3dqH9dgX52Fi6O6ADSFXPYo4cvCxQ2WFMgGFlsdm?=
 =?us-ascii?Q?rte4YNM9wi2Tj355CR2xoAaAi8LvRKPePa3rjkSPQz0FtF/05mkQ3DXqLcbA?=
 =?us-ascii?Q?1X3LnMidx90iFH26bO2Z2Z2jHOn93xQH0+bzyVJDL8obQ36/ne7YG4By834G?=
 =?us-ascii?Q?Mo4A5yFQWFKm+fBfPcQj7Qt5qAUfLPQqpFQS7WZJ6hUwc9+ZXsAsVzsLgTnY?=
 =?us-ascii?Q?seukAWiRV5vqj48R5DgM6Dmr590NAje4YfROLnUm0J1dBCogtiTstgXxPZdC?=
 =?us-ascii?Q?U4k7ERPblfow3q7DdZKF2I5oOnAM97E6l63sE/bS84M6Hovy4a8ie98mO6G7?=
 =?us-ascii?Q?80kb7gZn4eDFbLqTYdmQvuNh1HMDeNpV+iOlkWYW23k/6ByvShVEwKdZsoUR?=
 =?us-ascii?Q?qE8xlDh/PUtjZQKlAljhnQh5Ti8WftX4//WzlPNcU8JExhT9LrkuZOK/LqeG?=
 =?us-ascii?Q?z1rnW2qeJM0E/UR2VX8CVflfG5SDrHkgz7IUJpcFGydvWmtYCxyhbzp6464k?=
 =?us-ascii?Q?SbZK5fsL4b5myefw4KVG7SB1JQEjumdWhouXSmUQDzAx9yVVAk0F9sBCekih?=
 =?us-ascii?Q?xybonza5g/qWfGSfXJA/fOw7PLIElcboOTO4FXuI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4477.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56497b61-4dc0-4094-d51e-08dc84522a01
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 04:52:40.6237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7QsUBF5g7SxXd6tDA5WXOv4SlvlO02CmcDi4yQpkMYfoNFOqwk1BI8qVYn0ui/qzIf4bJkbcN/yCd2wvXVtFKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR18MB6180
X-Proofpoint-ORIG-GUID: kU9w9BGPePdy5TK-IzdvlKi-wH8DFT2f
X-Proofpoint-GUID: vk3415wAItkKtPwOL5PR5twxWFr62aYB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01

> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>
> Sent: Monday, June 3, 2024 9:29 PM
> To: Satananda Burla <sburla@marvell.com>; virtio-
> comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com
> Cc: hengqi@linux.alibaba.com; Shahaf Shuler <shahafs@nvidia.com>; si-
> wei.liu@oracle.com; peter.hilber@opensynergy.com; jasowang@redhat.com;
> xuanzhuo@linux.alibaba.com
> Subject: RE: [EXTERNAL] [PATCH v10 07/13] admin: Add device resource
> objects admin commands
>=20
>=20
>=20
> > From: Satananda Burla <sburla@marvell.com>
> > Sent: Tuesday, June 4, 2024 5:41 AM
> >
> > Hi Parav
> > > -----Original Message-----
> > > From: Parav Pandit <parav@nvidia.com>
> > > Sent: Tuesday, May 21, 2024 5:30 AM
> > > To: virtio-comment@lists.linux.dev; mst@redhat.com;
> > cohuck@redhat.com
> > > Cc: hengqi@linux.alibaba.com; Satananda Burla <sburla@marvell.com>;
> > > shahafs@nvidia.com; si-wei.liu@oracle.com;
> > > peter.hilber@opensynergy.com; jasowang@redhat.com;
> > > xuanzhuo@linux.alibaba.com; Parav Pandit <parav@nvidia.com>
> > > Subject: [EXTERNAL] [PATCH v10 07/13] admin: Add device resource
> > > objects admin commands
> > >
> > .
> > .
> > > +\paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}
> > > +\label{par:Basic Facilities of a Virtio Device / Device groups /
> > > +Group
> > > administration commands / Device resource objects /
> > > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}
> > > +
> > > +This command creates the specified resource object of \field{type}
> > > identified by the
> > > +resource id \field{id}. The valid range of \field{id} is defined by
> > > +the device in the related device capability. The driver assigns the
> > > +unique
> > > \field{id}
> > > +for the resource for the specified \field{type}.
> > > +
> > Is the valid range defined by device capability or driver capability?
> The device indicates the limit in the capability.
> The driver uses the capability to set same limit or smaller limit.
>=20
> > What if the driver has set the resource object limit capability that
> is smaller
> > than the value published by device capability?
> >
> This is fine. It is allowed.
> It is captured in the theory of operation section of "device resource
> objects".
> Snippet here:
>=20
> "For each device object type, resource object limit is defined by field
> limit using Device and driver capabilities.
> Each resource object has a unique resource object ID - a driver-assigned
> number in the range of 0 to limit
> - 1, where the limit is the maximum number set by the driver for this
> resource object type."
If so, doesn't the valid range of the resource object id get reduced to
0 to limit - 1, where limit is the value set by the driver?
For instance, if the device has advertised 10 as the max number of resource=
 objects
for a given capability type.
Now if the driver has only set value 5 for the same capability type, it mea=
ns
the driver can only use 0 to 4 as the resource object id in subsequent crea=
te
commands and not 0 - 9. right ? So the valid of range of the field id is de=
termined=20
by driver and not device ?
>=20
> Combined this with below description from the theory of operation of the
> "device and driver capabilities",
> Snippet:
> "The driver sets each limit number field to a desired value that is
> smaller than or equal to the
> value the device presented".
>=20
> The device exposes maximum limit in device capability that driver cannot
> cross.
>=20
> > > +For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE,
> > \field{opcode}
> > > +is
> > > set to 0xa.
> > > +\field{group_member_id} is set to zero.
> > > +The \field{command_specific_data} is in the format \field{struct
> > > +virtio_admin_cmd_resource_obj_create_data}.
> > > +\field{resource_obj_specific_data} refers to the resource object
> > > specific data.
> > > +Each resource uses a different \field{resource_obj_specific_data}
> and
> > > is described
> > > +separately.
> > > +
> > > +\field{flags} is reserved for future extension for optional
> resource
> > > object attributes and
> > > +is set to 0. Each resource object uses a different value for
> > > +\field{flags} and it is described separately.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_admin_cmd_resource_obj_create_data {
> > > +        struct virtio_admin_cmd_resource_obj_cmd_hdr hdr;
> > > +        le64 flags;
> > > +        u8 resource_obj_specific_data[]; }; \end{lstlisting}
> > > +
> > > +When the command completes successfully, the resource object is
> > > +created
> > > by the
> > > +device and the device can immediately begin using it.
> > > +This command has no command specific result.
> > > +
> > > +\paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY}
> > > +\label{par:Basic Facilities of a Virtio Device / Device groups /
> > > +Group
> > > administration commands / Device resource objects /
> > > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY}
> > > +
> > > +This command modifies the attributes of an existing device resource
> > > object.
> > > +For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY,
> > \field{opcode}
> > > +is
> > > set to 0xb.
> > > +The \field{command_specific_data} is in the format \field{struct
> > > +virtio_admin_cmd_resource_modify_data}.
> > > +\field{group_member_id} is set to zero.
> > > +\field{id} identifies the resource object of type \field{type}
> whose
> > > attributes
> > > +to modify.
> > > +This command modifies the attributes supplied in
> > > \field{resource_obj_specific_data}.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_admin_cmd_resource_modify_data {
> > > +        struct virtio_admin_cmd_resource_obj_cmd_hdr hdr;
> > > +        le64 flags;
> > > +        u8 resource_obj_specific_data[]; }; \end{lstlisting}
> > > +
> > > +This command has no command specific result.
> > > +When the command completes successfully, attributes of the resource
> > > object is
> > > +set to the values supplied in \field{resource_obj_specific_data}.
> > > +
> > > +\paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY}
> > > +\label{par:Basic Facilities of a Virtio Device / Device groups /
> > > +Group
> > > administration commands / Device resource objects /
> > > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY}
> > > +
> > > +This command queries attributes of the existing resource object.
> > > +For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY,
> > \field{opcode}
> > > +is
> > > set to 0xc.
> > > +\field{group_member_id} is set to zero.
> > > +The \field{command_specific_data} is in the format \field{struct
> > > +virtio_admin_cmd_resource_obj_query_data}.
> > > +\field{id} identifies the existing resource object of type
> > > +\field{type}
> > > whose
> > > +attributes to query.
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_admin_cmd_resource_obj_query_data {
> > > +        struct virtio_admin_cmd_resource_obj_cmd_hdr hdr;
> > > +        le64 flags;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_admin_cmd_resource_obj_query_result {
> > > +        u8 resource_obj_specific_result[]; }; \end{lstlisting}
> > > +
> > > +\field{command_specific_result} is in the format
> > > +\field{virtio_admin_cmd_resource_obj_query_result}.
> > > +
> > > +When the command completes successfully, the attributes of the
> > > specified
> > > +resource object are are set in \field{resource_obj_specific_data}.
> > > +
> > > +\paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY}
> > > +\label{par:Basic Facilities of a Virtio Device / Device groups /
> > > +Group
> > > administration commands / Device resource objects /
> > > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY}
> > > +
> > > +This command destroys the previously created device resource
> object.
> > > +For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY,
> > \field{opcode}
> > > is set to 0xd.
> > > +The \field{command_specific_data} is in the format \field{struct
> > > +virtio_admin_cmd_resource_obj_cmd_hdr}.
> > > +\field{group_member_id} is set to zero.
> > > +\field{id} identifies the existing resource object of type
> > > \field{type}.
> > > +
> > > +This command destroys the specified resource object of \field{type}
> > > identified
> > > +by \field{id}, which is previously created using
> > > +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE command.
> > > +
> > > +This command has no command specific result.
> > > +When the command completes successfully, the resource object is
> > > destroyed from the device.
> > > +
> > > +\devicenormative{\paragraph}{Device resource objects}{Basic
> > > +Facilities
> > > of a Virtio Device / Device groups / Group administration commands /
> > > Device resource objects}
> > > +
> > > +The device SHOULD complete the command
> > > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
> > > +with \field{status} set to VIRTIO_ADMIN_STATUS_EEXIST if a resource
> > > object already exists
> > > +with supplied resource \field{id} for the specified \field{type}.
> > > +
> > > +The device SHOULD complete the commands
> > > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY,
> > > +VIRTIO_ADMIN_CMD_RESOURCE_QUERY and
> > > +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY with \field{status} set to
> > > +VIRTIO_ADMIN_STATUS_ENXIO if the specified resource object does not
> > > exist.
> > > +
> > > +The device SHOULD set \field{status} to VIRTIO_ADMIN_STATUS_ENOSPC
> > > +for
> > > the
> > > +command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE if the device fail
> > to
> > > create the
> > > +resource object.
> > > +
> > > +The device SHOULD complete the commands
> > > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY or
> > > +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY commands with
> > \field{status}
> > > +set
> > > to
> > > +VIRTIO_ADMIN_STATUS_EBUSY if other resource objects depend on the
> > > resource object
> > > +being modified or destroyed.
> > > +
> > > +The device MUST allow recreating the resource object using the
> > > +command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE which was
> > previously
> > > +destroyed using the command
> > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY
> > > respectively
> > > +without undergoing a device reset.
> > > +
> > > +The device SHOULD allow creating the resource object using the
> > > +command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE with any
> > resource id as
> > > +long as the resource object is not created.
> > > +
> > > +The device MAY fail the command
> > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
> > > even if the
> > > +resources within the device have not reached up to the
> > > \field{max_limit}
> > > +but the device MAY have reached an internal limit.
> > > +
> > > +When a capability represents a number of resource objects, the
> device
> > > SHOULD
> > > +allow creating as many resource objects as represented by the
> driver
> > > capability.
> > > +
> > > +The device MUST NOT have any side effects on the resource object
> when
> > > the command
> > > +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY fails.
> > > +
> > > +The device MUST complete the command
> > > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY
> > > +with \field{resource_obj_specific_data} which is matching the
> > > +\field{resource_obj_specific_data} of last
> > > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
> > > +or VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY command.
> > > +
> > > +On device reset, the device MUST destroy all the resource objects
> > > +which have been created.
> > > +
> > > +\drivernormative{\paragraph}{Device resource objects}{Basic
> > > +Facilities
> > > of a Virtio Device / Device groups / Group administration commands /
> > > Device resource objects}
> > > +
> > > +The driver MUST not create 2 resource objects using the command
> > > +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE of the same \field{type}
> > with
> > > +same \field{id} before destroying them.
> > Can this be simplified to
> > "The driver MUST not create a second resource object of the same type
> with
> > same id using command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
> > before destroying the previously created object" ?
> > The phrase "before destroying them" seems confusing. It suggests that
> 2
> > such objects could be destroyed though they are not allowed to be
> created.
>=20
> Yes, looks better.
> Will fix in v11.
Ack.

Regards
Satananda
