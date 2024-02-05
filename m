Return-Path: <virtio-comment-return-9065-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E737C48291
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Feb 2024 07:40:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 668E42AC8D
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Feb 2024 07:40:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4D8469863F8
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Feb 2024 07:40:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3400F983F74; Mon,  5 Feb 2024 07:40:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 200A99863DF
	for <virtio-comment@lists.oasis-open.org>; Mon,  5 Feb 2024 07:40:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8pmno6YtJuck8WW++CjFQIlNN9EYdUIGMMx5xjuMqHFksXUv7qUmrBpiv+60tY+ErQM8cpFRs4u16OMCXLPzLlrT04PjJw6w3yhl8brCWGT6P4rTuYyDApiRLBgCenoNdBnIVyo5mPvcb6XaEv4SMSeyJ3jy+Yz9hk8oRtbbj0MO3ac+V254Lr236kUue5+vKqfxqBp8bm5t8MXCwc2YahAJ/PKOXhBG/+wfpetpBSVgXKztfd+pglk/cF5gObR+uaX6YwPov1TbZyP76YINGfcD/9TMZ6EVFodUpTV0dLjQNLPb1WE6wzIqq+lqYThkqoT9vZ1I3cMknehCYR5FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CxLPIR3GMNay63cASJev6hi2ioXpyT+qi2Sqok0wOA=;
 b=jxk/h3/eidDAiCw+a8rJIVBSX4fNe+MitWF6N9IisBPjSyvEsGCFGHDlo+5UJc9UjIeqjDwa6Kg+KoP138rYBDbBWJnyZRXs5F44p//WJCgfBj4rHgtPre849VROY9s+M4DmGW/ASZTQrAAF3HoZTMMvhtso1F6MVRetspbMFpUoUKtWETVvI4jrNjjF3xNRtzg0+R/zUakpStyLwOe+YVYa1hZbaQ/u2zFDrciKENkvI+Dvx5Nl1w4ecagGx99w096h6GJorIhXy5zaRMOJeG95NLJWkThNdWppHurJPE7sGQghej3CXhEvvUA2sz1NN/5jfL9OADLwVuFHxKmv4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Lege Wang <lege.wang@jaguarmicro.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism
Thread-Index: AQHaTzZzkxS4XClcDkWCFLA6ilSUorDx62oAgAG4RACAB8h7QA==
Date: Mon, 5 Feb 2024 07:40:38 +0000
Message-ID:
 <PH0PR12MB5481935584B62FD5ACE5FE3CDC472@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240125023001.1467-1-lege.wang@jaguarmicro.com>
 <PH0PR12MB5481C4AE095D48C6241C6366DC7D2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <SI2PR06MB5385F062A33B53FF56F88DCEFF7C2@SI2PR06MB5385.apcprd06.prod.outlook.com>
In-Reply-To:
 <SI2PR06MB5385F062A33B53FF56F88DCEFF7C2@SI2PR06MB5385.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB7140:EE_
