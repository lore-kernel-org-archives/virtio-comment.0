Return-Path: <virtio-comment-return-8446-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFC5C5ACB3
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 11:05:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B8B3194EDC
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 11:05:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2DCCF986E1C
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 11:05:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 97D7C986E20; Fri, 17 Nov 2023 11:05:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 224F2986E1E
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 11:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfX8UdQABYzPTjWw6TsvhKI+PdC7pcdbqOB9n0rD0byFYuxyoc7AZiTY7+zkL3aftyGrRSYridXZ2aM4h7eCqOmb+XK7QLRzFzpwRFPJF2VIbdAWurlVJ/YBokSw5VCaukjy8NnBhjQEWQ35BKv5gwPKpKPGpvkE4EPmFbFnw7enyxFDj1XTUZBM59GQiMsh1tg8CS5QUKnvUcj+27kiXjHNByWbbeGJMS7i0/dLePxMLpSxYpmjONPmZUKRSRvAnhKuHGrvBVeYXw/MbZZHBYOfXZ8gUPZk72Go9a6tiGc74qaCGCVv4ClmDC50k0NzUbhkULEiR5j83UVG3GRcXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zoS5zBt2n6+44kGmC07eQtQWI6u5gHOeUmCV0gFJYk=;
 b=Q12+PO6RDRcBsomryGVbhyf18JbNh3Mk//a2whl1PdWyjr98G45Yzl75IIzLQ43VFGP/SBzne7qx/IiW2yTARpVZBqyjqXxVdzu5lKRlNZoSRNizlBoViOzrqazPgvaCDf93nkNzHZZO/Pyx5SGuwTIYtB9L1DBLSN5W7dUBR0Ilw8mYcWu2ak8f03a67kkurDdXvsey8ruYOXFs+CWlVh6L36e8D81S1uCS/1lKWB2AP0AJ2/L+lyIvDzbY3lBpZzkYMkEhG61uPJ8zqPQZTxdLZ4qDpNqLnuD41pp9Vtd6JYQDn3jJUEq/hyZ89lN8l70cl68fs/yLei5JYVqrEw==
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
 AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfAgAGqygCAABTkAIAGWMEAgAADI2CAAWVPgIACFpEAgAdP4YCAA//WQIAAxB+AgAAJgRCAAA8CgIAATUGAgAAZpoCAAXC2gIAAADIwgAAQrwCAAADWwA==
Date: Fri, 17 Nov 2023 11:05:16 +0000
Message-ID:
 <PH0PR12MB54813446F8F2BBDBC74BF393DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <DM8PR12MB5480A4E02DF988BCDD16E7BEDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsRjdg8-YN1GY1fyRHU8UvCthvDgBUzURmTVB4JdbFGZA@mail.gmail.com>
 <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com>
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116004037-mutt-send-email-mst@kernel.org>
 <b0ad9991-4372-4900-8baf-a111777f6d92@intel.com>
 <20231116065416-mutt-send-email-mst@kernel.org>
 <705e728a-368a-4e28-a7b2-61afddb15ce9@intel.com>
 <PH0PR12MB5481C2B37901FDBBE672EF98DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117054650-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231117054650-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS7PR12MB6334:EE_
