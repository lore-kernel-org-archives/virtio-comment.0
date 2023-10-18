Return-Path: <virtio-comment-return-7810-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C77CDB482
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:41:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F02D52B056
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:41:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B9D879868A4
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:41:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9A4CB986898; Wed, 18 Oct 2023 10:41:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8B1CF986899
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 10:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9GRnOQ2k1bgUWtURwxyIT6V2u01Vf0nUZFmiLxxbARurTF+VdW8WueTEQbOlgbQ3VGbhkPzJiVnREdDAwOthsmklVTxxDt+extQVPuaiUg4dG2G6q+g5CBWV/cBa/QNsIgI/oI/csRs+c0pnWHta896JkjlfnTjqpIKfbtg/xq1OmJ1+JTc3sNu6tJjwQgmI16RBropJZghJMJRW5HjI7jGv9PV+SZkVFb4XBEKItPwfjKEHkBDEbGJUwzOow5fRafkej4n9o6DPq0ysghp188E82UeeQ0E0UPnadLrMP4kqYdT65xInvi+9erFXVh5ZOkHJTaZHUknuepEDFS09w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wifgxlF0pHJvkvbLEohiORndvl+N+edbjO76EB96fEA=;
 b=h7WNcNVxjgTb3zD7+El8AsrNiXFIZ7b5MY5iYhvsAVfle+dObguUd4RXCzcPvR4HiCVk5dD346CM4kIefzdPWUvtgU9+MDuVZdT62ZsabvaWhQ+vAh3Ju6XqvslMT9qSmI0UO9VimqdpDeP9h4EjtjLM7GtG0oUkNWZu+wRD0vnmtGs+pU4ZTUTKywYpdxFbSj0JEVjZjGEcukQ0/zQCjDbBSgaYGv7zUcxnCL/5wen/7kMbtVPXk/gXI8Ncj4I4BCX4myqF0+ltPprjyIWjQ1+vX4SrX2Q+UGvDFDxP2lHLWMm/94cxpPjxcNlBstwFDhc8dp1AbzehO3wdN49BPA==
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
Thread-Topic: [PATCH v1 4/8] admin: Add device migration admin commands
Thread-Index: AQHZ+dpI2732gBmw4k+Ms+IYHvK027BPKhAAgAAY/MCAACQ/gIAAAnwQ
Date: Wed, 18 Oct 2023 10:41:24 +0000
Message-ID:
 <PH0PR12MB5481C901829C27B1B2D1A704DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-5-parav@nvidia.com>
 <20231018022502-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548141412C409813A4203DCDDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231018061958-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231018061958-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH0PR12MB7472:EE_
