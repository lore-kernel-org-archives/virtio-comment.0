Return-Path: <virtio-comment-return-8410-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14086C197A0
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 16:27:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4BEAF33097
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 16:27:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2D0A1986E01
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 16:27:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0E23E986DF4; Thu, 16 Nov 2023 16:27:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EFF25986DF5
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 16:26:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULXxLjMP8OOYqcEY+GcShE6AmWvtZrXXwsHRfhEupXYJPoTbgK/uDV9q5D7IFuFXx6gRzZ/4t+pIdQGL75lxmzuTzFc8q/z7uZwoXLrjX/lDI+Dk4f2R6Phz2wklvT/zjVhQt629Dp/Es5B5BoRCAuqMF3BuNiqxQ9woP9rRuhK1FH36EvTvAgF7O+FKcQsFvK33Cl30qti2xm/dO/26b4HSf97E8CKAdmqFwZf2CzT0/DAGV+WGcgmSJhnASaznZu6P56QqYyAma/3itAx88//ynNcDYJ1dpNcVZ0CraXq2SCIl2zYCxL1mGsFdEqTCwFp07tF4gnW4TmDY0ofhUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vn6QfAo63OS1/INd9950W7vJobkNG5VnsOGMbr6dKO4=;
 b=MtvZtgFuUj2ua9FShGDBDUBl8zRH7yPPlTrmJUfE/XWHE1Z8P+pKcQaEWZ0M9BcLJbDM22E6eQbzHmTzqL+vVJ2JEkXBQoGTojZfcNB/DYQPT3dV49Z82vhPf1ch1r0sf3ud4Q0Xf8ki60G5puANOGC9OE9m0V2xM9XB5gynTMpLw48rs/mOPqQzwLJN5KMPJiO1hXh35LfCUs8ErFRXMgt5hCnU9XfEBu6KzA7zkkLESU3OtALKzzd6FjmtASyt3mgB0BmSALJ0Um2EbK999ENbC4FSICQrki4wo7Md1cl2Gjbjs6wHEjLP6zGo7uSuwL/HUGoa/tll6TBPNVKFWA==
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
Thread-Topic: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands
Thread-Index:
 AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfAgAGqygCAABTkAIAGWMEAgAADI2CAAWVPgIACFpEAgAdP4YCAA//WQIAAxB+AgAAJgRCAAA8CgIAAHSmAgAAA6/CAAEWagIAATXNQ
Date: Thu, 16 Nov 2023 16:26:53 +0000
Message-ID:
 <PH0PR12MB54814EC9577B1197E2A13BDBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <DM8PR12MB5480A4E02DF988BCDD16E7BEDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsRjdg8-YN1GY1fyRHU8UvCthvDgBUzURmTVB4JdbFGZA@mail.gmail.com>
 <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com>
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116004037-mutt-send-email-mst@kernel.org>
 <20231116023443-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548118E76BAFD5FA470B92A1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116064611-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231116064611-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN0PR12MB5833:EE_
