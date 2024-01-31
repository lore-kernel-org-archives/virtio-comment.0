Return-Path: <virtio-comment-return-9053-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481FCC47258
	for <virtio-comment@archiver.kernel.org>; Wed, 31 Jan 2024 06:45:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 84E182236B
	for <virtio-comment@archiver.kernel.org>; Wed, 31 Jan 2024 06:45:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 585F8986885
	for <virtio-comment@archiver.kernel.org>; Wed, 31 Jan 2024 06:45:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3A0E7986879; Wed, 31 Jan 2024 06:45:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2990A98687B
	for <virtio-comment@lists.oasis-open.org>; Wed, 31 Jan 2024 06:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XkPiVeeFhI4OMnFhkRyvc0WbQgAooFgTR4QJ6y0mEV9IO7Gw+1rK1H0yQ1iFuOYxWIwepx4WLu5gQJLaS9XiCloByynwOqDjn/gZM8wUjf5C3R40TFYCy1Cs071QVT7NJe96Rc3pRGNZOj5U9d6qD3+KJ4mqXjD915LxIJci3870VrhI1YDtWZ9Vz4r9mNZZukAlXlVPIOD3r/Vj9ZygwIoy2xf2rGR5YsolfyCAKz5Pd1QOYZ5WgNRe0XBlJL20wGmZBlH4zZrSPhmJk9ElyhmSz1mX/JylCU7VMvuoCn1GH0jVVrRL7uGKPKZTkPLgpPOe32A8JfxtXxoJq6xE+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7+PToQW9Yf2Xc5Bqg4dR3wUqoFGRNJwz5V9NkVZwjw=;
 b=eDNrJrQ61VY6iqxMXikmOkVfr7flhGZU06oC4QlyYNS6QfSt+hl6UwPEQmQ2KOLBZ6wQ05uWJhEOHBIxAL8kgli+rcLv6oyIOgssg9sfM85Xuq5ugSzWJg+uv5vW5HjlhhiFxG1boyST4jrjTIGRD2IT0AjojvH3XZCzxNcrLpzAuujIspx07OmhpU3aj6pJKtNapwGf14y98ioj4Q4b6E02j3V99Xz0t3qUMGB4jxtX0hcmZzDKblhHiWQCd1PKZRhClxzoqrvEe0o5hlIZgtFcaEZ/tmDGW+r/fmOSGN8OUh5Lu1xTZG9ZBB9CYIjTg5mtOsfQwXbqcQDjhMai/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Lege Wang <lege.wang@jaguarmicro.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism
Thread-Index: AQHaTzZzkxS4XClcDkWCFLA6ilSUorDx62oAgAGU+ACAAAH90A==
Date: Wed, 31 Jan 2024 06:45:04 +0000
Message-ID:
 <PH0PR12MB548186A6AE8A993AF50FA91CDC7C2@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240125023001.1467-1-lege.wang@jaguarmicro.com>
 <PH0PR12MB5481C4AE095D48C6241C6366DC7D2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <SI2PR06MB53850CBD8F76EDC65DF2DD38FF7C2@SI2PR06MB5385.apcprd06.prod.outlook.com>
In-Reply-To:
 <SI2PR06MB53850CBD8F76EDC65DF2DD38FF7C2@SI2PR06MB5385.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB8071:EE_