x-ms-office365-filtering-correlation-id: 1eb8bb12-dc5b-41fb-37c1-08dbcfc6c6c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /d1r+RIyoN1gGkbikMYBXfoDapHApg/xu6t9PxYWvIzu65JlArEOpghZ/HLpRQzUFSpdwzrcdRf03yfuZeZ7RJdmmo/WVyhwqv8NNtLmeQPE+WPMqZw7oT8i7IWp7nqLI6NjvqcVyQTmCDuR+zugpGmcfb1RItt52lSiNxYi0rC/YzlrjlREnK4DFJcHornVHN0SrYOx06u2rMEgO/bbz6HhUa3mFHrrrQNO4gvneYU+iKLOWhg9OOjPNnouHM+PGEYyK9T1iwcfcPOmX70tCRB1LqJsNYM1ERHCLQl4p+ZX4O66M1FUOCwYjmJara+kFQvstC3Y9Hb3MQXDuC9OKDy9sGODlyfoCUm7iVCNa6N36LzwVQilbi+5DmLSMOHanpIF/XjucqNbwg2U4hSVMiEyHK5BhHWxOU9Jm4uWe9Y8N9lGljfenHZlq6VUt36alWRubTRsGEA1hXgmI1plTmvOAVmxjx8OBu7A2hpYRgPsyPTzWHhFTLBsNKddfczPKh9p5mC0K8APQoGjcrMIwh7B9OuGgQ9fnFxNDptJKqljWTy8S/BygRU1B1tyNDp8mmTWwhyP4VvXkFj42k7v7AGvssfWbFX4kX0gr7v4Doiw6NE29+BFUfY+rVRHX+hAk4snZE4L3dAGQ4ePwqB39n53HKgLMI8nBZpihPzgP5g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(39860400002)(346002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(55016003)(64756008)(966005)(76116006)(66946007)(478600001)(54906003)(71200400001)(6916009)(66476007)(66556008)(6506007)(86362001)(66446008)(107886003)(83380400001)(38100700002)(9686003)(316002)(26005)(7696005)(4326008)(122000001)(38070700005)(33656002)(52536014)(2906002)(8936002)(5660300002)(8676002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?E+YGI7r9XqYTWnacRK+/zZ6wURToJEsibWNhKHu4Osj0upEzp+ZifD3JYJ5L?=
 =?us-ascii?Q?7ZSXO0aM846sxowt8YxpmFFgYkc68gTZvAR3YTMrbVFVBxDDJKToZurNZUAj?=
 =?us-ascii?Q?VE+8PBYlc28LBh6dq0kKY+cehcYFbN9s/jbQBwdGjmhLD6QWRDmUqw2Yav9h?=
 =?us-ascii?Q?V7tA66uv97swgPn2JLbxibH5y/hyauGL15L35nW060JxNS0ukEpUYvblh6jz?=
 =?us-ascii?Q?HbgrieRAEvTIGp2TDAjWm4CB8OFgOg4+YxIgoq8od8Ao5f1tyW1CpUFP+01Y?=
 =?us-ascii?Q?b4no4lytT3/WkFZOOEpolXNQVuTGgq76AFDWm00W/SkjGIlV43rVVu/gxjKM?=
 =?us-ascii?Q?p0Vt5KF4AvyGQwEQjJSP2crPf+3kdp6vrgr76ty85UqGU933B1HP1Iu5tD62?=
 =?us-ascii?Q?FXePCq9V9rXig2f1HI92wg+VGecSGExM+yHddj1Kp4S470sp/wXOSgquJpn9?=
 =?us-ascii?Q?CCiqTvyoAMWpANBXI3nD0D4DBRwKU8XZOjQl19U12m3O8JDysZXpAIRDOq5R?=
 =?us-ascii?Q?x7Eksrn8SFnRsvlY80y9ZyKjMmoB4FqeDybfLSUWOxLT0zH76BFI03WtzYwA?=
 =?us-ascii?Q?zCRwa6aT76iIYbUS+pLsaBKAK62X15Et8tT+3uylx03yInPoniMLFSv1Xim5?=
 =?us-ascii?Q?ic9OZ/99Xr6qsMwrVWoFD5ZslWuK+L+nifrFoU/dJx0ElKyCcCPhlyyoVXZX?=
 =?us-ascii?Q?9aZAFeTm1trcAPcdXGUbFmBEoMqOSa18EW+iqhb72jT2kfZWTntBlda9Xjve?=
 =?us-ascii?Q?yEPo0xIPQEJhU1Je8C2Sxl6Xo7uQIhXXmOaKwOQPREHA84L54Vus4AwVHeDM?=
 =?us-ascii?Q?bDS6gG2Mtl6n6fsMWUQblKQkTmw7zySsbDOzx93cOCSGyZMLkqBF+yYGamxA?=
 =?us-ascii?Q?vYwA/C0qsIEvm3U50zKE+DfwcY4l1aWc+eykrjSjqlye0iAnDrmHO5yOMuvL?=
 =?us-ascii?Q?PbGjXM5+cd5SyI4GlRD0hBfBjqucpzhCrRA+U7waD3T7ybIipwh/7RskXdYH?=
 =?us-ascii?Q?gadpLC2PobMOunQI+Uj9U4rE3efybaE/S7AvGNzeH1e0wPrEGg6qmrtXuE5r?=
 =?us-ascii?Q?IlLMtbaYeTNPZOqVieFIeTZrbR+2riVAALR6sHFug/xxuveVy0UI4/ZEiMpc?=
 =?us-ascii?Q?3Eg4btIxeDWBiAMc/+BsjCN7IzuOJ23j8DfRtKuYAouaeSThuOu5i7pspD/o?=
 =?us-ascii?Q?x3hLEG9FhvF5XiY2228C7RCPaZcJl30DufQ4maqXj68tN+ADrzppPfuOaViI?=
 =?us-ascii?Q?PkMuIcZFe+2L0Src6sbEcfX6gy47CiMUKNTUg494B5lDTuSbPXflAUO7r6qR?=
 =?us-ascii?Q?HZalmQkzK3Z/NUTKRn94kd5vwdT1o8VQIgkAWJrnLKyiMQsRRZOv+lQsx2ps?=
 =?us-ascii?Q?2jFOARMB5jtamfoTL6fzr43cevBD7FxXEUfh0Qn+AAKEE3XIDQoXjl7reRIi?=
 =?us-ascii?Q?Ahbd3hxv0XsuNRIhqQUg89whH+HNsR+ekFNSidUBsMSH3e9MITFFh3Vki+Kt?=
 =?us-ascii?Q?7Onu5oH3bpO5XjtW6FsfPlKwY1B6D5WCNiJRfK5hQkK+yvXmZi70ac8NNV7t?=
 =?us-ascii?Q?/+0pB/fdiWpOA+nFbVI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb8bb12-dc5b-41fb-37c1-08dbcfc6c6c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 10:41:24.8334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P/bYHIWQvYyI+KIDRIpJYgGIpdcuDNJfIlZozVDmNaM22YvJfQ6XfhpHEgbtVnFJf0fVQcD3vcBEFgdCl19fUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7472
Subject: [virtio-comment] RE: [PATCH v1 4/8] admin: Add device migration admin commands



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, October 18, 2023 3:56 PM

> On Wed, Oct 18, 2023 at 08:24:56AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Wednesday, October 18, 2023 12:17 PM
> > >
> > > On Sun, Oct 08, 2023 at 02:25:51PM +0300, Parav Pandit wrote:
> > >
> > > ...
> > >
> > > > +\paragraph{Device Context Size Get Command} \label{par:Basic
> > > > +Facilities of a Virtio Device / Device groups / Group
> > > > +administration commands / Device Migration / Device Context Size
> > > > +Get Command}
> > > > +
> > > > +This command returns the remaining estimated device context size.
> > > > +The driver can query the remaining estimated device context size
> > > > +for the current mode or for the \field{Freeze} mode. While
> > > > +reading the device context using VIRTIO_ADMIN_CMD_DEV_CTX_READ
> > > > +command, the actual device context size may differ than what is
> > > > +being returned by this command. After reading the device context
> > > > +using command VIRTIO_ADMIN_CMD_DEV_CTX_READ, the remaining
> > > > +estimated context
> > > size
> > > > +usually reduces by amount of device context read by the driver
> > > > +using VIRTIO_ADMIN_CMD_DEV_CTX_READ command. If the device
> > > > +context is updated rapidly the remaining estimated context size
> > > > +may also increase even after reading the device context using
> > > VIRTIO_ADMIN_CMD_DEV_CTX_READ command.
> > > > +
> > > > +For the command VIRTIO_ADMIN_CMD_DEV_CTX_SIZE_GET,
> \field{opcode}
> > > is set to 0x9.
> > > > +The \field{group_member_id} refers to the member device to be
> accessed.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_admin_cmd_dev_ctx_size_get_data {
> > > > +        u8 freeze_mode;
> > > > +};
> > > > +\end{lstlisting}
> > > > +
> > > > +The \field{command_specific_data} is in the format \field{struct
> > > > +virtio_admin_cmd_dev_ctx_size_get_data}.
> > > > +When \field{freeze_mode} is set to 1, the device returns the
> > > > +estimated device context size when the device will be in \field{Fr=
eeze}
> mode.
> > > > +As the device context is read from the device, the remaining
> > > > +estimated context size may decrease. For example, member device
> > > > +mode is \field{Stop}, the device has estimated total device
> > > > +context size as 12KB; the device would return 12KB for the first
> > > > +VIRTIO_ADMIN_CMD_DEV_CTX_SIZE_GET command, once the driver
> has
> > > > +already read 8KB of device context data using
> > > > +VIRTIO_ADMIN_CMD_DEV_CTX_READ command, and the remaining
> data is
> > > 4KB,
> > > > +hence the device returns 4KB in the subsequent
> > > > +VIRTIO_ADMIN_CMD_DEV_CTX_SIZE_GET command.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_admin_cmd_dev_ctx_size_get_result {
> > > > +        le64 size;
> > > > +};
> > > > +\end{lstlisting}
> > >
> > > So we have a 64 bit size? How are we going to return so much?
> > >
> > I agree it is a lot.
> > But this is the case because one has defined struct virtio_pci_cap64.
>=20
> Good point.
>=20
> That's there so we can define 64 bit resources.
>=20
> But if you have them and you want to migrate then you need change trackin=
g
> and incremental state save, you can not do it in one shot with device con=
text.
>
Each read of the device context would return different incremental state.
It would be good possibly to have explicit signal on the device context rea=
d to indicate end of stream, instead of relying on the size.
=20
>=20
> > >
> > > > +
> > > > +When the command completes successfully,
> > > > +\field{command_specific_result} is in the format \field{struct
> > > virtio_admin_cmd_dev_ctx_size_get_result}.
> > > > +
> > > > +Once the device context is fully read, this command returns zero
> > > > +for \field{size} until the new device context is generated.
> > > > +
> > > > +\paragraph{Device Context Read Command} \label{par:Basic
> > > > +Facilities of a Virtio Device / Device groups / Group
> > > > +administration commands / Device Migration / Device Context Read
> > > > +Command}
> > > > +
> > > > +This command reads the current device context.
> > > > +For the command VIRTIO_ADMIN_CMD_DEV_CTX_READ, \field{opcode}
> is
> > > set to 0xa.
> > > > +The \field{group_member_id} refers to the member device to be
> accessed.
> > > > +
> > > > +This command has no command specific data.
> > >
> > > So I am not sure this is wise. Multi-year experience with QEMU
> > > taught us that we are likely to make mistakes when defining
> > > migration format - forget some fields, validate them incorrectly, and=
 so on.
> > > Making a somewhat safe assumption that we'll make mistakes in the
> > > spec, too, I'd like to see some kind of idea of how we'll support
> > > compatibility and/or graceful failure if/when we do.
> > >
> > Very valid point. In v2 I added the compatibility command at [1] as "De=
vice
> Context Supported Fields Query Command"
> >
> > [1]
> > https://lists.oasis-open.org/archives/virtio-comment/202310/msg00195.h
> > tml
> > >
> > > > +\begin{lstlisting}
> > > > +struct virtio_admin_cmd_dev_ctx_rd_len {
> > > > +        le32 context_len;
> > > > +};
> > > > +
> > > > +struct virtio_admin_cmd_dev_ctx_rd_result {
> > > > +        u8 data[];
> > > > +};
> > > > +\end{lstlisting}
> > >
> > > so callers needs to pin whatever device tells it to?
> > >
> > How much memory to pin is driver choice, it can pin 4K and keep reading=
 1MB
> memory by 1MB/4K size calls.
> > Or it can pin 1MB and read full.
> >
> > > admin commands support truncation intentionally.
> > >
> > > it is not clear, to me, that it's ok to have device just save as
> > > much state as it wants to.
> > Why would device store some unreasonable amount of state?
>=20
> Because I know how hardware vendor minds work: oh we can request a bunch
> of memory, let's do that just in case ;)

For a device that has large memory, it is unlikely it can store it in secon=
d copy.

>=20
> > >
> > > > +
> > > > +When the command completes successfully,
> > > > +\field{command_specific_result} is in the format \field{struct
> > > > +virtio_admin_cmd_dev_ctx_rd_result}
> > > > +returned by the device containing the device context data and
> > > > +\field{command_specific_output} is in format of \field{struct
> > > > +virtio_admin_cmd_dev_ctx_rd_len} containing length of context
> > > > +data returned by the device in the command response. When the
> > > > +length returned is zero or when the returned context data is less
> > > > +the data requested by the driver, the device do not have any
> > > > +device context data left that the device can report, at this
> > > > +point the device context stream
> > > ends.
> > > > +
> > > > +The driver can read the whole device context data using one or
> > > > +multiple commands. When the device context does not fit in the
> > > > +\field{command_specific_result}, driver reads the subsequent
> > > > +remaining bytes using one or more subsequent commands.
> > >
> > > how?
> > For example, driver requested 100 bytes.
> > a. Device returned 40 bytes. So the whole context fit, nothing more to =
be
> done.
> > Or
> > b. Device returned 100 bytes, so driver does not know if there is more =
or not.
> > Hence, driver request again for additional 100 bytes in 2nd call.
> > If there is nothing, device returns success with zero bytes.
> > If the device has 30 bytes more it returns 30 bytes. The returned bytes=
 <
> requested bytes hence the read stream ends.
>=20
> do you then expect device to maintain all data in some internal buffer, t=
hen
> keep an offset internally and each following command returns a different
> chunk?  all this sounds rather fragile, not to mention wasteful wrt using
> memory for that internal buffer.

For small device in range of few hundred KB that changes the context often =
should be fine this way as this is only transient memory.
For device with large memory, an internal buffer may not work (depends on d=
evice implementation), it can fetch from the running hw context and return =
without another copy.

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

