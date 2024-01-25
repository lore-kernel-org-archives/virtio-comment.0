Return-Path: <virtio-comment-return-9016-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF2AC47258
	for <virtio-comment@archiver.kernel.org>; Thu, 25 Jan 2024 03:28:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CAC1D2AC5E
	for <virtio-comment@archiver.kernel.org>; Thu, 25 Jan 2024 03:28:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6FB959867E3
	for <virtio-comment@archiver.kernel.org>; Thu, 25 Jan 2024 03:28:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 34BCB986360; Thu, 25 Jan 2024 03:28:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1D6A19867E2
	for <virtio-comment@lists.oasis-open.org>; Thu, 25 Jan 2024 03:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/lhTpV+qU3P7J3B3DcFElIpspdkMvmbBG4eTPhGex5m0V+AZ74xmJVDBlpte+1NCKDBUNaXC/sKN0pX6c7GlF25s4UmuhXwY3vLZHmjBeDTuFsxTmQvzL/v6vzFyOZhj1wGwgys5ptHo/kSPQT2L586sVwlDWg/cWo/oyHgo9N6nnQee010kNdpz0jdfyw1tEGvaRA+uoGUrVmF4672SbBD9WKeAWCFeDZD+MnIsOoU5HF6lLZjpOwR0WPaw9Skfk4wKNGBjuTLdDSlUrygijA7+E3XdKbTkQ1dYWQXNAejXINoWxd4dRpCnclxPW3wiTg2Ymj3dDhGfuPKiRhMTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Wcz1cEOl4rXaylzl/tr8/xzmioVOghM+GtiNV/iTrE=;
 b=UhNk+MttXHE7ixphNDZL6ypWaXJQonZWKyVucu6M+lVmlfxMDk/7By2Q//b4k+LgIluVDIhH6ddZS6VaBxayZAXEHYiy+sSNDIOv0YzYyUfaWuLPUvJEk5+suSaqbvJcyWPh92ohyjCgdj/zz+72IeH2Pg8GZaiYpkyT4DHlZ61S4IpGg6GOYhGsBVz9/AI7LkHo+ijjkYdfQxhlEyhnvnb2rVTkYqQtR733cp4hRLHP1+fSwAj0ipn9fCT4JHXTAd6+Av6oTc7+AoidRzH9tCsbgtzLHb6kjjO/dGAXQYOMsGgvgB/FNimxAzqcoUR2kC9n8vG42lhkjPu5yWGUKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
From: Lege Wang <lege.wang@jaguarmicro.com>
To: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism
Thread-Index: AQHaTzZn/4IbS5Ps60eRQZJfNPdC27Dp3Ejg
Date: Thu, 25 Jan 2024 03:28:39 +0000
Message-ID:
 <SI2PR06MB5385039B8E9EBBE67A96FEAEFF7A2@SI2PR06MB5385.apcprd06.prod.outlook.com>
