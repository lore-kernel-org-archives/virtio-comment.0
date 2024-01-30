Return-Path: <virtio-comment-return-9034-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C61C46CD2
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 06:53:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2F66A2AD4C
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 06:53:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 134C7986880
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 06:53:01 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F0500983F76; Tue, 30 Jan 2024 06:53:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DFE38986876
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 Jan 2024 06:53:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VoYQICrb1gKoIzjyxQZX7+NjDqb2x1000lm+CsNI8OaEgZd/Ee7fiy/LpUjyv2SABHQRLXMHdYONJe8MTvsUr8R/DOYsBOt7HdPsr3doA529+ffqnWZfGGzsSTSp9yphoK9XQ4/HTh+PWIXs8QXOyiFqsNwtXsjYjr8DXhm48fvN/Z7t9MP8VvIh5PEamIx08e9Z37LYjchMh6l3k3sOROifVZpjr6y0A/0+EPUcMmA/EuIrYNvbWnCNKYpmHBJPZKtx44FWj90/NHWMqVXEQZP+n0OpDN9DxDePOwGUYmFsIqhI4kHUQ2zkwk5K2Dh4riTYVvzS8R7+y3RIDdLoYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=997nRUPon60KQgFmG7miNDoFPJdHiPfb9W6R5gUz03I=;
 b=fV+h/79VcMKAKllfpouar6e3hIKqEVm1Q2GuWaKuImNW+fDTgI4KJgrWGQBO7L9X+CyMMMThn3b2Zz6k3MqMu2GLQSIOVbe3g4t6SCrtlI3Xn8ZC2eRTow+03DXBR7ApsoxMEV6iAWCmHINEzehkoHFIV0ol2SBrXrKEqS2B+lRJzA8SxY35HPTLbWONowUfsDgUEuQnw1fOWd4V+FpWmkMWu5fnUrrEAedzMVw3zdL8eCxiGjKcCUXoHx3tnp7AZTVc3kwP+Hs7tHcZ8sNxeONxc3SVsEyPDiRFeSCKQlfuSuQUP40VOB+pY5JVD6kA5LxEGcknOnkkhKZK9jbhKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Xiaoguang Wang <lege.wang@jaguarmicro.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism
Thread-Index: AQHaTzZzkxS4XClcDkWCFLA6ilSUorDx62oA
Date: Tue, 30 Jan 2024 06:52:54 +0000
Message-ID:
 <PH0PR12MB5481C4AE095D48C6241C6366DC7D2@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240125023001.1467-1-lege.wang@jaguarmicro.com>
