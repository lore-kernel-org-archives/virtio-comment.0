Return-Path: <virtio-comment-return-7622-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12943E95A8D
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 04:14:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1C7442AFEB
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 04:14:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F39BD9864CD
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 04:14:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D4BE39864AF; Mon,  9 Oct 2023 04:14:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BF77F9864CC
	for <virtio-comment@lists.oasis-open.org>; Mon,  9 Oct 2023 04:14:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MY+1bz6nPtDQgScC2jHjSo8YsnnEtP86hLBn6xivIQFi1Dasc2TpZ+K66wNAX5r9UPoUF4Faclja/hPsOAinngrYgA4Hm34Fy7sSX4i4b8KMW3hWWVKPB27gkFDoJKt9Iqg3goiwAGx47Pfxwy4QRjYr0mB4hAHeg3R89dzbcbIRJK+h/ARmnQBePGZvoNaD09y6gdzGKu/ytfcrlvl2/GHCBoTkcQHQY2CEMu+MRQ81hXpoEebs4mY9lVlC3t87Je8DAVymBPJh0Mic2CaniT/YG7YwoWWYD3QHPIT/4tYJfhOTztjJnKgLL3UtmrHUm2ovhN+u7fWTlPZmXRpAOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6d7/y47F2x0eYdFHj83AaNqoFMWYrOM4CRN+RT98fs=;
 b=k5HuPAEiURvQrMZvV+0EDf4QwJ/xndhyULOvtriHdwoCQJr2VuxXg3WvYSmw3hebwO9hXYJZ8Aylh3pwwLmfPtAttVEN8GLkC9DwVmnu0Q62g4xCXxRgcmK7xe1gq+VljVww3Ul+R7Na+IM1BxrshCK3rcCqGA0MtbJBgTHa1rr1qJ12Q5enO4DEz/twMobgRZ9z4iPjR45cxQEy0HnllDNI1+dK4ozXfmnbFYwMoTVmfurX2QJ5Oowfy9BYljbyzM6Z2pWYun5hqr26wYp+BzVb1lebWI/Vu/OE4aalCsJ+mt9OQgv0+iXtZDDoPJyQAi3zXv3IrmwRvV/WLmOubA==
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
Thread-Topic: [PATCH v1 7/8] admin: Add write recording commands
Thread-Index: AQHZ+dpSq9nJAWUDjkaN0yzGClzvNLA/yD8AgAENvNA=
Date: Mon, 9 Oct 2023 04:14:22 +0000
Message-ID:
 <PH0PR12MB54818D738BCD0E634517B3ABDCCEA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-8-parav@nvidia.com>
 <20231008074404-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231008074404-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CY5PR12MB6647:EE_
