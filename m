Return-Path: <virtio-comment-return-9032-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6B1C47DA9
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 06:11:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9B1C060270
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 06:11:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 75951986883
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 06:11:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 58D6B983F76; Tue, 30 Jan 2024 06:11:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4778A986876
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 Jan 2024 06:11:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3arDA83t2r+pPkfPezk1IcJcxeXPEUHfoRx8zyvlutkrXtnPyWDUYCRDdCP8o8sPnLC5mSw+lQWoZAYojnp4bkelhf6N9RoUA/UyWDPcmpXZ4V79+DgpwmFoPl8PAkF0YEh6EUPaVRxew4jT4ZJ+vSKG4vzPJtJ9rKXgHOw/H5Nf0gU8VONmlsnt8VkXRWNEpz8togJWM/WDD2E8AgqnX1B85bZS122trGf9l1wgoyJoKB7p4mI6lOS7m5/n5TRV98H+ytlHs/X1GXR93FMpV4wJtEDahXyKzetK8RLoKPe5d3kZ/Awi3QXjbuYqbmaV9se4nKDXjzaCyF+l/+hgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysxVAWios8GlaGt3rY5kefmabOeapg4piky6otMcAOU=;
 b=mvIum/TZjFXUZqYXszYjVt3CscUzbFBgllD1h105vOdpJ/UKH3rbv5+R4fFLFXWPKIIB0i3XyvyoPZN0+m1Z1jbKROu3r4+P6kOrBWBzSUwYTmemPHfI7bQt+3Uf+y5Nb54OSnuqE25y9xRL8Fvgl8wlf7fqTfcBl1IezvHmHpYAK9J639YTKeIv4tRZ+jVAAogsGnMzLDt7PaZSkdKLDKhUBYaUfXVuiZ/xGFiP5gV7AcocAm49RNQryACJO9lEu8OSPqnfSoqn2ILeQ5LAJMFD961JGC8voWWW1PtMsuunYhPkUEph++Y0YXc6qt78UTcYgphz+oSV+rT+KFyO8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
From: Lege Wang <lege.wang@jaguarmicro.com>
To: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism
Thread-Index: AQHaTzZn/4IbS5Ps60eRQZJfNPdC27Dx5wgw
Date: Tue, 30 Jan 2024 06:11:46 +0000
Message-ID:
 <SI2PR06MB53854A7D9617A6B53EB4A52BFF7D2@SI2PR06MB5385.apcprd06.prod.outlook.com>
