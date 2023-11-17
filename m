Return-Path: <virtio-comment-return-8455-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59945C197A0
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 11:45:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A30EF1922EC
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 11:45:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 81C52986E1F
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 11:45:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 71A7D986E1D; Fri, 17 Nov 2023 11:45:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 628DC986E1E
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 11:45:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZU5044dtwegKNkFoAd1yxeigzbQYJNB3rtHjZY6NGyoGJ4N3j9zRlcsHRPsQM9eNcWYlplSooacYIEZE6BLc8xKujAqgtBEK5vKyLgXMtEhjfGEqJmonUc2rxjw9n8tbkLMVKqDxmku4/Ob7MATGHEKJSLhrbkvlloQAjwiMgm8bK77M2MSZRKansKqaHm1I/2UllAJzjO1pJjh9k4sVGRoIbC+e+7PNXKpbW4bsR6DpGOOD41R4NX+GjLp/Q+CrsMLeh9cBvuDYlkygEM3tYrOTH+VwBonAg8pMjhh21XKLv8Lqbt1eoLWVMVhVaQjtdjisJI5mm3Tr+fap2XMyGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DDeElDoLEKFfWlYBfxdWG8P+a6pmdBZI2KiOM+IZ3N0=;
 b=UpXS6s/dkrHpupNlTnYjwKF4xPNVh3aB3Y4LPtGrgdOQ397t1f1PAwO+XH51IJbIZeZlDtEjeUxME/+1hTxcgjXj7RKzLLBav3z2v702tonirth1ItkM4OM+oBWu0RuvvnKipgu057uIdY4ujn00LWqp08NTTWN3hrfR56pm+8Ng7Cn0uJofPISnh7wVy83OVXWlCfr1EOI8J3mDXoSwWPLnB+HVZiqNiN37gz8Y0jZSdwmUJtGORFQIqDE9tKDHyWHg9nMV/2x2j57lo9Y1yhQD+MqY8YG5Wwzx7D+ldD6kOSe9LtaHwckqSVyDaZPI8Qq16Xe8Oqrj80Ng1RZtpQ==
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
Thread-Topic: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands
Thread-Index:
 AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfAgAGqygCAABTkAIAGWMEAgAADI2CAAWVPgIACFpEAgAdP4YCAA//WQIAAxB+AgAAJgRCAAA8CgIAATUGAgAAZpoCAAXC2gIAAADIwgAAQrwCAAADWwIAACKCAgAACIJA=
Date: Fri, 17 Nov 2023 11:45:20 +0000
Message-ID:
 <PH0PR12MB548179702B4F7B460E09681CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com>
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116004037-mutt-send-email-mst@kernel.org>
 <b0ad9991-4372-4900-8baf-a111777f6d92@intel.com>
 <20231116065416-mutt-send-email-mst@kernel.org>
 <705e728a-368a-4e28-a7b2-61afddb15ce9@intel.com>
 <PH0PR12MB5481C2B37901FDBBE672EF98DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117054650-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813446F8F2BBDBC74BF393DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117063304-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231117063304-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB8648:EE_