x-ms-office365-filtering-correlation-id: 67d204d2-e3b5-4d36-431e-08dc222827e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 GJETfdhr2SR8S8CYOjyWdbsEmhmhQ1rJA0qAbkELjwN7Gmw9Ck57IGqLv9EHUtRzxd5VC80aeV8FK0J+wcvASd5rZDBd5hsYc5606GMCiFgsnQtZnO4HXrEepEKetqUSCWNL5Zy71vGknNNklDP/r8pfh5IwiAo//Qg82A8xlTLS07YayLqJucW4b6w034gmTo8YYtZSf9KNCwGxPE9oGnZmnxNHGHk3WZLbL5GDqAP1vLCP0g+C94SocVRCTBgbQCq8C0KlS1tgmZ+A46ssPx+GDLvOSBtRDcrhi3oCZfPbSzdpPhO4qQ8/jIEzHN96u1omIvgYS/7arMFfYonc9GqEElly5412yFlpiTFK2g5N17zm6duUPQTZOTKzGbl7GFHolQHuvghX4VFxlbYVLVX6KwLMwUAY2CDDfO8Tt0Ak4mmNoWv0/VoUxMM5ZKo03aJZpUGzW1Sop85rLNjxLozf6BcSbghynQ+v4OF1DLh9wBcU5JbIDzgA/59GVFpwpJaH0WjYaT3p12hTVYVAIF05XGlN4xzId5XySylqITXBBvbBxK4nAkIypPda4sonnZ+JYx5uHml80yDKBWFn+bour1sQfjIWafjiWHoUN4sgWedDoYJCdM5jswRHBygYilGjqgczZVkKtmdzqoLtIA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(396003)(376002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(83380400001)(9686003)(26005)(38100700002)(122000001)(52536014)(15650500001)(8676002)(8936002)(5660300002)(478600001)(2906002)(966005)(6506007)(7696005)(71200400001)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(110136005)(316002)(41300700001)(38070700009)(86362001)(33656002)(55016003)(84970400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?sMRTNaB82mSSMP3E057EXtydC94EcIvgzKbQ/hb27KWunAZt2gtaBp0p8z0a?=
 =?us-ascii?Q?pjjhhbHewWsFyt05R5vzIit9ttHIWYCBDleWLS1fINQDrKHMxQec2HiprJ+6?=
 =?us-ascii?Q?OvZjQOSAbdnPAcyg1ybgfcdgOmb2Zr5LDrVXjYlieuf7rNoxriT+OQkzCJ+D?=
 =?us-ascii?Q?BCFZ7q6gkwqQ3n/rRDi4LroRGc6bS1g6xYpZHys85X+0pmciJVVFXuk2j7h1?=
 =?us-ascii?Q?2q2/ZNrt9D7x+yOl8Vx7oYf2MP0HAnFDytrLIuqy9B3ndthmc2hKY9THkW7P?=
 =?us-ascii?Q?bCXmi2hOSs7nEpUWAt5XoqxXYkR6Pixm+l0uKQ1o3aGTLQ+3YBEr1zufhrno?=
 =?us-ascii?Q?GmDvYmdNVq46B9DxosLkx8GmWelU/ZSPA68B26Wpb87DbWFWaddtHzOfV6l7?=
 =?us-ascii?Q?vkv00jfHKRx5DRWQDzf6dVT8K224aTGf20/RCHTRmWBJT2EVI5ZO2U/w4g7i?=
 =?us-ascii?Q?4G83XfH3fzbUBZ/BfhCn+k0J7aBRRFtuGELsJYba9xhKUGx27MBpSV+FGxUl?=
 =?us-ascii?Q?O0+F9BF4Xhq7XvZFXsKg5Nnf1qLzOpl768wAhZsVvAcGavmYRLT7vBYUMu6s?=
 =?us-ascii?Q?g6rFo8R8GR7DZ68CytADRDhMsY/6uK972vcW7K0tYVjY5y1EhpnyFsJLzsRc?=
 =?us-ascii?Q?1uajrRKgsOsFRdY9XooVpbGeZ5/lC3w4kHmhxbxGWB8oH0oGI/SDyzoNfmVd?=
 =?us-ascii?Q?8/UBuIzS73sP7N9gQGaFcfKnywqIC8RMaRkOVJ575OVjl0JK0tMyP6rgAuBX?=
 =?us-ascii?Q?2qO39Wosa1ZQzmWX8vGUs4LL7PgjM/iAzPhgs3xTRVVrsYTSz+9Ke3613iN4?=
 =?us-ascii?Q?hDNGgZyseH06VaSxMvtub84QPlv2paWgoMXt2PTQyPKDKE57CtY6qWAJvlD3?=
 =?us-ascii?Q?WbmZTLkFdcnDJrpYLRVhKT6KqzrcW0B2u8Pxv5NoiAuh5ZlGDRB1EFSFHAEO?=
 =?us-ascii?Q?CKaiSccOLIeceZQo9QDsY2vwr1RxKZDRAMmVdNZcPejLvc6mGnd4QzlBrY8Q?=
 =?us-ascii?Q?Ts9oeAY9puaOvtcegRY0L3R5QAFIZPViZ7S4gpifLIID9A7Vp9qIVWGxf32i?=
 =?us-ascii?Q?KBP6iUzU8k4fbV1URaZVsEv7/CZ18ZCjfW0J4gMpb4f0ETq8WVWzlMvf0Lx4?=
 =?us-ascii?Q?dRgf8GCGbiZy0OOfZ7g3u+DDO2HVr/bA0mU5Y8104uBXBle2ouTcMX80ez1s?=
 =?us-ascii?Q?vNzplRHzRUqurJwaKIJFUE6pQFf+8IIrTW1cTVWDF5JqzBjk6u3pZoGifKqp?=
 =?us-ascii?Q?heZPTWGGZ+/ZkDJC4vvO3UMWVjcNH8GgtBUGxBnZjiXd2xLtLSwqqk8demCy?=
 =?us-ascii?Q?srfn4UjuWklb3ZhGV252Emzhj1GE7+zFz9qXvaRUqrswbinaA2xMMx4CfLog?=
 =?us-ascii?Q?t0GDZbQ1byBSv99/XWeS3IolyBHQ5a+8YQKWUprRJqBZb+rpR+mX24SpLTVc?=
 =?us-ascii?Q?N5244SZ7eMuf2EwxXk1Pg8u19FRPv1RJpLxyQHQ3jtyO3jssEQZDhOA+gJbn?=
 =?us-ascii?Q?Uq0QokwfTgqWMs0PXqKuClM25Dligzvj0vQr7yqddcIsp/L4Qo8NMJhAju/a?=
 =?us-ascii?Q?BfZuLhk03msOBeWeRoQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d204d2-e3b5-4d36-431e-08dc222827e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 06:45:04.2550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: obG0anuc2RH8fUe726gEQTw/x0CjBsUXitZHCldkdwFMJ2N9Yu7gCzxhudboxAW2dyFtTd8utEoVwIaVmAa3mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8071
