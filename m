Return-Path: <virtio-comment-return-8469-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3F3C197A0
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 13:03:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 23AE578C39
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 13:03:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CBF98986E2F
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 13:03:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A00C2986E21; Fri, 17 Nov 2023 13:03:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 90900986E22
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 13:03:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnq0IAkgrr/UNcgpHquBkdpZFmhy1HlMOEZDFdn76aCweKK6CpQlWy2uim3zo3zpHM+M8YbJzHoHwLrJOvCTI37wqfl3y+3Ax+Mb/L/Vvh1Jdj3jhHklCJb7ZnhIRd2Vw/SuA2BqUQk32GTd8NZyuojBnzMmicCGG4+oxZrmy4e2iCqFcS9SMh2ZzZFyhTXlPuQ58BLCM8DkwMCFBHulaPkxY8zlHBrscEbcIf8LUFrwlmDEYUSaXxbmYHB2FVU+NHVSg04ca1ZBHyM924iTEUrnVh8CZAv4LbBMWS6BWukPN1Z+Sc3zOeadL+ULAJzyOVjj0Og5vexwi4MizzKEeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfCyetRTfWnbknB+QmtOsr9C2wTQWLpjUlzA5MbXTQ0=;
 b=cnobWJpoFiSX97YOJF0x6D6hQi2cSNOqU1OhBJdYB1dYU5NanEkM60d7N2Dd1tx7JR/CKePXwz7sRFNUEpDWLFwapgp4Pfd3uqVtJ38+zaZQ2kCpgFmZS0Dqc7RCf/JCwTskl1B7Hw5lT9c/Xt95CUpJvvSdeDvkJLYtcbyJHqZmLxtQ4DQtphhu1I5XLXZkITJNPULoIrP76kCI/qCP3RPGQxcEjPjnaZwEf+6tFR+9dvZcuYy+ztkhjvr+ptk3oOSLrBRuAYGk3+Xa4qiY5nuikpGvEKCA47/fob6KBPAE9vAHt++amQtCgW6HZ2nPIkdOYtJOTKGsuxXDlbkQmA==
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
 AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfAgAGqygCAABTkAIAGWMEAgAADI2CAAWVPgIACFpEAgAdP4YCAA//WQIAAxB+AgAAJgRCAAA8CgIAATUGAgAAZpoCAAXC2gIAAADIwgAAQrwCAAADWwIAACKCAgAACIJCAAAaJgIAAAShQgAAGigCAAAhMwA==
Date: Fri, 17 Nov 2023 13:03:03 +0000
Message-ID:
 <PH0PR12MB548103A393411CF8357B85DEDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <b0ad9991-4372-4900-8baf-a111777f6d92@intel.com>
 <20231116065416-mutt-send-email-mst@kernel.org>
 <705e728a-368a-4e28-a7b2-61afddb15ce9@intel.com>
 <PH0PR12MB5481C2B37901FDBBE672EF98DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117054650-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813446F8F2BBDBC74BF393DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117063304-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548179702B4F7B460E09681CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117065740-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C905833821171814CB13DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117073031-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231117073031-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CYXPR12MB9338:EE_
