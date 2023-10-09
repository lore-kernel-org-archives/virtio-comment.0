Return-Path: <virtio-comment-return-7639-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B8CCD610E
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 17:22:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C32472A828
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 17:22:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B6E6398655C
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 17:22:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A9AF69864F0; Mon,  9 Oct 2023 17:22:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9BAA19864F3
	for <virtio-comment@lists.oasis-open.org>; Mon,  9 Oct 2023 17:22:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCC4/fK4l/zqrb7GX183AWOQIfc82VSwHkao6e9Zp002A8k7zHNKoQtdfaZDxQODk1oMiEcItu4+CCtldLVf33o5WATdXmdgV3hhoybk7RMV1MksXfL2k6u4azGXK0Ea9OD4kofgXkAjC1GRotddkU1zp0JJ+ieHYCraggCGg4Ivg576mDgWOpGbT6DJE9oMJNTPmUXcFeKqQvPwFL9k0rny9wdRkpOHKEa23qoJjv0QHGCBqAR0c20CyldX54P/4sc4lBkQ3WMwW/wHrbCwxLB0/jFSbSqyKHdmexa7uG6eZPhDnfqpy+6/4atmBnnhgdhpuSg5EE/hI5YfcoDwew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPE6ZKRXKNsLP0Jatmj8f+VM7UOb3hGvGglF2sq7whE=;
 b=X2aEnM04z5sQzdVpO5OGkgVfXFyuxjokM60AbcJ3YJNBK+6tTDYdN0dLX5vXW4DARyfJCImiUPbkhSIbqjLF54R8zlvbtbMaJlWmMubwzKInwuag3RO0wlAg27qasxlf7qvMva6Q5BgiDLCqm2ofJZepCa/3ILhCsuLVxh+UdYfbl9VR/AQ0BToT3vKrPii50kYnYvlTtuHIsHYQ8sxiU33V9uqzG6hNVzGhrnyg9XsHohv998F3EAnMfTOUJ688I8FuYo5Qnmob4mJ2JGR+SjLs0N+hoKDy4dAhsqFGi0h7HqQoVAv+r2uhtJK6k0pUvpXrmhB8GVvPwQJPDMpbQw==
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
Thread-Index:
 AQHZ+dpSq9nJAWUDjkaN0yzGClzvNLA/yD8AgAENvNCAAHUjAIAACu1wgABN5QCAAA2W8A==
Date: Mon, 9 Oct 2023 17:22:45 +0000
Message-ID:
 <DM8PR12MB54803DA084DC115DE0BA100ADCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-8-parav@nvidia.com>
 <20231008074404-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818D738BCD0E634517B3ABDCCEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231009065319-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480A08A86E3FAEEAF8C962DDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231009115502-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231009115502-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|DM6PR12MB5024:EE_
