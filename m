Return-Path: <virtio-comment-return-6190-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A122EC77B7A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 23:08:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0A44D16DD87
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 23:08:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0421B98658A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 23:08:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F097B98657E; Tue,  6 Jun 2023 23:08:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DEFDF986583;
	Tue,  6 Jun 2023 23:08:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nu6pO53gzBhgyQ5J2ym96X+F0u0qCF9dsMMeQ0pbNmindDaUMz1z8e3I4j8boRmUJJLGSbnk17HR2DPFabibDK8XBvDtXH4JhRWaLn/B25m4XQyo39BTwq/YxrB//BaHy3Qk9maZ4DzZIIJx/mtJqOEbWDq0UIBsd1dVZUV5HRNnYshEzJExDaPpKoVlPKuSAtlDihT/iYEnBsfF9y/E9iFzXASgpNXzXs1bB1vgSMKaJF9MXLJFwChOTmpXJ8CLZBJVKUARePEeM1KQgSo9MkKzse881Ld8Y2vUMIadMrtee8Q9s/3SXpGfYt2uEB3w4Jd3or2OxEiAl4qYRlGL8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=st0GgdwJNx/LZRAbGTaVoQ12uBpclAtonB551VQzrCo=;
 b=dvslkh9v1WzRJ4eleQpBc3snQugjxm/tN/EjI/5VmB5mfVq/Ftp2Z7gLlSYXTkmKhS5ZmWxoTBPwu/K6qNXjVED4WYkdtey6HgTyU3tSbiPUKZcGHslZr/w4ngPz8TbW1hjp6T7/0/n7yP6AI5H9q+fXv79QWZctrpDpSBTEEPEeFeH9VTQTxn3HrDpeQQ0oMoVQsrkZBN7ArJFXtROAUbvGzdTPn2Brir/pkfqgI6nebcpNhMbVwNTbrlPKg36L07H1NVtP0V+1AcI17T6rkxkMF9/D0JxKtaAxBJpbsIU2GhIbwX67iE2vG7YIxYEoJ5mg2amTPeIMYsOUP2NHNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [PATCH requirements 1/7] net-features: Add
 requirements document for release 1.4
Thread-Index: AQHZlNToe5517kFJJU22M0c8Q1OeEa9+XxQAgAAAfzCAAAsOgIAAAJDg
Date: Tue, 6 Jun 2023 23:08:12 +0000
Message-ID:
 <PH0PR12MB5481C7FC00041476C73C3A74DC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-2-parav@nvidia.com>
 <20230606180853-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C4357772DE13272EA3BBDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606185016-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230606185016-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SN7PR12MB8027:EE_
