Return-Path: <virtio-comment-return-7138-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE90DC0015E
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 09:11:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 35082613CB
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 09:11:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1012698638E
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 09:11:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EEED6984035; Tue, 15 Aug 2023 09:11:22 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DEB3398633F;
	Tue, 15 Aug 2023 09:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+J4nKiGn6oFdZguZKaqKp/kBCxbDnwnhjUxuqbxZN+IUcy5boNn25Aed9kk5JLFv0bk3bSY8Je5EbHMr5sBIgt2Nz80fls2vDpKh79c4e3qDTYxW05MBtIdPXry3JkeBdk00lsKu6d25H2mc1RUMdkdqi/qAgnRuIDel2ZryqDuXixMzbUdC5sTLdbFnS0NM9PMEbZDHnfIxEtHhEaQYh7BjVbbn7V++2NpxPdpuKr4breT7z6p5hlUT7H9fVZxf/1QAoiKxtX8Q2OVRWA0xJiu/W9dMzEyQVkmZKQAJcH5CUp76kMudAlfVQogS1yt5tTb4M0QDn68cRkuzogZ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0h1Z7LpI+6dI1aARLPB3x1iWWB/OH77VJkT0Q3DMBsM=;
 b=ED4BLYmiqq7szpEVwJQdXtjNe1+Fkjs4IVuMx0SfYBzUm77VLxsvPFkYxQ5RVlmvSJkxEFsIbnxHdrgFCxFL9ibZoK0yGlEH+brItAXTft72/qNuV/nrRfvzG7F/H+s/NxdAk7QhsQMKMI48c93XV7tOz5w7ik8kfRCm2STqBmrqZagU4yDvUJvIQCV0s15sqgWwKhI5Bovd3Ql6NpbueRQdLxU3QGkLQOMf82mA/wsCX4cRj0SS6TJlc6fyvQUOJuKKDuk8aPKxRkwI0e6IVK5QzKKyCyvl6OvulRzsUvQzP7b+a78rvFM0PW8PeriN2vImi3DJwR7Z7K/7LtZmtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: David Edmondson <david.edmondson@oracle.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [PATCH requirements v4 1/7] net-features: Add
 requirements document for release 1.4
Thread-Index: AQHZz0yYa9FZQ1mufk6JJ+9Y+UBTl6/rDhuAgAACr1A=
Date: Tue, 15 Aug 2023 09:11:18 +0000
Message-ID:
 <PH0PR12MB54817DE0F0C993C548982279DC14A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230815074600.473933-1-parav@nvidia.com>
 <20230815074600.473933-2-parav@nvidia.com> <m2pm3o65rb.fsf@oracle.com>
