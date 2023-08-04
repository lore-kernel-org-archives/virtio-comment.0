Return-Path: <virtio-comment-return-7010-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94564C04A6A
	for <virtio-comment@archiver.kernel.org>; Fri,  4 Aug 2023 06:21:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E26DBCB129
	for <virtio-comment@archiver.kernel.org>; Fri,  4 Aug 2023 06:21:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D5C969867FC
	for <virtio-comment@archiver.kernel.org>; Fri,  4 Aug 2023 06:21:07 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CD7359866E4; Fri,  4 Aug 2023 06:21:07 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B7BA39866DE;
	Fri,  4 Aug 2023 06:20:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhImF/8UOaLMmrstte4ultzs4ow1byjwkJqtOwFhuvsbE3NzUpsEm4wtgWVVMArRMI7aqn/fHaysoI2Y1cxVlKX1ze/ROSgRJnKkMT54tEkI0JNfa9miSJ5MjwrxS7V3htXi21N4gN38JUj1zpFteObL3ry7/Kcr1gmBKCNyzpXdtx6iBC3U2HmLI7UZ3xiW/Xy/rr668AUnDZVtqgYM0+dS1mx9hjPKwIFqy6YxBQAvEkHWY7ABY1NJGWgR2lc26367noneGloGiYTrWn4Fps/GFOSReW3ecSMLE1uHZZIQToVUgDOeK0LBcybxsZxxi3XmaAEhPy+nTvb+5izxlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTW7N2/N6odbDl6nYmA4/rCzoi4Cqtj8Dq0rRj1MCSs=;
 b=jTEeAQ1tkdSsDuO1ghehbCDvkcDCg+zDnDr0PyLAqxojXFij9HUfnI520BocjgkL06wGdZXS0bT5f0seRxkhYJbpORDIMSOyhL4Pd4U8oloJ/Kz533aKGZLOoRUglhDN0Rqy42Qhg/oPF+M1ZPIHa77TSYebuGokFj5aJUuyXCuhlUxL3GAkBWveew+1G4NRqfDuUJQdpLWLFlgEUHwcNFqhA4DqgdiOFi6mAu6ptRQHkh/PC6/7NemTomiDhy8U4f1SZZHMweV3hrkZYWbJRC+HIpniQNwy+6TG+dJjJJilRVm6JbcIcXOdbKsr4HDZMUqvbO0ybPSalQffWPknMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>
CC: Satananda Burla <sburla@marvell.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [PATCH requirements 5/7] net-features: Add n-tuple receive flow
 filters requirements
Thread-Index: AQHZvd/S1zVkOCRsJ0eCMof906XE7a/XL16AgAEzr4CAADgYgIABHAlA
Date: Fri, 4 Aug 2023 06:20:53 +0000
Message-ID:
 <PH0PR12MB54811B738594B741F8F8D723DC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-6-parav@nvidia.com>
 <20230802152525.GA13690@h68b04307.sqa.eu95>
 <PH0PR12MB5481538EEC183EBE3FF16234DC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230803130725.GA47086@h68b04307.sqa.eu95>
