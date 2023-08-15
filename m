Return-Path: <virtio-comment-return-7120-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45350C001B0
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 06:09:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 98686370E8
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 06:09:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7093C9863A4
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 06:09:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5A48D984035; Tue, 15 Aug 2023 06:09:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4B06A98633F;
	Tue, 15 Aug 2023 06:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTbcEFUmZvpVkB18vevE6riMRdW/j9Irux1d9p9Fb1ldc+xnJNT0kNEcD7NGQXkHZqAJN1rhKPhQOHAFDmzgX62IHwsk6Ww528cj4rjWSNtYNe/rfDghuKjE8X2ZQ9K87m6aqVpBAFhw3PyiXk2akRGNjnE2r6NrIw45gZIo9kx8od6V08QGJOmFt3FoqstmZSG8YQdo1y8uETCXo6vF/TYRt6SWjiwRynHcPe1tcNfbvJuJuPQibY6wxSqyeLXH7TsVz4pf0gFoGyrdvPyeGS5BB8JUWF2BYR8j5Qv645VreMXgrMyrlhnbZoc//3zu+uly2TmwdYHuWlI6WmvNoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2AyuoxIrQNZi7VpBYAXNyPRfPbYIqTHgpmx1CKk4ABQ=;
 b=d+L4cwsLrxE/OOoNmOYjw6hmmpn+0JHU4MNh5VnrymYaSBdZGd3inOjDkZ5IS4jwqdM98NzEd4SfW3L56xTN8HH9g0WOOV6Upd6LiHYWkXtUAKT8DB1FI6VWmSrrib/Viu5sXAAj17FWDz6ZsQ/1yXSSJ4TWnMpem+PWviqvIAmXpbU9Gomc98bVaJlibeogX28aK+9/EQsI6i7IGgMCxqgO+onnxmHjVVPsBstTTJE5rZTefWW2QMozUVSYdShT4gLqg6KfvRPwcHQ18LNGXuk/Ry8JJzzVN2prBix7HkkZABaeuKFXpPIHx7AccrO42absoP4KEvTyWQUU6NpxCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: RE: RE: [virtio] [PATCH requirements 6/7] net-features: Add
 packet timestamp requirements
Thread-Index:
 AQHZvd/P0UZ+85qNOEywdrF+BteiUK/hvTGAgAgmroCAAOYDgIAAE/6ggAAiIgCAAAGvoA==
Date: Tue, 15 Aug 2023 06:09:48 +0000
Message-ID:
 <PH0PR12MB5481CCF26EBDEE0507FA9F8CDC14A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-7-parav@nvidia.com>
 <1691570137.0487022-1-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB548163BBE78CF4E43EF6806FDC17A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1692067643.3169255-1-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB54812C5D39E6E22F07FC4874DC14A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1692079266.3918643-5-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1692079266.3918643-5-xuanzhuo@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB7697:EE_