x-ms-office365-filtering-correlation-id: e5527fa5-b6fb-4382-191d-08dbc8ec5a82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 3WxrwXMerdGOzB0ZCj+w0AkyVvmqq2pV0JxlPLnLUfh98RkagMndzIr6j4FzkwdSs5/Jz7l+cHhZFaw0WdIi6nwxw22y2RFSLQaSH14jUxLLn30oPHEHuP15e72mzly1iMpGkv9GI0WZLVwQkWGzJy3vJTz42MjLUYDG36cTJzfsn3di48PG1rt3wpnw9dqC8mrjYzaKrtvMyg+Icj45STuQu2GuAQE8OJpzCDWeuWjB666IzO3icM9V8TPQ6UV6JeaXxwGb5rn9xZGBYCB/zPgEbIIAQ4l9BPBswEFFxr3NRQo95yVfAqdEKOkI116OE+eTfbglYapRAuZC7SipnK4GR85a5dVA8NWVr5yuPw6ntaUSOMarEBEOKaCzWcq4IXCWCelwl9BosP/PPLYAFxBCKBRb4/zyf7btAipoS2Xmt715XB5ByMWiTdKjAryJgjqUi9azPyRfdDcZfNVeVoLQ9+635TVvpokwVykrYNL9unoEgbj+bQQXADLvhKg+g7y43t5um3L3DveJUju4gcDN0L64rZ0XueXqgyKu9ySY2VBgx5Le+IGEKrPFY8IkTwFf9znQGcHcqD6od3OV1kw5acFchBe/XJb8QiKT7OI5XM1s0pQ8VAJztWFciPzY
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(7696005)(107886003)(6506007)(9686003)(55016003)(38070700005)(122000001)(86362001)(33656002)(38100700002)(83380400001)(2906002)(71200400001)(41300700001)(478600001)(316002)(26005)(52536014)(8676002)(4326008)(8936002)(5660300002)(66446008)(66476007)(66556008)(76116006)(66946007)(54906003)(64756008)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WJ5Mk7lm3wcgcHpQH3muTdIQXJoC1dzuNhOs8M/CAiy7K/VWtTUhJdOq7aM6?=
 =?us-ascii?Q?ubT3Gu/7TRfvSgKRxbAp83nu2LUd013oSp/HcpaNcYTs1/p2CsHQtmYpEOXx?=
 =?us-ascii?Q?l2SBvRWrED3Wk58B4j+aLbeEDuHVzS/VUbUuleLS1O6/Ep/KU/2iqcSswEAY?=
 =?us-ascii?Q?EYA0y02CQSlkMQ/Ls0C8hZisSRNI0r/PSGe30XXIEmWNBm5+kbiR0LVnpbqL?=
 =?us-ascii?Q?M26rLhGzyNr8wUN3FkLe+x33t3/AeOOm8x+gvpRPsitaa+o0/MPK3CA7bP90?=
 =?us-ascii?Q?mSKpyzBsGIllyBSC3hlpkZB7+WRBFIl2zUUEgcjnSUbz/tPlNgfCyUynxGbM?=
 =?us-ascii?Q?SJmf0uzL+984CCH04iozSJdUgM5cmZhKZWw5Ae4Pt/4V3exmeKPhohtwC+vN?=
 =?us-ascii?Q?DtfceHEgZWOU09CBazypFpeaXeVJ3Rzq6dqlyDIm1RSrbrPIjg/7Ul5mMgg3?=
 =?us-ascii?Q?s0clBed1uCknSjCx/vdqCYgypO9yifpKhYcqykk0QloS1qIySDLgbEq3ZKJH?=
 =?us-ascii?Q?vCYT+9x/bNlbqyOYo/bO3hpacQ96LsC7hBHGC+Iskg2PZnApsQZUXhAki4p/?=
 =?us-ascii?Q?/oeLSO2ObufXrT9MoskRKQVahh+5EU1h61gCClR7/b6qa7TZFiNW4a/esvh0?=
 =?us-ascii?Q?uxL4nRj+zTzy/nlr+1kjqZACwRTtpcSmB7F+euuCl5kgT2trvRvDbn99SvtH?=
 =?us-ascii?Q?EsTV1UcgiQZUTbkahO3esQma0KSyjEVJ5uqdWG82zXO9cWFdXrWyQsqoK7nS?=
 =?us-ascii?Q?H+MLu1xrEXkr9sNLzf+ZHu6UKFWPxmximYuik/PqPFeQlQOLCApBZWtvvF6r?=
 =?us-ascii?Q?UyHA/FTAMxGeGjw5f4MxyNfAP14ytAY5oglMdukvu3gdt5QOEBZ3usKqzmKk?=
 =?us-ascii?Q?7XgD65STPdGYCP+TkgdgTbbwWhhd7d/TTUW3w0NlpkSaXnaS669I4wm5zYRl?=
 =?us-ascii?Q?XfWPzVNRD5xsNrj/GH58cxGODS+siPWp5sVUcJjZVeQFWoTPMDEq85QnOnWa?=
 =?us-ascii?Q?KzsDxFfG8NbRGPgkt+IKNw7L5gqH66QFXnXvZDZ8HU9vqo2PJgXBXuf9cpOv?=
 =?us-ascii?Q?1RaWZD7HmAyi3u+hXrdwjWq0iYr7vElgR0sVyKDtedR+tnZ7MJGv3LuNDS/4?=
 =?us-ascii?Q?Iu3Y/2VoDudXuwXuhkcLcMhjHONvA+0Q4k2ngVoPnZL6rF7yabnZ/ZlZqqgr?=
 =?us-ascii?Q?Wjy5RK1wYOKMK+fnU5lRnVLGDli9E5bISyjg5Q4DF/Oo1dQKG0Fm2tguRV6H?=
 =?us-ascii?Q?8Xw3To/sVV9p6aJJHZoYA0D75PRYHZ49yfMZQ4ClqV2s/QLenlry4PU2gPu4?=
 =?us-ascii?Q?0n7iC+LRURkV0mYemY3UPvgXJxr0hLE5sbVlrcrh0Z4t9//kxr/yuNkJNVu3?=
 =?us-ascii?Q?bgfB7SH1H0zvEsvCt8Ja7LWwcKJjsti/Mz6zyDReSS2yJYQSqNb/OmVhMc6l?=
 =?us-ascii?Q?5uWvQ2bMJUb/Am4tztibLtg7qb+TU/H0vaaOk0ag5cyaVclWadxe/Y4xKeyR?=
 =?us-ascii?Q?rRHWr48VlN17072xRYPKa4k4Sfwf1Agid8yDCH10/1qgmi0Osud2fOxQ1J1w?=
 =?us-ascii?Q?kcwDJ8n4M3QlN7ejqho=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5527fa5-b6fb-4382-191d-08dbc8ec5a82
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 17:22:45.9015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B6yz31guLar5OitUK9p4R2YsP1cvuCylhrQOhIbYgr7Dg3ZT7sg/6vWgJ49dYYzjiKlii6klRL9JUK8xbw+XNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5024
Subject: RE: [virtio-comment] Re: [PATCH v1 7/8] admin: Add write recording
 commands


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Monday, October 9, 2023 9:46 PM
>=20
> On Mon, Oct 09, 2023 at 11:48:46AM +0000, Parav Pandit wrote:
> >
> > > From: virtio-comment@lists.oasis-open.org
> > > <virtio-comment@lists.oasis- open.org> On Behalf Of Michael S.
> > > Tsirkin
> > > Sent: Monday, October 9, 2023 4:28 PM
> >
> > > > May be we can use a different verb than record. May be tracking?
> > > > Record means, device accumulates these written pages addresses,
> > > > and when
> > > driver queries, it returns these addresses and clears it internally
> > > within the device.
> > >
> > > For example, what about two writes into same address. Do you get one
> > > record or two? What if the length is different?
> > One record.
> > Since the writes are tracked/recorded at page granularity, even if leng=
th is
> different, it still one entry.
>=20
> what if writes cover different pages but overlap?
From device point of view, for write recording if it spans two pages (due t=
o page_size), they are two write records.