x-ms-office365-filtering-correlation-id: afb5bc5f-0e86-4ee7-b2d7-08dbe762ad65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8S/RjayBvmOHII5UJezZdqoTmwIzKXHmnpULdwmBDPJc//NX0q5mbPfBqvGaERDl7f7fpPzw0ou5d/913hL5/iEpGUigEIavsEWj+pJ2NPduUKLNu/cQlPS/Zp2+X0B9Tk0iRMN2CQPkD0vwNIlbfU7n0h3qp3UCbQRsJcyDffUxljTRktd7uBfu1Ur/XGxspZBF5PPdexIfZUg4HejnfaXAMQJs0+LKk9lkite739aYFKtcsfazW96eqd0KQLicGUPTXw63zwkWRutjj7IzpyNm2pm8GoQDPV12Kozil8uvQhXtax2eDW0IPyEuZO2N2m2eSmmySqLm6kVQilSpsu9q5VaeYDS5DsCyBOW3Uj2SlCB7GT23ZTK0Xz2UlcKDD9VQeJ6+T+l0g1gd4IbdpJACuHzFFk/gOTZf/jAf9q/FnVOsn4lXre68Nf7h+wnkQTrRwrEIYEAnXDm4tr93iY5uth7CT+j42rqKZECP+pq0orb8ao71BrkwzLKB8vz3S1h9I5RMyAkfzwAuVkOtxCYKnHlf80xEYDbspsjd+iOTLBSNSXxqECM0qbbjJBj/8h2zTZ4tjjyOZG/MU1aksbJVlI0VQQHw6AHzJFMrRBLlxRqYkK0oOakG1026M9nVqTwnX2a63Peya63nfNbNC47x5M9IeujOxfAAoLF4cf7tikLvQaW93PyPhu86bObd
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(38100700002)(38070700009)(122000001)(55016003)(83380400001)(26005)(107886003)(9686003)(6506007)(55236004)(53546011)(7696005)(71200400001)(478600001)(966005)(86362001)(5660300002)(4326008)(66446008)(66556008)(66476007)(66946007)(76116006)(41300700001)(64756008)(54906003)(6916009)(316002)(8936002)(52536014)(8676002)(33656002)(2906002)(69594002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?n7IBIt6MHMr5dB2bS49cy2bAxRcAuRqi7OE77w8PWMvtvrR0UWiql2hqSAS5?=
 =?us-ascii?Q?exesyjakC/uBBLSG8sug+B93X3xQOiPslZhc/+sq1gB1GlmNRbtCqoJ7zF7c?=
 =?us-ascii?Q?3tP1AXuXkPqj4KucVmsy83pExgffqsLTU4X7DBsflQrqJOkmiZw3LFHY8Fap?=
 =?us-ascii?Q?UH/Unp0HdwjlZZ/WodWA50cPz/c2VuxSbt6Z4N2kGpqJNpvURmWUIDirxW0S?=
 =?us-ascii?Q?ZF0Et1h0CnYOYgPLeGhXAxye+ieXMwzHRTa+BjKmGK60Fvu57e6tN0rSUyTE?=
 =?us-ascii?Q?jG3r2MgEnVunGkk1U7mjhJ2+yHAb3LA+wrO5o/cEFL1pzVGObVNbhJCyfTLr?=
 =?us-ascii?Q?lu3m0I3gjMjoqbuaWBeLFo2or+AeLHIONdPSBAqi8C9h8bS7lssEacIjHTao?=
 =?us-ascii?Q?la5whKQmXPvH2neUZDJyOp2Bts6OFOjMgtPM+ygtDHAtP9IbqBwgO22a2NYJ?=
 =?us-ascii?Q?FOagXI+M173LLmcv9POTVfPlfjfCv1l69Qk4BxhTNdzittR+LGMOHFLaenvH?=
 =?us-ascii?Q?Xd8/INPoh8Ueo5ET8468I5QM4kc1CqF3JxucbeBctq7oX+XCzWfoqlGeE1CW?=
 =?us-ascii?Q?o2mkxbYesHV1lQ81jXok+/kZ9lLApX8fS6rWWLR6XIYf+3nb8Qfb8dh5DGWG?=
 =?us-ascii?Q?TEdzdz2IJaceE+Egtp8k0W3eKoJF3neIhAkodctOLpqSnyby+AtA2vQNVv/z?=
 =?us-ascii?Q?qDPqSEbM3t96aeO/L+nwwFxAQyN9enyRXU5xS8JwSIKnlOPgz6Mv9WqbmLbJ?=
 =?us-ascii?Q?OJB5OwLbRVxbFR8tTuDSHJQ+ipO/jAepMKq2Axw7CYKbLuQ8m3SgjBY+/VUm?=
 =?us-ascii?Q?bS4sK5zim2VTrYiEVPAZ1ct7o8NlNAngNoA4L/bTNvlOS7qLM+HXUKtyrktZ?=
 =?us-ascii?Q?1wLDPxyAfVxPhltVQxTdo8ILJVjYREtGYMJEvUxPkfejAU1kUF5xYEmCicPf?=
 =?us-ascii?Q?Wec3+75Bntkda1EIUaIX5/PjgJFFwgn4DHmfJFoTVAOusx2xoKgv5G6j/a62?=
 =?us-ascii?Q?TGvgJ0t6dJwoJH45qzIxZcI9xpum/nDMdZR+I3BbWheFCzUShh4wyD1uHo8a?=
 =?us-ascii?Q?JTSBi6T1lUQAX0O78Cxf9wLhZRU6S29Lu5ovEi9CpJLxJfkQLkeUMswTWiKl?=
 =?us-ascii?Q?Ne1xgzWUqPhyeJNFBdwPtrn2u0cmd2z1MCOpHCw8grHFRGgAbqX/Gf2JIHSP?=
 =?us-ascii?Q?309vk43vSc8XjXLLRUPw3k1r0Dw9AYfWNkAkQNqwiRXp2dWzgqbUp1qxdget?=
 =?us-ascii?Q?ecjSJsc7YJDkLJMBehgVagtmovjBDPp0H1h5QVGw7vJZuk+VE4V2A0ncj6o9?=
 =?us-ascii?Q?l6aBIDGZ1HgIWoHwWLSE8aqfmJpFwy5WXrnf5ZVYONuXshIDr9E/ZJa5cKfq?=
 =?us-ascii?Q?LztgvdjXf6/ZrUFQJYWYlkmqG9u64HG2rVvuyIVry6wof/51E1TNXY3qCyuL?=
 =?us-ascii?Q?v51NKHdRaQ1uVZLYz7GqFIpEDFmJ0jPfqEx1CIsvQmUzBuzLn4VyXXkxu9Uf?=
 =?us-ascii?Q?YOVv5qlaBOfND98GyGOcWLnDMfyvDxDmzkx8IAtML4gadfsR7GZDeKa9Pt0/?=
 =?us-ascii?Q?IRqNrsHEVHk8A9syP08=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb5bc5f-0e86-4ee7-b2d7-08dbe762ad65
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 11:45:20.4893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iDewBwTG2tqvf76m9KPUHUHfU+knurV04UUnYojEg7uTadrTOys/u9b42gman+JRVcdr10bAhcYLqXdY5uSHwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8648
Subject: RE: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, November 17, 2023 5:04 PM
>=20
> On Fri, Nov 17, 2023 at 11:05:16AM +0000, Parav Pandit wrote:
> >
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Friday, November 17, 2023 4:30 PM
> > >
> > > On Fri, Nov 17, 2023 at 10:03:47AM +0000, Parav Pandit wrote:
> > > >
> > > >
> > > > > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > > > Sent: Friday, November 17, 2023 3:30 PM
> > > > >
> > > > > On 11/16/2023 7:59 PM, Michael S. Tsirkin wrote:
> > > > > > On Thu, Nov 16, 2023 at 06:28:07PM +0800, Zhu, Lingshan wrote:
> > > > > >>
> > > > > >> On 11/16/2023 1:51 PM, Michael S. Tsirkin wrote:
> > > > > >>> On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav Pandit wrote:
> > > > > >>>> We should expose a limit of the device in the proposed
> > > > > WRITE_RECORD_CAP_QUERY command, that how much range it can
> track.
> > > > > >>>> So that future provisioning framework can use it.
> > > > > >>>>
> > > > > >>>> I will cover this in v5 early next week.
> > > > > >>> I do worry about how this can even work though. If you want
> > > > > >>> a generic device you do not get to dictate how much memory VM
> has.
> > > > > >>>
> > > > > >>> Aren't we talking bit per page? With 1TByte of memory to
> > > > > >>> track
> > > > > >>> -> 256Gbit -> 32Gbit -> 8Gbyte per VF?
> > > > > >>>
> > > > > >>> And you happily say "we'll address this in the future" while
> > > > > >>> at the same time fighting tooth and nail against adding
> > > > > >>> single bit status registers because scalability?
> > > > > >>>
> > > > > >>>
> > > > > >>> I have a feeling doing this completely theoretical like this =
is
> problematic.
> > > > > >>> Maybe you have it all laid out neatly in your head but I
> > > > > >>> suspect not all of TC can picture it clearly enough based jus=
t on spec
> text.
> > > > > >>>
> > > > > >>> We do sometimes ask for POC implementation in linux / qemu
> > > > > >>> to demonstrate how things work before merging code. We
> > > > > >>> skipped this for admin things so far but I think it's a good
> > > > > >>> idea to start doing it here.
> > > > > >>>
> > > > > >>> What makes me pause a bit before saying please do a PoC is
> > > > > >>> all the opposition that seems to exist to even using admin
> > > > > >>> commands in the 1st place. I think once we finally stop
> > > > > >>> arguing about whether to use admin commands at all then a
> > > > > >>> PoC will be needed
> > > before merging.
> > > > > >> We have POR productions that implemented the approach in my
> series.
> > > > > >> They are multiple generations of productions in market and
> > > > > >> running in customers data centers for years.
> > > > > >>
> > > > > >> Back to 2019 when we start working on vDPA, we have sent some
> > > > > >> samples of production(e.g., Cascade Glacier) and the
> > > > > >> datasheet, you can find live migration facilities there,
> > > > > >> includes suspend, vq state and other features.
> > > > > >>
> > > > > >> And there is an reference in DPDK live migration, I have
> > > > > >> provided this page
> > > > > >> before:
> > > > > >> https://doc.dpdk.org/guides-21.11/vdpadevs/ifc.html, it has
> > > > > >> been working for long long time.
> > > > > >>
> > > > > >> So if we let the facts speak, if we want to see if the
> > > > > >> proposal is proven to work, I would
> > > > > >> say: They are POR for years, customers already deployed them f=
or
> years.
> > > > > > And I guess what you are trying to say is that this patchset
> > > > > > we are reviewing here should be help to the same standard and
> > > > > > there should be a PoC? Sounds reasonable.
> > > > > Yes and the in-marketing productions are POR, the series just
> > > > > improves the design, for example, our series also use registers
> > > > > to track vq state, but improvements than CG or BSC. So I think
> > > > > they are proven
> > > to work.
> > > >
> > > > If you prefer to go the route of POR and production and proven
> > > > documents
> > > etc, there is ton of it of multiple types of products I can dump
> > > here with open- source code and documentation and more.
> > > > Let me know what you would like to see.
> > > >
> > > > Michael has requested some performance comparisons, not all are
> > > > ready to
> > > share yet.
> > > > Some are present that I will share in coming weeks.
> > > >
> > > > And all the vdpa dpdk you published does not have basic CVQ
> > > > support when I
> > > last looked at it.
> > > > Do you know when was it added?
> > >
> > > It's good enough for PoC I think, CVQ or not.
> > > The problem with CVQ generally, is that VDPA wants to shadow CVQ it
> > > at all times because it wants to decode and cache the content. But
> > > this problem has nothing to do with dirty tracking even though it als=
o
> mentions "shadow":
> > > if device can report it's state then there's no need to shadow CVQ.
> >
> > For the performance numbers with the pre-copy and device context of
> patches posted 1 to 5, the downtime reduction of the VM is 3.71x with act=
ive
> traffic on 8 RQs at 100Gbps port speed.
>=20
> Sounds good can you please post a bit more detail?
> which configs are you comparing what was the result on each of them.

Common config: 8+8 tx and rx queues.
Port speed: 100Gbps
QEMU 8.1
Libvirt 7.0
GVM: Centos 7.4
Device: virtio VF hardware device

Config_1: virtio suspend/resume similar to what Lingshan has, largely vdpa =
stack
Config_2: Device context method of admin commands

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