In-Reply-To: <20240125023001.1467-1-lege.wang@jaguarmicro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB8495:EE_
x-ms-office365-filtering-correlation-id: 55af65d1-4f4e-4671-b735-08dc21601590
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 kOlZZbW7CDYe/iMyFBpHolQPoOl94zvdbV0zkZwi5sjUHdu7XETWbGyGVRDOqnXxiSSo8YkUQ6c6t/y/N8utEWGUsS47nQAmIBaTNMwpMfjMBSaAMGfhzHSgavd+O42fXLUi5Dl/eic/bgXKprpeHownhlU6ujBIIjBiH6j3WSto6w6yxstu2GUsyUCVdeaxE8cKByPnyxZzXaY0dreLtHclALmpRL0+OostXF5uFND12+rOtzZ68Xpey6yE9Wy6FEc25CwJoQCq2VBWVZe2BYOgRTVvQy497MVffXPwov87a0iN4e4y+rlQKBp4NW/davuqhKuEwGSqdGARTEkZGg1rd/iHKsWrbFdcyW3nPGXKfzYmL2nHJrUS80HvUmrb8YyH01+hDbPfvAunOCkA8ipE8TIGO/bJxyuGLMDlm8Mp/OzhFEz5MnB6jO/Fm/LGsoXfw3RDHm5KJTZROeqT+QAUMpYlRy5ACE3T6yNkjCyi9eOQbReZA72sUEbyjyutFFGFm1A70DZBmL1uQD28xW/vACpDioIJRz3D6PMH5mI+Zsqps3KcBSkVTN1HI43CvVMm7rWoPfwFcD1+NdoIakJUzihgkOeuKzPbKz9DjVgjfALmNY745rrASQPdhUn2E+84n1QacdfhHCqxV43sotoEmA3z7CZ0kTbQ9is6L0o=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(41300700001)(84970400001)(55016003)(66899024)(966005)(38070700009)(478600001)(71200400001)(6506007)(7696005)(9686003)(26005)(83380400001)(38100700002)(122000001)(15650500001)(86362001)(2906002)(30864003)(33656002)(5660300002)(316002)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(110136005)(8676002)(8936002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4A883RaEIpmuCQOoV4ez6FEdCPFKuJqatboNtlRkM/Cneps2IDsjvPCzVpFY?=
 =?us-ascii?Q?1B8gRaFCK06YrcbRtN4jpl4lSg9y9K+1YMzreiQmqueh1cdAZvH9QSoozsIg?=
 =?us-ascii?Q?WFGO9Q8SjRbYLULkScVHw6rWwH0U6fzP2RUDq55QCxS7ZJ/o0ML7R5xbB403?=
 =?us-ascii?Q?9JO45hgPEDn9a0sfrMnxdP6D+KRze8Axv7rdYvngl59zqiWAmkRKE0SrbUYf?=
 =?us-ascii?Q?3Y5MnwEvDm/QaY51LRU61mWBzBZtsNVdSkwXHNdj6uah3TgtsTyzsxcBG5bO?=
 =?us-ascii?Q?76w7Ei66qnpAfXxoqSHGJixNs4uKYQZx87s377LsjiSa98d2JY70A4n8ikJ1?=
 =?us-ascii?Q?/zUGz6Mhc8QtBBfH6DNqwxRJmF690ex4kolaOj8JaE3UQmYKV3y83dcTetra?=
 =?us-ascii?Q?mzrZtT+HRsjRKEuf3LB/kpuKUvEBBo2GOTvJsml93dq+27L134vGQdn1Zozi?=
 =?us-ascii?Q?9OHAwsxHk01MJb0Z7jpJnW5JopZnpPAJHYJO/w9Amd2ROpx03MZuMZr1Pi1+?=
 =?us-ascii?Q?+77NXzua2IQudG4CezLx6SAvVzfsH3PRhWKAOWrGF2+kHYp7tR1HVmbGuE5U?=
 =?us-ascii?Q?mLKF/tI/PXeZRRFwnlwjhnr/fIxqLI52NlHxUF5eI+ofMKtf+gkvLVkYKGbh?=
 =?us-ascii?Q?AmCaA98pRZQLf4g71d+wsHWRTdcBUiDiqqBGzjZsY/eP4xcEJqqYyxK6VrS9?=
 =?us-ascii?Q?wI/Ic7NeTa/PHgXCcohYVyRHG1pkyidy6bAjh8NNACUwWvCsX6WHpWIf+Vuc?=
 =?us-ascii?Q?uY7ZLzgMtZo2x22SSC6cnSOAUdK/1AmJhGj3dGg5sh1hFFKFe6BwUL/UIBz4?=
 =?us-ascii?Q?R4wr5vbgFEk+bnAhCX79ADYMuUWYsX9Ztk9szXA7Q3nEBzUKLH/vbdlmGzDJ?=
 =?us-ascii?Q?tHkV7/AWqIIChHtLpvMzeezMfJv+btef6GVZX2ZqvIRnBbemuNG6gnKjmmsC?=
 =?us-ascii?Q?gshON0Hcw2676A6RJYbdfuzbPxl/UVjIDkZEvDKrdYxXCK6pKaIkJICxzdDX?=
 =?us-ascii?Q?e49gCwhmeN9p+EDfaGzci7oKvHQD+fsFQJK7n+r94YKUi5pspbi+vyLW1TMH?=
 =?us-ascii?Q?Ww8iW+fraXXSMhsPdKZQq+6DYJ6fuezNhaV6zw+qWCoQqsxYEyqb3UXHxREY?=
 =?us-ascii?Q?rW5CF8oGwJCy36hszMXmZBrzxmdKG4f36huY9MIY1PoYR1inds3Rh4cuONDC?=
 =?us-ascii?Q?RZ+CiYSpF0G2lsjAftS9YYLW6vhLbuepGTC8Bhy+1MLv4BYJWV1Soj3YUkiP?=
 =?us-ascii?Q?UpTSvQWhJ43vHkpkKZkg2JwTrSxVgEAsDmJPojXCkfbW0AX21e1J7bxQaq1O?=
 =?us-ascii?Q?r211+EqOoYU3WZ+BCZK4TXME3tPZFD08XgDO7T4tLpwzKRGyQGGu2+vMVcd8?=
 =?us-ascii?Q?0G92+oQkVl3Rh/xCVz7XTwBj7CFxjwb+CSMHC4c4y03ylf4/1a8z1XynSJID?=
 =?us-ascii?Q?sPZtkjKJfczEslajvxW9txA1i5vzy3DAog+CafXagzAjCTyiTUnsZCSfkoJC?=
 =?us-ascii?Q?103+eUk7xXYabEV0//tIqXagMhSz/vDdZhMZ0TRn/dOicxlvBLJxX4b8SGKZ?=
 =?us-ascii?Q?oyaPNEZJuMvXQWgA7u4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55af65d1-4f4e-4671-b735-08dc21601590
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 06:52:54.1646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ygzlQ8zyVzqDyH5IY1MKPOfoO/JdTIdjU8xJFfTSTwi3PiGhmCWO0Ch/4EEUyP+GdmAzR2BBRKBAU6TFi5+GMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8495
Subject: RE: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism


> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> open.org> On Behalf Of Xiaoguang Wang
> Sent: Thursday, January 25, 2024 8:00 AM
>=20
> Currently for the PCI transport, used buffer notification suppression
> informations are located in guest memory, for example,
> pvirtq_event_suppress for packed ring and virtq_avail for split ring, the=
n PCI
> devices simulated by hypervisors, such as QEMU, can vist these suppressio=
n
> informations directly before issuing used event, the only overheads may b=
e
> just proper memory barriers, but for some hardware PCI devices offered by
> DPU(Data Processing Unit), DPU would need to submit DMAs to copy guest
> suppression informations to DPU internal cache or memory, then check
> whether used event should be notified after examing this internal cache o=
r
> memory, which is obvious expensive and time-consuming. Worsely, if device
> has written some used descriptors, and the above DMA operation has not
> been completed yet, device can not determine whether to issue used event,
> until it gets newest used buffer notification suppression information.
>=20
> To help improve this sitiuations, add a new feature:
> VIRTIO_F_USED_EVENT_AUTO_DISABLE. When this feature bit is negotiated,
> devices will place new notification area for used buffer event enable
> notification in PCI bar specfied by virtio_pci_notify_cap, also for bette=
r used
> buffer notification coalescing, the device will disable later used buffer
> notifications automatically after sending one used buffer notification to=
 driver,
> and after the driver finishes handling current used buffer event, it need=
s to
> notify the device to enable used buffer notification again by writing abo=
ve new
> notification area in PCI bar. Device will receive this notification relia=
bly, and
> device knows that it can issue used event now, but it may choose appropri=
ate
> timing to send used events according to its notification coalescing polic=
y , now
> it also does not need to DMA guest memory to obtain notification
> suppression.
>=20
Good description describing the problem and solution well.
Yes, we discussed this requirement already before at [1].

[1] https://lore.kernel.org/virtio-comment/1689820586.8879051-7-xuanzhuo@li=
nux.alibaba.com/T/#mce485d2c7187b800575c5a63d83b2e9e77f474cc

> Signed-off-by: Xiaoguang Wang <lege.wang@jaguarmicro.com>
> ---
>  content.tex       | 34 +++++++++++++++++++++++++++++++++
>  transport-pci.tex | 48
> +++++++++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 80 insertions(+), 2 deletions(-)
>=20
> diff --git a/content.tex b/content.tex
> index 0a62dce..5374510 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -448,6 +448,7 @@ \section{Driver Notifications} \label{sec:Basic Facil=
ities
> of a Virtio Device /  The driver is sometimes required to send an availab=
le
> buffer  notification to the device.
>=20
> +\subsection{Available Buffer Notifications} \label{sec:Basic Facilities
> +of a Virtio Device / Driver notifications / Available Buffer
> +Notifications}
>  When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,  this
> notification contains either a virtqueue index if
> VIRTIO_F_NOTIF_CONFIG_DATA is not negotiated or device supplied
> virtqueue @@ -488,6 +489,34 @@ \section{Driver Notifications}
> \label{sec:Basic Facilities of a Virtio Device /  has been negotiated, th=
ese
> notifications would then have  identical \field{next_off} and \field{next=
_wrap}
> values.
>=20
> +\subsection{Used Buffer Event Enable Notifications} \label{sec:Basic
> +Facilities of a Virtio Device / Driver notifications / Used Buffer Event=
 Enable
> Notifications} This kind of notification is only necessary when
> VIRTIO_F_USED_EVENT_AUTO_DISABLE is negotiated.
> +When this feature bit is negotiated, the device will disable later used
Remove the word "later".

> +buffer notification automatically after sending one used buffer
> +notification to the driver, and after the driver finishes handling
> +current used buffer event, it needs to notify the device to enable used =
buffer
> notification again.
> +

> +The notification method and supplying any such virtqueue notification
> +config data is transport specific, currently driver notifications to
> +the device include the following information:
> +
> +\begin{description}
> +\item [vq_index or vq_notif_config_data] Either virtqueue index or devic=
e
> +      supplied queue notification config data corresponding to a virtque=
ue.
> +\item [next_off] Offset
> +      within the ring where the next used ring entry will be written.
> +      When VIRTIO_F_RING_PACKED has not been negotiated this refers to t=
he
> +      15 least significant bits of the used index.
> +      When VIRTIO_F_RING_PACKED has been negotiated this refers to the
> offset
> +      (in units of descriptor entries)
> +      within the descriptor ring where the next used descriptor will be =
written.
> +\item [next_wrap] Wrap Counter.
> +      With VIRTIO_F_RING_PACKED this is the wrap counter
> +      referring to the next used descriptor.
> +      Without VIRTIO_F_RING_PACKED this is the most significant bit
> +      (bit 15) of the used index.
> +\end{description}
> +
This forces the driver to process _all_ used buffer notifications before en=
abling them again.
There is a race condition that used ring updates are occurring from the dev=
ice (without notification) and driver updates the value.
For example,=20
1. driver posted descriptors from index 0 to 9.
2. Used buffer notification arrived for 0 to 3.
3. Driver processes used buffer ring from 0 to 3 and enables used buffer no=
tification for index 4.
4. While #3 is happening, the device already updated the used buffer entrie=
s.
5. So device view of used ring entry is messed up as it already passed that=
 point.

Hence a better driver used buffer notification should be,

1. index upto which it has processed
2. explicit enable/disable bit to enable the notification

These two fields clearly communicate to the device, upto how much used buff=
er is consumed and understand the driver consumption rate.
This way, there is no ambiguity for device on where to write next used ring=
 entry.=20
(where to write next used entry is not driven by the notification enablemen=
t).

And the explicit enable bit indicates notifications are enabled back.

Technically, only enable bit is needed, but doing #1 is helpful for the dev=
ice to understand driver consumption pace.
And for that may be current notification can be made 64-bits or as suggeste=
d in your patch to have new location.

>  \input{shared-mem.tex}
>=20
>  \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Devic=
e /
> Exporting Objects} @@ -872,6 +901,11 @@ \chapter{Reserved Feature
> Bits}\label{sec:Reserved Feature Bits}
>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits=
}
> for
>  	handling features reserved for future use.
>=20
> +  \item[VIRTIO_F_USED_EVENT_AUTO_DISABLE(42)] This feature indicates
> + that the device  will disable later used buffer notification
> + automatically after sending one used buffer  notification to the driver=
.
> +  See \ref{sec:Basic Facilities of a Virtio Device / Driver
> + notifications / Used Buffer Event Enable Notifications}
The wording "disable later" is confusing, does not read proper.

May be to reword it as,

This feature indicates that the device will disable used buffer notificatio=
n automatically after sending one used buffer notification.

> +
>  \end{description}
>=20
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}=
 diff