x-ms-office365-filtering-correlation-id: d0afe2c0-75f0-407b-9794-08db9d563b45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /qu4XW67qCYgzyHv8qhkeIqnjWda+TUIEPwtkeWabwpcyOZlgFIuwrdXeqXIjJwAOkiuZfwK99Hrc/ch6yA5r+R2b2tdTebB9TmGmhn0sywotmkyNLCTkBDtitknCO2Ku8qVw+M80fvwNfvyF5aLtH2WtxkWHslR7s3vVYtyGv9FwWAD37Ur7Bsc6K6NdND7sAaZpuLDUpf3kZ20jkV/QXWcoDiAfy2ImwOL/KSjDoGryWI00vXqaw0yJugSNLB3MNGX3FPiQ/xQa8y5XTzXcGAlHlyFRch1gxlVh0I8PaZShrwQ1y5uU0czCVdmq92C73T7RMoBYCIkAqR1tNDhKn8sLtvTnyfCKeYmNPJUncEXAMh/v/5oqhCsoFNNPhj05jdpcnvF8wdyAf9Ar1bRn2bAplnu9JLoJNlpxtdmNxf9dFZq5NNWq14U62xLxammlhe6Lnep399SH/IJk6pMUG0njq71xhdxENjajjLmyKm3G0Aq8bS2qjOP7I7jowGLFOaIQe+BctpiBJ2lc+fQDUntQ42okrAwBjPaI1XeDw+5QPrl4dJAWLAYzgWA3M/GT8rvYiHmDDYhYGdgNUMtIUhk/ZFJTTA5vX59DtcJcvXFR4C8zXdFYra/5jTErxst
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(376002)(366004)(136003)(396003)(186006)(1800799006)(451199021)(33656002)(83380400001)(86362001)(55016003)(41300700001)(478600001)(38070700005)(66946007)(66476007)(54906003)(76116006)(64756008)(6916009)(66556008)(122000001)(9686003)(316002)(8676002)(66446008)(52536014)(5660300002)(4326008)(8936002)(38100700002)(7696005)(2906002)(6506007)(4744005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YgcR99CCUG8ljusiaIDaQeru4x4PZWbSo78liQJyDs0X7CSDAtZjBAabEkTe?=
 =?us-ascii?Q?amBuVsjw5f3OARNmE7wUpCmZNigrnH1VtRW3C2lBzdn5KnvvfSL66XA0Ayab?=
 =?us-ascii?Q?xd56dAtWV+PM4AF4bw49vpbCgEQru1UR9dUkCbmU6cp406FUgfYvOjHHo1Qq?=
 =?us-ascii?Q?eNVZVn1vgQlO3u49xocuzehla6/FXywKUepdlYZr8DtK2q1/StAqKS6LGT9+?=
 =?us-ascii?Q?FW07TtgM9uJ8uEp7f+ka8GY6SfWmT/0h4f2KTySnlyd/Ao1cXEBJAM/+M1oe?=
 =?us-ascii?Q?Rrw8KK3JPySmzJPml/ONZj/FpyosHnsfhqknMlOe1grBO7+Vex2d/h32Ia+D?=
 =?us-ascii?Q?yYZ7HtgZJBMI4R/7RGqb7ubpr/Dlwxr2uRluJSYXgS7PDrpZIVX1MkcRNXkL?=
 =?us-ascii?Q?b7c+NwfklWro4eEIP4Aktwi85mUBOSVHYLpgUN2N+DWLl28IC3YtB5CIlmaO?=
 =?us-ascii?Q?kcTF/ZaNT86vo4b0kxtqAmnqCHj6+Ow33os+M1vNUid+Yp8sewN8pU6K7yCW?=
 =?us-ascii?Q?8yDE/9wgTzCm+ghFVHgiZLKHsctC3Ed0ibU1dms9m7TF95r9PreVV0KHw0fS?=
 =?us-ascii?Q?3TacVdlGsCibr664EM2q5klc91nb7X5fXKBS83XbVeGsH5c++tMzx26oTuAm?=
 =?us-ascii?Q?DUoW+wQ/TvH0gUOaH2uecImRiE8dWRhWp0tJ0iEzk3rdTgRXkGeGE9+yXrGb?=
 =?us-ascii?Q?NqNt3LGPTTzul7hQHFJXvnEQYXlEKxKXE3/DXSBX92XxgOg+lhN/Ny/wBL+4?=
 =?us-ascii?Q?SYK5xS7HJxnOGNp+90J21aSJERKN8s2fGii73QtzQeB+iuHmed0fAaPG4nPF?=
 =?us-ascii?Q?eeK+ZUnIhdtyCOCdn29mW5hKASkQhX9ZdONz98w7TF4lrQvOerRkARSo0s+h?=
 =?us-ascii?Q?hJ/4dkeKosKWVEIWn5/z9G+aAC2ExiZpM1cwlhfrGou4WXYfsnsd0knWK3Kb?=
 =?us-ascii?Q?txiw1OYPxZGl+gFmYZ81BdMs5Gs9lppuxlb3ruZaFq2WA5xOoIN7KeHXVCFi?=
 =?us-ascii?Q?AwV5RXwIe5ntAbVAkVAe3dUec0tI8TVW41BfNIvceCAYC4pc+ihZpyI5y1SR?=
 =?us-ascii?Q?wymBdqBoOTJO7fd0mLdSkR133JysIJ8Xz3QPbWE1HvH/rvY0NAewmYiidjVa?=
 =?us-ascii?Q?kodf3EHC3UhlOIr5PLwdlpR6UeMANx+ik58sJA5RgwA6flkjhDLfZ9C6ax9n?=
 =?us-ascii?Q?YR6IM5lQGvK/fR8AIHBkdT81S7LDOd35ONwaTT/MkW+IfMoRyQo/QKSh4qHE?=
 =?us-ascii?Q?w4znU3XbxOKj9Er7AyHs1ehCSLH5Y2kDXW5XbisSa2xYWTtwlwV0UrF8yHhQ?=
 =?us-ascii?Q?pofLd9vuJ3hKjJ6xXtEE5V5raACvPgZdqEuFUb4KgkWVNdPR6Z51RV2k9dXt?=
 =?us-ascii?Q?3iQRrAigcCKsx1cLlUzxoNhR59upxF5albFiPRDKV7E+g1ZV4aXcnxgiZylP?=
 =?us-ascii?Q?L+evidE64jrMPmGoHjyxABZ77hrBCav1y/6NJp69BIWrDO8jzrss5tmc7oae?=
 =?us-ascii?Q?Hl6pVtYwoxQ1o/P+IqU2DkQsLJXFURLDAb3TuHhsC8ipCD/HJNH3lkOlA2Sv?=
 =?us-ascii?Q?GZ+xdv032N+3nXSUkAITCazR98crYx3sD7gWBv6L+jmh2O7L7Tzm8LXtsLlQ?=
 =?us-ascii?Q?BYYCMu1AtmmlCkjgZ+7i+ps=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0afe2c0-75f0-407b-9794-08db9d563b45
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 06:09:48.9671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BAueuFZ8HoI3esTZ8tgMubZSRZMN3IJWGORsIrwyhCm20AGQouMpzrlrisnMyywGJVUVgleo4hvHDN/i7a8hUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7697
Subject: [virtio-comment] RE: RE: RE: [virtio] [PATCH requirements 6/7] net-features: Add
 packet timestamp requirements

> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Sent: Tuesday, August 15, 2023 11:31 AM

> > Can you please explain what is a "existing machine"?
> > This is the change in driver device interface.
> > So one needs new driver and device extension anyway.
>=20
>=20
> The devices that are running now.
>=20
>=20
> If the change for timestamp is small, then that will be easy for these de=
vices to
> update.
>=20
> But the timestamp is so usefull, we want introduce this feature to these =
devices.
>=20
So lets work towards getting the new descriptors more quickly and prioritiz=
e it.

> I see your new description, for the existing devices, that will be high r=
isk to
> update. And the new description maybe not be needed for they.

Lets mitigate the risk by working towards making the new descriptors that s=
olves multiple problems.
Otherwise its all double work for all the layers from spec, device, driver =
and more.

I agree that I got slowed down in last 1.5 months due to personal issues, b=
ut I am better now to speed up the new format.

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

