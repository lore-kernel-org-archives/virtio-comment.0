Return-Path: <virtio-comment-return-8080-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880E3C4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 05:43:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D63E02CADF
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 05:42:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B776D986BB9
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 05:42:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9C9D5986BAD; Wed,  1 Nov 2023 05:42:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8C8FE986BAE
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 05:42:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfUHyVz1vrLyTKx/Wi9l4QGQUz45h17GSPNMgTtfrcSVRsiYNAKF+6/6VoRgNU4UEKAjbVVuWOOnlkMisrUbqjcTcO6WDseoD9k1Kusp+c/qsVG753nCtR77l/HY/vhXTWrBufioKCvjCq6o4podpDx+7RUGYtn2y63NPeobKtv5ATSUwyWEH7RHvaaD1q/4EogvY0GpEddoQT+Qr5KYncqUqhOJN/pEXlXYp25ndebLGfzT3P9VWYwP/DY8/z2D8mot34FnE9c+rrraz9yphBjK9oWY/wFtjXRSgThwpHgw2Teiz0P7mgEiuaXcCJ6yMxgWysbn1sJuL2Wvgiz4yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIpl0FDZHizJkU+5MdRXfDVbYgOXC8YuYKGR4Cr061U=;
 b=ITmo5dEQBh1wdeUKQr4cT9tvjLjNw9wDVz5zPDx8+NOXsFAQZnxA4Gtq2rpCKTXCOiJNcdXbWw1gORevqF35nCcRDBOrXISthsTxLi+pJP/K+ljALb6CSwTLsioN6gswe3i+T3x+xhLiRoDy7XDcpnRipnEcnMK6KE6/k8y37CRV80qySFrIKaFkeGaMvYSNS9rMwEuySh/JOQd4yiMNVnMIVhJ+rRb+ZYUyliYra2qeShHARIDZhZzcSqGk0ILv0GL6X/BGksrwvi2w0l3IXlmI5UHzi19mochaZP8J4a6P6Sayf3gvrjl0qOq3cjBhUdM+Hy2+cJoJDNowaaui9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, Jason Wang
	<jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIABiiSAgAAMdcCAAALCgIAAADWggAABTwCAAAD9AIAAAmrwgAGTbICAADeVYIAEiiUAgAAAXICAAZfSAIAAAE8wgALlIwCAAAFh0IAGFdwAgAAAUgCAAGlTgIAAAOdQgAGLtoCAAAjegIABFlmAgAAs44CAAAKEcA==
Date: Wed, 1 Nov 2023 05:42:56 +0000
Message-ID:
 <DM8PR12MB54802C006C5ADE546783E610DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
References:
 <PH0PR12MB54815B589B8F5489FB493465DCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9604eb82-8efd-46cd-8b15-90fc637eff0c@intel.com>
 <PH0PR12MB5481E6F72E2F15AC88E6E24ADCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <09996f68-2831-49b0-a403-1ea061bea6eb@intel.com>
 <PH0PR12MB548147B94D76EF02EF42A9B1DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <341b7a16-6927-412e-8a22-4841cd419314@intel.com>
 <PH0PR12MB54813BF8D0F6282A1932EF99DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <640cc639-6065-4828-ac81-0cc809aff293@intel.com>
 <20231031054617-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54806512D1395AB39C59B821DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231101012540-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231101012540-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|DM4PR12MB5231:EE_
