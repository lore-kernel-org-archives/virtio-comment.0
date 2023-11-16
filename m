Return-Path: <virtio-comment-return-8388-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972B9C47071
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 06:35:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C2DD01922EA
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 06:35:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9BF60986DDB
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 06:35:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 74439986DD0; Thu, 16 Nov 2023 06:35:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D826F986DD1
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 06:34:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8zln758/YHLMtQnc6vS/6oYotT5isa7ysJgvKluIYUAdkIEUkghDx99NpQLjeVMBfiKg1ljyuVNsk2vYRvFauxxz7q2S0m9fKkkse4PUGgfXwaB5rsAaATZapSExRmJ9n+UsdWVSPU8nIHY6iS081g7hXbUtEHRt7OIi4SYn/zLZK9JG2GTF7ycrHImXek3j4GPq+k8OqFFPfDQCyG7bjJtDoxdCBJTAr0gsuELWvjxmnAi0ZgdC8mq7a1r/6wjmqWPz4PxE3eccCVf0AgzbNXrtJG8DpU47i7fMgytvbAFHMbi7/Wk8AamBnnA0EkI8v/zTIgVoc8KLCYlKAbWbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imLJjUiOubQL6LM/deEDOzm8bM5/qF4gqjv8pm9FiT0=;
 b=P7TI3C6g6UY6VY0tNzDQqPs5J3aoGCMBdRgMiRrROk/Ll+SZCp0N6HBZStgi8yjnWRs/UyKem4g6DbuBSPGvpT/GcdID9DmyqIPRE25FwFc5Oujgb4debjHobWXRZnUPCapx4cwYeEyZiOboHVbYEda3bf8uKZiB4HN/j1zBeJiKTaPD+ULu6IMLN8aEkF9UyKXSF525JZCqtIencTbmTvA4znv5HYNI5pWtsg2CO2FKiMRVKyJ7ZnIXDg52m8N4lD6FUZbCWQtG5wBKligxxs3EroWC2ZyVNqQ6cT2308Up4Oqsxkl4ElViLhwalqmXdU2xhyb4uI5qJzXE1Xa+yg==
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
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlCAAWk/gIAAN7kQgAF48YCAABlCkIAACTkAgAALvzCABizrAIAAD2aggAGUBACAAABcUIABWsEAgABcQLCAASo6AIAALsiAgAZSfICAAAYzAIABYc4AgAA+ffCAAULTgIAALVPAgAGlyQCAABp/kIAGUuiAgAAFiECAAWL9AIADJo4QgAY+aoCAA+XikIAA3lwAgAAHcaCAABr2AIAAAQ0Q
Date: Thu, 16 Nov 2023 06:34:23 +0000
Message-ID:
 <PH0PR12MB54811F4CE5686AE4BEA826C1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <CACGkMEtKPPudHAXGbrOppwgRP=Umt-F0GNKeoajOGzgs+wvyLA@mail.gmail.com>
 <PH0PR12MB54815F58F470493FC516CDCCDCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsR56_C2b6-YQFpEOPt4sjJKyqcqrdhi9G0vU9ytezFLQ@mail.gmail.com>
 <PH0PR12MB54811373EA43BEDB4E159E0BDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMzp7DjDkQcO4RZ0H0HfxSrytUJrSyDj6gnPWV9cTZow@mail.gmail.com>
 <DM8PR12MB548085F25849CF1E055826E6DCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsfcEjue1UZmuNs8k65o3HSM94VsweSbWLH3383STR97A@mail.gmail.com>
 <PH0PR12MB548149E1E51DA9C1C094ABCADCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt277yYUHf98dCkypS-PXzu7JrRSVBAQ2cCRg4XzCLPzw@mail.gmail.com>
 <PH0PR12MB5481DB04DEB1A540185ED1ECDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116012208-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231116012208-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB7656:EE_
