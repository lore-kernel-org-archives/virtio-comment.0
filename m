Return-Path: <virtio-comment-return-9073-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7C9C4828D
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Feb 2024 17:57:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8E5BD2B148
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Feb 2024 17:57:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 67A639868CF
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Feb 2024 17:57:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 526A798686F; Tue,  6 Feb 2024 17:57:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 42EF5986875
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Feb 2024 17:57:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obyOy7TrzoZU+peTGu6tRa7yMz9A78TBxyPA8XzJyfJLTbc8fNK2kVC6KbnSIJBSAQXoIdB3oTMQvQz7IjqZwdLaM7UNDGwXKfc+uxqZDwlgiRSJANep34CymG9XbjIgPdhymjsB8w9ktMaStnkCy7xvzv9Tm1ECAjHiqM4jOZQe/wxOgPtfJmfBvpW5E8SD5xqIXqtJGHw4khtCh9aP+q5E1MyBq2YC9fCN10cf/5NaDgD32upJlklCYlx5Q9QJEn8fn3dy5GImslN8KPt182j4GQkVwdoS8xtnZKxPGUT/B8Ib9+nfybYZJOOEiT/j1S9ymcK1aY3gJTrs+QvmRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mj7qWC91Psx7s8mxijDlP+VyD1Pv0yBsssWj5+Ep8ok=;
 b=B45wtO612xVK1R+9SW8fbfEhnA+gVe9Ka3O+QcIDRiqrS6MKtBUJxEXdvFODBFqv2hdLKNOr1eOx2zqZCBCKpXd6czbeQzmg8Sz5EeqBP/K6dgiXcM9aq/kR8WM8wHQEbUHiNyduj3H5eSikp5Fsdd0VO2+OL6JxKE94+1/zhF+fXGwFqi6wDpLi5nlu77Qqha/sc/p0Jsv1ipJJpG/6Bv5MWBByHJ8ORHDlEL5BNOs6al0jZeT4z3kw5aXweMNelNMOKQgSRpHLns52l2Kx1aKumr5K5LMqMSnCDHDsDMZLIM3oWIjWU9lmN+L7mAa4B5JhXxoCfhdiWyLf2YsZqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"yuri.benditovich@daynix.com" <yuri.benditovich@daynix.com>
Thread-Topic: [virtio-comment] Re: [PATCH v2 1/2] virtio-net: Fix receive
 buffer size calculation text
Thread-Index:
 AQHaR5W52J2qfmVC+UWFja2twvUrIrDbFOyAgAC4IFCAAHrbgIAABXdAgAAVRoCAAAmUcIAABKkAgB+NYwCAAAxA0IABotmAgAAO5wA=
Date: Tue, 6 Feb 2024 17:57:16 +0000
Message-ID:
 <PH0PR12MB5481BE24819A73918AAFB57EDC462@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240115093141.3539316-1-parav@nvidia.com>
 <20240115093141.3539316-2-parav@nvidia.com> <87r0iimtrg.fsf@redhat.com>
 <PH0PR12MB548114CE959557968F5124D9DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87o7dlmtgo.fsf@redhat.com>
 <PH0PR12MB54815BB31B88DB812507A8A4DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87le8pmp16.fsf@redhat.com>
 <PH0PR12MB5481E369486C3B9DA686CF74DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240116082825-mutt-send-email-mst@kernel.org> <874jenj5vf.fsf@redhat.com>
 <PH0PR12MB548197C15EB3731B7012F9F1DC472@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87bk8til0a.fsf@redhat.com>
