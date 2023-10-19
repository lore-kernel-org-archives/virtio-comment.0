Return-Path: <virtio-comment-return-7869-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6446ECDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 13:57:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8DA1B1318C9
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 13:57:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5D1EC9868F7
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 13:57:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 41FA89868ED; Thu, 19 Oct 2023 13:57:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 324F49868EE
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 13:57:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGD3quE3KQ8+diaEkEktQa98c92Gac8BOwxNhiuorER3K5csxYCC1n86J5QLFoi95+QxLlC+EeUvP2+ShduRQJWQsdIzOMnDXyeViUqV4NWYIf4URWHX27w2MDOSW7Nr1xwPkruD34ZcL5uAZmEz1WwqVRp9agioKNzcRM/z5p6l+BpKJqZJc7bGZESdpla6rmLTKWcsBk1Zv0cU/D8sSUuuM0K1BjzxGXRKiyTvbLLPsqhfdE1zJWVYbydviM6XRNQ7vZfVav9VN4tDBAkft9HtgRfM0BtZ/L+eR1jQlz3uSeSLl7do+3mnBBu8OJibT3r8DifmWTJGC3ki4gRASQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1j+2h6wyyViDrna5V7utLwSO+vXaScCoWoYz+2tbMg=;
 b=CjIxDc1SeUPxnoU8kA3cQe7eX3qIC5MU0bQu/fBkVhtTXt0E9fy0d7/Wlo8VXCkNuvxzyQ3e6DKXy5fuXGVcrZSJV8PJIsdfR+zjVgoixKzQbjtRk6mQlKUwwohf0iscYCV3MOfTUr66nSv5EMEsva8FochVRzO9ViuLNwjyt0eH8ixEHpKP/SdyvkeB58LRv4wKabHub37qxPXvPVt+A2O0xsDb3OY1GwZ4veG/FPKw9KE6Q6XBGHZZ/Ye+r8yVYPZWeBitzsNl2yRNlaEj4Ta0ejUUNi9ago71SRGNqhGdQ7I+c23Boyup/27oHVLqa3tZJRIpdqQPk5AU9Dw2iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, Shahaf Shuler <shahafs@nvidia.com>
Thread-Topic: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage
Thread-Index:
 AQHZ9O+eNF50SoOX0EKV5RZKM+E/zrBOABmAgAAC7YCAAW3ogIAAANSAgAAJ84CAAAB/0IABwd9w
Date: Thu, 19 Oct 2023 13:57:15 +0000
Message-ID:
 <PH0PR12MB548188345E2CF3B8AA5E2DEDDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231002051601.6626-1-parav@nvidia.com>
 <20231002051601.6626-3-parav@nvidia.com> <871qdte8r6.fsf@redhat.com>
 <PH0PR12MB54812DF4DB53917D4895FFCADCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87sf68cjn0.fsf@redhat.com> <20231018062704-mutt-send-email-mst@kernel.org>
 <87pm1cchuq.fsf@redhat.com>
 <PH0PR12MB5481DB9D38E58522F0B15EEFDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB5481DB9D38E58522F0B15EEFDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA1PR12MB6680:EE_
