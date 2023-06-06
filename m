Return-Path: <virtio-comment-return-6181-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E11C7EE37
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:44:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 449EC3309A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:44:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2F0D198658A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:44:09 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2494098657E; Tue,  6 Jun 2023 22:44:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 11C6F986583;
	Tue,  6 Jun 2023 22:44:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJMApdjh/xShAhtuNgIFKSWONUhVHMvPLJSbxTXmuYJl7CzMndpWkZw5NnjouK7E7dKTfOaFond8KRYrrxM99maEdIhOOBQq4+vUt6HKwqZ5xnEo2kefBjZOxysCdXU1wR9jNQ1dIzCwHn5KDp6IVsN1z4ijqm+uVMwdUj72/5y2m+yVPArktELxU9V09LszoylG0L4hhT9cQKTbSRrkbjDhvolRFS6P+Wle07Faj+lciunfaIv5MRCtszOwe7HFH+Kil0+jFX49gcaKj1jf6zCZV5ptCNp0ODsXoFey6cawLiQhhk94UkR6NtBot7RCos3WwrMdcR1EEUvw4ssP2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWlAbtdvSBxjaFGuFMTrork3q82HPufGLz4nTvphLqM=;
 b=n+7vu2P21Zpm6dDrF/3CV27/b55oMtDmyhYQLyi0/7AW5xf5edwS0Z+cm2BCHFINhfpkNyYIMM/tab/XMP84m+y+YVJvfHQPlQ2W3b/WuYiAC7F8Xx4sQW4BZizJkz/sSX6OAQIToqhVRODjT/DXlIUh1oqXmEoHFCH3dKApU4Pi+aLNm1r104vokw30vPQt+oWAdKLcJO3aujLEXr504eE0ZqU1a1WpwvQD0k58cpY8Z3Pk4jMVWuYLPhcf6UTiUtdSa8XC4E0wxBajpt0yfC2AEPYfATnpp1Yl0eBTgIAq6m39dyBYRfi/jbyhvae+Jr8nMBq99hnzqusrBysnxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [PATCH requirements 3/7] net-features: Add low
 latency receive queue requirements
Thread-Index: AQHZlNTnfeMNeIivvEaINueloLdVuq9+ZBsAgAAAyVA=
Date: Tue, 6 Jun 2023 22:44:04 +0000
Message-ID:
 <PH0PR12MB54818B593D9BB94F2ACED28ADC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-4-parav@nvidia.com>
 <20230606182640-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230606182640-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB8301:EE_