x-ms-office365-filtering-correlation-id: 88cc9f67-816a-40bc-1ed2-08dbc87e375b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 fX6U+deHxzvcQ1Nk3WZlzheTm/ojkgqu314xPzaC2TU0BYdeiYLB8xmBeiL9fhBJZkmhzcVe0e07ziW7jKXns2VzzP0UhOek3bc2T8DLGbKNuai96MmKkWV2Lbq0ZUYIPahYEmbwvWw6IKFWN3yTlj3jJ/JpnkNERJIgQz+9O1uJIrtNPXqPgpuDOqO4VHT4JW99Oy5c5X6L0JKgm4XtG2hCj4lHhRtD5m2W1O4l+38mBBpzC/HZwVYXwG/bBAx44DKwa/rJJNcNjC7bhDWWno2pYrOdaDWMkZGkV9WysiOFsfNWf4EH3QdiJQ7G1jhQycE1cm5Sdirl0CDvx1ODVhdvGzoH/ZF1FEgAEQLbsuCOGY2YVPaabJ6fIh8Uk0waa61pmZqeq/5x/XMu271hS9ZSRCtontRAkmhLaXX14iCVtBx9Voo+nwrGI/UWm2RbqKsUBU1F71/JPKDS924fOH+aEFEuC76j/jgrQhpKPtA2yiuHfTW42N5j2EOywOksquLQswYQesT6q+Fd9vV2aVGebfpPMrmam39KZ/rSzZpAC2/ddDdBuMSRYZPBd1rY38YA9ejsEiReUV+UJQet//OhR1ar74qdf44q5MLtO6YFZpk81TWq22SBB8fNRkuReLdanVXXlava4ToiyzOU2NqSWbMU8VZzdfWnr3SA/9k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(39860400002)(366004)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(41300700001)(83380400001)(30864003)(8676002)(52536014)(316002)(66476007)(966005)(5660300002)(4326008)(8936002)(76116006)(66946007)(64756008)(38100700002)(66556008)(66446008)(478600001)(2906002)(33656002)(38070700005)(86362001)(71200400001)(54906003)(6916009)(55016003)(26005)(107886003)(6506007)(7696005)(122000001)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Cj3Nd3+CpPAZTMcqcxMu6F7YIj6Gpd+kHDBHNsrdEpfI02rZ3R6m5J/d9Z0y?=
 =?us-ascii?Q?oPsyqlSBv8blVpYebk3C3cPEwEh8ykVlLNAq8M7+vmtRpi4S7aGqRWG4QQex?=
 =?us-ascii?Q?2dAzf4nIQqvrcFcMzLP0yhUNtxl8yvpcbw4T04c7lxsPX9B+EFpmSI91czgi?=
 =?us-ascii?Q?BrVS/QARLbnhGks86VoGdM2+kxJNWvacJOzEsONh0IPZfFDx99O+lHuRVXw3?=
 =?us-ascii?Q?iIaCIv0Yq+ROOFyJ6TwVkG89v4f8XMmE8fEhc8KnAx7oVXYOA7DHd1ch1wyb?=
 =?us-ascii?Q?hgW2pEm+I1jbe+/yN8Kv3mkhf1eeLekk5bxyhxOIzOmNB2hjv0l72GRt0I+p?=
 =?us-ascii?Q?Qtw+5RjKDKIZrIPZA7N/ke/z4RwEL5fc7iAxiyj88US4hp/lY5PqDDoIQmCx?=
 =?us-ascii?Q?RuizI2Ga72aB0GzZf0crRJazTu45ka5q8r22kS39oxArI+sljQY//FC1tnU3?=
 =?us-ascii?Q?SImAZn0CXArFieN9sid1yDxQqjI0pnNUXWG89cm/ZsWFOd0FtkxrvFDQje1F?=
 =?us-ascii?Q?sg1DsjbIhx5Vt6ppYuvGfSdw0nfbQcDVvKa3PPBeV0cAI5DsZc/AKmalPBrK?=
 =?us-ascii?Q?e1lye19TSdBg2p31kRLGZfMSvwVSzulcPdjB4t1K/08mTcHq+DASeQnbC5Y6?=
 =?us-ascii?Q?dkyuKHiTHyq7nfyJJFfmNvsVTxuxWDZotIGKCayE8mPSyqIk9hw0sq+HHuSI?=
 =?us-ascii?Q?gL1EMLVDr2q9BmJsIjMWFcoWpzrms6w/2z3x+yPGZxGQznunU+4L70709oxO?=
 =?us-ascii?Q?/pAgwEol8XC3OQeOsdrTpy02UX1pgYQZzJSRbpLkTSSLn2N1KrA2yzkk9VpG?=
 =?us-ascii?Q?+oK8XG1uNOdLZRh7g1ajnwW57zGL7AfnP0WsQ3IxFNIVnwj10iqCjcKDneEw?=
 =?us-ascii?Q?brlFFjzluWBOrjIB2J13h8o1wjwQ39Lf1Fme9n+lN9nMix2K8/dViUY+/fKn?=
 =?us-ascii?Q?GhKEU5nsuWbq0BbOjp/jTjEZMBu4r9lYmY+dmp8ZTAU98DhS8vTQ2y7cMYzh?=
 =?us-ascii?Q?gKPEOso5p6VuMaZtxrFKySR+Qpvhs9kmJ7C7JIU8kahtEOuNLMvD3qn6UNpI?=
 =?us-ascii?Q?mknMjv126kYImaG54jZ4EbGrxceC5Q9XwTIRamA4JlUcASyuCga8HTKkgMzS?=
 =?us-ascii?Q?7jJZyeSVZeyMoPnSXABqjVqZ5JbmyD8X9kIXbCxrceY8ZoRpiK7Kk1l1CKmy?=
 =?us-ascii?Q?q9cG689GniCoLsJSERF1Vw7K+SAkAtOXTZLvVg7LUgEDU1nU0FzN2bxfoe9G?=
 =?us-ascii?Q?GEnjIMb6Qx8Us0afgZcmyMs09BCPwcNr2ww25pzOh45oKIItIJzSqCVN0F3a?=
 =?us-ascii?Q?ROgGl1grcw10ma1zruTwYbWDrE0Y1rmjYoqVNLPkoqIrvkZRsIbJaOilFDIB?=
 =?us-ascii?Q?wdoeoIOGbJonBfz72p1iFqaJ/ZX7JgA8CzQIc4eY1qX3k+hPwzGlbnzAiEJ4?=
 =?us-ascii?Q?znNVZxrTrDYDLpUt0D8ZFjeaHTzqFWkBgSJs+pn/tOFaxqnPxSyIh9qAwf8I?=
 =?us-ascii?Q?YvI183dx/AvowCIXrLfP5MA/lwHXJ4zNUNgN0ZqBz0aA5zKrkN0de5kUKxIE?=
 =?us-ascii?Q?2hjUNpJfPh5lJVMzQzk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88cc9f67-816a-40bc-1ed2-08dbc87e375b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 04:14:22.2845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FF6MxiFGUip60wGF7GVKvaaqeoVRi2S7AHjLFUz/TAaLuOiab/ZjVdlgL/+AeTGzfALfszzrFsC70P2SE3Intg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6647