x-ms-office365-filtering-correlation-id: 4a610470-c1bc-4c9a-6044-08dbd0ab4d25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Hj2TzF/dfNqMhKcr8LWiHd+VDW2YdO7fjL03WnoAlPJ7N5eGFyUrkywy1w2AXYaKALxwOpYwvWH9mCSvHWt0G6hkavDhK57/2mSpEmxbPeHQW42RTwn+qr9irvQxMlxpq3508vHH+PfljWZkblnf4+NSHAn4UTcZawawYKo0w5ZAaAz29iO0pKw1QZOj+SErgQnASTEQozNeCHBjIT0r10PaVnc/a6ytume7RsheLM2ewJWQ6XbM6mdRN6c9M2qTQv787OED+hNrI3s48MZlHRQFC8+53hPwEVMkpKi4H5gbTTDHzeCJgVzaYw8qwxroAqz0P04RQ0LxNwvBsjjwEpXznF4G3xjS1eD1ZAsD3VpRsVY+IHfGL1Kwyk+jsUZ6HMLZaNVkV0PpMqstos6jhoz52dQrJuCf0M2OlQZoWzOrWTdY7DRQM7ROT+ZDMGuk6d9fiWN9Mj3Mg0JecDR6+4Fl0LvuHzyAoCQtNOsnV+xFSSny2ALTJ+Nm1PnrDPxP46ExX/W+YUFG179YF4VLYn+fMuOqytO8ITn3QfodgzvcP/dwlLqFjedXSLZDzR54yzOcA2thJty4pGT/OYHCWOhv2sMfe/iNj+VFNZ9iBYPYtQZjaJkZA7n5VMWSAlVwDYZ8MvocAogZW/evpJlZvrAuLCkcy5lnpjsdGmu6SvA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(396003)(366004)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(71200400001)(66946007)(41300700001)(316002)(76116006)(66476007)(966005)(110136005)(54906003)(66556008)(2906002)(52536014)(478600001)(4326008)(8936002)(122000001)(8676002)(66446008)(5660300002)(86362001)(64756008)(38070700005)(7696005)(33656002)(55236004)(6506007)(38100700002)(55016003)(9686003)(26005)(107886003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uk28n5OLN+O0mDfAADTRij4gfWDCjj8L49CcAiJkVE3RlfOjyvQflmswh/+b?=
 =?us-ascii?Q?DZW5p4tDrtANLD+wiY60nCU4D2VlAosgVW6q7xleqfF44sB1wrQaXwp36l/X?=
 =?us-ascii?Q?xZvIWOm5uYGLmetDl0yJsRzYCo0ZYrBtMwrFGbj4pp6lGpS6ygu9BPGevUiK?=
 =?us-ascii?Q?fGltwV/bDmG3JEoqG7VRcBVxKxoHEEFrlsrmbTs0pDVNXLGHqWHisA59kacj?=
 =?us-ascii?Q?4N7wNwTL05U0Lt+jn8yAbgZdCmyQfkstF1zul3l2ZayOGzE4VPgr/Ehc8FhC?=
 =?us-ascii?Q?wl15FtnDm+hbw98YP0e9kUhILWrSBGZ+/TuregH+8NNwcm95u2ga1K+pT+tO?=
 =?us-ascii?Q?1gvNbWC/BFAvI9Up7rT4gQHmhe4Pe9HNvArskz8XqJQVfJA6xZbI8fxa0m9S?=
 =?us-ascii?Q?ujNxrsqnMvhqsX7LuqgZkKYdH3jGse2s4rpgrl+Arjqz1E/6yAEyMZXGMLJb?=
 =?us-ascii?Q?vIg33lba/ksUNRuOtFpl96bgfWEms+70g1R9AmRgb959tIlCr/NWmXj6zXK2?=
 =?us-ascii?Q?mMBZ3W4cQqMVEqruNbowT8LOgaEztKenObv2hc/pbfCpNRMPNAnysa4JJ0RP?=
 =?us-ascii?Q?WPwHF0mUHDf5D94U3/wMswTIK+RXWEvXFvM/Mj9B7shzuq7+BaNpyhnwhTgu?=
 =?us-ascii?Q?YWvjFkMOiQfBSByUAfT1+DaVDQod6zveBRsBWB/PfUpY5yZfSsUwrgmGbZs/?=
 =?us-ascii?Q?iv8Kd9Ffp+EAklmQNT9bQsOjQ09+GK7TPPjUF58bta6MEinT7z9do/3unHHa?=
 =?us-ascii?Q?dq0VxAJTxKOIvmoi2U5/rTuGQyrYv+ME7Dczc4YjePXq+kftvTiZj1ZQo/mC?=
 =?us-ascii?Q?HfB/4RyLYSnQp1brddau//L48Hde1hY5lFLELtDoyQpFeIui2KpW94UVAhxa?=
 =?us-ascii?Q?qVfpiYem5VhYBy0I5eNsJ9PBhllXpCQVQlcspkoXpuWIDF1UJivfYwxPyEs0?=
 =?us-ascii?Q?303MUmlBrqCf1k3QYHq95xlvO34q1rYTiGlWBr5c72Gf0KRKaJQIfemSSoic?=
 =?us-ascii?Q?Z/SYkd9ecP0iZZ0BZ2r+BJr6ACjwZDubqBWCCN/7SoJqgU+6hLOREcgGU9Kf?=
 =?us-ascii?Q?CuVNWiPl895PAJnJf8ztpiTc1I3vBY738hH9DyE2UvVaP5VItwRF3alQibuT?=
 =?us-ascii?Q?DEQnvitbqgGRqGiUlF4AGVnpIaqYZRs7BDF8XKexLlbZdk1eMvAmrWTuYTLE?=
 =?us-ascii?Q?fnBKT4LFzGc3pUbv0BO6wM8WYrpnw+sFjoDnQ4BwDMaVWo8KMdznjA49ti1Q?=
 =?us-ascii?Q?e4jwksrHpN/hR9DUcRoBN84/XmEin5P+crkrqVahj/bFtQ3sHpeDxpITQSsH?=
 =?us-ascii?Q?0yHSHNUgK5IfdEiQLGsPyMyO15QZOg9uuYqRzKsz6cW1SfFrMmTOnDp79v38?=
 =?us-ascii?Q?mh92QoHurCj6DSSJ9Tf9blFna1mniS0oOm5idxS20NnryqQ6U0Jj08Ty1giy?=
 =?us-ascii?Q?7hWbkmqAEHt5TqU7jkm5Wi96L5dSFvb8Bh73Izy3xpqhXB+ChFS+138ABduM?=
 =?us-ascii?Q?FV/C5iV+sXdY6ZJyM6rBlTHoMZo0qK59asJ8IKxhzGMnEzrSdBT12moDzZni?=
 =?us-ascii?Q?YyMF1bKVIXkrgs9rPw8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a610470-c1bc-4c9a-6044-08dbd0ab4d25
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 13:57:15.4743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tw+3TStOY1e4/fAUnFAT3DTK5V9MdpV8AC7GFBW0QLD25sl0TiYEw65GjRQVuOaqV8o1qeEq5zPWH7dqscWNLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6680
Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

Hi Cornelia, Michael,

> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> open.org> On Behalf Of Parav Pandit
> Sent: Wednesday, October 18, 2023 4:43 PM
>=20
> > From: Cornelia Huck <cohuck@redhat.com>
> > Sent: Wednesday, October 18, 2023 4:34 PM
>=20
> > On Wed, Oct 18 2023, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >
> > > On Wed, Oct 18, 2023 at 12:25:23PM +0200, Cornelia Huck wrote:
> > >> On Tue, Oct 17 2023, Parav Pandit <parav@nvidia.com> wrote:
> > >>
> > >> >> From: Cornelia Huck <cohuck@redhat.com>
> > >> >> Sent: Tuesday, October 17, 2023 5:55 PM
> > >> >>
> > >> >> On Mon, Oct 02 2023, Parav Pandit <parav@nvidia.com> wrote:
> > >> >> > +When VIRTIO_F_RING_DYNAMIC is not negotiated, the driver MUST
> > >> >> > +enable the required number of virtqueues before setting the
> > DRIVER_OK status bit.
> > >> >>
> > >> >> What does "required" mean here? It just chooses to enable the
> > >> >> queues it wants to use, right?
> > >> > Right.
> > >> > Required meaning, whatever number of queues that driver choose to
> > enable, those must be enabled before driver_ok.
> > >> > So it is "required by the driver".
> > >> > Would that be ok?
> > >>
> > >> I'd write it as "the driver MUST enable any virtqueue it plans to us=
e"
> > >> or something like that.
> > >>
> > >> (...)
> > >
> > > It would have to be SHOULD - we can't add new MUST requirements not
> > > contingent on a feature bit, we can give recommendation based on
> > > existing installed base.
> >
> It is not just installed base.
> Spec clearly says that:
> "Perform device-specific setup, including discovery of virtqueues for the=
 device,
> optional per-bus setup, reading and possibly writing the device's virtio
> configuration space, and population of virtqueues."
>=20
> There is no feature bit or any text that says "population of virtqueues" =
can be
> done later outside of the device initialization phase.
> Only reference is _F_RESET bit which is only for re-enabling. (not enabli=
ng).
>=20
> > Then I wonder whether we need to add any normative statement at all --
> > prior to the introduction of this new feature, the driver had to
> > enable anything it wanted to use before DRIVER_OK, and if it does not
> > negotiate the new feature, nothing changes. Spelling that out in
> > non-normative sections should be enough?
> It is already implied in the spec that queues must be enabled before
> DRIVER_OK.
> So what is written in normative is not changing any behavior.
> It is only making the implied behavior explicit.
>=20
> If it says SHOULD, that means, one can enable the queue for the first tim=
e after
> DRIVER_OK stage too.
> And that would violate the "Driver Requirements: Device Initialization".
>=20

I have addressed the comments of v3 in v4 at [1].
The device requirement is kept as MUST to keep it aligned with the "driver =
requirements section".'

[1] https://lore.kernel.org/virtio-comment/20231017143135.758523-1-parav@nv=
idia.com/T/#mc49b6e54186c5f1b1e8c743bc440ca0cc0938212

Please review.

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