x-ms-office365-filtering-correlation-id: 97bb1716-59f8-4c81-9f87-08db66e2e6f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6qsLKgmE7zdBCS18VHWHcL7g0lfRGfPxPBRZrxvJXDmUTy0UPGiUElDKH4Ht+qUE6Da2JvQ35ty0HqaFM5/tnN29800mn09bOS045Y5XbiDtWXTfuC1HqgVkYHKVgrmvDbmSl0W/u7uwXkSdkHPDD6djp/Q84IGpZd6Y8PDa1OMp1J5Wda6GPp6bBrj7jk7SiBchEEib7vXGcLKPOI3o1E8rptTcBTRFMZSgBrDSSJByQ6A2FzLy/az+F9ewQSxzdcQw5k7HhJXNd7a2cwI0Sr1q0o/ChemRXgnLQ/Oo4tssA/PPjWtlTsJDD8NfD7tFvuz9l0h72LeuvSwFnD95OLiN4jFtS1c404CmL1sQZ1XeFN7viHzP2As2g0V2SQlwkY/5VFqfKe8A4Z9wl3NSkmIL4Y/t4foK1GXz/d2/pSJlkEzJiEdNytuWDINihm4Fy3iFbdM0BcGRASIo9sKkoTfAdo5r+Ij0BpujIwf/GGWrTMls8hddUVb+lTNuOFS8qVM2UgU7QBh8XjcWmikcCNIuJmKV8RJwlrnjvHdH8iQnlLJT0o6is4bIpKr79YxVRKesbfiIc+INfFLQc2mwvbbPnqf+CEJpUuXuz5dPQIaB8WGOs82eCMDpTiNmRnjQ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199021)(8676002)(8936002)(54906003)(478600001)(55016003)(52536014)(41300700001)(5660300002)(316002)(6666004)(7696005)(26005)(6916009)(186003)(76116006)(4326008)(66476007)(64756008)(66446008)(66556008)(66946007)(71200400001)(9686003)(6506007)(83380400001)(2906002)(38100700002)(122000001)(33656002)(38070700005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?frjm9SJq+EH0z3L34ymDtuSO8mtSmxLK10T1U72v2hDaJStNocZ5a2g6ekfE?=
 =?us-ascii?Q?KJyXpLpNcEbH2zkz6hRF6WoDN7TXSlhAWqwywSUFGVsnkW0PfudTMyyXHJKt?=
 =?us-ascii?Q?M2ct3uzcduUx/iQ289lZNVTOcqCsyeUgzhTvAFmBEOIzCtXp+ducTxXrSLTA?=
 =?us-ascii?Q?v1if6vMjNOOtuXcSEXoGpGc6MAo3mhdi5TUWaZMbY7vesJ0bUHioq5qW4QHL?=
 =?us-ascii?Q?8t2XJlZKZoAWIEMww3I3vZg40atxOXJsylkmK5AmWRSEv+9OsUW9A2ANGcr4?=
 =?us-ascii?Q?MtIuVgCRlYydGk9MDFKnKO30yXNbdmM56gJx9aIa2W4x8xohJyVqoHo/NLwS?=
 =?us-ascii?Q?CcRxIRMGuY8vZPqObCykpD7CIuVGsTTta6j0koAmBssZElExE6yHEPjW1gDb?=
 =?us-ascii?Q?NmW5IdvYMiXx+GBx05Gi9cqX9u5WGmgoU4WA8exzUT9KmQZA5qYXQsSMqHnN?=
 =?us-ascii?Q?oXgPvuAAakpz5GW2H4HN5jD0q/9r1oN9GM40yolprQ/7K5kBOED08CGhVmIh?=
 =?us-ascii?Q?8MG43VfEtDF5inuo3BEo3rD9lV5dHxjuYX0uapr2S3FEMg7ZzqEKc4qcHHBI?=
 =?us-ascii?Q?lGO/y45JnZ/oSUG8rs7V2BUM1sJDdknxEHc4h3GR5+EsVYN9m46KAYbVj7rc?=
 =?us-ascii?Q?MKT3hCTQv7jGLBDYOna42lE9ZAL1eUYLsMUK6W48yBt01zlyzaz2EZy9JTCc?=
 =?us-ascii?Q?Cx6v8MvuPrQwmD3BnQUluD8h/zurELIH7T5hGSe7n5S842kzx/NzDAKMEKQ9?=
 =?us-ascii?Q?EclaSHzMaEqS4IInAeRVMVpqv94IrH1kHos4rQQPoT+IV2wIiEZSmhrX0RoL?=
 =?us-ascii?Q?v6RcC59h+HY+EUpOyOTPa6KRbXzGAlKQ72JnQU+ierFhN3GmhE8H/0EbYSpw?=
 =?us-ascii?Q?vM9HEPfku9g2xSQaiMG8um/d42h2rLhu/B9mQUBJENjvbs2Baz6VstNcYHrb?=
 =?us-ascii?Q?wzTHc/mICuIeCfdousuLJ6fG6hYCaCNYY9EGex1VyQB3aujmvVc7Jm5SLBAd?=
 =?us-ascii?Q?XmP06y8nityAWxCa9aEKq4i5BrpIxKHYm0htClogTeV3ExpGR6M/K97TZkis?=
 =?us-ascii?Q?q/z9agbleIVOd68br7z5QML/8UGB5eXTyy1vIIludpOY15/FYH7aj2OMETRM?=
 =?us-ascii?Q?zRNk5XlETezXmqdnf1w1Gxqha+j4hPy4u5z57S5Wz6d+NERPKC+Y+lMsg5mk?=
 =?us-ascii?Q?BKjzm33S0yfdHfiwRbB1a3cr9zklfG/Rc3KdIQyIX7aJSE8I3FeBr3T7xZvf?=
 =?us-ascii?Q?JX7D8TB7FrWN5CgsxskaAMSWLrQWQgsWHQJoomz8YHVzbcBHWesXlBZzU8z2?=
 =?us-ascii?Q?+KFlH/kaASNvRGan/2pIY0bgQWr0uVEvPDs09KqN7mV4YElT05yEwD7itTnz?=
 =?us-ascii?Q?cA0dCDvDxiAprXmBULTTsMHFyRVo+KVZy+k4+jXYb3J14MK/d+IvIOSNdHlJ?=
 =?us-ascii?Q?ebDYKBxVE9hE11vu9IQRK1ZTnFMJvKnKCMoJhwo2f5ub2x6Qb8nza9ckluu7?=
 =?us-ascii?Q?hnXiA5DPU6JDHUDu3C9cfzVW3vHo50IThlQJln3U7z/4rmxqf8/fadArXhlO?=
 =?us-ascii?Q?NkYESsD+H8vPal3v4bY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97bb1716-59f8-4c81-9f87-08db66e2e6f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 23:08:12.6091
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LytdAzD4+6jkzmtA9LHOkzK0UrWKvzyhbYroMDoIt/t3mVF1Q+OW9U/fDJAbiqbCz9dl2hIl118Nsa0JAYsxGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8027
Subject: RE: [virtio-comment] [PATCH requirements 1/7] net-features: Add
 requirements document for release 1.4



> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> open.org> On Behalf Of Michael S. Tsirkin
> Sent: Tuesday, June 6, 2023 6:57 PM

> > It matters for requirements, so we produce design that addresses it.
> > We don't want to add config space every growing bit map which may be
> different between different devices.
>=20
> then say that you want to conserve config space, that is the requirement.=
 not
> cvq specifically.
>
Well in one meeting you specifically told that requirements and design to b=
e combined together, so it is drafted this way.
Instead of very abstract like "conserve config space".

We can debate and change from cvq to new cfgvq as part of the journey.
It is fine.
=20
> > >
> > > what matters is whether they have to be synchronized with a given
> > > queue - I get it they don't have to.
> > They don't have to be.
>=20
> Then say that.
>
I thought this is very obvious as querying counter is hundred-time slower o=
peration than packet processing.
=20
> > I don't see how it can be every synchronized.
>=20
> you could program them through the vq itself.
>=20
Do you mean in the packet transmit and receive completions itself?
It would be too heavy to do so to mix the control fields in the data path.
> > > we don't cover migration currently don't see how this is a spec rquir=
ement.
> > > unless maybe it's justification for 4?
> > True, but design need to keep this in mind if it has some touch points =
like of
> #4 so when migration arrives, it has the building block in place.
>=20
> so again, let's make sure we capture the actual spec requirement.
>
It is an actual spec requirement to be done and drafted in the spec.
We may not do everything in the first phase, this are the broad requirement=
s.
And in design, we will say, requirement #4 is phase 2.

>=20
> > > so maybe it means there needs to be a way to set counters?
> > > so there's no need to mention migration - just that it should be
> > > possible to move counters between devices.
> > >
> > > > +4. If a virtio device is group member device, a group owner should=
 be
> able
> > > > +   to query all the counter attributes using the admin queue comma=
nd
> which
> > > > +   a virtio device will expose via a control vq to the driver.
> > >
> > >
> > > this seems weirdly specific.
> > > what is the actual requirement?
> > >
> > I don't follow the question.
> > When a device migrates from src to dst, group owner needs to know if bo=
th
> side underlying member device has same counter attributes or not.
>=20
> whether it's through a command or not is not a requirement and I still do=
 not
> know what the requirement is.
> what does "same counter attributes" mean? you never mentioned attributes
> before.
>
I will refine this further and drop the word "attribute".
If device support X counters, group owner should be able to know this bitma=
p.
=20
> > Yes, will change the GUEST surfaced from the current F_GUEST terminolog=
y of
> the net device.
>=20
> So?  this predates 1.x spec we never bothered changing them.
>
Will remove the guest wording and will change to transmit and receive.

=20
> > > > +4. le64 rx_pkts: Total packets received by the device
> > >
> > > including dropped ones or not?
> > >
> > Not including. Will add this clarification further in v1.
> >
> > > > +
> > > > +### 3.1.2 Per transmit queue counters 1. le64 tx_bad_desc_errors:
> > > > +Descriptors dropped by the device due to errors in
> > > > +   descriptors
> > >
> > > since when do we drop packets on error in descriptor?
> > > we just as likely stall ...
> > >
> > It is left to the device to implement on what to do on bad desc.
>=20
> then how can you count drops?=20
A device may count the drops based on errors.
It is counting drops based on the error it got.

> why does this even matter?
To debug.

> and why on tx specifically?
Missed the rx, will add.

> I feel addressing descriptor errors is a completely separate project.

Not sure if it is that big project.

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