In-Reply-To: <87bk8til0a.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB9344:EE_
x-ms-office365-filtering-correlation-id: 1e28ebd7-2085-4f67-d3a9-08dc273d0e08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 y1vLuWMANkvbVBaNCW/oBdKUDGFW4OU64ZG8mL5Rr/DPdeVP+tGdZ0ryBtBTPrZIJMozzKRl0vlsW7lHHBFrK1pENYwqnIeNknOpJcfSkf4fc90J5k3ee0jHUMUVd4a81ai/+30hIGVBDGApImR2j+PM2zI5/K8XIaAmlBctrKa22Sv7oOlWU/Uf/X/blNY3rAjlgqD17cw7ZoFx8eTqGfhuGNIi8bdC/JIUQaH6fcKIESpUAne97OudRNcfO7r1eOV0YEI430YOg1xCfMhaU9bZ2nSGwafAGdoGHeIBen3uEgrAwph49/Aq/fnPlccia6xhtzYhNETojOxfNplxENgAQw3Q0z9fqDsuo1YMhuafHMk0M2aJQXUNIJgWn57UfovVKa3bEnndyUvJp+Ggt9uMYXyXuLxu082H50laKibeAAY15c7upjrdDMUq1a04YC8P6Mc3GxE/9z3IybDHTduAvq+Xo6wOonokBjzqWMo1Cba0BbZAuDOaeC7HKNSqeS8f9Ld+VvOdNYW3yar8fLLRHEDrcVNkhlrmCz2uHRCaFFWwVQwDgviCwk3oKtIfZUr+r0FUg7giCUTyvzvJ+KceFf9sLKrLS8pHCp6mzvZgDXKXoMEPZaL5Bcpu1LT+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(39860400002)(366004)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(478600001)(53546011)(38070700009)(9686003)(7696005)(6506007)(41300700001)(122000001)(26005)(86362001)(38100700002)(33656002)(71200400001)(8936002)(4326008)(66946007)(2906002)(5660300002)(55016003)(8676002)(52536014)(66556008)(66476007)(110136005)(316002)(76116006)(54906003)(66446008)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nzinxOiGCSU57Dl6tzVCMuWfUTXNDR0nAQq5C8AenkH+5sKGGItl2tZgtM8O?=
 =?us-ascii?Q?RVPlrz/PtZNZIdl1IwuXZyoxUuJ+jjrWk2UpN0QZez3ji4D+AHZH/+SkWANz?=
 =?us-ascii?Q?JWVCTtEF4zt0uYQ1k81KHdjHU9/NgsR8/NGCy7dTLq5XqLshJ/JH0U9jcB8D?=
 =?us-ascii?Q?rdjUvtW4XqUxomIulBDBya6AYK8oHnZT9K+eNJckVFsTzRgBNCiRY9wZdRDg?=
 =?us-ascii?Q?xZ77De5nZzWja2nCat22+FO4IA4j3NaA3peGRsRnY0qGhdG2ZumXtxaKInbm?=
 =?us-ascii?Q?oJ52MoP19Im+POACMxHYmBb6dzFyXAMhFdxIhLW0dfkh4aP2qWOS415c/DWQ?=
 =?us-ascii?Q?JXVk6lwqsaJgNU8wDdJtcByQsFP+MLsiu2/sJ0tHjBKcAgBndAV/0xhX84zs?=
 =?us-ascii?Q?SnWvW3YuHvuGH6HY9giwNg16n48lq3cKuMwLchSuXtkra92zP9txJAXN78S7?=
 =?us-ascii?Q?0DgY8beae1P5qHus0yyYCaNrndiet+wnHZhEEVZYN35xRhSSCWx3EW77D1Fc?=
 =?us-ascii?Q?Lk5LHWwAdCmBZG+KNCN/FRH+v9Ej6jsMJJCk2XK5LlRXkV+qlkzGenWiHo6v?=
 =?us-ascii?Q?DedYPSJHjUTCLse8vp+1ceXZxK09HwAem3GYI19prt0/U+kKtv4CAhBOrLDQ?=
 =?us-ascii?Q?UjbcY658IDcWIMQ/DuTsIrelNjiBNHsHSCNW2YSSJGS/tQyOtF2Cv/KF/ij7?=
 =?us-ascii?Q?MwKeGgFwx2b1nfRgJEnEDUDF+FeNrRvdyc0nWF4G8ik83C/vxIRHeOxKh+w9?=
 =?us-ascii?Q?oPFcelEB9+1i5IlbWWakb5i6sobd4i3p8c1QZAyNsdVNM55VO1WJ7oFXA/uH?=
 =?us-ascii?Q?aFSftkms9d8TSOdxeiFMhdzfIsM1lbIjajIWfn0VniWX6VZmB4it8xVb+xxv?=
 =?us-ascii?Q?Q+jbC3FRpz5FaRAg+Jgsbo/YHFbeSb59BjFrGYPiWcJ9GrWNiCNib5Ayt1T/?=
 =?us-ascii?Q?QaIMml2KY73LhB/Oz8yO0j1gUunqn8C+ugn51ITi7AgRHa6bfoRhVjAgSufz?=
 =?us-ascii?Q?dQcN3Kkd5hUXJW8VidVX4J4nhuykpEZF7oOSt0LMYwNWdlEiuJp42Z/l3SYA?=
 =?us-ascii?Q?C6YcFN1EYwfMaUgo1t1zIK6wwOLWn6wbG8lsJucvVBpZCJm0KQKmYA28f3Na?=
 =?us-ascii?Q?Ic0qH3NJeD73YEOkYbd7u1v+YYhHGOkRJjkpNTyWkBhlluXffsupoBR5zO6c?=
 =?us-ascii?Q?TQqEi3bZUODvGb30aCzNeqkm3nGlIxSUaAvVvHt5YeeZZossaKOh20UiRFcP?=
 =?us-ascii?Q?50/QAmaTrltlULY5CtUgxCEFYNq0fn+g+eOcNc/88RqCe5822F96yLBs7dEg?=
 =?us-ascii?Q?DHAe4//DxWID7oyEy2lJAxws2Cs6TbtOcebFaPdpmnWlNFmb8KOCEYlEh5ME?=
 =?us-ascii?Q?Dfxh93RFifPcBGgzjdpZMsk5smoEERb6NM9sat5kApiJSKhneP5T20d/RcVL?=
 =?us-ascii?Q?WHm2ez5iOZmmkz/D2XTbvCkVaRNdT2tSTR/NkA1f10uG+k1Xl4RE/8ahZudZ?=
 =?us-ascii?Q?P+tvq3aGDZ34ngphqoKebN0vWphcyISfCIfQLJBvaXfNFwNonRdJzesqoM+N?=
 =?us-ascii?Q?IKyVCgvpvSzaS2hbYyQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e28ebd7-2085-4f67-d3a9-08dc273d0e08
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 17:57:16.1430
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XY5ioIs+qi/7T2d9i4ImFwE66nFX9fQZJpOebTJwLe6RpXs2nBtFQAFxrPJSou0N9fhC64QsrC6p7d45WUz4aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9344
Subject: RE: [virtio-comment] Re: [PATCH v2 1/2] virtio-net: Fix receive
 buffer size calculation text



> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Tuesday, February 6, 2024 10:32 PM
>=20
> On Mon, Feb 05 2024, Parav Pandit <parav@nvidia.com> wrote:
>=20
> >> From: Cornelia Huck <cohuck@redhat.com>
> >> Sent: Monday, February 5, 2024 8:50 PM
> >>
> >> On Tue, Jan 16 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >>
> >> > On Tue, Jan 16, 2024 at 01:18:59PM +0000, Parav Pandit wrote:
> >> >>
> >> >> > From: Cornelia Huck <cohuck@redhat.com>
> >> >> > Sent: Tuesday, January 16, 2024 6:08 PM
> >> >> > To: Parav Pandit <parav@nvidia.com>;
> >> >> > virtio-comment@lists.oasis-open.org;
> >> >> > mst@redhat.com
> >> >> > Cc: Shahaf Shuler <shahafs@nvidia.com>;
> >> >> > xuanzhuo@linux.alibaba.com; yuri.benditovich@daynix.com
> >> >> > Subject: RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size
> >> >> > calculation text
> >> >> >
> >> >> > On Tue, Jan 16 2024, Parav Pandit <parav@nvidia.com> wrote:
> >> >> >
> >> >> > >> From: Cornelia Huck <cohuck@redhat.com>
> >> >> > >> Sent: Tuesday, January 16, 2024 4:33 PM
> >> >> > >> To: Parav Pandit <parav@nvidia.com>;
> >> >> > >> virtio-comment@lists.oasis-open.org;
> >> >> > >> mst@redhat.com
> >> >> > >> Cc: Shahaf Shuler <shahafs@nvidia.com>;
> >> >> > >> xuanzhuo@linux.alibaba.com; yuri.benditovich@daynix.com
> >> >> > >> Subject: RE: [PATCH v2 1/2] virtio-net: Fix receive buffer
> >> >> > >> size calculation text
> >> >> > >>
> >> >> > >> On Tue, Jan 16 2024, Parav Pandit <parav@nvidia.com> wrote:
> >> >> > >>
> >> >> > >> >> From: Cornelia Huck <cohuck@redhat.com>
> >> >> > >> >> Sent: Monday, January 15, 2024 10:14 PM
> >> >> > >> >
> >> >> > >> >> On Mon, Jan 15 2024, Parav Pandit <parav@nvidia.com> wrote:
> >> >> > >> >> > +The driver MUST consider size of field \field{struct
> >> >> > >> >> > +virtio_net_hdr}
> >> >> > >> >> > +20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and
> >> >> > >> >> > +12 bytes if
> >> >> > >> >> not.
> >> >> > >> >> > +
> >> >> > >> >>
> >> >> > >> >> Requiring the driver to consider the size of something to
> >> >> > >> >> be its actual size seems a bit odd :) I don't think we
> >> >> > >> >> need this, as the
> >>
> >> My comment here still holds.
> >>
> > It is a variable length data structure with few trailing fields as not =
valid.
> > The "actual size" depends on negotiated feature bit, which is what is w=
ritten
> here.
> >
> > How about below?
> >
> > When calculating the size of \field{struct virtio_net_hdr}, the driver
> > must consider all the fields inclusive up to \field{padding_reserved},
> > i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes i=
f
> not.
>=20
> It's up to padding_reserved with F_HASH_REPORT and up to num_buffers if
> not, isn't it?

Yes, shall I send v4 as?
When calculating the size of \field{struct virtio_net_hdr}, the driver must=
 consider all the fields inclusive up to \field{padding_reserved},
i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and upto \field{nu=
m_buffers}, i.e. 12 bytes if not.


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

