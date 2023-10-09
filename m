Return-Path: <virtio-comment-return-7631-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB18E95A8E
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 11:48:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4FC30747CB
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 11:48:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2FA8B9864F3
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 11:48:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 17A8B9864CE; Mon,  9 Oct 2023 11:48:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0717B9864D3
	for <virtio-comment@lists.oasis-open.org>; Mon,  9 Oct 2023 11:48:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYRb7eJI/OFV5Vs/LoGYqKzozOHxZ9rUUjaLcnZRkGFdeSiCQrMZSit6eWdtl3Z1IAFeKAYjg+Cg8uSIznnTfvspkAOX4hppdQkhX0UwhqNGz2S1Aaq5TziORD+H80CzymRBWkZxKp+ScsA+2SkJ1Qr77vGHZwjw+jEIaVoJr3egEnVs+cRsN6/oE2zzu/Nf4iRGkYemwpC+Vd8X8M/uSX/nhqHZg2Z+nOsKtCIpk999uJFclIUsFZHjo1UJg8WW3yA9uxdr1HuM3dY/JrPTxgVtZLhDdXcTSIhkNWMStBGOu9Y+at8A84vI6bXGCeZ1/3N+Uj96D1YspFYur2dvgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwQk/qrU+Q2m8RlvtjPyLC40ba7ocfaDVHMu3WuO6Co=;
 b=SaDiPh3ZPR36LK1isqTZ9filzRiNjDCXwb3wE1f7vDnFMwZ7NHNx/U0yz9wxuWpWiLSDDR4uuBLbQF8IqeIIuySF+sLdu5QI0IJVPig4JF9aWetkyG//+3gh0XChBj8n1YF0zTVAGl3T1rHZEjfrVpA+UpMPcsqb5hQeOiBFywqutRgWC8GPAWDmcNGQ31/jydvxGtuOO/0Q8/vzB5BMUIsJPbsXLAAXkEn5846d16UQ4N2VxG9qjlerdDAzqGKqGol0viBNapta8RU1doqRWk9PAlq6W4BnoC2y75QA6zGVt+8pCdH66kHnfvsYGroUBkgpKBjMV+74qjFrjM69/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 7/8] admin: Add write recording
 commands
Thread-Index: AQHZ+dpSq9nJAWUDjkaN0yzGClzvNLA/yD8AgAENvNCAAHUjAIAACu1w
Date: Mon, 9 Oct 2023 11:48:46 +0000
Message-ID:
 <DM8PR12MB5480A08A86E3FAEEAF8C962DDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-8-parav@nvidia.com>
 <20231008074404-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818D738BCD0E634517B3ABDCCEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231009065319-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231009065319-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|MW6PR12MB8959:EE_