In-Reply-To: <20230803130725.GA47086@h68b04307.sqa.eu95>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB8658:EE_
x-ms-office365-filtering-correlation-id: 2f72419e-6e80-4b04-d983-08db94b2f4dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 e+vKVPVehlXdX3VlWknpNpRuL5lQTcsgFJ+IT3iO9PpjiS7TqRZq8FejRFP5msDK0obKpg9GYIUJyn9XsqWbum3FBAmliFIV2QBG9hLwYp/aTzCZNm/UzM02EUcoh7nYyWVdmmpccdS8uXGHVdldhdAR4hkHYbo/xyavqCvCoWpSVdWu0mjcck0xV38hCGYeJM+X+4fWdRxhf4vEYDNOOOuBb2AzpyIIaTw2FA11OvcZlD4fdwQvRxt4A8XzF09/jvcSxwvhrl2r6B3vB2NBJ5DXs8ESmrKBhJ7FCE/4cEuRtmC7CMuPoZrbtgybyQMacwwxrYawz9to9WCXOHka/d8+C+MH3PpIs6jAT0Ri6EAFif6eAk4yh99frE1XwbFJ7rMWRA0a4+EVfiVlSh84ioq/EoGuC0oLvXwthD8fEf2RnvlZbPo6HTcZ3QB7UNitoYmMpFN48QE6zzpro7cIzUdcQIx42QVQ+mBKiTkQKnXm0qaw3CNNhSkO2jbsTbU6qCqymeAs8/MklkVQlGWgNUxvsO8oeiW5804fKgvbS2mgjpYcPGD50Rc/3wp+QO8Xi+0gE+3o+Zo9CrLuC/mJBVp43xV+H3vu+KnhNTqr4dX32cDgIOABoouM68xYUGyK
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199021)(1800799003)(186006)(33656002)(8676002)(8936002)(71200400001)(52536014)(30864003)(2906002)(83380400001)(86362001)(5660300002)(66946007)(66556008)(66476007)(66446008)(76116006)(64756008)(41300700001)(66899021)(4326008)(6916009)(122000001)(316002)(26005)(6506007)(478600001)(38070700005)(38100700002)(55016003)(7696005)(54906003)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qBSkeTUTNpSRjy/G4EB3U+2qCW0p3cH1Cm0XH/V1ImGrBOUjS/4XNcFNwWNn?=
 =?us-ascii?Q?Y7Nj7TEs3Xqs+yavR2bXLSrCtp5bazd3cRY1/oqY6n8x91skVwW6SGZuGiNr?=
 =?us-ascii?Q?8wir50HqOxXX81wCbPFsIrdCPPjMkkJfAWnXjd8gNzPuHOyPzVxNAmZc6k/Q?=
 =?us-ascii?Q?W4hYDpqeZFyI83w9+7oy//3+guj/DDX0hyKT89UoSZvjunDlrHH/PsPzkxD6?=
 =?us-ascii?Q?RGQXyJ92WBBnm8TFhuKa0jlpdIlova8KtjrDRnOggAiXiztM6FLQ1UwfRnbx?=
 =?us-ascii?Q?JrKDWmMZy4Pu0BL1FOBGKHZMjFhL4A79SXu6XD+x8WsoeE2mc7PYLImlnOd1?=
 =?us-ascii?Q?wtTxqt1QcJmMvkZNeXbcjUJhRXmE0cbTKapOp2NBBI/phNuQigGrkMx8eb6p?=
 =?us-ascii?Q?I05AUTWQccOne9dBDZ0zX7cFfvANqCPBUNPBk2NP0a9LEW3gwB8B23U/KTPu?=
 =?us-ascii?Q?BhOul49f463ck4hicl5x7NytsEJ0AwHtJmiHomIbUai7fb1LM87aJAAP/GZ2?=
 =?us-ascii?Q?rbFgMBFbt03PjvgVVF6WiO6YI9q0k+Bd4TFTxcA8GcM+Uf5eucLLDlSKJQRV?=
 =?us-ascii?Q?97U7Pmm1kcsCKX4M06O6x/pMQUf0+B2fdB4wDQH3BBkcsSIH9jx0783HrJ5w?=
 =?us-ascii?Q?gVCqFGqdtwr4p/eVz5oGru1AnRbDcAMUUzWAwmsolVSLRUw/pMxhQJxNRRS8?=
 =?us-ascii?Q?Bp+myHFef5JRiBO2+wXkKwzhCVXB04fg6TyVfP4L26tBT+z1ss8FAor2D8Ea?=
 =?us-ascii?Q?qXQmv199fgkYqFUJ/7UNQ3lWugsIXPlQvIc5MjcaW1CImEBTEDFoasEiTsPt?=
 =?us-ascii?Q?kUfQSwk7kvXrWFy3PzjsN8rEEJlXTwjzxIC9tzEgPE4sod4d3M7fcCGyq23W?=
 =?us-ascii?Q?J0RUF05+PFKs3KOBnZ8vD1uEp8HEVHvwXXYjVRGlIVXYo2kVqRUAiNERo/jI?=
 =?us-ascii?Q?F8wH1GB/w0YuJA02zCW9NeeMbOHkXKqJhQCiSxCzaBsMnzXDLdv+VMfI7Nqg?=
 =?us-ascii?Q?ojpLPoyu4tSdnAoEilYqS3Iwt8jkNgY+p5R6YqkanQF8uoJcL+8YJvdg5TPI?=
 =?us-ascii?Q?Zc6skiHmV3OkRhp4hz3yIezU/IfCWQw31c0dOEiy+MO4TJxxEvLjCO8dcnp7?=
 =?us-ascii?Q?iSkk+hWVY161Al9ceWFNvf+U6dG+Tp+WpVIuzqLakGpJkMi5kWe7MFWrQUVf?=
 =?us-ascii?Q?lkB2HtcykDqkwWIEpAubrDjV/qTH1nT2A78p8eqzB6+XoEFvBy9yvr7ffUql?=
 =?us-ascii?Q?G5IhtKdl2SCBoQpX6gRraOJ3cyfV5h1QZPmNOyixls2niisKuPuePxPVPm7f?=
 =?us-ascii?Q?9m95ljIhEVW9tY2jnlowHCbWMXnKvh4EO4TCck+zp7H/d5KBr8nM3mnrvTcb?=
 =?us-ascii?Q?0k9oqdE53Wwb7MqDEff+B81q9qSf+04NGtDsz4uS1TyqQaiv2ZoYXu4o3G7x?=
 =?us-ascii?Q?OXKT2fQyZEe0Acph5fIQ34++W2C0A1r8sBjvErla51TtO0u7P84HkWcHwUnq?=
 =?us-ascii?Q?yGh7dtl9TfUamfybY7sOsTXLVTtCh5Hj6yijfX0VS4xC0loQB4KthhP0uikF?=
 =?us-ascii?Q?3UYJI8lXpjeH6XES4wE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f72419e-6e80-4b04-d983-08db94b2f4dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2023 06:20:53.6180
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yt4lXJ+WDb9Kwtwg8r8HiKeMCj+QzonLhO13npnNje1T77Qflj6qUXXU9TteHbDi6e4TPO++otoMx96owF8Aqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8658
Subject: [virtio-comment] RE: [PATCH requirements 5/7] net-features: Add n-tuple receive flow
 filters requirements