x-ms-office365-filtering-correlation-id: 86560bcb-abd7-48d1-34ba-08dbe6c0d863
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 kDOkKkxn1jThvyyigMx/BTGOHN5XK/trjr6rAZ3UK4PQ7jgQUyGbOFYGJixANxFb3vD/BSaNRF4LjSC99mJgJvPRvRrI8HVIhGqyblZpy2sYO+q/YZu/GLjuVd2o4tNEGO1f/bmB1JWKR6575FWB8hn0CEx8bhig5wYoWVzJibnRzqrqxoIDeXnTymw1ejkhGagO1ewSkRjaj5Y0MttsGu3BUe8JARPG8TlAkEDncPNleYHA2lL6CoShQUgk7PWEcLO3TbROah2jTYSrist/GSUms0NxV636l80CYmg5uk/gKLCaas3Sy21Rp3Ag/drQb6wD1oTt2aL9jgbvJnRcRN0Qy+WBVbJZHIxOD+i76urrCuRfPfA2KHwvCVVtY2UBORtF5s9OGrzqfXQmGzir1+GYP8pLz0yypSs9LHQ4FL+rGkjTWqxJiMKq3u/RdmxHlt+r3Qh8AjccOV92SRLcHYZ6ClRyaB3fYblxzm8reJ79V2kgPNDx3+S2ksPFIt/bgFqBcuKxuACyt+2axcZ2NMx9thLxaz/WDa80KdzYASqwUFQaar+InOfc75KxfhRPz8uVhYlZBLkJBOL5ZCE8YWVCvbAoGPjfsxZIXmrs/wM825I2Mw8fpOfbIPizDf4c
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(366004)(39860400002)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6506007)(9686003)(2906002)(7696005)(71200400001)(8936002)(83380400001)(26005)(52536014)(8676002)(5660300002)(4326008)(478600001)(316002)(41300700001)(6916009)(66946007)(66556008)(76116006)(66476007)(54906003)(122000001)(64756008)(38070700009)(66446008)(33656002)(38100700002)(86362001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IY71QDL/vko0u/AA61m3yVsJ1W99sSEhg+dzEwg5Gedr+ZnLimAYwKjhU4qr?=
 =?us-ascii?Q?kE3iuomGK7xa8SUuP0S8hrYDSFnXGv+6Kf49lb1sbUBUeVODmQGRqPvlywPF?=
 =?us-ascii?Q?DyswLALnM8NCl6jO2Lldvi3hToIS44trNZpZ7NmRO2TlvsBe8XusMZMOSgtc?=
 =?us-ascii?Q?NOjk6bvdTMJSiqTolWqpr+Ah90tDbUZpE1G756KH+88Examj5DFtxw/ddhX0?=
 =?us-ascii?Q?XN2JW1DW6JCrUAFxcHiRTC9Q94kz5exi1aSIRxRMZdH2drWtQg9Mrf8Z+9fv?=
 =?us-ascii?Q?63jrX3B4Dn+cV6EUlqrQrXp9T4msZ3VMEQxaraT0ibN8GXs2+Iu62qOtFwuy?=
 =?us-ascii?Q?+e6CO+fBR6tx1J+7EC3G3JCRZ3GeOpSOaTCGaajW2Knt8eM8OLtG1/SaaMMA?=
 =?us-ascii?Q?60ya+16+JhP8xJIKrkEs7RmGxfZTKPHIc6IUnuHjWMP1qpKA4WCu4kVzmxyz?=
 =?us-ascii?Q?xMp01QjMJLIDgJYShMkMRtMzGrYH+UtQoRCbl9bNkbrK+CTk7oEwxlFzEcyC?=
 =?us-ascii?Q?Lm+mjDWemdCftNfMx1YYaMlviBdsRTt2dyk+zpZzERQZEVrSHqacwjOucFa6?=
 =?us-ascii?Q?azD7Ff4UaO5PyY77rMR3Tf4h3VjFC7BWj/39DjX/mdRLStuIZ0BTzY5wDOVP?=
 =?us-ascii?Q?QoDcee/GmfWt2i7vSoLp5s74jqTRNmIdgO71kG/Hi+xIk0RxpVqmXw+uwCrd?=
 =?us-ascii?Q?/nA/I0WndpPN4a8BjUr1AiXrsWJu24yG6NkSG9Hh+BbdtIDhvfSJRuZjxl/H?=
 =?us-ascii?Q?78S/yyfaVpD3KyzjufjALYC7uHLXqJE7I/Ma7VOlEbJhiUHqwXA0dvd4ng9r?=
 =?us-ascii?Q?/ohZLE5Ql+xTd44PyJRBRUfdFdNcz/IBNRk0vJz3dUPbthrijmfIxUzPYBlp?=
 =?us-ascii?Q?rbb0lb//Qe3t7iyNsNR5RcZLDA8X+9bOsxypYVicNlSWpcieLAnHeZlvOx0R?=
 =?us-ascii?Q?+FiJdcWGOREaETFRXhrAyxoyoZWOWPlusbbWoPxQInHEY+D7Ctz3XyD/94Bz?=
 =?us-ascii?Q?J6Zqj5OpsmSjluqd3PcXSelimf2RcZHuHU0O6BuUMmrIGCzEFZVjz7YyOMt6?=
 =?us-ascii?Q?v2X8Me3ne2m8D4TXEBFNhuSrJ0BgkzV2US2dtagYFoCpgmGlow/+oRobqJUa?=
 =?us-ascii?Q?oATWqoxxiM1sk4mxW4lhE0kczgj5/bTUiNgQ/0SAB2KfIyrqkY//dWxcDqc6?=
 =?us-ascii?Q?MsXZctjAdzsoUUyNzuhPaq+S+EBXe/0gKmEj1aDjT0T62X93vNWKDat/LMpg?=
 =?us-ascii?Q?00hcdSGO7b2VAoPu4vHCTzI5z8DdTgdPnJfaIN0hLfwHqr24mh3DIHXbGCMG?=
 =?us-ascii?Q?R5Rpl7HEJwIzPJe5kPwJL4TiGa2PCWB0/uZByUAoO3k3Tt9gNNKFl4eMjjxY?=
 =?us-ascii?Q?iOwXkjJxXgtNZnykXtjcPknDZ90svSL1TYwlKYHTAQmC7Hni6Bmp67VmMfFR?=
 =?us-ascii?Q?rMrTyulsxM7WA8tyZTPtoY5amnnKjuasDnTyB/2eRAx6eHCpHQg+/uKOAynU?=
 =?us-ascii?Q?HbO1r9vW2y0hN/s+sNk6+eNP5osE7YVRwUK+i06kvomxVxQKc0r84yCvH2bM?=
 =?us-ascii?Q?59TBrKrZLKPmHMIcXjY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86560bcb-abd7-48d1-34ba-08dbe6c0d863
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 16:26:53.9077
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1F1TZw9VCQHGwQ/TPoDaV8hLrcBKH7ddT7GtPeT0v796SL4L9ZGE5ABhU/DncWQII/YK6/FPzImUP4Gw3Fy6kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5833
Subject: [virtio-comment] RE: [PATCH v3 6/8] admin: Add theory of operation for write recording
 commands

> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, November 16, 2023 5:18 PM
>=20
> On Thu, Nov 16, 2023 at 07:40:57AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Thursday, November 16, 2023 1:06 PM
> > >
> > > On Thu, Nov 16, 2023 at 12:51:40AM -0500, Michael S. Tsirkin wrote:
> > > > On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav Pandit wrote:
> > > > > We should expose a limit of the device in the proposed
> > > WRITE_RECORD_CAP_QUERY command, that how much range it can track.
> > > > > So that future provisioning framework can use it.
> > > > >
> > > > > I will cover this in v5 early next week.
> > > >
> > > > I do worry about how this can even work though. If you want a
> > > > generic device you do not get to dictate how much memory VM has.
> > > >
> > > > Aren't we talking bit per page? With 1TByte of memory to track ->
> > > > 256Gbit -> 32Gbit -> 8Gbyte per VF?
> > >
> > > Ugh. Actually of course:
> > > With 1TByte of memory to track -> 256Mbit -> 32Mbit -> 8Mbyte per VF
> > >
> > > 8Gbyte per *PF* with 1K VFs.
> > >
> > Device may not maintain as a bitmap.
>=20
> However you maintain it, there's 256Mega bit of information.
There may be other data structures that device may deploy as for example ha=
sh or tree or something else.
And this is runtime memory only during the short live migration period of 4=
00msec or less.
It is not some _always_ resident memory.

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