x-ms-office365-filtering-correlation-id: 1c2fd886-561d-4124-62fb-08db66df87d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 qqqTX+ZdDEVwrR99juHrxvQXDkBBJ4JGTX1MiXMq99Lp4g661SCU7oaN0Up8CUK5pMPqIuMTim+lpuLjBxka/bb84hNvhHnHDC9y8TobfbEajBiF3cTvBkNQe9m3ZNJE+YilgxLFsAcWyakRozRMTVsopiIEf4p9J0mESbgYv99nFk1EiYEsdH25Vsx2amzy/JDgmbu96elpf0tKaG7DWgrKoEQSY0ROhUOAmjIOqJOCA0baKBndZeSzVoL865OG2oyiel+eV5pPb/Ako/t1dNdfAmPflnBCoH/SFL4TizPnrcQba0pZBCV4ysSQvHgotSDRfuAgq0FBBn0Owlg3i7gFq+0ZgNrdwzs+XOG/u+7NXfWbkR4bCN6mbaIgTfBAwbtG78dE1g+MYMyHoMUJUAq1m4nm9EvIvbP1WjIiWAiJGdmw5m0Z0Kkpvdn5JOSW5xP1EI4WGNvaMQnvQoGRvRvGu2rJMeRCICm8pNEf2EEWxSHFGSH4vnKb12stOourCwV//RlHIP+LVLA4DY+Ax2ti7p30T8orW+ccicRdr2WyQGoApD8RByiXl+Eu3t+59SafU8YaO98y36SBtdgn2RQt7sdc3PpCkyVcfjL4V1grumTuuEIrodW4S/CmMR8C
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199021)(41300700001)(316002)(54906003)(122000001)(52536014)(5660300002)(2906002)(76116006)(66556008)(4326008)(66476007)(64756008)(6916009)(66446008)(8676002)(8936002)(66946007)(478600001)(71200400001)(38070700005)(7696005)(86362001)(186003)(38100700002)(55016003)(26005)(9686003)(33656002)(6506007)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MN9pi5QCV7542fflL2ABwli/ijpNLKD4yM0R+pdH54u89IT7wk37YM/iU7G2?=
 =?us-ascii?Q?e16/P9DFxi1KSEZb/s/oMhDA4Sj/O8mKu0BD27cth2BRETz78O/rIigUX/Tb?=
 =?us-ascii?Q?BcNRhRhgxShjkmJ4EKd69HN4jtl1GBfQ6TeDdoxRbJQAxv0iGZfI8K0lq31S?=
 =?us-ascii?Q?B8fnsRFKLFJQV1q2/PPZNlHiTSvUVVEdvlcJK7/z0gQ/wAkkwz9L7YchiPjB?=
 =?us-ascii?Q?WZ1QOspeEOTqvjzzJGKUTAkvbw8dLzGVPDqOqu8keYiiyqB8oIx3zKm5pnXO?=
 =?us-ascii?Q?VuNYLHcXLRaUOlX32P1JgmZrEb8Azu6FhJv99e7A4kVZWBFPiDp7imW4DkXN?=
 =?us-ascii?Q?BY63N6Oa29tDhQjkzStXZ0SBYfIHBZBV6qC17imk+PZ5+bTDitu0PzgyfyxH?=
 =?us-ascii?Q?YItJC9wnMIHCfkZVrU2ZRrq6bkxd8MkEFRp9GjaDVU124Blb2UayY/4C6cf3?=
 =?us-ascii?Q?d8fMA3YSoslySpgJfoiJc+aPquKM1CHVTMf+nBmzUaSYNfY2VeC4KiSCHZYc?=
 =?us-ascii?Q?jPOLyR7asT1aIAkt4Y968NZAm2vAnMrDjQPLquYdTtj+a3Gbg9kCzMsVSId1?=
 =?us-ascii?Q?3/pjiJmj8076qmohUz8Jki8qPZwMsiz4Zn17wRp3qTthie8e9o0SQ2sutUEJ?=
 =?us-ascii?Q?O016HI2e9v7+CiW0x6IwyR8PjNWTXTEwYhgYLZE9gPZrMdQMraYNADgtTrCU?=
 =?us-ascii?Q?S3Thx0qOJnuQhTJHLWafWU3KlTZaOKJYCxo3/5SR2HsNyK9crfOAeb25rC2K?=
 =?us-ascii?Q?sUDaF9XpcqsW7rpOgoA1/fA36nlkZoKongYj08iQiQauw8x3+L4TtGrL/BL8?=
 =?us-ascii?Q?9PkXkFutXAY4oHQyR6YAmWjytRZTX6lRDHvUMJxCU28hpq2f7FUOvl6ls7gu?=
 =?us-ascii?Q?B6szjjONWFLNMV+LtHOIlIEI3bn3RfFRXKtL8opbPCq2MYiUl8wxHbaeKXbb?=
 =?us-ascii?Q?K1eL76Ly2oRByxpZ2FGMri2RGKOjgRg9OKNgBukY4sBRyTFOciovNwsJPZC6?=
 =?us-ascii?Q?LrdIDKV3IDBXBBoACmk29DRsPv01VclLgxifxvWemuLxzk6fMchW78D/nLrt?=
 =?us-ascii?Q?CPK/74ZTQB8RwyfIxz2mU2VE69Q2EAGDFiDT2d7yCOQ5njcgeIJjuQhMRh54?=
 =?us-ascii?Q?c8NAbSlssJN0iwFLMXCkqPtjP3UMoFkGnPRUf32TIzBDTFMWRxoGiHGmvuTk?=
 =?us-ascii?Q?WBoduCni5qHIluznO3fMzMWL+RAjN3SG3QZNVB0++5dSuzUlwI3HCUUnkXh2?=
 =?us-ascii?Q?BClu6ThB+HS53rKynPSYUitK+5XkVZCEijkDeDMBHm9PAEJwiyGQApaBDthB?=
 =?us-ascii?Q?uoPomzw5o+s+2He8SY+liPdDSENPLYC8K85aLbjfU+l8aIBMGaUZ/W+6oH3g?=
 =?us-ascii?Q?v5ZyFYlZ7+C7quk7lTOcyJoykX3fB5bcyvjR3Jg1KFOMW1xf+5ToZ9IRuF39?=
 =?us-ascii?Q?V2XN6H02l5HFylywLJ9vIQRN/WcFDzSNNUfcsM6Hh36nrpfCAy0AsxOdMhji?=
 =?us-ascii?Q?pZFmp/LXZnHKGmORW7IuSZ1IbTR0e3Lo42REW/1URDRILkAwOKpalrdrf+kZ?=
 =?us-ascii?Q?Cz/mUsBtjkE3JRunL/A=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2fd886-561d-4124-62fb-08db66df87d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 22:44:04.5191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3QKGi/6x8hWks6EPjSoKgl4MBzKjw+lvSth3DEx1/CvbpbCJy9Syp36kH6/pSS/riSThm5A1TjfrxlseyPzvSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8301
