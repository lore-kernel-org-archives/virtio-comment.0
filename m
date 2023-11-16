Return-Path: <virtio-comment-return-8399-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB345C47071
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 09:46:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E9D0C77C0A
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 09:46:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C505E986DE1
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 09:46:01 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A4F64986DD8; Thu, 16 Nov 2023 09:46:01 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 93E25986DD9
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 09:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2JxIkPqJvDHlW6gvD78BAdTUgJnyZFwW0k8UIl5nV/FeD1mwVPCRSo8aOAT8I2ntrOKLx+PwfbcFs25PurBRh++BUZYEHQA97dOCR69JiyZd97bNK9elA6Zho9VfQgv1QVfItKYE++D4Z0FZkZUNzvND7L3eUR65hJxV2xujaKsRKUvfIpCKOrKt0/sKf20nRnoIa7m7E4UeOsMbMrmD6C+HUEFqu+/NuwQLHBLLoGUh9YkpqiDMDY0GSoi1X2ktPMT3Ihb1XHw5Gyk0npp/6Q3lRl2NfJlanG8NdaTcry6T4THQWB0Utx9aAaoPGzzIQ697zR3lz63xBBz2+A2+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9aRYNQP9YmO0Mkh6PnQIl/v777ZxGIpr/dMhSPWw2c=;
 b=jKMrZcSQn4pYtkMUJn3U8WHfoTlFAdq05ZM1hKwuAXi1fyRV6qPj80+Tkuea5KYIgkBHzC9HVpUUcBHJKzRzEan4dtn50SnYNyMbEJFXVj5dvMJUTfrBvl8ok7/L41PS8hTjLdSQyRJL/YH/ziWYttN9F1pbO625lHvaII+TVBd1OK6FcvQXnnV83PoDOqdpMiPhikYoXSBZ74PsgbzY9xO/Y8CSvG0Bu2gr7d87/lW6tHB1UgAsYtieYpyrXBtLFSUvYDqWigTqUevsCt+KanNdRLG4oaAnaKPWM5tLUqssCaG/BrEPrBdhvjRTOeOMJxWIAn15MteAWapDVtVkhw==
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
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlCAAWk/gIAAN7kQgAF48YCAABlCkIAACTkAgAALvzCABizrAIAAD2aggAGUBACAAABcUIABWsEAgABcQLCAASo6AIAALsiAgAZSfICAAAYzAIABYc4AgAA+ffCAAULTgIAALVPAgAGlyQCAABp/kIAGUuiAgAAFiECAAWL9AIADJo4QgAY+aoCAA+XikIAA3lwAgAAHcaCAABr2AIAAAQ0QgAADOQCAAAA5AIAABMUAgAAATUCAAASjAIAAKRdA
Date: Thu, 16 Nov 2023 09:45:57 +0000
Message-ID:
 <PH0PR12MB5481BDC73288C5BE0E5A92CEDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <CACGkMEsfcEjue1UZmuNs8k65o3HSM94VsweSbWLH3383STR97A@mail.gmail.com>
 <PH0PR12MB548149E1E51DA9C1C094ABCADCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt277yYUHf98dCkypS-PXzu7JrRSVBAQ2cCRg4XzCLPzw@mail.gmail.com>
 <PH0PR12MB5481DB04DEB1A540185ED1ECDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116012208-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811F4CE5686AE4BEA826C1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116013650-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D1A55E02DE4FB63E62BBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116015424-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54816851C613AAC9A34A7FCDDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116020431-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231116020431-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB6693:EE_