> From: Heng Qi <hengqi@linux.alibaba.com>
> Sent: Thursday, August 3, 2023 6:37 PM
>=20
> On Thu, Aug 03, 2023 at 09:59:54AM +0000, Parav Pandit wrote:
> >
> > > From: Heng Qi <hengqi@linux.alibaba.com>
> > > Sent: Wednesday, August 2, 2023 8:55 PM
> >
> > > Hi, Parav. Sorry for not responding to this in time due to other thin=
gs
> recently.
> > >
> > > Yes, RFF has two scenarios, set_rxnfc and ARFS, both of which will
> > > affect the packet steering on the device side.
> > > I think manually configured rules should have higher priority than
> > > ARFS automatic configuration.
> > > This behavior is intuitive and consistent with other drivers.
> > > Therefore, the processing chain on a rx packet is:
> > > {mac,vlan,promisc rx filters} -> {set_rxnfc} -> {ARFS} -> {rss/hash c=
onfig}.
> > >
> > Correct.
> > Within the RFF context, the priority among multiple RFF entries is gove=
rned by
> the concept of group.
> > So above two users of the RFF will create two groups and assign priorit=
y to it
> and achieve the desired processing order.
>=20
> OK, we intend to use group as the concept of rule storage. Therefore, we
> should have two priorities:
> 1. one is the priority of the group, this field is not seen in the struct=
ure
> virtio_net_rff_add_modify, or the group id implies the priority (for exam=
ple, the
> smaller the priority, the higher the priority?)?
Good catch, yes, we need priority assignment to the group.
Hence, we need group add/delete command as well.

> 2. the other is the priority of the rule, the current structure
> virtio_net_rff_add_modify is still missing this.
>=20
Adding it.
> I think we should add some more texts in the next version describing how
> matching rules are prioritized and how groups work. This is important for=
 RFF.
>=20
> I also want to confirm that for the interaction between the driver and th=
e
> device, the driver only needs to tell the priority of the device group an=
d the
> priority of the rule, and we should not reflect how the device stores and
> queries rules (such as tcam or some acl acceleration solutions) ?
>=20
Correct, we try to keep thing as abstract as possible.
> >
> > > There are also priorities within set_rxnfc and ARFS respectively.
> > > 1. For set_rxnfc, which has the exact match and the mask match.
> > > Exact matches should have higher priority.
> > > Suppose there are two rules,
> > > 	rule1: {"tcpv4", "src-ip: 1.1.1.1"} -> rxq1
> > > 	rule2: {"tcpv4", "src-ip: 1.1.1.1", "dst-port: 8989"} -> rxq2 .For
> > > recieved rx packets whose src-ip is 1.1.1.1, should match rule2 inste=
ad of
> rule1.
> > >
> > Yes. Driver should be able to set the priority within the group as well=
 for above
> scenario.
>=20
> But here I am wrong, it should be:
> rx packets whose src-ip is 1.1.1.1 and dst-port is 8989, should match rul=
e2
> instead of rule1.
>=20
That is what you wrote, here both the rules are within one group.
And rule2 should have higher priority than rule1.

> >
> > > The rules of set_rxnfc come from manual configuration, the number of
> > > these rules is small and we may not need group grouping for this.
> > > And ctrlq can meet the configuration rate,
> > >
> > Yes, but having single interface for two use cases enables the device
> implementation to not build driver interface specific infra.
> > Both can be handled by unified interface.
>=20
> I agree:) Is ctrlq an option when the num_flow_filter_vqs exposed by the =
device
> is 0?
>
I think ctrlq would in above scenario offers, a quick start to the feature =
by making flowvq optional.
It comes with the tradeoff of perf, and dual code implementation.
Which is fine, the problem occurs is when flowvq is also supported, and flo=
wvq is created, if driver issues command on cvq and flowvq both, synchroniz=
ing these on the device is nightmare.

So if we can draft it as:=20
If flowvq is created, RFF must be done only on flowvq by the driver.
If flowvq is supported, but not created, cvq can be used.

In that case it is flexible enough for device to implement with reasonable =
trade off.

> >
> > > 2. For ARFS, which only has the exact match.
> > > For ARFS, since there is only one matching rule for a certain flow,
> > > so there is no need for group?
> > Groups are defining the priority between two types of rules.
> > Within ARFS domain we don't need group.
>=20
> Yes, ARFS doesn't need group.
>=20
> >
> > However instead of starting with only two limiting groups, it is better=
 to have
> some flexibility for supporting multiple groups.
> > A device can device one/two or more groups.
> > So in future if a use case arise, interface wont be limiting to it.
>=20
> Ok. This works.
>=20
> >
> > > We may need different types of tables, such as UDPv4 flow table,
> > > TCPv4 flow table to speed up the lookup for differect flow types.
> > > Besides, the high rate and large number of configuration rules means
> > > that we need flow vq.
> > >
> > Yes, I am not sure if those tables should be exposed to the driver.
> > Thinking that a device may be able to decide on table count which it ma=
y be
> able to create.
>=20
> o how to store and what method to use to store rules is determined by the
> device, just like my question above. If yes, I think this is a good way t=
o work,
> because it allows for increased flexibility in device implementation.
>=20
Right, we can possibly avoid concept of table in spec.
So far I see below objects:

1. group with priority (priority applies among the group)
2. flow entries with priority (priority applies to entries within the group=
)
> >
> > > Therefore, although set_rxnfc and ARFS share a set of
> > > infrastructure, there are still some differences, such as
> > > configuration rate and quantity. So do we need add two features
> > > (VIRTIO_NET_F_RXNFC and VIRTIO_NET_F_ARFS) for set_rxnfc and ARFS
> respectively, and ARFS can choose flow vq?
> > Not really, as one interface can fullfil both the needs without attachi=
ng it to a
> specific OS interface.
> >
>=20
> Ok!
>=20
> > > In this way, is it more conducive to advancing the work of RFF (such
> > > as accelerating the advancement of set_rxnfc)?
> > >
> > Both the use cases are equally immediately usable so we can advance it =
easily
> using single interface now.
> >
> > > > +
> > > > +### 3.4.1 control path
> > > > +1. The number of flow filter operations/sec can range from
> > > > +100k/sec to
> > > 1M/sec
> > > > +   or even more. Hence flow filter operations must be done over a
> queueing
> > > > +   interface using one or more queues.
> > >
> > > This is only for ARFS, for devices that only want to support
> > > set_rxnfc, they don't provide VIRTIO_NET_F_ARFS and consider
> implementing flow vq.
> > >
> > Well once the device implements flow vq, it will service both cases.
> > A simple device implementation who only case for RXNFC, can implement
> flowvq in semi-software serving very small number of req/sec.
> >
>=20
> When the device does not provide flow vq, whether the driver can use ctrl=
q to
> the device.
>=20
Please see above.

> > > > +2. The device should be able to expose one or more supported flow
> > > > +filter
> > > queue
> > > > +   count and its start vq index to the driver.
> > > > +3. As each device may be operating for different performance
> characteristic,
> > > > +   start vq index and count may be different for each device. Seco=
ndly, it is
> > > > +   inefficient for device to provide flow filters capabilities via=
 a config
