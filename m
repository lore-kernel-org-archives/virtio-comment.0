Return-Path: <virtio-comment-return-7799-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41722CDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 08:25:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8C1932AD4E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 08:25:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6F76098689B
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 08:25:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5873A986892; Wed, 18 Oct 2023 08:25:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4818A986893
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 08:25:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/eHyZn4jGlJQg/qS0mBLpTkKFnxszwOSb5uBwZWzHfAuxd1muzEcvrvHAFmo4tw58n9FA7LMbw0/m/tWzwBVUYL0hrfuenFa1BWeEl1R6cXrUXLsjeuzbJherF3UlFuzFmwce6c944Cn+knauw7scJIWd0nMJqGo3/MLtWPSwjDDWwnDFnW97tBXj1QSVFtrhYJBMWhpLm6nZH6ZqID9Ke1TuSNtcvnIu1Lh4DE4aanGrS+S9l7z0Cu65iWHUdUQqnXnqNzTbBeW6hnnIYHzhHvuWbRHkx8RJL4lYAHPl7lFsEl/UuUEngHF5vqiGEA7+azC15Jd0XI4Vm6AEzd5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcHTqVl5+Ed/Dx9hf0AJDXa6FcB3Putjtpvm5bQ0kH0=;
 b=CkZ59K2osGmZktjs9/iD1maiBmgS3nNZa/GN8PMkPCaZ0K+SkmFJb+7i+rbPvLQ+/6juJpg+azUPKD0740oAGoPgl8NDA98JiC5bJt7w9PJW9pssoGX5TG4R9Go7gqTz48SJjejoWl9Lo6dWugitYH0+BzyhMvxLyRL6+cFCf24JKEKI49mO5URad3QQ6I/kYXUMuRcUCM1dy7fve92973Eb3PO6JN0dbDz2AJXmlUW1XIZCbo73J9O0tKEYzYHKoyegNoDFNHuF3XrPJcg06y44WFoAL4eZWzMQCNKFP+1KkBsyxi9QFC6J4Smke9xMGEh03HGD700q1Z/lY30mog==
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
Thread-Index: AQHZ+dpI2732gBmw4k+Ms+IYHvK027BPKhAAgAAY/MA=
Date: Wed, 18 Oct 2023 08:24:56 +0000
Message-ID:
 <PH0PR12MB548141412C409813A4203DCDDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-5-parav@nvidia.com>
 <20231018022502-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231018022502-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA1PR12MB7295:EE_