x-ms-office365-filtering-correlation-id: a735feb1-8a70-43a1-145b-08dbc8bdb1cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8O6IxFCRMc8Q1n5935LOiFU1l2srZIMXWGak8NDfNCvEx7MOvAL6ARFZ1w6CTDWQRqKxL0TnbkuuY4kbTMqr3afbGk13SuN+GQu6P3tBMbbuile4VxfgrNlgsF5B75a3+QWwIAxR9OYn5CYc4DKE7fp3I5+4ZkRdvkyttZhAggzdnuhn5vHTJFyHJFsQ0VrskYxYcSiVmdMlOi4Tp0SzIUNyJlJc0m0FFubEw9NMCEzhiYXdyDJMcto6enUJPrbkUYgr5ndA+o4fEHjvjgov8djJTNWtWsEI3yEgc2Xg/zxgM0FwYItLJdppY+YPf63y0W1EgiakMoI2vj5HTGjZz5Wdryx0BIwA2Wk7bD/Dj8Ud9uUddqtNJiW+7sjxnPEESe2U2UetojQoIMwY3K8QfVdZZlQ0h7GOOqd854UFGtAjaon8gLuN28l/iVp7tq+gmFUbvA8e4hDrKl+v7QL8IV6s0LlN6xW5+nvkvZfbI4pudRtPV6dzk8DVhRNHfRacrw957kqCepn6zkk/ppQQ3/DoyKGj88NrSOhGXM7z44RdHaJko+smlt4pHlwlSB7DxC44bkCTLcGmn3MAOdK7+TxyOAqws4KAX91UhFjIfm0zmro55BFrq+B7diEudemW
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(39860400002)(376002)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(86362001)(33656002)(38070700005)(55016003)(30864003)(107886003)(9686003)(5660300002)(2906002)(66946007)(478600001)(76116006)(66446008)(66476007)(66556008)(52536014)(6916009)(41300700001)(316002)(54906003)(64756008)(71200400001)(7696005)(6506007)(26005)(8936002)(4326008)(8676002)(83380400001)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ld22TI4Y7w4v601pZLp7liW6cXik7LEz2HOep4M3w/ICGvI1KJtwBf0gWrkc?=
 =?us-ascii?Q?nEfWLn9ege6/YBNzJ8FBhdR42o7ZPRTmBEu981QIY5RPvvWscV9R6ej74nLm?=
 =?us-ascii?Q?t2SrPmWQ+OgmOTpAGmh16fIjQINl2z224qTVPe1Ed8u/F05lBiv/5ridN2qY?=
 =?us-ascii?Q?XZcspqQo+zCqoKhNexL3z1zeLvlNvE0Y9JU/Sn6bkqqWMYgLo0PN/TVBO6J6?=
 =?us-ascii?Q?EV6exqwiGAz0zh8lAeSKWeOp9wQi/fV/O82yCxpEsQwisoywaJupRqssfs+a?=
 =?us-ascii?Q?lcbN4t33OPIjGWdn26OSSNJiyFSqz3mw/2mB12QSCWeSdM4sSXhRgi6MlhmI?=
 =?us-ascii?Q?S0j1AX3bkQQzaQnenYb+bNMXfCJr9oFo1IEqkiJuhNbKSV2D05j9C2TUP3AX?=
 =?us-ascii?Q?O14Q47rhyyq/5hedJ1CYSGhHJDU+TkKqOOpxcuZIHzRamDz49D/32vI3ZWiR?=
 =?us-ascii?Q?HnT6yqa2WXM0BFNXGfJMM0UGxO1LKJmlMQdiv9+sz5WXMXpR9c5ncJfHky5t?=
 =?us-ascii?Q?OHi7s2VUXeEX2+XonwdUUdMt7HuikQ5fAIR05bV+PzQGRfbHWkBP8roVIkM1?=
 =?us-ascii?Q?H8LZo5TpOnYTAk4U4L8XtGlaWrIeKHMa6F9uTIGnU5m6jyPN5jj87xE3IFIl?=
 =?us-ascii?Q?m/5LtG9geyx66Vr6NiaAUlFqWx+NZsZIesNAYYKL3RNpbFStJ+rtnkElHZpG?=
 =?us-ascii?Q?/ChnsTbnJ8o82MO9ftWwqcIoj77R6rD6SAT7ViIWW3bfXLI/3RYxRMGrbapQ?=
 =?us-ascii?Q?tCAyjNihDIAlBCkkWmXQe1L04HZWrxtBkc80gbIydjOa9ZZiGRTsmhyWq6Nk?=
 =?us-ascii?Q?hxWqvaAMNBbSbKe0+VQ7PkPZTKTk2vhbbzw9ItvBrK1fa7djF6vOahbOKfVo?=
 =?us-ascii?Q?7CiCd6qiOQ4ebcv2dGOe3EPbNUPEfv3WA0NpTM2jaVoEFpgn/KMpIm/VsUaG?=
 =?us-ascii?Q?fJlgxVunpZQzb93AYRQxSh4XGlIpin9I+zBUpeZq0kpR73bmC/ZG2SS4qZY3?=
 =?us-ascii?Q?6IN9kvvV7AqrStTPYGNnH1v6XqPZjhS+geU2dt9+kVENDEColZwJZYoDpDgz?=
 =?us-ascii?Q?eJwDzgT2qasxTELdACkWwCzUwomgmUCGvacLDik8W3jrsgSWZbYaN9KbGkFe?=
 =?us-ascii?Q?YF/wJ2We1noZmag21X0LRRYlAlSfEtF6KU9L+ZxL1qLNxSE2l34tyxV96rXJ?=
 =?us-ascii?Q?ymWGG06y9gU3nVC5KpcsV4MGSPzXH1QppQJD8MnnE/PfaMD9Gym4ijVwpwLs?=
 =?us-ascii?Q?gplD8sbKD53/UUxkSbnwBtlRb2b9mZ1XNAkOy+yaN1Z4M1pitYKF7umKfJZN?=
 =?us-ascii?Q?zVxZTZ9OngcfnTcCBGuPXIztHbqcGIpOyvAxOh3GssbnH0+jOtC09rgIsTUa?=
 =?us-ascii?Q?5w4a8woEKb6vvC0gIaTYOj2LUsrZYnaV2EFT1WpXkQGYgiin68VThFX9UGZl?=
 =?us-ascii?Q?yZCfxzqVIq9q9TmZC8aGJBV9/j+XIB7lkQIhL3VG6YbkomkCFFJviO87hOCr?=
 =?us-ascii?Q?QuB3YwAbJlDbaSVg9W2+9QrWYd2s9v8rV4Yq8TZHuGt/A3nzNaR2c0YOBj09?=
 =?us-ascii?Q?q6kL3mxi0Prmxi0am0Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a735feb1-8a70-43a1-145b-08dbc8bdb1cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 11:48:46.0304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7QI31EROa+iCF2g120Au/i80Scxo7PLd8StqDHnjjIvVt1rBt0jIlMaK54ZgrUoCbvCS8tkq+Igcz0v3IG7Vqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8959