References: <20240125023001.1467-1-lege.wang@jaguarmicro.com>
In-Reply-To: <20240125023001.1467-1-lege.wang@jaguarmicro.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5385:EE_|JH0PR06MB6939:EE_
x-ms-office365-filtering-correlation-id: b8a1070d-b4e1-4b37-1215-08dc215a5684
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zGHPyVQMVM8vlWMkwL0fdepL43wQyMDcL5ja7cWdIWgxc/m6vGCTG+A0ga3eWMs071yhWkmoed9YXsMPbJJdITy39M0Mq1YTbVT2zoXm2pCfgYTXUsorwfjCtjBlf/FU2FDIo+10XzpibMyYh810xR1T5z4mlr1mwclJL5oZ2HsOF9MrybADJuxFc7IX+fedoDD8Z1z3zkN0ar/HGrL92jsvXSAYSWljfgvZo4o/jsHIDtQtYxQMu1eYD8ilHmbpm4AAQEvhXSwr+8/Qqd1fMcsU4TuvPMAeG+SozEK4wF6/wPm9nWwl1cf5gTmycj/He293zU/++DxchlvY55hkgy9qBsrAloXtfO2m9d0TEFyGbKcF1ay7M4rbKrFZiKYP6l/u+CnVkvmJ1N08Ki+Z2NJc2lyxCAASnbThZsIKJxvcmwTk8q7ohrKeukwNTiKaKKiYEEJl4vvwpo6QcdkvLQBGSl6ZQwIeN/cZIc8xMxjIzOc9cQHqnR1Lm4ayPPfJRw2lgf0Bf0+eU5J3vGiQlENq1jd3cPpiqGcMOY7vLw5XARVLXsTaCqHXtZIpAMBuOykbcR8hw8V94Aie11Q6qmp2ZeF7NXLILOkF9RI399JLlwwoPc4eryXRIwXiQuf0
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5385.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(396003)(366004)(39830400003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(26005)(41300700001)(55016003)(38070700009)(316002)(6916009)(478600001)(9686003)(7696005)(53546011)(6506007)(83380400001)(71200400001)(64756008)(38100700002)(122000001)(66446008)(66476007)(66899024)(5660300002)(2906002)(30864003)(15650500001)(86362001)(66946007)(66556008)(76116006)(33656002)(44832011)(8676002)(8936002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?NuvVpYzOPTCdoiBuLHcZ3nfebvwc0ggh1v21t2ROhV4fj8v+iwwuHxvI?=
 =?Windows-1252?Q?f5qIrkGxSqgchLrthM136DsCeH5P3bPGvMowwyOWzU77q+9j2zXo1ckM?=
 =?Windows-1252?Q?LnCc3ZmV55vqUu2uzPobpMEPTnI2ec3OHZ+ajqWKFKIZUgF3zCfKyvlJ?=
 =?Windows-1252?Q?Fk/oQi+iSWgKSfLlyWaVdCtQOXXUj3xMIaVL+et7xGcXxzWtobppJRYV?=
 =?Windows-1252?Q?r3o1J0XT9fqv12qJ/3hWXj0IWJP7U3qd5EYkQhSyk/Fqlikc2U2Sxkup?=
 =?Windows-1252?Q?sEmZXdj8MIm3UbUb1/WQe+vxuVdUas+cGkqwj4gJhWUV/f+1cY9di2Ss?=
 =?Windows-1252?Q?VuLi0qtPqzBcItauQtSiug8eXYFOWN5phzwGzR0W8zrv5GOoKEN2rYBP?=
 =?Windows-1252?Q?1DLcBgttqcR7m4YAV+zBeiMz9HWPCgVWyRtBNehCm9amgXxrz/JkqhyV?=
 =?Windows-1252?Q?9wqAkNggEtJhjW16MRSQFXOExCeQRIVfX3u1qFrEitSzytURNo1cTglk?=
 =?Windows-1252?Q?LaCJCezSgKskGskvkv19ufec/sdkdfY+f5YMZUPoOsR12ZvJ5vvciZAg?=
 =?Windows-1252?Q?Ua/LaxZ/MrDX8faHdETZ5i0vcQQge4WhVDCedXIX3MICwC3AWBxFh1ZM?=
 =?Windows-1252?Q?StRy0GUWGCuEx3OWAJInELbLrbtXdx7Sd0/tQ91REjtTXuNs9c1nLLAb?=
 =?Windows-1252?Q?E7O5tgLkBWjZAuptcblHRyqeD/ReOiv/tO21Dii6RjRTfJZz44ko79+9?=
 =?Windows-1252?Q?+SQY21n11J+sqm1W3P+PBMalABrfrs7f716aZC8PbtgW+cgTjJDhjEs+?=
 =?Windows-1252?Q?2Uun1OKaVODar9HL/oDdOx3hXILwjaWJEK6kk4LrsL5P254GouRRmUKL?=
 =?Windows-1252?Q?KqhW2rAH5QeePkMFZx88NerQLYglEtBirX8+bNT2hxGgooGvSLe3XtGL?=
 =?Windows-1252?Q?z60TZ+HAqh+mX1q+dJaTFrrWjAUrqukGdniOc9HvSQRQizfqIO6p4Une?=
 =?Windows-1252?Q?rhjAEthop3ynJOSgmw02D5O0UMBfqltiw6wIZDaw4BQKDnX94K2sN4f/?=
 =?Windows-1252?Q?2OUIrRwtgW9fPEHUmKHYBxX9m77sI0jzVCXC7Y+6Rah+EPRLSabddhVi?=
 =?Windows-1252?Q?KUReoDxDQEdKJhZRTH5JrpXbaAr7O0gfvyivukMqOo4Eva5BaF9dq4MG?=
 =?Windows-1252?Q?gUyW1sFHmn/8pOUrstax/xvN6wk2LysXUEwJ/oOC06mqKjSHQjIWf+c6?=
 =?Windows-1252?Q?fOs5zbpOTY8FWYp0HXtjPF1p2841XCyxDkbM9RrA5rAH3hUnz0BH7ua3?=
 =?Windows-1252?Q?3gch+NPFxF7Bn2B4tzL6B1UIeeDDcfVWqqiVYWy3lBq1n0wVfxf/JnBw?=
 =?Windows-1252?Q?aGU5oeUDflhFqOE5dtm5NnsnTlqaETymp6TwMmmtH2bHNp0ePK6Lk3Rx?=
 =?Windows-1252?Q?FIAulyDtNxhlTbWPUKiHaTdlJWQ5t12EJGG0TkSNahruy1ARt9+Fparw?=
 =?Windows-1252?Q?8NJ6InAVwmeO9w0RJXJPw5NWgmHi4xwBxdbpV0s/wNkYwpJdk4xZD5zd?=
 =?Windows-1252?Q?HmeyGJlYlaDvLKwmNJu+Qul2hc7lxzrHqhrMCyW9m6Ox5MolfiFghyKS?=
 =?Windows-1252?Q?VEKe30Q0AO7mpRrXlvhukSYbhk25UStomynlJcqZXq4+aYLS8p8e0yLt?=
 =?Windows-1252?Q?rYOMCimUxHXSxRB1pGJ/IdaB1m5Mrl5I?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5385.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a1070d-b4e1-4b37-1215-08dc215a5684
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 06:11:46.1651
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IAosfPQe+UdJuDQnhoUCXM/MvWj645jwOOs5Iw+GXuVdFYOiV8yhGdr2CgH2poa/qKJE+mErjFT3xqRGoPCvmijYLC8IZxFhaPKgaDIh3Ts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6939
Subject: RE: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism

hi

Gentle ping, thanks.

Lege.wang

> -----Original Message-----
> From: Lege Wang <lege.wang@jaguarmicro.com>
> Sent: Thursday, January 25, 2024 10:30 AM
> To: virtio-comment@lists.oasis-open.org
> Cc: Lege Wang <lege.wang@jaguarmicro.com>
> Subject: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
> add new used buffer notification suppression mechanism
>=20
> Currently for the PCI transport, used buffer notification suppression
> informations are located in guest memory, for example, pvirtq_event_suppr=
ess
> for packed ring and virtq_avail for split ring, then PCI devices simulate=
d
> by hypervisors, such as QEMU, can vist these suppression informations
> directly before issuing used event, the only overheads may be just proper
> memory barriers, but for some hardware PCI devices offered by
> DPU(Data Processing Unit), DPU would need to submit DMAs to copy guest
> suppression informations to DPU internal cache or memory, then check
> whether used event should be notified after examing this internal cache
> or memory, which is obvious expensive and time-consuming. Worsely, if
> device has written some used descriptors, and the above DMA operation has
> not been completed yet, device can not determine whether to issue used
> event, until it gets newest used buffer notification suppression informat=
ion.
>=20
> To help improve this sitiuations, add a new feature:
> VIRTIO_F_USED_EVENT_AUTO_DISABLE. When this feature bit is negotiated,
> devices will place new notification area for used buffer event enable
> notification in PCI bar specfied by virtio_pci_notify_cap, also for bette=
r
> used buffer notification coalescing, the device will disable later used
> buffer notifications automatically after sending one used buffer notifica=
tion
> to driver, and after the driver finishes handling current used buffer eve=
nt,
> it needs to notify the device to enable used buffer notification again by
> writing above new notification area in PCI bar. Device will receive
> this notification reliably, and device knows that it can issue used event
> now, but it may choose appropriate timing to send used events according t=
o
> its notification coalescing policy , now it also does not need to DMA gue=
st
> memory to obtain notification suppression.
>=20
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
> of a Virtio Device /
>  The driver is sometimes required to send an available buffer
>  notification to the device.
>=20
> +\subsection{Available Buffer Notifications} \label{sec:Basic Facilities =
of a
> Virtio Device / Driver notifications / Available Buffer Notifications}
>  When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
>  this notification contains either a virtqueue index if
>  VIRTIO_F_NOTIF_CONFIG_DATA is not negotiated or device supplied
> virtqueue
> @@ -488,6 +489,34 @@ \section{Driver Notifications} \label{sec:Basic
> Facilities of a Virtio Device /
>  has been negotiated, these notifications would then have
>  identical \field{next_off} and \field{next_wrap} values.
>=20
> +\subsection{Used Buffer Event Enable Notifications} \label{sec:Basic Fac=
ilities
> of a Virtio Device / Driver notifications / Used Buffer Event Enable
> Notifications}
> +This kind of notification is only necessary when
> VIRTIO_F_USED_EVENT_AUTO_DISABLE is negotiated.
> +When this feature bit is negotiated, the device will disable later used =
buffer
> notification
> +automatically after sending one used buffer notification to the driver, =
and
> after the driver
> +finishes handling current used buffer event, it needs to notify the devi=
ce to
> enable used
> +buffer notification again.
> +
> +The notification method and supplying any such virtqueue notification co=
nfig
> data
> +is transport specific, currently driver notifications to the device incl=
ude
> +the following information:
> +
> +\begin{description}
> +\item [vq_index or vq_notif_config_data] Either virtqueue index or devic=
e
> +      supplied queue notification config data corresponding to a virtque=
ue.
> +\item [next_off] Offset
> +      within the ring where the next used ring entry will be written.
> +      When VIRTIO_F_RING_PACKED has not been negotiated this refers to
> the
> +      15 least significant bits of the used index.
> +      When VIRTIO_F_RING_PACKED has been negotiated this refers to the
> offset
> +      (in units of descriptor entries)
> +      within the descriptor ring where the next used descriptor will be
> written.
> +\item [next_wrap] Wrap Counter.
> +      With VIRTIO_F_RING_PACKED this is the wrap counter
> +      referring to the next used descriptor.
> +      Without VIRTIO_F_RING_PACKED this is the most significant bit
> +      (bit 15) of the used index.
> +\end{description}
> +
>  \input{shared-mem.tex}
>=20
>  \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Devic=
e /
> Exporting Objects}
> @@ -872,6 +901,11 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
> Feature Bits}
>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits=
} for
>  	handling features reserved for future use.
>=20
> +  \item[VIRTIO_F_USED_EVENT_AUTO_DISABLE(42)] This feature indicates
> that the device
> +  will disable later used buffer notification automatically after sendin=
g one
> used buffer
> +  notification to the driver.
> +  See \ref{sec:Basic Facilities of a Virtio Device / Driver notification=
s / Used
> Buffer Event Enable Notifications}
> +
>  \end{description}
>=20
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> diff --git a/transport-pci.tex b/transport-pci.tex
> index a5c6719..21b80dc 100644
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
I
> Device Layout / Notification capability} below.
> +        \end{note}
> +
>  \end{description}
>=20
>  \devicenormative{\paragraph}{Common configuration structure layout}{Virt=
io
> Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common
> configuration structure layout}
> @@ -498,7 +508,7 @@ \subsubsection{Common configuration structure
> layout}\label{sec:Virtio Transport
>  \drivernormative{\paragraph}{Common configuration structure layout}{Virt=
io
> Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common
> configuration structure layout}
>=20
>  The driver MUST NOT write to \field{device_feature}, \field{num_queues},
> -\field{config_generation}, \field{queue_notify_off} or
> +\field{config_generation}, \field{queue_notify_off},
> \field{queue_intr_notify_off} or
>  \field{queue_notif_config_data}.
>=20
>  If VIRTIO_F_RING_PACKED has been negotiated,
> @@ -541,6 +551,7 @@ \subsubsection{Notification structure
> layout}\label{sec:Virtio Transport Options
>  struct virtio_pci_notify_cap {
>          struct virtio_pci_cap cap;
>          le32 notify_off_multiplier; /* Multiplier for queue_notify_off. =
*/
> +        le32 intr_notify_off_multiplier; /* Multiplier for
> queue_intr_notify_off. Only if VIRTIO_F_USED_EVENT_AUTO_DISABLE is
> negotiated. */
>  };
>  \end{lstlisting}
>=20
> @@ -560,10 +571,26 @@ \subsubsection{Notification structure
> layout}\label{sec:Virtio Transport Options
>  the same Queue Notify address for all queues.
>  \end{note}
>=20
> +\field{intr_notify_off_multiplier} is combined with the
> \field{queue_intr_notify_off} to
> +derive the Queue Used Buffer Event Enable Notify address within a BAR fo=
r a
> virtqueue:
> +
> +\begin{lstlisting}
> +        cap.offset + queue_intr_notify_off * intr_notify_off_multiplier
> +\end{lstlisting}
> +
> +The \field{cap.offset} and \field{intr_notify_off_multiplier} are taken =
from the
> +notification capability structure above, and the \field{queue_intr_notif=
y_off}
> is
> +taken from the common configuration structure.
> +
> +\begin{note}
> +For example, if \field{intr_notifier_off_multiplier} is 0, the device us=
es
> +the same Queue Used Buffer Event Enable Notify address for all queues.
> +\end{note}
> +
>  \devicenormative{\paragraph}{Notification capability}{Virtio Transport
> Options / Virtio Over PCI Bus / PCI Device Layout / Notification capabili=
ty}
>  The device MUST present at least one notification capability.
>=20
> -For devices not offering VIRTIO_F_NOTIFICATION_DATA:
> +For devices not offering VIRTIO_F_NOTIFICATION_DATA or
> VIRTIO_F_USED_EVENT_AUTO_DISABLE:
>=20
>  The \field{cap.offset} MUST be 2-byte aligned.
>=20
> @@ -596,6 +623,23 @@ \subsubsection{Notification structure
> layout}\label{sec:Virtio Transport Options
>  cap.length >=3D queue_notify_off * notify_off_multiplier + 4
>  \end{lstlisting}
>=20
> +For devices offering VIRTIO_F_USED_EVENT_AUTO_DISABLE::
> +
> +The device MUST either present \field{intr_notify_off_multiplier} as a
> +number that is a power of 2 that is also a multiple 4,
> +or present \field{intr_notify_off_multiplier} as 0.
> +
> +The \field{cap.offset} MUST be 4-byte aligned.
> +
> +The value \field{cap.length} presented by the device MUST be at least 8
> +and MUST be large enough to support queue notification offsets
> +for all supported queues in all possible configurations.
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

