Return-Path: <virtio-comment-return-8943-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265E7C4706C
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 04:05:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 605612B023
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 04:05:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2862A986634
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 04:05:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 05FB8986556; Tue, 16 Jan 2024 04:05:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BFC69986561
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 Jan 2024 04:04:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+eI3gqsGAkNu0eMgwVWZ2YxaKB/FEi+FLNN1SdY9JwMjN42CIZCTEzwGngJUqN1z0oQ6pRaKWZwOL5vC9SG2L48vOQKlia/+yZzoV2PorLsc1ls6GHR7dsiXij0xbUYkqccPb8Tj31ul+8Y/SjeA/Mtec/0RbFcP4UMzBRt+mzFVcMfFia44Xs3iRUvDUo1qEtoME4dM1mW9eASNub/ukWqg0LhcF9Sez3w9y0lUPmTK5mXMdNMOTLtT7ht0a21I/dc9sWiL7fW4J13RbL/Z59hrnGOlYDnGkxw+mD/FsLX6zgw8aWkruSvUhCG7i95rjuQytr8mrVnZPupHiSXig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wd3iVAPGiMSevtjTbMIjuv1vbI2jHFzCrpobz0T+2cE=;
 b=MokmVJEv+7MGEOGTXGc6vzCgWNEsooFq5K3CYUtrawUZzM8rpX//ZmrSTfwoFuX0vFJAY4Rxc+V5c9nuqth/x/Cvd4jFz6mrP64bovjLdnODNJVOd8cuc8pJYkA4KPhK3g+S9A4aV38TM12WjuI7CYmrUoMrpY9fnxl3lUg8d0GScpS0NUu1eyprxrEPQIVIxos1oSsje+BQhpDxNIHkibVIfjIU9uPJpT72r9zNAgV5LCtbWl2sOwRiRCMY81lM5SUPRp04OosN0mU8+CC9mccFlVtgjiGuESQnTt9NLUoUhGSKR5RZq/SVO+DGAFIBzs0nDcnZZ+hj5BqT//zoJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "yuri.benditovich@daynix.com"
	<yuri.benditovich@daynix.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
Thread-Topic: [PATCH v2 2/2] virtio-net: Clarify the size of the struct
 virtio_net_hdr for tx
Thread-Index: AQHaR5W+R4lWypo+Ak+Gk8KMpevBWrDbysAAgAAIClA=
Date: Tue, 16 Jan 2024 04:04:07 +0000
Message-ID:
 <PH0PR12MB5481B0EDC2C35AA133501FA0DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240115093141.3539316-1-parav@nvidia.com>
 <20240115093141.3539316-3-parav@nvidia.com>
 <1705376090.3631244-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1705376090.3631244-1-xuanzhuo@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN0PR12MB6245:EE_