Subject: RE: [virtio-comment] Re: [PATCH v1 7/8] admin: Add write recording
 commands


> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> open.org> On Behalf Of Michael S. Tsirkin
> Sent: Monday, October 9, 2023 4:28 PM

> > May be we can use a different verb than record. May be tracking?
> > Record means, device accumulates these written pages addresses, and whe=
n
> driver queries, it returns these addresses and clears it internally withi=
n the
> device.
>=20
> For example, what about two writes into same address. Do you get one reco=
rd
> or two? What if the length is different?
One record.
Since the writes are tracked/recorded at page granularity, even if length i=
s different, it still one entry.

>=20
>=20
> > > > Such an
> > > > +address is named as IO virtual address (IOVA).
> > >
> > > I don't know what does this have to do with IOVA. For that matter
> > > everything would have to be "IOVA". Spec calls these physical
> > > address and let's stick to that.
> > >
> > Make sense.
> > At device level it does not have knowledge of IOVA.
> > I will rename it.
> >
> > >
> > > > The owner driver enables write
> > > > +recording for one or more IOVA ranges per device during device
> > > > +migration flow. The owner driver periodically queries these
> > > > +written IOVA records from the device.
> > >
> > > periodical reads without any indication are the only option then?
> > >
> > At least for now, this is starting point. Software stack such as QEMU d=
oes it
> periodically.
>=20
> So for CPU kvm switched to PML and this seems to work better - it guarant=
ees
> there's convergence.
>=20
My guess that PML is better because write protection related faults are rem=
oved now.
The approach here is similar, but there is no PML kind of queue.
It is relatively manageable to slow down cpu on VMEXIT or other ways, compa=
re to external network.

And secondly, it is driven by the hypervisor cpu availability for capacity =
planning etc.
So its periodic in nature that share similar scheme like PML.


> > When new use case arise, may be it can be extended.
> >
> > > > As the driver reads the written IOVA records,
> > > > +the device clears those records from the device. Once the device
> > > > +reports zero or small number of written IOVA records, the device
> > > > +is set to \field{Stop} or \field{Freeze} mode. Once the device is
> > > > +set to \field{Stop}
> > > >  or \field{Freeze} mode, and once all the IOVA records are read,
> > > > the driver stops  the write recording in the device.
> > >
> > >
> > > it is not great that you are rewriting text you just wrote in patch
> > > 1 here. pls find a way not to make reviewers read everything twice.
> > >
> > There is small duplication of one line explaining mode change, rest is
> contextual to the write recording.
> > Merging with text of patch_1 was slightly complicated to read, so one
> sentence is duplicated.
> >
> > I will again check if patch_1 text extension is easier to read.
>=20
> this is latex, space is ignored. if you are only changing one word just d=
on't move
> the rest and diff will look sane
>=20
Yeah, right. I will fix this.