x-ms-office365-filtering-correlation-id: c5b443cd-0e25-4def-583f-08dbe688d5cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 LEncu+msajEDXKNiGqqcn4Zo0tlLGuc+D3untBrHUjhhGnbTHJ0eXFIYsHKBYDb4Ui0/jqltiheTqQ99vRScRjE1q1pa4OWZxGmY+5an/pawGxBB3hebtduUD3lTrob1AZtt7NpU2OLfnA9NoG5H0Z7zdDUchwber2K7v6keVt+nHBiBV+bXK5pkPvJ7cNesOj2SHLc79ggu+P1OwcCJM/Rf1Pt8R/SS4HbvWS/Z0fPUfKpuDG2UFLZsC5OCUmUlFnWsiuFbmG8fFL+F2c+1j9/RGpx/qCH1/ts9XyfHA//v6QZF54CCvIzN+moWRBCvv75HxSRRdxZxL3qLGl4MkueVPGmccjtR9Ld3VdHP78iCrfLifF+UmfpYeaVMjNwlc5ZNzyLGY0VBO6b2IZuf+q9EWyOvqlhlnCfJwcYXoJ15XxoJ017u9rDb1Kg6M+6K7kYWkEZH6ToBLDvARpqk1wNv8xN7rlPkgGM3VKF952ZcMclY7Yzj/bMEBat9MSGSu6vK6Ip3GTFb+0d5PswziFYRXu/HDG+RB9PdvD501nzJBW0s7KzzAAHcas+RpMYAzPH5ACmKfmxHqrpaTcwRD79i7a+wwS6oL0auQWgWZlXuOeP04zK6jtLwa4Qo3tPc
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(396003)(366004)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(66946007)(66556008)(66476007)(76116006)(41300700001)(66446008)(6916009)(54906003)(64756008)(316002)(86362001)(5660300002)(2906002)(33656002)(8676002)(4326008)(52536014)(8936002)(122000001)(55016003)(83380400001)(38100700002)(38070700009)(71200400001)(478600001)(26005)(107886003)(6506007)(7696005)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PSbKxV3Yj1E9VsjPoI5Yc8Pa7EeaB0xb1esTlWlfQF0y5nbIszUSe15lJJGS?=
 =?us-ascii?Q?PwoYHbeqSgEyH/eO6mpAkA84jxva7j0GbD89TcG2i0VXzEHz4C29dsqbItmi?=
 =?us-ascii?Q?WSdn6oLUTxH0ujeo0GJNmDtAz0A42rVG+uzdGntuKGvu+lmcGGUpk823eS9f?=
 =?us-ascii?Q?gW25DyIi4FWlAq4Pkd2feY1/oHGSkL+G6PD5/Bg2ASDD+PHYXJnDAz6EhObN?=
 =?us-ascii?Q?W45vttEmKp0z+MxINuJuMvFrDo5fmb4ns4zgi7P2D/r9/9bAxJ18Kpgdj9OV?=
 =?us-ascii?Q?bN4ojdhrZd3W6+R2PbWrjw1I/Ltlm3P7b8RW/FRl0xI58g3mXxK/xjv/aDWt?=
 =?us-ascii?Q?yhCP/O++ZMAB9EbJHnfQrmoQ5wOLr8jk5kORkD3ChdATlmkMQQHVyPDKsAHp?=
 =?us-ascii?Q?pc3tu4xDM/pxubQpGbnYZiqL5pFf1hCz1u13hLaN5mXfxynJshzr8T9ts01/?=
 =?us-ascii?Q?DOzjGo2RVwpMODFQ4kgcrBkgjRQbac+EOW/Hf8gc79mEWdiRlMwnwyqnXU+R?=
 =?us-ascii?Q?/PyFNI90gmCFGPlAsOG4WchWY72IOH5fI834/c1mYMHVI6mLu+SiXL3XuvFE?=
 =?us-ascii?Q?hSCZuRd1CvrLUJOEyvHKcG6FBuKWgGuXog3xHISEfTldmHJhsZVxqMTaIN3a?=
 =?us-ascii?Q?7KYiSc88UCpAa1pU4WwxHF5RuoroKfCuGs5Wf+nnQB3tYLyASPfpaFphaNJX?=
 =?us-ascii?Q?UjP54sBqGucIKQ0Z00saPklsxl8LIk5NzAHC7xJdhbdtUjRiatuwqrzSTO2I?=
 =?us-ascii?Q?0dr2CF1c6FbSUJ3N8Y4BIOmwlaWE6maLqQe0NxS/eyN/tdqmt02mZFUAvFjc?=
 =?us-ascii?Q?E4zvyJxZtotHAFOrdJhUImmtnK8wa9miW9cajZ5PodVaNirUS6eVZHaTgENd?=
 =?us-ascii?Q?0/RQ6FoSaHSww+KL9ZCjKZCIJFfacAKFBzx4vfyNyXaxSL1SpWt6cOqQhHfI?=
 =?us-ascii?Q?l9c5yLqvYJdhWwLXphPJVhLw+XbEsrPwRwez8OoAUuT3rie8rwSa6vLf/K+I?=
 =?us-ascii?Q?qwLZOFFuEhbCgLbzoasv+CT9YO/8kUY/LLzjnpMle9O4sRA3w3t04TtvQ+eQ?=
 =?us-ascii?Q?HF4d8cFAUBr/fJw/VfM34TAZFvsokvQbfjDmPMQJbOc6lJyV9Nsyv9eYqZns?=
 =?us-ascii?Q?6yHuWBdxA3tPEW29vWogfkykCDR1DIerx05n9lL9S2GC8gwYfesUjvil/vhm?=
 =?us-ascii?Q?fkosOGNyqrznebQtozWtbHflBvElzGXvkV74Y1R7f5daBEXRregO83uGYajM?=
 =?us-ascii?Q?5gjVoy8LytByr09eRlpJ6LqTuySYlLX+HM/2zucnYrdGDSXPLz6uJ8OVlX4R?=
 =?us-ascii?Q?doUAsbh5FP/VM+BFes6b10zPIerbYfO8B508aTeqoIQ7mmJ8nBNZ1g8ePjoR?=
 =?us-ascii?Q?kbIP/DdqRgNrHZHw0BAmiy+o9scNMvRz2JvbIH3blaRCWRwGbXmL8lv57kNr?=
 =?us-ascii?Q?jpHiDH//bIua0fgshQh++Sx11lYagCf+7kNPPcGyOzBnVKrRNqQia5Ay0qC5?=
 =?us-ascii?Q?AeglKDDRslECWY1XiA4LB9KzofEstxmpSX5zDixR0p40ecNvD6TWT62f3i0o?=
 =?us-ascii?Q?dmaeFrOJidz5qzy7YzU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b443cd-0e25-4def-583f-08dbe688d5cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 09:45:57.9477
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lUDB+OE2tuT37/MvWeb3K2WlTdvSSF/XjX+PVtORqZnQSONt8KDSJgI9pMJo2vp10w/S2Y25r8qFvrvZVpHsIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6693
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration



> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> open.org> On Behalf Of Michael S. Tsirkin
> Sent: Thursday, November 16, 2023 12:44 PM
>=20
> On Thu, Nov 16, 2023 at 07:02:23AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Thursday, November 16, 2023 12:27 PM
> > >
> > > On Thu, Nov 16, 2023 at 06:43:05AM +0000, Parav Pandit wrote:
> > > >
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Thursday, November 16, 2023 12:09 PM
> > > > >
> > > > > On Thu, Nov 16, 2023 at 06:34:23AM +0000, Parav Pandit wrote:
> > > > > >
> > > > > >
> > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > Sent: Thursday, November 16, 2023 11:53 AM
> > > > > > >
> > > > > > > On Thu, Nov 16, 2023 at 05:28:19AM +0000, Parav Pandit wrote:
> > > > > > > > You continue to want to overload admin commands for dual
> > > > > > > > purpose, does
> > > > > > > not make sense to me.
> > > > > > >
> > > > > > > dual -> as a transport and for migration? why can't they be
> > > > > > > used for this? I was really hoping to cover these two cases
> > > > > > > when I proposed
> > > them.
> > > > > > For following reasons.
> > > > > >
> > > > > > 1. migration needs incremental reads of only changed context
> > > > > > between two reads
> > > > > >
> > > > > > 2. migration writes covers large part of the configurations
> > > > > > not just virtio
> > > > > common config and device config.
> > > > > > Such as configuration occurred through the CVQ. All of these
> > > > > > is not needed
> > > > > when done from guest directly via member's own CVQ.
> > > > > >
> > > > > > For backward compatible SIOV transport, one may need them to
> > > > > > transport
> > > > > without above two properties.
> > > > > >
> > > > > > 3. None of this transport is needed for PFs, VFs and
> > > > > > non-backward compatible
> > > > > SIOVs.
> > > > > > Each device to have its own transport that is not intercepted
> > > > > > by the hypervisor
> > > > > and follow the equivalency principle uniformly for all 3 device t=
ypes.
> > > > > >
> > > > >
> > > > > To clarify. Above seems to justify why the admin commands for
> > > > > migration must be distinct from admin commands for transport.
> > > > > But I don't see why (e.g. two sets of) admin commands can not be =
used
> for both.
> > > Do you?
> > > >
> > > > I didn't follow, "used for both".
> > > > Can you please explain?
> > > > Both meaning,
> > > > a. for device migration and
> > > > b. for transporting configuration by owner device on behalf of
> > > > member
> > > device?
> > >
> > > Yes, so one set of commands for migration another for passing config
> > > space accesses. We do in fact have admin commands as transport for
> > > legacy, do we not? And in this model we can have new group types,
> > > e.g. SIOV's subfunction or even a "self" group.
> >
> > This is only need for backward compatible SIOV device.
> > And I am not sure if one should create such or not.
> > In some internal test we see device and platform tend to saturate at va=
rious
> levels beyond a certain scale, due to which building backward compatible =
SIOV
> is not very useful.
>=20
> > For non-backward compatible SIOV device, PFs, and VFs all the
> > configurations must be done directly from the driver to device without
> > mediation layers as listed in above #3.
>=20
> /facepalm. You keep bringing this up.  There's no must here because all
> hypervisor have some kind of mediation. Whenever you have some solution i=
n
> mind you immediately brand whatever it does not do "not mediation" or "ou=
t of
> scope" and whatever it does "mediation". The distinction does not matter.
>=20
>=20
> > Hence, there is really no point in doing transport VQ for future.
> > Each device doing its runtime configuration using its own transport met=
hod
> solves scale and security both uniformly across PF, VF, SIOV.
>=20
> Yes, there's a point.
> The point is that low end uses of virtio dwarf the high end scalable thin=
gs you
> are so preoccupied with - understandably as representative of a hardware
> vendor who wants high margins. This is why we need to keep simple things =
in
> config space and this means that yes, we will keep expanding config space=
. And
> this in turn means that if you want to do things over DMA then you need a=
 way
> to access config space over DMA.
> This way needs to use *some kind of command* and maybe that can be admin
> command format.

The low-end uses can always use the comm and interface anyway as they do no=
t care for power, speed, hypercall, scale efficiency and security construct=
.
And the sw maintenance cost this config work is so negligible compared to t=
he rest of the problems, it is less interesting to do config space anymore.

We have debated this many times, Michael.
I also explained in past that config space over DMA has provisioning proble=
m that the cloud admin does not know if VM is old or new, so it ends up res=
erving things that may never be used.

Hence, endless growth of config space does not help.

The fact is no device is growing the config space anymore.
I will put all the points in the google doc and share one time, so we don't=
 need to keep debating it over.

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

