Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0296B15B119
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 12:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720699888; cv=none; b=V3Iz9MX1Y7s5iwM11SwkjOfkcWBmbfC+IlrNKKt3mD4F5MZMs3vd4Cz0r90S69yERGTMTbv9/gHU4Ar9YWuTPcJ5y5gufklcoeQsRmhVioMMtKKQVvZ0WsdVnInUMuxhZlYXAztCkRb46yYor9y70GE6tGzsuMbU4mmpZ029lao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720699888; c=relaxed/simple;
	bh=uNT47vTg84jvUmYRSm25qzZbTytyzrsSM6RsXI0RnRg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j7tsa4AyMfh+uK5ru7wRxBZuSEN0k11SxEGYfgKO4dD7Y//vP6pqKL6BYaBkxIcA/Omhm+qiPknmnQ7VjpwfqvOlZXWnh9476XfKnPPhuor751v9dhpvUQjNe/aZROq0roIE6k7PJie02yjKt0Zog4XJzsVTNYaEveE0UISojxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1sRsdt-000181-9B; Thu, 11 Jul 2024 14:11:21 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
  "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH RESEND 1/4] virtio-net: support transmit hash report
In-Reply-To: <PH0PR12MB54815E92763ECF9C4CEB21A8DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
	(Parav Pandit's message of "Tue, 25 Jun 2024 05:07:05 +0000")
References: <20240624-v1-4-topic-virtio-net-timestamping-v1-0-fa3c163e4aa9@pengutronix.de>
	<20240624-v1-4-topic-virtio-net-timestamping-v1-1-fa3c163e4aa9@pengutronix.de>
	<PH0PR12MB54815E92763ECF9C4CEB21A8DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
Date: Thu, 11 Jul 2024 14:11:07 +0200
Message-ID: <878qy8ruw4.fsf@pengutronix.de>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: virtio-comment@lists.linux.dev


Hi Parav,

On 2024-06-25 at 05:07 GMT, Parav Pandit <parav@nvidia.com> wrote:

> > From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > Sent: Monday, June 24, 2024 4:39 PM
> >=20
> > Virtio-net supports sharing the flow hash from device to driver on rx.
> > Do the same in the other direction for robust routing and telemetry.
> >=20
> > Experimental results mirror what the theory suggests: where IPv6 FlowLa=
bel
> > is included in path selection (e.g., LAG/ECMP), flowlabel rotation on T=
CP
> > timeout avoids the vast majority of TCP disconnects that would otherwise
> > have occurred during link failures in long-haul backbones, when an
> > alternative path is available.
> >
> Can you please explain how does this related to the virtio-net device on =
transmit path?
> The value proposed here is only between the driver and device. It wont be=
 part of the packet. Did I understand right?
> If so, which link do you refer to in above description? Virtio-net device=
 link?
>

As I didn't develop that patch myself and I'm a little slow on the virtio-l=
ingo I'm not sure
if *I* understand it right O:-)

So, in the kernel patch the TX hash report is set in the skb that is send w=
ith xmit_skb.
Does Qemu change that packet? Qemu is the "device", right?

>=20=20
> > Rotation can be applied to various bad connection signals, such as time=
outs
> > and spurious retransmissions. In aggregate, such flow level signals can=
 help
> > locate network issues.
> >
>=20=20
> > Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > ---
> >  device-types/net/description.tex | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >=20
> > diff --git a/device-types/net/description.tex b/device-
> > types/net/description.tex
> > index 61cce1f..eb2c08e 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device Types /
> > Network Device / Feature bits  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)]
> > Set MAC address through control
> >      channel.
> >=20
> > +\item[VIRTIO_NET_F_TX_HASH(49)] Driver sends hash report
> > +
> >  \item[VIRTIO_NET_F_DEVICE_STATS(50)] Device can provide device-level
> > statistics
> >      to the driver through the control virtqueue.
> >=20
> > @@ -641,6 +643,34 @@ \subsubsection{Packet
> > Transmission}\label{sec:Device Types / Network Device / De
> >=20
> >  If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT  rely
> > on the packet checksum being correct.
> > +
> > +\paragraph{Hash calculation for outgoing packets} \label{sec:Device
> > +Types / Network Device / Device Operation / Packet Transmission / Hash
> > +calculation for outgoing packets }
> > +
> > +If the VIRTIO_NET_F_TX_HASH was negotiated and the packet includes a
> > +hash, the driver uses the structure virtio_net_hdr_hash_ts instead of
> > virtio_net_hdr and increases the \field{hdr_len} accordingly.
> > +
> > +\begin{lstlisting}
> > +  struct virtio_net_hdr_hash_ts {
> > +    struct {
> > +      struct virtio_net_hdr hdr;
> > +      __le33 value;
> > +      __le16 report;
> > +      __le16 flow_state;
> > +    } hash;
> > +    __u32 reserved;
> > +  };
> > +\end{lstlisting}
> > +
> > +The driver fills \field{hash_value} with the value of the calculated h=
ash and
> > \field{hash_report} with the report type of the calculated hash.
> > +
> It would be better to write it as \field{hash.value} because there is no =
hash_value field.
>=20
> Instead of defining new structure, proposed feature bit can reuse the exi=
sting hash_value and hash_report fields.
> I guess that=E2=80=99s what you meant in above?
>

I mixed up the linux implementation with the spec.
Thanks, I updated the documentation completely according to your suggestion=
s as I now
understand what is actually happening.=20

>=20
> > +Possible values that the driver supports in \field{hash_report} are de=
fined
> > below.
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_NET_HASH_REPORT_L4             (1 << 10)
> > +#define VIRTIO_NET_HASH_REPORT_OTHER          (1 << 11)
> > +\end{lstlisting}
> > +
> Please described _OTHER type of hash.
>=20

Yes, will do.


Thanks,
Steffen

--=20
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |
