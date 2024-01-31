Return-Path: <virtio-comment-return-9055-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A46CC47258
	for <virtio-comment@archiver.kernel.org>; Wed, 31 Jan 2024 07:24:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4E5E7F3F4A
	for <virtio-comment@archiver.kernel.org>; Wed, 31 Jan 2024 07:24:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 22D7298687D
	for <virtio-comment@archiver.kernel.org>; Wed, 31 Jan 2024 07:24:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 076F7986879; Wed, 31 Jan 2024 07:24:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EB5AD98687B
	for <virtio-comment@lists.oasis-open.org>; Wed, 31 Jan 2024 07:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9icfreVk0Z2FdRZs3TXsDup6Ond3VEOSNED+2uPQ5KDBZKBaXDV8/wJ59d8ZrssbezkU/pB37ezThziU8VmPNdmOZqQ0nGSWRT54TawLYHTk2LTL4AV2LIgtrOVpkLebtPGK5pOuXbKBZzaHB3jvftatS0tesy/nSWmZfYDN3C5aU3fM8kxe2JfHumB2+x5WqF8ZlYTa7/BsI98i11hv8JH5rU2NhorrrYNkvwy8W7B4GaPAWrquzkfZfo4kRakuwv3aDwYYqQlLSLhm0o+gzBfvDV2akFLmruecCZdHcxXGwrjKy95BGPac7c8QR5y+cl1IuwG2BZcpS+Z/ibBsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iuYOx27qP/y9IxlC2u5pqy/k4IA0NZOOH04TbksCQwk=;
 b=nbfo1qAUuH6U/JJuz0tjzro6AtKQ3AA8DxBa8uIs6KqoD+76xdlanGW4QqjEkb4QalD/DeDyyQBkY75Z8xCeCarmV1PsTgxRaG3y8M3NYB9rDOkA+yQ5jcXq9nBLNermcpyqh/9vLVtW1hyrl1oo/QPeaDn8C1mggT6MTrgbN4O5BZjr1jskmg4WgnPxfP6sdk0RadrBugaqskSGItwa0LoM2Ckl3fRjcCltt5BQJhoOyrOyLi/1yNLPREM366T0/pnzg92KTWLOUK636aSVBFjCe/ZaVoA8a5SvdIf0xYijaFKfXde3Yr+ujOZ0fR5a+MKUp/90IK+txZu5G+S5Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Lege Wang <lege.wang@jaguarmicro.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism
Thread-Index: AQHaTzZzkxS4XClcDkWCFLA6ilSUorDx62oAgAGU+ACAAAH90IAAC2cAgAAAyfA=
Date: Wed, 31 Jan 2024 07:24:45 +0000
Message-ID:
 <PH0PR12MB5481127D27A0B12739AF61BADC7C2@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240125023001.1467-1-lege.wang@jaguarmicro.com>
 <PH0PR12MB5481C4AE095D48C6241C6366DC7D2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <SI2PR06MB53850CBD8F76EDC65DF2DD38FF7C2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <PH0PR12MB548186A6AE8A993AF50FA91CDC7C2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <SI2PR06MB53851A046986508D5C99374DFF7C2@SI2PR06MB5385.apcprd06.prod.outlook.com>
In-Reply-To:
 <SI2PR06MB53851A046986508D5C99374DFF7C2@SI2PR06MB5385.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN0PR12MB6176:EE_