Subject: RE: [virtio-comment] [PATCH requirements 3/7] net-features: Add low
 latency receive queue requirements



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, June 6, 2023 6:33 PM
>=20
> On Fri, Jun 02, 2023 at 01:03:01AM +0300, Parav Pandit wrote:
> > Add requirements for the low latency receive queue.
> >
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > ---
> >  net-workstream/features-1.4.md | 38
> > +++++++++++++++++++++++++++++++++-
> >  1 file changed, 37 insertions(+), 1 deletion(-)
> >
> > diff --git a/net-workstream/features-1.4.md
> > b/net-workstream/features-1.4.md index 55f1b1f..054f951 100644
> > --- a/net-workstream/features-1.4.md
> > +++ b/net-workstream/features-1.4.md
> > @@ -7,7 +7,7 @@ together is desired while updating the virtio net inter=
face.
> >
> >  # 2. Summary
> >  1. Device counters visible to the driver -2. Low latency tx virtqueue
> > for PCI transport
> > +2. Low latency tx and rx virtqueues for PCI transport
> >
> >  # 3. Requirements
> >  ## 3.1 Device counters
> > @@ -107,3 +107,39 @@ struct vnet_data_desc desc[2];
> >
> >  7. Ability to place all transmit completion together with it per packe=
t stream
> >     transmit timestamp using single PCIe transcation.
> > +
> > +### 3.2.2 Low latency rx virtqueue
> > +1. The device should be able to write a packet receive completion that
> consists
> > +   of struct virtio_net_hdr (or similar) and a buffer id using a singl=
e DMA write
> > +   PCIe TLP.
>=20
> why? what is wrong with it being linear with packet instead?
>
It prohibits header data split, it requires multiple DMAs for the metadata =
consumed by single driver layer.
Data processed by one layer is placed in two different locations.
This hurts performance.
=20
> > +2. The device should be able to perform DMA writes of multiple packets
> > +   completions in a single DMA transaction up to the PCIe maximum writ=
e
> limit
> > +   in a transaction.
> > +3. The device should be able to zero pad packet write completion to al=
ign it
> to
> > +   64B or CPU cache line size whenever possible.
>=20
> assuming completion is used buffer, these are eactly 64 bytes with packed=
 vq,
> and they are linear so can be written in one transaction.
When a packet spans multiple buffers, they cannot be written in contiguous =
manner.

> if so why list requirements which are already met?
> if you want them for completeness mention this.
>=20
> > +4. An example of the above DMA completion structure:
> > +
> > +```
> > +/* Constant size receive packet completion */ struct
> > +vnet_rx_completion {
> > +   u16 flags;
> > +   u16 id; /* buffer id */
> > +   u8 gso_type;
> > +   u8 reserved[3];
> > +   le16 gso_hdr_len;
> > +   le16 gso_size;
> > +   le16 csum_start;
> > +   le16 csum_offset;
> > +   u16 reserved2;
> > +   u64 timestamp; /* explained later */
> > +   u8 padding[];
> > +};
> > +```
> > +5. The driver should be able to post constant-size buffer pages on a r=
eceive
> > +   queue which can be consumed by the device for an incoming packet of=
 any
> size
> > +   from 64B to 9K bytes.
>=20
> possible with mrg buffers
>=20
It doesn't scale to post constant size 64B buffer.

> > +6. The device should be able to know the constant buffer size at recei=
ve
> > +   virtqueue level instead of per buffer level.
>=20
> the bigger question is not communicating to device. that is trivial.
> the bigger question is that linux IP stack seems to benefit from variable=
 sized
> packets because buffers waste precious kernel memory.
Want to avoid the wastage and still achieve constant size posting.

> is this for non IP stack such as xdp? non-linux guests? dpdk perhaps?
>=20
For Linux kernel guest.

> > +7. The device should be able to indicate when a full page buffer is co=
nsumed,
> > +   which can be recycled by the driver when the packets from the compl=
eted
> > +   page is fully consumed.
>=20
> no idea what this means.
>
 Instead of driver nearly allocating a page and splitting into buffer nearl=
y of same size, an approach to post the page and let device to consume it b=
ased on packet size.


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

