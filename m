Return-Path: <virtio-comment-return-9104-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122C2C4829A
	for <virtio-comment@archiver.kernel.org>; Mon, 12 Feb 2024 03:41:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4B8692AF88
	for <virtio-comment@archiver.kernel.org>; Mon, 12 Feb 2024 03:41:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2979098633E
	for <virtio-comment@archiver.kernel.org>; Mon, 12 Feb 2024 03:41:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0EE3C983E45; Mon, 12 Feb 2024 03:41:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ED323986324
	for <virtio-comment@lists.oasis-open.org>; Mon, 12 Feb 2024 03:41:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dysq9z9o3SvIR4ygoyMd/qC/LHwI9gonMa8JPZaCu+PZeLfKa2wLoidBAHWp6g7gALDeRFWzem1UcV27CFe6+tckRqkp84pm+F1zpNj39jQiW7wHRZUEjXTdjoduLVnCrsAPXg7AAGOsY2HsY/QOuP0GGuEu+f8EMqhFxEid+3d/vEJsO5P8Jc6XtlZF8qeMDRMyuWb3RtJh75Dmxa8e2by/BGMbpOEiVWZGfrqRwS+Zwv4aNKrQNZVeZzk57mauRbYBmaDDM1mVeajPUIErTuKS/ed2pnhKD/6OYGdcjm/H15g7rE+3MctdbaSAJADZ+vcSdD3NoqFOFxQ+paUhRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I17uTPaJZBLghIZgx5V0afS+71QHQEDjbjBIRh1UFNw=;
 b=n3BxSkER5Y6nRwPZWJ7s/IA/K42YDilxO4NIk7w+wm41UoQDSUK3IVRs5SYif+Nwfz9N7UtLKIFryT8hlkQMV13+2YRJJzYCfOcPMCOLWL+tcyXCIb0blRLDaWFf7zTyt/RqKrF/b1A/40Weao0oCSm8vcwSLynz9efueHyXFg6sx6Gg/ZOBNkOdF4d6J901oBTTM2WRBeUCL1dhBc7+/kzV+iDDW8OOeXjepg9qUfDHT0DvLyHyrYiflAFfqDN1vvfyda1Ak4bf8Qio/52XSwyxOXdk06utwcxKeZccLtYhJl6EW2aos46QKE3AsEO4afpy8WAvTp/TLTr9J+Rl6w==
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
Thread-Index: AQHaWZapbbmPdmmqcEOihgSCoyK+ALEFi7iAgACKR1A=
Date: Mon, 12 Feb 2024 03:41:34 +0000
Message-ID:
 <PH0PR12MB5481732266FD14BA4D0FA520DC482@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240207072336.477606-1-parav@nvidia.com>
 <20240207072336.477606-5-parav@nvidia.com>
 <SJ0PR18MB4477BB042E38CE59C9F652E8C3492@SJ0PR18MB4477.namprd18.prod.outlook.com>
In-Reply-To:
 <SJ0PR18MB4477BB042E38CE59C9F652E8C3492@SJ0PR18MB4477.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM4PR12MB6231:EE_
