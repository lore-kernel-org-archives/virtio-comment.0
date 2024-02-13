Return-Path: <virtio-comment-return-9107-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D11C48260
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Feb 2024 04:22:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 678382B02A
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Feb 2024 04:22:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 342FB98649D
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Feb 2024 04:22:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1702798642D; Tue, 13 Feb 2024 04:22:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0420D986436
	for <virtio-comment@lists.oasis-open.org>; Tue, 13 Feb 2024 04:22:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tmv/XCjhT8h1zKnlhuqt5iBGG/OJbHoBPdJec4wBXGjGlmTzV94+aEO79lgjCn071ZYYbT0rNKaippsJaoaIsGjhNf4bDn1PUlbBMy52qtwnOdgmXy/Pje+pH8MacNuauMsgrDTKrRPaVnAsgtfowVlB4831+LIliH/yBXTBFE0XFCY3Ev4bKvRoQvC1ZV1DGKJlqhqYmyWQw7EouNDU2wRTixpLoxb1wVhQlrbJp607iQg+MwmEeH0/rZgd8l2BKzJBSB3ygARd2Mo6oNY3gM936lWB+IPxoeLf35+WoXLKcZiurMWwlvNuZr1aH68/kRdqM0lYnQAuFrqkEgjGcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqLUNK2YcpyBNjZPejdmIdV6lqHD+q6WwPw44jrh90U=;
 b=amGbq901dLiMJG3fPvA9cxZMAzSSsjkJ1Bd+F5EE2JWFVJjaPIirzYkpe48y5Ea6bF8kyyDRbhPt59AgMaELzojT45KB7phMRU6bUFwNbfBNZp0tw1oAraSdKCrPJPwNipz0I0do881VNgpAJRlLWmrZE6fZ8ivzYXXFzYjliWTbznB6jEU/kCDqvAm3S0leYllk+d5hyZmIik3fQ90VXpdFmBzeKBMrTKlrnE3sKebz24S69j/YgmWkRf5PzfQiLG5n6CYek2reByTciht21QwUyr89JY2FP3Nb+zmB5D7vC1y8wVeq4CKxoyzFZoIky9h8PJxPPzGdUe3gWIbGxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Satananda Burla <sburla@marvell.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"peter.hilber@opensynergy.com" <peter.hilber@opensynergy.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>
Thread-Topic: [EXT] [PATCH v9 04/13] admin-cmds-capabilities: Add capabilities
 admin commands
Thread-Index: AQHaWZapbbmPdmmqcEOihgSCoyK+ALEFi7iAgACKR1CAAP+LAIAAnmlw
Date: Tue, 13 Feb 2024 04:22:39 +0000
Message-ID:
 <PH0PR12MB548126E200F535B4284A5612DC4F2@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240207072336.477606-1-parav@nvidia.com>
 <20240207072336.477606-5-parav@nvidia.com>
 <SJ0PR18MB4477BB042E38CE59C9F652E8C3492@SJ0PR18MB4477.namprd18.prod.outlook.com>
 <PH0PR12MB5481732266FD14BA4D0FA520DC482@PH0PR12MB5481.namprd12.prod.outlook.com>
 <SJ0PR18MB447717547BB03ECA26C99A24C3482@SJ0PR18MB4477.namprd18.prod.outlook.com>
In-Reply-To:
 <SJ0PR18MB447717547BB03ECA26C99A24C3482@SJ0PR18MB4477.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB7531:EE_