References: <20240125023001.1467-1-lege.wang@jaguarmicro.com>
In-Reply-To: <20240125023001.1467-1-lege.wang@jaguarmicro.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5385:EE_|JH0PR06MB6938:EE_
x-ms-office365-filtering-correlation-id: f09d37f8-aa87-4994-3217-08dc1d55b962
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 UqLwBA65YPH5PHHYtuRPqN2IdV/R1mqaoFpm/dz+23G8TFCgCPHq23mdK4BKxbSZiyVidbF1R6RohWtfTdOVmJHdMhdDH5a5AS+kOICVc3w5LOuMjKw7kV/gPRjBxao8BnPX1LA/iOE9TcYzUPJxTcLQblQcpCVDscEYnRkNo0thn8D346WvQj3bGc3VmX0WX7bd/2Eu24nGXDUoqZlhs4ORJeRF7O0EuHgCXB6Jv5oz1Xl7JmASgaXPLxYVU7cfjV2kEVliFVT6oAf6c2mWTNX8zIgnMynugwRzoaUVM2w6tK75o7TpMAV5aqelPz6QdezOQotoGs/Eyc9CCeFuVb2P8+u7VRfGaLj0FeZv4VgnApcLJ7tnfJrC/hvVHquN0rYFJ4NoYgOxD1zplxv6Ge9F+7qZjpwPrP/IPRaUhjNxPblhB0E7za/B/5WfR3OxONsU3kmD636qnhSJY74/bLVtMrVxVHeFEbC9J1qpTm8Ze4G2WEocJsW2h7HFRBp8G5M1oB77hYyi5j6VOm59H8veM7vk1CW3ZAaSZ7q4pAsN8QbEYPboY5c3+FSteJgxuFxQaJNqS55WLGhFZJpk8jpp20HPythJZRUJc1nZSg27DTWPxQPlL5efvTxzciGa
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5385.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(136003)(346002)(366004)(396003)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(55016003)(66899024)(83380400001)(86362001)(33656002)(38070700009)(38100700002)(122000001)(41300700001)(2906002)(52536014)(26005)(9686003)(66476007)(66446008)(76116006)(6506007)(66556008)(7696005)(53546011)(316002)(6916009)(64756008)(478600001)(30864003)(71200400001)(44832011)(15650500001)(66946007)(8676002)(5660300002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?5S3Q24TGvyBMPKrDTVT/yKpSMKGW8mn81WGSxWulLbn5XZhYR8D2JYbR?=
 =?Windows-1252?Q?v5ZoJ+5Bv9jl+wyF/qGU8CcwPXiPkoZMujvg9QSZMGTSfmiMDJXViim0?=
 =?Windows-1252?Q?3quuukwat71a2ZSvF0oVtT8lyEFJi25hCwTe7mT5Zd1hGnzX/AS0rSRE?=
 =?Windows-1252?Q?rYaDXm1kBzz4NQhA+U0bUtArMN/2h+FzUTv80PUcwKj/oy14DlpYoKMv?=
 =?Windows-1252?Q?uAqgO8w5d7d6DYQA38+VKCaBZ+0wTkl/fh8vxO7oywlJR/7MZBVvzD0m?=
 =?Windows-1252?Q?KgNtpD8Px0KhruzMuUrIoUmKrw4OU7D9quMKgiGbA9WyzvzJ/eDjuT/4?=
 =?Windows-1252?Q?2xf6lB/Vi4W0b1/KqrrP/rq9ORlRRGc0RVhtiqi/64lzi5lZVWSAnNF6?=
 =?Windows-1252?Q?kdO4kynC8+7pPLAPHEBReCuDK/nhnT4DsiikWeS6kbnyxpEw8F14SONS?=
 =?Windows-1252?Q?U4/s+iKgmZ9Yvf8AnqrWmnbLaGRRzfesjEZ8+3FHiwJ16VL+9za8FgTI?=
 =?Windows-1252?Q?jOSDgkyJyfzNJHYvJfbVj7UVs7vmVaEiu/Jv3jQ31rdiEJzHCHc+uDEI?=
 =?Windows-1252?Q?VhNR1hBjavUXUwfUeAfIrgxfFxF8qVFu4jHdyjbekTxbJu7DdtlkrrQa?=
 =?Windows-1252?Q?PjJNgX1/rI6oaZAkqAQFFGQUz+SwPdx1+nGTsD21MYa4l10QmndqNm0o?=
 =?Windows-1252?Q?FT03Xw+k43bZ0jECvtjfIPHwDdt13Cp1jC1W50bIu5zDg8j+0cPMLEBw?=
 =?Windows-1252?Q?3gwF17Kc2Yp5K8+ud184d/SH+Le87m5libTZ3pV9/mMEc1ulIWa0SpId?=
 =?Windows-1252?Q?7C7I4D6nrl2hABg+2Ajuj3mLsPX5FucyZ2r7/EXgo5DH52Z+2MKfz/aA?=
 =?Windows-1252?Q?20NvI8FBk1bffrMbIspqvxiaMx8pNd0RI81tGL/G0K1swd+iLsItkXNt?=
 =?Windows-1252?Q?y4mpxIAVoVf9Yw70iMRLxS8pRYpHe516D/ga7mputkGibOGi0oewLE2A?=
 =?Windows-1252?Q?lDRQnXnYUqO1JckJ+a8n1lpYiViS1jldQfaeRlb//rjZZhfIVSHTG0AU?=
 =?Windows-1252?Q?PdgyfvPb+ELym5Kunq0ylaAiomK9g4NwI3gc/UCCC+94VIugK5fBurGG?=
 =?Windows-1252?Q?EffG5UK994b/PBncJXZ+OcrUjVsyAGdiNrRhwsCEFG+uBYC1HPipfxjU?=
 =?Windows-1252?Q?IsFjpT0BdLFb+q6n7fSQssBFFb5+ko6MxDZKUTHmdKpBSX8SzG7Pga/N?=
 =?Windows-1252?Q?QzuYaRBaYgemMfxCHDS0+Z9ipksXXMyfASjE8xjLnRMlyROL2RWS3Syg?=
 =?Windows-1252?Q?bTytiQfR509iR0TKWYTcmzHHTT3nMAJuxHJN8Dsf3s/j5b1f3+Mi6JFw?=
 =?Windows-1252?Q?zBlml5JxB+x815dorKqGmbJBg2GW0SKJXWwXuWakTslbR4WCwQ8QmdqR?=
 =?Windows-1252?Q?o6hVwGmXMZvBvv+lsY8o9y5R3LBKyQwe/cLo/BzZ4zzxBSvxnwrNJQGn?=
 =?Windows-1252?Q?Ds8CduaKjspE+SmLLQuuj9X4Zo0oQs4YwMLWDgRxjz/pr2X+dniyitz8?=
 =?Windows-1252?Q?lxzColBzFqfQbzMuZ6hIENmjf4aP9A63pVZyq1jFIXXxzFQyObo6PRAg?=
 =?Windows-1252?Q?nusGz+gnIjVtItO1FJ0b0gMhnBQBOkK1ma+fdw9ac5tABjg8wDkNbBiN?=
 =?Windows-1252?Q?PrjdzpzbueTO0F56B9DLTLrzTpT1tDCF?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5385.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f09d37f8-aa87-4994-3217-08dc1d55b962
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 03:28:39.9264
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p1quMXqhgwcWxMyH+A6m6/PIgO+oIW1wMUCrBZeVcnQcKfLvNfUPkjBzUbmbjPIHjxdQUmAe2UAwzmyH/R15L4xvFmXSv/6GFw78CPp3UZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6938
Subject: RE: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism

hi

I must say that this RFC patch just shows the rough design, and explain why=
 we need
this feature. The patch itself is not mature enough, sorry, later after som=
e discussions,
I'll submit one better.

Regards,
lege.wang

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