x-ms-office365-filtering-correlation-id: 4a2f9ff1-f535-4bd6-a78e-08dc2b7c82a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 MNi95RUzmlBu6kWq4C/7yPBGphuJ5XVze2nYeex0LUuK2/3bO65A35bob5Uz1QVRQLqLabhAeUfJfBQ01SEC/9Bjm1P8BLF88rfXv7zJjUylo12T0mrMaUhKJYz4T/SHmtXpOOiHzIzO8xvEoVcw9HV5TCXcUG5EwZwBWinCW0UbWPYQTlgbc03szNYP6QsQkunQAlR4GoqHcxORedVw+1ZHEa2G7E0mLQxCXq61A4vRzEqIcLgeX3cXBnofQmF29NKfwmg3bIhTI11D67YZjQX//aqtMYSS/pLlYEBRl4QC4nBFLoRC7keLYlUHldw/Evd+avV2ENGt22QwQib+WKCYnj6eb8sn1hTVvW2FO1O6Ld7Gm2mUIATe9Lmz2QJjWdFwerfYmxhic7+weOvPXxeyfZV8PPbNoC8zvCyRqOweFNiW0QEBne9ohWLkPxXmLYJKQJcdflJP+xluQW7h/qxgpRgYXvK/rJ6bJcGly2qbxDBma+DfIbHyen0RdwaaxdT3inKXmlxP3SdPt4kduQr++d+CRA7kTRy+vABXjI1371QNpK2lGWboESKUWegiLidoylNLNQhncYPXAaWAidtv7Jh/lx55af1z33Ch32ibZymtx7pnR/dW4sTrih9B1LRQ0x2MK1iK8PhWNvWXubpRUUDnzDzn4upzzgudU/Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(376002)(39860400002)(346002)(230922051799003)(230273577357003)(64100799003)(451199024)(186009)(1800799012)(33656002)(38070700009)(41300700001)(55016003)(19627235002)(110136005)(316002)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(86362001)(52536014)(8676002)(8936002)(4326008)(966005)(6506007)(7696005)(71200400001)(478600001)(2906002)(5660300002)(38100700002)(122000001)(53546011)(26005)(9686003)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?m06e9rJ7R753QY17FXPX1uX+ceXuE9P5IFscT4+KMI9awvl07UEzXObGQrQe?=
 =?us-ascii?Q?ecpuaPSbYo9hpQm206qSsK8UVrh0sJG+bamyeEBFS5XoujRZI+vbrEJ2NRR3?=
 =?us-ascii?Q?Bv8J7U7gRPcNRIc5s9Goz3nL2qtF438eK0vld13o1dz58Lmjb6IV8ZCjY9Es?=
 =?us-ascii?Q?s/eUZcAqfpmH//Cbm3lwDlZ9kMK4KLu31W0b2ThzAlaYWu0milr1/5Rag+Q/?=
 =?us-ascii?Q?oe8XNJvPCYYSx6C0+rlR2IXLaCdMqR7CBALH+I0Jp/2ErEeiFZKa08N6j8Sp?=
 =?us-ascii?Q?76dNAoru8xAC7shK9bKPwzWL+E9ymD6sliOI4mYWknd62CvTgQJNA6bFJsCv?=
 =?us-ascii?Q?Vst9XYh7JjhvpohQHl64vILaHR0rP0rwvc9QafGyfqMw3Ysgw0fFrgYyx+Ul?=
 =?us-ascii?Q?h8MSXFzwNm4L+R8Bh6s9cfsEOvRE5Zc6JSbgRZGAZZRoWDhnf1uBf5nlcj3C?=
 =?us-ascii?Q?zooXmTeuxk9GbA6zBJlj1jGbaFuoRKjQUDkEcv7B3CVUInmDj5e3IN/Sw5DP?=
 =?us-ascii?Q?/XfMPuejXaJltJ24bkNr2MHvE7C3rlMGuV2Ccnu82LOmKBFMQuCUnqLNrpX3?=
 =?us-ascii?Q?gd/fUh1t9VJHLNJ4rgO7u7vqAsx9Afwe8WmdVoJxJeq7uRQib20hWPUjxpgY?=
 =?us-ascii?Q?vGkTLefvAiOskdRumbFpM66RB7yJyciYFqsuzbsqWPnnUF4nxDZJKXzJCRuZ?=
 =?us-ascii?Q?QDWvnp8el7OehAyTpFE1NCkYDap0AjucGtzoMrGIjsjjtWkcLXMpyQMef6vz?=
 =?us-ascii?Q?ZWDAJHFe/ZAxryhWcUwMPh4yYJisO1jFbEz1ErChWfty6cpt3VDUcB0vQ+O3?=
 =?us-ascii?Q?kf6QOl8TevkrRnKTcxWnnMXuqwR3sYBUBMQwloCWrJcfZDT5gHOERI5n5hrW?=
 =?us-ascii?Q?CdVqaBatKfy7/Jwor1rbiVTWkqy89Dhw7QjzOKGIqZw3XnRwtN49/CHi3fE3?=
 =?us-ascii?Q?QOFwOuXRM9Ask+qLTioxD6JzrunXOGP7bnzEU799NJgx1+bcsKM/nuSe3tHx?=
 =?us-ascii?Q?IH2O/TWDdcDfYn48nw1xrsLtQ2xlBcLQdrI2cdtPbwe9nu6To43im6OqfPia?=
 =?us-ascii?Q?esV1Y0CfpLcJfCCWrOgAFW9hdzvSQg5PK11MXmHmKrWEw5+/CBmzJq2bMEpE?=
 =?us-ascii?Q?0idc8+qB3n7sr1PGqXmaoIgNL+cTaodYvMHu5OWLwRn7sNAXB8fjvtlZJAXh?=
 =?us-ascii?Q?TAHvU42zD3Dg6bYGPZ9Bg4oUjX+9WQByElvMD8GI0IATW5Dpd5K1obxEOY51?=
 =?us-ascii?Q?6sTVa8m6NNx7+XK10DJlaE0G9i9xzKlekj3bwPrg5uuC/NpdFyRH/hS6uJo8?=
 =?us-ascii?Q?kHab4k+7qlbM/74srqXvTFMdcPY//t7jnSwgB/RsPv3jfE359oTigwX8Fjm4?=
 =?us-ascii?Q?P+yMvZqU0bmlF54h6euJLERHpcRbg9H4mX/ulMCm4qvp+pPxrKVBFUnZAC48?=
 =?us-ascii?Q?YSOr2ga5yWPzoZRmcRRdXiICONN+G61Cf+0AuEcuGevV7wOUYNeZKzecjC8P?=
 =?us-ascii?Q?Q+pBImzfBtv+KszZ4DR9eMut47rc/qOqAOMNvqp6u6TbFtJqAVW17UCwrTCe?=
 =?us-ascii?Q?lwGxWwOaFUSCkwUUk4Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2f9ff1-f535-4bd6-a78e-08dc2b7c82a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2024 03:41:34.7397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5bi33dDbUx+Vju96uwl5F3ssZAz7DYfwARi8oDS/Zbx03tQJEzk9CSOMNixffK0Ws3bsli26zMjzgQoI3t23zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6231
