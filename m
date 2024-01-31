Return-Path: <virtio-comment-return-9052-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF68C47258
	for <virtio-comment@archiver.kernel.org>; Wed, 31 Jan 2024 06:33:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7AF032AC49
	for <virtio-comment@archiver.kernel.org>; Wed, 31 Jan 2024 06:33:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4BAF1986885
	for <virtio-comment@archiver.kernel.org>; Wed, 31 Jan 2024 06:33:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 29528986879; Wed, 31 Jan 2024 06:33:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 154F298687B
	for <virtio-comment@lists.oasis-open.org>; Wed, 31 Jan 2024 06:33:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OdA9rO5RFUCBxd0f9XajbhmgyUVFc6VwiCt9SfZ3Q3C7+1eFYtYHpCU7kls4QT5pS/5Fh3F4dcWkhTz02Bd6+NPOxi3xHLjGuhbf/YgkpbyQlUbewD2UTUyls3wtFgygF0kLhumMrBg0Z4zTI/I/vguhDl6DFeKDhbKm6y09cQ9jtpUZTSROIV5TPL376uBpkvA+g3oyk+0E0zNeWvE7fLfoW0AV2TrptnZu2Bu47KwYa6NObq8vFjhchPaS2Qz1srWnSAubguxTRRFXIjqAamMDRsURka3+Vn9xZrw/eXlBqmIyH4jtkHMPUzavMVlxJXmmzcQJk/jHpHhsUzAvVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsGhjcHAyD0mGuOkQ68Gk+a243qYr+tejg0GVr3riXc=;
 b=fR3xBil3bpArT9Ehm1bZW0F+fP3kT4N+sfWWsarZ7BtgCrnebIc37pPJaZo+fcRQvtmRQl9OY3dHMacH/0H1JEwEDfGjmysxuEorjL2cvyMZ6qJzRRSoXjyCLxolVq4AnoJbD6yGig24vdaZt985de7OexvEni1YYvaaVPX34g6QR0rksQXQqB42rC+Ndo8EeLJkpSVGcRRsFlJd9mEuxKB5ypBExIXMbawUS0ykUtHSEWullMmTBW/ZbJsuQZG7IHXAVU7VXL12jIz03/qa2DtR1uWH9dyINZpv+ZS+cA906dGiW9H/6Qah0ICBCnp/uC3w+5qf/rKo5w/W/4MXHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
From: Lege Wang <lege.wang@jaguarmicro.com>
To: Parav Pandit <parav@nvidia.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism
Thread-Index: AQHaTzZn/4IbS5Ps60eRQZJfNPdC27Dx83kAgAFW6HA=
Date: Wed, 31 Jan 2024 06:33:30 +0000
Message-ID:
 <SI2PR06MB53850CBD8F76EDC65DF2DD38FF7C2@SI2PR06MB5385.apcprd06.prod.outlook.com>
References: <20240125023001.1467-1-lege.wang@jaguarmicro.com>
 <PH0PR12MB5481C4AE095D48C6241C6366DC7D2@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB5481C4AE095D48C6241C6366DC7D2@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5385:EE_|SI2PR06MB4107:EE_