x-ms-office365-filtering-correlation-id: a4c8c477-0ae9-4509-7c65-08dbda9d6670
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 3bkDqOI18ejJAGcdcb1DTdGkiaxwXUS1jb/FkDG5zPV1MdfMU26DdM8F6GvqbDxsFKvB23nYYkPGzvigQ91kj9JPl3vJrBmlchxQQihRuxnnhUwaTKoWB5vZ2Teyy1/W6lZLJA8R61uranA0Lsrtp9YdbmFLQRqlhQ/GtTxSJqy/1x/gs5jOJrYidIyFdfsrcqn0ii71+aP+q0u9kJtYMmGEKrxF5aMSiO9Lj9zS/M+2D8tEiBVkWk3VnT3xIqtXlLMxKkqi+wytSJt3ho5BPF/Lqd/IocU1KYMTV08hdatbz2q21Yl0wydmt3ya8/0OOxRRBheP1Ki0P87vf8TQ0Dtq+D0HyIhoAPtb8yDZcnUoNac6CrnmHwxKEzAQc8SsZbShuco0/vUp7W18wbe8Bd3JRsvmcz/4BuKTia9U4j2jvV+DWPuwozYYnyGkc5R1k+bX/zVOVFdc0PmppjpsgExiH3+AfP2Lssgbo6faZTbBduQhCV9Mu3Svr4jEj4XnK1cXM5IJ5shA2wF+7Rkm8uBh4cZM4QPbLymLMXOQbbK9J+GXhbVW6kuMucAAeVQVhibuW5jBIekzFfJ9GHXvuGePL+4YLGQsIcuYovPAnnPotpkpbzcTDbxi8WdABlay
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(39860400002)(396003)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(55016003)(107886003)(26005)(9686003)(38070700009)(33656002)(86362001)(122000001)(38100700002)(52536014)(2906002)(83380400001)(5660300002)(71200400001)(7696005)(478600001)(6506007)(4326008)(8676002)(6916009)(8936002)(66946007)(66556008)(66476007)(66446008)(64756008)(54906003)(316002)(76116006)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TL0ItGOdnuo2k1tDDJmz8+5POuIFzG9+kyIfX5GHP5Urn2tdTvSaelnonQVs?=
 =?us-ascii?Q?drc7OLJhdUtN2cxMea3CqjbxW9bVzSJK3l9aBWqbdgxLdn9oThOGPjk7Qa8g?=
 =?us-ascii?Q?kgs+7ojC13bv0DDU37ysAzuhyA5qH4YcaWhJbmAfNzLwajYhhL9Y5P52neJF?=
 =?us-ascii?Q?+5CEIJpYvwbPwLIyJIv/lD33aAs355P06tJMFK0tvZieWSy0JMfKoOIW+SDZ?=
 =?us-ascii?Q?JFfQBPvhLTU4q51GHBYor8s+fppK56pxb73ULSqNUlIFm7JxX7NF9/Lkkq92?=
 =?us-ascii?Q?R/W+TbzYX6yqkWXUrwAPzmD1IW8xnW6WHUJaOC/idi8wr35EumyPsA4RzqKv?=
 =?us-ascii?Q?ly27sHxi59OExPFykQC4LQDiid9H54CLzeICC7rTMk1k7JUM75KGBXo0+BAc?=
 =?us-ascii?Q?NkDonjxT7B0HWY0Ggvx858Gbr/KAwgjZVFcTucP78PM7X39WamyXjZLxqE/e?=
 =?us-ascii?Q?42Kuu/RuHRcuPUdiQWH5Suv6hVr6SYPV0nW8NQuGGLej7pweaaNcyFzaifaa?=
 =?us-ascii?Q?wH11vXVDex9RbvIGkbCG3Kfp+QyRbqMFWbjgZUvmrmv9XFA7ifwTDgpuM1Px?=
 =?us-ascii?Q?TgMyMgB1lcI1F6AkEuOr9V5KFJUTs2vgpZ94cu1D2iKf5yXf8UE6jZII1yWV?=
 =?us-ascii?Q?QcTmgEZTbGBe59KKAlP7k2q0HG7Cx3JQS1fRG6vvbsQQOVfhjvD0xPCPTTal?=
 =?us-ascii?Q?j+xx9fd6v2MDO6nI6xLUlj58bJayji0ReGZhGIH6LzPy9r/gMhJLe2HAjvWL?=
 =?us-ascii?Q?iuBykdWA7RKhb/jGSEOiisCUmdf4CaFFgPLnWYyb32XicdP2h5kViEgeb6WR?=
 =?us-ascii?Q?Iid5djufxsIC5E9vHd68wc0th/wBk3W/ldY5yhdzLD6RJnI7lHBGS+5HnwNa?=
 =?us-ascii?Q?UDTryI6LBcO9kU1hQih+rZXtQHMiHgHjVa1k3a+bSDL5pniAmU5/2scq7stU?=
 =?us-ascii?Q?K+BslmvQxiGEbiqi4Vfs5Jqqf80eRYe2BjwThGmp2ncs/BEj/Ww7r/C7AuPt?=
 =?us-ascii?Q?cNMDTP3BYVcxXEHemtR8YP5DaJZj/okUzAA6CyRF2BM09T8HqItCxftDuYYY?=
 =?us-ascii?Q?yU4bUPNP3Bc2o/RoZ/Xa+J4UZ6tDBnfJll7uHDD2IxzX514azo+qBWYGn9aj?=
 =?us-ascii?Q?SkfsjQNT1S3m6EMc7zNzy89fe8JGrOcsdvzarwOnI/3QjAWO/9otodUT8Hzv?=
 =?us-ascii?Q?SEMqSVL5qU6WMXkXMEUvuSzIe7dnl97X6zkkSysNLfObFsV15XQ5QpazwbiQ?=
 =?us-ascii?Q?bAXuCSuj53Sk7AjEMz1Gq9ThMgkLfqKlkDzrOHIbSi5N/y65UFfop4VTBiLp?=
 =?us-ascii?Q?qkLV5T8OPnD9k8mkZQCriftF/W7fwKxPSK5JkHiuH0AqgpogTmivz7vlPbKf?=
 =?us-ascii?Q?Cg28B4vOoLiJpZPKTxBiS1IoSFthIf6mFDvGf1F9tR5YqWy3UL5ToRSR0fHc?=
 =?us-ascii?Q?9k7KcSaTE08NBvaEjq6hIlKlBMKkwTdMveY4Yq+SmjGf4KmBk+zaOsMTKA3+?=
 =?us-ascii?Q?2jq/S6BCMcC/XSCo4DExpeEcKKrVepuTpDNCICEc4ha0jORifvxmxh7a2eFv?=
 =?us-ascii?Q?adBHmgHO6/bWQ2KRcuc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c8c477-0ae9-4509-7c65-08dbda9d6670
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 05:42:56.5963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MvGPzs9IZf7rjfBvF/2XXtJ5gwpnsjJIx1WuPWYWul3oz8TYB130ZlfN4254xvXBM0OL7w4qA4E8ouMQCs3+Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5231
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, November 1, 2023 11:01 AM
>=20
> On Wed, Nov 01, 2023 at 02:54:47AM +0000, Parav Pandit wrote:
> >
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Tuesday, October 31, 2023 3:44 PM
> > >
> > > On Tue, Oct 31, 2023 at 05:42:29PM +0800, Zhu, Lingshan wrote:
> > > > > Your answer is not relevant to this discussion at all.
> > > > > Why?
> > > > > Because we were discussing the schemes where registers are not us=
ed.
> > > > > One example of that was IMS. It does not matter MSI or MSIX.
> > > > > As explained in Intel's commit message, the key to focus for IMS
> > > > > is "queue
> > > memory" not some hw register like MSI or MSI-X.
> > > > you know the device always need to know a address and the data to
> > > > send a MSI, right?
> > >
> > > So if virtio is to use IMS then we'll need to add interfaces to
> > > program IMS, I think. As part of that patch - it's reasonable to
> > > assume - we will also need to add a way to retrieve IMS so it can be
> migrated.
> > >
> > > However, what this example demonstrates is that the approach taken
> > > by this proposal to migrate control path structures - namely, by
> > > defining a structure used just for migration - means that we will
> > > need to come up with a migration interface each time.
> > > And that is unfortunate.
> > >
> > When the device supports a new feature it has supported new functionali=
ty.
> > Hence the live migration side also got updated.
> > However, the live migration driver does not have to understand what is =
inside
> the control path structures.
> > It is just byte stream.
> > Only if the hypervisor live migration drive involved in emulating, it w=
ill parse
> and that is fine as like other control structures.
>=20
> The point is that any new field needs to be added in two places now and t=
hat is
> not great at all.
>=20
Most control structs are well defined. So only its type field is added to m=
igrating driver side.
This is very low overhead field and handled in generic way for all device t=
ypes and for all common types.

> We need a stronger compatiblity story here I think.
>=20
> One way to show how it's designed to work would be to split the patches. =
For
> example, add queue notify data and queue reset separately.
I didn't follow the suggestion. Can you explain splitting patches and its r=
elation to the structure?

>=20
> Another is to add MSIX table migration option for when MSIX table is pass=
ed
> through to guest.
Yes, this will be added in future when there is actual hypervisor for it.

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