x-ms-office365-filtering-correlation-id: f285b79a-f9f9-4513-0556-08dc16482f8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 HN8CVHhBf21BuJ993ZH+bBRTZGtoKQFPz5wu0IXV6L2KseQFYU4ihZnF9k2sWshfn8BNb7lA/Lfas6SnNI3L7orrMwPTHcwpoP0AyEhRS58I9CS+Oa6aVJv+BU3TemgatahbXcOXZ7KlID4clDYcEscoYa9p/gJ0fkRwf2KJeIbGEgtedGOq5TsGmUcCX7UMrXK23L4GELUnLFZWG9u85gzDRASys415TLwlMJ50baCMSijZ8jYag1PH+uWC74I8XiMm3EBbojZsvbUljOUsUssIt8mSQYwME3elnqFueKskRSq6Njuu2z1yplzHd+m5GPKyHUwPrstptjnhjOqkZ65IXeYMLPUYSdoeKNth2w/ZyXVKACNLTbQ9bdU56P+DN7iwj96VCUeMjGJ7yAncheAbxKXkSDGqdKODO7KESOcByVFWaSxKrorVgsNLnALppSBp/mjnGVtjuqzac94PzZN6gWC9NBLxwL1vEsRZ+w1DDa+fE0LpUc5WYtttcP2YLjfgVSCH3eiu/qnPSLbUa9ehYW+US4KxzS70rJY6f3TbJYGzEesNeLDgD0solK7jSJRsye1b9HE7FtnbOhXKcPifo9c7/sUmtY7eX4LD3N+/tK6SBqGFGNzlDNQKW/o+MLV4KvIR31VehfC2PzrX17KxWFRa5tsaWxWw/uGFGa4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(366004)(39860400002)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(41300700001)(55016003)(71200400001)(478600001)(122000001)(33656002)(38070700009)(2906002)(9686003)(6506007)(7696005)(26005)(38100700002)(76116006)(966005)(8936002)(66946007)(86362001)(64756008)(66446008)(316002)(66476007)(54906003)(6916009)(66556008)(5660300002)(8676002)(52536014)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?XkM4tPcF+CNPwqvsI7+bc+9D5+v6EGiTOap3RSHaTve0VcSt94PcB9m64XQx?=
 =?us-ascii?Q?bYGpMmcBS009Ans8qgfne+Y9ZphogWy66gZ0+lvTpsAPrgLKDI5/VAhstDgM?=
 =?us-ascii?Q?SShtOJ/8+BDhqqxd0xaHLFkKs0uQWKX+KM31RI7UfLVDbXwVCZw61gb1k8ww?=
 =?us-ascii?Q?FWHIwZNNd+4Ciz8WqX6uPwsHNA5IbLpEmlOdylL5Xy7X6yUkbxn5FHR86kFh?=
 =?us-ascii?Q?f90AuO587ROn+hd6Fnd4EnluokAruZxsZ3hwZkP4h6a/ppSk5A59iPu0xNAr?=
 =?us-ascii?Q?Ilzk7aNeNgmO4kN77yYIxKyANSFnEyqiwdbOG+Os+dATWlSRrr6LTqNrx/hM?=
 =?us-ascii?Q?T/9yzry4RlaQ5uvS1ETV+MYXuRfAWSO1dgcNrqzUvId5Qwcom+MVMNOqz58u?=
 =?us-ascii?Q?brhU5/H+3onZqA7FfAwz1evy4i+PdKeJ4to3xdrd3dlG7l7Tg6SMoOsma8qp?=
 =?us-ascii?Q?R74VEKWWlxNT6AmMI0wOpEIxpyXxfVaa3xt4Ma38QvD5sx35atlfkvxkR+11?=
 =?us-ascii?Q?3OcazLFhipZU8PJxf56Ng0rW32uHr/ECflSdEOXrFOr0MprgO3rz17SJGqUW?=
 =?us-ascii?Q?hS6n4P6K3VtV3VcNUEL3aLOWXo/W+gwvoJvfeLHCx5IBZHZj0Pt3YTUM1syA?=
 =?us-ascii?Q?EKnRs7JYroC4+Jdv3s2CdGAMmkiFWSYNtBrfbkmaN+INXGPa6TXOwNrI5qM4?=
 =?us-ascii?Q?GRJwlnEaPmRZwp6LQpGR55VdVwVbiezXl0KeR2JkPsLPnHBOgS/MBGR6RiRU?=
 =?us-ascii?Q?m/ZISzXVYol+bZVyv591Mvxku/BPsOflM1pD9+ORO+cGwSe7vqLwGxjmGyRP?=
 =?us-ascii?Q?13SQztjDM5btcMKUpi0lvTJw184aKdFii+miG/a0FyIc/bhfWljhybGwHiv1?=
 =?us-ascii?Q?b5PjAaEluMHemeOLHREjo00FY7aYr8FSHYrg2p3Fpt8eMiT/UxB6qe1uTlvb?=
 =?us-ascii?Q?+I4tfxP+YCfDZ40zr6bhjpal6uPRAvhSZqqqsAijTONVm5eQWQm6CXY8RYN+?=
 =?us-ascii?Q?CM53fhS9T1E7Zo76nk2SBrjuL6khOGuAezhw2gOub3GGJJzA+yrO3mfi694Y?=
 =?us-ascii?Q?ddHJ9GyXm4Yk1yIOnj5FwWXYQc980G42/KJRpVMY/XZ4qKDFVcOZnU5ohOuz?=
 =?us-ascii?Q?4dxE9JxwoGG4chBvxBC6tkcVmkhMVPnNFFkshM3d6O2rMb78QozxeLQos5nk?=
 =?us-ascii?Q?VHXoT0n1BpApxwfNc4sypnhb3rXOObfUOEDbOhbfcYTAkv31HlycjYVh64cO?=
 =?us-ascii?Q?Kfeom/CRzg7oOvnzpP35eJZ9skV4dluNBOkOfVlWffRhcEWG40ND7G3nArrN?=
 =?us-ascii?Q?FClXuKZA1UjE2xXWWSiR4mu2AVi9OqzWeiNTpWV5ofWTvh9RG4uD+ywkU1T7?=
 =?us-ascii?Q?x9YLaQfjop41xEPSz/JdDpC4JZmcThFwdDy0nFbX+RmiEHkgOD7NkK8mhV2s?=
 =?us-ascii?Q?gUpTWepXHc/DQpkEJoBe7p0g3nYohnVEDas5EIt3eaJYk9bvwjBvg0bOYk5C?=
 =?us-ascii?Q?kSY6GXFz1a/2NCEPjs56+kAcpC8O2QPdW4WD5iPd/GIB8XbrE0zZ6Pb46Z96?=
 =?us-ascii?Q?g8+kWKTE9b7BXHqmnHw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f285b79a-f9f9-4513-0556-08dc16482f8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 04:04:07.0701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kVEW0ff22aafBxZ+g57NNF/wk4jB6n/QCZUwatnmLZdFw49zN6seQVAhk0LE6M9GTkBtHyXIhMitoc+ocwWG/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6245