x-ms-office365-filtering-correlation-id: 2dd5e63f-0369-48fa-5dea-08dc22268a4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 QyqOZRwYz7j5bPhYy0PT1sKMFTj8D/kH4786XgwsdvopK9RnMPxXKKj8W7fFpJ3DCI20fBaS/K6yB3Ax/q9pUcI06vXEFxmqbT7JIkPbNdINQFM1OabvuRDflhfheZcgO+cgeLno7dOT+rn885BvmBnHwGs5AqeJAnfAYGqAY8bAkGdakhvK4D0TFD+PyiJTjesEK3JwUItbgJZjweBfnHFXF/++LLpeUBaOKZGWvnBMvm385l1xlZtEuce2LZCm7dDS1BIBhqv6pu9ZtPZTVX3akXxM8Jcero8ecilpuFvEgMyQ6M1KRL49v60pGKvD2PD48AnWrTgR7tG011UeidDuPkv9MCtB/dyonJW1LBGpk+AqmI6N3aQC4PqGHjkDzSF4ulS4eAXzs0QLwV2h4ieMwLRgUHDk9sZ4vyFreguu/YFf42qyaJE6HfcJtLisO9Mrgvprs6+sySM4ddq1wJvpC/VMilLpiCxatzUi4L3KPJpXS5FOMWGytulzbpLyNS2HRookBOjREDDSz6UxJtS0Uw/htG9XNX0zd20Alm+25/JJRaHSSoW4sDYa29qcEp4wfZD180rrf/KTwLtFPFrgmJ8oLMYoT8Yew3xnBXg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5385.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(346002)(136003)(39840400004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(41300700001)(33656002)(52536014)(8676002)(44832011)(2906002)(15650500001)(5660300002)(8936002)(86362001)(110136005)(76116006)(316002)(66556008)(66476007)(66446008)(64756008)(38070700009)(966005)(38100700002)(66946007)(122000001)(7696005)(9686003)(478600001)(6506007)(71200400001)(83380400001)(26005)(84970400001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?TFUgkPP/uGDV9hFJBscmv57HdjxFHkd9CXWXud0u3glZ61vTNWGT2aJF?=
 =?Windows-1252?Q?2JSoC+F1963Czk3P+gGAJTE3OS7o+mFCYXUlqQZKdAzSIyFL4TQc/Df1?=
 =?Windows-1252?Q?+v8tFaajVY5YWLEu9jdthamyJrbquKdlgL57hnu+dC0QFtFWBGXPgTsD?=
 =?Windows-1252?Q?YaKERIVabBPwq0YFzJEsPopmWuXu8rTMt/30g6L3Big2vl8aDlG0xcOg?=
 =?Windows-1252?Q?RRWM77S5OwQjYe6dfK3tgK+PmbmzZ4Y/PlNXEyVLALH8DW/vDB10nIXD?=
 =?Windows-1252?Q?Y/qtExFYnzsckZIQK2dhSjIVFopzjsAoWOr2Sc5/hdVhcB4Wi12y53ZJ?=
 =?Windows-1252?Q?bVb1GLWQvT1aiRJUK5QuhgH5WoFu0jVH208qi4JhKN36d67V+n6G9Uif?=
 =?Windows-1252?Q?atOcVEpiw4VEl+Cz01FdyITdXu5FL7EwB88aS3RZ99NrqxeMAhQOFeDj?=
 =?Windows-1252?Q?7F2tS9gnyNIEr6MQNyvgIvBg5VG/kO7aqSUVcL22njPa0/926wlZarBd?=
 =?Windows-1252?Q?8lJ7H3clmiJ0VxJ/qPH9FYGtbLE3RiUjMRlLNSnUdDFi/uNBT+DIKoBX?=
 =?Windows-1252?Q?/zh/J/JmgM40cAe0VonMOnHY7aPtMuo0xdGG7HshOtA3uemXOVm+edw5?=
 =?Windows-1252?Q?tE3HfXQ6AkLF0YGUligbuTlk8jk2wkhlh5ddCgM63jzIJ4FFRsGfILp+?=
 =?Windows-1252?Q?nDtJVKvFLBsFLIwKYkYBFEHCRuDwEnwBjyJh66ZF5jlVhWo5eJDTNu2K?=
 =?Windows-1252?Q?3+c+UxL1nqT+eR9vSYe22/0gp0YrxYj+RIr+2+ownKetszTOxLNVdhjc?=
 =?Windows-1252?Q?n99j4kaX7Xq3iFCWGwVOZE5OsuVjQ6IkkNCwn4+/pdx9GkAJ/7wI6+gR?=
 =?Windows-1252?Q?/L/8uZiQnXUTdl88TCO/SjR3IklFoMqmonn4MdzYMcTaVUumIgjCH3a6?=
 =?Windows-1252?Q?L76Cf0R5L1Fn3YDUWBp8Lo22VIB3tIgCESiGtn3pGKW+Q0tkIe40vHky?=
 =?Windows-1252?Q?1gMJVPqozUQvfx+FGDPGIbb7Ql0lmT6mb9S8bOVYEMDzgqZ7khJlZRlu?=
 =?Windows-1252?Q?Kye5UdWt3CsmS7s8xqq+UwvsU2CNXZ3CQBd/1Jmodm9Sse86brhvbwLF?=
 =?Windows-1252?Q?OYHmXkEzFVDpnZNL8dCcn9Btee13waTnRveaOLV+TFCZQmmWPMPJ/BBg?=
 =?Windows-1252?Q?iwVa3tpqYbbQcX6j7+lLuV1HLssbjOuYxpjjVbfPs86PJZ9s5CLpOp57?=
 =?Windows-1252?Q?1FqqP1uE2LD2jaPwXrTJiZZBZqtDXdU8jM6/8Rqmqb/F+dIRPyxB8r8U?=
 =?Windows-1252?Q?BQWHvlpRUsCdVFPJh/hZUJ5eTY+tWaVP1Sqy9dIUrOLPF4+zHJhBGVsB?=
 =?Windows-1252?Q?uv9HatHIOo5xkehL9mSpzjkEFWnUChjGRpCb/pgaXoof9znITt2yXe50?=
 =?Windows-1252?Q?lPY370LN3G2TM7dllMJqjgk8CHYet8pyVuQfHN0s1AplAdgeuRVuu1/W?=
 =?Windows-1252?Q?5otxBfzkZCvlQzbW3ts7c4/UmW6DMassB3PfIN+bn+PVUCPAaBkz0mzi?=
 =?Windows-1252?Q?e7iyt5/WLif7IVVUDn0H228m6SjDP5+PTV8RgSUWMWD+TLf0scQ/znv7?=
 =?Windows-1252?Q?JTaT5P43ezB+Rbw9+DJn5ofQG4JNKi6TMQ5d4ObNIol1JYUJJtMnQHT1?=
 =?Windows-1252?Q?rfihP08tlAYV6bX9Zc0f3Z5bmrwWeHpY?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5385.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd5e63f-0369-48fa-5dea-08dc22268a4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 06:33:30.3847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sb9olPvgL2UJt6aiq8E4pIIO1t92oLEAZ3rv16cxLhAU8k4h8o4QLQUFpTSLXyil8sgrkUn92HCO+8GLY/6ODyRXv8gRsIPqIVfJWSlvSdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4107
Subject: RE: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism

hi,

Sorry for late response, I took a while to understand your comments, thanks=
.
> > notification area in PCI bar. Device will receive this notification rel=
iably, and
> > device knows that it can issue used event now, but it may choose approp=
riate
> > timing to send used events according to its notification coalescing pol=
icy ,
> now
> > it also does not need to DMA guest memory to obtain notification
> > suppression.
> >
> Good description describing the problem and solution well.
> Yes, we discussed this requirement already before at [1].
>=20
> [1]
> https://lore.kernel.org/virtio-comment/1689820586.8879051-7-xuanzhuo@li
> nux.alibaba.com/T/#mce485d2c7187b800575c5a63d83b2e9e77f474cc
Cool, thanks for this sharing.
I'd also like to help develop following kernel virtio core patch for this f=
eature if
this spec patch is accepted finally.

>=20
> >
> > +\subsection{Used Buffer Event Enable Notifications} \label{sec:Basic
> > +Facilities of a Virtio Device / Driver notifications / Used Buffer Eve=
nt Enable
> > Notifications} This kind of notification is only necessary when
> > VIRTIO_F_USED_EVENT_AUTO_DISABLE is negotiated.
> > +When this feature bit is negotiated, the device will disable later use=
d
> Remove the word "later".
OK.

> This forces the driver to process _all_ used buffer notifications before =
enabling
> them again.
> There is a race condition that used ring updates are occurring from the d=
evice
> (without notification) and driver updates the value.
> For example,
> 1. driver posted descriptors from index 0 to 9.
> 2. Used buffer notification arrived for 0 to 3.
> 3. Driver processes used buffer ring from 0 to 3 and enables used buffer
> notification for index 4.
> 4. While #3 is happening, the device already updated the used buffer entr=
ies.
> 5. So device view of used ring entry is messed up as it already passed th=
at
> point.
>=20
> Hence a better driver used buffer notification should be,
>=20
> 1. index upto which it has processed
> 2. explicit enable/disable bit to enable the notification
>=20
> These two fields clearly communicate to the device, upto how much used
> buffer is consumed and understand the driver consumption rate.
> This way, there is no ambiguity for device on where to write next used ri=
ng
> entry.
> (where to write next used entry is not driven by the notification enablem=
ent).
>=20
> And the explicit enable bit indicates notifications are enabled back.
>=20
> Technically, only enable bit is needed, but doing #1 is helpful for the d=
evice to
> understand driver consumption pace.
Thanks for this valuable suggestion, which clarifies driver and device's be=
havior clearly.

> And for that may be current notification can be made 64-bits or as sugges=
ted
> in your patch to have new location.
After some thoughts, I decide to just make current notification extended to=
 64-bits for simplicity.

> The wording "disable later" is confusing, does not read proper.
>=20
> May be to reword it as,
>=20
> This feature indicates that the device will disable used buffer notificat=
ion
> automatically after sending one used buffer notification.
OK, thanks.

> > +
> > +        le16 queue_intr_notify_off;     /* read-only for driver */
> >  };
> I think it should be renamed to queue_used_buf_notify_off;
> This is because notifications are slightly worded differently than interr=
upts.
Since it may be simple to just extend current notification data to 64-bits,=
 there's
no needs to add this field.

> > +        which this virtqueue is located.
> > +        \begin{note} this is \em{not} an offset in bytes.
> > +        See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / =
PCI
> Device
> > Layout / Notification capability} below.
> > +        \end{note}
> > +
> This is strange. The notification is in the PCI BAR, right?
> it can be done simple as just the BAR offset.
See below comment.

>=20
> >
> > + queue_intr_notify_off. Only if VIRTIO_F_USED_EVENT_AUTO_DISABLE is
> > + negotiated. */
> >  };
> >  \end{lstlisting}
> >
> I would really like to avoid extending this structure which is not in the=
 PCI
> extended capability.
> And we are almost full with 256B limit.
> It is the time to have the PCI extended cap defined and place this field =
there.
Yes, I understand your concerns. Initially I intended to add new PCI capabi=
lity
to describe this new notification area, but found that this new capability =
would
be similar to virtio_pci_notify_cap, and will introduce many duplicate desc=
riptions
in virtio spec doc. If we choose to extent current notification area, there=
're no needs
to touch current pci capability, the corresponding queue notify address to =
enable
used buffer notification within a BAR for a virtqueue would look like below=
:
  cap.offset + queue_notify_off * notify_off_multiplier + 4

> If this multiplier is not useful, maybe it should be added only if needed=
.
> Did you add it because to match the current flexibility of the spec, or y=
our hw
> actually needs this multiplier?
Yes, just to match the current spec ??

Regards,
lege.wang

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