> Don't bother answering here, I am implying this needs to be documented.
>=20
> We could give devices a bit of a freeway here too, e.g. explain that devi=
ce can
> combine two writes into one record but does not have to - might lead to b=
etter
> data structures internally.
>=20
The device can do so if the write record entry covers written length too.
Since known hypervisor work at constant page size per guest, the suppling o=
f the length was not effective enough.

>=20
> > >
> > >
> > > > > > Such an
> > > > > > +address is named as IO virtual address (IOVA).
> > > > >
> > > > > I don't know what does this have to do with IOVA. For that
> > > > > matter everything would have to be "IOVA". Spec calls these
> > > > > physical address and let's stick to that.
> > > > >
> > > > Make sense.
> > > > At device level it does not have knowledge of IOVA.
> > > > I will rename it.
> > > >
> > > > >
> > > > > > The owner driver enables write
> > > > > > +recording for one or more IOVA ranges per device during
> > > > > > +device migration flow. The owner driver periodically queries
> > > > > > +these written IOVA records from the device.
> > > > >
> > > > > periodical reads without any indication are the only option then?
> > > > >
> > > > At least for now, this is starting point. Software stack such as
> > > > QEMU does it
> > > periodically.
> > >
> > > So for CPU kvm switched to PML and this seems to work better - it
> > > guarantees there's convergence.
> > >
> > My guess that PML is better because write protection related faults are
> removed now.
> > The approach here is similar, but there is no PML kind of queue.
> > It is relatively manageable to slow down cpu on VMEXIT or other ways,
> compare to external network.
> >
> > And secondly, it is driven by the hypervisor cpu availability for capac=
ity
> planning etc.
> > So its periodic in nature that share similar scheme like PML.
>=20
> With PML the entries are recorded into two places: dirty bit in PTE+log.
> If log fills up there's an exit. I don't exactly get where do you expect =
the device
> to record this apparently unbounded log.
>
It is abstract enough from spec point of view. Like where the RSS config is=
 stored, where the mac table, vlan tables are stored.