x-ms-office365-filtering-correlation-id: 32d9d5bc-c8a1-48a0-8f45-08dbcfb3b668
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5DmZao1RrEU/ysDh3+3fhxLVrajuuFK08II5gfVofN1ZIH1CPdkHvPRBM+L1zDFWVveIOcyjnMDpTafPiqPJ3RQAZ6cFZvP0DQgV6syDaav5vFqmJ58GuFnZdLsQVsamKeLDcB00GrKcfn5nYkgjgnr4GeA95Mxe2myZQHDa+lGnNpwK9g6nJc1oI+3eviWo+8XLtKjbUlE6HbZKQj092su/CkfPBLEcQI58oCepHeJJ6lC00HX6Vpc279YUY2iVXwC/so7JCXMBYFOX4MgS/qySXdLVZPkVepWRnjN47HRyfLskTnGbebzTDM70fnHWjdpcY6o+1+mb82ymkjSxGhGN8vYhX9ANmKHeZC6lFaJHQDAewAi+sI+MRAKf9AmM+cy9j0WjJiQDue8TMndz7l4i/9eaNNiBz5b44XuADfJdntBAmxpC8Zah83RFb6DudrxMT+8hO9qyBAxuTRIqGogzUzmdzThcsBnseMLxuNVpufkVoYOFVt5479b3SQk6fY82DO4jL/Ef5OM0S8uaG/JZJ2/TOmTTbUP5QbDVJuqYX9CPT/659SsN15N6mSW5rgS4Bgn/jo5UdFkkCeo/EKgF6CqarbTOjrOzEoaQc75lgpUWY53b1YreCwQjgj7I30Mg4MlINyvTvfz5Uy4GNvkCtP71PwlFKYoVeAV8qVfkvMmDCIU8mDV0wuV5tXXWsi+leM0FfmibPznbiaMPwA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(26005)(6506007)(55016003)(66946007)(66556008)(76116006)(966005)(66446008)(478600001)(64756008)(66476007)(71200400001)(6916009)(54906003)(86362001)(38100700002)(316002)(83380400001)(9686003)(33656002)(107886003)(7696005)(122000001)(5660300002)(4326008)(41300700001)(38070700005)(8936002)(2906002)(8676002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?lyODgItggxQZO2XRUo/uj1whMAF6brA719nUAJwtNgAjvLkyHoKCgzwU2yve?=
 =?us-ascii?Q?K01ZTQWN0P8TedgwvBrFLo5SgDwaJVRpjcwxhXecI6Ee3IqSkd2pB0yEScMl?=
 =?us-ascii?Q?bk5FSV5L6ez6byhIBuosSyJ91uvb1ASp/zB632tRswP6um1OSwmysF572UMQ?=
 =?us-ascii?Q?8AXvvFgq68DK16t3berf82pExpVFyg8tehzg69kWTqk+SeylA23SxYSozC0u?=
 =?us-ascii?Q?CrqsCf2x74KXCvHqdcpTcL68cax0ZzGphhLEFz6r0LEQYdi77kowp2EiXVmE?=
 =?us-ascii?Q?/x0/5V44MrkWwW3PWrddPuib2AsnXe+iOy4wkz74gA1GZOmoJLxxxUiJvKb5?=
 =?us-ascii?Q?XXnNiBswkjTR4qB2lLw9tH3V2r07aSJBI+iRhh4ItVSoJMUlbIa5OBtgJ4xz?=
 =?us-ascii?Q?QHxsoN6bMs++Dx9hgXYMn+nh675zb6aoq4sC3NSzZeu3OPLEr6xWNKokGoQJ?=
 =?us-ascii?Q?HhU6Aih0OK02Y2z2LG1ew0qnF4I3NuO57EVYptJkbDlHFnhJFHpoC+GRXAhO?=
 =?us-ascii?Q?+85VHuTaCsaeEbrklcISqugpxqPJOGtyVL1ZLk3lfAEdQuAzkK2RbC+9FDwH?=
 =?us-ascii?Q?y013Q1aZcTcJAXuR3wPs7As385MCSVmJWfpfRn+QHSU7gOGPqVfDsNo0n/vT?=
 =?us-ascii?Q?N1hCedWLdWQke+BOcz78f1dyZBw4X/JFC30VO9iy99QkCjO0CgKKILxwdsky?=
 =?us-ascii?Q?dO2aqDswsKMLfzVLuOXCKeRyEGvScB2HsBtKhjLvGMT6r5BCgZ6EvfC9Ophd?=
 =?us-ascii?Q?kJf1rjpZy5rT6lHVv4rW7aCQBKpmy4EDbLaxid+1/JOWVjHjLVGCcdcSueDZ?=
 =?us-ascii?Q?iCn0wLmeaGg2XoFp/dESJrKf/oe6VafU9xnPOn+p0rkfZ/LKUhQKgVNcwQuM?=
 =?us-ascii?Q?NgG84ZHMFqUqFQwxC/uC7E77ZQsNW4m5jpfus+Jkv7AG6OIn9Es5QxVc3oVA?=
 =?us-ascii?Q?xChkOX4SWgUZfgWLExGyusxURUP4ySaQnM+8zSqFAeJC3TZoqP+3retH6fMx?=
 =?us-ascii?Q?sKaNyx/VCSLjlM1z8FtqVfALHIkextTcXZhdpd0tyGppGsoHC1ENLs/9owYr?=
 =?us-ascii?Q?iTvbqEnKGfkrwhmY7rtiZQTOzeNv1Lyl6VQRbd10PYtUwumU8wfEOz7nsJHV?=
 =?us-ascii?Q?Wu2aVq8azmLDpZ11j4eZXDfOUYD6ESv1x8id8ZMjgn7zmRHe+3/FrvFkx4GT?=
 =?us-ascii?Q?1SLNWYFQ7RHXP2n5VCFT2hsYmf12VWftaIWQOW7EpAJU9lxTCjjxJQrowyVY?=
 =?us-ascii?Q?u03qjB0cVB/m3yt1QoY+CXessjyzQdXFMlULJ1u4gy0pfI1dnKfa8/JR81sp?=
 =?us-ascii?Q?0eOA+3c29YsikTEmJfhcSLBqHKStKun0EjW1GJPTB+cV/3bYkMG28z+S5MgO?=
 =?us-ascii?Q?B7woKBcqxsxETbkrSAVDIA28mMvzLTeKcFoiB3eR8eFqWuTa81EDF5G8EgBO?=
 =?us-ascii?Q?H7ZOY2HChIlwD7aPz5tdybgNw9nQjMyRfZCCH35O5ZgPF+X3jAad5rc8aivh?=
 =?us-ascii?Q?RzivV1TAsVG+Y0PmIinbNbKdAOgZDUUtuDS/eoEZAUmhUeOWnA62zszJG/A+?=
 =?us-ascii?Q?9wVOEILkUmxy1jBNuXk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d9d5bc-c8a1-48a0-8f45-08dbcfb3b668
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 08:24:56.9364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VFNOMojXQ4FG3oPwsLie/0Z60Zpm7LAwhcyVVxMy/YdrbqSWb9dsTs39zjQlfD1MdVH8hCDq2qhWyYLfDt1EXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7295
Subject: [virtio-comment] RE: [PATCH v1 4/8] admin: Add device migration admin commands


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, October 18, 2023 12:17 PM
>=20
> On Sun, Oct 08, 2023 at 02:25:51PM +0300, Parav Pandit wrote:
>=20
> ...
>=20
> > +\paragraph{Device Context Size Get Command} \label{par:Basic
> > +Facilities of a Virtio Device / Device groups / Group administration
> > +commands / Device Migration / Device Context Size Get Command}
> > +
> > +This command returns the remaining estimated device context size. The
> > +driver can query the remaining estimated device context size for the
> > +current mode or for the \field{Freeze} mode. While reading the device
> > +context using VIRTIO_ADMIN_CMD_DEV_CTX_READ command, the actual
> > +device context size may differ than what is being returned by this
> > +command. After reading the device context using command
> > +VIRTIO_ADMIN_CMD_DEV_CTX_READ, the remaining estimated context
> size
> > +usually reduces by amount of device context read by the driver using
> > +VIRTIO_ADMIN_CMD_DEV_CTX_READ command. If the device context is
> > +updated rapidly the remaining estimated context size may also
> > +increase even after reading the device context using
> VIRTIO_ADMIN_CMD_DEV_CTX_READ command.
> > +
> > +For the command VIRTIO_ADMIN_CMD_DEV_CTX_SIZE_GET, \field{opcode}
> is set to 0x9.
> > +The \field{group_member_id} refers to the member device to be accessed=
.
> > +
> > +\begin{lstlisting}
> > +struct virtio_admin_cmd_dev_ctx_size_get_data {
> > +        u8 freeze_mode;
> > +};
> > +\end{lstlisting}
> > +
> > +The \field{command_specific_data} is in the format \field{struct
> > +virtio_admin_cmd_dev_ctx_size_get_data}.
> > +When \field{freeze_mode} is set to 1, the device returns the
> > +estimated device context size when the device will be in \field{Freeze=
} mode.
> > +As the device context is read from the device, the remaining
> > +estimated context size may decrease. For example, member device mode
> > +is \field{Stop}, the device has estimated total device context size
> > +as 12KB; the device would return 12KB for the first
> > +VIRTIO_ADMIN_CMD_DEV_CTX_SIZE_GET command, once the driver has
> > +already read 8KB of device context data using
> > +VIRTIO_ADMIN_CMD_DEV_CTX_READ command, and the remaining data is
> 4KB,
> > +hence the device returns 4KB in the subsequent
> > +VIRTIO_ADMIN_CMD_DEV_CTX_SIZE_GET command.
> > +
> > +\begin{lstlisting}
> > +struct virtio_admin_cmd_dev_ctx_size_get_result {
> > +        le64 size;
> > +};
> > +\end{lstlisting}
>=20
> So we have a 64 bit size? How are we going to return so much?
>=20
I agree it is a lot.
But this is the case because one has defined struct virtio_pci_cap64.

>=20
> > +
> > +When the command completes successfully,
> > +\field{command_specific_result} is in the format \field{struct
> virtio_admin_cmd_dev_ctx_size_get_result}.
> > +
> > +Once the device context is fully read, this command returns zero for
> > +\field{size} until the new device context is generated.
> > +
> > +\paragraph{Device Context Read Command} \label{par:Basic Facilities
> > +of a Virtio Device / Device groups / Group administration commands /
> > +Device Migration / Device Context Read Command}
> > +
> > +This command reads the current device context.
> > +For the command VIRTIO_ADMIN_CMD_DEV_CTX_READ, \field{opcode} is
> set to 0xa.
> > +The \field{group_member_id} refers to the member device to be accessed=
.
> > +
> > +This command has no command specific data.
>=20
> So I am not sure this is wise. Multi-year experience with QEMU taught us =
that
> we are likely to make mistakes when defining migration format - forget so=
me
> fields, validate them incorrectly, and so on.
> Making a somewhat safe assumption that we'll make mistakes in the spec, t=
oo,
> I'd like to see some kind of idea of how we'll support compatibility and/=
or
> graceful failure if/when we do.
>=20
Very valid point. In v2 I added the compatibility command at [1] as "Device=
 Context Supported Fields Query Command"

[1] https://lists.oasis-open.org/archives/virtio-comment/202310/msg00195.ht=
ml
>=20
> > +\begin{lstlisting}
> > +struct virtio_admin_cmd_dev_ctx_rd_len {
> > +        le32 context_len;
> > +};
> > +
> > +struct virtio_admin_cmd_dev_ctx_rd_result {
> > +        u8 data[];
> > +};
> > +\end{lstlisting}
>=20
> so callers needs to pin whatever device tells it to?
>=20
How much memory to pin is driver choice, it can pin 4K and keep reading 1MB=
 memory by 1MB/4K size calls.
Or it can pin 1MB and read full.

> admin commands support truncation intentionally.
>=20
> it is not clear, to me, that it's ok to have device just save as much sta=
te as it
> wants to.
Why would device store some unreasonable amount of state?

>=20
> > +
> > +When the command completes successfully,
> > +\field{command_specific_result} is in the format \field{struct
> > +virtio_admin_cmd_dev_ctx_rd_result}
> > +returned by the device containing the device context data and
> > +\field{command_specific_output} is in format of \field{struct
> > +virtio_admin_cmd_dev_ctx_rd_len} containing length of context data
> > +returned by the device in the command response. When the length
> > +returned is zero or when the returned context data is less the data
> > +requested by the driver, the device do not have any device context
> > +data left that the device can report, at this point the device context=
 stream
> ends.
> > +
> > +The driver can read the whole device context data using one or
> > +multiple commands. When the device context does not fit in the
> > +\field{command_specific_result}, driver reads the subsequent
> > +remaining bytes using one or more subsequent commands.
>=20
> how?
For example, driver requested 100 bytes.
a. Device returned 40 bytes. So the whole context fit, nothing more to be d=
one.
Or
b. Device returned 100 bytes, so driver does not know if there is more or n=
ot.
Hence, driver request again for additional 100 bytes in 2nd call.
If there is nothing, device returns success with zero bytes.
If the device has 30 bytes more it returns 30 bytes. The returned bytes < r=
equested bytes hence the read stream ends.


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