Subject: [virtio-comment] RE: [EXT] [PATCH v9 04/13] admin-cmds-capabilities: Add capabilities
 admin commands

Hi Satananda,

> From: Satananda Burla <sburla@marvell.com>
> Sent: Monday, February 12, 2024 12:51 AM
>=20
> Hi Parav
>=20
> > -----Original Message-----
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Tuesday, February 6, 2024 11:23 PM
> > To: virtio-comment@lists.oasis-open.org; mst@redhat.com;
> > cohuck@redhat.com
> > Cc: hengqi@linux.alibaba.com; Satananda Burla <sburla@marvell.com>;
> > shahafs@nvidia.com; si-wei.liu@oracle.com;
> > peter.hilber@opensynergy.com; jasowang@redhat.com;
> > xuanzhuo@linux.alibaba.com; Parav Pandit <parav@nvidia.com>
> > Subject: [EXT] [PATCH v9 04/13] admin-cmds-capabilities: Add
> > capabilities admin commands
> >
> > External Email
> >
> > ----------------------------------------------------------------------
> > Add three capabilities related commands.
> > First to read the device and driver capabilities.
> > Second to write the driver capabilities.
> > Third for driver to discover which capabilities can be accessed.
> >
> > Write capabilities by the owner driver is not currently supported.
> > It will be supported in future by the owner driver to write for the
> > member device.
> >
> > Fixes: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> > 3A__github.com_oasis-2Dtcs_virtio-
> >
> 2Dspec_issues_179&d=3DDwIDAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DNHDPsfcAY
> lN2z-
> > NXHHG4WB09qqS0voo_nf6_kGS625A&m=3DKI-
> >
> QceHuScbIZDc_Kxteq_nU775BHpY5uMRJiwQuxhrgFOpnAx0SON8L2UXPJqty&
> s=3DjnFn-
> > DDDK_3FuIG5OPXgWud35KVh8KaeUDAro8N3jqU&e=3D
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > ---
> >  admin-cmds-capabilities.tex | 161
> ++++++++++++++++++++++++++++++++++++
> >  admin.tex                   |   9 +-
> >  capabilities.tex            |   3 +
> >  conformance.tex             |   2 +
> >  4 files changed, 174 insertions(+), 1 deletion(-)  create mode 100644
> > admin-cmds-capabilities.tex
> >
> > diff --git a/admin-cmds-capabilities.tex b/admin-cmds-capabilities.tex
> > new file mode 100644 index 0000000..47394c7
> > --- /dev/null
> > +++ b/admin-cmds-capabilities.tex
> > @@ -0,0 +1,161 @@
> > +\subsubsection{Device and Driver Capabilities}\label{sec:Basic
> > Facilities of a Virtio Device / Device groups / Group administration
> > commands / Device and Driver Capabilities}
> > +
> > +The device and driver capabilities commands are currently defined for
> > self group type and for
> > +SR-IOV group type.
> > +
> > +\begin{enumerate}
> > +\item Device Capabilities Support Query Command \item Capabilities
> > +Read Command \item Capabilities Write Command \end{enumerate}
> > +
> > +\paragraph{Device Capabilities Support Query Command}\label{par:Basic
> > Facilities of a Virtio Device / Device groups / Group administration
> > commands / Device and Driver Capabilities / Device Capabilities
> > Support Query Command}
> > +
> > +For the command VIRTIO_ADMIN_CMD_CAP_SUPPORT_QUERY,
> \field{opcode} is
> > set to 0x7.
> > +
> > +This command queries the supported device capabilities identifiers
> > bitmap in
> > +\field{supported_caps}. Each bit in \field{supported_caps}
> > +corresponds
> > to the
> > +capability identifier. Thus, supported_caps[0] refers to the first
> > +64-
> > bit value
> > +in this array corresponding to identifiers 0 to 63, supported_caps[1]
> > +is the second 64-bit value corresponding to identifiers 64 to 127, etc=
.
> > +For example, with \field{num_caps =3D 2}, the array of size 2 includin=
g
> > the values
> > +0x3 in supported_caps[0], and 0x1 in supported_caps[1] indicates that
> > only
> > +identifiers 0, 1 and 64 are supported.
> > +
> > +The length of the array \field{supported_caps} depends on the
> > +supported identifiers - it is large enough to include bits set for
> > +all supported identifiers, that is the length is set by calculating
> > +by starting with
> > the
> > +largest supported opcode adding one, dividing by 64 and rounding up.
> > +
> > +The array \field{supported_caps} is also allowed to be larger and to
> > +additionally include an arbitrary number of all-zero entries.
> > +
> > +For each identifier, the driver can read the device capabilities and
> > write
> > +the driver capabilities. The driver can also read the written
> > capabilities.
> > +
> > +This command has no command specific data.
> > +
> > +\begin{lstlisting}
> > +struct virtio_admin_cmd_query_supported_cap_result {
> > +        le16 num_caps;
> > +        u8 reserved[6];
> > +        le64 supported_caps[];
> > +};
> > +\end{lstlisting}
> Since this is not fixed size, what happens if the allocated write buffer =
for the
> command cannot fit the result ?
The device returns only the capabilities worth of supplied buffer.