> --git a/transport-pci.tex b/transport-pci.tex index a5c6719..21b80dc 1006=
44
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -325,6 +325,8 @@ \subsubsection{Common configuration structure
> layout}\label{sec:Virtio Transport
>          /* About the administration virtqueue. */
>          le16 admin_queue_index;         /* read-only for driver */
>          le16 admin_queue_num;         /* read-only for driver */
> +
> +        le16 queue_intr_notify_off;     /* read-only for driver */
>  };
I think it should be renamed to queue_used_buf_notify_off;=20
This is because notifications are slightly worded differently than interrup=
ts.

>  \end{lstlisting}
>=20
> @@ -428,6 +430,14 @@ \subsubsection{Common configuration structure
> layout}\label{sec:Virtio Transport
>  	The value 0 indicates no supported administration virtqueues.
>  	This field is valid only if VIRTIO_F_ADMIN_VQ has been
>  	negotiated.
> +
> +\item[\field{queue_intr_notify_off}]
> +        The driver reads this to calculate the offset from start of Used=
 Buffer
> Event Enable Notification structure at
> +        which this virtqueue is located.
> +        \begin{note} this is \em{not} an offset in bytes.
> +        See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PC=
I Device
> Layout / Notification capability} below.
> +        \end{note}
> +
This is strange. The notification is in the PCI BAR, right?
it can be done simple as just the BAR offset.