x-ms-office365-filtering-correlation-id: 6719495e-3465-4172-7115-08dbe66e12cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 uJFGrm12Ep0Ffi18BD9mM7Ov3Nlpp1+HqoxkTI5kDJPTIvcrGxAeZFcQh0HMOfK2tQEiRVN9TbanqhvgJss9SbWPjlHd5YnHR+VH1caIg7tY8qtxg93apVjN9y7kuqYEqmsqf/jYG/t8z9eKp7MSHDksVJsJ8OPHZ6jnvztX1lVy3DY07FUq74aYo50Y4RynkCr02JB0tPhZLh1pWs5suee2Pin+rF9fZd36iiR8rPOwC+Hflx/H09hn5x3qH2L8ZnqmCkGm6Li+3wRw3nmZx+Xmbljg1IzMtTYldzJ66GdbdL/rQxXZE6MvJbo2Ys/JvHFPMfgFItt8TqKtvDnFcJKvyaIsJ6PcKJTQ18U5CI9cKj+4yasB4ouQR7Op4d9hW+hkPfO11GMUvNPQWel+HYa5C/Vx1f58pyMuAwks6TEsztU90tAhxt/YGyw4RGF5Bn0sgDmUcX9TMc7dZ8AnBepZUXi+Cwezgu9uRANewLL4nvC3riOS3GGM2suB7Rs6w8LrIebY8urYo75LMhG56RV8hpMI52FuvQnUpYlP+iZT9fhD38Yujw4bZiKE3vC75bQunsCytSHOn6rfn+AcZsdvJnUxevmpwN5aggtOEZBLKBVHDERstlzDFa2cTdtQ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(376002)(39860400002)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(66946007)(76116006)(66476007)(41300700001)(6916009)(54906003)(64756008)(66446008)(316002)(66556008)(86362001)(5660300002)(2906002)(52536014)(4326008)(8676002)(8936002)(33656002)(122000001)(55016003)(83380400001)(38100700002)(38070700009)(71200400001)(478600001)(9686003)(107886003)(7696005)(6506007)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bS8bJTFNXgd6knxJcqZVTVNnQgInxZBreqCdWJE87x9wKg7Oi8xTiN2Ow28f?=
 =?us-ascii?Q?15PNAloTfDDL0Dc4sF2lDpGolxPLcGg4qkEjFTynI3/r9VgXZ6Du2201s6R+?=
 =?us-ascii?Q?Q6uw8H72ag0rTm/Em9Tk51EUgO3vYx2zTJE2SF6hHeBh+LUyUgrzwSkjsdcu?=
 =?us-ascii?Q?s80OrwSgvzGP4gLJDoSkvKMqZA/XvszaQO2athHtt//9bo49AtKOiHggxZIi?=
 =?us-ascii?Q?q5ousQAXPJC1xSR1foUbwSPlTr8dvSQ+1j9RFP4J/EH5IPaZDxAsUQQOLoum?=
 =?us-ascii?Q?xcGlJEywINhUgHdFDEsMSWH7TkI6ag91/Iquran7d5Emm8Yhwlib9x58m2bZ?=
 =?us-ascii?Q?aqJVPNMsFyK/rMbvwlBAFAWOiKrnde8/aeM4ep9MZEO1Ej73E62AVrUhWTl/?=
 =?us-ascii?Q?vmwizzjj2bl58yCszYuN/7BRODDay3GewbYKatmpwoHREdcvUxGrKua9wam5?=
 =?us-ascii?Q?dxVIA6JYLdEDN/45J9+g5CD9TOsX3Y71FSAVmyAM16fOd064OIgTrGJheu2g?=
 =?us-ascii?Q?VQbBIc0Hn+N+LfCbt5vIenGus47jicnIwYEUWHDb6xp9GFbH4s3SRxkPhkRF?=
 =?us-ascii?Q?XtJsbElrhxwJAMYQRTEVs3rAAAehz6/kbac7BMAvxV9m1WNdwmKSe6wSMwLn?=
 =?us-ascii?Q?HP0wUUOqtac5vcFDWxsGhnPQ4ktvoFxN0i7e+7PhVUDC4XABfl1htbxcbFPs?=
 =?us-ascii?Q?vGAEKegOcRNGk+66/lyaA6Y97imZBbWdKYcf8KkkNl6uNJuLtf2VZnQHoABN?=
 =?us-ascii?Q?CAPl6hAs2GYx4ZmudalDEgrsxz3MfD8puZBmgRX68RSV92Nxt0gEcQdTor8w?=
 =?us-ascii?Q?DFDwpyf/BEHgvMMsR55DHJIJ4ULsHi7PHM/5J/HSpJ8WX2LRX9SeoQ0Bm4Pu?=
 =?us-ascii?Q?OwsZua5fw5+qqQIwYNT0BdOkLmENy0W8kXYd5PVhvgruPy++urH9F4GC1xvw?=
 =?us-ascii?Q?2qgTvRBhP7dU6GB9GSRmgRmGJerZGWSzCwI8J81qfIu7aYaXQvVZSE6DR7QZ?=
 =?us-ascii?Q?DZ1nkyjgHNx99Axv1+7VfPypMDJoee3OugV3X3I3vfT8GqqGCVxh+75+39IY?=
 =?us-ascii?Q?KaiK+cWhWPoErZDUV7G5Kv+ISBuPJgMJsr9/cpDLbD65kV+GXAZoMYfPGVL2?=
 =?us-ascii?Q?nBj95C6Y3eP66TWZxichoY/vyYjGhRPREcwQindlbN/71xqeurYSROfLvTqn?=
 =?us-ascii?Q?j9qX89kQaVB1YjNLyPjl0MpvhGR3fmEwwL1Sh/oD1woo4HhsJZHRa2LBfRKM?=
 =?us-ascii?Q?MPDcAeSyNisnmyD5aYlH/KlXoozb/5XEaizayF5nZGknrqIa2xit6bZyKsQB?=
 =?us-ascii?Q?XQDR1wc3ADFKR2PPJFs3TKqehozvZZRY3+sYPxnQzBq1X7mHbQIP1Uh4nSjq?=
 =?us-ascii?Q?VamYqwPOxN/bAJQYbef+Tz7m8rUj4iuuuX3BQ1P3l6OrB7jABq1gWItz3AUp?=
 =?us-ascii?Q?wGpu9u+HR1saRR9N09KZL36qOQ6J0fLwsVknb+NTFR3bFHkGWVzgHHJ+AfYF?=
 =?us-ascii?Q?6/d9VAA+zfUQUEqbSIt2dtfhDDbI0F9B3LGsyVqubsrN8UPXahDYmuJkV13x?=
 =?us-ascii?Q?1fRyWc5udWN0/JodDaQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6719495e-3465-4172-7115-08dbe66e12cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 06:34:23.8670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CMy/JyVpeRqChv2DoeqxQgr2bk+wUR/SK1adg0YCW8+Qfo19tlvdWUpOnQpLuQ7E1HozToDHobH6mvtCD2ntng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7656
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, November 16, 2023 11:53 AM
>=20
> On Thu, Nov 16, 2023 at 05:28:19AM +0000, Parav Pandit wrote:
> > You continue to want to overload admin commands for dual purpose, does
> not make sense to me.
>=20
> dual -> as a transport and for migration? why can't they be used for this=
? I was
> really hoping to cover these two cases when I proposed them.
For following reasons.

1. migration needs incremental reads of only changed context between two re=
ads

2. migration writes covers large part of the configurations not just virtio=
 common config and device config.
Such as configuration occurred through the CVQ. All of these is not needed =
when done from guest directly via member's own CVQ.

For backward compatible SIOV transport, one may need them to transport with=
out above two properties.

3. None of this transport is needed for PFs, VFs and non-backward compatibl=
e SIOVs.
Each device to have its own transport that is not intercepted by the hyperv=
isor and follow the equivalency principle uniformly for all 3 device types.



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