Subject: [virtio-comment] RE: [PATCH v1 7/8] admin: Add write recording commands



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Sunday, October 8, 2023 5:23 PM
>=20
> On Sun, Oct 08, 2023 at 02:25:54PM +0300, Parav Pandit wrote:
> > When migrating a virtual machine with passthrough virtio devices, the
> > virtio device may write into the guest memory. Some systems may not be
> > able to keep track of these pages efficiently.
> >
> > To facilitate such a system, a device provides the record of pages
> > which are written by the device. In one use case, this commands
> > connect to the vfio framework at [1].
> >
> > The owner driver configures the member device for list of address
> > ranges for which it expects write recording and reporting by the device=
.
> >
> > The owner driver periodically queries the written pages address record
> > which gets cleared from the device upon reading it.
> >
> > When the write records reduces over the time, at one point write
> > recording is stopped after the device mode is set to FREEZE.
> >
> > [1]
> > https://elixir.bootlin.com/linux/v6.4-rc1/source/include/uapi/linux/vf
> > io.h#L1207
> >
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > Signed-off-by: Satananda Burla <sburla@marvell.com>
> > ---
> >  admin-cmds-device-migration.tex | 146
> ++++++++++++++++++++++++++++++--
> >  admin.tex                       |  10 ++-
> >  2 files changed, 146 insertions(+), 10 deletions(-)
> >
> > diff --git a/admin-cmds-device-migration.tex
> > b/admin-cmds-device-migration.tex index e98d552..49835eb 100644
> > --- a/admin-cmds-device-migration.tex
> > +++ b/admin-cmds-device-migration.tex
> > @@ -97,15 +97,16 @@ \subsubsection{Device Migration}\label{sec:Basic
> > Facilities of a Virtio Device /  During the device migration flow, a
> > passthrough device may write data to the  guest virtual machine
> > memory, a source hypervisor needs to keep track of these  written memor=
y to
> migrate such memory to destination hypervisor.
> > -Some systems may not be able to keep track of such memory write
> > addresses at -hypervisor level. In such a scenario, a device records
> > and reports these -written memory addresses to the owner device. Such
> > an address is named as -IO virtual address (IOVA). The owner driver
> > enables write recording for one or -more IOVA ranges per device during
> > device migration flow. The owner driver -periodically queries these
> > written IOVA records from the device. As the driver -reads the written =
IOVA
> records, the device clears those records from the device.
> > -Once the device reports zero or small number of written IOVA records,
> > the device -mode is set to \field{Stop} or \field{Freeze}. Once the
> > device is set to \field{Stop}
> > +Some systems may not be able to keep track of such memory writes at
> > +addresses at hypervisor level. In such a scenario, a device records
> > +and reports these written memory addresses to the owner device.
>=20
>=20
> what does it mean to record them?
>
May be we can use a different verb than record. May be tracking?
Record means, device accumulates these written pages addresses, and when dr=
iver queries, it returns these addresses and clears it internally within th=
e device.
=20
> > Such an
> > +address is named as IO virtual address (IOVA).
>=20
> I don't know what does this have to do with IOVA. For that matter everyth=
ing
> would have to be "IOVA". Spec calls these physical address and let's stic=
k to
> that.
>=20
Make sense.
At device level it does not have knowledge of IOVA.
I will rename it.

>=20
> > The owner driver enables write
> > +recording for one or more IOVA ranges per device during device
> > +migration flow. The owner driver periodically queries these written
> > +IOVA records from the device.
>=20
> periodical reads without any indication are the only option then?
>
At least for now, this is starting point. Software stack such as QEMU does =
it periodically.
When new use case arise, may be it can be extended.
=20
> > As the driver reads the written IOVA records,
> > +the device clears those records from the device. Once the device
> > +reports zero or small number of written IOVA records, the device is
> > +set to \field{Stop} or \field{Freeze} mode. Once the device is set to
> > +\field{Stop}
> >  or \field{Freeze} mode, and once all the IOVA records are read, the
> > driver stops  the write recording in the device.
>=20
>=20
> it is not great that you are rewriting text you just wrote in patch 1 her=
e. pls find
> a way not to make reviewers read everything twice.
>=20
There is small duplication of one line explaining mode change, rest is cont=
extual to the write recording.
Merging with text of patch_1 was slightly complicated to read, so one sente=
nce is duplicated.

I will again check if patch_1 text extension is easier to read.

> > @@ -118,6 +119,10 @@ \subsubsection{Device Migration}\label{sec:Basic
> > Facilities of a Virtio Device /  \item Device Context Read Command
> > \item Device Context Write Command  \item Device Context Discard
> > Command
> > +\item Device Write Record Capabilities Query Command \item Device
> > +Write Records Start Command \item Device Write Records Stop Command
> > +\item Device Write Records Read Command
> >  \end{enumerate}
> >
> >  These commands are currently only defined for the SR-IOV group type.
> > @@ -307,6 +312,129 @@ \subsubsection{Device Migration}\label{sec:Basic
> > Facilities of a Virtio Device /  discarded, subsequent
> > VIRTIO_ADMIN_CMD_DEV_CTX_WRITE command writes a new device
> context.
> >
> > +\paragraph{Device Write Record Capabilities Query Command}
> > +\label{par:Basic Facilities of a Virtio Device / Device groups /
> > +Group administration commands / Device Migration / Device Write
> > +Record Capabilities Query Command}
> > +
> > +This command reads the device write record capabilities.
> > +For the command VIRTIO_ADMIN_CMD_DEV_WRITE_RECORD_CAP_QUERY,
> > +\field{opcode} is set to 0xd.
> > +The \field{group_member_id} refers to the member device to be accessed=
.
> > +
> > +\begin{lstlisting}
> > +struct virtio_admin_cmd_dev_write_record_cap_result {
> > +        le32 supported_iova_page_size_bitmap;
> > +        le32 supported_iova_ranges;
> > +};
> > +\end{lstlisting}
> > +
> > +When the command completes successfully,
> > +\field{command_specific_result} is in the format \field{struct
> > +virtio_admin_cmd_dev_write_record_cap_result}
> > +returned by the device. The \field{supported_iova_page_size_bitmap}
> > +indicates the granularity at which the device can record IOVA ranges.
> > +the minimum granularity can be 4KB. Bit 0 corresponds to 4KB, bit 1
> > +corresponds to 8KB, bit 31 corresponds to 4TB. The device supports at =
least
> one page granularity.
> > +The device support one or more IOVA page granularity; for each IOVA
> > +page granularity, the device sets corresponding bit in the
> > +\field{supported_iova_page_size_bitmap}. The
> > +\field{supported_iova_ranges} indicates how many unique (non
> > +overlapping) IOVA ranges can be recorded by the device.
>=20
> what role does this granularity play? i see no mention of it down the roa=
d.
>=20
The page_size in struct virtio_admin_cmd_write_record_start_data must match=
 to the granularity supplied above.
I missed it. Will add in v2.
This is very useful comment.

>=20
> > +
> > +\paragraph{Device Write Records Start Command} \label{par:Basic
> > +Facilities of a Virtio Device / Device groups / Group administration
> > +commands / Device Migration / Device Write Records Start Command}
> > +
> > +This command starts the write recording in the device for the
> > +specified IOVA ranges.
> > +
> > +For the command VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START,
> > +\field{opcode} is set to 0xe.
> > +The \field{group_member_id} refers to the member device to be accessed=
.
> > +
> > +The \field{command_specific_data} is in the format \field{struct
> > +virtio_admin_cmd_write_record_start_data}.
> > +
> > +\begin{lstlisting}
> > +struct virtio_admin_cmd_write_record_start_entry {
> > +        le64 iova;
> > +        le64 page_count;
> > +};
> > +
> > +struct virtio_admin_cmd_write_record_start_data {
> > +        le64 page_size;
> > +        le32 count;
> > +        u8 reserved[4];
> > +        struct virtio_admin_cmd_write_record_start_entry entries[];
> > +};
> > +
> > +\end{lstlisting}
> > +
> > +The \field{count} is set to indicate number of valid \field{entries}.
> > +The \field{iova} indicates the start IOVA address. The
> > +\field{page_count} indicates number of pages of size
> > +\field{page_size} starting from \field{iova} to record for write
> > +reporting. VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START
> > +command contains unique i.e. non overlapping IOVA range entries.
> > +Whenever a memory write occurs by the device in the supplied IOVA
> > +range, the device records the actual IOVA and number of bytes written =
to the
> IOVA.
> > +These write records can be read by the the driver using
> > +VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ command.
> > +
> > +This command has no command specific result.
> > +
> > +\paragraph{Device Write Record Stop Command} \label{par:Basic
> > +Facilities of a Virtio Device / Device groups / Group administration
> > +commands / Device Migration / Device Write Record Stop Command}
> > +
> > +This command stops the write recording in the device for IOVA ranges
> > +which were previously started using
> > +VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START
> > +command.
> > +
> > +For the command VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_STOP,
> > +\field{opcode} is set to 0xf.
> > +The \field{group_member_id} refers to the member device to be accessed=
.
> > +
> > +This command does not have any command specific data.
> > +This command has no command specific result.
> > +
> > +\paragraph{Device Write Records Read Command} \label{par:Basic
> > +Facilities of a Virtio Device / Device groups / Group administration
> > +commands / Device Migration / Device Write Records Read Command}
> > +
> > +This command reads the device write records for which the write
> > +recording is previously started using
> VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START command.
> > +
> > +For the command VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ,
> > +\field{opcode} is set to 0x10.
> > +The \field{group_member_id} refers to the member device to be accessed=
.
> > +
> > +\begin{lstlisting}
> > +struct virtio_admin_cmd_write_records_read_data {
> > +        le64 iova;
> > +        le64 length;
> > +};
> > +
> > +struct virtio_admin_cmd_dev_write_records_cnt {
> > +        le32 count;
> > +};
> > +
> > +struct virtio_admin_cmd_dev_write_records_result {
> > +        le64 iova_entries[];
> > +};
> > +\end{lstlisting}
> > +
> > +The \field{command_specific_data} is in the format \field{struct
> > +virtio_admin_cmd_write_records_read_data}. The driver sets the \field
> > +{iova} indicating the start IOVA address for up to the \field{length}
> > +number of bytes. The supplied IOVA range same or smaller than the
> > +range supplied when write recording is started by the driver in
> > +VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START command.
>=20
> Seems pretty sparse. Lots of hypervisors chose to implement a bit per pag=
e
> strategy.
This command result addresses will feed into such bit.

>=20
> > +
> > +When the command completes successfully,
> > +\field{command_specific_result} is in the format \field{struct
> > +virtio_admin_cmd_dev_write_records_result}
> > +and \field{command_specific_result} is in format of \field{struct
> > +virtio_admin_cmd_dev_write_records_cnt} containing number of write
> > +records returned by the device.
>=20
> what are these records though?
>=20
It is struct virtio_admin_cmd_dev_write_records_result.
I will rephrase it to link to struct virtio_admin_cmd_dev_write_records_res=
ult.

>=20
> > When the command completes
> > +successfully, the write records which are returned in the result are
> > +cleared from the device and same records cannot be read again. When
> > +new writes occur at same IOVA range or at different once, those
> > +records can be read as new write records.
>=20
>=20
> this last sentence just confuses.
>=20
How about just keeping below text rewrite?
When the command completes successfully, the write records returned in the =
result are cleared from the device.

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