x-ms-office365-filtering-correlation-id: 02fb32b7-3998-44cd-42a8-08dc261dbf49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 JCoC5whzdrMwGT0K2sOAoC4zUzqCxgR/oyDNcT4wfaMw7YAZZTQ0X3HVFATXDik7TaKN0RiCGH88pAI43hnX12wmDG5+M39JOpFasIjMfX7HHvxztrgQX/RokTX1kgnAtLtYB35yVwPNY667mENQzMUsNlmZBD3MGpGyAkXQ8LMkSTOTdz+BwmqeIVmHC52oCkgCxmT8dArHfLEEbvUAFIOlb8EXaUMOfDrs0C81lJJqTnZ22L1lcMUEffa7/LUDqrTqrYXsTqNC0nzf3VKBp4OP/3xqGCv5Y1tYLkTBnT8Evh7Pmr9/Lq23C8VDPPisuTNKiqTZhuGS6NO70KpwBgQizCcpRmTa8VCWnlKQpoy4EJFXRB4NyOAMZgTL90LXtBoYEVh0VFC8QyDlUT6yGe67l4u7XA3K192+vmtsPOdKl6yaGTE/Bt8+trGURA1Z9Q4CFEc6ITXHys9wa09ZjfOfylQ87PBUc1Hv39VtGfKsezMMkDLMPwrzKw+389BFMvi3ZXht2Vs85BKvMoLpQGH9OZNSb6gOhu1Hku3y9qHmAB9YwZ4CNyKVGEjR8wgDGNBY+NZTte46Ld3cN+jxRsDK9BzkKkv4mdEZHDCD4eeXiJeh1rXM2/TmY1pnXUVC
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(366004)(39860400002)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(66899024)(66556008)(2906002)(8936002)(52536014)(8676002)(5660300002)(15650500001)(110136005)(64756008)(33656002)(86362001)(7696005)(38070700009)(316002)(66476007)(66946007)(66446008)(38100700002)(478600001)(122000001)(9686003)(83380400001)(76116006)(71200400001)(6506007)(26005)(41300700001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LvqgRzGwJni/zLi142hOXp3UOFBFmwzwCIh1BKQIi3hdDKPs0czr25U7sEIG?=
 =?us-ascii?Q?olqk7+6sO9q4HP2NLcMyF436T/vRe43tCZ1i7h4WaXeAXf7cLip0TwViDma6?=
 =?us-ascii?Q?O9uz9SEAopd/JeLe5PyzvN8zQ7Svvzn7QUEKSUlg9FVO8HHivFjZBQSYx4Zy?=
 =?us-ascii?Q?7410HtoFvMPZhDeCYqIFp5TGSk2iIxdHkqoNRJg84ZWsUIdr0ML3Fxupx1G4?=
 =?us-ascii?Q?ewBILDeHy9Zs0NyMIj5gYcuuIkj/PtWUa2HOhNRJRiYDWUb5zdFAICHG0YGR?=
 =?us-ascii?Q?QMTQA6eJ5CQwkh11j50o7K3at8kxewQcpGkVPoA+JMHASoDnDGO8PHkcfuUG?=
 =?us-ascii?Q?STGffS+IHwG1I4RZPdbO2aHSC4INGDsVawpcMSpI20Cnbx294vDlEV4AGCP7?=
 =?us-ascii?Q?ifmLSZFtkh3rw0ZhT7n8y8Ffwuz6estyBvo1WdrBwwXRvl9cOlPTW8L/wI3K?=
 =?us-ascii?Q?GRvLA4L+dWzHbnVVAnoLeajQV68CF8tztghkE77yWdW+KlJGcoDxkewOC26q?=
 =?us-ascii?Q?5XJCx2O5G2gs3tc4YsD0tStjmg2/DAPsw8Elw7OdtBNWdgsiw7sR5iylW8el?=
 =?us-ascii?Q?Hxwwycieibww447dycZqDZZxXfe1T+4iQUKbDR6Y1wZPc4hyQ/lqzGQdYRI4?=
 =?us-ascii?Q?q08UnXm0yKLV0cVD0Um+v+KUEY4PR3mLAiABbFeEK9NvkvOO6j4aLOXUQgl1?=
 =?us-ascii?Q?xrSaHPMqsRFti5RxFCVnm1DOqc3+ynObWRunaTyQotG7LBTWC52RkmdMOKU8?=
 =?us-ascii?Q?6dMf6QUzNaeA+WB03xoiCUP7Pv1DoHflmVc1xUzQ4lRKV6zkAXdeKY8IsVgi?=
 =?us-ascii?Q?I6JMHBf1noCgyZbP8RkzJ9dDLfaGeAz68hl5J9aRBwGNxgZcWbioEPlTtb2h?=
 =?us-ascii?Q?4gafKgm9er1nWRbqFI0/eYWkImev4CGAl2MG1Kidpn/hokCsxLj7Kpoz51v6?=
 =?us-ascii?Q?amQ9wyAssKlFg6B+kWShWaDfKLHMFJfXoVeH2OjYT4NL4LjuQKAYuJrhb4rI?=
 =?us-ascii?Q?joGZ9oRN+b/XI1XpfUb3ny0hFOVrFVnN9xNd2Zgx5c0zRXcFTVPgERXRiyon?=
 =?us-ascii?Q?Yu/QRdUl3taojHpjW1iGfX4T3B5AHzUQb05UtxJs8f5rjoRQNNbFevJS3rcm?=
 =?us-ascii?Q?Hiwk2xkCW6lVm3eNOMRvDp9xBdZmAq89M+dqzGmZGhjba9ParhAKYB5xNkMc?=
 =?us-ascii?Q?zUFIoQ5OAxzITSezNSIGtg37j0xnKeoR7r9T9ORBtfEDa0m17GY2HWFtWOLO?=
 =?us-ascii?Q?YVpN7x2OW3sTxP5pCXQjvyMCsK+SZIBnrmPQ6t0X9Vioia42wy1/hudZuvJj?=
 =?us-ascii?Q?dLq2hk4BS9N768qevLM0NLERUAfM0hmXwWW1ueKi2yERPBwZr3Bcn1qc64kg?=
 =?us-ascii?Q?ntPmek16d8yP6G5qacIbiVNIfwg9AVXCqF5Kbpt/03rq9cjDZ9O2RHfYsF5E?=
 =?us-ascii?Q?DORCCqqzdzKrbjBH36j/yx78DDWNk7RIPJS+4vJhZZJLbHkE6Tk529vlbrVx?=
 =?us-ascii?Q?+gBjw/IuWI47GZY1etqnFhdk9Q5GRVXPZo9MW6e/WJJh2pXqrc5tJSSLAk6s?=
 =?us-ascii?Q?BX5zaGUbbQOiNFaiyME=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02fb32b7-3998-44cd-42a8-08dc261dbf49
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2024 07:40:38.4908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EZVPwpXnNK4CGpR6XBR2rx3MXocbsNaz8/Rsid9IvTZCodR6yFUgeNdV0ZNuAod9UWFrC3zUcl1jCV3DzMGsAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7140
Subject: RE: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism

> From: Lege Wang <lege.wang@jaguarmicro.com>
> Sent: Wednesday, January 31, 2024 2:10 PM
>=20
> hi,
>=20
> I'd like to have some more discussions about used buffer notification
> mechanism, thanks.
> > > +\item [next_wrap] Wrap Counter.
> > > +      With VIRTIO_F_RING_PACKED this is the wrap counter
> > > +      referring to the next used descriptor.
> > > +      Without VIRTIO_F_RING_PACKED this is the most significant bit
> > > +      (bit 15) of the used index.
> > > +\end{description}
> > > +
> > This forces the driver to process _all_ used buffer notifications
> > before enabling them again.
> > There is a race condition that used ring updates are occurring from
> > the device (without notification) and driver updates the value.
> > For example,
> > 1. driver posted descriptors from index 0 to 9.
> > 2. Used buffer notification arrived for 0 to 3.
> > 3. Driver processes used buffer ring from 0 to 3 and enables used
> > buffer notification for index 4.
> > 4. While #3 is happening, the device already updated the used buffer en=
tries.
> > 5. So device view of used ring entry is messed up as it already passed =
that
> point.
> >
> > Hence a better driver used buffer notification should be,
> >
> > 1. index upto which it has processed
> I would change it to " index upto which it will process next", the reason=
 is that
> virtio core driver codes have already a well-maintained "struct
> vring_virtqueue->last_used_idx", we can use it for notification, and usin=
g this
> value, the device will also be able to learn the driver consumption rate.
>=20
It the index upto which the driver _has_ already processed, right?

> > 2. explicit enable/disable bit to enable the notification
> I wonder if there's a case that the driver just notifies the used index i=
nfo, but
> not enable the device notification,=20
Yes. there is a scenario.
For example, device has received 28 packets.
When the driver is polling, it was given budget to poll only 20 packets. In=
 this case NAPI context will come back again to poll rest of the 8 packets.
In this scenario, it is desired to still update the polled completions (use=
d elements), but not enable the notification.
Notification can be enabled later when remaining 8 or more packets are proc=
essed.

> the driver will always need one enable
> operation finally. And the notification data would be similar to:
> le32 {
>   union {
>     vq_index: 16;           /* Used if VIRTIO_F_NOTIF_CONFIG_DATA not
> negotiated */
>     vq_notif_config_data: 16; /* Used if VIRTIO_F_NOTIF_CONFIG_DATA
> negotiated */
>   };
>   next_off : 15;
>   next_wrap : 1;
> };
> next_off and next_wrap will denote last_used_idx info, and vq_index or
> vq_notif_config_data is also necessary, so for one 32-bit register, there=
's no
> room for this enable/disable bit.
>=20
Right. There isn't enough room for enable bit.
I see two options.

1. When device wants to still work with 32-bit doorbells, it can reserve to=
p bit of vq_index or next_off for enable/disable.
Here the restriction is the queue depth would be limited to 16K descriptors=
, which is fairly large enough.
Or having top bix of vq_index is better as, it may be well within limit for=
 a device to offer 32K queues.
For non rdma devices 32K queues is also seems reasonable large value.

2. Device can offer 64-bit format where enable bit is located in the upper =
32-bit.

3. Or may be option for the device with two different feature bits, because=
 64-bit doorbells are relatively new for virtio to adapt to.

>=20
> Regards,
> lege.wang
> >
> > These two fields clearly communicate to the device, upto how much used
> > buffer is consumed and understand the driver consumption rate.
> > This way, there is no ambiguity for device on where to write next used
> > ring entry.
> > (where to write next used entry is not driven by the notification
> enablement).
> >
> > And the explicit enable bit indicates notifications are enabled back.
> >
> > Technically, only enable bit is needed, but doing #1 is helpful for
> > the device to understand driver consumption pace.
> > And for that may be current notification can be made 64-bits or as
> > suggested in your patch to have new location.
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