>  \end{description}
>=20
>  \devicenormative{\paragraph}{Common configuration structure
> layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layou=
t /
> Common configuration structure layout} @@ -498,7 +508,7 @@
> \subsubsection{Common configuration structure layout}\label{sec:Virtio
> Transport  \drivernormative{\paragraph}{Common configuration structure
> layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layou=
t /
> Common configuration structure layout}
>=20
>  The driver MUST NOT write to \field{device_feature}, \field{num_queues},=
 -
> \field{config_generation}, \field{queue_notify_off} or
> +\field{config_generation}, \field{queue_notify_off},
> +\field{queue_intr_notify_off} or
>  \field{queue_notif_config_data}.
>=20
>  If VIRTIO_F_RING_PACKED has been negotiated, @@ -541,6 +551,7 @@
> \subsubsection{Notification structure layout}\label{sec:Virtio Transport
> Options  struct virtio_pci_notify_cap {
>          struct virtio_pci_cap cap;
>          le32 notify_off_multiplier; /* Multiplier for queue_notify_off. =
*/
> +        le32 intr_notify_off_multiplier; /* Multiplier for
> + queue_intr_notify_off. Only if VIRTIO_F_USED_EVENT_AUTO_DISABLE is
> + negotiated. */
>  };
>  \end{lstlisting}
>=20
I would really like to avoid extending this structure which is not in the P=
CI extended capability.
And we are almost full with 256B limit.
It is the time to have the PCI extended cap defined and place this field th=
ere.
If this multiplier is not useful, maybe it should be added only if needed.=
=20
Did you add it because to match the current flexibility of the spec, or you=
r hw actually needs this multiplier?

> @@ -560,10 +571,26 @@ \subsubsection{Notification structure
> layout}\label{sec:Virtio Transport Options  the same Queue Notify address=
 for
> all queues.
>  \end{note}
>=20
> +\field{intr_notify_off_multiplier} is combined with the
> +\field{queue_intr_notify_off} to derive the Queue Used Buffer Event Enab=
le
> Notify address within a BAR for a virtqueue:
> +
> +\begin{lstlisting}
> +        cap.offset + queue_intr_notify_off * intr_notify_off_multiplier
> +\end{lstlisting}
> +
> +The \field{cap.offset} and \field{intr_notify_off_multiplier} are taken
> +from the notification capability structure above, and the
> +\field{queue_intr_notify_off} is taken from the common configuration
> structure.
> +
> +\begin{note}
> +For example, if \field{intr_notifier_off_multiplier} is 0, the device
> +uses the same Queue Used Buffer Event Enable Notify address for all queu=
es.
> +\end{note}
> +
>  \devicenormative{\paragraph}{Notification capability}{Virtio Transport
> Options / Virtio Over PCI Bus / PCI Device Layout / Notification capabili=
ty}  The
> device MUST present at least one notification capability.
>=20
> -For devices not offering VIRTIO_F_NOTIFICATION_DATA:
> +For devices not offering VIRTIO_F_NOTIFICATION_DATA or
> VIRTIO_F_USED_EVENT_AUTO_DISABLE:
>=20
>  The \field{cap.offset} MUST be 2-byte aligned.
>=20
> @@ -596,6 +623,23 @@ \subsubsection{Notification structure
> layout}\label{sec:Virtio Transport Options  cap.length >=3D queue_notify_=
off *
> notify_off_multiplier + 4  \end{lstlisting}
>=20
> +For devices offering VIRTIO_F_USED_EVENT_AUTO_DISABLE::
> +
> +The device MUST either present \field{intr_notify_off_multiplier} as a
> +number that is a power of 2 that is also a multiple 4, or present
> +\field{intr_notify_off_multiplier} as 0.
> +
> +The \field{cap.offset} MUST be 4-byte aligned.
> +
> +The value \field{cap.length} presented by the device MUST be at least 8
> +and MUST be large enough to support queue notification offsets for all
> +supported queues in all possible configurations.
> +
> +For all queues, the value \field{cap.length} presented by the device MUS=
T
> satisfy:
> +\begin{lstlisting}
> +cap.length >=3D queue_intr_notify_off * intr_notify_off_multiplier + 4
> +\end{lstlisting}
> +
>  \subsubsection{ISR status capability}\label{sec:Virtio Transport Options=
 /
> Virtio Over PCI Bus / PCI Device Layout / ISR status capability}
>=20
>  The VIRTIO_PCI_CAP_ISR_CFG capability
> --
> 2.43.0
>=20
>=20
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>=20
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>=20
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-
> open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/


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