In-Reply-To: <m2pm3o65rb.fsf@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CO6PR12MB5428:EE_
x-ms-office365-filtering-correlation-id: 44f6b379-90ae-4503-14ad-08db9d6f9622
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 MWnn3G1KsKvSIVWqCzQOKzkosZgOsprAxAPIemVWC59ZlPX+QTI0kEkbpIqeg80UItk2YHrG5XnlXBr6SdNgHxXnEg8MKOQp3+GGr4etq2Ms9eSy1gCiiazAE8iU1EjQglK6aXGHKdhizFmQo+hjY6QnjZkHhT7TvE+xCDWXpyP/D6u5q/cJt+k29CZYfHjWWl9E5WOa3lcVdZlGGLkkmbiEIicBfBe8TqyH0qmN1aisYeHHZlcGebDy0T1g8rvfOkT0hwRT7PHgGW8JXAfGLww8DsepWgIqLcOMvHwR/0gjR3KXPtVzcDkWqu5ZqA7Lzj0J2rAYWVWvV2j8MXtMTF3o6IHCk2e1jl6o48BlEoRYFVzF6ewaaHcO00pBx3cq0fMrj87p+XGBDJa86ZA6/Cst04fKPvHL9Q9rMOJlXaku575+DQg30xjUqki0b85cC+IosHCeXULpHtyvc2rdKK9XVqpB6txDmYzYsTKqd79uOWj4YKvLowRPcrEYUJsNQnAfkHaa28AkhKDiADA/rPhB3ce1nUo+zziiI+scj9rYbwrxz63g58nJIL5JdluV9lKd48R3QMCHojFGtY1V6KEidD+fcvbRroqzdQ5rOwnrkrcM6E+hK+83J6tcUb/n
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199021)(1800799006)(186006)(55016003)(38100700002)(54906003)(7696005)(71200400001)(478600001)(122000001)(52536014)(38070700005)(2906002)(5660300002)(86362001)(33656002)(4326008)(6916009)(64756008)(66446008)(66476007)(66556008)(76116006)(66946007)(41300700001)(8676002)(8936002)(316002)(6506007)(83380400001)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pC9SRyR6JzYNZORYslrwwcttfbfLWTzWsHaTyVZXG8RErQ7LyU0OpSeoyokE?=
 =?us-ascii?Q?GORW8VuJ547ymsy/i8ZKVtFsXAw+Cy4dtNk0AV3PgHb5/KX0tNnhKVp7MDD4?=
 =?us-ascii?Q?Gh99AGJl1GmhNadTEihzn+aDX0mC5rrr7q6dc/PHj+KTX1cun9GLSQp8FGN7?=
 =?us-ascii?Q?ejBG6tioJ2TQsMMKHNe1XwTVtcvKSbPaSX+5EXNCOCp7cd3zn529YCpi+ehI?=
 =?us-ascii?Q?KYBA0etucbpBxR97iFwNanF9KEOTub9cgFexE/VBd3hcQ8vP3hvipXL97B3I?=
 =?us-ascii?Q?HnduXbaZBXeFU//uiYQbF4MOdcdd+1u7XvGG1N5XS1yLyYzfMavjR8geaJRw?=
 =?us-ascii?Q?dbi+Ci0aPiSrz1rxiVsCTkkj97iGMxItAOuE2EHimxCy5c3tmtcAyTNx4gqf?=
 =?us-ascii?Q?msWanUALW9G6eTM8eDkIDGSaN/6W8OE726s8eLK8H6MFTzeesAU/7YpnwWsO?=
 =?us-ascii?Q?Jij+hvsuZITf1IXLfMMJJeaK5y18qD1063L8vkvPWea+P3/rkRL+lvrCI860?=
 =?us-ascii?Q?gNCmsgeNg5tff447WsX88OO4ml9n5ozJKxhTao+Z5txqaFTFXFuF19Yd+F/V?=
 =?us-ascii?Q?Ah+UyvKxcpRiC9HIWT8t4nJDG3dnUAeSzhjkEKAbvWYyOxqiomIW+mJZ1qoE?=
 =?us-ascii?Q?ITpN9SppOEjPFOGVhzCMWee3AsdHEPF2QvX/knNovOKeOLL+MzpGV/ZKn/mZ?=
 =?us-ascii?Q?OGwGb/oPBeU0RRuJ+hKkXwihyHmLotvV1T6lI7hdu3o/xJuulp4TWWoONCTL?=
 =?us-ascii?Q?VTygs7GthikDsKhL2MRXnme3H8i5PskFdn83ALoDzXyh5ZRTIoGonMk0k/Ke?=
 =?us-ascii?Q?nENCfS74aTTBH2nYVaEZ+FOSIRystPSQkfFnG5/6DHW39AFqkAegNi8ZP/a1?=
 =?us-ascii?Q?qoT+lB+B3452qqBkYwkC4BjBozNxlHV3jQDr9+DoN14LLD5oSkmU1Rb4tjii?=
 =?us-ascii?Q?cNUTOsm3xeCFL3awS1KjZxqcMzwW1tgnIEKBmrRyibjugghvL7WHcTIbsDle?=
 =?us-ascii?Q?Ad5vuNh8TGtZr1K2mSPNlGCKiKzQeGsJd5NGdQ+xSpURs1U1xOngwLd/0/xa?=
 =?us-ascii?Q?qpjx3XnojeWcDELbfXGD8Ds6aBXNtzf5JbblKwgFbnqBjbkPUNLrOIAmZpqH?=
 =?us-ascii?Q?7pmajZzJWOexJEjEAkPKuak4okhQHRC8lSNbRMIQ9iz3+yH0WGvDE6g7v4nI?=
 =?us-ascii?Q?ArUoMID9qhO76Zp6El5xEcUOu2INaHQd7L1OWw2kMyqJFRVvUu/QziqYj1B8?=
 =?us-ascii?Q?INMJAkG5d5qZru9fxSOv87LjcvFjSWeAt/pOsNIkzalhpO0NM7TqyEE9uF28?=
 =?us-ascii?Q?3OKveDIkw5Dw5ezxee8OnMs1RaFHuTznNAfBMdIxARXGhjq0ktViJdwq6oJ9?=
 =?us-ascii?Q?F5KPJQY25rYZr+4QrtBqMRlP99xyEqS1SUzONl5Nar/Pb7WcOk1tbLUOrfmx?=
 =?us-ascii?Q?TIlhbLX9mkcAzcGiHIJNY7Q7FAcGE4bVBUsXfnGBweogbz6GOIbgGmcj7LHn?=
 =?us-ascii?Q?smtX5Ak1MLcgbHch+yjV8zbIGy+iUwBtx7fqHR3Fa4qdHPRbENpgcZEisxBW?=
 =?us-ascii?Q?c1mSWuqLFE4AlNVjZRtjfWotPpf7pM4h1aTf3pE6t/HOf5RrO2hKbnr8bMwD?=
 =?us-ascii?Q?tD3DXSjQt7TwMI5yFaP27js=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f6b379-90ae-4503-14ad-08db9d6f9622
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 09:11:18.8558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OyfLGPBdwZTlHjGx8/sDLulDfy/hKPCEfRCP2SbRDD0HBiJ90BKTtxJc6EL8jAUfA2vzb3ttpLDUSWxAQU66RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5428
Subject: RE: [virtio-comment] [PATCH requirements v4 1/7] net-features: Add
 requirements document for release 1.4


> From: David Edmondson <david.edmondson@oracle.com>
> Sent: Tuesday, August 15, 2023 2:26 PM


> > +4. If a virtio device is group member device, a group owner should be =
able
> > +   to query all the counter attributes using the administration comman=
d
> which
> > +   a virtio member device will expose via a virtqueue to the driver.
>=20
> The language seems confusing here. How about:
>=20
> If a virtio device is a group member device, it must be possible to query=
 all of
> the group member counter attributes via the group owner device.
>=20
> > +4. If a virtio device is a group member device, a group owner should b=
e able
> > +   to query all of the member device counter attributes and counters v=
ia the
> > +   group owner device.
>=20
> Similarly:
>=20
> If a virtio device is a group member device, it must be possible to query=
 all of
> the group member counters via the group owner device.
>=20
I messed up this point 4 while addressing your comments from v3.

How about,

If a virtio device is a group member device, it must be possible to query s=
upported counters bitmap through the group owner device.
The group owner driver should be able to query such bitmap using administra=
tion command.

Notice that group owner only cares for the supported bitmap, no need to que=
ry the counters through this interface.

With this we can reuse single structure across AQ and CVQ to learn about su=
pported bitmap in v14 patch from Xuan.


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