Subject: [virtio-comment] RE: [PATCH v2 2/2] virtio-net: Clarify the size of the struct
 virtio_net_hdr for tx



> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Sent: Tuesday, January 16, 2024 9:05 AM
>=20
> On Mon, 15 Jan 2024 11:31:41 +0200, Parav Pandit <parav@nvidia.com>
> wrote:
> > The feature VIRTIO_NET_F_HASH_REPORT only applies to the receive side.
> > However, when VIRTIO_NET_F_HASH_REPORT feature was introduced, it
> was
> > not clarified that the size of the struct virtio_net_hdr on the packet
> > transmission also uses higher size when VIRTIO_NET_F_HASH_REPORT is
> > negotiated.
> >
> > Explicitly clarify this.
> >
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/183
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> >
> > ---
> > changelog:
> > v0->v1:
> > - addressed comments from Xuan to rewrite tx normative
> > ---
> >  device-types/net/description.tex | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/device-types/net/description.tex
> > b/device-types/net/description.tex
> > index 53a56ee..e2de016 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -528,6 +528,9 @@ \subsubsection{Packet
> > Transmission}\label{sec:Device Types / Network Device / De
> >
> >  \drivernormative{\paragraph}{Packet Transmission}{Device Types /
> > Network Device / Device Operation / Packet Transmission}
> >
> > +The driver MUST use the same size of the field \field{struct
> > +virtio_net_hdr} for transmit and receive packet buffers.
>=20
> s/field/structure/ ?
>
Ok. will change in v3.
=20
> Thanks.
>=20
>=20
> > +
> >  The driver MUST set \field{num_buffers} to zero.
> >
> >  If VIRTIO_NET_F_CSUM is not negotiated, the driver MUST set
> > --
> > 2.34.1
> >

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