x-ms-office365-filtering-correlation-id: 286e19c4-1591-4ee1-db36-08dbe76d8907
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nREl//qvPHb3Kcipcmrr0JLl+1IQP2tkJs74/tlrhgph3ZWrZZalIXcB65KQ2PBpUJS8HLEv0KMS4z1LxGWnCBvP/I4PqV/dWx8cB3sU7q5jgntCO3hLiVcQ4PWl9HtjhWqVU+pHxIpS6yvrgTuEx+90/6Dk1wFMlCHqqKRgBg7IRlq7vcpFDFMzVWaY9wVq7jcr1TzDWRmuVvvLOsrYhD0jEbk9/fHMDe4fvklxy/wN9uHAO9pR48KQe49/Wapd7IsOLFbGwUY0fB74SvQi9Bu//zGk8b/NdiyN3lCnMCAVmnLHiY7x/CLIPjNYZ8PdvYg0F9C/+3C1ueFvXILFSEIlxvqnmWdhYwZQrRqCOLDR0Bx2Dndc+1qPkz2LaXPKkBc3pZSm8Ugz5vYIBUOJGArfD+oJeeyKklZZUvANfeS7aHWetwOxc1AYNb7O0LqoIS1aFCx+MD50SRF5AxGVXu/HIDow1Xer1ghKIsm/zAENPhHy8d5yZeFwx3XpDi+gX6iys/WhXOqYlttPDwLtWLbiXmoqjVMkeIlF0+FJbY5e/tIIEVwefWWy+m2MC8rk3KW+laBlPVVXrFRHgsPTB+vyb/kjcI+jqZvbsT/wQmQwjzhkyC1hGV/gJuOZewqnDit9UDpXL4KJe9NGNofT1Wn6IkeA5quuEqhFSIsJtboNPFux3rt/Y966hCyz3uAe
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(366004)(136003)(346002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(5660300002)(55016003)(2906002)(52536014)(41300700001)(8936002)(4326008)(8676002)(316002)(6916009)(66476007)(54906003)(66446008)(64756008)(76116006)(66946007)(66556008)(86362001)(38070700009)(478600001)(26005)(966005)(107886003)(71200400001)(9686003)(55236004)(53546011)(7696005)(6506007)(122000001)(33656002)(83380400001)(38100700002)(69594002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rbj3kZTGHy95k9yEYe1T6yRNtzzSpP9QDwjuL7uby9zZvoFobkX0T97FgoVD?=
 =?us-ascii?Q?A7XVClm63mkHY19twKgvedpe2rIZwL9zQ7L+9X6MIR/9ycv6PjFLyJiLKO+9?=
 =?us-ascii?Q?tUQ8CmEFM//qvxl7wNSWMoKeJrUhxpIY+bqfanvtSoJfiwvtBZ3fC3AM+tIw?=
 =?us-ascii?Q?/xDKireYnGOmEFBGnXCGszkmCs+C/YM7R3/ITDJfhYiKPijWKIQBGRtPFg8Y?=
 =?us-ascii?Q?3JJPgC803URTlMUhJpCoD3A0D78onJZiXf9dVf8n5diBVl/qMPJlrIHISAdm?=
 =?us-ascii?Q?ymxLlBdybQBzLk3Ys1m+OMVp9yXAmx9vNh/BU1x/4xQpV/curXjxkqcXYSwN?=
 =?us-ascii?Q?l++n2JpFVJ+luowXwawd6MYRPp1kaFmJHQSNHYa/SQLt3kEr6WvqTwXscpXx?=
 =?us-ascii?Q?lUrILPJPLZt8rYvqIOwRR6L9Kcveh6Q7wI9yVQWv6pK/O8jqHezjE/YRLb10?=
 =?us-ascii?Q?HCyq1AhFGAhO/PY8UuttYMNHFFHSEd/J8yvWMwlMnGJoSVwxTLV+MJfsYSHQ?=
 =?us-ascii?Q?p2MgCBu3nyCJeBoUNbC9mj5FEr8TtuSRf0igzjV4qsgtjlCsmizLMKD0dMRL?=
 =?us-ascii?Q?9L9BulC8Ga5G7BXDnCsDBoCH8JRSJkZvOn1UUY4lXjvBs0ZsRW+tObqYgM2m?=
 =?us-ascii?Q?i/SUNQZK6qCdDtligUh9fhytcpKi4pTtstAkRJCaF2yqOL2Ru8hWx0Q+gVS2?=
 =?us-ascii?Q?Cu606j95ZmIqMtr1yc8MuDQtfOGkVDsB5ZxVCwuJpBgEBbyaaYBGtm1gFpSm?=
 =?us-ascii?Q?EfK/NoRe0NomTFe10SFYqtZ7Vlv6EUISUQ1OA3WReE7B+p/RIfirMH2kanUM?=
 =?us-ascii?Q?W364jbHi4AtinjEFsx0PwR3yNNbwtAHiOs3zAAayobajN8QjtzjSoCm9Yh6X?=
 =?us-ascii?Q?pjDcbDsarI4PChOGEIAY+HLsefW4toj+ryzIHM/6UG8FVc5xST7uZE8ZU6KS?=
 =?us-ascii?Q?PlD96Gb6XiXGrJS7UChZndxvsewSUgR0m4xy5HLACVKMc2xOzfadv2PVkFM6?=
 =?us-ascii?Q?p2OCBVsalMyiq7Xn4jKBPgTQ5c/UhCFsUOYigikPc+Bpl9e+2oBCgb1amX3U?=
 =?us-ascii?Q?jiI+gl50NwQsC85OQP5mQstSsBhJDmpH/+rOnsLnOHNO9WnA4PdRSJ47UPo0?=
 =?us-ascii?Q?432GrWB2qhkM+GobsyXc6EyD9V4ALAGH6Au1FSD5BgLlIzndAsQcyNz3tjsi?=
 =?us-ascii?Q?O5kmYz6301DW00I5fknhPug7AYRymKKOo8rdCYXwiQv+zAd53a27KpC/lWso?=
 =?us-ascii?Q?QouUN+AdvqahI515znLj830zh/s5l671hWw59eouId20S10Ve04UEoYRoCGh?=
 =?us-ascii?Q?z11Tn5QgSwgP0f8c7OUpkCXzmyohxzrAZMBx5ROBoZFQqLZGxGCcN8+kzMh4?=
 =?us-ascii?Q?as8h47ovyIyr4bxYh5NyT4P+Uwy4p7vYIpRXJOJ932I4BK47oix/NwfOZToM?=
 =?us-ascii?Q?3c86ZM08ObCkU6RPhc6mj1qSncndyfDXe8x8gasD4QWN2IwhfGQcgApx5hb5?=
 =?us-ascii?Q?2B2fXQ4DTwS+gIt0vzYLl4K3zqqMKcDthnXI9vTtZBvEYnwhQDScoS44Pwzz?=
 =?us-ascii?Q?V+5CkbPXLDgO2cVqeRA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 286e19c4-1591-4ee1-db36-08dbe76d8907
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 13:03:03.9270
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f2U5oKeR0gt0lsvj5SNq09Ba/DAUkt9buQf/QNCkRTYprFQIBwtZNclCW2lq0c9M49kYJ44Z7CKbvz7sbmwyFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9338
Subject: RE: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, November 17, 2023 6:02 PM
>=20
> On Fri, Nov 17, 2023 at 12:11:15PM +0000, Parav Pandit wrote:
> >
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Friday, November 17, 2023 5:35 PM
> > > To: Parav Pandit <parav@nvidia.com>
> > >
> > > On Fri, Nov 17, 2023 at 11:45:20AM +0000, Parav Pandit wrote:
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Friday, November 17, 2023 5:04 PM
> > > > >
> > > > > On Fri, Nov 17, 2023 at 11:05:16AM +0000, Parav Pandit wrote:
> > > > > >
> > > > > >
> > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > Sent: Friday, November 17, 2023 4:30 PM
> > > > > > >
> > > > > > > On Fri, Nov 17, 2023 at 10:03:47AM +0000, Parav Pandit wrote:
> > > > > > > >
> > > > > > > >
> > > > > > > > > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > > > > > > > Sent: Friday, November 17, 2023 3:30 PM
> > > > > > > > >
> > > > > > > > > On 11/16/2023 7:59 PM, Michael S. Tsirkin wrote:
> > > > > > > > > > On Thu, Nov 16, 2023 at 06:28:07PM +0800, Zhu, Lingshan
> wrote:
> > > > > > > > > >>
> > > > > > > > > >> On 11/16/2023 1:51 PM, Michael S. Tsirkin wrote:
> > > > > > > > > >>> On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav Pandi=
t
> wrote:
> > > > > > > > > >>>> We should expose a limit of the device in the
> > > > > > > > > >>>> proposed
> > > > > > > > > WRITE_RECORD_CAP_QUERY command, that how much range it
> > > > > > > > > can
> > > > > track.
> > > > > > > > > >>>> So that future provisioning framework can use it.
> > > > > > > > > >>>>
> > > > > > > > > >>>> I will cover this in v5 early next week.
> > > > > > > > > >>> I do worry about how this can even work though. If
> > > > > > > > > >>> you want a generic device you do not get to dictate
> > > > > > > > > >>> how much memory VM
> > > > > has.
> > > > > > > > > >>>
> > > > > > > > > >>> Aren't we talking bit per page? With 1TByte of
> > > > > > > > > >>> memory to track
> > > > > > > > > >>> -> 256Gbit -> 32Gbit -> 8Gbyte per VF?
> > > > > > > > > >>>
> > > > > > > > > >>> And you happily say "we'll address this in the future=
"
> > > > > > > > > >>> while at the same time fighting tooth and nail
> > > > > > > > > >>> against adding single bit status registers because sc=
alability?
> > > > > > > > > >>>
> > > > > > > > > >>>
> > > > > > > > > >>> I have a feeling doing this completely theoretical
> > > > > > > > > >>> like this is
> > > > > problematic.
> > > > > > > > > >>> Maybe you have it all laid out neatly in your head
> > > > > > > > > >>> but I suspect not all of TC can picture it clearly
> > > > > > > > > >>> enough based just on spec
> > > > > text.
> > > > > > > > > >>>
> > > > > > > > > >>> We do sometimes ask for POC implementation in linux
> > > > > > > > > >>> / qemu to demonstrate how things work before merging
> code.
> > > > > > > > > >>> We skipped this for admin things so far but I think
> > > > > > > > > >>> it's a good idea to start doing it here.
> > > > > > > > > >>>
> > > > > > > > > >>> What makes me pause a bit before saying please do a
> > > > > > > > > >>> PoC is all the opposition that seems to exist to
> > > > > > > > > >>> even using admin commands in the 1st place. I think
> > > > > > > > > >>> once we finally stop arguing about whether to use
> > > > > > > > > >>> admin commands at all then a PoC will be needed
> > > > > > > before merging.
> > > > > > > > > >> We have POR productions that implemented the approach
> > > > > > > > > >> in my
> > > > > series.
> > > > > > > > > >> They are multiple generations of productions in
> > > > > > > > > >> market and running in customers data centers for years=
.
> > > > > > > > > >>
> > > > > > > > > >> Back to 2019 when we start working on vDPA, we have
> > > > > > > > > >> sent some samples of production(e.g., Cascade
> > > > > > > > > >> Glacier) and the datasheet, you can find live
> > > > > > > > > >> migration facilities there, includes suspend, vq state=
 and other
> features.
> > > > > > > > > >>
> > > > > > > > > >> And there is an reference in DPDK live migration, I
> > > > > > > > > >> have provided this page
> > > > > > > > > >> before:
> > > > > > > > > >> https://doc.dpdk.org/guides-21.11/vdpadevs/ifc.html,
> > > > > > > > > >> it has been working for long long time.
> > > > > > > > > >>
> > > > > > > > > >> So if we let the facts speak, if we want to see if
> > > > > > > > > >> the proposal is proven to work, I would
> > > > > > > > > >> say: They are POR for years, customers already
> > > > > > > > > >> deployed them for
> > > > > years.
> > > > > > > > > > And I guess what you are trying to say is that this
> > > > > > > > > > patchset we are reviewing here should be help to the
> > > > > > > > > > same standard and there should be a PoC? Sounds reasona=
ble.
> > > > > > > > > Yes and the in-marketing productions are POR, the series
> > > > > > > > > just improves the design, for example, our series also
> > > > > > > > > use registers to track vq state, but improvements than
> > > > > > > > > CG or BSC. So I think they are proven
> > > > > > > to work.
> > > > > > > >
> > > > > > > > If you prefer to go the route of POR and production and
> > > > > > > > proven documents
> > > > > > > etc, there is ton of it of multiple types of products I can
> > > > > > > dump here with open- source code and documentation and more.
> > > > > > > > Let me know what you would like to see.
> > > > > > > >
> > > > > > > > Michael has requested some performance comparisons, not
> > > > > > > > all are ready to
> > > > > > > share yet.
> > > > > > > > Some are present that I will share in coming weeks.
> > > > > > > >
> > > > > > > > And all the vdpa dpdk you published does not have basic
> > > > > > > > CVQ support when I
> > > > > > > last looked at it.
> > > > > > > > Do you know when was it added?
> > > > > > >
> > > > > > > It's good enough for PoC I think, CVQ or not.
> > > > > > > The problem with CVQ generally, is that VDPA wants to shadow
> > > > > > > CVQ it at all times because it wants to decode and cache the
> > > > > > > content. But this problem has nothing to do with dirty
> > > > > > > tracking even though it also
> > > > > mentions "shadow":
> > > > > > > if device can report it's state then there's no need to shado=
w CVQ.
> > > > > >
> > > > > > For the performance numbers with the pre-copy and device
> > > > > > context of
> > > > > patches posted 1 to 5, the downtime reduction of the VM is 3.71x
> > > > > with active traffic on 8 RQs at 100Gbps port speed.
> > > > >
> > > > > Sounds good can you please post a bit more detail?
> > > > > which configs are you comparing what was the result on each of th=
em.
> > > >
> > > > Common config: 8+8 tx and rx queues.
> > > > Port speed: 100Gbps
> > > > QEMU 8.1
> > > > Libvirt 7.0
> > > > GVM: Centos 7.4
> > > > Device: virtio VF hardware device
> > > >
> > > > Config_1: virtio suspend/resume similar to what Lingshan has,
> > > > largely vdpa stack
> > > > Config_2: Device context method of admin commands
> > >
> > > OK that sounds good. The weird thing here is that you measure "downti=
me".
> > > What exactly do you mean here?
> > > I am guessing it's the time to retrieve on source and re-program
> > > device state on destination? And this is 3.71x out of how long?
> > Yes. Downtime is the time during which the VM is not responding or rece=
iving
> packets, which involves reprogramming the device.
> > 3.71x is relative time for this discussion.
>=20
> Oh interesting. So VM state movement including reprogramming the CPU is
> dominated by reprogramming this single NIC, by a factor of almost 4?
Yes.

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

