Return-Path: <virtio-comment-return-8390-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52955C47071
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 06:43:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A53661ADE4B
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 06:43:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 83F87986DDB
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 06:43:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6D2D9986DD1; Thu, 16 Nov 2023 06:43:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5D8BF986DD2
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 06:43:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrOxKO2ma0Z+ejJauZgQE9BMmPnDNHHlaRFNXiHT2sf5Oq5c3sNsKTl4XBzOqsCQPUG9mRVOAOo44r4Gx/LY5XqNjo0oowx6PhYHHv/rRpyVKzN4zU8inhgHT4pu8b3uBii8e1b0VHuORBlujejUHfKt2Rn0MZOgIfN+OEkpuWNp0wbXbgmZUsSCoYi+2PPq69rgQAzpOM459vnBeEGVOgkdO3JuBVUKNfYeB2+kH8NgmuSFWGN6ZT4onwgg0AgukFaUlsGoBEUJh7zJsA6R/3E0UjR28D5b4x9racm69Fee55FUAAm+Huw2cFH+tUYultz6Qs08mCMbnjl2gIkcew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbg6lvYmM8mOKxCE0ST4PRSzZGHlvjytR6p/bH68YGk=;
 b=Ymmw5Np0kI+b4SSdrB0f6MV2jYnEz1eSo9I/qfB2Mbr0aa1YyY+JAj9T8SVzLtg44qPMFKnY30fQ2IzzGj4+Iwp3mXOrLuIvwGKT69fERlos2c/UnX5jjQTebuYVQ4AG9E56qZwHj3D2M9rk6OHerHr2XRJHOyS/tk+rhXZGYNpWUEEcVTuUVmyietD4/YRZZQ5bykV/sT6QLkGSlgwJNJuuoO0pJkGA0EQyLwQ2ExETcmiHjV3Nl/O3MkOxYu3toAwUZfXpQDPZPBvpAbUaoTcVUfvWeh8RJupVwdU2RqSZTFijFmxKhl+fXaDF8skVDWIOOobOc5mPwjaZbGNBGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "Zhu, Lingshan"
	<lingshan.zhu@intel.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index:
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlCAAWk/gIAAN7kQgAF48YCAABlCkIAACTkAgAALvzCABizrAIAAD2aggAGUBACAAABcUIABWsEAgABcQLCAASo6AIAALsiAgAZSfICAAAYzAIABYc4AgAA+ffCAAULTgIAALVPAgAGlyQCAABp/kIAGUuiAgAAFiECAAWL9AIADJo4QgAY+aoCAA+XikIAA3lwAgAAHcaCAABr2AIAAAQ0QgAADOQCAAAA5AA==
Date: Thu, 16 Nov 2023 06:43:05 +0000
Message-ID:
 <PH0PR12MB5481D1A55E02DE4FB63E62BBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <CACGkMEsR56_C2b6-YQFpEOPt4sjJKyqcqrdhi9G0vU9ytezFLQ@mail.gmail.com>
 <PH0PR12MB54811373EA43BEDB4E159E0BDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMzp7DjDkQcO4RZ0H0HfxSrytUJrSyDj6gnPWV9cTZow@mail.gmail.com>
 <DM8PR12MB548085F25849CF1E055826E6DCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsfcEjue1UZmuNs8k65o3HSM94VsweSbWLH3383STR97A@mail.gmail.com>
 <PH0PR12MB548149E1E51DA9C1C094ABCADCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt277yYUHf98dCkypS-PXzu7JrRSVBAQ2cCRg4XzCLPzw@mail.gmail.com>
 <PH0PR12MB5481DB04DEB1A540185ED1ECDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116012208-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811F4CE5686AE4BEA826C1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116013650-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231116013650-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB7656:EE_