Subject: RE: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism


> From: Lege Wang <lege.wang@jaguarmicro.com>
> Sent: Wednesday, January 31, 2024 12:04 PM
>=20
> hi,
>=20
> Sorry for late response, I took a while to understand your comments, than=
ks.
> > > notification area in PCI bar. Device will receive this notification
> > > reliably, and device knows that it can issue used event now, but it
> > > may choose appropriate timing to send used events according to its
> > > notification coalescing policy ,
> > now
> > > it also does not need to DMA guest memory to obtain notification
> > > suppression.
> > >
> > Good description describing the problem and solution well.
> > Yes, we discussed this requirement already before at [1].
> >
> > [1]
> > https://lore.kernel.org/virtio-comment/1689820586.8879051-7-
> xuanzhuo@l
> > i nux.alibaba.com/T/#mce485d2c7187b800575c5a63d83b2e9e77f474cc
> Cool, thanks for this sharing.
> I'd also like to help develop following kernel virtio core patch for this=
 feature if
> this spec patch is accepted finally.
>=20
> >
> > >
> > > +\subsection{Used Buffer Event Enable Notifications}
> > > +\label{sec:Basic Facilities of a Virtio Device / Driver
> > > +notifications / Used Buffer Event Enable
> > > Notifications} This kind of notification is only necessary when
> > > VIRTIO_F_USED_EVENT_AUTO_DISABLE is negotiated.
> > > +When this feature bit is negotiated, the device will disable later
> > > +used
> > Remove the word "later".
> OK.
>=20
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
> > 5. So device view of used ring entry is messed up as it already passed
> > that point.
> >
> > Hence a better driver used buffer notification should be,
> >
> > 1. index upto which it has processed
> > 2. explicit enable/disable bit to enable the notification
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
> Thanks for this valuable suggestion, which clarifies driver and device's =
behavior
> clearly.
>=20
> > And for that may be current notification can be made 64-bits or as
> > suggested in your patch to have new location.
> After some thoughts, I decide to just make current notification extended =
to
> 64-bits for simplicity.
I think having 2 32-bit notification registers is better.
Existing one for avail desc posting.
New 32-bit one for used buffer consumption and re-enablement of notificatio=
n.
This way we get good backward compatibility and also the optional behavior.
3rd advantage of keeping them as two is when used buffer notification enabl=
ement is done, it does not need to touch the device for avail posting.

In some systems, a 64-bit single PCIe TLP write may not be possible, throug=
h rare, it may be there.
So having it as separate 32-bit used buffer notification is good.


>=20
> > The wording "disable later" is confusing, does not read proper.
> >
> > May be to reword it as,
> >
> > This feature indicates that the device will disable used buffer
> > notification automatically after sending one used buffer notification.
> OK, thanks.
>=20
> > > +
> > > +        le16 queue_intr_notify_off;     /* read-only for driver */
> > >  };
> > I think it should be renamed to queue_used_buf_notify_off; This is
> > because notifications are slightly worded differently than interrupts.
> Since it may be simple to just extend current notification data to 64-bit=
s,
> there's no needs to add this field.
>=20
> > > +        which this virtqueue is located.
> > > +        \begin{note} this is \em{not} an offset in bytes.
> > > +        See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus
> > > + / PCI
> > Device
> > > Layout / Notification capability} below.
> > > +        \end{note}
> > > +
> > This is strange. The notification is in the PCI BAR, right?
> > it can be done simple as just the BAR offset.
> See below comment.
>=20
> >
> > >
> > > + queue_intr_notify_off. Only if VIRTIO_F_USED_EVENT_AUTO_DISABLE is
> > > + negotiated. */
> > >  };
> > >  \end{lstlisting}
> > >
> > I would really like to avoid extending this structure which is not in
> > the PCI extended capability.
> > And we are almost full with 256B limit.
> > It is the time to have the PCI extended cap defined and place this fiel=
d there.
> Yes, I understand your concerns. Initially I intended to add new PCI capa=
bility
> to describe this new notification area, but found that this new capabilit=
y
> would be similar to virtio_pci_notify_cap, and will introduce many duplic=
ate
> descriptions in virtio spec doc. If we choose to extent current notificat=
ion area,
> there're no needs to touch current pci capability, the corresponding queu=
e
> notify address to enable used buffer notification within a BAR for a virt=
queue
> would look like below:
>   cap.offset + queue_notify_off * notify_off_multiplier + 4
>=20
Just to double check,=20

If avail buffer notification is at offset =3D X
Used buffer notification is at offset X + 4.
Right?

> > If this multiplier is not useful, maybe it should be added only if need=
ed.
> > Did you add it because to match the current flexibility of the spec,
> > or your hw actually needs this multiplier?
> Yes, just to match the current spec ??
>=20
Ok. that explains.
Yes lets keep things simple as X, and X+4 offsets?

> Regards,
> lege.wang

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

