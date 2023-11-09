Return-Path: <virtio-comment-return-8283-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EEFC4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 06:27:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E75C745B3D
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 06:27:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CEBEB986CCF
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 06:27:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C25DA986CC0; Thu,  9 Nov 2023 06:27:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B47E1986CC1
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Nov 2023 06:27:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAcO+RxZC1I3Gu6UuNmLJy/D+DH3xQCwfu6hiUHDIgu7/tn8BFd9myo8uSKOF7vRDsgAYJ34KIz7Ddcf0+/tKeYHAdIMtVpID++BUx3XUi9skYNW7v8ockjs0g4DFi2IsCqGEf/6dfedgzF7LdZQEN8B3PnEQGD6+53Q6e7aHN9Ab1oSOgmSFI2psuwI+3A3j8Ei8jjZDzYgQRqeguvKGVaEb6pxMU55XNAo2XVI/ealJHskMrUabJxfWU0sYI4se8p4CUDordEzA5y0tA6BAg+gsS3Bz0D+vneo6UBX1nThA5eN5cwdIYO+2fitM9u8BD4O98KJMBMEBEWu/PdtTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCcnAvLUb8cmd+KuFLslCTAYPc2F8ZE6KugELjtzoK4=;
 b=la6ih46oauCpsd/iLniptSlhXN+ZfcRul7ddZgUtp12XL5cSmLYirjsbgcop2Rl4rMYaskPBZzqzXLuirSa6SFE9Jyg4Iw9thwz2Rw/v8Sz+MeILkYScWGG2F1cOi1qfLtDy9lZR3/OmOEcOamwWdCqz0q2Cb2CXn94edARJZroBRnPOD3l6Yzj1wU6yaTjcy5sHQ3JkDyz3Ra+YFQlmvrZKTuRoytI8+gDYS8R5d+/Ou9NfUJMoK0QUd5byrHedhFFV6cZkKvSJKWGE42XhJripk1k64g+dcuCn1dXzTP1V4GoXsC8Omr1h95g1liPW7HaNMtJBbXky8jZaVblDYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>, "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Thread-Topic: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands
Thread-Index: AQHaEfwUGl0o9tnLPEOcv64rj4RwurBwFAEAgAAIryCAAI3lAIAAxdiw
Date: Thu, 9 Nov 2023 06:27:31 +0000
Message-ID:
 <DM8PR12MB5480E61D051DD4E55316EEADDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
References:
 <DM8PR12MB54809F8316720CE5C1BCFF33DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtFyH_wJAqTz=jwosVM-=SRuO+wpT7NM=Eod8ExsxfTsg@mail.gmail.com>
 <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <20231107015412-mutt-send-email-mst@kernel.org>
 <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
 <20231108025854-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54819D42D98DB9BB95800947DCA8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231108120828-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231108120828-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|DM6PR12MB4580:EE_