It is similar to that way..

> >
> > > > When new use case arise, may be it can be extended.
> > > >
> > > > > > As the driver reads the written IOVA records,
> > > > > > +the device clears those records from the device. Once the
> > > > > > +device reports zero or small number of written IOVA records,
> > > > > > +the device is set to \field{Stop} or \field{Freeze} mode.
> > > > > > +Once the device is set to \field{Stop}
> > > > > >  or \field{Freeze} mode, and once all the IOVA records are
> > > > > > read, the driver stops  the write recording in the device.
> > > > >
> > > > >
> > > > > it is not great that you are rewriting text you just wrote in
> > > > > patch
> > > > > 1 here. pls find a way not to make reviewers read everything twic=
e.
> > > > >
> > > > There is small duplication of one line explaining mode change,
> > > > rest is
> > > contextual to the write recording.
> > > > Merging with text of patch_1 was slightly complicated to read, so
> > > > one
> > > sentence is duplicated.
> > > >
> > > > I will again check if patch_1 text extension is easier to read.
> > >
> > > this is latex, space is ignored. if you are only changing one word
> > > just don't move the rest and diff will look sane
> > >
> > Yeah, right. I will fix this.
> >
> > > > > > @@ -118,6 +119,10 @@ \subsubsection{Device
> > > > > > Migration}\label{sec:Basic Facilities of a Virtio Device /
> > > > > > \item Device Context Read Command \item Device Context Write
> > > > > > Command \item Device Context Discard Command
> > > > > > +\item Device Write Record Capabilities Query Command \item
> > > > > > +Device Write Records Start Command \item Device Write Records
> > > > > > +Stop Command \item Device Write Records Read Command
> > > > > >  \end{enumerate}
> > > > > >
> > > > > >  These commands are currently only defined for the SR-IOV group
> type.
> > > > > > @@ -307,6 +312,129 @@ \subsubsection{Device
> > > > > > Migration}\label{sec:Basic Facilities of a Virtio Device /
> > > > > > discarded, subsequent VIRTIO_ADMIN_CMD_DEV_CTX_WRITE
> command
> > > > > > writes a new device
> > > > > context.
> > > > > >
> > > > > > +\paragraph{Device Write Record Capabilities Query Command}
> > > > > > +\label{par:Basic Facilities of a Virtio Device / Device
> > > > > > +groups / Group administration commands / Device Migration /
> > > > > > +Device Write Record Capabilities Query Command}
> > > > > > +
> > > > > > +This command reads the device write record capabilities.
> > > > > > +For the command
> > > VIRTIO_ADMIN_CMD_DEV_WRITE_RECORD_CAP_QUERY,
> > > > > > +\field{opcode} is set to 0xd.
> > > > > > +The \field{group_member_id} refers to the member device to be
> > > accessed.
> > > > > > +
> > > > > > +\begin{lstlisting}
> > > > > > +struct virtio_admin_cmd_dev_write_record_cap_result {
> > > > > > +        le32 supported_iova_page_size_bitmap;
> > > > > > +        le32 supported_iova_ranges; }; \end{lstlisting}
> > > > > > +
> > > > > > +When the command completes successfully,
> > > > > > +\field{command_specific_result} is in the format
> > > > > > +\field{struct virtio_admin_cmd_dev_write_record_cap_result}
> > > > > > +returned by the device. The
> > > > > > +\field{supported_iova_page_size_bitmap}
> > > > > > +indicates the granularity at which the device can record IOVA =
ranges.
> > > > > > +the minimum granularity can be 4KB. Bit 0 corresponds to 4KB,
> > > > > > +bit
> > > > > > +1 corresponds to 8KB, bit 31 corresponds to 4TB. The device
> > > > > > +supports at least
> > > > > one page granularity.
> > > > > > +The device support one or more IOVA page granularity; for
> > > > > > +each IOVA page granularity, the device sets corresponding bit
> > > > > > +in the \field{supported_iova_page_size_bitmap}. The
> > > > > > +\field{supported_iova_ranges} indicates how many unique (non
> > > > > > +overlapping) IOVA ranges can be recorded by the device.
> > > > >
> > > > > what role does this granularity play? i see no mention of it down=
 the
> road.
> > > > >
> > > > The page_size in struct virtio_admin_cmd_write_record_start_data
> > > > must
> > > match to the granularity supplied above.
> > > > I missed it. Will add in v2.
> > > > This is very useful comment.
> > >
> > > Not that it's very clear what does page_size do.
> > >
> > Page_size is the granularity on which to record the writes.
> > For example, when page_size =3D 2MB, any writes are aligned to 2MB page
> boundary.
> > If 8KB data is written, only single write record entry reported.
> >
> > If the page_size =3D 4K, two write record entries reported.
> > ( I assumed 4K aligned address to keep the example simple).
>=20
>=20
> But you also said internally device maintains a bitmap.
Hmm, no. may be my response was confusing.
I replied that bitmap of supported page size, not the bitmap of the written=
 pages.

> So it will have to work hard to find a set bit in the map then?
> Do we want to maybe give device an option to just return a bitmap and hav=
e
> driver worry about it?
>=20
This would be an entirely different interface.
For 64GB VM, at 2MB page size, 32K bits to process.
And at 4KB page size, 16M bits to process.
And this is regardless of amount of dirty page tracking.

Bigger VMs finds it even more difficult.

> To me this looks like an optimization for when when devices keep writing =
to the
> same page all the time?  Do you have data to show that's commonly the cas=
e?
> Instrumenting a driver would be one way to find out.
>
Often for the devices which do not do zero copy, or uses page caches of blo=
ck device, the writes are occurring on repeated pages.

[..]
> > > Do we want to return it in this format then?
> > I think yes, because converting to the bit is easy.
> > Reporting bit requires bitmap being function of VM memory and not based
> on amount of written pages.
>=20
> So, you are optimizing for when small # of bits are set.
Device can be able to keep track for large amount of memory writes too.

> Do you have data to show it's common?
>=20
> I would maybe structure it like this:
>=20
> - bitmap used at all times
Bitmap are fine for small VMs as bits are small.
Log is better when VM has large memory where log is maintained only for the=
 written pages, instead of full VM size.

> - log is maintained as long as it's not full
> - when log fills up just bitmap is used.
>=20
> and at this point, we can maybe start with just a bitmap and add the log
> optimization separate, and optional?

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