> Does the device return error with specific  error code?
No. it truncates to the supplied length.
This command relies on the existing admin cmd spec.
Please see the snippet from the spec.

"Drivers are allowed to submit buffers that are shorter than what the devic=
e expects (that is, shorter
than the length of status through command_specific_result). This allows the=
 device to maintain a
single format structure even if some structure fields are unused by the dri=
ver.
The device compares the length of each part (device-readable and device-wri=
teable) of the buffer as submitted
by driver to what it expects and then silently truncates the structures to =
either the length submitted
by the driver, or the length described in this specification, whichever is =
shorter."

> > +
> > +When the command completes successfully,
> > \field{command_specific_result}
> > +is in the format \field{struct
> > virtio_admin_cmd_query_supported_cap_result}
> > +returned by the device. The number of valid array entries of
> > +\field{supported_caps} are indicated in \field{num_caps}.
> > +
> > +\paragraph{Capabilities Read Command}\label{par:Basic Facilities of a
> > Virtio Device / Device groups / Group administration commands / Device
> > and Driver Capabilities / Capabilities Read Command}
> > +
> > +This command reads the device or driver capabilities. It either reads
> > the
> > +capability of the own device or the owner device can read the
> > capabilities of
> > +the member device.
> > +
> > +\begin{lstlisting}
> > +struct virtio_admin_cmd_cap_read_data {
> > +        le16 cid;
> > +        u8 type; /* 0 =3D device cap, 1 =3D driver cap */
> > +        u8 reserved[5];
> > +};
> > +\end{lstlisting}
> > +
> > +For the command VIRTIO_ADMIN_CMD_CAP_READ, \field{opcode} is set
> to
> > 0x8.
> > +
> > +\field{group_member_id} refers to the device itself or the member
> > device to be accessed.
> > +\field{cid} refers to the capability identifier listed in
> > +\ref{sec:Basic Facilities of a Virtio Device / Device and Driver
> > Capabilities}.
> > +When \field{type} is set to 0, it refers to the device capability,
> > +when \field{type} is set to 1, it refers to the driver capability,
> > +rest of
> > the
> > +values are reserved.
> > +
> > +\begin{lstlisting}
> > +struct virtio_admin_cmd_cap_read_result {
> > +        le16 length;
> > +        u8 reserved[6];
> > +        u8 cap_specific_data[];
> > +};
> > +\end{lstlisting}
> Same as above
> > +
> > +When the command completes successfully,
> > \field{command_specific_result}
> > +is in the format \field{struct virtio_admin_cmd_cap_read_result}
> > responded
> > +by the device. The \field{length} is set to the length of the
> > +\field{cap_specific_data}. Each capability uses different capability
> > specific
> > +\field{cap_specific_data} and is described separately.
> > +
>=20
> Regards
> Satananda

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