> > > > @@ -118,6 +119,10 @@ \subsubsection{Device
> > > > Migration}\label{sec:Basic Facilities of a Virtio Device /  \item
> > > > Device Context Read Command \item Device Context Write Command
> > > > \item Device Context Discard Command
> > > > +\item Device Write Record Capabilities Query Command \item Device
> > > > +Write Records Start Command \item Device Write Records Stop
> > > > +Command \item Device Write Records Read Command
> > > >  \end{enumerate}
> > > >
> > > >  These commands are currently only defined for the SR-IOV group typ=
e.
> > > > @@ -307,6 +312,129 @@ \subsubsection{Device
> > > > Migration}\label{sec:Basic Facilities of a Virtio Device /
> > > > discarded, subsequent VIRTIO_ADMIN_CMD_DEV_CTX_WRITE command
> > > > writes a new device
> > > context.
> > > >
> > > > +\paragraph{Device Write Record Capabilities Query Command}
> > > > +\label{par:Basic Facilities of a Virtio Device / Device groups /
> > > > +Group administration commands / Device Migration / Device Write
> > > > +Record Capabilities Query Command}
> > > > +
> > > > +This command reads the device write record capabilities.
> > > > +For the command
> VIRTIO_ADMIN_CMD_DEV_WRITE_RECORD_CAP_QUERY,
> > > > +\field{opcode} is set to 0xd.
> > > > +The \field{group_member_id} refers to the member device to be
> accessed.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_admin_cmd_dev_write_record_cap_result {
> > > > +        le32 supported_iova_page_size_bitmap;
> > > > +        le32 supported_iova_ranges; }; \end{lstlisting}
> > > > +
> > > > +When the command completes successfully,
> > > > +\field{command_specific_result} is in the format \field{struct
> > > > +virtio_admin_cmd_dev_write_record_cap_result}
> > > > +returned by the device. The
> > > > +\field{supported_iova_page_size_bitmap}
> > > > +indicates the granularity at which the device can record IOVA rang=
es.
> > > > +the minimum granularity can be 4KB. Bit 0 corresponds to 4KB, bit
> > > > +1 corresponds to 8KB, bit 31 corresponds to 4TB. The device
> > > > +supports at least
> > > one page granularity.
> > > > +The device support one or more IOVA page granularity; for each
> > > > +IOVA page granularity, the device sets corresponding bit in the
> > > > +\field{supported_iova_page_size_bitmap}. The
> > > > +\field{supported_iova_ranges} indicates how many unique (non
> > > > +overlapping) IOVA ranges can be recorded by the device.
> > >
> > > what role does this granularity play? i see no mention of it down the=
 road.
> > >
> > The page_size in struct virtio_admin_cmd_write_record_start_data must
> match to the granularity supplied above.
> > I missed it. Will add in v2.
> > This is very useful comment.
>=20
> Not that it's very clear what does page_size do.
>=20
Page_size is the granularity on which to record the writes.
For example, when page_size =3D 2MB, any writes are aligned to 2MB page bou=
ndary.
If 8KB data is written, only single write record entry reported.

If the page_size =3D 4K, two write record entries reported.
( I assumed 4K aligned address to keep the example simple).

> > >
> > > > +
> > > > +\paragraph{Device Write Records Start Command} \label{par:Basic
> > > > +Facilities of a Virtio Device / Device groups / Group
> > > > +administration commands / Device Migration / Device Write Records
> > > > +Start Command}
> > > > +
> > > > +This command starts the write recording in the device for the
> > > > +specified IOVA ranges.
> > > > +
> > > > +For the command VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START,
> > > > +\field{opcode} is set to 0xe.
> > > > +The \field{group_member_id} refers to the member device to be
> accessed.
> > > > +
> > > > +The \field{command_specific_data} is in the format \field{struct
> > > > +virtio_admin_cmd_write_record_start_data}.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_admin_cmd_write_record_start_entry {
> > > > +        le64 iova;
> > > > +        le64 page_count;
> > > > +};
> > > > +
> > > > +struct virtio_admin_cmd_write_record_start_data {
> > > > +        le64 page_size;
> > > > +        le32 count;
> > > > +        u8 reserved[4];
> > > > +        struct virtio_admin_cmd_write_record_start_entry
> > > > +entries[]; };
> > > > +
> > > > +\end{lstlisting}
> > > > +
> > > > +The \field{count} is set to indicate number of valid \field{entrie=
s}.
> > > > +The \field{iova} indicates the start IOVA address. The
> > > > +\field{page_count} indicates number of pages of size
> > > > +\field{page_size} starting from \field{iova} to record for write
> > > > +reporting. VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START
> > > > +command contains unique i.e. non overlapping IOVA range entries.
> > > > +Whenever a memory write occurs by the device in the supplied IOVA
> > > > +range, the device records the actual IOVA and number of bytes
> > > > +written to the
> > > IOVA.
> > > > +These write records can be read by the the driver using
> > > > +VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ command.
> > > > +
> > > > +This command has no command specific result.
> > > > +
> > > > +\paragraph{Device Write Record Stop Command} \label{par:Basic
> > > > +Facilities of a Virtio Device / Device groups / Group
> > > > +administration commands / Device Migration / Device Write Record
> > > > +Stop Command}
> > > > +
> > > > +This command stops the write recording in the device for IOVA
> > > > +ranges which were previously started using
> > > > +VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START
> > > > +command.
> > > > +
> > > > +For the command VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_STOP,
> > > > +\field{opcode} is set to 0xf.
> > > > +The \field{group_member_id} refers to the member device to be
> accessed.
> > > > +
> > > > +This command does not have any command specific data.
> > > > +This command has no command specific result.
> > > > +
> > > > +\paragraph{Device Write Records Read Command} \label{par:Basic
> > > > +Facilities of a Virtio Device / Device groups / Group
> > > > +administration commands / Device Migration / Device Write Records
> > > > +Read Command}
> > > > +
> > > > +This command reads the device write records for which the write
> > > > +recording is previously started using
> > > VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START command.
> > > > +
> > > > +For the command VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ,
> > > > +\field{opcode} is set to 0x10.
> > > > +The \field{group_member_id} refers to the member device to be
> accessed.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_admin_cmd_write_records_read_data {
> > > > +        le64 iova;
> > > > +        le64 length;
> > > > +};
> > > > +
> > > > +struct virtio_admin_cmd_dev_write_records_cnt {
> > > > +        le32 count;
> > > > +};
> > > > +
> > > > +struct virtio_admin_cmd_dev_write_records_result {
> > > > +        le64 iova_entries[];
> > > > +};
> > > > +\end{lstlisting}
> > > > +
> > > > +The \field{command_specific_data} is in the format \field{struct
> > > > +virtio_admin_cmd_write_records_read_data}. The driver sets the
> > > > +\field {iova} indicating the start IOVA address for up to the
> > > > +\field{length} number of bytes. The supplied IOVA range same or
> > > > +smaller than the range supplied when write recording is started
> > > > +by the driver in VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START
> command.
> > >
> > > Seems pretty sparse. Lots of hypervisors chose to implement a bit
> > > per page strategy.
> > This command result addresses will feed into such bit.
>=20
> Do we want to return it in this format then?
I think yes, because converting to the bit is easy.
Reporting bit requires bitmap being function of VM memory and not based on =
amount of written pages.

>=20
> > >
> > > > +
> > > > +When the command completes successfully,
> > > > +\field{command_specific_result} is in the format \field{struct
> > > > +virtio_admin_cmd_dev_write_records_result}
> > > > +and \field{command_specific_result} is in format of \field{struct
> > > > +virtio_admin_cmd_dev_write_records_cnt} containing number of
> > > > +write records returned by the device.
> > >
> > > what are these records though?
> > >
> > It is struct virtio_admin_cmd_dev_write_records_result.
> > I will rephrase it to link to struct virtio_admin_cmd_dev_write_records=
_result.
> >
> > >
> > > > When the command completes
> > > > +successfully, the write records which are returned in the result
> > > > +are cleared from the device and same records cannot be read
> > > > +again. When new writes occur at same IOVA range or at different
> > > > +once, those records can be read as new write records.
> > >
> > >
> > > this last sentence just confuses.
> > >
> > How about just keeping below text rewrite?
> > When the command completes successfully, the write records returned in =
the
> result are cleared from the device.
>=20
> I think we need to explain in more detail what exactly is expected to be
> recorded and when.
>=20
Ok. I will give second look now to improve this description.

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