x-ms-office365-filtering-correlation-id: 0e27b080-a232-4390-a304-08dbe0ecf465
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dWAotRVFG8Ifi2o9UgN/MvGf3nHnMyiKWZWvzsA7xjSceO4Cre0bqr975TCzj+7s59debcbf2O8D1vLi9LjsR9qENmlIaQjTJGP6+OP3QRzKPrIgU1Q9QGbu6I2nz+Y4KElLUGyVs2NPoZr3guKFh04eeLHkEJD1BdVlPY6UnZxM+vT9RQ4Xod8kb4Kd9Q/JfDNywJdgN9QGhQw4o9qGqTUsOWcYKyur8wEhxnvRq7VWakQz3ZhFAog4ULOst9fq3Hm/HHnPH1fLu/L14XUwVjZyqhKiz3UBMInkgc8pl908V8Ziqx9uJRXqjiBcvOrNvkW4WTjtLM4q3L9XCaHVgduJD40kCEYrfd3MOPuo55GFYXcivJU5WfvG3dILNZ2TjXzl2XhxS8CbYErspZKayNcGYXdGDoR5urpBe1IvLSfv3nfQ/9c0MssjAAl/lU1KNZrXtK1aqx/8tFYsEN9fWmV8IYsBkQbClgcyIebJYhCquhPu7fHa4Rz3fBZxIfgsjTgpknYozcqVYbrbNXb4md4sRSCS2jbvixqNhi9gEKXrR/nrFJp5UlSlQ+PQnli473p90BDsVQ5s9n5G0gIL2ENHfa55iLui7OATCXfiRnewIMTh/u8TQSwmH1ubAqfD
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(346002)(136003)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(55236004)(26005)(7696005)(83380400001)(41300700001)(8936002)(8676002)(6916009)(4326008)(52536014)(5660300002)(2906002)(316002)(9686003)(478600001)(76116006)(66946007)(66476007)(66556008)(66446008)(64756008)(86362001)(54906003)(6506007)(33656002)(38100700002)(122000001)(38070700009)(71200400001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?CcBradTDNLALa7Hkco4gOgXffo6DeWqHRY1PXDLPQW4eiy+RalffpBRW5PcF?=
 =?us-ascii?Q?acDtBzCbEu23nDlVwLl4gxPa2XSdVVKieA9EOfI0sf13rbcgxqMOjQNu1f61?=
 =?us-ascii?Q?M8N49ypRwQFMS53YNBLK37mnGzQ03iVRdiaFCndESJM1bK2t52Q3iUrMuplC?=
 =?us-ascii?Q?5DnFN7hgxvHSNQGjoqDTzM1g0RawmiqHxC604w22IUY5Nux4e3WaC5HDgW5y?=
 =?us-ascii?Q?14fSHkV5ftRKrrEiLpqcnfr275qjF0W4kJUnfvcex+8tnDAiqhSIJMg0PnOW?=
 =?us-ascii?Q?HsYKFGIo6/K3cFbkC8SoGYyG4ix6IqhliYRZsGcMFiZxK1lnRQF0OvM/lIdQ?=
 =?us-ascii?Q?Nop0oabhR9eBwT3tR7pLIuGNMbubPProA8bRcfAdroN5/6hk+AFpPPUaQUg8?=
 =?us-ascii?Q?2dYeIrAOg560/ZF72ydKOF4eO//50+5PnY05bSnLDbYvnc6Y2sAayQ8SO1kB?=
 =?us-ascii?Q?xofHgPHleOByle02B5TSoinD02GUH3I3qCPkU2GiTGq8RaZjVHLY1fe1MiHZ?=
 =?us-ascii?Q?pqVaaaKElyYUP8bHNfUAe0u4r2BqQcZNCNbbZTG9bOjlz2aCPyj5o7YYJfUY?=
 =?us-ascii?Q?WZ01sCinMikZJ+q0onwes9p6oAFzT1Y3XuxUmZPd4YcwknsRx54Xn7rTOzVy?=
 =?us-ascii?Q?gDn9NDZbKQv8ITdJSovvFgA7ruHqWv7eirAxPgsrchi0LxnV7c+F2WcUJYPA?=
 =?us-ascii?Q?ljVXnt1G9+cl5Vp4ZpTTNjDISInfuSsGiFakriuCg0W8FctPbEtkzs14xcaj?=
 =?us-ascii?Q?UrcDTc1VBbowKhFQwfEgms7dTQIx1disBSVPYPBSFpryaLi7A7ZjpSjl+O4m?=
 =?us-ascii?Q?PNMH4NCt+44+tMIq+lVDofPm0ZviJJt1P/0olb0i4miIm+CtimAADHRiwhH4?=
 =?us-ascii?Q?5+82MBlC3YRrjvmHzHnfoToGvwSYOp7nHOYkUJZ3rV1yk5wjVn4qUrG0nxWl?=
 =?us-ascii?Q?VmgQnPJPpGjMAcM/5XAHBCacOpdwbJwkmGvtqmY+tmQ0LupJGe3eqnoCY+Ll?=
 =?us-ascii?Q?JrL19X7VkC0CFj86zX/9o9etRLeLS06n0T4MuyZdTZSiDCNcD3KrKOpsI7ka?=
 =?us-ascii?Q?ZscohcOjvUUqjMO3ID+HJctZAI1Pxc+bW/yWm3foX0qsaplTY46JdXfhMW/l?=
 =?us-ascii?Q?npgObz6PcIudfDgkQHLNR5M6BtbNgXE7MuLSuUffJ/kLxhZK9lsyST4Nlc8C?=
 =?us-ascii?Q?fczOeFMVw1jvRoveQyaXNmcQL/0RdcEWTqWcn7lJvjdhF1xrPckVSYBF5f/Q?=
 =?us-ascii?Q?OrGV/MDdTkPMACwpdG8PQ6J+FJjQIPTWCUQcVJhtM3yvsLUNETF++Ij9m5nj?=
 =?us-ascii?Q?03uKayKsejeLPxu4Ra0kc9i9ubhbbfXXi00DDxNBqZPbWRbcpj3tOCayXsq5?=
 =?us-ascii?Q?audvBK3+X/IC7n0/HHHzJrzPrQSuZnEzECRGfmoutCBqQt/og+UI3jMGLq4r?=
 =?us-ascii?Q?m6dulwLXqTOff9LLmLaEY9fhnx89SmDfI7M1cRviImB6k6E8y7/nLJ2BXHwQ?=
 =?us-ascii?Q?DhiwbYCFk9PRirNJBJxT7o9EbA8u20cy903+oNkzsx2oEMnXn8pEepUftroA?=
 =?us-ascii?Q?C/ZOwnPw9zcxZbHTOuk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e27b080-a232-4390-a304-08dbe0ecf465
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 06:27:31.9667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E5I72EJRWpJj5LLnHrIs7dmxOGMtspBs4SRnXbjUZnADocdBE4wO3dAe/4hPrObPlQvkFmB064omyCK7tMzzgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4580
Subject: RE: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands


> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> open.org> On Behalf Of Michael S. Tsirkin
> Sent: Wednesday, November 8, 2023 10:46 PM
>=20
> On Wed, Nov 08, 2023 at 09:00:00AM +0000, Parav Pandit wrote:
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Wednesday, November 8, 2023 1:47 PM
> >
> > > Only for TX, and I'm pretty sure they had the foresight to test RX
> > > not just TX but let's confirm. Parav did you test both directions?
> > Rx is the main part to test for the dirty page tracking.
> > Tx only is around ring updates, so not very interesting test.
> >
> > When page tracking is started, there is impact on Rx as natural throttl=
e by
> slowing down rx packet rate.
>=20
> Wait a sec sounds kind of like what we see with SVQ as well?
>=20
> > And devices have implementation choice to covering the spectrum on amou=
nt
> of drop rate.
>=20
> What does this mean practically?
How to implement dirty page tracking is implementation specific detail.
So for example, what does extra things device does in its rx path to track =
pages, which data structures etc is used, depends on device implementation.
For example, practically, the device under test by us cannot do at 800Gbps =
in current generation, but possibly in future.

>=20
> > And has implementations evolve, it will improve as well.
>=20
> Maybe, or maybe not.
>=20
> > PRI for sure is out of question. Most workload won't use it at all give=
n other
> limitations of virtio on PCI front and existing PRI behaviors.
>=20
> Out of curiousity what do you refer to?
>=20
The whole scheme to notify page faults from device to iommu and serving the=
m back is not as efficient and scalable as the way cpu can page fault.

> > There is also a test with platform IOMMU dirty page tracking done as we=
ll but
> it is very early stage to comment in this forum.
>=20
> Interesting. That's a very important test I'd say - if platform based dir=
ty page
> tracking is just as good we can avoid adding it to virtio.
I agree. I don't see all platforms have it. There is ongoing work.
>=20
>=20
> And I'm rather confused at this point - I was under the impression you al=
ready
> have a prototype which shows negligeable performance impact with on devic=
e
> tracking.

Compared to no tracking by platform, vs device tracking, there is significa=
nt gain.
Compared to platform tracking and device tracking, hard to say.
Given all platforms may not have it, it is not very interesting from perf p=
oint of view.

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