x-ms-office365-filtering-correlation-id: 1cc84c2b-1864-4c4d-8f6d-08dc2c4b6a21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jlSGVq4LzGrHsnx3uqeUfnfYevVxVS+RgeE8p/s5xO8YnlLKOi+nBQp2cPACo5bxU/cH5JADAP5UxjhnGjPPBY03/U+9bNQDQ27Wn6zAgYQ0jDQZS9t7xw5nLFX8DGu0h1zjNh0cSPiTu3QsKgQJi9nBzC1Z2kZP4oNxlUT3mhdZMtALvfmpkV1RAQpYhX1ybHoP6OkmF2soCNoeYcgt5gwGWCwJMtESIKAhUZoDQM9G2XXq2zmhR9kTzMC3ZWsQtvfx7pvJe8JYsQJCsN3++9bNz4h+7EPr+Kit2Bz9vG3Q+LgMDy7EQnLdX/WvZN5MoPWLqg6Wq78MNu/mrntxR6hF/hInpaxrHMQp1RWakOr2iDpqgfUwvOvB/D3t8bH09XIY7qqe/lDJ7fsNqA8cNhR4KphQqK5xrC0lfB8+IYn1VVNpPT9CJ+oAcmEwPupW5Ja1XivgI+XM5ifDRRvg5I2xkEZM9OnekJs4fLMojGtEtY9oovIFY6NUB8GtYZp6RakiFUjfWmqDlwB4o31R9zlncf4LMpCCWhuK44D1ndJqzkSchh7A9mEic4MCk1tDaNllkccDfyTqg6Kup5Ue3GQ2XNKmcMiXFH1KHS8+WYmKyqZO2++S7Rxb1yaJtZmETBYkXLj1tVFQ68ayHYoZrkOLei6AW6VPBgqhF971YtI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(136003)(39860400002)(376002)(230273577357003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(8936002)(8676002)(4326008)(316002)(38070700009)(110136005)(66556008)(54906003)(64756008)(66946007)(66446008)(5660300002)(66476007)(76116006)(2906002)(52536014)(38100700002)(71200400001)(122000001)(55236004)(53546011)(7696005)(6506007)(26005)(83380400001)(19627235002)(86362001)(966005)(478600001)(33656002)(9686003)(55016003)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nrk/HN6yg0LTADD61ZpVgtloFU1dOKl43orK+JaBF4GP54S6lblniEC7RfDt?=
 =?us-ascii?Q?mxf+lkJu0djFoRib3CClGuzcvqjTtEAdfrIbjFMzpSCuUZoyCD/3yFvPfV4S?=
 =?us-ascii?Q?DJebuicJQijcnividYP3nq5zWKiJFrMsaPsJ4pd6pPT8w4VShHA5HK6lXqyK?=
 =?us-ascii?Q?02wCa14X5x/+KneDLTLgMwEQidrMEcyDsmAezDUl6VbWjDgUnq8Mg4lpNzN/?=
 =?us-ascii?Q?DVnTp5sMO39nMQoRq01XcFLzUAJ3VNf8FmEoKq5pKQbrRPA55FXQ9beng46B?=
 =?us-ascii?Q?tp29/pDWxm27Pywo8zSUEp2vePSbqtqjlk5dWLivUcAhJXVUGCwH2+miq6OP?=
 =?us-ascii?Q?/8l2vmH1IehF/0aR00+R7v/ffs8lqcDAJpjKft7jO3+oQ8zvCON9e5/EHztb?=
 =?us-ascii?Q?FPp52RrtHI3k6Dxnz8fWkndPHXUqrmKJ1QC7h/Dq1mYQXg8qTjqFgh5e/hQV?=
 =?us-ascii?Q?gdqEdOr3bUhw4gsAdyMSLHguVXltMCSPfr1XovGgDd2WXjwL3ZeKxY4DBfAl?=
 =?us-ascii?Q?VK8xgbXN6ggaxJ18LDb6ko+JGdRdaHGg7dn3ROfiPKtg22r5KJ73uPkkkmr3?=
 =?us-ascii?Q?oe0PYsaZC7eNqoXDLF3KFvoaFZRqiqb7nocCXVMBcqm5wrwU8YjVGOXCuJJf?=
 =?us-ascii?Q?Ii53Q9ZgBX1ciolHve+E/JWOwpqumTSTTSNzr9ZVrvXBOUIDQR9aMvML1jkZ?=
 =?us-ascii?Q?Fm11RKZ4Ea3KdlaJdkoZi720iZwAsLK5HZrb5PzsYa7LboN5DcZDe02cPJM0?=
 =?us-ascii?Q?+3PyLoN1ZE7GiLiBZAHTSLGB6OBDsaEQgJR/IFJcsn7NbcXADqWF7QQZlVYF?=
 =?us-ascii?Q?joUg8+KwrgCThu/kcmbpPkj+gn8FwyYYiL46YTIGfU+rEZJxC5gEee446o4o?=
 =?us-ascii?Q?mkuDYn/gmLIXBqLt7oUBC5Cwf4pzNj2/M92kRoIeDP/Qv7KAoA5t1RtYmrth?=
 =?us-ascii?Q?JUz5sRecSBvH01aUN+PeJ20gPVpKRV30YPTOW2Dq4yKMUp17ZCzDb3yblt48?=
 =?us-ascii?Q?4wpgvbEza7GVIJw05gG5jP5TbNDK6ishYpdvA47ZIjg/oNhDzRXRmwD920cJ?=
 =?us-ascii?Q?fE0q89z/y1HTo/kSoIdNwTh8GAhaRkeYUGa3l93CSsBxItJhkyfvu4GMJl6Y?=
 =?us-ascii?Q?+mhy+u9RqkN8pSYp+fsH0S3PUk78OUU5QY+Ic1uKD3J0/jdBQayvk1xcgVNU?=
 =?us-ascii?Q?SPe0KtV3lZdBpz+224iUv8AlQmCEq+qOlLNP2jX2Nc1MXZ3u8Se72HTukhyW?=
 =?us-ascii?Q?CsbO0qImJfyKXHnexfm2ZkRtv8B/CbrQ3up+VcV8HpHvRzetBd/JVG2rIFzJ?=
 =?us-ascii?Q?xj2IdHsSeDFcr/wn7oz1XOulWa7pWvzDOmv07QQ35B2H8mGMkbtkOEdk/X42?=
 =?us-ascii?Q?pbOFsPOLXwkBM4jkTIYHetjv97ErutALWGRaer9vcvL7uWBcolQBXqpE95Qg?=
 =?us-ascii?Q?r3kJAJ4UBTHp6dQIV2XbOoK+MhngiWUPhGAahK+wOVGBWNr3wywNAJKHqp9n?=
 =?us-ascii?Q?f6F8QEQzWgp7ViTOzThkmozRaIhn/xjpr9AcrDaC6+I6/5u/FcXrsSv131KV?=
 =?us-ascii?Q?dtjLeI5WGd6/vf0bHpA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc84c2b-1864-4c4d-8f6d-08dc2c4b6a21
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2024 04:22:39.4420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tD5SNC8WSDY4Z+mnd3bQa5YmS1DTKcbf5AUkgTwjtmw4P0c0qAI7jNicM9797ZpMfx2EK1K/0V9y146SGD8MuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7531
Subject: [virtio-comment] RE: [EXT] [PATCH v9 04/13] admin-cmds-capabilities: Add capabilities
 admin commands



> From: Satananda Burla <sburla@marvell.com>
> Sent: Tuesday, February 13, 2024 12:21 AM
>=20
> Hi Parav
>=20
> > -----Original Message-----
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Sunday, February 11, 2024 7:42 PM
> > To: Satananda Burla <sburla@marvell.com>; virtio-comment@lists.oasis-
> > open.org; mst@redhat.com; cohuck@redhat.com
> > Cc: hengqi@linux.alibaba.com; Shahaf Shuler <shahafs@nvidia.com>; si-
> > wei.liu@oracle.com; peter.hilber@opensynergy.com;
> jasowang@redhat.com;
> > xuanzhuo@linux.alibaba.com
> > Subject: RE: [EXT] [PATCH v9 04/13] admin-cmds-capabilities: Add
> > capabilities admin commands
> >
> > Hi Satananda,
> >
> > > From: Satananda Burla <sburla@marvell.com>
> > > Sent: Monday, February 12, 2024 12:51 AM
> > >
> > > Hi Parav
> > >
> > > > -----Original Message-----
> > > > From: Parav Pandit <parav@nvidia.com>
> > > > Sent: Tuesday, February 6, 2024 11:23 PM
> > > > To: virtio-comment@lists.oasis-open.org; mst@redhat.com;
> > > > cohuck@redhat.com
> > > > Cc: hengqi@linux.alibaba.com; Satananda Burla
> > > > <sburla@marvell.com>; shahafs@nvidia.com; si-wei.liu@oracle.com;
> > > > peter.hilber@opensynergy.com; jasowang@redhat.com;
> > > > xuanzhuo@linux.alibaba.com; Parav Pandit <parav@nvidia.com>
> > > > Subject: [EXT] [PATCH v9 04/13] admin-cmds-capabilities: Add
> > > > capabilities admin commands
> > > >
> > > > External Email
> > > >
> > > > ------------------------------------------------------------------
> > > > --
> > --
> > > > Add three capabilities related commands.
> > > > First to read the device and driver capabilities.
> > > > Second to write the driver capabilities.
> > > > Third for driver to discover which capabilities can be accessed.
> > > >
> > > > Write capabilities by the owner driver is not currently supported.
> > > > It will be supported in future by the owner driver to write for
> > > > the member device.
> > > >
> > > > Fixes: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> > > > 3A__github.com_oasis-2Dtcs_virtio-
> > > >
> > >
> 2Dspec_issues_179&d=3DDwIDAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DNHDPsfcAY
> > > lN2z-
> > > > NXHHG4WB09qqS0voo_nf6_kGS625A&m=3DKI-
> > > >
> > >
> QceHuScbIZDc_Kxteq_nU775BHpY5uMRJiwQuxhrgFOpnAx0SON8L2UXPJqty&
> > > s=3DjnFn-
> > > > DDDK_3FuIG5OPXgWud35KVh8KaeUDAro8N3jqU&e=3D
> > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > ---
> > > >  admin-cmds-capabilities.tex | 161
> > > ++++++++++++++++++++++++++++++++++++
> > > >  admin.tex                   |   9 +-
> > > >  capabilities.tex            |   3 +
> > > >  conformance.tex             |   2 +
> > > >  4 files changed, 174 insertions(+), 1 deletion(-)  create mode
> > 100644
> > > > admin-cmds-capabilities.tex
> > > >
> > > > diff --git a/admin-cmds-capabilities.tex b/admin-cmds-
> > capabilities.tex
> > > > new file mode 100644 index 0000000..47394c7
> > > > --- /dev/null
> > > > +++ b/admin-cmds-capabilities.tex
> > > > @@ -0,0 +1,161 @@
> > > > +\subsubsection{Device and Driver Capabilities}\label{sec:Basic
> > > > Facilities of a Virtio Device / Device groups / Group
> > > > administration commands / Device and Driver Capabilities}
> > > > +
> > > > +The device and driver capabilities commands are currently defined
> > for
> > > > self group type and for
> > > > +SR-IOV group type.
> > > > +
> > > > +\begin{enumerate}
> > > > +\item Device Capabilities Support Query Command \item
> > > > +Capabilities Read Command \item Capabilities Write Command
> > > > +\end{enumerate}
> > > > +
> > > > +\paragraph{Device Capabilities Support Query
> > Command}\label{par:Basic
> > > > Facilities of a Virtio Device / Device groups / Group
> > > > administration commands / Device and Driver Capabilities / Device
> > > > Capabilities Support Query Command}
> > > > +
> > > > +For the command VIRTIO_ADMIN_CMD_CAP_SUPPORT_QUERY,
> > > \field{opcode} is
> > > > set to 0x7.
> > > > +
> > > > +This command queries the supported device capabilities
> > > > +identifiers
> > > > bitmap in
> > > > +\field{supported_caps}. Each bit in \field{supported_caps}
> > > > +corresponds
> > > > to the
> > > > +capability identifier. Thus, supported_caps[0] refers to the
> > > > +first
> > > > +64-
> > > > bit value
> > > > +in this array corresponding to identifiers 0 to 63,
> > supported_caps[1]
> > > > +is the second 64-bit value corresponding to identifiers 64 to
> > > > +127,
> > etc.
> > > > +For example, with \field{num_caps =3D 2}, the array of size 2
> > including
> > > > the values
> > > > +0x3 in supported_caps[0], and 0x1 in supported_caps[1] indicates
> > that
> > > > only
> > > > +identifiers 0, 1 and 64 are supported.
> > > > +
> > > > +The length of the array \field{supported_caps} depends on the
> > > > +supported identifiers - it is large enough to include bits set
> > > > +for all supported identifiers, that is the length is set by
> > > > +calculating by starting with
> > > > the
> > > > +largest supported opcode adding one, dividing by 64 and rounding
> > up.
> > > > +
> > > > +The array \field{supported_caps} is also allowed to be larger and
> > to
> > > > +additionally include an arbitrary number of all-zero entries.
> > > > +
> > > > +For each identifier, the driver can read the device capabilities
> > and
> > > > write
> > > > +the driver capabilities. The driver can also read the written
> > > > capabilities.
> > > > +
> > > > +This command has no command specific data.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_admin_cmd_query_supported_cap_result {
> > > > +        le16 num_caps;
> > > > +        u8 reserved[6];
> > > > +        le64 supported_caps[];
> > > > +};
> > > > +\end{lstlisting}
> > > Since this is not fixed size, what happens if the allocated write
> > buffer for the
> > > command cannot fit the result ?
> > The device returns only the capabilities worth of supplied buffer.
> >
> > > Does the device return error with specific  error code?
> > No. it truncates to the supplied length.
> > This command relies on the existing admin cmd spec.
> > Please see the snippet from the spec.
> >
> > "Drivers are allowed to submit buffers that are shorter than what the
> > device expects (that is, shorter than the length of status through
> > command_specific_result). This allows the device to maintain a single
> > format structure even if some structure fields are unused by the
> > driver.
> > The device compares the length of each part (device-readable and
> > device-
> > writeable) of the buffer as submitted
> > by driver to what it expects and then silently truncates the
> > structures to either the length submitted by the driver, or the length
> > described in this specification, whichever is shorter."
> But how would driver know if it has read in all the capabilities or not ?

Lets take example:
The driver interested in capability identifier=3DA,=20
the driver's view of capability struct =3D X bytes.
The device view of the capability =3D Y bytes.

Example_1:
Typically, old driver, new device.
X < Y.
Result: Device copies X bytes. So driver will see only capabilities field w=
orth of X bytes.

Example_2:
Typically, new driver, old device.
X > Y.
Result: Device copies Y bytes because device only understands Y bytes .
So driver will see only capabilities field worth of only Y bytes from the X=
 bytes it allocated.



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