x-ms-office365-filtering-correlation-id: 18aad51e-6cd8-4542-ba98-08dbe75d14c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 M/EigFIzSZ+AxPqXYXHSFyWhDkSOULAVPTpsOFnLidd7Ea5koBTeJQbfBM9dpv2qDxwsF7reRUOMSip5SVvwmMzHLHKIH9GhCU1ykmbvKnNtmLc2HQCs9qOCzvmVQNXCWUztPpq98j3lrEK3ctopmRqRJ/E/B6ml+pasmiHEL1olmwSuVlo0Q9Voc8WHAUmRb03u5FBNMvc0RJIDVvDC3kN5+L28+ZNLuKRsyxLUpV/9f8GpPOH1Ha57fuGzO/84am9sRupeguTroZURIdOstT166KxMm3N/zBGpCRiBdcY8mAzF3EuBbbqvEA4AnYOwis53yL5uVQtyaOGU8dnk1pdBu1lfn4j1BxluOBBGtOdtpr4LIHwljWERHMAHtnnXsqdmyO51j0Ur1YcBxoYf549KX6cVNCjHsJALaGiOtl7N9CQ7XDmEaYNRS9NOwyGrpeB4KrGIpYvm7Y32FLbOJLJscsBHxsc7a6QP6btLvBuUXe0Prd4PN7XH1rnJUMsqhczbbOhce6H7HrB20/d813MAMa7F9ZVByAwLJ9YJ5pwghr+fg5XnJEGtrBpfgAZ1wZiOFgUUWot6OCclnem/sm0PTwJJgRWt4OCO/UX5D2Nn4X02O9PUHRKIUJpCQF2NW0PMyOsQ0pNG2iZOg8mtV3F2uzNGIaQQXAjp6PBf5JfbKjX5TuGUlI94DdaVX8PN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(39860400002)(376002)(366004)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(122000001)(55016003)(38100700002)(5660300002)(2906002)(86362001)(52536014)(8936002)(4326008)(8676002)(41300700001)(316002)(6916009)(64756008)(54906003)(66446008)(66946007)(76116006)(66556008)(66476007)(83380400001)(107886003)(26005)(33656002)(478600001)(53546011)(38070700009)(7696005)(6506007)(966005)(55236004)(9686003)(71200400001)(69594002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vy5JdH1EB2/9p6d2grbGTsMLIzSPZskuhQ5Spa9P75B28szU7ljfDcdLnfWO?=
 =?us-ascii?Q?UAXdPglVXS/Ny04nEbz/AfCIZRus7X2xfP9J4slTGhygSbXMkgt+7zcz4OdY?=
 =?us-ascii?Q?AJlCjp24PG21Oo/wFZqRQKtEesJmS1AjvhN533iNtIsSIkQ801tXmZr1lQWt?=
 =?us-ascii?Q?OmIlRt8pyCMXZkd8rXWcvhRYWg0e/x8Qzu8XtRgGJPoSOFyN48u7XIJRBIVX?=
 =?us-ascii?Q?+EfIDtCDqHZIiuyWh82XJk7UulWIejiODv7eTohvaTxl6PnhMmmbzy+Oh9ck?=
 =?us-ascii?Q?NrJa7Al9/IzB6TuaxhID3FIfZVuO2n+z3NPce2sewMOzISocSC4wkRBymBW4?=
 =?us-ascii?Q?l+kkRnLb88JUf7fC7j0fSCq2iiJgvFI7WP/S9f52044wLyHzhYrkf3S5L/29?=
 =?us-ascii?Q?gIE/FaJcje1lHd5gfBgph/nkHgmy7B4LyelptK2w/R/Rs7dEHM1faWpzfsMb?=
 =?us-ascii?Q?fHATTJwSPPnnfqRRx4sfaG56khRSrB2KgdF2RJzNjsymyIxs+zGQiS96s8lj?=
 =?us-ascii?Q?Zd8f/2fQuWHP2gIOw8uN84lANP0LxMEID6slMfpgW+IsgiF5u4vvNMAzsYhK?=
 =?us-ascii?Q?vA6SZwBBo6232ppRBI8U8+SYqf5IXoetucR5kSQRsk1UXGU3B0fMt1+XyquE?=
 =?us-ascii?Q?mFnCtEgBmzMp6FrdLUYyrJW895Mq8WLyeu7d+g22/Fj5U8BsS0Hco5uG54nN?=
 =?us-ascii?Q?BHM7BaV7smeSiaiTGGQXHJ5o5odrFTTuu+C2ZnIPJ7uyMPhGcFWz848cC7TX?=
 =?us-ascii?Q?iK5rfH6N7NpufNJLgr2OH/LkMGHiKKcdG4FijHsDcQ4g8y+0DUBDO+zuU9ZB?=
 =?us-ascii?Q?F9MdJvyTVPpxXv9YrjVgGkWWDwh1ZdFhSRzTwlFqvmqR0k72D5xAhZETIhjM?=
 =?us-ascii?Q?u4Wy0Wvlh+Hu1Xi8cNhgu0zhdXnWHMe8821XMXhDi7VfeMlhxR0T3BKnlMbe?=
 =?us-ascii?Q?ccTbgy2GS5cJNiIW47TZ1Cc1Jh3mQlrIcUcWVgA882W+WkV383mTt63cJTAr?=
 =?us-ascii?Q?ptucR4xhjZwQ0LWQj57FLLOTIKzzFSce5q/AFCE7FMe+SJSMQpb7kfnzfDex?=
 =?us-ascii?Q?FdBuy/yJgYo9O5aptsDLGt7OCIX2ejJaizssgmr9obVHyphUDrHmHv53h2Vk?=
 =?us-ascii?Q?iMZNBHIb1+iVYAdom6rjSI2DkhgM8UonW3uWo/zO/MPRNgpmZoJvtx7cEmyG?=
 =?us-ascii?Q?MDEhldXo6WZbnzb0xj6YRvMmuOmhik9ecVXSRG3xQ19ngO4c74pguLkdoZ0x?=
 =?us-ascii?Q?gXBvEkKgjP1MywhTRsWOA/t/uR/ExV97jOYwyA8ZG9CGxMtXRlVRutwKZ6XK?=
 =?us-ascii?Q?VT/+06HLkMr5FN2HQzyjYilBx2fdAyNdA0mBWbCaQEtuFKlRq4YCYH3zpREN?=
 =?us-ascii?Q?rYwyLC7qTZb5U2caNJ5OmOMx/jUhmEgLGaid8xxBPT4M23U9rfzkoQ4by63f?=
 =?us-ascii?Q?q/IKqhW92Ofd97Emx39IyIjoJAaYu3y834InKN3ft5nvozi4ZzxYCYo32QrK?=
 =?us-ascii?Q?at7u9o6OpEoMDOVhoSKrERPtL9K3hci+toRvSmc9N7H6xbsvRlVRExG0GcsX?=
 =?us-ascii?Q?0F+ixvyIuvXr17ZzQ+E=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18aad51e-6cd8-4542-ba98-08dbe75d14c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 11:05:16.9137
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tZBfOm5BosRV7JvEmzDZaHnX6gDPtWxRRbp808vH1bZky2L/owrAOiJGe++KHDfv6ehMkhno99IsWonY2611gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6334
Subject: RE: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, November 17, 2023 4:30 PM
>=20
> On Fri, Nov 17, 2023 at 10:03:47AM +0000, Parav Pandit wrote:
> >
> >
> > > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > Sent: Friday, November 17, 2023 3:30 PM
> > >
> > > On 11/16/2023 7:59 PM, Michael S. Tsirkin wrote:
> > > > On Thu, Nov 16, 2023 at 06:28:07PM +0800, Zhu, Lingshan wrote:
> > > >>
> > > >> On 11/16/2023 1:51 PM, Michael S. Tsirkin wrote:
> > > >>> On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav Pandit wrote:
> > > >>>> We should expose a limit of the device in the proposed
> > > WRITE_RECORD_CAP_QUERY command, that how much range it can track.
> > > >>>> So that future provisioning framework can use it.
> > > >>>>
> > > >>>> I will cover this in v5 early next week.
> > > >>> I do worry about how this can even work though. If you want a
> > > >>> generic device you do not get to dictate how much memory VM has.
> > > >>>
> > > >>> Aren't we talking bit per page? With 1TByte of memory to track
> > > >>> -> 256Gbit -> 32Gbit -> 8Gbyte per VF?
> > > >>>
> > > >>> And you happily say "we'll address this in the future" while at
> > > >>> the same time fighting tooth and nail against adding single bit
> > > >>> status registers because scalability?
> > > >>>
> > > >>>
> > > >>> I have a feeling doing this completely theoretical like this is p=
roblematic.
> > > >>> Maybe you have it all laid out neatly in your head but I suspect
> > > >>> not all of TC can picture it clearly enough based just on spec te=
xt.
> > > >>>
> > > >>> We do sometimes ask for POC implementation in linux / qemu to
> > > >>> demonstrate how things work before merging code. We skipped this
> > > >>> for admin things so far but I think it's a good idea to start
> > > >>> doing it here.
> > > >>>
> > > >>> What makes me pause a bit before saying please do a PoC is all
> > > >>> the opposition that seems to exist to even using admin commands
> > > >>> in the 1st place. I think once we finally stop arguing about
> > > >>> whether to use admin commands at all then a PoC will be needed
> before merging.
> > > >> We have POR productions that implemented the approach in my series=
.
> > > >> They are multiple generations of productions in market and
> > > >> running in customers data centers for years.
> > > >>
> > > >> Back to 2019 when we start working on vDPA, we have sent some
> > > >> samples of production(e.g., Cascade Glacier) and the datasheet,
> > > >> you can find live migration facilities there, includes suspend,
> > > >> vq state and other features.
> > > >>
> > > >> And there is an reference in DPDK live migration, I have provided
> > > >> this page
> > > >> before:
> > > >> https://doc.dpdk.org/guides-21.11/vdpadevs/ifc.html, it has been
> > > >> working for long long time.
> > > >>
> > > >> So if we let the facts speak, if we want to see if the proposal
> > > >> is proven to work, I would
> > > >> say: They are POR for years, customers already deployed them for y=
ears.
> > > > And I guess what you are trying to say is that this patchset we
> > > > are reviewing here should be help to the same standard and there
> > > > should be a PoC? Sounds reasonable.
> > > Yes and the in-marketing productions are POR, the series just
> > > improves the design, for example, our series also use registers to
> > > track vq state, but improvements than CG or BSC. So I think they are =
proven
> to work.
> >
> > If you prefer to go the route of POR and production and proven document=
s
> etc, there is ton of it of multiple types of products I can dump here wit=
h open-
> source code and documentation and more.
> > Let me know what you would like to see.
> >
> > Michael has requested some performance comparisons, not all are ready t=
o
> share yet.
> > Some are present that I will share in coming weeks.
> >
> > And all the vdpa dpdk you published does not have basic CVQ support whe=
n I
> last looked at it.
> > Do you know when was it added?
>=20
> It's good enough for PoC I think, CVQ or not.
> The problem with CVQ generally, is that VDPA wants to shadow CVQ it at al=
l
> times because it wants to decode and cache the content. But this problem =
has
> nothing to do with dirty tracking even though it also mentions "shadow":
> if device can report it's state then there's no need to shadow CVQ.

For the performance numbers with the pre-copy and device context of patches=
 posted 1 to 5, the downtime reduction of the VM is 3.71x with active traff=
ic on 8 RQs at 100Gbps port speed.

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