x-ms-office365-filtering-correlation-id: bff58ba5-aaae-4e73-aaa6-08dbe66f4971
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5E7Iy2EYfp+fU75t6GUNiItLht+6GflbTTJM83lBK+hwdf87jL6HY2JTC8jPsRVAFp1JoaPu+GrjU0Vs9Nx8f7VffhubzIBSsGsxzbzQCkaF+7p1rNhQ4c+k2rSbD2kP9Sn8mhHm/KfLvqUESTDVZKDkEz9+idbar8GQdLyWPbgJOwvMXN7zS7M2nBQpddyYib+EevCOdrR8d66F5gpcfBtcrYqnxZ5ScPb9mndLAvnJGsFab5nMBBI/UbG5stBG4pucsTAR8DQeXI2I81u9Qv4B47np2v3k3AwtqXSmfurSTk3TbyepDc4Jvmg8qyNyfI14/pYCI1vG7gggoMu4PEqVg8Ttsaf+Wxj/AfaAteBUG5xNF8gq85sRyCqV9WvCBhcY5EwjaU6AyqV1cotzEzR5FTnBmf4nvXUDZlnhFc6i4UTSk/IMIQKULWvTo7vDApzekKSgBVICQsQN8Q74y7a55rOELXoKXANVHztwX3Mkermpd5tYB/bnt403o00DNEezF61th+K5GxjfM5T49OteHgM0K4aVOugqEnqtspWIfPEpJC1shf2yeHExMQH1m3trfH7cG6RslZkvrdfaasLvwJmOvK4uZYAkoG+KgXzNJ6EC9yXQsrYTUFGCnpBq
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(376002)(39860400002)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(66946007)(76116006)(66476007)(41300700001)(6916009)(54906003)(64756008)(66446008)(316002)(66556008)(86362001)(5660300002)(2906002)(52536014)(4326008)(8676002)(8936002)(33656002)(122000001)(55016003)(83380400001)(38100700002)(38070700009)(71200400001)(478600001)(9686003)(107886003)(7696005)(6506007)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?i6/EZMaXRZre09CUu1A8VgbDe3ZX+9JIZhH6Lk+wMwu2PsStyazEmS92QgRo?=
 =?us-ascii?Q?RRoXOVM3rQ3/rhTAAMMj81OAZuGet/5heRctGm/6t1SjgeNrheQ8jQ5mQEi9?=
 =?us-ascii?Q?hG+hKFTZP/qRHvJid7/OSQo2Lu/g8uhcLiEMbbTT0L+ywV/M737Ui5z7zODI?=
 =?us-ascii?Q?iJsR8yPjEjdynjACyc3wN4OSl2q46Guk5rcie3YJa9XKfDYYZ5CsEsSW5nfA?=
 =?us-ascii?Q?AlUVOrnAx1hXEhJvwCUqn8Q2lcxT8WQ6tHdsYCXM7ieYQN73H9IGchV0OhgU?=
 =?us-ascii?Q?qdeBip/PZoWmN1gBLWsZw6FPcZy9nF7kmBkptoAPFHjSWZh01aETXTZmD5Gi?=
 =?us-ascii?Q?9adtgHVRn0X3yurnX61ZSd6sBv4+iSkBdcxa2avE/A5NSM3LVTegNbMqlMQ2?=
 =?us-ascii?Q?cc6ti8D/06Fp52HqPg3KnTRrMOia5JWrDfMJ7gZz2b0HNN0C6KOsMEOz/iTg?=
 =?us-ascii?Q?ccXH+rnuvN0UGstD08DMwZhWrq+qUFZt8pre6HHgcxkeJ3ZbpGuw0j4dImav?=
 =?us-ascii?Q?OESqxEZf9L97jgh9pWYu0tFdS/nW5WtrSIxntRkRvkqdYQrJ//D1MiFSGUiT?=
 =?us-ascii?Q?iMsRjT0/GgIPUmJiULjdHuEka8GjZDAtSDIo9NfO5mx7VUHafct68ImNDEXC?=
 =?us-ascii?Q?N7/cNBCbltHwjDdItnj0Ygaz/yzprKTCSx4YOJ0/DslpZh26fI1ztFXVcQVZ?=
 =?us-ascii?Q?V9ArrmdBehsNS8sWBTPStlEhjXxsFwM6C/rEA4VH0lpx+rP5mIcjOhIN9X2v?=
 =?us-ascii?Q?DUG3WAltLorHaKXvIbKu/YRDWYX/R98fprwsOYuHKwZ1Ka+nL/09Lci4VT3A?=
 =?us-ascii?Q?fe5qS7g6dYInlCtzuXCJUf2kKMFXGvjKe0Wwnl2XHFjjsoHEKJVOAfZO/WDS?=
 =?us-ascii?Q?eGFmaarz4lQ3J01Kk4QYO8Bkn8FG598KLw79R8klJ33Ec2lmqfaH3MUeb1rT?=
 =?us-ascii?Q?GuMI2SfqDxzL8BPQoNuBcYj7vjnmzQF7hgyB3jUILnQzUJk8QXT3RfUSQC4l?=
 =?us-ascii?Q?0j/CtG0pSv3kai6uzSDJJWUNg4ajU/3Yl67CDeVgAM/BmuToS10bNFonfTCH?=
 =?us-ascii?Q?ICpKEE+YcKlsHR5Qw6D6aDHFEIlZc2N/eS9/fV2YnNqLFGgrMWOqRMwPf3+h?=
 =?us-ascii?Q?gCLAlgChrB6o5YTdJMXfbGzOettnEsJs0heqaz0ygEUMnL6/gD2YKBSef24Z?=
 =?us-ascii?Q?XLiAX2Y9rSMEgsxYbh0VyUqrgx9Oi+O/xa8TIrFihuuma6JxYlXwxirN5rMH?=
 =?us-ascii?Q?Slah1KMwqWdbL6KIx9TjiKjBYu7MybvPvbGZFNgRkn3g9KY89mDvcrPX8xxE?=
 =?us-ascii?Q?Kf/m5fJGxMLgELqRa7og1yGsc+5uSCf9Yw3YAK36jlKedgFRcFlLyjCEWJq+?=
 =?us-ascii?Q?caAiI0wZIlmvzvroLbZ5CWZxEUqOnQbKecefvq+EUQQ1OkNxh1Ff3q+O9kRy?=
 =?us-ascii?Q?/GvDgRA5mqB4meWjXAKjHfx/2jS+w6fMdtcYEgqELG2CGqTRWyv+QnMtQ6oj?=
 =?us-ascii?Q?cEcOLKHGljmtyXrPxERgRuZlq97q8GyJImwyN35LnM/dAoK+snLAVTq2lncI?=
 =?us-ascii?Q?cMHAk0bdlYCJ4t1nXws=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bff58ba5-aaae-4e73-aaa6-08dbe66f4971
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 06:43:05.0561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ifCk8oZp8KAwS9eeiYBxzolJSYpGM2ntIg6HsXuV4J0tGJOUjlySYqD3Dn6ru7UU+w4WWDssq7qOPtgQrvVwqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7656
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, November 16, 2023 12:09 PM
>=20
> On Thu, Nov 16, 2023 at 06:34:23AM +0000, Parav Pandit wrote:
> >
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Thursday, November 16, 2023 11:53 AM
> > >
> > > On Thu, Nov 16, 2023 at 05:28:19AM +0000, Parav Pandit wrote:
> > > > You continue to want to overload admin commands for dual purpose,
> > > > does
> > > not make sense to me.
> > >
> > > dual -> as a transport and for migration? why can't they be used for
> > > this? I was really hoping to cover these two cases when I proposed th=
em.
> > For following reasons.
> >
> > 1. migration needs incremental reads of only changed context between
> > two reads
> >
> > 2. migration writes covers large part of the configurations not just vi=
rtio
> common config and device config.
> > Such as configuration occurred through the CVQ. All of these is not nee=
ded
> when done from guest directly via member's own CVQ.
> >
> > For backward compatible SIOV transport, one may need them to transport
> without above two properties.
> >
> > 3. None of this transport is needed for PFs, VFs and non-backward compa=
tible
> SIOVs.
> > Each device to have its own transport that is not intercepted by the hy=
pervisor
> and follow the equivalency principle uniformly for all 3 device types.
> >
>=20
> To clarify. Above seems to justify why the admin commands for migration m=
ust
> be distinct from admin commands for transport. But I don't see why (e.g. =
two
> sets of) admin commands can not be used for both. Do you?

I didn't follow, "used for both".
Can you please explain?
Both meaning,=20
a. for device migration and=20
b. for transporting configuration by owner device on behalf of member devic=
e?


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