> space
> > > > +   region. Hence, the device should be able to share these attribu=
tes using
> > > > +   dma interface, instead of transport registers.
> > > > +4. Since flow filters are enabled much later in the driver life cy=
cle, driver
> > > > +   will likely create these queues when flow filters are enabled.
> > >
> > > I understand that the number of flow vqs is not reflected in
> > > max_virtqueue_pairs. And a new vq is created at runtime, is this
> > > supported in the existing virtio spec?
> > >
> > We are extending the virtio-spec now if it is not supported.
> > But yes, it is supported because max_virtqueue_pairs will not expose th=
e
> count of flow_vq.
> > (similar to how we did the AQ).
> > And flowvq anyway is not _pair_ so we cannot expose there anyway.
>=20
> Absolutely.
>=20
> >
> > > > +5. Flow filter operations are often accelerated by device in a har=
dware.
> > > Ability
> > > > +   to handle them on a queue other than control vq is desired.
> > > > + This achieves
> > > near
> > > > +   zero modifications to existing implementations to add new
> > > > + operations on
> > > new
> > > > +   purpose built queues (similar to transmit and receive queue).
> > > > +6. The filter masks are optional; the device should be able to exp=
ose if it
> > > > +   support filter masks.
> > > > +7. The driver may want to have priority among group of flow
> > > > +entries; to
> > > facilitate
> > > > +   the device support grouping flow filter entries by a notion of =
a group.
> Each
> > > > +   group defines priority in processing flow.
> > > > +8. The driver and group owner driver should be able to query
> > > > +supported
> > > device
> > > > +   limits for the flow filter entries.
> > > > +
> > > > +### 3.4.2 flow operations path
> > > > +1. The driver should be able to define a receive packet match crit=
eria, an
> > > > +   action and a destination for a packet.
> > >
> > > When the user does not specify a destination when configuring a
> > > rule, do we need a default destination?
> > >
> > I think we should not give such option to driver.
> > A human/end user may not have the destination, but driver should be abl=
e to
> decide a predictable destination.
>=20
> Yes, that's what I mean:), and I said "we" for "the driver."
>
Ok. got it.
=20
> >
> > > > For example, an ipv4 packet with a
> > > > +   multicast address to be steered to the receive vq 0. The second
> example is
> > > > +   ipv4, tcp packet matching a specified IP address and tcp port t=
uple to
> > > > +   be steered to receive vq 10.
> > > > +2. The match criteria should include exact tuple fields
> > > > +well-defined such as
> > > mac
> > > > +   address, IP addresses, tcp/udp ports, etc.
> > > > +3. The match criteria should also optionally include the field mas=
k.
> > > > +4. The match criteria may optionally also include specific packet =
byte
> offset
> > > > +   pattern, match length, mask instead of RFC defined fields.
> > > > +   length, and matching pattern, which may not be defined in the
> > > > +standard
> > > RFC.
> > >
> > > Is there a description error here?
> > >
> > Didn't follow your comment. Do you mean there is an error in above
> description?
>=20
> I don't quite understand what "specific packet byte offset pattern" means=
 :(
>=20
Time to make it verbose. :)
For any new/undefined protocol, if user wants to say,=20
In a packet at byte offset A, if you find pattern =3D=3D 0x800, drop the pa=
cket.
In a packet at byte offset B, if you find pattern =3D=3D 0x8100, forward to=
 rq 10.

I didn't consider multiple matching patterns for now, though it is very use=
ful.
I am inclined to keep the option of _any_match to take up later, for now to=
 do only well defined match?
WDYT?


> >
> > > > +5. Action includes (a) dropping or (b) forwarding the packet.
> > > > +6. Destination is a receive virtqueue index.
> > >
> > > Since the concept of RSS context does not yet exist in the virtio spe=
c.
> > > Did we say that we also support carrying RSS context information
> > > when negotiating the RFF feature? For example, RSS context
> > > configuration commands and structures, etc.
> > >
> > > Or support RSS context functionality as a separate feature in another
> thread?
> > >
> > Support RSS context as separate feature.
>=20
> Ok, humbly asking if your work plan includes this part, do you need me to=
 share
> your work, such as rss context.
>
Lets keep rss context in future work as its orthogonal to it.
Yes, your help for rss context will be good.
Lets first finish RFF as its bit in the advance stage.
=20
> Thanks a lot!
>=20
> >
> > > A related point to consider is that when a user inserts a rule with
> > > an rss context, the RSS context cannot be deleted, otherwise the
> > > device will cause undefined behavior.
> > >
> > Yes, for now we can keep rss context as separate feature.

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