x-ms-office365-filtering-correlation-id: c7ef37d5-a8e4-4414-dfa9-08dc222db344
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 KIhXPGU6EZ8xVvRv+rzeolezsIjP5R/EdzoQBhUh0gpvFn5MONmmOj2NvbN/qc0GqMY+RnvL74xzlwvLHQcG7BWBNvkl9bzSH6vpYLmNSA62kyJCPM9Vs3MqbvCNnNSj0Izrs8s+sgs+QoVT4x1TaZYcYN+N6m2Yy6nvw+SC9V9zWUU7tJbxhKERDOn7NeNARJapk84gB1PyuVwsGvL4dnoBmdQ+weAy+QABEuTAUSg94nXLvLnM4wztjSNTRhOCR9E7YmWr0U36wcMVSIOd6iWXtdiGrlYcDMxosjwZbv7wGeYCF4nr2mqIEI2VS7t7uwCHuKOYE2KM7cRMDIODXRL+8TgqXKcMpypVSh2VEr2GzXqSdOIvEsVKrjI8aXRNQRFatogvCha8exeGcMwMK5YSM15OzXs3yOW0+DXk2PNgdpLt2pkqyY8LI/WTCV0LWG7uE32WqsvkViHklQKMv1x8hb2P7QJGSWsTlLjut2Tz9rT8TDzUBrG5o7pMmifURdpgBdtI11jkAqbUEd8MNEKkpMpWVlMpu+wNcVyCFZRIusXO2IBpKjVuFEE1GU8SThwLXqKUpdHyRMm+zLBl6o+xTR55rYIyZlbNP04OwfzLmN6L3YZ2yPH9M7fNivux
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(366004)(376002)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(316002)(66556008)(66446008)(66476007)(64756008)(76116006)(110136005)(66946007)(8676002)(8936002)(38070700009)(478600001)(86362001)(33656002)(5660300002)(2906002)(41300700001)(15650500001)(52536014)(83380400001)(55016003)(26005)(38100700002)(122000001)(71200400001)(7696005)(6506007)(53546011)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jG7roMbVWUtnIRkrNN+5e/ub3VnTK2GsVHjqsz6IHvjTY1fuSQGSNepYpYs5?=
 =?us-ascii?Q?HL1emJbEm1IlCTma4EBARONdo1EZOiLl8VRZDNCy9nfmmLSlJt46h2uDf4Lp?=
 =?us-ascii?Q?EL75LWhyFzi57/MB0AcERSWawjw7uzwLwxfkUJkwQQ4pnDXgcblOF5IdwFh1?=
 =?us-ascii?Q?TS9uaa9hMo88m7BxXwhfI48LDo7Uolg1zgHwNw3Kn9VnXfBJpkdAadn/B/Km?=
 =?us-ascii?Q?fkUSG8FIGE11UkPeUwsjSwjxw1gdbA+R+bS3LcTz+JAvcQNS0dqsyVYq638w?=
 =?us-ascii?Q?dW+p00uDiIHmsGq4nm7vyFpCqNUZPOMwbSJ9vaSeMQYNoei/9ujUECJMCGci?=
 =?us-ascii?Q?rGLSVRtZslHMhFbjj4WoeRbs3DUcGRpZ9MN3l+THauUGIE4Gole+VJi6mEO4?=
 =?us-ascii?Q?yTuXBaGVx13sja7v6ll8Kbw4CpNfLoxTiGvz5L93PxuZLx3Ok1VwjB+wv9PK?=
 =?us-ascii?Q?wPvD94Ak26Mhu36LoabUh2CxaiIh/fFnfqFEMXIneIH83DGolSwEtvwUvWJa?=
 =?us-ascii?Q?ZkVM7Atgke6qN1P51uLwPhaYLxPa8TsJU5u8cAI0LcqLukQ6MwudQRX6iyLq?=
 =?us-ascii?Q?NmAkXYErdZjpDrgdbaD8oyFkdHBBSjtvc2Dz0Ppl+g4bmTvyiiN4RPwyQ38y?=
 =?us-ascii?Q?54NriKdz+m8NhH635bCkWWomZAuG6a4O4j/0JZgIEsTlM9ba+ps32OV79aaP?=
 =?us-ascii?Q?qkC9q22wZzOKNMkQqOgj2V5gWIwXcl7Th7oxxRdXNCy9JYNi3VQVPHdYYikE?=
 =?us-ascii?Q?G5xAoeyDa1ZZp7AriPP3fsTsWQbJ2MRWcuuJCjpiEWRxCpBSlova7CMlQFkx?=
 =?us-ascii?Q?nG5dB9rOGAO+fhyJMtpb/c0ZZ3Bphvr6PA2/TE8Yald97ERmhCRiHiEIqy+G?=
 =?us-ascii?Q?utCGSEejxFmwUWnHjZZqyPqlNtHMQq7sy/I9Xia4FcDMriGtNSEdXzAOqZcp?=
 =?us-ascii?Q?AULUE5J28kwDUNyT96CijKbqg/HDB91XuShuRh9df2C46YwGJNLYHto3g9oZ?=
 =?us-ascii?Q?PrADaV/ZuumaBISFoD0pUX1YhHnCU4UC3YXltYvt79PiesqWMX5Uc2nt85sv?=
 =?us-ascii?Q?ITiry70M+SG0vCAJjFDUeTMYBX5BK0pbYRmPyK9XvDsgaW1LvZ4KpH73xNpu?=
 =?us-ascii?Q?pIyzzB7+QEhSRPE0tARuEEWkhM/uSWQLJEnDaCEzgWTSVfk0EZogbFGj8Pel?=
 =?us-ascii?Q?jXzovBABzuHtj4Noc8j0azwxaMGaAFKXArP81lRGjevFSAnewALhD1MnendD?=
 =?us-ascii?Q?jeG/UWcjWoOelFpkHbhcmKU5YlyLzUMY4LV77fwwTV8w/nGbILvsd7hsrSIm?=
 =?us-ascii?Q?CAHaTUHqPFJi3jTbUkmFkytQMgeBn8shrsrMH/14IIkCVyHDpYMbBKHS6ny3?=
 =?us-ascii?Q?zMBPWi7zckqh1Dru/r2V51b6BFzNyG4HnKzjKXYPyEiR69t7I18ss/DwNc3G?=
 =?us-ascii?Q?1QguL1oEl9oUwO2hqlKxiT1jdvED/ki0rG1Zlg2Ja+IZmluW9LbyMTzm8KKe?=
 =?us-ascii?Q?VikTlQ2sq3RKf7TKc0I9ivrqF1n/QCmWUeB4U0wc23yPXEAsd03+qNAOG1K2?=
 =?us-ascii?Q?UmwvILfjPBKrkxeeSQs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ef37d5-a8e4-4414-dfa9-08dc222db344
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 07:24:45.6248
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x+DjX/bIKtCyrwm7ExBzTIG6vOCI7CrfrgO8eXDu3sL8f8O1jtjpbEw9GXaHsmjNepLnJ8ZDo7eTlYxuD3zq0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6176
Subject: RE: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism

> From: Lege Wang <lege.wang@jaguarmicro.com>
> Sent: Wednesday, January 31, 2024 12:51 PM
> To: Parav Pandit <parav@nvidia.com>; virtio-comment@lists.oasis-open.org
> Subject: RE: [virtio-comment] [RFC PATCH]
> VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer notification
> suppression mechanism
>=20
> hi,
>=20
>=20
> > >
> > > > And for that may be current notification can be made 64-bits or as
> > > > suggested in your patch to have new location.
> > > After some thoughts, I decide to just make current notification
> > > extended to 64-bits for simplicity.
> > I think having 2 32-bit notification registers is better.
> > Existing one for avail desc posting.
> > New 32-bit one for used buffer consumption and re-enablement of
> > notification.
> > This way we get good backward compatibility and also the optional behav=
ior.
> > 3rd advantage of keeping them as two is when used buffer notification
> > enablement is done, it does not need to touch the device for avail post=
ing.
> Yes, indeed this is what I have in mind, I did not clarify it clearly.
> These two 32-bits registers are adjacent, and both are 4-byte aligned.
>=20
> >
> > In some systems, a 64-bit single PCIe TLP write may not be possible,
> > through rare, it may be there.
> > So having it as separate 32-bit used buffer notification is good.
> OK, I see.
>=20
> >
> > > Yes, I understand your concerns. Initially I intended to add new PCI
> > > capability to describe this new notification area, but found that
> > > this new capability would be similar to virtio_pci_notify_cap, and
> > > will introduce many duplicate descriptions in virtio spec doc. If we
> > > choose to extent current notification
> > area,
> > > there're no needs to touch current pci capability, the corresponding
> > > queue notify address to enable used buffer notification within a BAR
> > > for a virtqueue would look like below:
> > >   cap.offset + queue_notify_off * notify_off_multiplier + 4
> > >
> > Just to double check,
> >
> > If avail buffer notification is at offset =3D X Used buffer notificatio=
n
> > is at offset X + 4.
> > Right?
> Yes.
>=20
> >
> > > > If this multiplier is not useful, maybe it should be added only if =
needed.
> > > > Did you add it because to match the current flexibility of the
> > > > spec, or your hw actually needs this multiplier?
> > > Yes, just to match the current spec ??
> > >
> > Ok. that explains.
> > Yes lets keep things simple as X, and X+4 offsets?
> Yes, I think so.
>=20
Ok. Look forward to v1 with these small changes.
Thanks.

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

